local GP = select(2, ...)

GP.StatusFilters = { "All", "In Progress", "Not Started", "Completed" }
GP.ZoneFilters = { "All", "Current Zone" }

GP.GlobalDbDefaults = {
    isMinimized = false,
    filters = {
        lowHangingFruit = false,
        category = "All",
        status = "All",
        zone = "All"
    },
    windowH = 520,
    windowW = 460,
    collapsedZones = {},
    settings = {
        scope = "account",
        autoScan = false
    },
}

GP.CharDbDefaults = {
    tracked = {}
}

-- Print a message to chat with the addon prefix
function GP.Print(...)
    print(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("[GuidePost]"), ...)
end

-- Call this once the AddOn is loaded to ensure database structures remain up to date even when new properties are added
-- Expects that tables are not nested past one level in a database (example: GuidePostDB.filters.zone)
function GP.EnsureDatabase(dbName, dbDefaults)
    if not _G[dbName] then
        _G[dbName] = dbDefaults
    else
        for k, v in pairs(dbDefaults) do
            if type(_G[dbName][k]) == "table" then
                for nK, nV in pairs(dbDefaults[k]) do
                    if _G[dbName][k][nK] == nil then _G[dbName][k][nK] = nV end
                end
            elseif _G[dbName][k] == nil
                then _G[dbName][k] = v
            end
        end
    end
end

function GP.GetTextureString(texture, dim)
    local size = 20
    if dim and type(dim) == "number" then
        size = dim
    end
    return "|T"..texture..":"..size..":"..size.."|t"
end

function GP.GetAtlasString(atlas, dim, offX, offY, r, g, b)
    local size = 15
    if dim and type(dim) == "number" then
        size = dim
    end
    return CreateAtlasMarkup(atlas, size, size, offX, offY, r, g, b)
end

-- Returns true if Blizzard already marks this achievement as earned
function GP.IsAchievementCompleted(achievementID)
    local _, _, _, completed = GetAchievementInfo(achievementID)
    return completed or false
end

-- Returns 0-100 percent completion for an achievement
function GP.GetAchievementCompletionPercent(id)
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
function GP.GetAchievementCriteriaProgress(id)
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

function GP.GetTrackedAchievementsList()
    local list = {}
    for id in pairs(GuidePostCharDB.tracked) do
        table.insert(list, id)
    end
    return list
end

function GP.UntrackAchievement(achievementID)
    GuidePostCharDB.tracked[achievementID] = nil
    GP.TomTom.ClearWaypoint()
    EventRegistry:TriggerEvent("GuidePost.ToggleTracking")
end
