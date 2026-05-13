local GP = select(2, ...)

GuidePostListPanelMixin = {}

function GuidePostListPanelMixin:OnLoad()
    -- Listen for track/untrack events to refresh the achievements list
    EventRegistry:RegisterCallback("GuidePost.ToggleTracking", function() self:PopulateList() end)
    
    self.SearchBox:SetMaxLetters(50)
    self.SearchBox:SetFontObject("GameFontHighlightSmall")
    self.SearchBox.Instructions:SetText("Search by name")
    self.SearchBox:SetScript("OnEscapePressed", function(sb)
        sb:ClearFocus()
    end)
    self.SearchBox:SetScript("OnTextChanged", function(sb)
        if sb:GetText() == "" and not sb.Instructions:IsShown() then sb.Instructions:Show()
        elseif sb:GetText() ~= "" and sb.Instructions:IsShown() then sb.Instructions:Hide()
        end
        -- Filter achievements as user types
        self.searchFilter = sb:GetText():lower()
        self:PopulateList()
    end)

    self.CategoryDropdown.Middle:SetWidth(self.CategoryDropdown.Middle:GetWidth() + 10)
    self.StatusDropdown.Middle:SetWidth(self.StatusDropdown.Middle:GetWidth() + 10)
    self.ZoneDropdown.Middle:SetWidth(self.ZoneDropdown.Middle:GetWidth() + 10)
    self:InitializeCategoryDropdown()
    self:InitializeStatusDropdown()
    self:InitializeZoneDropdown()

    self.LhfCheckbox:SetChecked(GuidePostDB.filters.lowHangingFruit)
    self.LhfCheckbox:HookScript("OnClick", function(cb)
        GuidePostDB.filters.lowHangingFruit = cb:GetChecked()
        self:PopulateList()
    end)
    self.LhfCheckbox:HookScript("OnEnter", function(cb)
        GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
        GameTooltip:SetText("Show achievements closest to completion first", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    self.LhfCheckbox:SetScript("OnLeave", function() GameTooltip:Hide() end)
    self.LhfButton:HookScript("OnClick", function() self.LhfCheckbox:Click() end)

    self:PopulateList()
end

function GuidePostListPanelMixin:InitializeCategoryDropdown()
    UIDropDownMenu_Initialize(self.CategoryDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local categories = { "All" }
        local seen = {}
        for _, ach in pairs(GP.Data.Achievements) do
            if ach.category and not seen[ach.category] then
                seen[ach.category] = true
                table.insert(categories, ach.category)
            end
        end
        table.sort(categories, function(a, b)
            if a == "All" then return true end
            if b == "All" then return false end
            return a < b
        end)
        GuidePostDB.filters = GuidePostDB.filters or {}
        for _, cat in ipairs(categories) do
            info.text = cat
            info.value = cat
            info.checked = GuidePostDB.filters.category == cat
            info.func = function(btn)
                GuidePostDB.filters.category = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                self:PopulateList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.CategoryDropdown, GuidePostDB.filters.category)
end

function GuidePostListPanelMixin:InitializeStatusDropdown()
    UIDropDownMenu_Initialize(self.StatusDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local statuses = { "All", "In Progress", "Not Started", "Completed" }
        for _, status in ipairs(statuses) do
            info.text = status
            info.value = status
            info.checked = GuidePostDB.filters.status == status
            info.func = function(btn)
                GuidePostDB.filters.status = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                self:PopulateList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.StatusDropdown, GuidePostDB.filters.status)
end

function GuidePostListPanelMixin:InitializeZoneDropdown()
    UIDropDownMenu_Initialize(self.ZoneDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local zones = { "All", "Current Zone" }
        for _, zone in ipairs(zones) do
            info.text = zone
            info.value = zone
            info.checked = GuidePostDB.filters.zone == zone
            info.func = function(btn)
                GuidePostDB.filters.zone = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                self:PopulateList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.ZoneDropdown, GuidePostDB.filters.zone)
end

function GuidePostListPanelMixin:MatchesFilter(achievementID)
    local ach = GP.Data.Achievements[achievementID]
    if not ach then return false end

    -- Filter by search text
    if self.searchFilter and self.searchFilter ~= "" then
        local name = (ach.name or ""):lower()
        local category = (ach.category or ""):lower()
        local zone = (ach.zone or ""):lower()

        local searchMatch = name:find(self.searchFilter, 1, true)
            or category:find(self.searchFilter, 1, true)
            or zone:find(self.searchFilter, 1, true)
        if not searchMatch then return false end
    end

    local db = GuidePostDB
    local showAllCategories = db.filters.category == "All"
    local showAllStatuses = db.filters.status == "All"
    local showAllZones = db.filters.zone == "All"
    -- Filter by Category
    if not showAllCategories and ach.category ~= db.filters.category then
        return false
    end

    local isComplete = GP.IsAchievementCompleted(achievementID)
    local done, total = GP.GetAchievementCriteriaProgress(achievementID)
    local isTracked = GP.Progress.IsTracked(achievementID)
    local isInProgress = (done > 0 and done < total) or isTracked
    -- Filter by Status
    if not showAllStatuses then

        -- Keeping completion check separate to immediately stop checking other conditions when this is true
        if (db.filters.status ~= "Completed" and isComplete) then return false end

        if (db.filters.status == "Completed" and not isComplete)
        or (db.filters.status == "In Progress" and not isInProgress)
        or (db.filters.status == "Not Started" and (isInProgress or isComplete)) then
            return false
        end
    end

    -- Filter by Zone
    if db.filters.zone == "Current Zone" then
        if ach.zone ~= GetZoneText() then return false end
    end

    -- TODO: Scope is not saved to DB, so it's never persisted through sessions. Should this change?
    local scope = GuidePostDB.settings and GuidePostDB.settings.scope or "account"
    if scope == "character" then
        -- Show only achievements with in-progress criteria or actively tracked
        if not isComplete and not isTracked and done == 0 then
            return false
        end
    elseif scope == "guild" then
        -- Guild achievements are not yet in the database; hide everything until added
        return false
    end
    -- scope == "account": no additional filtering

    return true
end

local function sortListByCompletionDesc(list)
    if not GuidePostDB.filters.lowHangingFruit then return end

    table.sort(list, function(a, b)
        local doneA, totalA = GP.GetAchievementCriteriaProgress(a)
        local doneB, totalB = GP.GetAchievementCriteriaProgress(b)

        -- Calculate percentages (avoid division by zero)
        local pctA = (totalA > 0) and (doneA / totalA) or 0
        local pctB = (totalB > 0) and (doneB / totalB) or 0
        
        -- Sort by percentage descending (highest completion first)
        return pctA > pctB
    end)
end

local CATEGORY_GAP = 15
function GuidePostListPanelMixin:BuildListCategory(listContentFrame, itemList, headerData, lastFrame)
    if #itemList == 0 then return lastFrame end
    
    local isCollapsed = (GuidePostDB.collapsedZones or {})[headerData.name] or false
    local header
    if headerData.isZoneHeader then

        header = CreateFrame("Button", nil, listContentFrame, "GuidePostListHeaderButtonTemplate")
        header:HookScript("OnClick", function()
            GuidePostDB.collapsedZones = GuidePostDB.collapsedZones or {}
            GuidePostDB.collapsedZones[headerData.name] = not GuidePostDB.collapsedZones[headerData.name]
            self:PopulateList()
        end)
        local collapseInd = GP.GetAtlasString("friendslist-categorybutton-arrow-"..(isCollapsed and "right" or "down"))
        header.ZoneName:SetText(headerData.color:WrapTextInColorCode(collapseInd.." "..headerData.name))
    else
        header = listContentFrame:CreateFontString(nil, "OVERLAY", "GuidePostListHeaderTemplate")
        header:SetText(headerData.color:WrapTextInColorCode(headerData.name))
    end

    if lastFrame then
        header:SetPoint("TOP", lastFrame, "BOTTOM", 0, -1 * CATEGORY_GAP)
    else
        header:SetPoint("TOP")
    end

    if isCollapsed then return header end
    
    local lastItem
    for idx, achievementID in ipairs(itemList) do
        local ach = GP.Data.Achievements[achievementID]
        local isComplete = GP.IsAchievementCompleted(achievementID)
        local done, total = GP.GetAchievementCriteriaProgress(achievementID)
        local item = CreateFrame("Button", nil, listContentFrame, "GuidePostListItemButtonTemplate")
        item.achievementID = achievementID
        local yOffset = 0
        if headerData.isZoneHeader and idx <= 1 then yOffset = -5
        elseif headerData.isZoneHeader then yOffset = (idx - 1) * -45
        elseif idx > 1 then yOffset = (idx - 1) * -40
        end
        item:SetPoint("TOP", header, "BOTTOM", 0, yOffset)
        if ach and ach.autoFound then
            item.Name:SetText(ach.name.." "..LIGHTYELLOW_FONT_COLOR:WrapTextInColorCode("[?]"))
        else
            item.Name:SetText(ach and ach.name or "Unknown: "..achievementID)
        end

        if total > 0 and isComplete then
            item.Progress:SetText(GP.GetAtlasString("VAS-icon-checkmark", nil, nil, -10))
        elseif total > 0 then
            item.Progress:SetText(string.format("%d/%d", done, total))
        end

        lastItem = item
    end

    return lastItem
end

function GuidePostListPanelMixin:ClearCurrentList()
    -- Clear existing content
    -- TODO: Explore using a scrollable list template instead to utilize DataProvider's frame recycling capabilities
    for _, child in ipairs({ self.ScrollFrame.ListContent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, region in ipairs({ self.ScrollFrame.ListContent:GetRegions() }) do
        region:Hide()
        region:SetParent(nil)
    end
end

function GuidePostListPanelMixin:PopulateList()
    self:ClearCurrentList()
    local listContent = self.ScrollFrame.ListContent
    local lastListFrame
    
    -- Tracked Section
    local tracked = GuidePostCharDB.tracked
    local filteredTracked = {}
    for achievementID, _ in pairs(tracked) do
        if self:MatchesFilter(achievementID) then
            tinsert(filteredTracked, achievementID)
        end
    end

    sortListByCompletionDesc(filteredTracked)
    lastListFrame = self:BuildListCategory(listContent, filteredTracked, { color = GREEN_FONT_COLOR, name = "Tracked" }, lastListFrame)

    -- In This Zone section
    local suggestions = GP.AchievementData.CurrentZoneSuggestions
    local filteredSuggestions = {}
    for _, achievementID in ipairs(suggestions) do
        -- Making a small change to not show achievements in other sections if they are being tracked
        if self:MatchesFilter(achievementID) and not tContains(filteredTracked, achievementID) then
            tinsert(filteredSuggestions, achievementID)
        end
    end

    sortListByCompletionDesc(filteredSuggestions)
    lastListFrame = self:BuildListCategory(listContent, filteredSuggestions, { color = HEIRLOOM_BLUE_COLOR, name = "In This Zone" }, lastListFrame)

    -- All achievements grouped by zone
    local zoneAchievementMap = {}
    local zoneNames = {}
    for _, achievementID in ipairs(GP.AchievementData.GetAll()) do
        if self:MatchesFilter(achievementID) then
            local ach = GP.Data.Achievements[achievementID]
            local zone = (ach and ach.zone) or "Unknown"
            if not zoneAchievementMap[zone] then
                zoneAchievementMap[zone] = {}
                tinsert(zoneNames, zone)
            end
            tinsert(zoneAchievementMap[zone], achievementID)
        end
    end
    table.sort(zoneNames)

    for _, zone in ipairs(zoneNames) do
        local zoneAchievementIDs = zoneAchievementMap[zone]
        sortListByCompletionDesc(zoneAchievementIDs)
        lastListFrame = self:BuildListCategory(listContent, zoneAchievementIDs, { color = DARKYELLOW_FONT_COLOR, name = zone, isZoneHeader = true }, lastListFrame)
    end
end