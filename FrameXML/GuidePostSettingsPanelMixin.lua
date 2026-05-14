local GP = select(2, ...)

GuidePostSettingsPanelMixin = {}

function GuidePostSettingsPanelMixin:OnLoad()
    tinsert(UISpecialFrames, self:GetName())
    self.TitleText:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("GuidePost").." • Settings")
    self.CloseButton:HookScript("OnClick", function() self:Hide() end)
end

function GuidePostSettingsPanelMixin:OnDragStart() self:StartMoving() end

function GuidePostSettingsPanelMixin:OnDragStop() self:StopMovingOrSizing() end

function GuidePostSettingsPanelMixin:Toggle()
    if self:IsShown() then self:Hide() else self:Show() end
end