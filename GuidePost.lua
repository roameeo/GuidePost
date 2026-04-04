-- =============================================================================
-- GuidePost.lua — Main entry point
-- =============================================================================
-- This file is loaded LAST (see .toc).  By the time it runs, every other file
-- has already set up its module table inside GuidePostNS.
--
-- Responsibilities:
--   1. Create the global namespace table (referenced by all other files)
--   2. Register slash commands
--   3. Provide the GP.Print helper
-- =============================================================================

-- Create the global namespace.  Every other file does:
--   local GP = GuidePostNS
-- to get a local reference.
GuidePostNS = GuidePostNS or {}
local GP = GuidePostNS

-- ─── Utility ─────────────────────────────────────────────────────────────────

-- Print a message to chat with the addon prefix
function GP.Print(msg)
    print("|cff00ccff[GP]|r " .. tostring(msg))
end

-- ─── Slash Commands ──────────────────────────────────────────────────────────
-- /ag or /guidepost  →  toggles the main window
-- /ag list                  →  prints all known achievements to chat
-- /ag track <id>            →  start tracking achievement by ID
-- /ag untrack <id>          →  stop tracking
-- /ag zone                  →  show achievements suggested for current zone

SLASH_GUIDEPOST1 = "/gp"
SLASH_GUIDEPOST2 = "/guidepost"

SlashCmdList["GUIDEPOST"] = function(input)
    input = input and input:trim() or ""

    if input == "" then
        GP.UI.MainFrame.Toggle()

    elseif input == "list" then
        GP.Print("Known achievements:")
        for _, id in ipairs(GP.AchievementData.GetAll()) do
            local ach = GP.Data.Achievements[id]
            GP.Print(string.format("  [%d] %s (%s)", id, ach.name, ach.category))
        end

    elseif input:match("^track %d+$") then
        local id = tonumber(input:match("%d+"))
        if GP.Data.Achievements[id] then
            GP.Progress.Track(id)
            GP.Print("Tracking: " .. GP.Data.Achievements[id].name)
        else
            GP.Print("Unknown achievement ID: " .. id)
        end

    elseif input:match("^untrack %d+$") then
        local id = tonumber(input:match("%d+"))
        GP.Progress.Untrack(id)
        GP.Print("Untracked ID: " .. id)

    elseif input == "zone" then
        local zone = GetZoneText()
        local ids  = GP.AchievementData.CurrentZoneSuggestions
        if #ids == 0 then
            GP.Print("No achievements found for: " .. zone)
        else
            GP.Print("Achievements in " .. zone .. ":")
            for _, id in ipairs(ids) do
                GP.Print("  [" .. id .. "] " .. GP.Data.Achievements[id].name)
            end
        end

    else
        GP.Print("Commands: /ag | /ag list | /ag track <id> | /ag untrack <id> | /ag zone")
    end
end
