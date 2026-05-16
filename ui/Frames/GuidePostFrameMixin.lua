local GP = select(2, ...)

GuidePostFrameMixin = {}

function GuidePostFrameMixin:OnLoad()
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self:GetName())
    self.TitleText:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("GuidePost"))
    self:SetSize(GuidePostDB.windowW, GuidePostDB.windowH)

    EventRegistry:RegisterCallback("GuidePost.RefreshZoneSuggestions", function()
        local suggestionCount = #GP.AchievementData.CurrentZoneSuggestions
        self.ZoneSuggestions:SetText(suggestionCount > 0 and (suggestionCount.." suggestion(s) in "..GetZoneText()) or "")
    end)
    self:SetMinimizeButtonTextures()
    self.MinimizeButton:HookScript("OnEnter", function(btn)
        GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
        if GuidePostDB.isMinimized then
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
    self.ResizeGrip:HookScript("OnMouseDown", function()
        if GuidePostDB.isMinimized then
            -- Maximize window before resizing
            self:ToggleMinimize()
        end
        self:StartSizing("BOTTOMRIGHT")
    end)
    self.ResizeGrip:HookScript("OnMouseUp", function()
        self:StopMovingOrSizing()
        self:SaveWindowPositionToDB()
    end)
    self.CloseButton:HookScript("OnClick", function()
        -- We only want to store x-y position and window width when closed, not update all window positioning values (specifically window Height)
        -- Causes display issues when re-opened and attempting to maximize
        GuidePostDB.windowX = self:GetLeft()
        GuidePostDB.windowY = self:GetTop()
        GuidePostDB.windowW = self:GetWidth()
        self:Hide()
    end)
    self.MinimizeButton:HookScript("OnClick", function() self:ToggleMinimize() end)
    self.SettingsButton:SetScript("OnClick", function()
        GuidePostSettingsPanel:Toggle()
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
    GuidePostDB.windowX = x
    GuidePostDB.windowY = y
    self:StopMovingOrSizing()
end

function GuidePostFrameMixin:OnShow()
    GP.AchievementData.RefreshZoneSuggestions()
    self:HandleMinimizeSizing()
end

function GuidePostFrameMixin:SetMinimizeButtonTextures()
    local textureBasename = "128-RedButton-"..(GuidePostDB.isMinimized and "Plus" or "Minus")
    self.MinimizeButton:SetNormalAtlas(textureBasename)
    self.MinimizeButton:SetHighlightAtlas(textureBasename)
    self.MinimizeButton:SetPushedAtlas(textureBasename.."-Pressed")
end

function GuidePostFrameMixin:Toggle()
    if self:IsShown() then self:Hide() else self:Show() end
end

function GuidePostFrameMixin:SaveWindowPositionToDB()
    GuidePostDB.windowX = self:GetLeft()
    GuidePostDB.windowY = self:GetTop()
    GuidePostDB.windowW = self:GetWidth()
    GuidePostDB.windowH = self:GetHeight()
end

function GuidePostFrameMixin:HandleMinimizeSizing()
    local show = not GuidePostDB.isMinimized
    self.InsetBg:SetShown(show)
    self.ListPanel:SetShown(show)
    self.DetailPanel:SetShown(show)
    self:SetHeight(show and GuidePostDB.windowH or 50)
end

function GuidePostFrameMixin:ToggleMinimize()
    GuidePostDB.isMinimized = not GuidePostDB.isMinimized
    if GuidePostDB.isMinimized then self:SaveWindowPositionToDB() end
    self:SetMinimizeButtonTextures()
    self:HandleMinimizeSizing()
end
