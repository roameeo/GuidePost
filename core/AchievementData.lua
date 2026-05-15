local GP = select(2, ...)

local AD = {}

-- To be populated when scan is run to avoid re-scanning every single achievement ID repeatedly
AD.ScanResults = {}

-- Stores the IDs of achievements relevant to the player's current zone
AD.CurrentZoneSuggestions = {}

-- Set to true while a scan is running (prevents double-scans)
AD.ScanActive = false

local SCAN_BATCH_SIZE = 500   -- IDs checked per frame — raise if you want faster
local SCAN_ID_MAX     = 70000 -- highest ID to scan (Midnight S1)

-- Inserts newly discovered achievements into the runtime data so they appear
-- in the UI immediately.  Entries are flagged as auto-discovered so the user
-- knows they lack hand-curated steps/waypoints.
local function autoAddResults(zone, results)
    local added = 0
    for _, r in ipairs(results) do
        -- Skip anything already tracked or already completed
        if not r.completed and not GP.Data.Achievements[r.id] then
            GP.Data.Achievements[r.id] = {
                name      = r.name,
                zone      = zone,
                autoFound = true,   -- flag so the UI can show a "needs review" hint
                steps     = {},     -- no hand-curated steps yet
            }
            -- Register in the zone lookup table
            if not GP.ZoneAchievementMap[zone] then
                GP.ZoneAchievementMap[zone] = {}
            end
            table.insert(GP.ZoneAchievementMap[zone], r.id)
            added = added + 1
        end
    end

    if added > 0 then
        GP.Print("Added", DARKYELLOW_FONT_COLOR:WrapTextInColorCode(added), "new achievement(s) from auto-scan")
        AD.RefreshZoneSuggestions()
    else
        GP.Print("No new achievements found matching", "\""..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(zone).."\"")
    end
end

local function printScanResults(zone, results)
    if #results == 0 then
        GP.Print("No new achievements found matching", "\""..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(zone).."\"")
        return
    end
    
    GP.Print("Found", #results, "new achievement(s) matching", "\""..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(zone).."\"")

    for _, r in ipairs(results) do
        local tags = {}

        if r.completed then tinsert(tags, GREEN_FONT_COLOR:WrapTextInColorCode("(DONE)")) end

        local tagStr = table.concat(tags, " ")
        print(" ", r.id, r.name, tagStr)
    end

    GP.Print("Copy these IDs into data/Achievements.lua!")
end

EventRegistry:RegisterCallback("GuidePost.ZoneScanComplete", function(_, zone, searchTerms, autoAdd)
    local zoneResults = {}
    for _, result in ipairs(AD.ScanResults) do
        -- Match if any search term appears in the achievement name or description
        local matched = false
        for _, term in ipairs(searchTerms) do
            if result.name:lower():find(term, 1, true) or result.desc:lower():find(term, 1, true) then
                matched = true
                break
            end
        end

        if matched then tinsert(zoneResults, result) end
    end

    if autoAdd then
        autoAddResults(zone, zoneResults)
    else
        printScanResults(zone, zoneResults)
    end
end)

local function isAvailableForPlayerFaction(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return false end
    
    -- If no faction specified, achievement is available to all
    if not ach.faction then return true end
    
    local playerFaction = UnitFactionGroup("player") or "Neutral"
    
    -- Neutral players (pre-choice Pandaren) see everything
    if playerFaction == "Neutral" then return true end
    
    -- Otherwise, must match the faction field
    return ach.faction == playerFaction
end

function AD.Initialize()
    -- Build the zone → [ids] lookup table from the raw data
    for id, ach in pairs(GP.Data.Achievements) do
        local zone = ach.zone or "Unknown"
        if not GP.ZoneAchievementMap[zone] then
            GP.ZoneAchievementMap[zone] = {}
        end
        table.insert(GP.ZoneAchievementMap[zone], id)
    end
    AD.RefreshZoneSuggestions()
end

function AD.RefreshZoneSuggestions()
    AD.CurrentZoneSuggestions = {}
    -- GetZoneText() returns something like "Durotar" or "Stormwind City"
    local zone = GetZoneText()
    if GP.ZoneAchievementMap[zone] then
        for _, id in ipairs(GP.ZoneAchievementMap[zone]) do
            -- Only suggest achievements that match player's faction and aren't completed
            if isAvailableForPlayerFaction(id) and not GP.IsAchievementCompleted(id) then
                table.insert(AD.CurrentZoneSuggestions, id)
            end
        end
    end
    EventRegistry:TriggerEvent("GuidePost.RefreshZoneSuggestions")
end

-- Returns a sorted list of all achievement IDs (sorted by name)
-- Only returns achievements available to the player's faction
function AD.GetAllAchievementsForPlayer()
    local list = {}
    for id in pairs(GP.Data.Achievements) do
        -- Filter by faction
        if isAvailableForPlayerFaction(id) then
            table.insert(list, id)
        end
    end
    table.sort(list, function(a, b)
        local na = GP.Data.Achievements[a].name or ""
        local nb = GP.Data.Achievements[b].name or ""
        return na < nb
    end)
    return list
end

-- Returns the next incomplete step for an achievement, or nil if all done
function AD.GetNextStep(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return nil end

    for _, step in ipairs(ach.steps) do
        if step.criteriaIndex then
            local ok, _, _, completed = pcall(GetAchievementCriteriaInfo, id, step.criteriaIndex)
            if not ok or not completed then return step end
        else
            return step
        end
    end
    return nil  -- all steps done
end

function AD.ScanZone(overrideZone, autoAdd)
    if AD.ScanActive then
        GP.Print("Scan already in progress")
        return
    end

    local zone = overrideZone or GetZoneText()
    if not zone or zone == "" then
        GP.Print("Could not determine zone. Try: /gp scan <zone name>")
        return
    end

    GP.Print("Scanning for achievements matching", "\""..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(zone).."\"", (#AD.ScanResults == 0 and "(this may take a moment)" or ""))

    local zoneLower = zone:lower()

    -- Build a list of search terms: always include the zone as-is, plus a de-pluralised variant (e.g. "siren isles" → "siren isle") so we catch achievements whose text omits or adds a trailing 's'.
    local searchTerms = { zoneLower }
    if zoneLower:sub(-1) == "s" then
        table.insert(searchTerms, zoneLower:sub(1, -2))  -- strip trailing 's'
    else
        table.insert(searchTerms, zoneLower .. "s")      -- add trailing 's'
    end

    local zoneResults = {}
    
    if #AD.ScanResults == 0 then
        AD.ScanActive  = true
        local currentID = 1
        -- Ticker runs achievement gathering in batches, avoiding in-game lag or other performance issues
        local ticker
        ticker = C_Timer.NewTicker(0.5, function()
            local batchEnd = math.min(currentID + SCAN_BATCH_SIZE - 1, SCAN_ID_MAX)

            for id = currentID, batchEnd do
                -- Only query IDs that are not currently in the DB (should help the scan finish quicker)
                if GP.Data.Achievements[id] == nil then
                    -- GetAchievementInfo returns nil for invalid IDs
                    local _, name, _, completed, _, _, _, desc, _, _, _, isGuild, _, _, isStat = GetAchievementInfo(id)
    
                    if name and not isGuild and not isStat then    
                        table.insert(AD.ScanResults, {
                            id = id,
                            name = name,
                            desc = desc,
                            completed = completed
                        })
                    end
                end
            end

            currentID = batchEnd + 1

            if currentID > SCAN_ID_MAX then
                -- Scan complete
                ticker:Cancel()
                AD.ScanActive = false
                EventRegistry:TriggerEvent("GuidePost.ZoneScanComplete", zone, searchTerms, autoAdd)
            end
        end)
    else
        EventRegistry:TriggerEvent("GuidePost.ZoneScanComplete", zone, searchTerms, autoAdd)
    end
end

GP.AchievementData = AD
