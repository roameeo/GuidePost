local GP = GuidePostNS or {}
GuidePostDB = GuidePostDB or {}
GuidePostCharDB = GuidePostCharDB or {}

GuidePostListPanelMixin = {}

function GuidePostListPanelMixin:OnLoad()
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
        self:GetParent().SearchFilter = sb:GetText():lower()
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

local function sortTrackedByCompletion(list)
    if not GuidePostDB.filters.lowHangingFruit then return end

    table.sort(list, function(a, b)
        local doneA, totalA = GP.AchievementData.GetCriteriaProgress(a)
        local doneB, totalB = GP.AchievementData.GetCriteriaProgress(b)

        -- Calculate percentages (avoid division by zero)
        local pctA = (totalA > 0) and (doneA / totalA) or 0
        local pctB = (totalB > 0) and (doneB / totalB) or 0
        
        -- Sort by percentage descending (highest completion first)
        return pctA > pctB
    end)
end

function GuidePostListPanelMixin:PopulateList()
    local listContent = self.ScrollFrame.ListContent
    -- Clear existing content
    for _, child in ipairs({ listContent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    -- Tracked Section
    local tracked = GuidePostCharDB.tracked
    local filteredTracked = {}
    for achievementID, _ in pairs(tracked) do
        if GuidePostFrame:MatchesFilter(achievementID) then
            tinsert(filteredTracked, achievementID)
        end
    end
    sortTrackedByCompletion(filteredTracked)

    if #filteredTracked > 0 then
        local header = listContent:CreateFontString(nil, "OVERLAY", "GuidePostListHeaderTemplate")
        header:SetPoint("TOP")
        header:SetText(GREEN_FONT_COLOR:WrapTextInColorCode("Tracked"))

        for idx, achievementID in ipairs(filteredTracked) do
            local ach = GP.Data.Achievements[achievementID]
            local isComplete = GP.AchievementData.IsCompleted(achievementID)
            local done, total = GP.AchievementData.GetCriteriaProgress(achievementID)
            local item = CreateFrame("Button", nil, listContent, "GuidePostListItemButtonTemplate")
            item.achievementID = achievementID
            item:SetPoint("TOP", header, "BOTTOM", 0, idx <= 1 and 0 or ((idx - 1) * -40))
            if ach and ach.autoFound then
                item.Name:SetText(ach.name.." "..LIGHTYELLOW_FONT_COLOR:WrapTextInColorCode("[?]"))
            else
                item.Name:SetText(ach and ach.name or "Unknown: "..achievementID)
            end

            if total > 0 and isComplete then
                item.Progress:SetText(GP.GetAtlasString("VAS-icon-checkmark"))
            elseif total > 0 then
                item.Progress:SetText(string.format("%d/%d", done, total))
            end
        end
    end
end