local GP = select(2, ...)

GP.Progress = {}
local P = GP.Progress

-- ─── Init ────────────────────────────────────────────────────────────────────

-- Usage: event handlers, main frame XML
function P.Initialize()
    -- Remove any achievements from the tracked list that are now completed
    for id in pairs(GuidePostCharDB.tracked) do
        if GP.IsAchievementCompleted(id) then
            GuidePostCharDB.tracked[id] = nil
        end
    end
end

-- ─── Tracking ────────────────────────────────────────────────────────────────
-- TODO: Implement all these in UI rework

function P.Track(id)
    GuidePostCharDB.tracked[id] = true
    GP.TomTom.SetNextStepWaypoint(id)
end

function P.Untrack(id)
    GuidePostCharDB.tracked[id] = nil
    GP.TomTom.ClearWaypoint()
end

function P.IsTracked(id)
    return GuidePostCharDB.tracked[id] == true
end

-- Returns a list of all currently tracked achievement IDs
function P.GetTrackedList()
    local list = {}
    for id in pairs(GuidePostCharDB.tracked) do
        table.insert(list, id)
    end
    return list
end
