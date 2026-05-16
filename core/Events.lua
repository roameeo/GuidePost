-- =============================================================================
-- GuidePost: core/Events.lua
-- =============================================================================
-- Registers all the Blizzard events we care about and routes them to the
-- right handler functions.  Think of this as the addon's nervous system.
-- =============================================================================

local GP = GuidePostNS

GP.Events = {}

-- The invisible frame we use just to receive Blizzard events
local eventFrame = CreateFrame("Frame", "GuidePostEventFrame")

-- Map of event name → handler function (populated below)
local handlers = {}

-- Route every fired event to its handler
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if handlers[event] then
        handlers[event](...)
    end
end)

-- Helper: register an event and its handler in one call
local function On(event, fn)
    handlers[event] = fn
    eventFrame:RegisterEvent(event)
end

-- ─── Handlers ────────────────────────────────────────────────────────────────

-- Called once when the player's UI is fully loaded and usable
On("PLAYER_LOGIN", function()
    GuidePostDB = GuidePostDB or {}   -- ensure account SavedVars table always exists
    GP.AchievementData.Initialize()  -- build zone index, check completion state
    GP.Progress.Initialize()          -- load saved per-character progress
    GP.UI.MinimapButton.Initialize()  -- add the minimap icon
    GP.UI.Settings.Initialize()       -- build settings frame
    GP.Print("Loaded! Type |cff00ccff/gp|r to open.")
end)

-- Called when the player enters a new zone or subzone
On("ZONE_CHANGED_NEW_AREA", function()
    GP.AchievementData.RefreshZoneSuggestions()
    -- Auto-scan if the user has enabled it in settings.
    -- Pass true so new finds are inserted into the runtime DB automatically
    -- rather than printed to chat.
    if GP.UI.Settings and GP.UI.Settings.Get("autoScan") then
        GP.AchievementData.ScanZone(nil, true)
    end
end)

-- Called when ANY achievement criteria changes (kill, collect, explore, etc.)
On("CRITERIA_UPDATE", function()
    GP.Progress.RefreshAll()
    if GP.UI.MainFrame then GP.UI.MainFrame.RefreshIfVisible() end
end)

-- Called when an achievement is fully completed
On("ACHIEVEMENT_EARNED", function(id, alreadyEarned)
    if not alreadyEarned then
        GP.Progress.OnAchievementEarned(id)
        if GP.UI.MainFrame then GP.UI.MainFrame.RefreshIfVisible() end
    end
end)

GP.Events.Frame = eventFrame
