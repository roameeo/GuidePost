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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
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
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Explore Elwynn Forest" (ID 776)
    -- Reveal all areas of Elwynn Forest on the map.
    -- mapID 37 verified in-game. All criteriaIndex values verified in-game.
    -- -------------------------------------------------------------------------
    [776] = {
        id       = 776,
        name     = "Explore Elwynn Forest",
        category = "Exploration",
        zone     = "Elwynn Forest",
        mapID    = 37,
        steps = {
            {
                index         = 1,
                desc          = "Discover Northshire Valley in the north.",
                npc           = nil,
                coords        = { x = 48.0, y = 22.0 },
                mapID         = 37,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Discover Westbrook Garrison on the western border.",
                npc           = nil,
                coords        = { x = 19.0, y = 50.0 },
                mapID         = 37,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Discover Goldshire in the center of the zone.",
                npc           = nil,
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Discover Fargodeep Mine to the south.",
                npc           = nil,
                coords        = { x = 37.0, y = 81.0 },
                mapID         = 37,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Discover Jerod's Landing on the southwestern shore.",
                npc           = nil,
                coords        = { x = 22.0, y = 75.0 },
                mapID         = 37,
                criteriaIndex = 5,
            },
            {
                index         = 6,
                desc          = "Discover the Tower of Azora in the southeast.",
                npc           = nil,
                coords        = { x = 72.0, y = 72.0 },
                mapID         = 37,
                criteriaIndex = 6,
            },
            {
                index         = 7,
                desc          = "Discover Brackwell Pumpkin Patch in the southeast.",
                npc           = nil,
                coords        = { x = 75.0, y = 58.0 },
                mapID         = 37,
                criteriaIndex = 7,
            },
            {
                index         = 8,
                desc          = "Discover Eastvale Logging Camp in the far east.",
                npc           = nil,
                coords        = { x = 85.0, y = 45.0 },
                mapID         = 37,
                criteriaIndex = 8,
            },
            {
                index         = 9,
                desc          = "Discover Ridgepoint Tower in the eastern hills.",
                npc           = nil,
                coords        = { x = 82.0, y = 70.0 },
                mapID         = 37,
                criteriaIndex = 9,
            },
            {
                index         = 10,
                desc          = "Discover Crystal Lake northeast of Goldshire.",
                npc           = nil,
                coords        = { x = 53.0, y = 55.0 },
                mapID         = 37,
                criteriaIndex = 10,
            },
            {
                index         = 11,
                desc          = "Discover Stone Cairn Lake in the eastern part of the zone.",
                npc           = nil,
                coords        = { x = 67.0, y = 47.0 },
                mapID         = 37,
                criteriaIndex = 11,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "The Fishing Diplomat" (ID 150)
    -- Fish in both Orgrimmar and Stormwind.
    -- -------------------------------------------------------------------------
    [150] = {
        id       = 150,
        name     = "The Fishing Diplomat",
        category = "Professions",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Fish in Orgrimmar — cast your line in the river running through the Valley of Honor.",
                npc           = nil,
                coords        = { x = 51.0, y = 38.0 },
                mapID         = 1454,  -- Orgrimmar (verify with /gp mapid)
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Fish in Stormwind — cast your line in the canals anywhere in the city.",
                npc           = nil,
                coords        = { x = 55.0, y = 32.0 },
                mapID         = 84,    -- Stormwind City
                criteriaIndex = 2,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Stormwind Stockade" (ID 633)
    -- Complete the Stormwind Stockade dungeon.
    -- -------------------------------------------------------------------------
    [633] = {
        id       = 633,
        name     = "Stormwind Stockade",
        category = "Dungeons & Raids",
        zone     = "Stormwind City",
        mapID    = 84,
        steps = {
            {
                index         = 1,
                desc          = "Enter the Stormwind Stockade dungeon in the Canals district of Stormwind and complete it.",
                npc           = nil,
                coords        = { x = 42.6, y = 62.0 },
                mapID         = 84,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Champion of Stormwind" (ID 2781)
    -- Earn the right to represent Stormwind at the Argent Tournament.
    -- -------------------------------------------------------------------------
    [2781] = {
        id       = 2781,
        name     = "Champion of Stormwind",
        category = "Argent Tournament",
        zone     = "Icecrown",
        mapID    = nil,   -- /gp mapid while in Icecrown
        steps = {
            {
                index         = 1,
                desc          = "Travel to the Argent Tournament Grounds in Icecrown (far northeast).",
                npc           = nil,
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Speak with the Stormwind Aspirant and complete the daily jousting quests to earn 25 Champion's Seals. Then complete The Valiant's Challenge to become Champion.",
                npc           = "Stormwind Aspirant",
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Exalted Champion of Stormwind" (ID 2764)
    -- Reach Exalted with Stormwind AND earn Champion status at the Tournament.
    -- -------------------------------------------------------------------------
    [2764] = {
        id       = 2764,
        name     = "Exalted Champion of Stormwind",
        category = "Argent Tournament",
        zone     = "Icecrown",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Reach Exalted reputation with Stormwind. Do Stormwind quests, daily SW quests, or buy Stormwind rep tokens from the DMF.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Earn Champion of Stormwind at the Argent Tournament (complete The Valiant's Challenge for the Human faction).",
                npc           = "Stormwind Aspirant",
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = 2,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Let's Do Lunch: Stormwind" (ID 5474)
    -- Purchase and eat 5 specific foods from vendors around Stormwind.
    -- -------------------------------------------------------------------------
    [5474] = {
        id       = 5474,
        name     = "Let's Do Lunch: Stormwind",
        category = "Exploration",
        zone     = "Stormwind City",
        mapID    = 84,
        steps = {
            {
                index         = 1,
                desc          = "Buy and eat A Fisherman's Feast from a food vendor near the Stormwind docks.",
                npc           = "Food Vendor",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Buy and eat Feeling Crabby? from a food vendor in the Trade District.",
                npc           = "Food Vendor",
                coords        = { x = 57.0, y = 63.0 },
                mapID         = 84,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Buy and eat Orphans Like Cookies Too! from a vendor in the Mage Quarter.",
                npc           = "Food Vendor",
                coords        = { x = 37.0, y = 78.0 },
                mapID         = 84,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Buy and eat Penny's Pumpkin Pancakes from a vendor in Old Town.",
                npc           = "Food Vendor",
                coords        = { x = 73.0, y = 53.0 },
                mapID         = 84,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Buy and eat The King's Cider from a vendor in the Dwarven District.",
                npc           = "Food Vendor",
                coords        = { x = 62.0, y = 39.0 },
                mapID         = 84,
                criteriaIndex = 5,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Fish or Cut Bait: Stormwind" (ID 5476)
    -- Complete 5 specific fishing daily quests in Stormwind.
    -- Pick up dailies from Gubber Blump on the Stormwind docks.
    -- -------------------------------------------------------------------------
    [5476] = {
        id       = 5476,
        name     = "Fish or Cut Bait: Stormwind",
        category = "Professions",
        zone     = "Stormwind City",
        mapID    = 84,
        steps = {
            {
                index         = 1,
                desc          = "Complete the daily fishing quest 'Hitting a Walleye' from Gubber Blump on the Stormwind docks.",
                npc           = "Gubber Blump",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Complete the daily fishing quest 'Diggin' for Worms' from Gubber Blump.",
                npc           = "Gubber Blump",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Complete the daily fishing quest 'Rock Lobster' from Gubber Blump.",
                npc           = "Gubber Blump",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Complete the daily fishing quest 'Big Gulp' from Gubber Blump.",
                npc           = "Gubber Blump",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Complete the daily fishing quest 'Thunder Falls' from Gubber Blump.",
                npc           = "Gubber Blump",
                coords        = { x = 63.0, y = 23.0 },
                mapID         = 84,
                criteriaIndex = 5,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Hogger kills (Stormwind Stockade)" (ID 6138)
    -- Kill Hogger inside the Stormwind Stockade dungeon.
    -- -------------------------------------------------------------------------
    [6138] = {
        id       = 6138,
        name     = "Hogger kills (Stormwind Stockade)",
        category = "Dungeons & Raids",
        zone     = "Stormwind City",
        mapID    = 84,
        steps = {
            {
                index         = 1,
                desc          = "Enter the Stormwind Stockade dungeon and kill Hogger. He is a boss found in the main hall.",
                npc           = "Hogger",
                coords        = { x = 42.6, y = 62.0 },
                mapID         = 84,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Horrific Vision of Stormwind" (ID 14062)
    -- Defeat Alleria in the Horrific Vision of Stormwind.
    -- Access via MOTHER in the Chamber of Heart or Stormwind portal during event.
    -- -------------------------------------------------------------------------
    [14062] = {
        id       = 14062,
        name     = "Horrific Vision of Stormwind",
        category = "Dungeons & Raids",
        zone     = "Dornogal",
        mapID    = nil,   -- /gp mapid while in Dornogal
        steps = {
            {
                index         = 1,
                desc          = "Enter via MOTHER in Dornogal (The War Within hub). The portal rotates between Stormwind and Orgrimmar each week.",
                npc           = "MOTHER",
                coords        = { x = 47.0, y = 52.0 },
                mapID         = nil,   -- /gp mapid while in Dornogal
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Clear through the vision and defeat Corrupted Alleria Windrunner as the final boss.",
                npc           = "Corrupted Alleria Windrunner",
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "The Even More Horrific Vision of Stormwind" (ID 14064)
    -- Complete ALL objectives in the Horrific Vision of Stormwind in one visit.
    -- -------------------------------------------------------------------------
    [14064] = {
        id       = 14064,
        name     = "The Even More Horrific Vision of Stormwind",
        category = "Dungeons & Raids",
        zone     = "Dornogal",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete EVERY objective area in the Horrific Vision of Stormwind in a single run. This includes all 5 districts: Trade, Mage, Cathedral, Old Town, and Dwarven.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "The Most Horrific Vision of Stormwind" (ID 14066)
    -- Complete all objectives in one visit with all 5 Faceless Masks active.
    -- -------------------------------------------------------------------------
    [14066] = {
        id       = 14066,
        name     = "The Most Horrific Vision of Stormwind",
        category = "Dungeons & Raids",
        zone     = "Dornogal",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Equip all 5 Faceless Masks before entering the vision. These are earned from completing the vision multiple times.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Complete ALL objectives in the Horrific Vision of Stormwind in a single visit with all 5 masks active. This is extremely difficult — max gear and full sanity management required.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Mad World" (ID 14140)
    -- Solo clear BOTH Horrific Visions (SW and Org) with all 5 Faceless Masks.
    -- Reintroduced in patch 11.1.5 with Revisited Horrific Visions.
    -- -------------------------------------------------------------------------
    [14140] = {
        id       = 14140,
        name     = "Mad World",
        category = "Dungeons & Raids",
        zone     = "Dornogal",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Solo clear the Horrific Vision of Stormwind with all 5 Faceless Masks active, completing every objective in one visit.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Solo clear the Horrific Vision of Orgrimmar with all 5 Faceless Masks active, completing every objective in one visit. Must be done without a party.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Solo Nightmares - Stormwind" (ID 14141)
    -- Hidden Feat of Strength. Fires automatically when you solo the Horrific
    -- Vision of Stormwind. No criteria tracking — just complete it alone.
    -- -------------------------------------------------------------------------
    [14141] = {
        id       = 14141,
        name     = "Solo Nightmares - Stormwind",
        category = "Feats of Strength",
        zone     = "Dornogal",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Horrific Vision of Stormwind entirely solo (no party). The achievement fires automatically — it won't appear in your achievement list until earned.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
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
                criteriaIndex = nil,  -- verify with /gp criteria 18368
            },
        },
    },

    -- =========================================================================
    -- THE CAPE OF STRANGLETHORN (mapID 210)
    -- =========================================================================

    [4995] = {
        id       = 4995,
        name     = "Explore the Cape of Stranglethorn",
        category = "Exploration",
        zone     = "The Cape of Stranglethorn",
        mapID    = 210,
        steps = {
            { index=1,  desc="Discover Booty Bay.",               npc=nil, coords={x=36.0,y=72.0}, mapID=210, criteriaIndex=1  },
            { index=2,  desc="Discover Crystalvein Mine.",         npc=nil, coords={x=70.0,y=36.0}, mapID=210, criteriaIndex=2  },
            { index=3,  desc="Discover Gurubashi Arena.",          npc=nil, coords={x=47.0,y=40.0}, mapID=210, criteriaIndex=3  },
            { index=4,  desc="Discover Hardwrench Hideaway.",      npc=nil, coords={x=57.0,y=84.0}, mapID=210, criteriaIndex=4  },
            { index=5,  desc="Discover Jaquero Isle.",             npc=nil, coords={x=69.0,y=90.0}, mapID=210, criteriaIndex=5  },
            { index=6,  desc="Discover Mistvale Valley.",          npc=nil, coords={x=60.0,y=52.0}, mapID=210, criteriaIndex=6  },
            { index=7,  desc="Discover Nek'mani Wellspring.",      npc=nil, coords={x=76.0,y=55.0}, mapID=210, criteriaIndex=7  },
            { index=8,  desc="Discover Ruins of Aboraz.",          npc=nil, coords={x=80.0,y=69.0}, mapID=210, criteriaIndex=8  },
            { index=9,  desc="Discover Ruins of Jubuwal.",         npc=nil, coords={x=54.0,y=29.0}, mapID=210, criteriaIndex=9  },
            { index=10, desc="Discover The Wild Shore.",           npc=nil, coords={x=23.0,y=50.0}, mapID=210, criteriaIndex=10 },
        },
    },

    [4905] = {
        id       = 4905,
        name     = "Cape of Stranglethorn Quests",
        category = "Quests",
        zone     = "The Cape of Stranglethorn",
        mapID    = 210,
        steps = {
            { index=1, desc="Complete The Trolls of Zul'Gurub quest chain.",  npc=nil, coords={x=47.0,y=40.0}, mapID=210, criteriaIndex=1 },
            { index=2, desc="Complete the Bustling Booty Bay quest chain.",    npc=nil, coords={x=36.0,y=72.0}, mapID=210, criteriaIndex=2 },
            { index=3, desc="Complete A Pirate's Life For You quest chain.",   npc=nil, coords={x=36.0,y=72.0}, mapID=210, criteriaIndex=3 },
            { index=4, desc="Complete the Bloodsail and Brashtide quest chain.", npc=nil, coords={x=36.0,y=72.0}, mapID=210, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- NORTHERN STRANGLETHORN (mapID 50)
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Northern Stranglethorn" (ID 781)
    -- -------------------------------------------------------------------------
    [781] = {
        id       = 781,
        name     = "Explore Northern Stranglethorn",
        category = "Exploration",
        zone     = "Northern Stranglethorn",
        mapID    = 50,
        steps = {
            { index=1,  desc="Discover Grom'gol Base Camp.",       npc=nil, coords={x=39.0,y=50.0}, mapID=50, criteriaIndex=1  },
            { index=2,  desc="Discover Balia'mah Ruins.",           npc=nil, coords={x=36.0,y=26.0}, mapID=50, criteriaIndex=2  },
            { index=3,  desc="Discover Bambala.",                   npc=nil, coords={x=46.0,y=16.0}, mapID=50, criteriaIndex=3  },
            { index=4,  desc="Discover Fort Livingston.",           npc=nil, coords={x=53.0,y=73.0}, mapID=50, criteriaIndex=4  },
            { index=5,  desc="Discover Zuuldaia Ruins.",            npc=nil, coords={x=27.0,y=20.0}, mapID=50, criteriaIndex=5  },
            { index=6,  desc="Discover Nesingwary's Expedition.",   npc=nil, coords={x=42.0,y=36.0}, mapID=50, criteriaIndex=6  },
            { index=7,  desc="Discover Rebel Camp.",                npc=nil, coords={x=46.0,y=10.0}, mapID=50, criteriaIndex=7  },
            { index=8,  desc="Discover Kurzen's Compound.",         npc=nil, coords={x=49.0,y=12.0}, mapID=50, criteriaIndex=8  },
            { index=9,  desc="Discover Kal'ai Ruins.",              npc=nil, coords={x=55.0,y=22.0}, mapID=50, criteriaIndex=9  },
            { index=10, desc="Discover Mizjah Ruins.",              npc=nil, coords={x=65.0,y=27.0}, mapID=50, criteriaIndex=10 },
            { index=11, desc="Discover Mosh'Ogg Ogre Mound.",      npc=nil, coords={x=64.0,y=47.0}, mapID=50, criteriaIndex=11 },
            { index=12, desc="Discover Lake Nazferiti.",            npc=nil, coords={x=59.0,y=56.0}, mapID=50, criteriaIndex=12 },
            { index=13, desc="Discover Bal'lal Ruins.",             npc=nil, coords={x=49.0,y=60.0}, mapID=50, criteriaIndex=13 },
            { index=14, desc="Discover The Vile Reef.",             npc=nil, coords={x=21.0,y=58.0}, mapID=50, criteriaIndex=14 },
            { index=15, desc="Discover Ruins of Zul'Kunda.",        npc=nil, coords={x=30.0,y=72.0}, mapID=50, criteriaIndex=15 },
            { index=16, desc="Discover Zul'Gurub.",                 npc=nil, coords={x=72.0,y=35.0}, mapID=50, criteriaIndex=16 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Northern Stranglethorn Quests" (ID 4906)
    -- -------------------------------------------------------------------------
    [4906] = {
        id       = 4906,
        name     = "Northern Stranglethorn Quests",
        category = "Quests",
        zone     = "Northern Stranglethorn",
        mapID    = 50,
        steps = {
            { index=1, desc="Complete the Ohgan'aka quest chain in Northern Stranglethorn.",          npc=nil, coords={x=42.0,y=36.0}, mapID=50, criteriaIndex=1 },
            { index=2, desc="Complete the Rebel Camp quest chain (northern border of the zone).",     npc=nil, coords={x=46.0,y=10.0}, mapID=50, criteriaIndex=2 },
            { index=3, desc="Complete Nesingwary's Expedition quests in the central jungle.",         npc="Hemet Nesingwary", coords={x=42.0,y=36.0}, mapID=50, criteriaIndex=3 },
        },
    },


    -- -------------------------------------------------------------------------
    -- "Explore Duskwood" (ID 778)
    -- -------------------------------------------------------------------------
    [778] = {
        id       = 778,
        name     = "Explore Duskwood",
        category = "Exploration",
        zone     = "Duskwood",
        mapID    = 47,
        steps = {
            { index=1,  desc="Discover The Hushed Bank.",             npc=nil, coords={x=71.0,y=31.0}, mapID=47, criteriaIndex=1  },
            { index=2,  desc="Discover Addle's Stead.",               npc=nil, coords={x=20.0,y=27.0}, mapID=47, criteriaIndex=2  },
            { index=3,  desc="Discover Raven Hill.",                  npc=nil, coords={x=19.0,y=52.0}, mapID=47, criteriaIndex=3  },
            { index=4,  desc="Discover Raven Hill Cemetery.",         npc=nil, coords={x=16.0,y=44.0}, mapID=47, criteriaIndex=4  },
            { index=5,  desc="Discover Vul'Gol Ogre Mound.",         npc=nil, coords={x=35.0,y=75.0}, mapID=47, criteriaIndex=5  },
            { index=6,  desc="Discover Twilight Grove.",              npc=nil, coords={x=48.0,y=46.0}, mapID=47, criteriaIndex=6  },
            { index=7,  desc="Discover The Yorgen Farmstead.",        npc=nil, coords={x=64.0,y=51.0}, mapID=47, criteriaIndex=7  },
            { index=8,  desc="Discover Brightwood Grove.",            npc=nil, coords={x=79.0,y=51.0}, mapID=47, criteriaIndex=8  },
            { index=9,  desc="Discover The Rotting Orchard.",         npc=nil, coords={x=68.0,y=37.0}, mapID=47, criteriaIndex=9  },
            { index=10, desc="Discover Tranquil Gardens Cemetery.",   npc=nil, coords={x=55.0,y=24.0}, mapID=47, criteriaIndex=10 },
            { index=11, desc="Discover Darkshire (main town).",       npc=nil, coords={x=73.0,y=52.0}, mapID=47, criteriaIndex=11 },
            { index=12, desc="Discover Manor Mistmantle.",            npc=nil, coords={x=86.0,y=30.0}, mapID=47, criteriaIndex=12 },
            { index=13, desc="Discover The Darkened Bank.",           npc=nil, coords={x=82.0,y=22.0}, mapID=47, criteriaIndex=13 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Duskwood Quests" (ID 12430)
    -- -------------------------------------------------------------------------
    [12430] = {
        id       = 12430,
        name     = "Duskwood Quests",
        category = "Quests",
        zone     = "Duskwood",
        mapID    = 47,
        steps = {
            { index=1, desc="Complete 'The Legend of Stalvan' chain — start with Clerk Daltry in Darkshire.",  npc="Clerk Daltry",      coords={x=73.0,y=52.0}, mapID=47, criteriaIndex=1 },
            { index=2, desc="Complete the 'Morbent Fel' chain — start with Abercrombie west of Darkshire.",    npc="Abercrombie",       coords={x=27.0,y=46.0}, mapID=47, criteriaIndex=2 },
            { index=3, desc="Complete 'A Hermit's Errand' chain — start with Blind Mary near Raven Hill.",     npc="Blind Mary",        coords={x=20.0,y=46.0}, mapID=47, criteriaIndex=3 },
            { index=4, desc="Complete the 'Mor'ladim' chain — start with Watchman Doomgrip in Darkshire.",     npc="Watchman Doomgrip", coords={x=73.0,y=52.0}, mapID=47, criteriaIndex=4 },
            { index=5, desc="Complete the 'Citizens of Darkshire' chain — start with Mayor Langston.",         npc="Mayor Langston",    coords={x=73.0,y=52.0}, mapID=47, criteriaIndex=5 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Westfall & Duskwood Quests" (ID 12455)
    -- -------------------------------------------------------------------------
    [12455] = {
        id       = 12455,
        name     = "Westfall & Duskwood Quests",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete all Westfall quests (see Westfall Quests achievement for details).",  npc=nil, coords={x=53.0,y=57.0}, mapID=52, criteriaIndex=1 },
            { index=2, desc="Complete all Duskwood quests (see Duskwood Quests achievement for details).",  npc=nil, coords={x=73.0,y=52.0}, mapID=47, criteriaIndex=2 },
        },
    },

    -- =========================================================================
    -- ISLE OF QUEL'DANAS (mapID 2424)
    -- =========================================================================

    [868] = {
        id       = 868,
        name     = "Explore Isle of Quel'Danas",
        category = "Exploration",
        zone     = "Isle of Quel'Danas",
        mapID    = 2424,
        steps = {
            {
                index         = 1,
                desc          = "Explore the Isle of Quel'Danas — the small island north of Eversong Woods. Simply travel around the island to reveal the map.",
                npc           = nil,
                coords        = { x = 54.0, y = 43.0 },
                mapID         = 2424,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- SILVERMOON CITY (mapID 2393)
    -- =========================================================================

    -- =========================================================================
    -- WORLD EVENTS (Holiday Achievements)
    -- These achievements span multiple zones and cities.
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- NOBLEGARDEN (April — Easter week)
    -- Alliance egg locations: Goldshire, Kharanos, Azure Watch, Dolanaar,
    --                         Valdrakken, Dornogal
    -- -------------------------------------------------------------------------

    -- "Noble Garden" (ID 2420) — Hide a Brightly Colored Egg in Stormwind
    [2420] = {
        id       = 2420,
        name     = "Noble Garden",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "During Noblegarden, collect eggs in Goldshire (main Alliance hub). Buy a Noblegarden Egg from the Noblegarden Vendor for 5 Chocolates.",
                npc           = "Noblegarden Vendor",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,   -- Elwynn Forest / Goldshire
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Hide your Noblegarden Egg anywhere in Stormwind City to complete the achievement.",
                npc           = nil,
                coords        = { x = 57.0, y = 63.0 },
                mapID         = 84,   -- Stormwind City
                criteriaIndex = nil,
            },
        },
    },

    -- "I Found One!" (ID 2416) — Loot your first Brightly Colored Egg
    [2416] = {
        id       = 2416,
        name     = "I Found One!",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "During Noblegarden, find and loot any Brightly Colored Egg. Head to Goldshire in Elwynn Forest — eggs are scattered around the town.",
                npc           = "Brightly Colored Egg",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,
                criteriaIndex = nil,
            },
        },
    },

    -- "Chocoholic" (ID 2417) — Eat 100 Noblegarden Chocolates
    [2417] = {
        id       = 2417,
        name     = "Chocoholic",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Collect and eat 100 Noblegarden Chocolates from Brightly Colored Eggs. Goldshire is the best Alliance farming spot — run laps around town picking up eggs.",
                npc           = "Brightly Colored Egg",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,
                criteriaIndex = nil,
            },
        },
    },

    -- "Spring Fling" (ID 2422) — Find your Spring Rabbit a friend in 4 towns
    [2422] = {
        id       = 2422,
        name     = "Spring Fling",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Get a Spring Rabbit's Foot from an egg or buy it for 100 Chocolates. Have it summoned and find another player's Spring Rabbit in Goldshire.",
                npc           = "Spring Rabbit",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,   -- Goldshire
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Find another Spring Rabbit in Kharanos (Dun Morogh).",
                npc           = "Spring Rabbit",
                coords        = { x = 46.0, y = 64.0 },
                mapID         = 27,   -- Dun Morogh
                criteriaIndex = nil,
            },
            {
                index         = 3,
                desc          = "Find another Spring Rabbit in Azure Watch (Azuremyst Isle).",
                npc           = "Spring Rabbit",
                coords        = { x = 49.0, y = 52.0 },
                mapID         = nil,  -- Azuremyst Isle
                criteriaIndex = nil,
            },
            {
                index         = 4,
                desc          = "Find another Spring Rabbit in Dolanaar (Teldrassil) or Darnassus.",
                npc           = "Spring Rabbit",
                coords        = { x = 55.0, y = 58.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- "Hard Boiled" (ID 2418) — Lay an egg in Un'Goro Crater
    [2418] = {
        id       = 2418,
        name     = "Hard Boiled",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Collect eggs in Goldshire until you receive the Noblegarden Bunny buff (turns you into a rabbit). Do NOT break the buff — don't mount or take damage.",
                npc           = "Brightly Colored Egg",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "While transformed as a rabbit, travel to the Golakka Hot Springs in Un'Goro Crater and stand there for 1 minute to lay an egg. Use a friend's Blossoming Branch or wait for the buff naturally.",
                npc           = nil,
                coords        = { x = 47.0, y = 49.0 },
                mapID         = nil,  -- Un'Goro Crater
                criteriaIndex = nil,
            },
        },
    },

    -- "Desert Rose" (ID 2423) — Plant flowers in 5 deserts using Spring Robes
    [2423] = {
        id       = 2423,
        name     = "Desert Rose",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            { index=1, desc="Buy Spring Robes from the Noblegarden Vendor (50 Chocolates). Equip them and use the Spring Robes ability in Desolace.",        npc=nil, coords={x=47.0,y=55.0}, mapID=nil, criteriaIndex=nil },
            { index=2, desc="Use Spring Robes in the Badlands.",   npc=nil, coords={x=52.0,y=47.0}, mapID=15,  criteriaIndex=nil },
            { index=3, desc="Use Spring Robes in Thousand Needles.", npc=nil, coords={x=47.0,y=50.0}, mapID=nil, criteriaIndex=nil },
            { index=4, desc="Use Spring Robes in Tanaris.",         npc=nil, coords={x=51.0,y=28.0}, mapID=nil, criteriaIndex=nil },
            { index=5, desc="Use Spring Robes in Silithus.",        npc=nil, coords={x=48.0,y=40.0}, mapID=nil, criteriaIndex=nil },
        },
    },

    -- "Shake Your Bunny-Maker" (ID 2419) — Place rabbit ears on females of every race
    [2419] = {
        id       = 2419,
        name     = "Shake Your Bunny-Maker",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Buy Spring Flowers from the Noblegarden Vendor (50 Chocolates). Use them on a female character of each race (level 18+). Best done in a capital city with lots of players around.",
                npc           = "Noblegarden Vendor",
                coords        = { x = 42.0, y = 65.0 },
                mapID         = 37,
                criteriaIndex = nil,
            },
        },
    },

    -- "Noble Gardener" meta-achievement (ID 2762)
    [2762] = {
        id       = 2762,
        name     = "Noble Gardener",
        category = "World Events",
        zone     = "World Events",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete: I Found One! (find a Brightly Colored Egg).",          npc=nil, coords={x=42.0,y=65.0}, mapID=37, criteriaIndex=nil },
            { index=2, desc="Complete: Chocoholic (eat 100 Noblegarden Chocolates).",          npc=nil, coords={x=42.0,y=65.0}, mapID=37, criteriaIndex=nil },
            { index=3, desc="Complete: Noble Garden (hide an egg in Stormwind).",              npc=nil, coords={x=57.0,y=63.0}, mapID=84, criteriaIndex=nil },
            { index=4, desc="Complete: Hard Boiled (lay an egg in Un'Goro as a rabbit).",     npc=nil, coords={x=47.0,y=49.0}, mapID=nil, criteriaIndex=nil },
            { index=5, desc="Complete: Desert Rose (plant flowers in 5 deserts).",            npc=nil, coords=nil,             mapID=nil, criteriaIndex=nil },
            { index=6, desc="Complete: Spring Fling (Spring Rabbit friend in 4 towns).",      npc=nil, coords=nil,             mapID=nil, criteriaIndex=nil },
            { index=7, desc="Complete: Shake Your Bunny-Maker (rabbit ears on every race).",  npc=nil, coords=nil,             mapID=nil, criteriaIndex=nil },
            { index=8, desc="Complete: Dressed for the Occasion OR Sunday's Finest (find the Elegant Dress or Tuxedo from eggs).", npc=nil, coords={x=42.0,y=65.0}, mapID=37, criteriaIndex=nil },
        },
    },

    [2785] = {
        id       = 2785,
        name     = "Champion of Silvermoon City",
        category = "Argent Tournament",
        zone     = "Icecrown",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Travel to the Argent Tournament Grounds in Icecrown and speak with the Silvermoon City Aspirant. Complete the jousting dailies and The Valiant's Challenge to earn Champion status.",
                npc           = "Silvermoon City Aspirant",
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    [2767] = {
        id       = 2767,
        name     = "Exalted Champion of Silvermoon City",
        category = "Argent Tournament",
        zone     = "Icecrown",
        mapID    = nil,
        steps = {
            { index=1, desc="Reach Exalted reputation with Silvermoon City.",                                                              npc=nil, coords=nil,              mapID=nil, criteriaIndex=1 },
            { index=2, desc="Earn Champion of Silvermoon City at the Argent Tournament (complete The Valiant's Challenge for Blood Elves).", npc="Silvermoon City Aspirant", coords={x=74.0,y=20.0}, mapID=nil, criteriaIndex=2 },
        },
    },

    -- =========================================================================
    -- EVERSONG WOODS (mapID 2395) — Blood Elf starting zone
    -- =========================================================================

    [859] = {
        id       = 859,
        name     = "Explore Eversong Woods (Burning Crusade)",
        category = "Exploration",
        zone     = "Eversong Woods",
        mapID    = 2395,
        steps = {
            { index=1,  desc="Discover Sunstrider Isle.",        npc=nil, coords={x=56.0,y=16.0}, mapID=2395, criteriaIndex=1  },
            { index=2,  desc="Discover Ruins of Silvermoon.",    npc=nil, coords={x=78.0,y=27.0}, mapID=2395, criteriaIndex=2  },
            { index=3,  desc="Discover West Sanctum.",           npc=nil, coords={x=27.0,y=47.0}, mapID=2395, criteriaIndex=3  },
            { index=4,  desc="Discover Sunsail Anchorage.",      npc=nil, coords={x=17.0,y=36.0}, mapID=2395, criteriaIndex=4  },
            { index=5,  desc="Discover North Sanctum.",          npc=nil, coords={x=43.0,y=26.0}, mapID=2395, criteriaIndex=5  },
            { index=6,  desc="Discover East Sanctum.",           npc=nil, coords={x=64.0,y=36.0}, mapID=2395, criteriaIndex=6  },
            { index=7,  desc="Discover Farstrider Retreat.",     npc=nil, coords={x=73.0,y=51.0}, mapID=2395, criteriaIndex=7  },
            { index=8,  desc="Discover Stillwhisper Pond.",      npc=nil, coords={x=49.0,y=43.0}, mapID=2395, criteriaIndex=8  },
            { index=9,  desc="Discover Duskwither Grounds.",     npc=nil, coords={x=67.0,y=43.0}, mapID=2395, criteriaIndex=9  },
            { index=10, desc="Discover Fairbreeze Village.",     npc=nil, coords={x=47.0,y=68.0}, mapID=2395, criteriaIndex=10 },
            { index=11, desc="Discover The Living Wood.",        npc=nil, coords={x=35.0,y=63.0}, mapID=2395, criteriaIndex=11 },
            { index=12, desc="Discover Tor'Watha.",              npc=nil, coords={x=25.0,y=74.0}, mapID=2395, criteriaIndex=12 },
            { index=13, desc="Discover The Scorched Grove.",     npc=nil, coords={x=55.0,y=55.0}, mapID=2395, criteriaIndex=13 },
            { index=14, desc="Discover Silvermoon City.",        npc=nil, coords={x=68.0,y=32.0}, mapID=2395, criteriaIndex=14 },
            { index=15, desc="Discover Azurebreeze Coast.",      npc=nil, coords={x=17.0,y=56.0}, mapID=2395, criteriaIndex=15 },
            { index=16, desc="Discover Elrendar Falls.",         npc=nil, coords={x=82.0,y=65.0}, mapID=2395, criteriaIndex=16 },
            { index=17, desc="Discover Goldenbough Pass.",       npc=nil, coords={x=72.0,y=78.0}, mapID=2395, criteriaIndex=17 },
            { index=18, desc="Discover Lake Elrendar.",          npc=nil, coords={x=76.0,y=72.0}, mapID=2395, criteriaIndex=18 },
            { index=19, desc="Discover Runestone Falithas.",     npc=nil, coords={x=30.0,y=36.0}, mapID=2395, criteriaIndex=19 },
            { index=20, desc="Discover Runestone Shan'dor.",     npc=nil, coords={x=55.0,y=34.0}, mapID=2395, criteriaIndex=20 },
            { index=21, desc="Discover Saltheril's Haven.",      npc=nil, coords={x=36.0,y=76.0}, mapID=2395, criteriaIndex=21 },
            { index=22, desc="Discover Golden Strand.",          npc=nil, coords={x=26.0,y=86.0}, mapID=2395, criteriaIndex=22 },
            { index=23, desc="Discover Thuron's Livery.",        npc=nil, coords={x=57.0,y=75.0}, mapID=2395, criteriaIndex=23 },
            { index=24, desc="Discover Tranquil Shore.",         npc=nil, coords={x=66.0,y=88.0}, mapID=2395, criteriaIndex=24 },
            { index=25, desc="Discover Zeb'Watha.",              npc=nil, coords={x=78.0,y=83.0}, mapID=2395, criteriaIndex=25 },
        },
    },

    -- =========================================================================
    -- ZUL'AMAN (mapID 2437) — Heroic Dungeon
    -- =========================================================================

    [691] = {
        id       = 691,
        name     = "Zul'Aman (Burning Crusade)",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Complete the original Zul'Aman raid (Burning Crusade era). Requires completing all bosses.", npc=nil, coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [1084] = {
        id       = 1084,
        name     = "Zul'jin kills (Zul'Aman)",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Kill Zul'jin, the final boss of the original Zul'Aman raid.", npc="Zul'jin", coords=nil, mapID=2437, criteriaIndex=1 },
        },
    },

    [5769] = {
        id       = 5769,
        name     = "Heroic: Zul'Aman",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Queue for Heroic Zul'Aman via the Dungeon Finder or enter directly. Complete all 6 bosses including Daakara.", npc=nil, coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [5773] = {
        id       = 5773,
        name     = "Daakara kills (Heroic Zul'Aman)",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Kill Daakara, the final boss of Heroic Zul'Aman.", npc="Daakara", coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [5750] = {
        id       = 5750,
        name     = "Tunnel Vision",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Defeat Halazzi (4th boss) on Heroic difficulty without killing any of his totems. Burn him down fast before the totems become a problem.", npc="Halazzi", coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [5760] = {
        id       = 5760,
        name     = "Ring Out!",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Defeat Daakara (final boss) on Heroic without any player leaving the turquoise rectangle on his platform. Stay inside the marked area for the entire fight.", npc="Daakara", coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [5858] = {
        id       = 5858,
        name     = "Bear-ly Made It",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1, desc="Save all 4 prisoners before they are sacrificed on Heroic difficulty. Kill the first 4 bosses quickly — a timer starts when you enter. Reward: chance at Amani Battle Bear mount!", npc=nil, coords=nil, mapID=2437, criteriaIndex=nil },
        },
    },

    [5761] = {
        id       = 5761,
        name     = "Hex Mix",
        category = "Dungeons & Raids",
        zone     = "Zul'Aman",
        mapID    = 2437,
        steps = {
            { index=1,  desc="Save Rosa — use an Amani Hex Stick on a Forest Frog around the instance until Rosa is freed.",     npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=1  },
            { index=2,  desc="Save Eulinda.",    npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=2  },
            { index=3,  desc="Save Lenzo.",      npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=3  },
            { index=4,  desc="Save Melasong.",   npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=4  },
            { index=5,  desc="Save Harald.",     npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=5  },
            { index=6,  desc="Save Relissa.",    npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=6  },
            { index=7,  desc="Save Kaldrick.",   npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=7  },
            { index=8,  desc="Save Arinoth.",    npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=8  },
            { index=9,  desc="Save Micah.",      npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=9  },
            { index=10, desc="Save Tyllan.",     npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=10 },
            { index=11, desc="Save Mawago.",     npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=11 },
            { index=12, desc="Save Melissa.",    npc="Forest Frog", coords=nil, mapID=2437, criteriaIndex=12 },
        },
    },

    -- =========================================================================
    -- EASTERN PLAGUELANDS (mapID 23)
    -- =========================================================================

    [771] = {
        id       = 771,
        name     = "Explore Eastern Plaguelands",
        category = "Exploration",
        zone     = "Eastern Plaguelands",
        mapID    = 23,
        steps = {
            { index=1,  desc="Discover Thondroril River.",              npc=nil, coords={x=18.0,y=52.0}, mapID=23, criteriaIndex=1  },
            { index=2,  desc="Discover The Marris Stead.",              npc=nil, coords={x=44.0,y=65.0}, mapID=23, criteriaIndex=2  },
            { index=3,  desc="Discover The Undercroft.",                npc=nil, coords={x=68.0,y=76.0}, mapID=23, criteriaIndex=3  },
            { index=4,  desc="Discover Crown Guard Tower.",             npc=nil, coords={x=33.0,y=56.0}, mapID=23, criteriaIndex=4  },
            { index=5,  desc="Discover The Fungal Vale.",               npc=nil, coords={x=58.0,y=19.0}, mapID=23, criteriaIndex=5  },
            { index=6,  desc="Discover Darrowshire.",                   npc=nil, coords={x=82.0,y=69.0}, mapID=23, criteriaIndex=6  },
            { index=7,  desc="Discover Pestilent Scar.",                npc=nil, coords={x=44.0,y=46.0}, mapID=23, criteriaIndex=7  },
            { index=8,  desc="Discover Corin's Crossing.",              npc=nil, coords={x=55.0,y=52.0}, mapID=23, criteriaIndex=8  },
            { index=9,  desc="Discover Lake Mereldar.",                 npc=nil, coords={x=72.0,y=59.0}, mapID=23, criteriaIndex=9  },
            { index=10, desc="Discover Tyr's Hand.",                    npc=nil, coords={x=75.0,y=45.0}, mapID=23, criteriaIndex=10 },
            { index=11, desc="Discover Light's Hope Chapel.",           npc=nil, coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=11 },
            { index=12, desc="Discover The Infectis Scar.",             npc=nil, coords={x=36.0,y=35.0}, mapID=23, criteriaIndex=12 },
            { index=13, desc="Discover The Noxious Glade.",             npc=nil, coords={x=69.0,y=14.0}, mapID=23, criteriaIndex=13 },
            { index=14, desc="Discover Eastwall Tower.",                npc=nil, coords={x=55.0,y=38.0}, mapID=23, criteriaIndex=14 },
            { index=15, desc="Discover Blackwood Lake.",                npc=nil, coords={x=28.0,y=36.0}, mapID=23, criteriaIndex=15 },
            { index=16, desc="Discover Northdale.",                     npc=nil, coords={x=54.0,y=14.0}, mapID=23, criteriaIndex=16 },
            { index=17, desc="Discover Zul'Mashar.",                    npc=nil, coords={x=67.0,y=22.0}, mapID=23, criteriaIndex=17 },
            { index=18, desc="Discover Northpass Tower.",               npc=nil, coords={x=64.0,y=35.0}, mapID=23, criteriaIndex=18 },
            { index=19, desc="Discover Quel'Lithien Lodge.",            npc=nil, coords={x=80.0,y=22.0}, mapID=23, criteriaIndex=19 },
            { index=20, desc="Discover Terrordale.",                    npc=nil, coords={x=53.0,y=26.0}, mapID=23, criteriaIndex=20 },
            { index=21, desc="Discover Plaguewood.",                    npc=nil, coords={x=30.0,y=16.0}, mapID=23, criteriaIndex=21 },
            { index=22, desc="Discover Stratholme.",                    npc=nil, coords={x=32.0,y=24.0}, mapID=23, criteriaIndex=22 },
            { index=23, desc="Discover Ruins of the Scarlet Enclave.",  npc=nil, coords={x=78.0,y=34.0}, mapID=23, criteriaIndex=23 },
        },
    },

    [4892] = {
        id       = 4892,
        name     = "Eastern Plaguelands Quests",
        category = "Quests",
        zone     = "Eastern Plaguelands",
        mapID    = 23,
        steps = {
            { index=1, desc="Complete The Paladin Pals quest chain.",            npc=nil, coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=1 },
            { index=2, desc="Complete The Red Paths of Darrowshire quest chain.", npc=nil, coords={x=82.0,y=69.0}, mapID=23, criteriaIndex=2 },
            { index=3, desc="Complete Tyr's Hand quest chain.",                   npc=nil, coords={x=75.0,y=45.0}, mapID=23, criteriaIndex=3 },
            { index=4, desc="Complete Serving the Argent Crusade quest chain.",   npc=nil, coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=4 },
            { index=5, desc="Complete Journey's End quest chain.",                npc=nil, coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=5 },
        },
    },

    [5442] = {
        id       = 5442,
        name     = "Full Caravan",
        category = "Quests",
        zone     = "Eastern Plaguelands",
        mapID    = 23,
        steps = {
            { index=1, desc="Recruit Fiona to your caravan — find her wagon on the road in Eastern Plaguelands.", npc="Fiona",              coords={x=44.0,y=65.0}, mapID=23, criteriaIndex=1 },
            { index=2, desc="Recruit Gidwin Goldbraids to the caravan.",                                          npc="Gidwin Goldbraids",  coords={x=44.0,y=65.0}, mapID=23, criteriaIndex=2 },
            { index=3, desc="Recruit Tarenar Sunstrike to the caravan.",                                          npc="Tarenar Sunstrike",  coords={x=44.0,y=65.0}, mapID=23, criteriaIndex=3 },
            { index=4, desc="Recruit Argus Highbeacon to the caravan.",                                           npc="Argus Highbeacon",   coords={x=55.0,y=52.0}, mapID=23, criteriaIndex=4 },
            { index=5, desc="Recruit Pamela Redpath to the caravan.",                                             npc="Pamela Redpath",     coords={x=82.0,y=69.0}, mapID=23, criteriaIndex=5 },
            { index=6, desc="Recruit Vex'tul to the caravan.",                                                    npc="Vex'tul",            coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=6 },
            { index=7, desc="Recruit Rimblat Earthshatter to the caravan.",                                       npc="Rimblat Earthshatter", coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=7 },
            { index=8, desc="Recruit Beezil Linkspanner to the caravan.",                                         npc="Beezil Linkspanner", coords={x=74.0,y=54.0}, mapID=23, criteriaIndex=8 },
        },
    },

    -- =========================================================================
    -- WESTERN PLAGUELANDS (mapID 22)
    -- =========================================================================

    [770] = {
        id       = 770,
        name     = "Explore Western Plaguelands",
        category = "Exploration",
        zone     = "Western Plaguelands",
        mapID    = 22,
        steps = {
            { index=1,  desc="Discover Darrowmere Lake.",           npc=nil, coords={x=67.0,y=68.0}, mapID=22, criteriaIndex=1  },
            { index=2,  desc="Discover Caer Darrow.",               npc=nil, coords={x=68.0,y=76.0}, mapID=22, criteriaIndex=2  },
            { index=3,  desc="Discover Sorrow Hill.",               npc=nil, coords={x=33.0,y=64.0}, mapID=22, criteriaIndex=3  },
            { index=4,  desc="Discover Andorhal.",                  npc=nil, coords={x=43.0,y=69.0}, mapID=22, criteriaIndex=4  },
            { index=5,  desc="Discover The Bulwark.",               npc=nil, coords={x=87.0,y=49.0}, mapID=22, criteriaIndex=5  },
            { index=6,  desc="Discover Felstone Field.",            npc=nil, coords={x=38.0,y=40.0}, mapID=22, criteriaIndex=6  },
            { index=7,  desc="Discover Dalson's Farm.",             npc=nil, coords={x=48.0,y=35.0}, mapID=22, criteriaIndex=7  },
            { index=8,  desc="Discover The Writhing Haunt.",        npc=nil, coords={x=58.0,y=44.0}, mapID=22, criteriaIndex=8  },
            { index=9,  desc="Discover Northridge Lumber Camp.",    npc=nil, coords={x=52.0,y=16.0}, mapID=22, criteriaIndex=9  },
            { index=10, desc="Discover Hearthglen.",                npc=nil, coords={x=46.0,y=12.0}, mapID=22, criteriaIndex=10 },
            { index=11, desc="Discover Redpine Dell.",              npc=nil, coords={x=30.0,y=22.0}, mapID=22, criteriaIndex=11 },
            { index=12, desc="Discover Gahrron's Withering.",       npc=nil, coords={x=57.0,y=30.0}, mapID=22, criteriaIndex=12 },
            { index=13, desc="Discover The Weeping Cave.",          npc=nil, coords={x=26.0,y=44.0}, mapID=22, criteriaIndex=13 },
            { index=14, desc="Discover Thondroril River.",          npc=nil, coords={x=79.0,y=38.0}, mapID=22, criteriaIndex=14 },
        },
    },

    [4893] = {
        id       = 4893,
        name     = "Western Plaguelands Quests",
        category = "Quests",
        zone     = "Western Plaguelands",
        mapID    = 22,
        steps = {
            { index=1, desc="Complete The First Battle for Andorhal quest chain.",   npc=nil, coords={x=43.0,y=69.0}, mapID=22, criteriaIndex=1 },
            { index=2, desc="Complete A Temporary Peace quest chain.",                npc=nil, coords={x=43.0,y=69.0}, mapID=22, criteriaIndex=2 },
            { index=3, desc="Complete The Second Battle for Andorhal quest chain.",  npc=nil, coords={x=43.0,y=69.0}, mapID=22, criteriaIndex=3 },
            { index=4, desc="Complete The Menders' Stead quest chain.",              npc=nil, coords={x=46.0,y=12.0}, mapID=22, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- THE HINTERLANDS (mapID 26)
    -- =========================================================================

    [773] = {
        id       = 773,
        name     = "Explore The Hinterlands",
        category = "Exploration",
        zone     = "The Hinterlands",
        mapID    = 26,
        steps = {
            { index=1,  desc="Discover Aerie Peak.",           npc=nil, coords={x=13.0,y=42.0}, mapID=26, criteriaIndex=1  },
            { index=2,  desc="Discover Plaguemist Ravine.",    npc=nil, coords={x=62.0,y=18.0}, mapID=26, criteriaIndex=2  },
            { index=3,  desc="Discover Zun'watha.",            npc=nil, coords={x=74.0,y=30.0}, mapID=26, criteriaIndex=3  },
            { index=4,  desc="Discover Quel'Danil Lodge.",     npc=nil, coords={x=77.0,y=55.0}, mapID=26, criteriaIndex=4  },
            { index=5,  desc="Discover Shadra'Alor.",          npc=nil, coords={x=67.0,y=43.0}, mapID=26, criteriaIndex=5  },
            { index=6,  desc="Discover Valorwind Lake.",       npc=nil, coords={x=44.0,y=35.0}, mapID=26, criteriaIndex=6  },
            { index=7,  desc="Discover Agol'watha.",           npc=nil, coords={x=76.0,y=19.0}, mapID=26, criteriaIndex=7  },
            { index=8,  desc="Discover The Creeping Ruin.",    npc=nil, coords={x=53.0,y=25.0}, mapID=26, criteriaIndex=8  },
            { index=9,  desc="Discover The Altar of Zul.",     npc=nil, coords={x=55.0,y=67.0}, mapID=26, criteriaIndex=9  },
            { index=10, desc="Discover Seradane.",             npc=nil, coords={x=81.0,y=34.0}, mapID=26, criteriaIndex=10 },
            { index=11, desc="Discover Skulk Rock.",           npc=nil, coords={x=36.0,y=52.0}, mapID=26, criteriaIndex=11 },
            { index=12, desc="Discover Shaol'watha.",          npc=nil, coords={x=63.0,y=75.0}, mapID=26, criteriaIndex=12 },
            { index=13, desc="Discover Jintha'Alor.",          npc=nil, coords={x=65.0,y=57.0}, mapID=26, criteriaIndex=13 },
            { index=14, desc="Discover The Overlook Cliffs.",  npc=nil, coords={x=81.0,y=73.0}, mapID=26, criteriaIndex=14 },
        },
    },

    [4897] = {
        id       = 4897,
        name     = "Hinterlands Quests",
        category = "Quests",
        zone     = "The Hinterlands",
        mapID    = 26,
        steps = {
            { index=1, desc="Complete the Quel'Danil Lodge quest chain.",       npc=nil, coords={x=77.0,y=55.0}, mapID=26, criteriaIndex=1 },
            { index=2, desc="Complete the Jintha'Alor quest chain.",            npc=nil, coords={x=65.0,y=57.0}, mapID=26, criteriaIndex=2 },
            { index=3, desc="Complete the Stormfeather Outpost quest chain.",   npc=nil, coords={x=13.0,y=42.0}, mapID=26, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- TIRISFAL GLADES (mapID 18)
    -- =========================================================================

    [768] = {
        id       = 768,
        name     = "Explore Tirisfal Glades",
        category = "Exploration",
        zone     = "Tirisfal Glades",
        mapID    = 18,
        steps = {
            { index=1,  desc="Discover Deathknell.",                    npc=nil, coords={x=32.0,y=67.0}, mapID=18, criteriaIndex=1  },
            { index=2,  desc="Discover Solliden Farmstead.",            npc=nil, coords={x=57.0,y=53.0}, mapID=18, criteriaIndex=2  },
            { index=3,  desc="Discover Agamand Mills.",                 npc=nil, coords={x=48.0,y=29.0}, mapID=18, criteriaIndex=3  },
            { index=4,  desc="Discover Nightmare Vale.",                npc=nil, coords={x=71.0,y=53.0}, mapID=18, criteriaIndex=4  },
            { index=5,  desc="Discover Cold Hearth Manor.",             npc=nil, coords={x=37.0,y=47.0}, mapID=18, criteriaIndex=5  },
            { index=6,  desc="Discover Brill.",                         npc=nil, coords={x=57.0,y=40.0}, mapID=18, criteriaIndex=6  },
            { index=7,  desc="Discover Garren's Haunt.",                npc=nil, coords={x=53.0,y=22.0}, mapID=18, criteriaIndex=7  },
            { index=8,  desc="Discover Brightwater Lake.",              npc=nil, coords={x=67.0,y=33.0}, mapID=18, criteriaIndex=8  },
            { index=9,  desc="Discover Balnir Farmstead.",              npc=nil, coords={x=64.0,y=44.0}, mapID=18, criteriaIndex=9  },
            { index=10, desc="Discover Crusader Outpost.",              npc=nil, coords={x=78.0,y=60.0}, mapID=18, criteriaIndex=10 },
            { index=11, desc="Discover Scarlet Watch Post.",            npc=nil, coords={x=77.0,y=73.0}, mapID=18, criteriaIndex=11 },
            { index=12, desc="Discover Venomweb Vale.",                 npc=nil, coords={x=74.0,y=17.0}, mapID=18, criteriaIndex=12 },
            { index=13, desc="Discover Ruins of Lordaeron.",            npc=nil, coords={x=66.0,y=60.0}, mapID=18, criteriaIndex=13 },
            { index=14, desc="Discover Scarlet Monastery Entrance.",    npc=nil, coords={x=82.0,y=29.0}, mapID=18, criteriaIndex=14 },
            { index=15, desc="Discover The Bulwark.",                   npc=nil, coords={x=87.0,y=49.0}, mapID=18, criteriaIndex=15 },
            { index=16, desc="Discover Calston Estate.",                npc=nil, coords={x=47.0,y=43.0}, mapID=18, criteriaIndex=16 },
        },
    },

    -- =========================================================================
    -- SILVERPINE FOREST (mapID 21)
    -- =========================================================================

    [769] = {
        id       = 769,
        name     = "Explore Silverpine Forest",
        category = "Exploration",
        zone     = "Silverpine Forest",
        mapID    = 21,
        steps = {
            { index=1,  desc="Discover The Battlefront.",           npc=nil, coords={x=47.0,y=68.0}, mapID=21, criteriaIndex=1  },
            { index=2,  desc="Discover The Decrepit Fields.",       npc=nil, coords={x=38.0,y=52.0}, mapID=21, criteriaIndex=2  },
            { index=3,  desc="Discover The Forsaken Front.",        npc=nil, coords={x=47.0,y=76.0}, mapID=21, criteriaIndex=3  },
            { index=4,  desc="Discover The Skittering Dark.",       npc=nil, coords={x=64.0,y=51.0}, mapID=21, criteriaIndex=4  },
            { index=5,  desc="Discover North Tide's Beachhead.",    npc=nil, coords={x=21.0,y=31.0}, mapID=21, criteriaIndex=5  },
            { index=6,  desc="Discover Fenris Isle.",               npc=nil, coords={x=55.0,y=26.0}, mapID=21, criteriaIndex=6  },
            { index=7,  desc="Discover Valgan's Field.",            npc=nil, coords={x=57.0,y=61.0}, mapID=21, criteriaIndex=7  },
            { index=8,  desc="Discover The Sepulcher.",             npc=nil, coords={x=44.0,y=38.0}, mapID=21, criteriaIndex=8  },
            { index=9,  desc="Discover Deep Elem Mine.",            npc=nil, coords={x=70.0,y=39.0}, mapID=21, criteriaIndex=9  },
            { index=10, desc="Discover Olsen's Farthing.",          npc=nil, coords={x=62.0,y=67.0}, mapID=21, criteriaIndex=10 },
            { index=11, desc="Discover Ambermill.",                 npc=nil, coords={x=67.0,y=29.0}, mapID=21, criteriaIndex=11 },
            { index=12, desc="Discover Shadowfang Keep.",           npc=nil, coords={x=45.0,y=68.0}, mapID=21, criteriaIndex=12 },
            { index=13, desc="Discover Forsaken High Command.",     npc=nil, coords={x=53.0,y=81.0}, mapID=21, criteriaIndex=13 },
            { index=14, desc="Discover North Tide's Run.",          npc=nil, coords={x=22.0,y=22.0}, mapID=21, criteriaIndex=14 },
            { index=15, desc="Discover Forsaken Rear Guard.",       npc=nil, coords={x=55.0,y=88.0}, mapID=21, criteriaIndex=15 },
        },
    },

    [4894] = {
        id       = 4894,
        name     = "Silverpine Forest Quests",
        category = "Quests",
        zone     = "Silverpine Forest",
        mapID    = 21,
        steps = {
            { index=1, desc="Complete the Forsaken High Command quest chain.",      npc=nil, coords={x=53.0,y=81.0}, mapID=21, criteriaIndex=1 },
            { index=2, desc="Complete the Forsaken Rear Guard quest chain.",        npc=nil, coords={x=55.0,y=88.0}, mapID=21, criteriaIndex=2 },
            { index=3, desc="Complete The Sepulcher quest chain.",                  npc=nil, coords={x=44.0,y=38.0}, mapID=21, criteriaIndex=3 },
            { index=4, desc="Complete The Ruins of Gilneas quest chain.",           npc=nil, coords={x=47.0,y=76.0}, mapID=21, criteriaIndex=4 },
            { index=5, desc="Complete the Ambermill quest chain.",                  npc=nil, coords={x=67.0,y=29.0}, mapID=21, criteriaIndex=5 },
            { index=6, desc="Complete the On the Battlefront quest chain.",         npc=nil, coords={x=47.0,y=68.0}, mapID=21, criteriaIndex=6 },
        },
    },

    -- =========================================================================
    -- HILLSBRAD FOOTHILLS (mapID 25)
    -- =========================================================================

    [772] = {
        id       = 772,
        name     = "Explore Hillsbrad Foothills",
        category = "Exploration",
        zone     = "Hillsbrad Foothills",
        mapID    = 25,
        steps = {
            { index=1,  desc="Discover Azurelode Mine.",       npc=nil, coords={x=26.0,y=63.0}, mapID=25, criteriaIndex=1  },
            { index=2,  desc="Discover Brazie Farmstead.",     npc=nil, coords={x=33.0,y=58.0}, mapID=25, criteriaIndex=2  },
            { index=3,  desc="Discover Corrahn's Dagger.",     npc=nil, coords={x=19.0,y=45.0}, mapID=25, criteriaIndex=3  },
            { index=4,  desc="Discover Crushridge Hold.",      npc=nil, coords={x=67.0,y=24.0}, mapID=25, criteriaIndex=4  },
            { index=5,  desc="Discover Chilliwind Point.",     npc=nil, coords={x=22.0,y=34.0}, mapID=25, criteriaIndex=5  },
            { index=6,  desc="Discover Dalaran Crater.",       npc=nil, coords={x=37.0,y=28.0}, mapID=25, criteriaIndex=6  },
            { index=7,  desc="Discover Dandred's Fold.",       npc=nil, coords={x=72.0,y=41.0}, mapID=25, criteriaIndex=7  },
            { index=8,  desc="Discover Darrow Hill.",          npc=nil, coords={x=72.0,y=56.0}, mapID=25, criteriaIndex=8  },
            { index=9,  desc="Discover Dun Garok.",            npc=nil, coords={x=80.0,y=73.0}, mapID=25, criteriaIndex=9  },
            { index=10, desc="Discover Durnholde Keep.",       npc=nil, coords={x=65.0,y=55.0}, mapID=25, criteriaIndex=10 },
            { index=11, desc="Discover Gallows' Corner.",      npc=nil, coords={x=51.0,y=18.0}, mapID=25, criteriaIndex=11 },
            { index=12, desc="Discover Gavin's Naze.",         npc=nil, coords={x=20.0,y=19.0}, mapID=25, criteriaIndex=12 },
            { index=13, desc="Discover Growless Cave.",        npc=nil, coords={x=58.0,y=15.0}, mapID=25, criteriaIndex=13 },
            { index=14, desc="Discover Misty Shore.",          npc=nil, coords={x=42.0,y=76.0}, mapID=25, criteriaIndex=14 },
            { index=15, desc="Discover Nethander Stead.",      npc=nil, coords={x=57.0,y=47.0}, mapID=25, criteriaIndex=15 },
            { index=16, desc="Discover Purgation Isle.",       npc=nil, coords={x=57.0,y=90.0}, mapID=25, criteriaIndex=16 },
            { index=17, desc="Discover Ruins of Alterac.",     npc=nil, coords={x=46.0,y=18.0}, mapID=25, criteriaIndex=17 },
            { index=18, desc="Discover Ruins of Southshore.",  npc=nil, coords={x=51.0,y=67.0}, mapID=25, criteriaIndex=18 },
            { index=19, desc="Discover Slaughter Hollow.",     npc=nil, coords={x=38.0,y=15.0}, mapID=25, criteriaIndex=19 },
            { index=20, desc="Discover Sofera's Naze.",        npc=nil, coords={x=42.0,y=22.0}, mapID=25, criteriaIndex=20 },
            { index=21, desc="Discover Southpoint Gate.",      npc=nil, coords={x=52.0,y=56.0}, mapID=25, criteriaIndex=21 },
            { index=22, desc="Discover Strahnbrad.",           npc=nil, coords={x=55.0,y=27.0}, mapID=25, criteriaIndex=22 },
            { index=23, desc="Discover Tarren Mill.",          npc=nil, coords={x=59.0,y=37.0}, mapID=25, criteriaIndex=23 },
            { index=24, desc="Discover The Headland.",         npc=nil, coords={x=18.0,y=58.0}, mapID=25, criteriaIndex=24 },
            { index=25, desc="Discover The Sludge Fields.",    npc=nil, coords={x=37.0,y=45.0}, mapID=25, criteriaIndex=25 },
            { index=26, desc="Discover The Uplands.",          npc=nil, coords={x=73.0,y=30.0}, mapID=25, criteriaIndex=26 },
        },
    },

    [4895] = {
        id       = 4895,
        name     = "Hillsbrad Foothills Quests",
        category = "Quests",
        zone     = "Hillsbrad Foothills",
        mapID    = 25,
        steps = {
            { index=1, desc="Complete The Sludge Fields quest chain in central Hillsbrad.",      npc=nil, coords={x=37.0,y=45.0}, mapID=25, criteriaIndex=1 },
            { index=2, desc="Complete the Stormpike quest chain.",                                npc=nil, coords={x=51.0,y=18.0}, mapID=25, criteriaIndex=2 },
            { index=3, desc="Complete the Eastpoint Tower quest chain.",                          npc=nil, coords={x=72.0,y=41.0}, mapID=25, criteriaIndex=3 },
            { index=4, desc="Complete the Azurelode Mine quest chain.",                           npc=nil, coords={x=26.0,y=63.0}, mapID=25, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- ARATHI HIGHLANDS (mapID 14)
    -- =========================================================================

    [761] = {
        id       = 761,
        name     = "Explore Arathi Highlands",
        category = "Exploration",
        zone     = "Arathi Highlands",
        mapID    = 14,
        steps = {
            { index=1,  desc="Discover Circle of West Binding.",   npc=nil, coords={x=20.0,y=50.0}, mapID=14, criteriaIndex=1  },
            { index=2,  desc="Discover Northfold Manor.",          npc=nil, coords={x=25.0,y=22.0}, mapID=14, criteriaIndex=2  },
            { index=3,  desc="Discover Boulder'gor.",              npc=nil, coords={x=72.0,y=21.0}, mapID=14, criteriaIndex=3  },
            { index=4,  desc="Discover Galen's Fall.",             npc=nil, coords={x=52.0,y=25.0}, mapID=14, criteriaIndex=4  },
            { index=5,  desc="Discover Stromgarde Keep.",          npc=nil, coords={x=28.0,y=61.0}, mapID=14, criteriaIndex=5  },
            { index=6,  desc="Discover Faldir's Cove.",            npc=nil, coords={x=28.0,y=88.0}, mapID=14, criteriaIndex=6  },
            { index=7,  desc="Discover Circle of Inner Binding.",  npc=nil, coords={x=49.0,y=46.0}, mapID=14, criteriaIndex=7  },
            { index=8,  desc="Discover Thandol Span.",             npc=nil, coords={x=64.0,y=90.0}, mapID=14, criteriaIndex=8  },
            { index=9,  desc="Discover Boulderfist Hall.",         npc=nil, coords={x=72.0,y=47.0}, mapID=14, criteriaIndex=9  },
            { index=10, desc="Discover Refuge Pointe.",            npc=nil, coords={x=47.0,y=46.0}, mapID=14, criteriaIndex=10 },
            { index=11, desc="Discover Circle of Outer Binding.",  npc=nil, coords={x=56.0,y=56.0}, mapID=14, criteriaIndex=11 },
            { index=12, desc="Discover Witherbark Village.",       npc=nil, coords={x=72.0,y=64.0}, mapID=14, criteriaIndex=12 },
            { index=13, desc="Discover Go'Shek Farm.",             npc=nil, coords={x=60.0,y=37.0}, mapID=14, criteriaIndex=13 },
            { index=14, desc="Discover Dabyrie's Farmstead.",      npc=nil, coords={x=50.0,y=36.0}, mapID=14, criteriaIndex=14 },
            { index=15, desc="Discover Circle of East Binding.",   npc=nil, coords={x=76.0,y=54.0}, mapID=14, criteriaIndex=15 },
            { index=16, desc="Discover Hammerfall.",               npc=nil, coords={x=73.0,y=40.0}, mapID=14, criteriaIndex=16 },
        },
    },

    [4896] = {
        id       = 4896,
        name     = "Arathi Highlands Quests",
        category = "Quests",
        zone     = "Arathi Highlands",
        mapID    = 14,
        steps = {
            { index=1, desc="Complete the Faldir's Cove quest chain in southern Arathi Highlands.",  npc=nil, coords={x=28.0,y=88.0}, mapID=14, criteriaIndex=1 },
            { index=2, desc="Complete the Refuge Pointe quest chain.",                                npc=nil, coords={x=47.0,y=46.0}, mapID=14, criteriaIndex=2 },
            { index=3, desc="Complete Myzrael's Tale quest chain.",                                   npc=nil, coords={x=49.0,y=46.0}, mapID=14, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- TWILIGHT HIGHLANDS (mapID 241)
    -- =========================================================================

    [4866] = {
        id       = 4866,
        name     = "Explore Twilight Highlands",
        category = "Exploration",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            { index=1,  desc="Discover Bloodgulch.",               npc=nil, coords={x=26.0,y=26.0}, mapID=241, criteriaIndex=1  },
            { index=2,  desc="Discover Crucible of Carnage.",      npc=nil, coords={x=60.0,y=47.0}, mapID=241, criteriaIndex=2  },
            { index=3,  desc="Discover Crushblow.",                npc=nil, coords={x=49.0,y=71.0}, mapID=241, criteriaIndex=3  },
            { index=4,  desc="Discover Dragonmaw Pass.",           npc=nil, coords={x=35.0,y=57.0}, mapID=241, criteriaIndex=4  },
            { index=5,  desc="Discover Dragonmaw Port.",           npc=nil, coords={x=74.0,y=72.0}, mapID=241, criteriaIndex=5  },
            { index=6,  desc="Discover Dunwald Ruins.",            npc=nil, coords={x=78.0,y=44.0}, mapID=241, criteriaIndex=6  },
            { index=7,  desc="Discover Firebeard's Patrol.",       npc=nil, coords={x=54.0,y=30.0}, mapID=241, criteriaIndex=7  },
            { index=8,  desc="Discover Glopgut's Hollow.",         npc=nil, coords={x=43.0,y=40.0}, mapID=241, criteriaIndex=8  },
            { index=9,  desc="Discover Gorshak War Camp.",         npc=nil, coords={x=55.0,y=62.0}, mapID=241, criteriaIndex=9  },
            { index=10, desc="Discover Grim Batol.",               npc=nil, coords={x=24.0,y=54.0}, mapID=241, criteriaIndex=10 },
            { index=11, desc="Discover Highbank.",                 npc=nil, coords={x=79.0,y=60.0}, mapID=241, criteriaIndex=11 },
            { index=12, desc="Discover Highland Forest.",          npc=nil, coords={x=62.0,y=26.0}, mapID=241, criteriaIndex=12 },
            { index=13, desc="Discover Humboldt Conflagration.",   npc=nil, coords={x=71.0,y=30.0}, mapID=241, criteriaIndex=13 },
            { index=14, desc="Discover Kirthaven.",                npc=nil, coords={x=44.0,y=21.0}, mapID=241, criteriaIndex=14 },
            { index=15, desc="Discover Obsidian Forest.",          npc=nil, coords={x=52.0,y=46.0}, mapID=241, criteriaIndex=15 },
            { index=16, desc="Discover Ruins of Drakgor.",         npc=nil, coords={x=40.0,y=66.0}, mapID=241, criteriaIndex=16 },
            { index=17, desc="Discover Slithering Cove.",          npc=nil, coords={x=87.0,y=77.0}, mapID=241, criteriaIndex=17 },
            { index=18, desc="Discover The Black Breach.",         npc=nil, coords={x=22.0,y=40.0}, mapID=241, criteriaIndex=18 },
            { index=19, desc="Discover The Gullet.",               npc=nil, coords={x=33.0,y=44.0}, mapID=241, criteriaIndex=19 },
            { index=20, desc="Discover The Krazzworks.",           npc=nil, coords={x=84.0,y=46.0}, mapID=241, criteriaIndex=20 },
            { index=21, desc="Discover The Twilight Breach.",      npc=nil, coords={x=38.0,y=78.0}, mapID=241, criteriaIndex=21 },
            { index=22, desc="Discover Thundermar.",               npc=nil, coords={x=49.0,y=29.0}, mapID=241, criteriaIndex=22 },
            { index=23, desc="Discover Twilight Shore.",           npc=nil, coords={x=22.0,y=65.0}, mapID=241, criteriaIndex=23 },
            { index=24, desc="Discover Vermillion Redoubt.",       npc=nil, coords={x=56.0,y=17.0}, mapID=241, criteriaIndex=24 },
            { index=25, desc="Discover Victor's Point.",           npc=nil, coords={x=68.0,y=56.0}, mapID=241, criteriaIndex=25 },
            { index=26, desc="Discover Wyrms' Bend.",              npc=nil, coords={x=64.0,y=36.0}, mapID=241, criteriaIndex=26 },
            { index=27, desc="Discover The Maw of Madness.",       npc=nil, coords={x=78.0,y=86.0}, mapID=241, criteriaIndex=27 },
        },
    },

    [3218] = {
        id       = 3218,
        name     = "Turtles All the Way Down",
        category = "Professions",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Fish from any pool in Twilight Highlands, Deepholm, Mount Hyjal, Uldum, Northrend, or Pandaria until you fish up a Sea Turtle mount. This is a very rare catch — just keep fishing pools!",
                npc           = nil,
                coords        = { x = 60.0, y = 47.0 },
                mapID         = 241,
                criteriaIndex = nil,
            },
        },
    },

    [4873] = {
        id       = 4873,
        name     = "Fading into Twilight",
        category = "Quests",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            { index=1, desc="Complete the 'Good News, For Once' quest chain in Twilight Highlands.",       npc=nil, coords={x=54.0,y=30.0}, mapID=241, criteriaIndex=1 },
            { index=2, desc="Complete the Firebeard quest chain.",                                          npc=nil, coords={x=54.0,y=30.0}, mapID=241, criteriaIndex=2 },
            { index=3, desc="Complete The Dunwalds quest chain.",                                           npc=nil, coords={x=78.0,y=44.0}, mapID=241, criteriaIndex=3 },
            { index=4, desc="Complete The Eye of Twilight quest chain.",                                    npc=nil, coords={x=52.0,y=46.0}, mapID=241, criteriaIndex=4 },
            { index=5, desc="Complete the Wild, Wild, Wildhammer Wedding quest chain.",                    npc=nil, coords={x=49.0,y=29.0}, mapID=241, criteriaIndex=5 },
            { index=6, desc="Complete The Attack Begins quest chain.",                                      npc=nil, coords={x=79.0,y=60.0}, mapID=241, criteriaIndex=6 },
            { index=7, desc="Complete Send Them Packing quest chain.",                                      npc=nil, coords={x=79.0,y=60.0}, mapID=241, criteriaIndex=7 },
        },
    },

    [4960] = {
        id       = 4960,
        name     = "Round Three. Fight!",
        category = "Quests",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            {
                index         = 1,
                desc          = "Complete all Crucible of Carnage group quests at the arena in central Twilight Highlands, up to and including The Twilight Terror. Requires a group of 5.",
                npc           = "Gurgthock",
                coords        = { x = 60.0, y = 47.0 },
                mapID         = 241,
                criteriaIndex = nil,
            },
        },
    },

    [5320] = {
        id       = 5320,
        name     = "King of the Mountain",
        category = "Quests",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Twilight's Hammer quest chain in Twilight Highlands up to and including Skullcrusher the Mountain. Start at Highbank.",
                npc           = "Commander Schnottz",
                coords        = { x = 79.0, y = 60.0 },
                mapID         = 241,
                criteriaIndex = nil,
            },
        },
    },

    [5481] = {
        id       = 5481,
        name     = "Wildhammer Tour of Duty",
        category = "Quests",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            { index=1, desc="Kill Warlord Halthar at Gorshak War Camp.",     npc="Warlord Halthar",         coords={x=55.0,y=62.0}, mapID=241, criteriaIndex=1 },
            { index=2, desc="Kill Karkrog the Exterminator.",                npc="Karkrog the Exterminator", coords={x=43.0,y=40.0}, mapID=241, criteriaIndex=2 },
            { index=3, desc="Kill The Black Recluse spider in the zone.",    npc="The Black Recluse",        coords={x=52.0,y=46.0}, mapID=241, criteriaIndex=3 },
            { index=4, desc="Kill Korthalon the Black.",                     npc="Korthalon the Black",      coords={x=38.0,y=78.0}, mapID=241, criteriaIndex=4 },
        },
    },

    [5451] = {
        id       = 5451,
        name     = "Consumed by Nightmare",
        category = "Quests",
        zone     = "Twilight Highlands",
        mapID    = 241,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Consumed by Nightmare quest chain in Twilight Highlands. Use /gp criteria 5451 in-game to verify criteriaIndex.",
                npc           = nil,
                coords        = { x = 52.0, y = 46.0 },
                mapID         = 241,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- WETLANDS (mapID 56)
    -- =========================================================================

    [841] = {
        id       = 841,
        name     = "Explore Wetlands",
        category = "Exploration",
        zone     = "Wetlands",
        mapID    = 56,
        steps = {
            { index=1,  desc="Discover Menethil Harbor.",            npc=nil, coords={x=11.0,y=55.0}, mapID=56, criteriaIndex=1  },
            { index=2,  desc="Discover Black Channel Marsh.",        npc=nil, coords={x=21.0,y=75.0}, mapID=56, criteriaIndex=2  },
            { index=3,  desc="Discover Bluegill Marsh.",             npc=nil, coords={x=26.0,y=65.0}, mapID=56, criteriaIndex=3  },
            { index=4,  desc="Discover Whelgar's Excavation Site.",  npc=nil, coords={x=36.0,y=53.0}, mapID=56, criteriaIndex=4  },
            { index=5,  desc="Discover Sundown Marsh.",              npc=nil, coords={x=58.0,y=71.0}, mapID=56, criteriaIndex=5  },
            { index=6,  desc="Discover Saltspray Glen.",             npc=nil, coords={x=70.0,y=57.0}, mapID=56, criteriaIndex=6  },
            { index=7,  desc="Discover Ironbeard's Tomb.",           npc=nil, coords={x=53.0,y=28.0}, mapID=56, criteriaIndex=7  },
            { index=8,  desc="Discover Dun Modr.",                   npc=nil, coords={x=46.0,y=16.0}, mapID=56, criteriaIndex=8  },
            { index=9,  desc="Discover Angerfang Encampment.",       npc=nil, coords={x=60.0,y=27.0}, mapID=56, criteriaIndex=9  },
            { index=10, desc="Discover Thelgen Rock.",               npc=nil, coords={x=66.0,y=36.0}, mapID=56, criteriaIndex=10 },
            { index=11, desc="Discover Greenwarden's Grove.",        npc=nil, coords={x=74.0,y=43.0}, mapID=56, criteriaIndex=11 },
            { index=12, desc="Discover Mosshide Fen.",               npc=nil, coords={x=49.0,y=47.0}, mapID=56, criteriaIndex=12 },
            { index=13, desc="Discover Direforge Hill.",             npc=nil, coords={x=72.0,y=23.0}, mapID=56, criteriaIndex=13 },
            { index=14, desc="Discover Dun Algaz.",                  npc=nil, coords={x=76.0,y=74.0}, mapID=56, criteriaIndex=14 },
            { index=15, desc="Discover Slabchisel's Survey.",        npc=nil, coords={x=44.0,y=33.0}, mapID=56, criteriaIndex=15 },
            { index=16, desc="Discover Raptor Ridge.",               npc=nil, coords={x=81.0,y=34.0}, mapID=56, criteriaIndex=16 },
        },
    },

    [12429] = {
        id       = 12429,
        name     = "Wetlands Quests",
        category = "Quests",
        zone     = "Wetlands",
        mapID    = 56,
        steps = {
            { index=1, desc="Complete the Slabchisel Survey quest chain.",             npc=nil, coords={x=44.0,y=33.0}, mapID=56, criteriaIndex=1 },
            { index=2, desc="Complete The Flooding of Menethil quest chain.",          npc=nil, coords={x=11.0,y=55.0}, mapID=56, criteriaIndex=2 },
            { index=3, desc="Complete the Engineers and Archaeologists quest chain.",  npc=nil, coords={x=36.0,y=53.0}, mapID=56, criteriaIndex=3 },
            { index=4, desc="Complete the Wardens of the Wetlands quest chain.",       npc=nil, coords={x=74.0,y=43.0}, mapID=56, criteriaIndex=4 },
        },
    },

    [16409] = {
        id       = 16409,
        name     = "Let's Get Quacking",
        category = "Quests",
        zone     = "Wetlands",
        mapID    = 56,
        steps = {
            {
                index         = 1,
                desc          = "Rescue bubbled ducklings around Menethil Harbor. Look for glowing bubbles near the water — click them to free the ducklings inside.",
                npc           = "Bubbled Duckling",
                coords        = { x = 11.0, y = 55.0 },
                mapID         = 56,
                criteriaIndex = 1,
            },
        },
    },

    -- =========================================================================
    -- DUN MOROGH (mapID 27)
    -- =========================================================================

    [627] = {
        id       = 627,
        name     = "Explore Dun Morogh",
        category = "Exploration",
        zone     = "Dun Morogh",
        mapID    = 27,
        steps = {
            { index=1,  desc="Discover Coldridge Pass.",       npc=nil, coords={x=27.0,y=82.0}, mapID=27, criteriaIndex=1  },
            { index=2,  desc="Discover Coldridge Valley.",     npc=nil, coords={x=27.0,y=92.0}, mapID=27, criteriaIndex=2  },
            { index=3,  desc="Discover Frostmane Front.",      npc=nil, coords={x=37.0,y=72.0}, mapID=27, criteriaIndex=3  },
            { index=4,  desc="Discover New Tinkertown.",       npc=nil, coords={x=46.0,y=83.0}, mapID=27, criteriaIndex=4  },
            { index=5,  desc="Discover Ironforge Airfield.",   npc=nil, coords={x=64.0,y=65.0}, mapID=27, criteriaIndex=5  },
            { index=6,  desc="Discover Shimmer Ridge.",        npc=nil, coords={x=24.0,y=49.0}, mapID=27, criteriaIndex=6  },
            { index=7,  desc="Discover Kharanos.",             npc=nil, coords={x=46.0,y=64.0}, mapID=27, criteriaIndex=7  },
            { index=8,  desc="Discover The Tundrid Hills.",    npc=nil, coords={x=59.0,y=47.0}, mapID=27, criteriaIndex=8  },
            { index=9,  desc="Discover Amberstill Ranch.",     npc=nil, coords={x=66.0,y=52.0}, mapID=27, criteriaIndex=9  },
            { index=10, desc="Discover Helm's Bed Lake.",      npc=nil, coords={x=72.0,y=60.0}, mapID=27, criteriaIndex=10 },
            { index=11, desc="Discover Gol'Bolar Quarry.",    npc=nil, coords={x=76.0,y=65.0}, mapID=27, criteriaIndex=11 },
            { index=12, desc="Discover North Gate Outpost.",   npc=nil, coords={x=50.0,y=28.0}, mapID=27, criteriaIndex=12 },
            { index=13, desc="Discover Frostmane Hold.",       npc=nil, coords={x=34.0,y=57.0}, mapID=27, criteriaIndex=13 },
            { index=14, desc="Discover Iceflow Lake.",         npc=nil, coords={x=52.0,y=45.0}, mapID=27, criteriaIndex=14 },
            { index=15, desc="Discover Gates of Ironforge.",   npc=nil, coords={x=52.0,y=72.0}, mapID=27, criteriaIndex=15 },
        },
    },

    -- =========================================================================
    -- LOCH MODAN (mapID 48)
    -- =========================================================================

    [779] = {
        id       = 779,
        name     = "Explore Loch Modan",
        category = "Exploration",
        zone     = "Loch Modan",
        mapID    = 48,
        steps = {
            { index=1,  desc="Discover The Loch.",                    npc=nil, coords={x=55.0,y=55.0}, mapID=48, criteriaIndex=1  },
            { index=2,  desc="Discover Stonewrought Dam.",             npc=nil, coords={x=47.0,y=13.0}, mapID=48, criteriaIndex=2  },
            { index=3,  desc="Discover Mo'grosh Stronghold.",         npc=nil, coords={x=72.0,y=20.0}, mapID=48, criteriaIndex=3  },
            { index=4,  desc="Discover Silver Stream Mine.",           npc=nil, coords={x=32.0,y=28.0}, mapID=48, criteriaIndex=4  },
            { index=5,  desc="Discover North Gate Pass.",              npc=nil, coords={x=18.0,y=14.0}, mapID=48, criteriaIndex=5  },
            { index=6,  desc="Discover The Farstrider Lodge.",         npc=nil, coords={x=74.0,y=60.0}, mapID=48, criteriaIndex=6  },
            { index=7,  desc="Discover Ironband's Excavation Site.",   npc=nil, coords={x=78.0,y=75.0}, mapID=48, criteriaIndex=7  },
            { index=8,  desc="Discover Grizzlepaw Ridge.",             npc=nil, coords={x=38.0,y=72.0}, mapID=48, criteriaIndex=8  },
            { index=9,  desc="Discover Thelsamar.",                    npc=nil, coords={x=33.0,y=49.0}, mapID=48, criteriaIndex=9  },
            { index=10, desc="Discover Stonesplinter Valley.",         npc=nil, coords={x=22.0,y=57.0}, mapID=48, criteriaIndex=10 },
            { index=11, desc="Discover Valley of Kings.",              npc=nil, coords={x=72.0,y=87.0}, mapID=48, criteriaIndex=11 },
        },
    },

    [4899] = {
        id       = 4899,
        name     = "Loch Modan Quests",
        category = "Quests",
        zone     = "Loch Modan",
        mapID    = 48,
        steps = {
            { index=1, desc="Complete The Road to Thelsamar quest chain.",   npc=nil, coords={x=33.0,y=49.0}, mapID=48, criteriaIndex=1 },
            { index=2, desc="Complete The Axis of Awful quest chain.",        npc=nil, coords={x=33.0,y=49.0}, mapID=48, criteriaIndex=2 },
            { index=3, desc="Complete the Twilight Threats quest chain.",     npc=nil, coords={x=33.0,y=49.0}, mapID=48, criteriaIndex=3 },
            { index=4, desc="Complete The Farstrider Lodge quest chain.",     npc=nil, coords={x=74.0,y=60.0}, mapID=48, criteriaIndex=4 },
        },
    },

    [12456] = {
        id       = 12456,
        name     = "Loch Modan & Wetlands Quests",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete all Loch Modan quests (see Loch Modan Quests achievement).",  npc=nil, coords={x=33.0,y=49.0}, mapID=48, criteriaIndex=1 },
            { index=2, desc="Complete all Wetlands quests (see Wetlands Quests achievement).",       npc=nil, coords={x=17.0,y=36.0}, mapID=nil, criteriaIndex=2 },
        },
    },

    -- Loch Modan Loop skyriding races — race start coords 46.80, 13.61 (mapID 48)
    [18408] = { id=18408, name="Loch Modan Loop: Bronze",           category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop course under Bronze par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18409] = { id=18409, name="Loch Modan Loop: Silver",           category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop course under Silver par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18410] = { id=18410, name="Loch Modan Loop: Gold",             category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop course under Gold par time.",   npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18411] = { id=18411, name="Loch Modan Loop Advanced: Bronze",  category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Advanced course under Bronze par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18412] = { id=18412, name="Loch Modan Loop Advanced: Silver",  category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Advanced course under Silver par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18413] = { id=18413, name="Loch Modan Loop Advanced: Gold",    category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Advanced course under Gold par time.",   npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18414] = { id=18414, name="Loch Modan Loop Reverse: Bronze",   category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Reverse course under Bronze par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18415] = { id=18415, name="Loch Modan Loop Reverse: Silver",   category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Reverse course under Silver par time.", npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },
    [18416] = { id=18416, name="Loch Modan Loop Reverse: Gold",     category="Skyriding", zone="Loch Modan", mapID=48,
        steps={ { index=1, desc="Complete the Loch Modan Loop Reverse course under Gold par time.",   npc="Loch Modan Loop Race", coords={x=46.8,y=13.6}, mapID=48, criteriaIndex=nil } } },

    -- =========================================================================
    -- BADLANDS (mapID 15)
    -- =========================================================================

    [765] = {
        id       = 765,
        name     = "Explore Badlands",
        category = "Exploration",
        zone     = "Badlands",
        mapID    = 15,
        steps = {
            { index=1,  desc="Discover Lethlor Ravine.",            npc=nil, coords={x=80.0,y=55.0}, mapID=15, criteriaIndex=1  },
            { index=2,  desc="Discover Agmond's End.",               npc=nil, coords={x=20.0,y=73.0}, mapID=15, criteriaIndex=2  },
            { index=3,  desc="Discover Uldaman.",                    npc=nil, coords={x=42.0,y=42.0}, mapID=15, criteriaIndex=3  },
            { index=4,  desc="Discover Camp Cagg.",                  npc=nil, coords={x=68.0,y=73.0}, mapID=15, criteriaIndex=4  },
            { index=5,  desc="Discover Scar of the Worldbreaker.",   npc=nil, coords={x=52.0,y=67.0}, mapID=15, criteriaIndex=5  },
            { index=6,  desc="Discover The Dustbowl.",               npc=nil, coords={x=37.0,y=58.0}, mapID=15, criteriaIndex=6  },
            { index=7,  desc="Discover Angor Fortress.",             npc=nil, coords={x=66.0,y=55.0}, mapID=15, criteriaIndex=7  },
            { index=8,  desc="Discover Camp Kosh.",                  npc=nil, coords={x=76.0,y=37.0}, mapID=15, criteriaIndex=8  },
            { index=9,  desc="Discover Bloodwatcher Point.",         npc=nil, coords={x=64.0,y=28.0}, mapID=15, criteriaIndex=9  },
            { index=10, desc="Discover New Kargath.",                npc=nil, coords={x=52.0,y=47.0}, mapID=15, criteriaIndex=10 },
        },
    },

    [4900] = {
        id       = 4900,
        name     = "Badlands Quests",
        category = "Quests",
        zone     = "Badlands",
        mapID    = 15,
        steps = {
            { index=1, desc="Complete the Rhea quest chain in the Badlands.",               npc="Rhea",  coords={x=52.0,y=67.0}, mapID=15, criteriaIndex=1 },
            { index=2, desc="Complete The Fate of a Dragonflight quest chain.",              npc=nil,     coords={x=52.0,y=67.0}, mapID=15, criteriaIndex=2 },
            { index=3, desc="Complete The Titans' Knowledge quest chain.",                   npc=nil,     coords={x=42.0,y=42.0}, mapID=15, criteriaIndex=3 },
            { index=4, desc="Complete The Day that Deathwing Came quest chain.",             npc=nil,     coords={x=52.0,y=47.0}, mapID=15, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- BURNING STEPPES (mapID 36)
    -- =========================================================================

    [775] = {
        id       = 775,
        name     = "Explore Burning Steppes",
        category = "Exploration",
        zone     = "Burning Steppes",
        mapID    = 36,
        steps = {
            { index=1,  desc="Discover Dreadmaul Rock.",          npc=nil, coords={x=72.0,y=77.0}, mapID=36, criteriaIndex=1  },
            { index=2,  desc="Discover Morgan's Vigil.",          npc=nil, coords={x=72.0,y=57.0}, mapID=36, criteriaIndex=2  },
            { index=3,  desc="Discover Terror Wing Path.",        npc=nil, coords={x=51.0,y=77.0}, mapID=36, criteriaIndex=3  },
            { index=4,  desc="Discover Blackrock Pass.",          npc=nil, coords={x=31.0,y=77.0}, mapID=36, criteriaIndex=4  },
            { index=5,  desc="Discover Ruins of Thaurissan.",     npc=nil, coords={x=56.0,y=55.0}, mapID=36, criteriaIndex=5  },
            { index=6,  desc="Discover Black Tooth Hovel.",       npc=nil, coords={x=38.0,y=43.0}, mapID=36, criteriaIndex=6  },
            { index=7,  desc="Discover Blackrock Stronghold.",    npc=nil, coords={x=32.0,y=54.0}, mapID=36, criteriaIndex=7  },
            { index=8,  desc="Discover The Whelping Downs.",      npc=nil, coords={x=79.0,y=38.0}, mapID=36, criteriaIndex=8  },
            { index=9,  desc="Discover Altar of Storms.",         npc=nil, coords={x=51.0,y=32.0}, mapID=36, criteriaIndex=9  },
            { index=10, desc="Discover Blackrock Mountain.",      npc=nil, coords={x=30.0,y=34.0}, mapID=36, criteriaIndex=10 },
        },
    },

    [4901] = {
        id       = 4901,
        name     = "Burning Steppes Quests",
        category = "Quests",
        zone     = "Burning Steppes",
        mapID    = 36,
        steps = {
            { index=1, desc="Complete the Preparation quest chain in Burning Steppes.",  npc=nil, coords={x=72.0,y=57.0}, mapID=36, criteriaIndex=1 },
            { index=2, desc="Complete the Annihilation quest chain.",                     npc=nil, coords={x=72.0,y=57.0}, mapID=36, criteriaIndex=2 },
            { index=3, desc="Complete the Infiltration quest chain.",                     npc=nil, coords={x=72.0,y=57.0}, mapID=36, criteriaIndex=3 },
            { index=4, desc="Complete the Anticipation quest chain.",                     npc=nil, coords={x=72.0,y=57.0}, mapID=36, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- REDRIDGE MOUNTAINS (mapID 49)
    -- =========================================================================

    [780] = {
        id       = 780,
        name     = "Explore Redridge Mountains",
        category = "Exploration",
        zone     = "Redridge Mountains",
        mapID    = 49,
        steps = {
            { index=1,  desc="Discover Lakeshire.",           npc=nil, coords={x=53.0,y=53.0}, mapID=49, criteriaIndex=1  },
            { index=2,  desc="Discover Lake Everstill.",      npc=nil, coords={x=47.0,y=42.0}, mapID=49, criteriaIndex=2  },
            { index=3,  desc="Discover Three Corners.",       npc=nil, coords={x=11.0,y=68.0}, mapID=49, criteriaIndex=3  },
            { index=4,  desc="Discover Lakeridge Highway.",   npc=nil, coords={x=27.0,y=64.0}, mapID=49, criteriaIndex=4  },
            { index=5,  desc="Discover Redridge Canyons.",    npc=nil, coords={x=76.0,y=72.0}, mapID=49, criteriaIndex=5  },
            { index=6,  desc="Discover Alther's Mill.",       npc=nil, coords={x=36.0,y=45.0}, mapID=49, criteriaIndex=6  },
            { index=7,  desc="Discover Stonewatch Falls.",    npc=nil, coords={x=73.0,y=38.0}, mapID=49, criteriaIndex=7  },
            { index=8,  desc="Discover Render's Valley.",     npc=nil, coords={x=82.0,y=55.0}, mapID=49, criteriaIndex=8  },
            { index=9,  desc="Discover Render's Camp.",       npc=nil, coords={x=86.0,y=40.0}, mapID=49, criteriaIndex=9  },
            { index=10, desc="Discover Stonewatch Keep.",     npc=nil, coords={x=73.0,y=27.0}, mapID=49, criteriaIndex=10 },
            { index=11, desc="Discover Galardell Valley.",    npc=nil, coords={x=62.0,y=20.0}, mapID=49, criteriaIndex=11 },
            { index=12, desc="Discover Shalewind Canyon.",    npc=nil, coords={x=86.0,y=20.0}, mapID=49, criteriaIndex=12 },
            { index=13, desc="Discover Camp Everstill.",      npc=nil, coords={x=60.0,y=37.0}, mapID=49, criteriaIndex=13 },
        },
    },

    [4902] = {
        id       = 4902,
        name     = "Redridge Mountains Quests",
        category = "Quests",
        zone     = "Redridge Mountains",
        mapID    = 49,
        steps = {
            { index=1, desc="Complete The Gnoll Offensive quest chain in Redridge Mountains.", npc=nil, coords={x=53.0,y=53.0}, mapID=49, criteriaIndex=1 },
            { index=2, desc="Complete Keeshan's Raiders quest chain.",                          npc="John J. Keeshan", coords={x=53.0,y=53.0}, mapID=49, criteriaIndex=2 },
            { index=3, desc="Complete the First Blood quest chain.",                            npc=nil, coords={x=53.0,y=53.0}, mapID=49, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- SWAMP OF SORROWS (mapID 51)
    -- =========================================================================

    [782] = {
        id       = 782,
        name     = "Explore Swamp of Sorrows",
        category = "Exploration",
        zone     = "Swamp of Sorrows",
        mapID    = 51,
        steps = {
            { index=1,  desc="Discover Misty Valley.",           npc=nil, coords={x=68.0,y=15.0}, mapID=51, criteriaIndex=1  },
            { index=2,  desc="Discover The Harborage.",          npc=nil, coords={x=11.0,y=37.0}, mapID=51, criteriaIndex=2  },
            { index=3,  desc="Discover Splinterspear Junction.", npc=nil, coords={x=37.0,y=18.0}, mapID=51, criteriaIndex=3  },
            { index=4,  desc="Discover The Shifting Mire.",      npc=nil, coords={x=29.0,y=53.0}, mapID=51, criteriaIndex=4  },
            { index=5,  desc="Discover Stonard.",                 npc=nil, coords={x=46.0,y=55.0}, mapID=51, criteriaIndex=5  },
            { index=6,  desc="Discover Pool of Tears.",          npc=nil, coords={x=66.0,y=50.0}, mapID=51, criteriaIndex=6  },
            { index=7,  desc="Discover Stagalbog.",              npc=nil, coords={x=69.0,y=69.0}, mapID=51, criteriaIndex=7  },
            { index=8,  desc="Discover Sorrowmurk.",             npc=nil, coords={x=24.0,y=72.0}, mapID=51, criteriaIndex=8  },
            { index=9,  desc="Discover Bogpaddle.",              npc=nil, coords={x=75.0,y=84.0}, mapID=51, criteriaIndex=9  },
            { index=10, desc="Discover Misty Reed Strand.",      npc=nil, coords={x=80.0,y=60.0}, mapID=51, criteriaIndex=10 },
            { index=11, desc="Discover Purespring Cavern.",      npc=nil, coords={x=57.0,y=35.0}, mapID=51, criteriaIndex=11 },
            { index=12, desc="Discover Marshtide Watch.",        npc=nil, coords={x=55.0,y=72.0}, mapID=51, criteriaIndex=12 },
        },
    },

    [4904] = {
        id       = 4904,
        name     = "Swamp of Sorrows Quests",
        category = "Quests",
        zone     = "Swamp of Sorrows",
        mapID    = 51,
        steps = {
            { index=1, desc="Complete the Bogpaddle quest chain in southeastern Swamp of Sorrows.",  npc=nil, coords={x=75.0,y=84.0}, mapID=51, criteriaIndex=1 },
            { index=2, desc="Complete The Bloodmire quest chain.",                                    npc=nil, coords={x=46.0,y=55.0}, mapID=51, criteriaIndex=2 },
            { index=3, desc="Complete The Shifting Mire quest chain.",                                npc=nil, coords={x=29.0,y=53.0}, mapID=51, criteriaIndex=3 },
            { index=4, desc="Complete The Sunken Temple quest chain (Temple of Atal'Hakkar dungeon).", npc=nil, coords={x=66.0,y=50.0}, mapID=51, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- DEADWIND PASS (mapID 42)
    -- =========================================================================

    [777] = {
        id       = 777,
        name     = "Explore Deadwind Pass",
        category = "Exploration",
        zone     = "Deadwind Pass",
        mapID    = 42,
        steps = {
            { index=1, desc="Discover Deadman's Crossing.", npc=nil, coords={x=41.0,y=27.0}, mapID=42, criteriaIndex=1 },
            { index=2, desc="Discover The Vice.",           npc=nil, coords={x=55.0,y=72.0}, mapID=42, criteriaIndex=2 },
            { index=3, desc="Discover Karazhan.",           npc=nil, coords={x=42.0,y=72.0}, mapID=42, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- BLASTED LANDS (mapID 17)
    -- =========================================================================

    [766] = {
        id       = 766,
        name     = "Explore Blasted Lands",
        category = "Exploration",
        zone     = "Blasted Lands",
        mapID    = 17,
        steps = {
            { index=1,  desc="Discover Dreadmaul Hold.",              npc=nil, coords={x=22.0,y=20.0}, mapID=17, criteriaIndex=1  },
            { index=2,  desc="Discover Nethergarde Supply Camps.",     npc=nil, coords={x=60.0,y=15.0}, mapID=17, criteriaIndex=2  },
            { index=3,  desc="Discover Nethergarde Keep.",             npc=nil, coords={x=60.0,y=22.0}, mapID=17, criteriaIndex=3  },
            { index=4,  desc="Discover Serpent's Coil.",               npc=nil, coords={x=33.0,y=55.0}, mapID=17, criteriaIndex=4  },
            { index=5,  desc="Discover The Dark Portal.",              npc=nil, coords={x=58.0,y=78.0}, mapID=17, criteriaIndex=5  },
            { index=6,  desc="Discover Altar of Storms.",              npc=nil, coords={x=47.0,y=64.0}, mapID=17, criteriaIndex=6  },
            { index=7,  desc="Discover Dreadmaul Post.",               npc=nil, coords={x=31.0,y=29.0}, mapID=17, criteriaIndex=7  },
            { index=8,  desc="Discover The Tainted Scar.",             npc=nil, coords={x=54.0,y=55.0}, mapID=17, criteriaIndex=8  },
            { index=9,  desc="Discover Rise of the Defiler.",          npc=nil, coords={x=43.0,y=79.0}, mapID=17, criteriaIndex=9  },
            { index=10, desc="Discover Shattershore.",                 npc=nil, coords={x=76.0,y=56.0}, mapID=17, criteriaIndex=10 },
            { index=11, desc="Discover Sunveil Excursion.",            npc=nil, coords={x=74.0,y=36.0}, mapID=17, criteriaIndex=11 },
            { index=12, desc="Discover Surwich.",                      npc=nil, coords={x=19.0,y=74.0}, mapID=17, criteriaIndex=12 },
            { index=13, desc="Discover The Red Reaches.",              npc=nil, coords={x=79.0,y=74.0}, mapID=17, criteriaIndex=13 },
            { index=14, desc="Discover The Tainted Forest.",           npc=nil, coords={x=35.0,y=42.0}, mapID=17, criteriaIndex=14 },
        },
    },

    [4909] = {
        id       = 4909,
        name     = "Blasted Lands Quests",
        category = "Quests",
        zone     = "Blasted Lands",
        mapID    = 17,
        steps = {
            { index=1, desc="Complete the Razelikh quest chain in Blasted Lands.",          npc=nil, coords={x=47.0,y=64.0}, mapID=17, criteriaIndex=1 },
            { index=2, desc="Complete The Tainted Forest quest chain.",                      npc=nil, coords={x=35.0,y=42.0}, mapID=17, criteriaIndex=2 },
            { index=3, desc="Complete Avenging the Rockpool quest chain near Shattershore.", npc=nil, coords={x=76.0,y=56.0}, mapID=17, criteriaIndex=3 },
        },
    },

    -- Blasted Lands Bolt skyriding races (Normal/Advanced/Reverse x Bronze/Silver/Gold)
    -- Race start: coords 62.23, 26.79 in Blasted Lands (mapID 17)
    -- Eastern Kingdoms Cup seasonal event — verify criteriaIndex with /gp criteria when active

    [18474] = { id=18474, name="Blasted Lands Bolt: Bronze",            category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt course under Bronze par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18475] = { id=18475, name="Blasted Lands Bolt: Silver",            category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt course under Silver par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18476] = { id=18476, name="Blasted Lands Bolt: Gold",              category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt course under Gold par time.",   npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18477] = { id=18477, name="Blasted Lands Bolt Advanced: Bronze",   category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Advanced course under Bronze par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18478] = { id=18478, name="Blasted Lands Bolt Advanced: Silver",   category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Advanced course under Silver par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18479] = { id=18479, name="Blasted Lands Bolt Advanced: Gold",     category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Advanced course under Gold par time.",   npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18480] = { id=18480, name="Blasted Lands Bolt Reverse: Bronze",    category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Reverse course under Bronze par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18481] = { id=18481, name="Blasted Lands Bolt Reverse: Silver",    category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Reverse course under Silver par time.", npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },

    [18482] = { id=18482, name="Blasted Lands Bolt Reverse: Gold",      category="Skyriding", zone="Blasted Lands", mapID=17,
        steps={ { index=1, desc="Complete the Blasted Lands Bolt Reverse course under Gold par time.",   npc="Blasted Lands Bolt Race", coords={x=62.0,y=27.0}, mapID=17, criteriaIndex=nil } } },
}

-- Zone → achievement ID list, populated at load time in AchievementData.lua
GP.Data.ByZone = {}
