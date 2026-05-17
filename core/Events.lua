local GP = select(2, ...)

-- The invisible frame we use just to receive Blizzard events
local eventFrame = CreateFrame("Frame", "GuidePostEventFrame", UIParent)

local handlers = {
    ["ADDON_LOADED"] = function(name)
        -- Called once when the AddOn is loaded, SavedVariables are accessible going forward
        if name == "GuidePost" then
            GP.AchievementData.Initialize()
            eventFrame:UnregisterEvent("ADDON_LOADED")
        end
    end,
    ["PLAYER_LOGIN"] = function()
        -- Called once when the player's UI is fully loaded and usable
        -- load saved per-character progress, removing any achievements from the tracked list that are now completed
        GP.EnsureDatabase("GuidePostDB", GP.GlobalDbDefaults)
        GP.EnsureDatabase("GuidePostCharDB", GP.CharDbDefaults)
        for id in pairs(GuidePostCharDB.tracked) do
            if GP.IsAchievementCompleted(id) then
                GuidePostCharDB.tracked[id] = nil
            end
        end

        GP.Print("Type", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/gp"), "to open")
    end,
    ["ZONE_CHANGED_NEW_AREA"] = function()
        -- Called when the player enters a new zone or subzone
        GP.AchievementData.RefreshZoneSuggestions()
        if GuidePostFrame:IsShown() then GuidePostListPanel:PopulateList() end
        -- Auto-scan if the user has enabled it in settings.
        -- Pass true so new finds are inserted into the runtime DB automatically
        -- rather than printed to chat.
        if GuidePostDB.settings.autoScan then
            GP.AchievementData.ScanZone(nil, true)
        end
    end,
    ["CRITERIA_UPDATE"] = function()
        -- Called when ANY achievement criteria changes (kill, collect, explore, etc.)
        if GuidePostDetailPanel and GuidePostDetailPanel.selectedAchievementID > 0 then
            if GuidePostListPanel then GuidePostListPanel:PopulateList() end
            EventRegistry:TriggerEvent("GuidePost.AchievementSelected", GuidePostDetailPanel.selectedAchievementID)
        end
    end,
    ["ACHIEVEMENT_EARNED"] = function(id, alreadyEarned)
        -- Called when an achievement is fully completed
        local name = GP.Data.Achievements[id].name
        if not alreadyEarned then
            GP.UntrackAchievement(id)
            GP.Print(GREEN_FONT_COLOR:WrapTextInColorCode("Achievement complete:"), DARKYELLOW_FONT_COLOR:WrapTextInColorCode(name))
        end
        handlers["CRITERIA_UPDATE"]()
    end
}

for event, _ in pairs(handlers) do
    eventFrame:RegisterEvent(event)
end

-- Route every fired event to its handler
eventFrame:HookScript("OnEvent", function(self, event, ...)
    if handlers[event] then
        handlers[event](...)
    end
end)
