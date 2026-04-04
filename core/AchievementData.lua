-- =============================================================================
-- GuidePost: core/AchievementData.lua
-- =============================================================================
-- Functions that query, filter and enrich the achievement database.
-- Nothing in this file draws any UI — it's pure data logic.
-- =============================================================================

local GP = GuidePostNS

GP.AchievementData = {}
local AD = GP.AchievementData   -- short alias used throughout this file

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
            if not AD.IsCompleted(id) then
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

    local total    = #ach.steps
    local done     = 0

    for _, step in ipairs(ach.steps) do
        if step.criteria then
            -- Ask Blizzard whether this specific criteria is completed
            local _, _, completed = GetAchievementCriteriaInfoByID(id, step.criteria)
            if completed then done = done + 1 end
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
        if step.criteria then
            total = total + 1
            local _, _, completed = GetAchievementCriteriaInfoByID(id, step.criteria)
            if completed then done = done + 1 end
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
function AD.GetAll()
    local list = {}
    for id in pairs(GP.Data.Achievements) do
        table.insert(list, id)
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
        if step.criteria then
            local _, _, completed = GetAchievementCriteriaInfoByID(id, step.criteria)
            if not completed then return step end
        else
            -- Steps without a criteria ID are always "pending"
            -- (e.g. travel steps — we can't auto-detect them)
            return step
        end
    end
    return nil  -- all steps done
end
