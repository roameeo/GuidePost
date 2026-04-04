-- =============================================================================
-- GuidePost: core/Progress.lua
-- =============================================================================
-- Manages the per-character list of "tracked" achievements and fires callbacks
-- when progress changes so the UI can redraw itself.
-- =============================================================================

local GP = GuidePostNS

GP.Progress = {}
local P = GP.Progress

-- ─── Saved data ──────────────────────────────────────────────────────────────
-- GuidePostCharDB is the per-character SavedVariable defined in the .toc
-- We store: { tracked = { [id]=true, ... } }

local function EnsureDB()
    GuidePostCharDB = GuidePostCharDB or {}
    GuidePostCharDB.tracked = GuidePostCharDB.tracked or {}
end

-- ─── Init ────────────────────────────────────────────────────────────────────

function P.Initialize()
    EnsureDB()
    -- Remove any achievements from the tracked list that are now completed
    for id in pairs(GuidePostCharDB.tracked) do
        if GP.AchievementData.IsCompleted(id) then
            GuidePostCharDB.tracked[id] = nil
        end
    end
end

-- ─── Tracking ────────────────────────────────────────────────────────────────

function P.Track(id)
    EnsureDB()
    GuidePostCharDB.tracked[id] = true
    GP.TomTom.SetNextStepWaypoint(id)
end

function P.Untrack(id)
    EnsureDB()
    GuidePostCharDB.tracked[id] = nil
    GP.TomTom.ClearWaypoint()
end

function P.IsTracked(id)
    EnsureDB()
    return GuidePostCharDB.tracked[id] == true
end

-- Returns a list of all currently tracked achievement IDs
function P.GetTrackedList()
    EnsureDB()
    local list = {}
    for id in pairs(GuidePostCharDB.tracked) do
        table.insert(list, id)
    end
    return list
end

-- ─── Refresh ─────────────────────────────────────────────────────────────────

-- Called by Events.lua whenever CRITERIA_UPDATE fires
function P.RefreshAll()
    -- Nothing heavy here right now — the UI pulls live data from AchievementData
    -- when it redraws.  This is a hook for future features (notifications, etc.)
end

-- Called when ACHIEVEMENT_EARNED fires
function P.OnAchievementEarned(id)
    -- Auto-untrack completed achievements
    P.Untrack(id)
    GP.Print(string.format("|cffffff00Achievement complete:|r %s", tostring(id)))
end
