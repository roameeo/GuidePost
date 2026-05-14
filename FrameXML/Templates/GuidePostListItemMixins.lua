local GP = select(2, ...)

GuidePostListItemButtonMixin = {}

function GuidePostListItemButtonMixin:OnLoad()
    EventRegistry:RegisterCallback("GuidePost.AchievementSelected", function(_, achievementID)
        if self.achievementID ~= achievementID then self.isSelected = false end
        self:OnLeave()
    end)
end

function GuidePostListItemButtonMixin:OnEnter()
    self:GetNormalTexture():SetVertexColor(0.25, 0.25, 0.45, 0.8)
end

function GuidePostListItemButtonMixin:OnLeave()
    if self.isSelected then
        self:GetNormalTexture():SetVertexColor(0.2, 0.4, 0.6, 0.8)
    else
        self:GetNormalTexture():SetVertexColor(0.15, 0.15, 0.15, 0.6)
    end
end

function GuidePostListItemButtonMixin:OnClick()
    self:GetNormalTexture():SetVertexColor(0.2, 0.4, 0.6, 0.8)
    self.isSelected = true
    EventRegistry:TriggerEvent("GuidePost.AchievementSelected", self.achievementID)
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

GuidePostDetailsStepMixin = {}

function GuidePostDetailsStepMixin:OnLoad()
    self.WaypointBtn:HookScript("OnEnter", function(btn)
        GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
        GameTooltip:SetText("Set TomTom waypoint", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    self.WaypointBtn:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    self.WaypointBtn:HookScript("OnClick", function()
        local achievementID = GuidePostDetailPanel.selectedAchievementID
        if not achievementID then
            -- print some kind of error message to the chat window
            return
        end

        -- Handles clearing existing waypoint as well
        GP.TomTom.SetWaypoint(achievementID, self.criteriaIndex)
    end)
end

function GuidePostDetailsStepMixin:OnEnter()
end

function GuidePostDetailsStepMixin:OnLeave()
end