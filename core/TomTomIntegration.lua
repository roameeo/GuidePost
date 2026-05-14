local GP = select(2, ...)

GP.TomTom = {}

GP.TomTom.CurrentWaypoint = nil

-- Set a waypoint for a specific step (criteria index optional)
function GP.TomTom.SetWaypoint(achievementID, criteriaIndex)
    local ach = GP.Data.Achievements[achievementID]
    if not ach then
        -- print error msg
        return
    end

    local criterion
    if criteriaIndex then
        for _, step in pairs(ach.steps) do
            if step.criteriaIndex == criteriaIndex then
                criterion = step
                break
            end
        end
    else
        criterion = GP.AchievementData.GetNextStep(achievementID)
    end
    if not criterion then
        -- print error msg again...
        return
    end

    if not criterion.coords then
        GP.Print("No coordinates for this step.")
        return
    end

    -- If no mapID is stored for either criteria or achievement, fall back to the player's current map.
    -- This won't be right for steps in other zones, but beats a hard error.
    local mapID = criterion.mapID or ach.mapID
    if not mapID then
        mapID = C_Map.GetBestMapForUnit("player")
        GP.Print(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("No mapID for this step — using your current map. Use /gp mapid to get the correct ID and update Achievements.lua."))
    end

    GP.TomTom.CurrentWaypoint = TomTom:AddWaypoint(mapID, criterion.coords.x / 100, criterion.coords.y / 100, {
        title = ach.name..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(" ["..(criterion.npc or "Objective").."]"),
        from = "GuidePost",
        persistent = false,
        minimap = true,
        world = true,
    })
end

-- Remove the currently set waypoint
function GP.TomTom.ClearWaypoint()
    if TT.CurrentWaypoint then
        TomTom:RemoveWaypoint(TT.CurrentWaypoint)
        TT.CurrentWaypoint = nil
    end
end
