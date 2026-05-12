local GP = GuidePostNS or {}

GuidePostScrollFrameMixin = {}

function GuidePostScrollFrameMixin:OnLoad()
    self.ListContent:SetWidth(self:GetWidth() - 5)
    self:SetScrollChild(self.ListContent)
end