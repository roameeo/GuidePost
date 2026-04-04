-- =============================================================================
-- GuidePost.lua — Main entry point
-- =============================================================================
-- This file is loaded LAST (see .toc).  By the time it runs, every other file
-- has already set up its module table inside GuidePostNS.
--
-- Responsibilities:
--   1. Register slash commands
--   2. Provide the GP.Print helper
-- NOTE: GuidePostNS is created in data/Achievements.lua (the first file loaded)
-- =============================================================================

-- Namespace was already created in data/Achievements.lua
-- The 'or {}' here is just a safety net
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
    input = input and input:match("^%s*(.-)%s*$") or ""
    input = input:lower()  -- make all commands case-insensitive

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

    elseif input == "mapid" then
        -- Print the UiMapID for your current zone — use this to fill in mapID fields
        local mapID   = C_Map.GetBestMapForUnit("player")
        local mapInfo = C_Map.GetMapInfo(mapID)
        local name    = mapInfo and mapInfo.name or "Unknown"
        GP.Print(string.format("Current zone: |cff00ccff%s|r  mapID = |cffffcc00%d|r", name, mapID))
        GP.Print("Use this mapID in data/Achievements.lua for steps in this zone.")

    elseif input:match("^criteria %d+$") then
        local achID = tonumber(input:match("%d+"))
        local _, achName = GetAchievementInfo(achID)
        if not achName then
            GP.Print("Unknown achievement ID: " .. achID)
        else
            GP.Print(string.format("Criteria for [%d] %s:", achID, achName))
            GP.Print("Use the |cffffcc00index number|r as criteriaIndex in Achievements.lua")
            local i = 1
            while true do
                local criteriaStr, _, completed = GetAchievementCriteriaInfo(achID, i)
                if not criteriaStr then break end
                local status = completed and "|cff00ff00DONE|r" or "|cffaaaaaa    |r"
                GP.Print(string.format("  criteriaIndex=|cffffcc00%d|r  %s  %s",
                    i, status, criteriaStr))
                i = i + 1
            end
        end

    elseif input == "scan" then
        -- Scan the current zone for achievement IDs
        GP.AchievementData.ScanZone()

    elseif input:match("^scan .+$") then
        -- Scan a specific zone: /gp scan Durotar
        local zoneName = input:match("^scan (.+)$")
        GP.AchievementData.ScanZone(zoneName)

    else
        GP.Print("Commands:")
        GP.Print("  /gp                    - Open / close window")
        GP.Print("  /gp list               - List all known achievements")
        GP.Print("  /gp track <id>         - Track an achievement")
        GP.Print("  /gp untrack <id>       - Stop tracking")
        GP.Print("  /gp zone               - Suggestions for current zone")
        GP.Print("  /gp mapid              - Print UiMapID for your current zone")
        GP.Print("  /gp criteria <achID>   - Dump criteria IDs for an achievement")
        GP.Print("  /gp scan               - Scan current zone for achievement IDs")
        GP.Print("  /gp scan <zone>        - Scan a specific zone by name")
    end
end
