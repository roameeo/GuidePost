local GP = select(2, ...)

local function getCursorAngle()
    local cx, cy = Minimap:GetCenter()
    local mx, my = GetCursorPosition()
    -- GetCursorPosition returns raw screen coords; divide by UIParent scale
    local scale  = UIParent:GetEffectiveScale()
    mx, my = mx / scale, my / scale
    return math.deg(math.atan2(my - cy, mx - cx))
end

GuidePostMinimapButtonMixin = {}

function GuidePostMinimapButtonMixin:OnLoad()
    if GuidePostDB.minimapAngle then
        self:SetAngle(GuidePostDB.minimapAngle)
        self.angle = GuidePostDB.minimapAngle
    end

    Minimap:HookScript("OnSizeChanged", function()
        self:SetAngle(self.angle or 225)
    end)
end

function GuidePostMinimapButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("GuidePost"))
    GameTooltip:AddLine("Click to open/close", 1, 1, 1)
    GameTooltip:AddLine("Drag to reposition", 0.6, 0.6, 0.6)
    
    local tracked = GP.GetTrackedAchievementsList()
    if #tracked > 0 then
        -- GameTooltip:AddLine(" ")
        GameTooltip:AddLine(#tracked.." achievements tracked")
    end
    GameTooltip:Show()
end

function GuidePostMinimapButtonMixin:OnLeave()
    GameTooltip:Hide()
end

function GuidePostMinimapButtonMixin:OnClick(mouseButton)
    if mouseButton == "LeftButton" and not self.dragging then
        GuidePostFrame:Toggle()
    end
end

function GuidePostMinimapButtonMixin:OnDragStart()
    self.isDragging = true
    self:SetScript("OnUpdate", function(btn)
        local newAngle = getCursorAngle()
        btn:SetAngle(newAngle)
        self.angle = newAngle
    end)
end

function GuidePostMinimapButtonMixin:OnDragStop()
    self.isDragging = false
    self:SetScript("OnUpdate", nil)
    GuidePostDB.minimapAngle = self.angle
end

function GuidePostMinimapButtonMixin:SetAngle(degrees)
    local rad = math.rad(degrees)
    local radius = (Minimap:GetWidth() / 2) + 10
    self:ClearAllPoints()
    self:SetPoint("CENTER", Minimap, "CENTER", radius * math.cos(rad), radius * math.sin(rad))
end