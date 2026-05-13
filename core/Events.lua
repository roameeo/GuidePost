local GP = select(2, ...)

-- The invisible frame we use just to receive Blizzard events
local eventFrame = CreateFrame("Frame", "GuidePostEventFrame", UIParent)

local handlers = {
    ["ADDON_LOADED"] = function(name) -- Called once when the AddOn is loaded and SavedVariables are accessible
        if name == "GuidePost" then
            GP.EnsureDatabase(GuidePostDB, GP.GlobalDbDefaults)
            GP.EnsureDatabase(GuidePostCharDB, GP.CharDbDefaults)
            GP.AchievementData.Initialize()
            eventFrame:UnregisterEvent("ADDON_LOADED")
        end
    end,
    ["PLAYER_LOGIN"] = function() -- Called once when the player's UI is fully loaded and usable
        GP.Progress.Initialize()          -- load saved per-character progress
        GP.UI.MinimapButton.Initialize()  -- add the minimap icon
        GP.UI.Settings.Initialize()       -- build settings frame

        GP.Print("Loaded! Type |cff00ccff/gp|r to open.")
    end,
    ["ZONE_CHANGED_NEW_AREA"] = function() -- Called when the player enters a new zone or subzone
        GP.AchievementData.RefreshZoneSuggestions()
        -- Auto-scan if the user has enabled it in settings.
        -- Pass true so new finds are inserted into the runtime DB automatically
        -- rather than printed to chat.
        if GP.UI.Settings and GP.UI.Settings.Get("autoScan") then
            GP.AchievementData.ScanZone(nil, true)
        end
    end,
    ["CRITERIA_UPDATE"] = function() -- Called when ANY achievement criteria changes (kill, collect, explore, etc.)
        if GuidePostListPanel then GuidePostListPanel:PopulateList() end
        if GuidePostDetailPanel and GuidePostDetailPanel.selectedAchievementID > 0 then
            EventRegistry:TriggerEvent("GuidePost.AchievementSelected", GuidePostDetailPanel.selectedAchievementID)
        end
    end,
    ["ACHIEVEMENT_EARNED"] = function(id, alreadyEarned) -- Called when an achievement is fully completed
        if not alreadyEarned then
            GP.Progress.Untrack(id)
            GP.Print(string.format("|cffffff00Achievement complete:|r %s", tostring(id)))
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
