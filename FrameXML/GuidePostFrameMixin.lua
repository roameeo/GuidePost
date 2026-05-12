-- local GP = select(2, ...) -- TODO: Use provided addon namespace across the board instead of defining a new global?
local GP = GuidePostNS or {}

GuidePostFrameMixin = {}

function GuidePostFrameMixin:OnLoad()
    -- Making sure necessary DBs exist
    GP.UI.Settings.GetSettings()
    GP.Progress.Initialize()
    self.TitleText:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("GuidePost"))
    self.MinimizeButton:HookScript("OnEnter", function(btn)
        GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
        if self.isMinimized then
            GameTooltip:SetText("Maximize", 1, 1, 1, 1)
        else
            GameTooltip:SetText("Minimize to title bar", 1, 1, 1, 1)
        end
        GameTooltip:Show()
    end)
    self.MinimizeButton:HookScript("OnLeave", function() GameTooltip:Hide() end)
    self.SettingsButton:SetScript("OnEnter", function(btn)
        GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
        GameTooltip:SetText("Settings", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    self.SettingsButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
    self.ResizeGrip:HookScript("OnMouseDown", function() self:StartSizing("BOTTOMRIGHT") end)
    self.ResizeGrip:HookScript("OnMouseUp",   function()
        self:StopMovingOrSizing()
        -- LayoutPanels(self)
        -- Refresh step detail widths if an achievement is selected
        if self.SelectedID then self.SelectAchievement(self.SelectedID) end
    end)
    self.CloseButton:HookScript("OnClick", function()
        if GuidePostDB then
            GuidePostDB.windowX = self:GetLeft()
            GuidePostDB.windowY = self:GetTop()
            GuidePostDB.windowW = self:GetWidth()
            GuidePostDB.windowH = self:GetHeight()
        end
        self:Hide()
    end)
    self.MinimizeButton:HookScript("OnClick", function() self.ToggleMinimize() end)
    self.SettingsButton:SetScript("OnClick", function()
        if GP.UI.Settings then GP.UI.Settings.Toggle() end
    end)
end

function GuidePostFrameMixin:OnDragStart() self:StartMoving() end

function GuidePostFrameMixin:OnDragStop()
    -- Snap position into screen bounds so it can't be dragged off-screen
    local x, y = self:GetLeft(), self:GetTop()
    local sw, sh = GetScreenWidth(), GetScreenHeight()
    x = math.max(0, math.min(x, sw - self:GetWidth()))
    y = math.min(sh, math.max(y, self:GetHeight()))
    self:ClearAllPoints()
    self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
    -- Persist position so it survives /reload and relog
    if GuidePostDB then
        GuidePostDB.windowX = x
        GuidePostDB.windowY = y
    end
    self:StopMovingOrSizing()
end

function GuidePostFrameMixin:Toggle()
    if self:IsShown() then self:Hide() else self:Show() end
end

function GuidePostFrameMixin.ToggleMinimize()
end

function GuidePostFrameMixin:SelectAchievement(achievementID)
    self.SelectedID = achievementID
end

function GuidePostFrameMixin:MatchesFilter(achievementID)
    local ach = GP.Data.Achievements[achievementID]
    if not ach then return false end

    -- Filter by search text
    if self.SearchFilter and self.SearchFilter ~= "" then
        local name = (ach.name or ""):lower()
        local category = (ach.category or ""):lower()
        local zone = (ach.zone or ""):lower()

        local searchMatch = name:find(self.SearchFilter, 1, true)
            or category:find(self.SearchFilter, 1, true)
            or zone:find(self.SearchFilter, 1, true)
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

    local isComplete = GP.AchievementData.IsCompleted(achievementID)
    local done, total = GP.AchievementData.GetCriteriaProgress(achievementID)
    local isTracked = GP.Progress.IsTracked(achievementID)
    local isInProgress = (done > 0 and done < total) or isTracked
    -- Filter by Status
    if not showAllStatuses then

        if db.filters.status == "Completed" and not isComplete
        or db.filters.status == "In Progress" and not isInProgress
        or db.filters.status == "Not Started" and (isInProgress or isComplete) then
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