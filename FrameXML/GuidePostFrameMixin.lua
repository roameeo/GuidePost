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
    self.ResizeGrip:HookScript("OnMouseUp", function() self:StopMovingOrSizing() end)
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
