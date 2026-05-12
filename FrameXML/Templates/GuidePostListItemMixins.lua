local GP = GuidePostNS

GuidePostListItemButtonMixin = {}

function GuidePostListItemButtonMixin:OnEnter()
    self:GetNormalTexture():SetVertexColor(0.25, 0.25, 0.45, 0.8)
end

function GuidePostListItemButtonMixin:OnLeave()
    if GuidePostFrame.SelectedID == self.achievementID then
        self:GetNormalTexture():SetVertexColor(0.2, 0.4, 0.6, 0.8)
    else
        self:GetNormalTexture():SetVertexColor(0.15, 0.15, 0.15, 0.6)
    end
end

function GuidePostListItemButtonMixin:OnClick()
    GuidePostFrame:SelectAchievement(self.achievementID)
    self:GetNormalTexture():SetVertexColor(0.2, 0.4, 0.6, 0.8)
    -- Clear the selected background color for other buttons
    for _, child in ipairs({ self:GetParent():GetChildren() }) do
        if child:GetScript("OnLeave") then child:OnLeave() end
    end
end

GuidePostListHeaderButtonMixin = {}

function GuidePostListHeaderButtonMixin:OnEnter()
    self:GetNormalTexture():SetVertexColor(0.15, 0.15, 0.25, 0.9)
end

function GuidePostListHeaderButtonMixin:OnLeave()
    self:GetNormalTexture():SetVertexColor(0.08, 0.08, 0.12, 0.9)
end

function GuidePostListHeaderButtonMixin:OnClick()
end