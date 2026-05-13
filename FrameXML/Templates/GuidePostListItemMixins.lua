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
        -- TomTom will always be required for this AddOn to load since it's a defined dependency in the TOC file
        -- Remove any existing waypoint first
        if GP.TomTom.CurrentWaypoint then
            TomTom:RemoveWaypoint(GP.TomTom.CurrentWaypoint)
            GP.TomTom.CurrentWaypoint = nil
        end
        
        local achievementID = GuidePostDetailPanel.selectedAchievementID
        if not achievementID then
            -- print some kind of error message to the chat window
            return
        end

        local ach = GP.Data.Achievements[achievementID]
        if not ach or self.criteriaIndex <= 0 then
            -- print error msg
            return
        end

        local criteria
        for _, step in pairs(ach.steps) do
            if step.criteriaIndex == self.criteriaIndex then
                criteria = step
                break
            end
        end
        if not criteria then
            -- print error msg again...
            return
        end

        if not criteria.coords then
            GP.Print("No coordinates for this step.")
            return
        end

        -- If no mapID is stored for either criteria or achievement, fall back to the player's current map.
        -- This won't be right for steps in other zones, but beats a hard error.
        local mapID = criteria.mapID or ach.mapID
        if not mapID then
            mapID = C_Map.GetBestMapForUnit("player")
            GP.Print(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("No mapID for this step — using your current map. Use /gp mapid to get the correct ID and update Achievements.lua."))
        end
        GP.TomTom.CurrentWaypoint = TomTom:AddWaypoint(mapID, criteria.coords.x / 100, criteria.coords.y / 100, {
            title = ach.name..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(" ["..(criteria.npc or "Objective").."]"),
            from = "GuidePost",
            persistent = false,
            minimap = true,
            world = true,
        })
    end)
end

function GuidePostDetailsStepMixin:OnEnter()
end

function GuidePostDetailsStepMixin:OnLeave()
end