local GP = select(2, ...)

GuidePostScrollFrameMixin = {}

function GuidePostScrollFrameMixin:OnLoad()
    self.ListContent:SetWidth(self:GetWidth() - 5)
    self:SetScrollChild(self.ListContent)
end