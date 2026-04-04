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

-- Create the global namespace here since this file loads first (see .toc).
-- Every other file references it as: local GP = GuidePostNS
GuidePostNS = GuidePostNS or {}
local GP = GuidePostNS

GP.Data = {}

GP.Data.Achievements = {

    -- -------------------------------------------------------------------------
    -- "Pest Control" (ID 2556)
    -- criteriaIndex values verified in-game. mapIDs verified with /gp mapid.
    -- -------------------------------------------------------------------------
    [2556] = {
        id       = 2556,
        name     = "Pest Control",
        category = "General",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Kill a Larva in Ghostlands near Tranquillien (easier than Naxxramas).",
                npc           = "Larva",
                coords        = { x = 45.0, y = 27.0 },
                mapID         = nil,   -- /gp mapid while in Ghostlands
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Kill a Water Snake in Dustwallow Marsh or Zangarmarsh.",
                npc           = "Water Snake",
                coords        = { x = 50.0, y = 50.0 },
                mapID         = nil,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Kill a Spider in Howling Fjord, Ghostlands, or several Northrend dungeons.",
                npc           = "Spider",
                coords        = nil,
                mapID         = nil,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Kill a Squirrel — found in many forested zones like Elwynn Forest or Grizzly Hills.",
                npc           = "Squirrel",
                coords        = { x = 47.0, y = 67.0 },
                mapID         = nil,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Kill an Underbelly Rat in the Dalaran Sewers (enter via the grate in Dalaran).",
                npc           = "Underbelly Rat",
                coords        = { x = 42.0, y = 90.0 },
                mapID         = nil,   -- /gp mapid while in Dalaran
                criteriaIndex = 5,
            },
            {
                index         = 6,
                desc          = "Kill a Devouring Maggot in Howling Fjord (Utgarde Catacombs area, coords 57, 55).",
                npc           = "Devouring Maggot",
                coords        = { x = 57.0, y = 55.0 },
                mapID         = nil,   -- /gp mapid while in Howling Fjord
                criteriaIndex = 6,
            },
            {
                index         = 7,
                desc          = "Kill a Mouse in Westfall. Kill nearby Prairie Dogs first — they block spawns.",
                npc           = "Mouse",
                coords        = { x = 53.0, y = 57.0 },
                mapID         = 52,    -- Westfall (verified)
                criteriaIndex = 7,
            },
            {
                index         = 8,
                desc          = "Kill a Zul'Drak Rat in Zul'Drak near the Amphitheater of Anguish (coords 45, 63).",
                npc           = "Zul'Drak Rat",
                coords        = { x = 45.0, y = 63.0 },
                mapID         = nil,   -- /gp mapid while in Zul'Drak
                criteriaIndex = 8,
            },
            {
                index         = 9,
                desc          = "Kill a Roach in Howling Fjord or Ahn'Kahet.",
                npc           = "Roach",
                coords        = { x = 36.0, y = 11.0 },
                mapID         = nil,
                criteriaIndex = 9,
            },
            {
                index         = 10,
                desc          = "Kill a Snake in Westfall (same farmstead area as the Mouse — two birds, one stone).",
                npc           = "Snake",
                coords        = { x = 53.0, y = 57.0 },
                mapID         = 52,    -- Westfall (verified)
                criteriaIndex = 10,
            },
            {
                index         = 11,
                desc          = "Kill a Crystal Spider inside The Nexus or The Oculus (Coldarra, Northrend).",
                npc           = "Crystal Spider",
                coords        = { x = 27.0, y = 25.0 },
                mapID         = nil,   -- /gp mapid while in Coldarra
                criteriaIndex = 11,
            },
            {
                index         = 12,
                desc          = "Kill an Adder in Hellfire Peninsula (Outland) or Durotar/Barrens.",
                npc           = "Adder",
                coords        = { x = 52.0, y = 50.0 },
                mapID         = nil,   -- /gp mapid while in Hellfire Peninsula
                criteriaIndex = 12,
            },
            {
                index         = 13,
                desc          = "Kill a Maggot in Ghostlands or outside Naxxramas.",
                npc           = "Maggot",
                coords        = { x = 45.0, y = 27.0 },
                mapID         = nil,
                criteriaIndex = 13,
            },
            {
                index         = 14,
                desc          = "Kill a Scorpion in Hellfire Peninsula or Ahn'Qiraj.",
                npc           = "Scorpion",
                coords        = { x = 52.0, y = 50.0 },
                mapID         = nil,
                criteriaIndex = 14,
            },
            {
                index         = 15,
                desc          = "Kill a Fjord Rat in Howling Fjord (Northrend).",
                npc           = "Fjord Rat",
                coords        = { x = 58.0, y = 62.0 },
                mapID         = nil,   -- /gp mapid while in Howling Fjord
                criteriaIndex = 15,
            },
            {
                index         = 16,
                desc          = "Kill a Fire Beetle in Searing Gorge or Burning Steppes.",
                npc           = "Fire Beetle",
                coords        = { x = 53.0, y = 62.0 },
                mapID         = nil,   -- /gp mapid while in Searing Gorge
                criteriaIndex = 16,
            },
            {
                index         = 17,
                desc          = "Kill a Gold Beetle inside Halls of Lightning or Halls of Stone (Storm Peaks).",
                npc           = "Gold Beetle",
                coords        = { x = 42.0, y = 23.0 },
                mapID         = nil,   -- /gp mapid while in Storm Peaks
                criteriaIndex = 17,
            },
            {
                index         = 18,
                desc          = "Kill a Rat in Nagrand, Ghostlands, Booty Bay, or several Northrend dungeons.",
                npc           = "Rat",
                coords        = nil,
                mapID         = nil,
                criteriaIndex = 18,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Explore Durotar" (ID 43)
    -- Use /gp mapid while in Durotar to verify mapID.
    -- Use /gp criteria 43 to get the real criteria IDs.
    -- -------------------------------------------------------------------------
    [43] = {
        id       = 43,
        name     = "Explore Durotar",
        category = "Exploration",
        zone     = "Durotar",
        mapID    = nil,  -- use /gp mapid while in Durotar
        steps = {
            {
                index        = 1,
                desc         = "Visit Razor Hill in southern Durotar.",
                npc          = "Kaltunk (Flight Master)",
                coords       = { x = 52.6, y = 61.6 },
                criteriaIndex = 1,   -- use /gp criteria 43 to verify
            },
            {
                index        = 2,
                desc         = "Head to the Valley of Trials.",
                npc          = nil,
                coords       = { x = 43.0, y = 69.0 },
                criteriaIndex = 2,
            },
            {
                index        = 3,
                desc         = "Visit Sen'jin Village on the coast.",
                npc          = nil,
                coords       = { x = 55.6, y = 74.6 },
                criteriaIndex = 3,
            },
            {
                index        = 4,
                desc         = "Explore the northern border near Skull Rock.",
                npc          = nil,
                coords       = { x = 50.0, y = 28.0 },
                criteriaIndex = 4,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- Elwynn Forest Flash — Skyriding Race (Normal)
    -- Eastern Kingdoms Cup event. Start NPC at coords 64.18, 48.73.
    -- NOTE: This is a timed event race. The Eastern Kingdoms Cup must be active.
    -- Pick up the intro quest from Racing Enthusiast in Stormwind first.
    -- Bronze = easiest time, Gold = hardest. All three share the same start.
    -- -------------------------------------------------------------------------
    [18444] = {
        id       = 18444,
        name     = "Elwynn Forest Flash: Bronze",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,   -- use /gp mapid in Elwynn Forest
        steps = {
            {
                index         = 1,
                desc          = "Pick up the Eastern Kingdoms Cup Circuit quest from Racing Enthusiast in Stormwind (if not already done).",
                npc           = "Racing Enthusiast",
                coords        = { x = 57.0, y = 63.0 },
                mapID         = 84,   -- Stormwind City
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Fly to the race start in eastern Elwynn Forest. Talk to the race NPC and complete the course under the Bronze par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18445] = {
        id       = 18445,
        name     = "Elwynn Forest Flash: Silver",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Same race start as Bronze. Complete the Elwynn Forest Flash course under the Silver par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18446] = {
        id       = 18446,
        name     = "Elwynn Forest Flash: Gold",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Same race start as Bronze/Silver. Complete the Elwynn Forest Flash course under the Gold par time. This is the hardest — learn the rings first on Bronze runs!",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18447] = {
        id       = 18447,
        name     = "Elwynn Forest Flash Advanced: Bronze",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course — same start location, harder route. Complete under the Bronze par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18448] = {
        id       = 18448,
        name     = "Elwynn Forest Flash Advanced: Silver",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Silver par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18449] = {
        id       = 18449,
        name     = "Elwynn Forest Flash Advanced: Gold",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Gold par time. Hardest of the advanced tier.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18450] = {
        id       = 18450,
        name     = "Elwynn Forest Flash Reverse: Bronze",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course — runs the rings in the opposite direction. Complete under the Bronze par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18451] = {
        id       = 18451,
        name     = "Elwynn Forest Flash Reverse: Silver",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Silver par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
            },
        },
    },

    [18452] = {
        id       = 18452,
        name     = "Elwynn Forest Flash Reverse: Gold",
        category = "Skyriding",
        zone     = "Elwynn Forest",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Gold par time.",
                npc           = "Elwynn Forest Flash Race",
                coords        = { x = 64.18, y = 48.73 },
                mapID         = nil,
                criteriaIndex = 1,
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
    --     mapID    = MAP_ID,       -- use /gp mapid while standing in the zone
    --     steps = {
    --         { index=1, desc="...", npc="NPC or nil",
    --           coords={x=0,y=0},
    --           criteriaIndex=1 }, -- use /gp criteria <id> to find the index
    --     },
    -- },
    -- -------------------------------------------------------------------------

    -- -------------------------------------------------------------------------
    -- "Memory of Scholomance" (ID 18368)
    -- Unlocks the original vanilla Scholomance dungeon. Complex multi-step
    -- ritual involving ghost NPCs, candles, and Eva's Journal.
    --
    -- PREREQUISITES before starting:
    --   • Krastinov's Bag of Horrors toy (drop from Doctor Krastinov in Heroic Scholomance)
    --   • At least Honored with Argent Dawn
    --   • Buy in advance: 5x Essence of Undeath, 6x Dark Rune, 1x Righteous Orb,
    --     4x Truesilver Bar, 1x Black Coffee (all from AH)
    --   • If Honored (not Revered): also 6x Large Brilliant Shard, 3x Arcane Crystal, 60g
    --   • If Revered (not Exalted): also 3x Large Brilliant Shard, 2x Arcane Crystal, 30g
    -- -------------------------------------------------------------------------
    [18368] = {
        id       = 18368,
        name     = "Memory of Scholomance",
        category = "Dungeons & Raids",
        zone     = "Scholomance",
        mapID    = nil,   -- use /gp mapid inside Scholomance
        steps = {
            {
                index         = 1,
                desc          = "Run Heroic Scholomance. After killing Rattlegore, watch for Doctor Krastinov to spawn and yell 'The doctor is in!' Kill him to loot Krastinov's Bag of Horrors toy.",
                npc           = "Doctor Theolen Krastinov",
                coords        = { x = 57.0, y = 68.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Clear all of Scholomance to Darkmaster Gandling. After defeating him, enter the top center room and activate Krastinov's Bag of Horrors toy while standing by the old bone pile to summon Eva Sarkhoff.",
                npc           = "Darkmaster Gandling",
                coords        = { x = 56.0, y = 28.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 3,
                desc          = "Deactivate the toy buff so Eva becomes interactable. Talk to Eva Sarkhoff and receive the Inert Spectral Essence. Repair it using the materials you bought.",
                npc           = "Eva Sarkhoff",
                coords        = { x = 56.0, y = 28.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 4,
                desc          = "Before leaving Scholomance, pick up Eva's Femur from the bone pile next to Eva, and grab Eva's Journal from the bookcase in the Viewing Room.",
                npc           = "Eva's Journal (bookcase)",
                coords        = { x = 56.0, y = 28.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 5,
                desc          = "EQUIP your Spectral Essence trinket — you must have it equipped to see the ghost NPCs! Travel to Western Plaguelands (Caer Darrow island near Scholomance).",
                npc           = nil,
                coords        = { x = 69.0, y = 75.0 },
                mapID         = 22,   -- Western Plaguelands
                criteriaIndex = nil,
            },
            {
                index         = 6,
                desc          = "Find Artist Renfray (ghost NPC). Trade him The Road Ahead (found at coords 55, 64 in Eastern Plaguelands) for the Imported Candle.",
                npc           = "Artist Renfray",
                coords        = { x = 65.8, y = 75.4 },
                mapID         = 22,   -- Western Plaguelands
                criteriaIndex = nil,
            },
            {
                index         = 7,
                desc          = "Find Magistrate Marduke (ghost NPC). Trade him The Deed to Andorhal (found at coords 43.6, 69.3 in Western Plaguelands) for the Authentic Andorhal Candle.",
                npc           = "Magistrate Marduke",
                coords        = { x = 70.5, y = 74.0 },
                mapID         = 22,   -- Western Plaguelands
                criteriaIndex = nil,
            },
            {
                index         = 8,
                desc          = "Find Joseph Dirte (ghost NPC). Trade him Caer Darrow Fountain Water (collected from the fountain at coords 68.8, 78.9) for the Stinky Candle.",
                npc           = "Joseph Dirte",
                coords        = { x = 68.0, y = 74.8 },
                mapID         = 22,
                criteriaIndex = nil,
            },
            {
                index         = 9,
                desc          = "Find Sammy (ghost NPC). Trade him the Trampled Doll (found in Eastern Plaguelands at coords 35.7, 83.7) for the Ghost-Warding Candle.",
                npc           = "Sammy",
                coords        = { x = 69.1, y = 78.7 },
                mapID         = 22,
                criteriaIndex = nil,
            },
            {
                index         = 10,
                desc          = "Find Rory (ghost NPC). Trade him the Undelivered Shipment of Smokes (by the fountain on the Live side of Stratholme) for the Tobacco-Filled Candle.",
                npc           = "Rory",
                coords        = { x = 63.4, y = 75.5 },
                mapID         = 22,
                criteriaIndex = nil,
            },
            {
                index         = 11,
                desc          = "Return to Scholomance. Turn RIGHT at the entrance instead of left, and head to the back room full of bones. Use Eva's Journal here to perform the ritual and earn the achievement!",
                npc           = "Eva's Enchanted Journal",
                coords        = { x = 57.0, y = 85.0 },
                mapID         = nil,
                criteriaIndex = 1,   -- single criteria: perform the ritual
            },
        },
    },
}

-- Zone → achievement ID list, populated at load time in AchievementData.lua
GP.Data.ByZone = {}
