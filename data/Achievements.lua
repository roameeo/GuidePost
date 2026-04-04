-- =============================================================================
-- GuidePost: data/Achievements.lua
-- =============================================================================
-- All achievement data lives here.  Each entry follows the same structure so
-- the UI and core systems can loop over them generically.
--
-- HOW TO ADD A NEW ACHIEVEMENT:
--   1. Look up the ID on Wowhead (it's in the URL: /achievement=XXXX)
--   2. Copy a block below, fill in the fields, done.
--
-- COORDINATES: Use the 0-100 scale shown on the world map.
--   Hover the in-game map, or use "/way" in TomTom to find coords.
-- =============================================================================

local GP = GuidePostNS   -- global namespace, set in GuidePost.lua

GP.Data = {}

GP.Data.Achievements = {

    -- -------------------------------------------------------------------------
    -- "Going to Need a Bigger Bag" (ID 2556) – Darkmoon Faire fishing
    -- -------------------------------------------------------------------------
    [2556] = {
        id       = 2556,
        name     = "Going to Need a Bigger Bag",
        category = "Darkmoon Faire",
        zone     = "Darkmoon Island",
        mapID    = 407,
        steps = {
            {
                index    = 1,
                desc     = "Travel to Darkmoon Island (portal in Elwynn Forest / Mulgore during the Faire).",
                npc      = nil,
                coords   = { x = 41.0, y = 72.0 },
                criteria = nil,
            },
            {
                index    = 2,
                desc     = "Equip a Fishing pole and fish in the waters around the Faire.",
                npc      = nil,
                coords   = { x = 51.0, y = 16.0 },
                criteria = nil,
            },
            {
                index    = 3,
                desc     = "Catch a Bloated Rockfish (random drop from the fishing pools).",
                npc      = nil,
                coords   = { x = 51.0, y = 16.0 },
                criteria = 8078,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Explore Durotar" (ID 43)
    -- -------------------------------------------------------------------------
    [43] = {
        id       = 43,
        name     = "Explore Durotar",
        category = "Exploration",
        zone     = "Durotar",
        mapID    = 1,
        steps = {
            {
                index    = 1,
                desc     = "Visit Razor Hill in southern Durotar.",
                npc      = "Kaltunk (Flight Master)",
                coords   = { x = 52.6, y = 61.6 },
                criteria = 395,
            },
            {
                index    = 2,
                desc     = "Head to the Valley of Trials.",
                npc      = nil,
                coords   = { x = 43.0, y = 69.0 },
                criteria = 396,
            },
            {
                index    = 3,
                desc     = "Visit Sen'jin Village on the coast.",
                npc      = nil,
                coords   = { x = 55.6, y = 74.6 },
                criteria = 397,
            },
            {
                index    = 4,
                desc     = "Explore the northern border near Skull Rock.",
                npc      = nil,
                coords   = { x = 50.0, y = 28.0 },
                criteria = 398,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Pest Control" (ID 1159) – steps span multiple zones (each step has mapID)
    -- -------------------------------------------------------------------------
    [1159] = {
        id       = 1159,
        name     = "Pest Control",
        category = "General",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index    = 1,
                desc     = "Kill a Mouse in Stormwind (canals area).",
                npc      = "Mouse",
                coords   = { x = 52.0, y = 66.0 },
                mapID    = 84,
                criteria = 4234,
            },
            {
                index    = 2,
                desc     = "Kill a Cockroach in Undercity (throne room area).",
                npc      = "Cockroach",
                coords   = { x = 49.0, y = 74.0 },
                mapID    = 96,
                criteria = 4235,
            },
            {
                index    = 3,
                desc     = "Kill a Larva in Ghostlands near Tranquillien.",
                npc      = "Larva",
                coords   = { x = 45.0, y = 27.0 },
                mapID    = 196,
                criteria = 4238,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- ADD YOUR OWN BELOW
    -- Template:
    --
    -- [ID] = {
    --     id       = ID,
    --     name     = "Name",
    --     category = "Category",
    --     zone     = "Zone Name",
    --     mapID    = MAP_ID,
    --     steps = {
    --         { index=1, desc="...", npc="NPC or nil",
    --           coords={x=0,y=0}, criteria=NIL_OR_ID },
    --     },
    -- },
    -- -------------------------------------------------------------------------
}

-- Zone → achievement ID list, populated at load time in AchievementData.lua
GP.Data.ByZone = {}
