local GP = select(2, ...)

GuidePostDetailPanelMixin = {}

function GuidePostDetailPanelMixin:OnLoad()
    EventRegistry:RegisterCallback("GuidePost.AchievementSelected", function(_, achievementID)
        self.selectedAchievementID = achievementID
        local ach = GP.Data.Achievements[achievementID]
        if not ach then return end

        self.AchName:SetText(ach.name)

        if GP.IsAchievementCompleted(achievementID) then
            self.ProgressBar:SetValue(100)
            self.ProgressBar.ProgressLabel:SetText(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Completed!"))
            if self.ToggleTrackingBtn:IsShown() then self.ToggleTrackingBtn:Hide() end
        else
            local pct = GP.GetAchievementCompletionPercent(achievementID)
            self.ProgressBar:SetValue(pct)
            self.ProgressBar.ProgressLabel:SetText(pct.."%")
            if GuidePostCharDB and GuidePostCharDB.tracked and GuidePostCharDB.tracked[achievementID] then
                self.ToggleTrackingBtn:SetText("Untrack")
            else
                self.ToggleTrackingBtn:SetText("Track + Waypoint")
            end
            self.ToggleTrackingBtn:Show()
        end

        self:PopulateStepList()
    end)

    self.ToggleTrackingBtn:HookScript("OnClick", function(btn)
        GuidePostCharDB = GuidePostCharDB or {}
        GuidePostCharDB.tracked = GuidePostCharDB.tracked or {}

        local tracked = GuidePostCharDB.tracked
        if tracked[self.selectedAchievementID] then
            tracked[self.selectedAchievementID] = nil
        else
            tracked[self.selectedAchievementID] = true
        end
        if tracked[self.selectedAchievementID] then
                btn:SetText("Untrack")
            else
                btn:SetText("Track + Waypoint")
            end
        EventRegistry:TriggerEvent("GuidePost.ToggleTracking", self.selectedAchievementID, tracked[self.selectedAchievementID] or false)
    end)

    self.ScrollFrame:HookScript("OnSizeChanged", function(scrollFrame)
        scrollFrame.ListContent:ClearAllPoints()
        scrollFrame.ListContent:SetPoint("TOPLEFT")
        scrollFrame.ListContent:SetPoint("TOPRIGHT")
    end)
end

function GuidePostDetailPanelMixin:ClearCurrentSteps()
    -- Clear existing content
    -- TODO: Explore using a scrollable list template instead to utilize DataProvider's frame recycling capabilities
    for _, child in ipairs({ self.ScrollFrame.ListContent:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, region in ipairs({ self.ScrollFrame.ListContent:GetRegions() }) do
        region:Hide()
        region:SetParent(nil)
    end
end

function GuidePostDetailPanelMixin:PopulateStepList()
    self:ClearCurrentSteps()

    if not self.selectedAchievementID or not GP.Data.Achievements[self.selectedAchievementID] then return end

    local ach = GP.Data.Achievements[self.selectedAchievementID]
    if ach.autoFound and #ach.steps == 0 then
        -- auto-found notice message for achievements
        return
    end
    for idx, step in ipairs(ach.steps) do
        local isStepComplete = false
        if step.criteriaIndex then
            local ok, _, _, completed = pcall(GetAchievementCriteriaInfo, ach.id, step.criteriaIndex)
            isStepComplete = ok and completed or false
        end

        local stepFrame = CreateFrame("Frame", nil, self.ScrollFrame.ListContent, "GuidePostDetailsStepTemplate")
        stepFrame.criteriaIndex = step.criteriaIndex
        stepFrame:SetPoint("TOP", 0, idx <= 1 and 0 or (idx - 1) * -55)

        if isStepComplete then stepFrame.Bg:SetColorTexture(0.1, 0.25, 0.1, 0.6) end

        stepFrame.StepIndex:SetText(isStepComplete and GP.GetAtlasString("VAS-icon-checkmark", 20, -5, 5) or step.index)
        stepFrame.StepDesc:SetText(step.desc)

        if step.npc then stepFrame.NpcLabel:SetText(step.npc) end

        if step.coords and not isStepComplete then
            stepFrame.WaypointBtn:Show()
        elseif stepFrame.WaypointBtn:IsShown() then
            stepFrame.WaypointBtn:Hide()
        end
    end
end