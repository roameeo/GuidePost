-- =============================================================================
-- GuidePost: core/TomTomIntegration.lua
-- =============================================================================
-- Everything related to TomTom waypoints lives here.
-- We keep a reference to the current waypoint so we can remove it cleanly
-- before adding a new one (no duplicate arrows).
-- =============================================================================

local GP = GuidePostNS

GP.TomTom = {}
local TT = GP.TomTom

-- Holds the TomTom UID of the currently active waypoint (or nil)
TT.CurrentWaypoint = nil

-- ─── Helpers ─────────────────────────────────────────────────────────────────

-- Returns true if TomTom is loaded and functional
local function TomTomAvailable()
    return TomTom and TomTom.AddWaypoint ~= nil
end

-- ─── Public API ──────────────────────────────────────────────────────────────

-- Set a waypoint for a specific step.
-- achID   – the achievement ID (used to resolve mapID if the step doesn't have one)
-- step    – a step table from data/Achievements.lua
function TT.SetWaypoint(achID, step)
    if not TomTomAvailable() then
        GP.Print("|cffff4444TomTom is not loaded.|r Please install and enable it.")
        return
    end

    -- Remove any existing waypoint first
    TT.ClearWaypoint()

    -- Resolve which map to pin the waypoint on:
    -- step.mapID overrides the parent achievement's mapID (used for multi-zone achievements)
    local ach   = GP.AchievementData.Get(achID)
    local mapID = step.mapID or (ach and ach.mapID) or nil

    if not mapID then
        GP.Print("No map ID for this step — cannot place waypoint.")
        return
    end
    if not step.coords then
        GP.Print("No coordinates for this step.")
        return
    end

    local x, y   = step.coords.x / 100, step.coords.y / 100  -- TomTom uses 0-1 scale
    local label  = step.npc and (step.desc .. " [" .. step.npc .. "]") or step.desc

    -- TomTom.AddWaypoint(mapID, x, y, opts) – returns a UID we save for later removal
    TT.CurrentWaypoint = TomTom:AddWaypoint(mapID, x, y, {
        title    = label,
        from     = "GuidePost",
        persistent = false,   -- disappears when you close the game
        minimap  = true,
        world    = true,
    })

    GP.Print(string.format("Waypoint set: |cff00ccff%s|r (%.1f, %.1f)", label, step.coords.x, step.coords.y))
end

-- Remove the current waypoint (called when user picks a different step, or closes)
function TT.ClearWaypoint()
    if TomTomAvailable() and TT.CurrentWaypoint then
        TomTom:RemoveWaypoint(TT.CurrentWaypoint)
        TT.CurrentWaypoint = nil
    end
end

-- Convenience: set a waypoint directly from an achievement's next incomplete step
function TT.SetNextStepWaypoint(achID)
    local step = GP.AchievementData.GetNextStep(achID)
    if step then
        TT.SetWaypoint(achID, step)
    else
        GP.Print("All steps complete — no waypoint needed!")
        TT.ClearWaypoint()
    end
end
