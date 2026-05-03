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
-- /gp or /guidepost         → toggles the main window
-- /gp list                  → prints all known achievements to chat
-- /gp track <id>            → start tracking achievement by ID
-- /gp untrack <id>          → stop tracking
-- /gp zone                  → show achievements suggested for current zone
-- /gp next                  → set waypoint for next incomplete step (tracked)
-- /gp mapid                 → print current zone's UiMapID
-- /gp criteria <id>         → dump criteria IDs for an achievement
-- /gp scan [zone]           → scan for achievement IDs in current or named zone

SLASH_GUIDEPOST1 = "/gp"
SLASH_GUIDEPOST2 = "/guidepost"

SlashCmdList["GUIDEPOST"] = function(input)
    input = input and input:match("^%s*(.-)%s*$") or ""
    input = input:lower()  -- make all commands case-insensitive

    if input == "" then
        GP.UI.MainFrame.Toggle()

    elseif input == "settings" then
        if GP.UI.Settings then GP.UI.Settings.Toggle() end

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

    elseif input == "dump" then
        -- Dump filtered achievement panel results as Lua stubs into SavedVariables.
        -- Usage: open Achievement panel, search/filter, then run /gp dump
        local count = GetNumFilteredAchievements and GetNumFilteredAchievements() or 0
        if count == 0 then
            GP.Print("No results loaded. Open the Achievement panel, search for a zone, then run /gp dump.")
            return
        end
        local zone    = GetZoneText() or "TODO"
        local mapID   = C_Map.GetBestMapForUnit("player") or 0
        local stubs   = {}
        local skipped = 0
        for i = 1, count do
            local id = GetFilteredAchievementID(i)
            local _, name, _, completed, _, _, _, _, _, _, _, isGuild = GetAchievementInfo(id)
            if name and not isGuild then
                if GP.Data.Achievements[id] then
                    skipped = skipped + 1
                else
                    local doneTag = completed and "  -- DONE" or ""
                    table.insert(stubs, string.format(
                        "    [%d] = {\n" ..
                        "        id       = %d,\n" ..
                        "        name     = %q,\n" ..
                        "        category = \"TODO\",\n" ..
                        "        zone     = %q,\n" ..
                        "        mapID    = %d,\n" ..
                        "        steps = {\n" ..
                        "            { index=1, desc=\"TODO\", npc=nil, coords=nil, mapID=%d, criteriaIndex=1 },\n" ..
                        "        },\n" ..
                        "    },%s",
                        id, id, name, zone, mapID, mapID, doneTag))
                end
            end
        end
        GuidePostDB.exportBuffer = table.concat(stubs, "\n")
        GP.Print(string.format(
            "Dumped |cff00ccff%d|r new stubs to |cffffcc00GuidePostDB.exportBuffer|r (%d already in DB, skipped).",
            #stubs, skipped))
        GP.Print("Find them in your WTF SavedVariables/GuidePost.lua file — search for 'exportBuffer'.")

    elseif input == "scan" then
        -- Scan the current zone for achievement IDs
        GP.AchievementData.ScanZone()

    elseif input:match("^scan .+$") then
        -- Scan a specific zone: /gp scan Durotar
        local zoneName = input:match("^scan (.+)$")
        GP.AchievementData.ScanZone(zoneName)

    elseif input == "next" then
        -- Set waypoint for next incomplete step of any tracked achievement
        local tracked = GP.Progress.GetTrackedList()
        if #tracked == 0 then
            GP.Print("|cffffcc00No achievements are currently tracked.|r")
            GP.Print("Use |cff00ccff/gp track <id>|r or click 'Track' in the UI.")
            return
        end

        -- Find the first tracked achievement with an incomplete step
        local foundStep = false
        for _, id in ipairs(tracked) do
            local nextStep = GP.AchievementData.GetNextStep(id)
            if nextStep then
                local ach = GP.Data.Achievements[id]
                GP.TomTom.SetWaypoint(id, nextStep)
                GP.Print(string.format("Next step for |cff00ccff%s|r:", ach.name))
                GP.Print("  " .. nextStep.desc)
                foundStep = true
                break
            end
        end

        if not foundStep then
            GP.Print("|cff00ff00All tracked achievements are complete!|r")
        end

    else
        GP.Print("Commands:")
        GP.Print("  /gp                    - Open / close window")
        GP.Print("  /gp list               - List all known achievements")
        GP.Print("  /gp track <id>         - Track an achievement")
        GP.Print("  /gp untrack <id>       - Stop tracking")
        GP.Print("  /gp zone               - Suggestions for current zone")
        GP.Print("  /gp next               - Set waypoint for next tracked step")
        GP.Print("  /gp mapid              - Print UiMapID for your current zone")
        GP.Print("  /gp criteria <achID>   - Dump criteria IDs for an achievement")
        GP.Print("  /gp scan               - Scan current zone for achievement IDs")
        GP.Print("  /gp scan <zone>        - Scan a specific zone by name")
        GP.Print("  /gp dump               - Dump achievement panel search results as Lua stubs")
    end
end
