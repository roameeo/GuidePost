-- =============================================================================
-- GuidePost: core/AchievementData.lua
-- =============================================================================
-- Functions that query, filter and enrich the achievement database.
-- Nothing in this file draws any UI — it's pure data logic.
-- =============================================================================

local GP = GuidePostNS

GP.AchievementData = {}
local AD = GP.AchievementData   -- short alias used throughout this file

-- ─── Faction Detection ──────────────────────────────────────────────────────

-- Returns "Alliance", "Horde", or "Neutral" based on the player's faction
function AD.GetPlayerFaction()
    local englishFaction, localizedFaction = UnitFactionGroup("player")
    -- englishFaction is "Alliance", "Horde", or "Neutral" (for Pandaren before choosing)
    return englishFaction or "Neutral"
end

-- Returns true if the achievement is available for the player's faction
-- faction field can be: "Alliance", "Horde", or nil (meaning Neutral/Both)
function AD.IsAvailableForPlayerFaction(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return false end
    
    -- If no faction specified, achievement is available to all
    if not ach.faction then return true end
    
    local playerFaction = AD.GetPlayerFaction()
    
    -- Neutral players (pre-choice Pandaren) see everything
    if playerFaction == "Neutral" then return true end
    
    -- Otherwise, must match the faction field
    return ach.faction == playerFaction
end

-- ─── Initialisation ──────────────────────────────────────────────────────────

function AD.Initialize()
    -- Build the zone → [ids] lookup table from the raw data
    for id, ach in pairs(GP.Data.Achievements) do
        local zone = ach.zone or "Unknown"
        if not GP.Data.ByZone[zone] then
            GP.Data.ByZone[zone] = {}
        end
        table.insert(GP.Data.ByZone[zone], id)
    end
    AD.RefreshZoneSuggestions()
end

-- ─── Zone Suggestions ────────────────────────────────────────────────────────

-- Stores the IDs of achievements relevant to the player's current zone
AD.CurrentZoneSuggestions = {}

function AD.RefreshZoneSuggestions()
    AD.CurrentZoneSuggestions = {}
    -- GetZoneText() returns something like "Durotar" or "Stormwind City"
    local zone = GetZoneText()
    if GP.Data.ByZone[zone] then
        for _, id in ipairs(GP.Data.ByZone[zone]) do
            -- Only suggest achievements that match player's faction and aren't completed
            if AD.IsAvailableForPlayerFaction(id) and not AD.IsCompleted(id) then
                table.insert(AD.CurrentZoneSuggestions, id)
            end
        end
    end
end

-- ─── Completion Checks ───────────────────────────────────────────────────────

-- Returns true if Blizzard already marks this achievement as earned
function AD.IsCompleted(id)
    local _, _, _, completed = GetAchievementInfo(id)
    return completed == true
end

-- Returns 0-100 percent completion for an achievement
function AD.GetPercent(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return 0 end

    local total = #ach.steps
    local done  = 0

    for _, step in ipairs(ach.steps) do
        if step.criteriaIndex then
            local ok, _, _, completed = pcall(GetAchievementCriteriaInfo, id, step.criteriaIndex)
            if ok and completed then done = done + 1 end
        end
    end

    if total == 0 then return 0 end
    return math.floor((done / total) * 100)
end

-- Returns how many criteria steps are done vs total
function AD.GetCriteriaProgress(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return 0, 0 end

    local total, done = 0, 0
    for _, step in ipairs(ach.steps) do
        if step.criteriaIndex then
            total = total + 1
            local ok, _, _, completed = pcall(GetAchievementCriteriaInfo, id, step.criteriaIndex)
            if ok and completed then done = done + 1 end
        end
    end
    return done, total
end

-- ─── Retrieval Helpers ───────────────────────────────────────────────────────

-- Returns the achievement table for a given ID, or nil
function AD.Get(id)
    return GP.Data.Achievements[id]
end

-- Returns a sorted list of all achievement IDs (sorted by name)
-- Only returns achievements available to the player's faction
function AD.GetAll()
    local list = {}
    for id in pairs(GP.Data.Achievements) do
        -- Filter by faction
        if AD.IsAvailableForPlayerFaction(id) then
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

-- =============================================================================
-- Zone Scanner
-- =============================================================================
-- Scans Blizzard achievement IDs in batches so the game doesn't freeze.
-- Prints any achievement whose name or description contains the current zone,
-- flagging ones already in the GuidePost database.
--
-- Usage: GP.AchievementData.ScanZone()        -- scans for current zone
--        GP.AchievementData.ScanZone("Durotar") -- scans for a specific zone
-- =============================================================================

local SCAN_BATCH_SIZE = 200   -- IDs checked per frame — raise if you want faster
local SCAN_ID_MAX     = 40000 -- highest ID to scan; raised for TWW S2+ content

AD.ScanActive = false  -- true while a scan is running (prevents double-scans)

-- autoAdd = true  →  silently insert any new finds into the runtime DB
--                     (used by auto-scan on zone change)
-- autoAdd = false →  print results to chat for the developer (default /gp scan)
function AD.ScanZone(overrideZone, autoAdd)
    if AD.ScanActive then
        GP.Print("Scan already in progress — please wait.")
        return
    end

    local zone = overrideZone or GetZoneText()
    if not zone or zone == "" then
        GP.Print("Could not determine zone. Try: /gp scan <zone name>")
        return
    end

    local zoneLower = zone:lower()

    -- Build a list of search terms: always include the zone as-is, plus a
    -- de-pluralised variant (e.g. "siren isles" → "siren isle") so we catch
    -- achievements whose text omits or adds a trailing 's'.
    local searchTerms = { zoneLower }
    if zoneLower:sub(-1) == "s" then
        table.insert(searchTerms, zoneLower:sub(1, -2))  -- strip trailing 's'
    else
        table.insert(searchTerms, zoneLower .. "s")      -- add trailing 's'
    end

    if not autoAdd then
        GP.Print(string.format("Scanning for achievements in |cff00ccff%s|r ... (this may take a moment)", zone))
    end

    AD.ScanActive  = true
    local currentID = 1
    local results   = {}   -- { id, name, category, alreadyInDB }

    -- We use a repeating ticker so each batch runs in its own frame,
    -- keeping the game responsive throughout the scan.
    local ticker
    ticker = C_Timer.NewTicker(0, function()

        local batchEnd = math.min(currentID + SCAN_BATCH_SIZE - 1, SCAN_ID_MAX)

        for id = currentID, batchEnd do
            -- GetAchievementInfo returns nil for invalid IDs
            local _, name, _, completed, _, _, _, desc, _, _, _, isGuild = GetAchievementInfo(id)

            if name and not isGuild then
                local nameLower = name:lower()
                local descLower = (desc or ""):lower()

                -- Match if any search term appears in the achievement name or description
                local matched = false
                for _, term in ipairs(searchTerms) do
                    if nameLower:find(term, 1, true) or descLower:find(term, 1, true) then
                        matched = true
                        break
                    end
                end
                if matched then
                    table.insert(results, {
                        id          = id,
                        name        = name,
                        completed   = completed,
                        inDB        = GP.Data.Achievements[id] ~= nil,
                    })
                end
            end
        end

        currentID = batchEnd + 1

        -- Scan complete
        if currentID > SCAN_ID_MAX then
            ticker:Cancel()
            AD.ScanActive = false
            if autoAdd then
                AD.AutoAddResults(zone, results)
            else
                AD.PrintScanResults(zone, results)
            end
        end
    end)
end

-- Inserts newly discovered achievements into the runtime data so they appear
-- in the UI immediately.  Entries are flagged as auto-discovered so the user
-- knows they lack hand-curated steps/waypoints.
function AD.AutoAddResults(zone, results)
    local added = 0
    for _, r in ipairs(results) do
        -- Skip anything already tracked or already completed
        if not r.inDB and not r.completed then
            GP.Data.Achievements[r.id] = {
                name      = r.name,
                zone      = zone,
                autoFound = true,   -- flag so the UI can show a "needs review" hint
                steps     = {},     -- no hand-curated steps yet
            }
            -- Register in the zone lookup table
            if not GP.Data.ByZone[zone] then
                GP.Data.ByZone[zone] = {}
            end
            table.insert(GP.Data.ByZone[zone], r.id)
            added = added + 1
        end
    end

    if added > 0 then
        GP.Print(string.format(
            "Auto-scan: added |cff00ccff%d|r new achievement(s) for |cff00ccff%s|r.",
            added, zone))
        AD.RefreshZoneSuggestions()
        if GP.UI.MainFrame then
            GP.UI.MainFrame.RefreshList()
        end
    end
end

function AD.PrintScanResults(zone, results)
    if #results == 0 then
        GP.Print(string.format("No achievements found matching |cff00ccff%s|r.", zone))
        return
    end

    GP.Print(string.format(
        "Found |cff00ccff%d|r achievement(s) matching |cff00ccff%s|r:", #results, zone))

    for _, r in ipairs(results) do
        local tags = {}

        if r.completed then
            table.insert(tags, "|cff00ff00DONE|r")
        end
        if r.inDB then
            table.insert(tags, "|cff00ccffIN DB|r")
        else
            table.insert(tags, "|cffffcc00ADD ME|r")
        end

        local tagStr = table.concat(tags, " ")
        GP.Print(string.format("  [%d] %s  %s", r.id, r.name, tagStr))
    end

    GP.Print("Copy any |cffffcc00ADD ME|r IDs into data/Achievements.lua!")
end
