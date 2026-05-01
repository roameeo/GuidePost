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
--
-- FACTION: Set to "Alliance" or "Horde" for faction-specific achievements.
--   Leave blank (or omit) for neutral/cross-faction achievements.
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
                mapID         = 647,   -- Ghostlands
                criteriaIndex = 1,
            },
            {
                index         = 2,
                -- Previously called "Moccasin" (NPC 4953) — renamed to Water Snake.
                -- Easiest location: Orgrimmar rivers near the Valley of Spirits.
                -- Also found in Durotar, Northern Stranglethorn, Swamp of Sorrows.
                -- criteriaIndex: verify with /gp criteria 2556 if progress doesn't track.
                desc          = "Kill a Water Snake in Orgrimmar near the Valley of Spirits (SW river). Also in Durotar, N. Stranglethorn, or Swamp of Sorrows.",
                npc           = "Water Snake",
                coords        = { x = 37.0, y = 82.0 },
                mapID         = 1454,  -- Orgrimmar
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Kill a Spider in Howling Fjord, Ghostlands, or several Northrend dungeons.",
                npc           = "Spider",
                coords        = { x = 45.0, y = 27.0 },
                mapID         = 647,   -- Ghostlands (spiders near Tranquillien)
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Kill a Squirrel in Elwynn Forest (Alliance) or Grizzly Hills (neutral). Dalaran also has squirrels running loose in the streets.",
                npc           = "Squirrel",
                coords        = { x = 47.0, y = 67.0 },
                mapID         = 37,    -- Elwynn Forest; Horde: use Grizzly Hills (494) or Dalaran (502)
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Kill an Underbelly Rat in the Dalaran Sewers (enter via the grate in Dalaran).",
                npc           = "Underbelly Rat",
                coords        = { x = 42.0, y = 90.0 },
                mapID         = 502,   -- Dalaran (Northrend); verify with /gp mapid
                criteriaIndex = 5,
            },
            {
                index         = 6,
                desc          = "Kill a Devouring Maggot in Howling Fjord (Utgarde Catacombs area, coords 57, 55).",
                npc           = "Devouring Maggot",
                coords        = { x = 57.0, y = 55.0 },
                mapID         = 491,   -- Howling Fjord
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
                mapID         = 496,   -- Zul'Drak
                criteriaIndex = 8,
            },
            {
                index         = 9,
                desc          = "Kill a Roach in Howling Fjord or Ahn'Kahet.",
                npc           = "Roach",
                coords        = { x = 36.0, y = 11.0 },
                mapID         = 491,   -- Howling Fjord
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
                desc          = "Kill a Crystal Spider in Winterspring near Lake Kel'Theril (NW area) — far easier than queuing for The Nexus. Also found in Tanaan Jungle or inside The Nexus/Oculus.",
                npc           = "Crystal Spider",
                coords        = { x = 44.0, y = 49.0 },
                mapID         = nil,   -- Winterspring; verify with /gp mapid
                criteriaIndex = 11,
            },
            {
                index         = 12,
                desc          = "Kill an Adder in Durotar near Razor Hill (easiest for Horde). Also in Hellfire Peninsula or the Barrens.",
                npc           = "Adder",
                coords        = { x = 41.0, y = 52.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = 12,
            },
            {
                index         = 13,
                desc          = "Kill a Maggot in Ghostlands or outside Naxxramas.",
                npc           = "Maggot",
                coords        = { x = 45.0, y = 27.0 },
                mapID         = 647,   -- Ghostlands
                criteriaIndex = 13,
            },
            {
                index         = 14,
                desc          = "Kill a Scorpion in Hellfire Peninsula or Eastern Plaguelands (NPC is named Scorpid in-game).",
                npc           = "Scorpion",
                coords        = { x = 52.0, y = 50.0 },
                mapID         = 466,   -- Hellfire Peninsula
                criteriaIndex = 14,
            },
            {
                index         = 15,
                desc          = "Kill a Fjord Rat in Howling Fjord (Northrend).",
                npc           = "Fjord Rat",
                coords        = { x = 58.0, y = 62.0 },
                mapID         = 491,   -- Howling Fjord
                criteriaIndex = 15,
            },
            {
                index         = 16,
                desc          = "Kill a Fire Beetle in Searing Gorge or Burning Steppes. Searing Gorge has the most spawns (W side of zone).",
                npc           = "Fire Beetle",
                coords        = { x = 53.0, y = 62.0 },
                mapID         = nil,   -- Searing Gorge; verify with /gp mapid
                criteriaIndex = 16,
            },
            {
                index         = 17,
                desc          = "Kill a Gold Beetle in Badlands (outdoor, no dungeon needed — easiest option). Also inside Halls of Lightning or Halls of Stone (Storm Peaks).",
                npc           = "Gold Beetle",
                coords        = { x = 42.0, y = 23.0 },
                mapID         = nil,   -- Storm Peaks or Badlands; verify with /gp mapid
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


    -- =========================================================================
    -- HORDE ACHIEVEMENTS
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Orgrimmar" (ID 1012)
    -- Explore all districts of Orgrimmar.
    -- -------------------------------------------------------------------------
    [1012] = {
        id       = 1012,
        name     = "Explore Orgrimmar",
        category = "Exploration",
        zone     = "Orgrimmar",
        faction  = "Horde",
        mapID    = 1454,
        steps = {
            {
                index         = 1,
                desc          = "Discover The Valley of Spirits.",
                npc           = nil,
                coords        = { x = 37.0, y = 87.0 },
                mapID         = 1454,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Discover The Valley of Strength (main city center with bank).",
                npc           = nil,
                coords        = { x = 51.0, y = 76.0 },
                mapID         = 1454,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Discover The Valley of Wisdom (Grommash Hold area).",
                npc           = nil,
                coords        = { x = 48.0, y = 71.0 },
                mapID         = 1454,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Discover The Valley of Honor (auction house district).",
                npc           = nil,
                coords        = { x = 51.0, y = 38.0 },
                mapID         = 1454,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Discover The Drag (zeppelin tower and profession trainers).",
                npc           = nil,
                coords        = { x = 55.0, y = 63.0 },
                mapID         = 1454,
                criteriaIndex = 5,
            },
            {
                index         = 6,
                desc          = "Discover The Cleft of Shadow (rogue/warlock area).",
                npc           = nil,
                coords        = { x = 47.0, y = 59.0 },
                mapID         = 1454,
                criteriaIndex = 6,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Champion of Orgrimmar" (ID 2783)
    -- Earn the right to represent Orgrimmar at the Argent Tournament.
    -- -------------------------------------------------------------------------
    [2783] = {
        id       = 2783,
        name     = "Champion of Orgrimmar",
        category = "Argent Tournament",
        zone     = "Icecrown",
        faction  = "Horde",
        mapID    = nil,
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
                desc          = "Speak with the Orgrimmar Valiant and complete the daily jousting quests to earn 25 Champion's Seals. Then complete The Valiant's Challenge to become Champion.",
                npc           = "Orgrimmar Valiant",
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Exalted Champion of Orgrimmar" (ID 2765)
    -- Reach Exalted with Orgrimmar AND earn Champion status at the Tournament.
    -- -------------------------------------------------------------------------
    [2765] = {
        id       = 2765,
        name     = "Exalted Champion of Orgrimmar",
        category = "Argent Tournament",
        zone     = "Icecrown",
        faction  = "Horde",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Reach Exalted reputation with Orgrimmar. Do Orgrimmar quests, Horde battle quests, or buy Orgrimmar rep tokens from the Darkmoon Faire.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Earn Champion of Orgrimmar at the Argent Tournament (complete The Valiant's Challenge for the Orc faction).",
                npc           = "Orgrimmar Valiant",
                coords        = { x = 74.0, y = 20.0 },
                mapID         = nil,
                criteriaIndex = 2,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Let's Do Lunch: Orgrimmar" (ID 5475)
    -- Purchase and eat 5 specific foods from vendors around Orgrimmar.
    -- -------------------------------------------------------------------------
    [5475] = {
        id       = 5475,
        name     = "Let's Do Lunch: Orgrimmar",
        category = "Exploration",
        zone     = "Orgrimmar",
        faction  = "Horde",
        mapID    = 1454,
        steps = {
            {
                index         = 1,
                desc          = "Buy and eat Grilled Crab from a food vendor in the Valley of Strength.",
                npc           = "Food Vendor",
                coords        = { x = 51.0, y = 76.0 },
                mapID         = 1454,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Buy and eat Delicious Chocolate Cake from a vendor in the Valley of Spirits.",
                npc           = "Food Vendor",
                coords        = { x = 37.0, y = 87.0 },
                mapID         = 1454,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Buy and eat Kaldorei Spider Kabob from a vendor in the Valley of Honor.",
                npc           = "Food Vendor",
                coords        = { x = 51.0, y = 38.0 },
                mapID         = 1454,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Buy and eat Crunchy Frog from a vendor near Grommash Hold.",
                npc           = "Food Vendor",
                coords        = { x = 48.0, y = 71.0 },
                mapID         = 1454,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Buy and eat Roasted Boar Meat from a vendor in The Drag.",
                npc           = "Food Vendor",
                coords        = { x = 55.0, y = 63.0 },
                mapID         = 1454,
                criteriaIndex = 5,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Fish or Cut Bait: Orgrimmar" (ID 5477)
    -- Complete fishing daily quests in Orgrimmar.
    -- Pick up dailies from Razgar on the river docks.
    -- -------------------------------------------------------------------------
    [5477] = {
        id       = 5477,
        name     = "Fish or Cut Bait: Orgrimmar",
        category = "Professions",
        zone     = "Orgrimmar",
        faction  = "Horde",
        mapID    = 1454,
        steps = {
            {
                index         = 1,
                desc          = "Complete the daily fishing quest 'Clammy Hands' from Razgar in Orgrimmar.",
                npc           = "Razgar",
                coords        = { x = 70.0, y = 29.0 },
                mapID         = 1454,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Complete the daily fishing quest 'No Dumping!' from Razgar.",
                npc           = "Razgar",
                coords        = { x = 70.0, y = 29.0 },
                mapID         = 1454,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Complete the daily fishing quest 'A Golden Opportunity' from Razgar.",
                npc           = "Razgar",
                coords        = { x = 70.0, y = 29.0 },
                mapID         = 1454,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Complete the daily fishing quest 'Tadpole Terror' from Razgar.",
                npc           = "Razgar",
                coords        = { x = 70.0, y = 29.0 },
                mapID         = 1454,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Complete the daily fishing quest 'Like Pike?' from Razgar.",
                npc           = "Razgar",
                coords        = { x = 70.0, y = 29.0 },
                mapID         = 1454,
                criteriaIndex = 5,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Explore Mulgore" (ID 736)
    -- Explore all areas of Mulgore, the Tauren starting zone.
    -- -------------------------------------------------------------------------
    [736] = {
        id       = 736,
        name     = "Explore Mulgore",
        category = "Exploration",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Discover Red Cloud Mesa (Tauren starting area).",
                npc           = nil,
                coords        = { x = 52.0, y = 80.0 },
                mapID         = 7,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Discover Bloodhoof Village.",
                npc           = nil,
                coords        = { x = 47.0, y = 59.0 },
                mapID         = 7,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Discover Thunderhorn Water Well.",
                npc           = nil,
                coords        = { x = 44.0, y = 45.0 },
                mapID         = 7,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Discover Bael'dun Digsite.",
                npc           = nil,
                coords        = { x = 31.0, y = 49.0 },
                mapID         = 7,
                criteriaIndex = 4,
            },
            {
                index         = 5,
                desc          = "Discover Ravaged Caravan.",
                npc           = nil,
                coords        = { x = 53.0, y = 48.0 },
                mapID         = 7,
                criteriaIndex = 5,
            },
            {
                index         = 6,
                desc          = "Discover Red Rocks.",
                npc           = nil,
                coords        = { x = 59.0, y = 50.0 },
                mapID         = 7,
                criteriaIndex = 6,
            },
            {
                index         = 7,
                desc          = "Discover The Rolling Plains.",
                npc           = nil,
                coords        = { x = 62.0, y = 62.0 },
                mapID         = 7,
                criteriaIndex = 7,
            },
            {
                index         = 8,
                desc          = "Discover The Venture Co. Mine.",
                npc           = nil,
                coords        = { x = 62.0, y = 46.0 },
                mapID         = 7,
                criteriaIndex = 8,
            },
            {
                index         = 9,
                desc          = "Discover Palemane Rock.",
                npc           = nil,
                coords        = { x = 54.0, y = 48.0 },
                mapID         = 7,
                criteriaIndex = 9,
            },
            {
                index         = 10,
                desc          = "Discover Windfury Ridge.",
                npc           = nil,
                coords        = { x = 50.0, y = 23.0 },
                mapID         = 7,
                criteriaIndex = 10,
            },
            {
                index         = 11,
                desc          = "Discover The Golden Plains.",
                npc           = nil,
                coords        = { x = 54.0, y = 63.0 },
                mapID         = 7,
                criteriaIndex = 11,
            },
            {
                index         = 12,
                desc          = "Discover Wildmane Water Well.",
                npc           = nil,
                coords        = { x = 43.0, y = 15.0 },
                mapID         = 7,
                criteriaIndex = 12,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Explore Thunder Bluff" (ID 1003)
    -- Explore all platforms of Thunder Bluff.
    -- -------------------------------------------------------------------------
    [1003] = {
        id       = 1003,
        name     = "Explore Thunder Bluff",
        category = "Exploration",
        zone     = "Thunder Bluff",
        faction  = "Horde",
        mapID    = 1638,
        steps = {
            {
                index         = 1,
                desc          = "Discover The High Rise (central platform).",
                npc           = nil,
                coords        = { x = 46.0, y = 50.0 },
                mapID         = 1638,
                criteriaIndex = 1,
            },
            {
                index         = 2,
                desc          = "Discover The Hunter's Rise (northeast platform).",
                npc           = nil,
                coords        = { x = 59.0, y = 51.0 },
                mapID         = 1638,
                criteriaIndex = 2,
            },
            {
                index         = 3,
                desc          = "Discover The Spirit Rise (southeast platform with druid area).",
                npc           = nil,
                coords        = { x = 45.0, y = 65.0 },
                mapID         = 1638,
                criteriaIndex = 3,
            },
            {
                index         = 4,
                desc          = "Discover The Elder Rise (northwest platform with inn).",
                npc           = nil,
                coords        = { x = 28.0, y = 29.0 },
                mapID         = 1638,
                criteriaIndex = 4,
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- Durotar Dart — Skyriding Race (Normal/Advanced/Reverse)
    -- Eastern Kingdoms Cup event. Start NPC near Razor Hill.
    -- NOTE: This is a timed event race. The Eastern Kingdoms Cup must be active.
    -- Pick up the intro quest from Racing Enthusiast in Orgrimmar first.
    -- Bronze = easiest time, Gold = hardest. All three share the same start.
    -- -------------------------------------------------------------------------
    [18453] = {
        id       = 18453,
        name     = "Durotar Dart: Bronze",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = nil,   -- use /gp mapid in Durotar
        steps = {
            {
                index         = 1,
                desc          = "Pick up the Eastern Kingdoms Cup Circuit quest from Racing Enthusiast in Orgrimmar (if not already done).",
                npc           = "Racing Enthusiast",
                coords        = { x = 51.0, y = 76.0 },
                mapID         = 1454,  -- Orgrimmar
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Fly to the race start near Razor Hill in Durotar. Talk to the race NPC and complete the course under the Bronze par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18454] = {
        id       = 18454,
        name     = "Durotar Dart: Silver",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Same race start as Bronze. Complete the Durotar Dart course under the Silver par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18455] = {
        id       = 18455,
        name     = "Durotar Dart: Gold",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Same race start as Bronze/Silver. Complete the Durotar Dart course under the Gold par time. This is the hardest — learn the rings first on Bronze runs!",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18456] = {
        id       = 18456,
        name     = "Durotar Dart Advanced: Bronze",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Advanced course — same start location, harder route. Complete under the Bronze par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18457] = {
        id       = 18457,
        name     = "Durotar Dart Advanced: Silver",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Silver par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18458] = {
        id       = 18458,
        name     = "Durotar Dart Advanced: Gold",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Gold par time. Hardest of the advanced tier.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18459] = {
        id       = 18459,
        name     = "Durotar Dart Reverse: Bronze",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Reverse course — runs the rings in the opposite direction. Complete under the Bronze par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18460] = {
        id       = 18460,
        name     = "Durotar Dart Reverse: Silver",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Silver par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18461] = {
        id       = 18461,
        name     = "Durotar Dart Reverse: Gold",
        category = "Skyriding",
        zone     = "Durotar",
        faction  = "Horde",
        mapID    = 1,     -- Durotar
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Gold par time.",
                npc           = "Durotar Dart Race",
                coords        = { x = 52.0, y = 60.0 },
                mapID         = 1,     -- Durotar
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    -- -------------------------------------------------------------------------
    -- Mulgore Momentum — Skyriding Race (Normal/Advanced/Reverse)
    -- Eastern Kingdoms Cup event. Start NPC near Bloodhoof Village.
    -- NOTE: This is a timed event race. The Eastern Kingdoms Cup must be active.
    -- -------------------------------------------------------------------------
    [18462] = {
        id       = 18462,
        name     = "Mulgore Momentum: Bronze",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Mulgore Momentum course under Bronze par time. Race starts near Bloodhoof Village.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,  -- verify with /gp criteria
            },
        },
    },

    [18463] = {
        id       = 18463,
        name     = "Mulgore Momentum: Silver",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Mulgore Momentum course under Silver par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18464] = {
        id       = 18464,
        name     = "Mulgore Momentum: Gold",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Complete the Mulgore Momentum course under Gold par time. Master the route for the best time!",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18465] = {
        id       = 18465,
        name     = "Mulgore Momentum Advanced: Bronze",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Bronze par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18466] = {
        id       = 18466,
        name     = "Mulgore Momentum Advanced: Silver",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Silver par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18467] = {
        id       = 18467,
        name     = "Mulgore Momentum Advanced: Gold",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Advanced course. Complete under the Gold par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18468] = {
        id       = 18468,
        name     = "Mulgore Momentum Reverse: Bronze",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Bronze par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18469] = {
        id       = 18469,
        name     = "Mulgore Momentum Reverse: Silver",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Silver par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    [18470] = {
        id       = 18470,
        name     = "Mulgore Momentum Reverse: Gold",
        category = "Skyriding",
        zone     = "Mulgore",
        faction  = "Horde",
        mapID    = 7,
        steps = {
            {
                index         = 1,
                desc          = "Reverse course. Complete under the Gold par time.",
                npc           = "Mulgore Momentum Race",
                coords        = { x = 47.0, y = 58.0 },
                mapID         = 7,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- END HORDE SECTION
    -- =========================================================================

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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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
        faction  = "Alliance",
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

    -- =========================================================================
    -- MECHAGON (mapID 1462)
    -- Battle for Azeroth zone — island off the coast of Kul Tiras
    -- =========================================================================

    [13776] = {
        id       = 13776,
        name     = "Explore Mechagon",
        category = "Exploration",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1,  desc="Discover Rustbolt.",                    npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=1  },
            { index=2,  desc="Discover Junkwatt Depot.",              npc=nil, coords={x=56.0,y=52.0}, mapID=1462, criteriaIndex=2  },
            { index=3,  desc="Discover The Heaps.",                   npc=nil, coords={x=63.0,y=24.0}, mapID=1462, criteriaIndex=3  },
            { index=4,  desc="Discover Scrapbone Den.",               npc=nil, coords={x=66.0,y=58.0}, mapID=1462, criteriaIndex=4  },
            { index=5,  desc="Discover Bondo's Yard.",                npc=nil, coords={x=60.0,y=67.0}, mapID=1462, criteriaIndex=5  },
            { index=6,  desc="Discover The Outflow.",                 npc=nil, coords={x=73.0,y=54.0}, mapID=1462, criteriaIndex=6  },
            { index=7,  desc="Discover Sparkwelder Point.",           npc=nil, coords={x=81.0,y=19.0}, mapID=1462, criteriaIndex=7  },
            { index=8,  desc="Discover Western Spray.",               npc=nil, coords={x=28.0,y=77.0}, mapID=1462, criteriaIndex=8  },
        },
    },

    [13541] = {
        id       = 13541,
        name     = "Mecha-Done",
        category = "Quests",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Start the Mechagon storyline in Boralus at the Harbormaster's Office. Look for 'A Mission for the King' quest.",
                npc           = "Gila Crosswires",
                coords        = { x = 67.0, y = 15.0 },
                mapID         = 1161,  -- Boralus
                criteriaIndex = nil,
            },
            {
                index         = 2,
                desc          = "Complete the initial quests to unlock travel to Mechagon Island.",
                npc           = nil,
                coords        = { x = 67.0, y = 15.0 },
                mapID         = 1161,
                criteriaIndex = nil,
            },
            {
                index         = 3,
                desc          = "Arrive in Mechagon and help establish Rustbolt. Complete the main storyline quests given by Prince Erazmin.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
            {
                index         = 4,
                desc          = "Complete the Mechagon storyline ending with 'The Mechagonian Threat' quest chain.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13553] = {
        id       = 13553,
        name     = "Mecha-Done Mechano-Pest",
        category = "Player vs. Environment",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1,  desc="Kill Arachnoid Harvester (rare spawn in The Heaps).",          npc="Arachnoid Harvester",      coords={x=52.0,y=41.0}, mapID=1462, criteriaIndex=1  },
            { index=2,  desc="Kill Boilburn (rare spawn near The Outflow).",                 npc="Boilburn",                 coords={x=51.0,y=50.0}, mapID=1462, criteriaIndex=2  },
            { index=3,  desc="Kill Bonepicker (rare spawn in Bondo's Yard).",                npc="Bonepicker",               coords={x=65.0,y=76.0}, mapID=1462, criteriaIndex=3  },
            { index=4,  desc="Kill Earthbreaker Gulroc (rare spawn in Western Spray).",      npc="Earthbreaker Gulroc",      coords={x=33.0,y=64.0}, mapID=1462, criteriaIndex=4  },
            { index=5,  desc="Kill Foul Manifestation (rare spawn near The Outflow).",       npc="Foul Manifestation",       coords={x=67.0,y=55.0}, mapID=1462, criteriaIndex=5  },
            { index=6,  desc="Kill Fungarian Furor (rare spawn in Western Spray caves).",    npc="Fungarian Furor",          coords={x=44.0,y=62.0}, mapID=1462, criteriaIndex=6  },
            { index=7,  desc="Kill Gemicide (rare spawn in Sparkwelder Point).",             npc="Gemicide",                 coords={x=81.0,y=26.0}, mapID=1462, criteriaIndex=7  },
            { index=8,  desc="Kill Caustic Mechaslime (rare spawn in The Heaps).",           npc="Caustic Mechaslime",       coords={x=66.0,y=58.0}, mapID=1462, criteriaIndex=8  },
            { index=9,  desc="Kill Gear Checker Cogstar (rare spawn near Junkwatt Depot).",  npc="Gear Checker Cogstar",     coords={x=59.0,y=56.0}, mapID=1462, criteriaIndex=9  },
            { index=10, desc="Kill Killsaw (rare spawn in The Heaps).",                      npc="Killsaw",                  coords={x=60.0,y=42.0}, mapID=1462, criteriaIndex=10 },
            { index=11, desc="Kill Malfunctioning Beastbot (rare spawn throughout zone).",   npc="Malfunctioning Beastbot",  coords={x=60.0,y=42.0}, mapID=1462, criteriaIndex=11 },
            { index=12, desc="Kill Mechagonian Nullifier (rare spawn near Rustbolt).",       npc="Mechagonian Nullifier",    coords={x=56.0,y=36.0}, mapID=1462, criteriaIndex=12 },
            { index=13, desc="Kill Ol' Big Tusk (rare spawn in Western Spray).",             npc="Ol' Big Tusk",             coords={x=55.0,y=77.0}, mapID=1462, criteriaIndex=13 },
            { index=14, desc="Kill Oxidized Leachbeast (rare spawn in The Outflow).",        npc="Oxidized Leachbeast",      coords={x=82.0,y=20.0}, mapID=1462, criteriaIndex=14 },
            { index=15, desc="Kill Paol Pondwader (rare spawn near Western Spray).",         npc="Paol Pondwader",           coords={x=22.0,y=77.0}, mapID=1462, criteriaIndex=15 },
            { index=16, desc="Kill Rustfeather (rare spawn on cliffs — grants mount!).",     npc="Rustfeather",              coords={x=65.0,y=79.0}, mapID=1462, criteriaIndex=16 },
            { index=17, desc="Kill Scrapclaw (rare spawn near Scrapbone Den).",              npc="Scrapclaw",                coords={x=19.0,y=81.0}, mapID=1462, criteriaIndex=17 },
            { index=18, desc="Kill Steel Singer Freza (rare spawn in Junkwatt Depot).",      npc="Steel Singer Freza",       coords={x=25.0,y=77.0}, mapID=1462, criteriaIndex=18 },
            { index=19, desc="Kill The Doppel Gang (rare spawn event throughout zone).",     npc="The Doppel Gang",          coords={x=80.0,y=21.0}, mapID=1462, criteriaIndex=19 },
            { index=20, desc="Kill The Kleptoboss (rare spawn in The Heaps).",               npc="The Kleptoboss",           coords={x=68.0,y=48.0}, mapID=1462, criteriaIndex=20 },
        },
    },


    [13470] = {
        id       = 13470,
        name     = "Rest In Pistons",
        category = "Pet Battles",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1, desc="Defeat Creakclank in a pet battle in Junkwatt Depot.",     npc="Creakclank",  coords={x=40.0,y=40.0}, mapID=1462, criteriaIndex=1 },
            { index=2, desc="Defeat Chippy Cyberbot in a pet battle near Rustbolt.",    npc="Chippy Cyberbot", coords={x=59.0,y=36.0}, mapID=1462, criteriaIndex=2 },
            { index=3, desc="Defeat CK-9 Micro-Oppression Unit in a pet battle.",       npc="CK-9 Micro-Oppression Unit", coords={x=51.0,y=58.0}, mapID=1462, criteriaIndex=3 },
        },
    },


    [13479] = {
        id       = 13479,
        name     = "Explore Mechagon (Hidden)",
        category = "Exploration",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1, desc="Discover the alternate future timeline areas by using the Chromie Time feature or finding the hidden portals in Mechagon.", npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=nil },
        },
    },

    [13513] = {
        id       = 13513,
        name     = "Available in Eight Colors",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Collect all 8 painted Mechanospider mount colors. Purchase Paint Vials from the Stolen Royal Vendorbot (requires Exalted with Rustbolt Resistance) and apply them to your Mechagon Mechanostrider.",
                npc           = "Stolen Royal Vendorbot",
                coords        = { x = 73.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13545] = {
        id       = 13545,
        name     = "The Mechagonian Threat",
        category = "Quests",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1, desc="Complete 'The Resistance Needs You!' quest.",           npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=1 },
            { index=2, desc="Complete 'My Father, the Despot' quest.",               npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=2 },
            { index=3, desc="Complete 'A Strong Heart' quest.",                      npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=3 },
            { index=4, desc="Complete 'A Tempered Blade' quest.",                    npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=4 },
            { index=5, desc="Complete 'A Clear Mind' quest.",                        npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=5 },
            { index=6, desc="Complete 'Chopped Bots' quest.",                        npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=6 },
            { index=7, desc="Complete 'The Mechagonian Threat' final quest.",        npc="Prince Erazmin", coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=7 },
        },
    },

    [13555] = {
        id       = 13555,
        name     = "Junkyard Architect",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1,  desc="Contribute to the Annihilation Aficionados construction project.",    npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=1  },
            { index=2,  desc="Contribute to the Blingtron 7000 construction project.",              npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=2  },
            { index=3,  desc="Contribute to the Blueprint Bonanza construction project.",           npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=3  },
            { index=4,  desc="Contribute to the Bug Brawlers construction project.",                npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=4  },
            { index=5,  desc="Contribute to the Data Donations construction project.",              npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=5  },
            { index=6,  desc="Contribute to the Drill Rig DR-CC88 construction project.",           npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=6  },
            { index=7,  desc="Contribute to the Drill Rig DR-JD41 construction project.",           npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=7  },
            { index=8,  desc="Contribute to the Drill Rig DR-TR35 construction project.",           npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=8  },
            { index=9,  desc="Contribute to the Oscillating Oxygen Octagon construction project.",  npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=9  },
            { index=10, desc="Contribute to the Rec Rig construction project.",                     npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=10 },
            { index=11, desc="Contribute to the Rustbolt Kegerator construction project.",          npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=11 },
            { index=12, desc="Contribute to the Rustbolt Armory construction project.",             npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=12 },
            { index=13, desc="Contribute to the Secret Lab construction project.",                  npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=13 },
        },
    },

    [13503] = {
        id       = 13503,
        name     = "A Fresh Coat of Paint",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Obtain one painted Mechanospider mount color. Purchase a Paint Vial from the Stolen Royal Vendorbot and apply it to your Mechagon Mechanostrider mount.",
                npc           = "Stolen Royal Vendorbot",
                coords        = { x = 73.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },


    [13497] = {
        id       = 13497,
        name     = "Subaquatic Support",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete 'Keeping the Rust Bucket Afloat' quest — help with the daily construction project. This quest becomes available each day when a new project is active.",
                npc           = "Recyclerizer DX-82",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13563] = {
        id       = 13563,
        name     = "Diversified Investments",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete construction projects on 10 different days. Check the bulletin board in Rustbolt each day and donate Spare Parts to the active project.",
                npc           = "Recyclerizer DX-82",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },



    [13798] = {
        id       = 13798,
        name     = "Remix to Ignition",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete a construction project while the Blingtron 7000 daily is active. This summons a special Blingtron that everyone can use.",
                npc           = "Recyclerizer DX-82",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13474] = {
        id       = 13474,
        name     = "Mrrl's Secret Stash",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Find Mrrl (a murloc trader) on the western shores of Mechagon and trade Prismatic Manapearls for items from his secret inventory. Requires Nazjatar progress to obtain pearls.",
                npc           = "Mrrl",
                coords        = { x = 37.0, y = 47.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13502] = {
        id       = 13502,
        name     = "The Rusty Prince",
        category = "Quests",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete the 'His Eye Upon You' meta-quest from Prince Erazmin. Requires completing various daily quests and activities in Mechagon.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },


    [13501] = {
        id       = 13501,
        name     = "Heroic: Operation: Mechagon",
        category = "Dungeons & Raids",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete Operation: Mechagon on Heroic difficulty. Enter the dungeon from the Mechagon outdoor zone — entrance is in northern Mechagon.",
                npc           = nil,
                coords        = { x = 60.0, y = 26.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13694] = {
        id       = 13694,
        name     = "Mythic: Operation: Mechagon",
        category = "Dungeons & Raids",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete Operation: Mechagon on Mythic difficulty. Use the group finder or form a premade group.",
                npc           = nil,
                coords        = { x = 60.0, y = 26.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13789] = {
        id       = 13789,
        name     = "Cutting Edge: King Mechagon",
        category = "Dungeons & Raids",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Defeat King Mechagon in Operation: Mechagon on Mythic difficulty before the start of the next raid tier. This is a Feat of Strength — limited time!",
                npc           = "King Mechagon",
                coords        = { x = 60.0, y = 26.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13790] = {
        id       = 13790,
        name     = "Armed for Action",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Equip an Azerite Helm, Shoulders, and Chest piece all with at least item level 370, and all obtained from Mechagon sources. Run Operation: Mechagon dungeon and outdoor activities.",
                npc           = nil,
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13710] = {
        id       = 13710,
        name     = "Scrappy's Best Friend",
        category = "Pet Battles",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Collect Scrappy (battle pet) from Mechagon rare spawns or as a reward from pet battles. Can be purchased from Pascal-K1N6 after unlocking.",
                npc           = "Pascal-K1N6",
                coords        = { x = 71.0, y = 32.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },


    [13512] = {
        id       = 13512,
        name     = "Mecha-Done: The Mechagonian Threat",
        category = "Quests",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete the final chapter of the Mechagon storyline. This culminates in confronting King Mechagon's plans.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13556] = {
        id       = 13556,
        name     = "Outside Influences",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Complete 30 daily quests for the Rustbolt Resistance. Pick up new dailies each day from various NPCs in Rustbolt.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13571] = {
        id       = 13571,
        name     = "Rustbolt Rebellion",
        category = "Reputation",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            {
                index         = 1,
                desc          = "Reach Revered reputation with the Rustbolt Resistance. Complete dailies, kill rares, and donate Spare Parts to construction projects.",
                npc           = "Prince Erazmin",
                coords        = { x = 71.0, y = 36.0 },
                mapID         = 1462,
                criteriaIndex = nil,
            },
        },
    },

    [13698] = {
        id       = 13698,
        name     = "Clean Up On Aisle Mechagon",
        category = "General",
        zone     = "Mechagon",
        mapID    = 1462,
        steps = {
            { index=1, desc="Loot a Vinyl: Mecha-Cassette (Gnomeregan's Groovin' Tunes) from trash or rares.",  npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=1 },
            { index=2, desc="Loot a Vinyl: Mecha-Cassette (Depths of Ulduar) from trash or rares.",             npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=2 },
            { index=3, desc="Loot a Vinyl: Mecha-Cassette (Battle for Gnomeregan) from trash or rares.",        npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=3 },
            { index=4, desc="Loot a Vinyl: Mecha-Cassette (Mimiron's Revenge) from trash or rares.",            npc=nil, coords={x=71.0,y=36.0}, mapID=1462, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- WESTFALL (mapID 52)
    -- =========================================================================

    [802] = {
        id       = 802,
        name     = "Explore Westfall",
        category = "Exploration",
        zone     = "Westfall",
        mapID    = 52,
        steps = {
            { index=1,  desc="Discover Sentinel Hill.",          npc=nil, coords={x=56.0,y=49.0}, mapID=52, criteriaIndex=1  },
            { index=2,  desc="Discover Saldean's Farm.",         npc=nil, coords={x=53.0,y=57.0}, mapID=52, criteriaIndex=2  },
            { index=3,  desc="Discover Furlbrow's Pumpkin Farm.", npc=nil, coords={x=51.0,y=22.0}, mapID=52, criteriaIndex=3  },
            { index=4,  desc="Discover The Jansen Stead.",       npc=nil, coords={x=58.0,y=17.0}, mapID=52, criteriaIndex=4  },
            { index=5,  desc="Discover Moonbrook.",              npc=nil, coords={x=42.0,y=64.0}, mapID=52, criteriaIndex=5  },
            { index=6,  desc="Discover Alexston Farmstead.",     npc=nil, coords={x=36.0,y=54.0}, mapID=52, criteriaIndex=6  },
            { index=7,  desc="Discover The Molsen Farm.",        npc=nil, coords={x=44.0,y=32.0}, mapID=52, criteriaIndex=7  },
            { index=8,  desc="Discover The Deadmines.",          npc=nil, coords={x=40.0,y=76.0}, mapID=52, criteriaIndex=8  },
            { index=9,  desc="Discover The Dagger Hills.",       npc=nil, coords={x=65.0,y=68.0}, mapID=52, criteriaIndex=9  },
            { index=10, desc="Discover Demont's Place.",         npc=nil, coords={x=33.0,y=22.0}, mapID=52, criteriaIndex=10 },
            { index=11, desc="Discover The Dust Plains.",        npc=nil, coords={x=63.0,y=35.0}, mapID=52, criteriaIndex=11 },
        },
    },

    [4903] = {
        id       = 4903,
        name     = "Westfall Quests",
        category = "Quests",
        zone     = "Westfall",
        mapID    = 52,
        steps = {
            { index=1, desc="Complete the Defias Brotherhood quest chain in Westfall.",     npc="Gryan Stoutmantle", coords={x=56.0,y=49.0}, mapID=52, criteriaIndex=1 },
            { index=2, desc="Complete the Murder Was The Case That They Gave Me chain.",    npc="Captain Danuvin",   coords={x=56.0,y=49.0}, mapID=52, criteriaIndex=2 },
            { index=3, desc="Complete the Lou's Parting Thoughts quest chain.",             npc="Lou Stoutmantle",   coords={x=56.0,y=49.0}, mapID=52, criteriaIndex=3 },
            { index=4, desc="Complete The Westfall Brigade quest chain at Sentinel Hill.",  npc=nil,                 coords={x=56.0,y=49.0}, mapID=52, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- SEARING GORGE (mapID 32)
    -- =========================================================================

    [774] = {
        id       = 774,
        name     = "Explore Searing Gorge",
        category = "Exploration",
        zone     = "Searing Gorge",
        mapID    = 32,
        steps = {
            { index=1, desc="Discover Firewatch Ridge.",      npc=nil, coords={x=53.0,y=42.0}, mapID=32, criteriaIndex=1 },
            { index=2, desc="Discover Blackrock Mountain.",   npc=nil, coords={x=35.0,y=82.0}, mapID=32, criteriaIndex=2 },
            { index=3, desc="Discover The Cauldron.",         npc=nil, coords={x=50.0,y=52.0}, mapID=32, criteriaIndex=3 },
            { index=4, desc="Discover Thorium Point.",        npc=nil, coords={x=37.0,y=31.0}, mapID=32, criteriaIndex=4 },
            { index=5, desc="Discover Dustfire Valley.",      npc=nil, coords={x=27.0,y=59.0}, mapID=32, criteriaIndex=5 },
            { index=6, desc="Discover Grimesilt Dig Site.",   npc=nil, coords={x=63.0,y=61.0}, mapID=32, criteriaIndex=6 },
            { index=7, desc="Discover Blackchar Cave.",       npc=nil, coords={x=17.0,y=54.0}, mapID=32, criteriaIndex=7 },
        },
    },

    [4870] = {
        id       = 4870,
        name     = "Searing Gorge Quests",
        category = "Quests",
        zone     = "Searing Gorge",
        mapID    = 32,
        steps = {
            { index=1, desc="Complete the Thorium Brotherhood quest chain at Thorium Point.",   npc="Burth Stonekin",   coords={x=37.0,y=31.0}, mapID=32, criteriaIndex=1 },
            { index=2, desc="Complete the Dark Iron Dwarves quest chain.",                      npc="Lunk",             coords={x=68.0,y=53.0}, mapID=32, criteriaIndex=2 },
            { index=3, desc="Complete A New Master quest chain (Lunk's story).",                npc="Lunk",             coords={x=68.0,y=53.0}, mapID=32, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- GHOSTLANDS (mapID 95)
    -- Blood Elf starting zone (levels 10-20)
    -- =========================================================================

    [858] = {
        id       = 858,
        name     = "Explore Ghostlands",
        category = "Exploration",
        zone     = "Ghostlands",
        mapID    = 95,
        steps = {
            { index=1,  desc="Discover Tranquillien.",              npc=nil, coords={x=48.0,y=31.0}, mapID=95, criteriaIndex=1  },
            { index=2,  desc="Discover Suncrown Village.",          npc=nil, coords={x=68.0,y=14.0}, mapID=95, criteriaIndex=2  },
            { index=3,  desc="Discover Dawnstar Spire.",            npc=nil, coords={x=55.0,y=48.0}, mapID=95, criteriaIndex=3  },
            { index=4,  desc="Discover Windrunner Village.",        npc=nil, coords={x=40.0,y=49.0}, mapID=95, criteriaIndex=4  },
            { index=5,  desc="Discover Windrunner Spire.",          npc=nil, coords={x=31.0,y=57.0}, mapID=95, criteriaIndex=5  },
            { index=6,  desc="Discover Sanctum of the Sun.",        npc=nil, coords={x=54.0,y=26.0}, mapID=95, criteriaIndex=6  },
            { index=7,  desc="Discover Sanctum of the Moon.",       npc=nil, coords={x=63.0,y=74.0}, mapID=95, criteriaIndex=7  },
            { index=8,  desc="Discover Howling Ziggurat.",          npc=nil, coords={x=33.0,y=81.0}, mapID=95, criteriaIndex=8  },
            { index=9,  desc="Discover Bleeding Ziggurat.",         npc=nil, coords={x=66.0,y=82.0}, mapID=95, criteriaIndex=9  },
            { index=10, desc="Discover Zeb'Nowa.",                  npc=nil, coords={x=66.0,y=31.0}, mapID=95, criteriaIndex=10 },
            { index=11, desc="Discover Amani Pass.",                npc=nil, coords={x=82.0,y=28.0}, mapID=95, criteriaIndex=11 },
            { index=12, desc="Discover Deatholme.",                 npc=nil, coords={x=32.0,y=18.0}, mapID=95, criteriaIndex=12 },
            { index=13, desc="Discover Elrendar Crossing.",         npc=nil, coords={x=55.0,y=15.0}, mapID=95, criteriaIndex=13 },
            { index=14, desc="Discover Farstrider Enclave.",        npc=nil, coords={x=71.0,y=32.0}, mapID=95, criteriaIndex=14 },
            { index=15, desc="Discover Goldenmist Village.",        npc=nil, coords={x=70.0,y=67.0}, mapID=95, criteriaIndex=15 },
            { index=16, desc="Discover Howling Ziggurat.",          npc=nil, coords={x=39.0,y=14.0}, mapID=95, criteriaIndex=16 },
            { index=17, desc="Discover Isle of Tribulations.",      npc=nil, coords={x=73.0,y=84.0}, mapID=95, criteriaIndex=17 },
        },
    },

    [4908] = {
        id       = 4908,
        name     = "Ghostlands Quests",
        category = "Quests",
        zone     = "Ghostlands",
        mapID    = 95,
        steps = {
            { index=1, desc="Complete the Tranquillien quest chain — main hub in Ghostlands.",       npc="Magistrix Landra Dawnstrider", coords={x=48.0,y=31.0}, mapID=95, criteriaIndex=1 },
            { index=2, desc="Complete the Dawnstar Spire quest chain.",                              npc=nil,                            coords={x=55.0,y=48.0}, mapID=95, criteriaIndex=2 },
            { index=3, desc="Complete the Windrunner Village quest chain (Sylvanas's homeland).",    npc=nil,                            coords={x=40.0,y=49.0}, mapID=95, criteriaIndex=3 },
            { index=4, desc="Complete the Deatholme finale quest chain (end zone area).",            npc=nil,                            coords={x=32.0,y=18.0}, mapID=95, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- EASTERN KINGDOMS META ACHIEVEMENTS
    -- =========================================================================

    [42] = {
        id       = 42,
        name     = "Explore Eastern Kingdoms",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1,  desc="Complete Explore Arathi Highlands.",               npc=nil, coords={x=52.0,y=36.0}, mapID=14,   criteriaIndex=1  },
            { index=2,  desc="Complete Explore Badlands.",                       npc=nil, coords={x=52.0,y=47.0}, mapID=15,   criteriaIndex=2  },
            { index=3,  desc="Complete Explore Blasted Lands.",                  npc=nil, coords={x=47.0,y=64.0}, mapID=17,   criteriaIndex=3  },
            { index=4,  desc="Complete Explore Burning Steppes.",                npc=nil, coords={x=52.0,y=45.0}, mapID=36,   criteriaIndex=4  },
            { index=5,  desc="Complete Explore Deadwind Pass.",                  npc=nil, coords={x=42.0,y=72.0}, mapID=42,   criteriaIndex=5  },
            { index=6,  desc="Complete Explore Dun Morogh.",                     npc=nil, coords={x=46.0,y=64.0}, mapID=27,   criteriaIndex=6  },
            { index=7,  desc="Complete Explore Duskwood.",                       npc=nil, coords={x=73.0,y=52.0}, mapID=47,   criteriaIndex=7  },
            { index=8,  desc="Complete Explore Eastern Plaguelands.",            npc=nil, coords={x=74.0,y=54.0}, mapID=23,   criteriaIndex=8  },
            { index=9,  desc="Complete Explore Elwynn Forest.",                  npc=nil, coords={x=42.0,y=65.0}, mapID=37,   criteriaIndex=9  },
            { index=10, desc="Complete Explore Eversong Woods.",                 npc=nil, coords={x=47.0,y=68.0}, mapID=2395, criteriaIndex=10 },
            { index=11, desc="Complete Explore Ghostlands.",                     npc=nil, coords={x=48.0,y=31.0}, mapID=95,   criteriaIndex=11 },
            { index=12, desc="Complete Explore Hillsbrad Foothills.",            npc=nil, coords={x=49.0,y=60.0}, mapID=25,   criteriaIndex=12 },
            { index=13, desc="Complete Explore Loch Modan.",                     npc=nil, coords={x=33.0,y=49.0}, mapID=48,   criteriaIndex=13 },
            { index=14, desc="Complete Explore Redridge Mountains.",             npc=nil, coords={x=53.0,y=53.0}, mapID=49,   criteriaIndex=14 },
            { index=15, desc="Complete Explore Searing Gorge.",                  npc=nil, coords={x=37.0,y=31.0}, mapID=32,   criteriaIndex=15 },
            { index=16, desc="Complete Explore Silverpine Forest.",              npc=nil, coords={x=46.0,y=42.0}, mapID=21,   criteriaIndex=16 },
            { index=17, desc="Complete Explore Swamp of Sorrows.",               npc=nil, coords={x=46.0,y=55.0}, mapID=51,   criteriaIndex=17 },
            { index=18, desc="Complete Explore The Hinterlands.",                npc=nil, coords={x=65.0,y=47.0}, mapID=26,   criteriaIndex=18 },
            { index=19, desc="Complete Explore Tirisfal Glades.",                npc=nil, coords={x=60.0,y=51.0}, mapID=18,   criteriaIndex=19 },
            { index=20, desc="Complete Explore Western Plaguelands.",            npc=nil, coords={x=43.0,y=69.0}, mapID=22,   criteriaIndex=20 },
            { index=21, desc="Complete Explore Westfall.",                       npc=nil, coords={x=56.0,y=49.0}, mapID=52,   criteriaIndex=21 },
            { index=22, desc="Complete Explore Wetlands.",                       npc=nil, coords={x=17.0,y=36.0}, mapID=56,   criteriaIndex=22 },
            { index=23, desc="Complete Explore Northern Stranglethorn.",         npc=nil, coords={x=39.0,y=50.0}, mapID=50,   criteriaIndex=23 },
            { index=24, desc="Complete Explore The Cape of Stranglethorn.",      npc=nil, coords={x=36.0,y=72.0}, mapID=210,  criteriaIndex=24 },
            { index=25, desc="Complete Explore Twilight Highlands.",             npc=nil, coords={x=54.0,y=30.0}, mapID=241,  criteriaIndex=25 },
        },
    },

    [1676] = {
        id       = 1676,
        name     = "Loremaster of Eastern Kingdoms",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete questing achievements in all major Eastern Kingdoms zones (Arathi, Badlands, Blasted Lands, Burning Steppes, Eastern Plaguelands, Ghostlands, Hillsbrad, Hinterlands, Northern Stranglethorn, Redridge, Searing Gorge, Silverpine, Swamp of Sorrows, Twilight Highlands, Western Plaguelands, Westfall, Wetlands, Duskwood, Cape of Stranglethorn, Loch Modan).",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- KALIMDOR ZONES
    -- =========================================================================

    -- =========================================================================
    -- AZSHARA (mapID 76)
    -- =========================================================================

    [852] = {
        id       = 852,
        name     = "Explore Azshara",
        category = "Exploration",
        zone     = "Azshara",
        mapID    = 76,
        steps = {
            { index=1,  desc="Discover Bilgewater Harbor.",           npc=nil, coords={x=56.0,y=50.0}, mapID=76, criteriaIndex=1  },
            { index=2,  desc="Discover Lake Mennar.",                 npc=nil, coords={x=59.0,y=75.0}, mapID=76, criteriaIndex=2  },
            { index=3,  desc="Discover Ruins of Eldarath.",           npc=nil, coords={x=40.0,y=75.0}, mapID=76, criteriaIndex=3  },
            { index=4,  desc="Discover Tower of Eldara.",             npc=nil, coords={x=82.0,y=64.0}, mapID=76, criteriaIndex=4  },
            { index=5,  desc="Discover Valormok.",                    npc=nil, coords={x=50.0,y=26.0}, mapID=76, criteriaIndex=5  },
            { index=6,  desc="Discover Ravencrest Monument.",         npc=nil, coords={x=65.0,y=17.0}, mapID=76, criteriaIndex=6  },
            { index=7,  desc="Discover The Ruined Reaches.",          npc=nil, coords={x=39.0,y=45.0}, mapID=76, criteriaIndex=7  },
            { index=8,  desc="Discover Bitter Reaches.",              npc=nil, coords={x=72.0,y=28.0}, mapID=76, criteriaIndex=8  },
            { index=9,  desc="Discover Southridge Beach.",            npc=nil, coords={x=64.0,y=85.0}, mapID=76, criteriaIndex=9  },
            { index=10, desc="Discover The Secret Lab.",              npc=nil, coords={x=29.0,y=48.0}, mapID=76, criteriaIndex=10 },
            { index=11, desc="Discover Ursolan.",                     npc=nil, coords={x=37.0,y=20.0}, mapID=76, criteriaIndex=11 },
        },
    },

    [4927] = {
        id       = 4927,
        name     = "Azshara Quests",
        category = "Quests",
        zone     = "Azshara",
        mapID    = 76,
        steps = {
            { index=1, desc="Complete the Bilgewater Cartel quest chain in Azshara.",   npc=nil, coords={x=56.0,y=50.0}, mapID=76, criteriaIndex=1 },
            { index=2, desc="Complete The Secrets of Azshara quest chain.",            npc=nil, coords={x=56.0,y=50.0}, mapID=76, criteriaIndex=2 },
            { index=3, desc="Complete the Arcane Pinnacle quest chain.",               npc=nil, coords={x=29.0,y=48.0}, mapID=76, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- ASHENVALE (mapID 63)
    -- =========================================================================

    [845] = {
        id       = 845,
        name     = "Explore Ashenvale",
        category = "Exploration",
        zone     = "Ashenvale",
        mapID    = 63,
        steps = {
            { index=1,  desc="Discover Astranaar.",                   npc=nil, coords={x=35.0,y=49.0}, mapID=63, criteriaIndex=1  },
            { index=2,  desc="Discover Raynewood Retreat.",           npc=nil, coords={x=60.0,y=53.0}, mapID=63, criteriaIndex=2  },
            { index=3,  desc="Discover Silverwind Refuge.",           npc=nil, coords={x=50.0,y=67.0}, mapID=63, criteriaIndex=3  },
            { index=4,  desc="Discover The Zoram Strand.",            npc=nil, coords={x=14.0,y=24.0}, mapID=63, criteriaIndex=4  },
            { index=5,  desc="Discover Maestra's Post.",              npc=nil, coords={x=27.0,y=36.0}, mapID=63, criteriaIndex=5  },
            { index=6,  desc="Discover The Ruins of Stardust.",       npc=nil, coords={x=33.0,y=67.0}, mapID=63, criteriaIndex=6  },
            { index=7,  desc="Discover The Shrine of Aessina.",       npc=nil, coords={x=22.0,y=53.0}, mapID=63, criteriaIndex=7  },
            { index=8,  desc="Discover Fire Scar Shrine.",            npc=nil, coords={x=25.0,y=61.0}, mapID=63, criteriaIndex=8  },
            { index=9,  desc="Discover Fallen Sky Lake.",             npc=nil, coords={x=67.0,y=53.0}, mapID=63, criteriaIndex=9  },
            { index=10, desc="Discover Iris Lake.",                   npc=nil, coords={x=47.0,y=46.0}, mapID=63, criteriaIndex=10 },
            { index=11, desc="Discover Moonwell of Purity.",          npc=nil, coords={x=60.0,y=72.0}, mapID=63, criteriaIndex=11 },
            { index=12, desc="Discover Mystral Lake.",                npc=nil, coords={x=48.0,y=39.0}, mapID=63, criteriaIndex=12 },
            { index=13, desc="Discover Ruins of Ordil'Aran.",         npc=nil, coords={x=23.0,y=40.0}, mapID=63, criteriaIndex=13 },
            { index=14, desc="Discover Splintertree Post.",           npc=nil, coords={x=73.0,y=61.0}, mapID=63, criteriaIndex=14 },
            { index=15, desc="Discover Warsong Lumber Camp.",         npc=nil, coords={x=87.0,y=58.0}, mapID=63, criteriaIndex=15 },
            { index=16, desc="Discover Bough Shadow.",                npc=nil, coords={x=94.0,y=40.0}, mapID=63, criteriaIndex=16 },
            { index=17, desc="Discover Felfire Hill.",                npc=nil, coords={x=83.0,y=71.0}, mapID=63, criteriaIndex=17 },
            { index=18, desc="Discover Demon Fall Canyon.",           npc=nil, coords={x=81.0,y=48.0}, mapID=63, criteriaIndex=18 },
            { index=19, desc="Discover Satyrnaar.",                   npc=nil, coords={x=82.0,y=50.0}, mapID=63, criteriaIndex=19 },
            { index=20, desc="Discover Night Run.",                   npc=nil, coords={x=69.0,y=86.0}, mapID=63, criteriaIndex=20 },
        },
    },

    [4925] = {
        id       = 4925,
        name     = "Ashenvale Quests",
        category = "Quests",
        zone     = "Ashenvale",
        mapID    = 63,
        steps = {
            { index=1, desc="Complete The Zoram Strand quest chain on the coast.",         npc=nil, coords={x=14.0,y=24.0}, mapID=63, criteriaIndex=1 },
            { index=2, desc="Complete The Hunt for Illidan's Minions quest chain.",        npc=nil, coords={x=35.0,y=49.0}, mapID=63, criteriaIndex=2 },
            { index=3, desc="Complete Raene's Cleansing quest chain (Alliance).",          npc="Raene Wolfrunner", coords={x=35.0,y=49.0}, mapID=63, criteriaIndex=3 },
            { index=4, desc="Complete the Warsong Lumber Camp quest chain (Horde).",       npc=nil, coords={x=87.0,y=58.0}, mapID=63, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- AZUREMYST ISLE (mapID 464)
    -- Draenei starting zone (levels 1-10)
    -- =========================================================================

    [860] = {
        id       = 860,
        name     = "Explore Azuremyst Isle",
        category = "Exploration",
        zone     = "Azuremyst Isle",
        mapID    = 464,
        steps = {
            { index=1,  desc="Discover Ammen Vale.",                  npc=nil, coords={x=79.0,y=46.0}, mapID=464, criteriaIndex=1  },
            { index=2,  desc="Discover Emitter NL8.",                 npc=nil, coords={x=59.0,y=67.0}, mapID=464, criteriaIndex=2  },
            { index=3,  desc="Discover Azure Watch.",                 npc=nil, coords={x=49.0,y=51.0}, mapID=464, criteriaIndex=3  },
            { index=4,  desc="Discover Odesyus' Landing.",            npc=nil, coords={x=47.0,y=71.0}, mapID=464, criteriaIndex=4  },
            { index=5,  desc="Discover Pod Cluster.",                 npc=nil, coords={x=52.0,y=64.0}, mapID=464, criteriaIndex=5  },
            { index=6,  desc="Discover Pod Wreckage.",                npc=nil, coords={x=35.0,y=43.0}, mapID=464, criteriaIndex=6  },
            { index=7,  desc="Discover Silting Shore.",               npc=nil, coords={x=33.0,y=14.0}, mapID=464, criteriaIndex=7  },
            { index=8,  desc="Discover Stillpine Hold.",              npc=nil, coords={x=46.0,y=22.0}, mapID=464, criteriaIndex=8  },
            { index=9,  desc="Discover The Exodar.",                  npc=nil, coords={x=26.0,y=54.0}, mapID=464, criteriaIndex=9  },
            { index=10, desc="Discover Valaar's Berth.",              npc=nil, coords={x=21.0,y=54.0}, mapID=464, criteriaIndex=10 },
            { index=11, desc="Discover Wrathscale Point.",            npc=nil, coords={x=17.0,y=84.0}, mapID=464, criteriaIndex=11 },
            { index=12, desc="Discover Bristlelimb Village.",         npc=nil, coords={x=59.0,y=17.0}, mapID=464, criteriaIndex=12 },
            { index=13, desc="Discover Moonwing Den.",                npc=nil, coords={x=63.0,y=49.0}, mapID=464, criteriaIndex=13 },
        },
    },

    [4926] = {
        id       = 4926,
        name     = "Azuremyst Isle Quests",
        category = "Quests",
        zone     = "Azuremyst Isle",
        mapID    = 464,
        steps = {
            { index=1, desc="Complete the Draenei starting quests in Ammen Vale.",         npc=nil, coords={x=79.0,y=46.0}, mapID=464, criteriaIndex=1 },
            { index=2, desc="Complete the Azure Watch quest chain.",                       npc=nil, coords={x=49.0,y=51.0}, mapID=464, criteriaIndex=2 },
            { index=3, desc="Complete Stillpine Hold quest chain.",                        npc=nil, coords={x=46.0,y=22.0}, mapID=464, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- BLOODMYST ISLE (mapID 476)
    -- Draenei zone (levels 10-20)
    -- =========================================================================

    [861] = {
        id       = 861,
        name     = "Explore Bloodmyst Isle",
        category = "Exploration",
        zone     = "Bloodmyst Isle",
        mapID    = 476,
        steps = {
            { index=1,  desc="Discover Blood Watch.",                 npc=nil, coords={x=55.0,y=59.0}, mapID=476, criteriaIndex=1  },
            { index=2,  desc="Discover Bladewood.",                   npc=nil, coords={x=81.0,y=50.0}, mapID=476, criteriaIndex=2  },
            { index=3,  desc="Discover Blacksilt Shore.",             npc=nil, coords={x=32.0,y=90.0}, mapID=476, criteriaIndex=3  },
            { index=4,  desc="Discover The Bloodcursed Reef.",        npc=nil, coords={x=66.0,y=87.0}, mapID=476, criteriaIndex=4  },
            { index=5,  desc="Discover The Crimson Reach.",           npc=nil, coords={x=69.0,y=68.0}, mapID=476, criteriaIndex=5  },
            { index=6,  desc="Discover The Cryo-Core.",               npc=nil, coords={x=55.0,y=20.0}, mapID=476, criteriaIndex=6  },
            { index=7,  desc="Discover The Foul Pool.",               npc=nil, coords={x=38.0,y=80.0}, mapID=476, criteriaIndex=7  },
            { index=8,  desc="Discover The Hidden Reef.",             npc=nil, coords={x=53.0,y=85.0}, mapID=476, criteriaIndex=8  },
            { index=9,  desc="Discover The Lost Fold.",               npc=nil, coords={x=62.0,y=45.0}, mapID=476, criteriaIndex=9  },
            { index=10, desc="Discover The Talon Stand.",             npc=nil, coords={x=80.0,y=28.0}, mapID=476, criteriaIndex=10 },
            { index=11, desc="Discover The Vector Coil.",             npc=nil, coords={x=71.0,y=20.0}, mapID=476, criteriaIndex=11 },
            { index=12, desc="Discover The Warp Piston.",             npc=nil, coords={x=43.0,y=18.0}, mapID=476, criteriaIndex=12 },
            { index=13, desc="Discover Wyrmscar Island.",             npc=nil, coords={x=69.0,y=17.0}, mapID=476, criteriaIndex=13 },
            { index=14, desc="Discover Axxarien.",                    npc=nil, coords={x=45.0,y=35.0}, mapID=476, criteriaIndex=14 },
            { index=15, desc="Discover Amberweb Pass.",               npc=nil, coords={x=35.0,y=57.0}, mapID=476, criteriaIndex=15 },
            { index=16, desc="Discover Bristlescar Canyon.",          npc=nil, coords={x=37.0,y=30.0}, mapID=476, criteriaIndex=16 },
            { index=17, desc="Discover Ragefeather Ridge.",           npc=nil, coords={x=55.0,y=36.0}, mapID=476, criteriaIndex=17 },
            { index=18, desc="Discover Ruins of Loreth'Aran.",        npc=nil, coords={x=58.0,y=88.0}, mapID=476, criteriaIndex=18 },
            { index=19, desc="Discover Vindicator's Rest.",           npc=nil, coords={x=28.0,y=48.0}, mapID=476, criteriaIndex=19 },
        },
    },


    -- =========================================================================
    -- DARKSHORE (mapID 62)
    -- =========================================================================

    [844] = {
        id       = 844,
        name     = "Explore Darkshore",
        category = "Exploration",
        zone     = "Darkshore",
        mapID    = 62,
        steps = {
            { index=1,  desc="Discover Ruins of Auberdine.",          npc=nil, coords={x=37.0,y=43.0}, mapID=62, criteriaIndex=1  },
            { index=2,  desc="Discover Ruins of Mathystra.",          npc=nil, coords={x=61.0,y=21.0}, mapID=62, criteriaIndex=2  },
            { index=3,  desc="Discover Lor'danel.",                   npc=nil, coords={x=51.0,y=18.0}, mapID=62, criteriaIndex=3  },
            { index=4,  desc="Discover The Master's Glaive.",         npc=nil, coords={x=40.0,y=82.0}, mapID=62, criteriaIndex=4  },
            { index=5,  desc="Discover Nazj'vel.",                    npc=nil, coords={x=33.0,y=27.0}, mapID=62, criteriaIndex=5  },
            { index=6,  desc="Discover Bashal'Aran.",                 npc=nil, coords={x=45.0,y=38.0}, mapID=62, criteriaIndex=6  },
            { index=7,  desc="Discover Ameth'Aran.",                  npc=nil, coords={x=43.0,y=53.0}, mapID=62, criteriaIndex=7  },
            { index=8,  desc="Discover Grove of the Ancients.",       npc=nil, coords={x=44.0,y=74.0}, mapID=62, criteriaIndex=8  },
            { index=9,  desc="Discover Ruins of Ordil'Aran.",         npc=nil, coords={x=56.0,y=30.0}, mapID=62, criteriaIndex=9  },
            { index=10, desc="Discover Wildbend River.",              npc=nil, coords={x=50.0,y=53.0}, mapID=62, criteriaIndex=10 },
            { index=11, desc="Discover Eye of the Vortex.",           npc=nil, coords={x=42.0,y=68.0}, mapID=62, criteriaIndex=11 },
            { index=12, desc="Discover Shatterspear War Camp.",       npc=nil, coords={x=66.0,y=15.0}, mapID=62, criteriaIndex=12 },
            { index=13, desc="Discover Shatterspear Vale.",           npc=nil, coords={x=71.0,y=23.0}, mapID=62, criteriaIndex=13 },
            { index=14, desc="Discover Withering Thicket.",           npc=nil, coords={x=37.0,y=60.0}, mapID=62, criteriaIndex=14 },
        },
    },

    [4928] = {
        id       = 4928,
        name     = "Darkshore Quests",
        category = "Quests",
        zone     = "Darkshore",
        mapID    = 62,
        steps = {
            { index=1, desc="Complete the Lor'danel quest chain.",                     npc=nil, coords={x=51.0,y=18.0}, mapID=62, criteriaIndex=1 },
            { index=2, desc="Complete The Battle for Darkshore quest chain.",          npc=nil, coords={x=51.0,y=18.0}, mapID=62, criteriaIndex=2 },
            { index=3, desc="Complete the Ancient Fires quest chain.",                 npc=nil, coords={x=44.0,y=74.0}, mapID=62, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- DESOLACE (mapID 66)
    -- =========================================================================

    [848] = {
        id       = 848,
        name     = "Explore Desolace",
        category = "Exploration",
        zone     = "Desolace",
        mapID    = 66,
        steps = {
            { index=1,  desc="Discover Nijel's Point.",               npc=nil, coords={x=66.0,y=7.0},  mapID=66, criteriaIndex=1  },
            { index=2,  desc="Discover Shadowprey Village.",          npc=nil, coords={x=24.0,y=68.0}, mapID=66, criteriaIndex=2  },
            { index=3,  desc="Discover Kodo Graveyard.",              npc=nil, coords={x=51.0,y=59.0}, mapID=66, criteriaIndex=3  },
            { index=4,  desc="Discover Valley of Spears.",            npc=nil, coords={x=35.0,y=57.0}, mapID=66, criteriaIndex=4  },
            { index=5,  desc="Discover Cenarion Wildlands.",          npc=nil, coords={x=55.0,y=37.0}, mapID=66, criteriaIndex=5  },
            { index=6,  desc="Discover Thunder Axe Fortress.",        npc=nil, coords={x=55.0,y=27.0}, mapID=66, criteriaIndex=6  },
            { index=7,  desc="Discover Mannoroc Coven.",              npc=nil, coords={x=52.0,y=76.0}, mapID=66, criteriaIndex=7  },
            { index=8,  desc="Discover Gelkis Village.",              npc=nil, coords={x=36.0,y=87.0}, mapID=66, criteriaIndex=8  },
            { index=9,  desc="Discover Magram Village.",              npc=nil, coords={x=73.0,y=47.0}, mapID=66, criteriaIndex=9  },
            { index=10, desc="Discover Sargeron.",                    npc=nil, coords={x=78.0,y=21.0}, mapID=66, criteriaIndex=10 },
            { index=11, desc="Discover Slitherblade Shore.",          npc=nil, coords={x=30.0,y=27.0}, mapID=66, criteriaIndex=11 },
            { index=12, desc="Discover Shadowbreak Ravine.",          npc=nil, coords={x=80.0,y=79.0}, mapID=66, criteriaIndex=12 },
            { index=13, desc="Discover Karnum's Glade.",              npc=nil, coords={x=56.0,y=50.0}, mapID=66, criteriaIndex=13 },
            { index=14, desc="Discover Tethris Ador.",                npc=nil, coords={x=52.0,y=58.0}, mapID=66, criteriaIndex=14 },
        },
    },

    [4930] = {
        id       = 4930,
        name     = "Desolace Quests",
        category = "Quests",
        zone     = "Desolace",
        mapID    = 66,
        steps = {
            { index=1, desc="Complete the Karnum's Glade quest chain.",            npc=nil, coords={x=56.0,y=50.0}, mapID=66, criteriaIndex=1 },
            { index=2, desc="Complete the Shadowprey Village quest chain.",        npc=nil, coords={x=24.0,y=68.0}, mapID=66, criteriaIndex=2 },
            { index=3, desc="Complete Nijel's Point quest chain.",                 npc=nil, coords={x=66.0,y=7.0},  mapID=66, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- DUSTWALLOW MARSH (mapID 70)
    -- =========================================================================

    [850] = {
        id       = 850,
        name     = "Explore Dustwallow Marsh",
        category = "Exploration",
        zone     = "Dustwallow Marsh",
        mapID    = 70,
        steps = {
            { index=1,  desc="Discover Theramore Isle.",              npc=nil, coords={x=66.0,y=49.0}, mapID=70, criteriaIndex=1  },
            { index=2,  desc="Discover Brackenwall Village.",         npc=nil, coords={x=36.0,y=32.0}, mapID=70, criteriaIndex=2  },
            { index=3,  desc="Discover Witch Hill.",                  npc=nil, coords={x=55.0,y=26.0}, mapID=70, criteriaIndex=3  },
            { index=4,  desc="Discover Alcaz Island.",                npc=nil, coords={x=75.0,y=20.0}, mapID=70, criteriaIndex=4  },
            { index=5,  desc="Discover Swamplight Manor.",            npc=nil, coords={x=55.0,y=76.0}, mapID=70, criteriaIndex=5  },
            { index=6,  desc="Discover Dreadmurk Shore.",             npc=nil, coords={x=34.0,y=66.0}, mapID=70, criteriaIndex=6  },
            { index=7,  desc="Discover Blackhoof Village.",           npc=nil, coords={x=41.0,y=74.0}, mapID=70, criteriaIndex=7  },
            { index=8,  desc="Discover The Den of Flame.",            npc=nil, coords={x=39.0,y=66.0}, mapID=70, criteriaIndex=8  },
            { index=9,  desc="Discover The Dragonmurk.",              npc=nil, coords={x=48.0,y=75.0}, mapID=70, criteriaIndex=9  },
            { index=10, desc="Discover The Wyrmbog.",                 npc=nil, coords={x=42.0,y=61.0}, mapID=70, criteriaIndex=10 },
            { index=11, desc="Discover Mudsprocket.",                 npc=nil, coords={x=41.0,y=74.0}, mapID=70, criteriaIndex=11 },
        },
    },

    [4929] = {
        id       = 4929,
        name     = "Dustwallow Marsh Quests",
        category = "Quests",
        zone     = "Dustwallow Marsh",
        mapID    = 70,
        steps = {
            { index=1, desc="Complete the Theramore quests.",                       npc=nil, coords={x=66.0,y=49.0}, mapID=70, criteriaIndex=1 },
            { index=2, desc="Complete the Mudsprocket quests.",                     npc=nil, coords={x=41.0,y=74.0}, mapID=70, criteriaIndex=2 },
            { index=3, desc="Complete the Brackenwall Village quest chain.",        npc=nil, coords={x=36.0,y=32.0}, mapID=70, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- FELWOOD (mapID 77)
    -- =========================================================================

    [853] = {
        id       = 853,
        name     = "Explore Felwood",
        category = "Exploration",
        zone     = "Felwood",
        mapID    = 77,
        steps = {
            { index=1,  desc="Discover Jadefire Glen.",               npc=nil, coords={x=43.0,y=18.0}, mapID=77, criteriaIndex=1  },
            { index=2,  desc="Discover Morlos'Aran.",                 npc=nil, coords={x=56.0,y=86.0}, mapID=77, criteriaIndex=2  },
            { index=3,  desc="Discover Irontree Woods.",              npc=nil, coords={x=49.0,y=81.0}, mapID=77, criteriaIndex=3  },
            { index=4,  desc="Discover Bloodvenom Falls.",            npc=nil, coords={x=40.0,y=46.0}, mapID=77, criteriaIndex=4  },
            { index=5,  desc="Discover Bloodvenom Post.",             npc=nil, coords={x=52.0,y=14.0}, mapID=77, criteriaIndex=5  },
            { index=6,  desc="Discover Emerald Sanctuary.",           npc=nil, coords={x=51.0,y=82.0}, mapID=77, criteriaIndex=6  },
            { index=7,  desc="Discover Jaedenar.",                    npc=nil, coords={x=35.0,y=58.0}, mapID=77, criteriaIndex=7  },
            { index=8,  desc="Discover Ruins of Constellas.",         npc=nil, coords={x=39.0,y=66.0}, mapID=77, criteriaIndex=8  },
            { index=9,  desc="Discover Shatter Scar Vale.",           npc=nil, coords={x=42.0,y=40.0}, mapID=77, criteriaIndex=9  },
            { index=10, desc="Discover Timbermaw Hold.",              npc=nil, coords={x=65.0,y=7.0},  mapID=77, criteriaIndex=10 },
            { index=11, desc="Discover Deadwood Village.",            npc=nil, coords={x=48.0,y=89.0}, mapID=77, criteriaIndex=11 },
            { index=12, desc="Discover Felpaw Village.",              npc=nil, coords={x=60.0,y=11.0}, mapID=77, criteriaIndex=12 },
        },
    },

    [4931] = {
        id       = 4931,
        name     = "Felwood Quests",
        category = "Quests",
        zone     = "Felwood",
        mapID    = 77,
        steps = {
            { index=1, desc="Complete the Emerald Sanctuary quest chain.",         npc=nil, coords={x=51.0,y=82.0}, mapID=77, criteriaIndex=1 },
            { index=2, desc="Complete The Corruption of Felwood quest chain.",     npc=nil, coords={x=51.0,y=82.0}, mapID=77, criteriaIndex=2 },
            { index=3, desc="Complete Jaedenar quest chain.",                      npc=nil, coords={x=35.0,y=58.0}, mapID=77, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- FERALAS (mapID 69)
    -- =========================================================================

    [849] = {
        id       = 849,
        name     = "Explore Feralas",
        category = "Exploration",
        zone     = "Feralas",
        mapID    = 69,
        steps = {
            { index=1,  desc="Discover Feathermoon Stronghold.",      npc=nil, coords={x=31.0,y=45.0}, mapID=69, criteriaIndex=1  },
            { index=2,  desc="Discover Camp Mojache.",                npc=nil, coords={x=75.0,y=44.0}, mapID=69, criteriaIndex=2  },
            { index=3,  desc="Discover Dire Maul.",                   npc=nil, coords={x=60.0,y=35.0}, mapID=69, criteriaIndex=3  },
            { index=4,  desc="Discover Lower Wilds.",                 npc=nil, coords={x=56.0,y=53.0}, mapID=69, criteriaIndex=4  },
            { index=5,  desc="Discover The Forgotten Coast.",         npc=nil, coords={x=45.0,y=65.0}, mapID=69, criteriaIndex=5  },
            { index=6,  desc="Discover Isle of Dread.",               npc=nil, coords={x=28.0,y=54.0}, mapID=69, criteriaIndex=6  },
            { index=7,  desc="Discover Feral Scar Vale.",             npc=nil, coords={x=55.0,y=60.0}, mapID=69, criteriaIndex=7  },
            { index=8,  desc="Discover The Twin Colossals.",          npc=nil, coords={x=46.0,y=17.0}, mapID=69, criteriaIndex=8  },
            { index=9,  desc="Discover Ruins of Ravenwind.",          npc=nil, coords={x=40.0,y=10.0}, mapID=69, criteriaIndex=9  },
            { index=10, desc="Discover Sardor Isle.",                 npc=nil, coords={x=29.0,y=92.0}, mapID=69, criteriaIndex=10 },
            { index=11, desc="Discover Dream Bough.",                 npc=nil, coords={x=51.0,y=47.0}, mapID=69, criteriaIndex=11 },
            { index=12, desc="Discover Ruins of Isildien.",           npc=nil, coords={x=56.0,y=14.0}, mapID=69, criteriaIndex=12 },
            { index=13, desc="Discover The Writhing Deep.",           npc=nil, coords={x=74.0,y=63.0}, mapID=69, criteriaIndex=13 },
            { index=14, desc="Discover Grimtotem Compound.",          npc=nil, coords={x=70.0,y=55.0}, mapID=69, criteriaIndex=14 },
        },
    },

    [4932] = {
        id       = 4932,
        name     = "Feralas Quests",
        category = "Quests",
        zone     = "Feralas",
        mapID    = 69,
        steps = {
            { index=1, desc="Complete the Feathermoon Stronghold quest chain.",    npc=nil, coords={x=31.0,y=45.0}, mapID=69, criteriaIndex=1 },
            { index=2, desc="Complete Camp Mojache quest chain.",                  npc=nil, coords={x=75.0,y=44.0}, mapID=69, criteriaIndex=2 },
            { index=3, desc="Complete The Gordunni Outpost quest chain.",          npc=nil, coords={x=75.0,y=20.0}, mapID=69, criteriaIndex=3 },
        },
    },



    -- =========================================================================
    -- NORTHERN BARRENS (mapID 10)
    -- =========================================================================

    [750] = {
        id       = 750,
        name     = "Explore Northern Barrens",
        category = "Exploration",
        zone     = "Northern Barrens",
        mapID    = 10,
        steps = {
            { index=1,  desc="Discover The Crossroads.",              npc=nil, coords={x=49.0,y=58.0}, mapID=10, criteriaIndex=1  },
            { index=2,  desc="Discover Ratchet.",                     npc=nil, coords={x=68.0,y=74.0}, mapID=10, criteriaIndex=2  },
            { index=3,  desc="Discover The Sludge Fen.",              npc=nil, coords={x=55.0,y=42.0}, mapID=10, criteriaIndex=3  },
            { index=4,  desc="Discover The Dry Hills.",               npc=nil, coords={x=43.0,y=16.0}, mapID=10, criteriaIndex=4  },
            { index=5,  desc="Discover The Forgotten Pools.",         npc=nil, coords={x=45.0,y=38.0}, mapID=10, criteriaIndex=5  },
            { index=6,  desc="Discover The Stagnant Oasis.",          npc=nil, coords={x=56.0,y=79.0}, mapID=10, criteriaIndex=6  },
            { index=7,  desc="Discover Lushwater Oasis.",             npc=nil, coords={x=62.0,y=37.0}, mapID=10, criteriaIndex=7  },
            { index=8,  desc="Discover The Mor'shan Rampart.",        npc=nil, coords={x=44.0,y=24.0}, mapID=10, criteriaIndex=8  },
            { index=9,  desc="Discover Boulder Lode Mine.",           npc=nil, coords={x=67.0,y=88.0}, mapID=10, criteriaIndex=9  },
            { index=10, desc="Discover Dreadmist Peak.",              npc=nil, coords={x=41.0,y=72.0}, mapID=10, criteriaIndex=10 },
            { index=11, desc="Discover Far Watch Post.",              npc=nil, coords={x=67.0,y=39.0}, mapID=10, criteriaIndex=11 },
            { index=12, desc="Discover Grol'dom Farm.",               npc=nil, coords={x=56.0,y=11.0}, mapID=10, criteriaIndex=12 },
            { index=13, desc="Discover Thorn Hill.",                  npc=nil, coords={x=58.0,y=27.0}, mapID=10, criteriaIndex=13 },
        },
    },


    -- =========================================================================
    -- SOUTHERN BARRENS (mapID 199)
    -- =========================================================================

    [4996] = {
        id       = 4996,
        name     = "Explore Southern Barrens",
        category = "Exploration",
        zone     = "Southern Barrens",
        mapID    = 199,
        steps = {
            { index=1,  desc="Discover Hunter's Hill.",               npc=nil, coords={x=39.0,y=11.0}, mapID=199, criteriaIndex=1  },
            { index=2,  desc="Discover Northwatch Hold.",             npc=nil, coords={x=66.0,y=47.0}, mapID=199, criteriaIndex=2  },
            { index=3,  desc="Discover The Overgrowth.",              npc=nil, coords={x=50.0,y=40.0}, mapID=199, criteriaIndex=3  },
            { index=4,  desc="Discover Vendetta Point.",              npc=nil, coords={x=42.0,y=70.0}, mapID=199, criteriaIndex=4  },
            { index=5,  desc="Discover Forward Command.",             npc=nil, coords={x=49.0,y=67.0}, mapID=199, criteriaIndex=5  },
            { index=6,  desc="Discover Teegan's Expedition.",         npc=nil, coords={x=49.0,y=68.0}, mapID=199, criteriaIndex=6  },
            { index=7,  desc="Discover Desolation Hold.",             npc=nil, coords={x=44.0,y=33.0}, mapID=199, criteriaIndex=7  },
            { index=8,  desc="Discover Battlescar.",                  npc=nil, coords={x=46.0,y=85.0}, mapID=199, criteriaIndex=8  },
            { index=9,  desc="Discover Bael Modan.",                  npc=nil, coords={x=49.0,y=83.0}, mapID=199, criteriaIndex=9  },
            { index=10, desc="Discover Frazzlecraz Motherlode.",      npc=nil, coords={x=40.0,y=94.0}, mapID=199, criteriaIndex=10 },
            { index=11, desc="Discover The Dry Hills.",               npc=nil, coords={x=33.0,y=22.0}, mapID=199, criteriaIndex=11 },
            { index=12, desc="Discover Razorfen Kraul.",              npc=nil, coords={x=40.0,y=88.0}, mapID=199, criteriaIndex=12 },
            { index=13, desc="Discover Northwatch Foothold.",         npc=nil, coords={x=49.0,y=51.0}, mapID=199, criteriaIndex=13 },
            { index=14, desc="Discover The Great Divide.",            npc=nil, coords={x=42.0,y=55.0}, mapID=199, criteriaIndex=14 },
            { index=15, desc="Discover Honor's Stand.",               npc=nil, coords={x=37.0,y=16.0}, mapID=199, criteriaIndex=15 },
        },
    },

    [4937] = {
        id       = 4937,
        name     = "Southern Barrens Quests",
        category = "Quests",
        zone     = "Southern Barrens",
        mapID    = 199,
        steps = {
            { index=1, desc="Complete the Northwatch Hold quest chain.",           npc=nil, coords={x=66.0,y=47.0}, mapID=199, criteriaIndex=1 },
            { index=2, desc="Complete Forward Command quest chain.",               npc=nil, coords={x=49.0,y=67.0}, mapID=199, criteriaIndex=2 },
            { index=3, desc="Complete Desolation Hold quest chain.",               npc=nil, coords={x=44.0,y=33.0}, mapID=199, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- SILITHUS (mapID 81)
    -- =========================================================================

    [856] = {
        id       = 856,
        name     = "Explore Silithus",
        category = "Exploration",
        zone     = "Silithus",
        mapID    = 81,
        steps = {
            { index=1, desc="Discover Cenarion Hold.",            npc=nil, coords={x=55.0,y=36.0}, mapID=81, criteriaIndex=1 },
            { index=2, desc="Discover Ortell's Hideout.",         npc=nil, coords={x=66.0,y=54.0}, mapID=81, criteriaIndex=2 },
            { index=3, desc="Discover Hive Ashi.",                npc=nil, coords={x=50.0,y=64.0}, mapID=81, criteriaIndex=3 },
            { index=4, desc="Discover Hive Zora.",                npc=nil, coords={x=32.0,y=52.0}, mapID=81, criteriaIndex=4 },
            { index=5, desc="Discover Hive Regal.",               npc=nil, coords={x=60.0,y=70.0}, mapID=81, criteriaIndex=5 },
            { index=6, desc="Discover Valor's Rest.",             npc=nil, coords={x=82.0,y=45.0}, mapID=81, criteriaIndex=6 },
            { index=7, desc="Discover The Scarab Wall.",          npc=nil, coords={x=31.0,y=90.0}, mapID=81, criteriaIndex=7 },
            { index=8, desc="Discover The Crystal Vale.",         npc=nil, coords={x=31.0,y=17.0}, mapID=81, criteriaIndex=8 },
        },
    },

    [4934] = {
        id       = 4934,
        name     = "Silithus Quests",
        category = "Quests",
        zone     = "Silithus",
        mapID    = 81,
        steps = {
            { index=1, desc="Complete Cenarion Hold quests.",                      npc=nil, coords={x=55.0,y=36.0}, mapID=81, criteriaIndex=1 },
            { index=2, desc="Complete the Twilight's Hammer quest chain.",         npc=nil, coords={x=55.0,y=36.0}, mapID=81, criteriaIndex=2 },
        },
    },

    -- =========================================================================
    -- STONETALON MOUNTAINS (mapID 65)
    -- =========================================================================

    [847] = {
        id       = 847,
        name     = "Explore Stonetalon Mountains",
        category = "Exploration",
        zone     = "Stonetalon Mountains",
        mapID    = 65,
        steps = {
            { index=1,  desc="Discover Sun Rock Retreat.",            npc=nil, coords={x=49.0,y=51.0}, mapID=65, criteriaIndex=1  },
            { index=2,  desc="Discover Stonetalon Peak.",             npc=nil, coords={x=40.0,y=23.0}, mapID=65, criteriaIndex=2  },
            { index=3,  desc="Discover The Charred Vale.",            npc=nil, coords={x=31.0,y=71.0}, mapID=65, criteriaIndex=3  },
            { index=4,  desc="Discover Windshear Crag.",              npc=nil, coords={x=71.0,y=93.0}, mapID=65, criteriaIndex=4  },
            { index=5,  desc="Discover Greatwood Vale.",              npc=nil, coords={x=44.0,y=32.0}, mapID=65, criteriaIndex=5  },
            { index=6,  desc="Discover Camp Aparaje.",                npc=nil, coords={x=67.0,y=64.0}, mapID=65, criteriaIndex=6  },
            { index=7,  desc="Discover Malaka'jin.",                  npc=nil, coords={x=68.0,y=85.0}, mapID=65, criteriaIndex=7  },
            { index=8,  desc="Discover Mirkfallon Post.",             npc=nil, coords={x=31.0,y=61.0}, mapID=65, criteriaIndex=8  },
            { index=9,  desc="Discover Windshear Fortress.",          npc=nil, coords={x=66.0,y=64.0}, mapID=65, criteriaIndex=9  },
            { index=10, desc="Discover Krom'gar Fortress.",           npc=nil, coords={x=66.0,y=64.0}, mapID=65, criteriaIndex=10 },
            { index=11, desc="Discover Boulderslide Ravine.",         npc=nil, coords={x=59.0,y=78.0}, mapID=65, criteriaIndex=11 },
            { index=12, desc="Discover The Sludgewerks.",             npc=nil, coords={x=62.0,y=54.0}, mapID=65, criteriaIndex=12 },
        },
    },

    [4936] = {
        id       = 4936,
        name     = "Stonetalon Mountains Quests",
        category = "Quests",
        zone     = "Stonetalon Mountains",
        mapID    = 65,
        steps = {
            { index=1, desc="Complete Sun Rock Retreat quests.",                   npc=nil, coords={x=49.0,y=51.0}, mapID=65, criteriaIndex=1 },
            { index=2, desc="Complete Krom'gar Fortress quest chain.",             npc="General Krom'gar", coords={x=66.0,y=64.0}, mapID=65, criteriaIndex=2 },
            { index=3, desc="Complete Camp Aparaje quest chain.",                  npc=nil, coords={x=67.0,y=64.0}, mapID=65, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- TANARIS (mapID 71)
    -- =========================================================================

    [851] = {
        id       = 851,
        name     = "Explore Tanaris",
        category = "Exploration",
        zone     = "Tanaris",
        mapID    = 71,
        steps = {
            { index=1,  desc="Discover Gadgetzan.",                   npc=nil, coords={x=52.0,y=28.0}, mapID=71, criteriaIndex=1  },
            { index=2,  desc="Discover Steamwheedle Port.",           npc=nil, coords={x=67.0,y=24.0}, mapID=71, criteriaIndex=2  },
            { index=3,  desc="Discover Zul'Farrak.",                  npc=nil, coords={x=39.0,y=21.0}, mapID=71, criteriaIndex=3  },
            { index=4,  desc="Discover Valley of the Watchers.",      npc=nil, coords={x=38.0,y=45.0}, mapID=71, criteriaIndex=4  },
            { index=5,  desc="Discover Caverns of Time.",             npc=nil, coords={x=65.0,y=50.0}, mapID=71, criteriaIndex=5  },
            { index=6,  desc="Discover Lost Rigger Cove.",            npc=nil, coords={x=76.0,y=46.0}, mapID=71, criteriaIndex=6  },
            { index=7,  desc="Discover Abyssal Sands.",               npc=nil, coords={x=61.0,y=37.0}, mapID=71, criteriaIndex=7  },
            { index=8,  desc="Discover Broken Pillar.",               npc=nil, coords={x=52.0,y=45.0}, mapID=71, criteriaIndex=8  },
            { index=9,  desc="Discover The Noxious Lair.",            npc=nil, coords={x=34.0,y=47.0}, mapID=71, criteriaIndex=9  },
            { index=10, desc="Discover The Gaping Chasm.",            npc=nil, coords={x=55.0,y=69.0}, mapID=71, criteriaIndex=10 },
            { index=11, desc="Discover Dunemaul Compound.",           npc=nil, coords={x=41.0,y=57.0}, mapID=71, criteriaIndex=11 },
            { index=12, desc="Discover Eastmoon Ruins.",              npc=nil, coords={x=47.0,y=65.0}, mapID=71, criteriaIndex=12 },
            { index=13, desc="Discover Sandsorrow Watch.",            npc=nil, coords={x=40.0,y=29.0}, mapID=71, criteriaIndex=13 },
            { index=14, desc="Discover Southbreak Shore.",            npc=nil, coords={x=63.0,y=37.0}, mapID=71, criteriaIndex=14 },
        },
    },

    [4935] = {
        id       = 4935,
        name     = "Tanaris Quests",
        category = "Quests",
        zone     = "Tanaris",
        mapID    = 71,
        steps = {
            { index=1, desc="Complete Gadgetzan quests.",                          npc=nil, coords={x=52.0,y=28.0}, mapID=71, criteriaIndex=1 },
            { index=2, desc="Complete Zul'Farrak dungeon quest chain.",            npc=nil, coords={x=39.0,y=21.0}, mapID=71, criteriaIndex=2 },
            { index=3, desc="Complete Steamwheedle Port quests.",                  npc=nil, coords={x=67.0,y=24.0}, mapID=71, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- TELDRASSIL (mapID 57)
    -- Night Elf starting zone
    -- =========================================================================

    [842] = {
        id       = 842,
        name     = "Explore Teldrassil",
        category = "Exploration",
        zone     = "Teldrassil",
        mapID    = 57,
        steps = {
            { index=1,  desc="Discover Darnassus.",                   npc=nil, coords={x=39.0,y=42.0}, mapID=57, criteriaIndex=1  },
            { index=2,  desc="Discover Dolanaar.",                    npc=nil, coords={x=55.0,y=52.0}, mapID=57, criteriaIndex=2  },
            { index=3,  desc="Discover Shadowglen.",                  npc=nil, coords={x=45.0,y=61.0}, mapID=57, criteriaIndex=3  },
            { index=4,  desc="Discover Lake Al'Ameth.",               npc=nil, coords={x=51.0,y=40.0}, mapID=57, criteriaIndex=4  },
            { index=5,  desc="Discover Starbreeze Village.",          npc=nil, coords={x=63.0,y=56.0}, mapID=57, criteriaIndex=5  },
            { index=6,  desc="Discover Gnarlpine Hold.",              npc=nil, coords={x=43.0,y=56.0}, mapID=57, criteriaIndex=6  },
            { index=7,  desc="Discover Ban'ethil Barrow Den.",        npc=nil, coords={x=54.0,y=59.0}, mapID=57, criteriaIndex=7  },
            { index=8,  desc="Discover The Oracle Glade.",            npc=nil, coords={x=38.0,y=34.0}, mapID=57, criteriaIndex=8  },
            { index=9,  desc="Discover Wellspring River.",            npc=nil, coords={x=57.0,y=63.0}, mapID=57, criteriaIndex=9  },
            { index=10, desc="Discover Wellspring Lake.",             npc=nil, coords={x=60.0,y=56.0}, mapID=57, criteriaIndex=10 },
            { index=11, desc="Discover Pools of Arlithrien.",         npc=nil, coords={x=42.0,y=76.0}, mapID=57, criteriaIndex=11 },
            { index=12, desc="Discover Rut'theran Village.",          npc=nil, coords={x=56.0,y=93.0}, mapID=57, criteriaIndex=12 },
        },
    },

    [4923] = {
        id       = 4923,
        name     = "Teldrassil Quests",
        category = "Quests",
        zone     = "Teldrassil",
        mapID    = 57,
        steps = {
            { index=1, desc="Complete Shadowglen starter quests.",                 npc=nil, coords={x=45.0,y=61.0}, mapID=57, criteriaIndex=1 },
            { index=2, desc="Complete Dolanaar quest chain.",                      npc=nil, coords={x=55.0,y=52.0}, mapID=57, criteriaIndex=2 },
            { index=3, desc="Complete The Corruption of Teldrassil quest chain.",  npc=nil, coords={x=55.0,y=52.0}, mapID=57, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- THOUSAND NEEDLES (mapID 64)
    -- =========================================================================

    [846] = {
        id       = 846,
        name     = "Explore Thousand Needles",
        category = "Exploration",
        zone     = "Thousand Needles",
        mapID    = 64,
        steps = {
            { index=1,  desc="Discover Freewind Post.",               npc=nil, coords={x=46.0,y=51.0}, mapID=64, criteriaIndex=1  },
            { index=2,  desc="Discover The Shimmering Flats.",        npc=nil, coords={x=80.0,y=75.0}, mapID=64, criteriaIndex=2  },
            { index=3,  desc="Discover The Great Lift.",              npc=nil, coords={x=33.0,y=28.0}, mapID=64, criteriaIndex=3  },
            { index=4,  desc="Discover Highperch.",                   npc=nil, coords={x=15.0,y=32.0}, mapID=64, criteriaIndex=4  },
            { index=5,  desc="Discover Darkcloud Pinnacle.",          npc=nil, coords={x=60.0,y=24.0}, mapID=64, criteriaIndex=5  },
            { index=6,  desc="Discover Splithoof Crag.",              npc=nil, coords={x=46.0,y=40.0}, mapID=64, criteriaIndex=6  },
            { index=7,  desc="Discover Twilight Withering.",          npc=nil, coords={x=15.0,y=54.0}, mapID=64, criteriaIndex=7  },
            { index=8,  desc="Discover The Weathered Nook.",          npc=nil, coords={x=18.0,y=23.0}, mapID=64, criteriaIndex=8  },
            { index=9,  desc="Discover Splithoof Heights.",           npc=nil, coords={x=28.0,y=50.0}, mapID=64, criteriaIndex=9  },
            { index=10, desc="Discover Westreach Summit.",            npc=nil, coords={x=11.0,y=35.0}, mapID=64, criteriaIndex=10 },
        },
    },

    [4938] = {
        id       = 4938,
        name     = "Thousand Needles Quests",
        category = "Quests",
        zone     = "Thousand Needles",
        mapID    = 64,
        steps = {
            { index=1, desc="Complete Freewind Post quests.",                      npc=nil, coords={x=46.0,y=51.0}, mapID=64, criteriaIndex=1 },
            { index=2, desc="Complete The Shimmering Flats quest chain.",          npc=nil, coords={x=80.0,y=75.0}, mapID=64, criteriaIndex=2 },
        },
    },

    -- =========================================================================
    -- UN'GORO CRATER (mapID 78)
    -- =========================================================================

    [854] = {
        id       = 854,
        name     = "Explore Un'Goro Crater",
        category = "Exploration",
        zone     = "Un'Goro Crater",
        mapID    = 78,
        steps = {
            { index=1,  desc="Discover Marshal's Refuge.",            npc=nil, coords={x=55.0,y=62.0}, mapID=78, criteriaIndex=1  },
            { index=2,  desc="Discover Fire Plume Ridge.",            npc=nil, coords={x=49.0,y=50.0}, mapID=78, criteriaIndex=2  },
            { index=3,  desc="Discover Fungal Rock.",                 npc=nil, coords={x=63.0,y=69.0}, mapID=78, criteriaIndex=3  },
            { index=4,  desc="Discover Golakka Hot Springs.",         npc=nil, coords={x=31.0,y=50.0}, mapID=78, criteriaIndex=4  },
            { index=5,  desc="Discover Lakkari Tar Pits.",            npc=nil, coords={x=52.0,y=42.0}, mapID=78, criteriaIndex=5  },
            { index=6,  desc="Discover Terror Run.",                  npc=nil, coords={x=28.0,y=28.0}, mapID=78, criteriaIndex=6  },
            { index=7,  desc="Discover The Marshlands.",              npc=nil, coords={x=70.0,y=56.0}, mapID=78, criteriaIndex=7  },
            { index=8,  desc="Discover The Slithering Scar.",         npc=nil, coords={x=50.0,y=85.0}, mapID=78, criteriaIndex=8  },
            { index=9,  desc="Discover Ironstone Plateau.",           npc=nil, coords={x=77.0,y=50.0}, mapID=78, criteriaIndex=9  },
        },
    },

    [4939] = {
        id       = 4939,
        name     = "Un'Goro Crater Quests",
        category = "Quests",
        zone     = "Un'Goro Crater",
        mapID    = 78,
        steps = {
            { index=1, desc="Complete Marshal's Refuge quest chain.",              npc=nil, coords={x=55.0,y=62.0}, mapID=78, criteriaIndex=1 },
            { index=2, desc="Complete The Apes of Un'Goro quest chain.",           npc=nil, coords={x=63.0,y=69.0}, mapID=78, criteriaIndex=2 },
            { index=3, desc="Complete The Crystals of Un'Goro quest chain.",       npc=nil, coords={x=55.0,y=62.0}, mapID=78, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- ULDUM (mapID 249)
    -- Cataclysm zone
    -- =========================================================================

    [4865] = {
        id       = 4865,
        name     = "Explore Uldum",
        category = "Exploration",
        zone     = "Uldum",
        mapID    = 249,
        steps = {
            { index=1,  desc="Discover Ramkahen.",                    npc=nil, coords={x=54.0,y=33.0}, mapID=249, criteriaIndex=1  },
            { index=2,  desc="Discover Obelisk of the Sun.",          npc=nil, coords={x=59.0,y=64.0}, mapID=249, criteriaIndex=2  },
            { index=3,  desc="Discover Ruins of Ammon.",              npc=nil, coords={x=37.0,y=63.0}, mapID=249, criteriaIndex=3  },
            { index=4,  desc="Discover Ruins of Ahmtul.",             npc=nil, coords={x=46.0,y=58.0}, mapID=249, criteriaIndex=4  },
            { index=5,  desc="Discover Ruins of Khintaset.",          npc=nil, coords={x=56.0,y=64.0}, mapID=249, criteriaIndex=5  },
            { index=6,  desc="Discover Cradle of the Ancients.",      npc=nil, coords={x=48.0,y=39.0}, mapID=249, criteriaIndex=6  },
            { index=7,  desc="Discover Steps of Fate.",               npc=nil, coords={x=56.0,y=85.0}, mapID=249, criteriaIndex=7  },
            { index=8,  desc="Discover The Cursed Landing.",          npc=nil, coords={x=21.0,y=64.0}, mapID=249, criteriaIndex=8  },
            { index=9,  desc="Discover The Gate of Hamatep.",         npc=nil, coords={x=50.0,y=82.0}, mapID=249, criteriaIndex=9  },
            { index=10, desc="Discover The Trail of Devastation.",    npc=nil, coords={x=60.0,y=24.0}, mapID=249, criteriaIndex=10 },
            { index=11, desc="Discover Mar'at.",                      npc=nil, coords={x=19.0,y=50.0}, mapID=249, criteriaIndex=11 },
            { index=12, desc="Discover Nahom.",                       npc=nil, coords={x=64.0,y=22.0}, mapID=249, criteriaIndex=12 },
            { index=13, desc="Discover Neferset City.",               npc=nil, coords={x=50.0,y=52.0}, mapID=249, criteriaIndex=13 },
            { index=14, desc="Discover Obelisk of the Stars.",        npc=nil, coords={x=63.0,y=28.0}, mapID=249, criteriaIndex=14 },
            { index=15, desc="Discover Obelisk of the Moon.",         npc=nil, coords={x=40.0,y=23.0}, mapID=249, criteriaIndex=15 },
            { index=16, desc="Discover Orsis.",                       npc=nil, coords={x=26.0,y=7.0},  mapID=249, criteriaIndex=16 },
            { index=17, desc="Discover Schnottz's Landing.",          npc=nil, coords={x=24.0,y=64.0}, mapID=249, criteriaIndex=17 },
            { index=18, desc="Discover The Vir'naal Delta.",          npc=nil, coords={x=75.0,y=57.0}, mapID=249, criteriaIndex=18 },
            { index=19, desc="Discover Tombs of the Precursors.",     npc=nil, coords={x=72.0,y=44.0}, mapID=249, criteriaIndex=19 },
            { index=20, desc="Discover Akhenet Fields.",              npc=nil, coords={x=59.0,y=14.0}, mapID=249, criteriaIndex=20 },
            { index=21, desc="Discover Lost City of the Tol'vir.",    npc=nil, coords={x=60.0,y=64.0}, mapID=249, criteriaIndex=21 },
        },
    },

    [4961] = {
        id       = 4961,
        name     = "Uldum Quests",
        category = "Quests",
        zone     = "Uldum",
        mapID    = 249,
        steps = {
            { index=1, desc="Complete The Ramkahen quest chain.",                  npc=nil, coords={x=54.0,y=33.0}, mapID=249, criteriaIndex=1 },
            { index=2, desc="Complete Schnottz's Landing quest chain.",            npc=nil, coords={x=24.0,y=64.0}, mapID=249, criteriaIndex=2 },
            { index=3, desc="Complete Harrison Jones quest chain.",                npc="Harrison Jones", coords={x=54.0,y=33.0}, mapID=249, criteriaIndex=3 },
            { index=4, desc="Complete Neferset City quest chain.",                 npc=nil, coords={x=50.0,y=52.0}, mapID=249, criteriaIndex=4 },
        },
    },

    -- =========================================================================
    -- WINTERSPRING (mapID 83)
    -- =========================================================================

    [857] = {
        id       = 857,
        name     = "Explore Winterspring",
        category = "Exploration",
        zone     = "Winterspring",
        mapID    = 83,
        steps = {
            { index=1,  desc="Discover Everlook.",                    npc=nil, coords={x=60.0,y=36.0}, mapID=83, criteriaIndex=1  },
            { index=2,  desc="Discover Frostwhisper Gorge.",          npc=nil, coords={x=57.0,y=17.0}, mapID=83, criteriaIndex=2  },
            { index=3,  desc="Discover Frostsaber Rock.",             npc=nil, coords={x=46.0,y=17.0}, mapID=83, criteriaIndex=3  },
            { index=4,  desc="Discover Lake Kel'Theril.",             npc=nil, coords={x=52.0,y=42.0}, mapID=83, criteriaIndex=4  },
            { index=5,  desc="Discover The Hidden Grove.",            npc=nil, coords={x=63.0,y=59.0}, mapID=83, criteriaIndex=5  },
            { index=6,  desc="Discover Timbermaw Post.",              npc=nil, coords={x=68.0,y=38.0}, mapID=83, criteriaIndex=6  },
            { index=7,  desc="Discover Starfall Village.",            npc=nil, coords={x=50.0,y=15.0}, mapID=83, criteriaIndex=7  },
            { index=8,  desc="Discover Owl Wing Thicket.",            npc=nil, coords={x=65.0,y=44.0}, mapID=83, criteriaIndex=8  },
            { index=9,  desc="Discover Winterfall Village.",          npc=nil, coords={x=67.0,y=34.0}, mapID=83, criteriaIndex=9  },
            { index=10, desc="Discover Darkwhisper Gorge.",           npc=nil, coords={x=62.0,y=25.0}, mapID=83, criteriaIndex=10 },
            { index=11, desc="Discover Mazthoril.",                   npc=nil, coords={x=39.0,y=43.0}, mapID=83, criteriaIndex=11 },
        },
    },

    [4940] = {
        id       = 4940,
        name     = "Winterspring Quests",
        category = "Quests",
        zone     = "Winterspring",
        mapID    = 83,
        steps = {
            { index=1, desc="Complete Everlook quest chain.",                      npc=nil, coords={x=60.0,y=36.0}, mapID=83, criteriaIndex=1 },
            { index=2, desc="Complete The Timbermaw Furbolgs reputation chain.",   npc=nil, coords={x=68.0,y=38.0}, mapID=83, criteriaIndex=2 },
            { index=3, desc="Complete Lake Kel'Theril quest chain.",               npc=nil, coords={x=52.0,y=42.0}, mapID=83, criteriaIndex=3 },
        },
    },

    -- =========================================================================
    -- MOUNT HYJAL (mapID 606)
    -- Cataclysm zone
    -- =========================================================================

    [4863] = {
        id       = 4863,
        name     = "Explore Hyjal",
        category = "Exploration",
        zone     = "Mount Hyjal",
        mapID    = 606,
        steps = {
            { index=1,  desc="Discover Nordrassil.",                  npc=nil, coords={x=62.0,y=24.0}, mapID=606, criteriaIndex=1  },
            { index=2,  desc="Discover The Regrowth.",                npc=nil, coords={x=72.0,y=74.0}, mapID=606, criteriaIndex=2  },
            { index=3,  desc="Discover Shrine of Goldrinn.",          npc=nil, coords={x=28.0,y=62.0}, mapID=606, criteriaIndex=3  },
            { index=4,  desc="Discover Grove of Aessina.",            npc=nil, coords={x=20.0,y=38.0}, mapID=606, criteriaIndex=4  },
            { index=5,  desc="Discover Shrine of Aviana.",            npc=nil, coords={x=44.0,y=46.0}, mapID=606, criteriaIndex=5  },
            { index=6,  desc="Discover The Scorched Plain.",          npc=nil, coords={x=57.0,y=56.0}, mapID=606, criteriaIndex=6  },
            { index=7,  desc="Discover Gates of Sothann.",            npc=nil, coords={x=71.0,y=46.0}, mapID=606, criteriaIndex=7  },
            { index=8,  desc="Discover The Circle of Cinders.",       npc=nil, coords={x=57.0,y=82.0}, mapID=606, criteriaIndex=8  },
            { index=9,  desc="Discover Sethria's Roost.",             npc=nil, coords={x=32.0,y=51.0}, mapID=606, criteriaIndex=9  },
            { index=10, desc="Discover Ashen Lake.",                  npc=nil, coords={x=52.0,y=71.0}, mapID=606, criteriaIndex=10 },
            { index=11, desc="Discover Darkwhisper Gorge.",           npc=nil, coords={x=51.0,y=28.0}, mapID=606, criteriaIndex=11 },
        },
    },

    [4959] = {
        id       = 4959,
        name     = "Hyjal Quests",
        category = "Quests",
        zone     = "Mount Hyjal",
        mapID    = 606,
        steps = {
            { index=1, desc="Complete Nordrassil quest chain.",                    npc=nil, coords={x=62.0,y=24.0}, mapID=606, criteriaIndex=1 },
            { index=2, desc="Complete The Regrowth quest chain.",                  npc=nil, coords={x=72.0,y=74.0}, mapID=606, criteriaIndex=2 },
            { index=3, desc="Complete Shrine of Goldrinn quest chain.",            npc=nil, coords={x=28.0,y=62.0}, mapID=606, criteriaIndex=3 },
            { index=4, desc="Complete Grove of Aessina quest chain.",              npc=nil, coords={x=20.0,y=38.0}, mapID=606, criteriaIndex=4 },
            { index=5, desc="Complete Shrine of Aviana quest chain.",              npc=nil, coords={x=44.0,y=46.0}, mapID=606, criteriaIndex=5 },
            { index=6, desc="Complete The Scorched Plain finale.",                 npc=nil, coords={x=57.0,y=56.0}, mapID=606, criteriaIndex=6 },
        },
    },

    -- =========================================================================
    -- KALIMDOR META ACHIEVEMENTS
    -- =========================================================================

    [43] = {
        id       = 43,
        name     = "Explore Kalimdor",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1,  desc="Complete Explore Azshara.",                      npc=nil, coords={x=56.0,y=50.0}, mapID=76,  criteriaIndex=1  },
            { index=2,  desc="Complete Explore Ashenvale.",                    npc=nil, coords={x=35.0,y=49.0}, mapID=63,  criteriaIndex=2  },
            { index=3,  desc="Complete Explore Azuremyst Isle.",               npc=nil, coords={x=49.0,y=51.0}, mapID=464, criteriaIndex=3  },
            { index=4,  desc="Complete Explore Bloodmyst Isle.",               npc=nil, coords={x=55.0,y=59.0}, mapID=476, criteriaIndex=4  },
            { index=5,  desc="Complete Explore Darkshore.",                    npc=nil, coords={x=51.0,y=18.0}, mapID=62,  criteriaIndex=5  },
            { index=6,  desc="Complete Explore Desolace.",                     npc=nil, coords={x=56.0,y=50.0}, mapID=66,  criteriaIndex=6  },
            { index=7,  desc="Complete Explore Durotar.",                      npc=nil, coords={x=52.0,y=61.0}, mapID=1,   criteriaIndex=7  },
            { index=8,  desc="Complete Explore Dustwallow Marsh.",             npc=nil, coords={x=66.0,y=49.0}, mapID=70,  criteriaIndex=8  },
            { index=9,  desc="Complete Explore Felwood.",                      npc=nil, coords={x=51.0,y=82.0}, mapID=77,  criteriaIndex=9  },
            { index=10, desc="Complete Explore Feralas.",                      npc=nil, coords={x=31.0,y=45.0}, mapID=69,  criteriaIndex=10 },
            { index=11, desc="Complete Explore Mulgore.",                      npc=nil, coords={x=48.0,y=60.0}, mapID=7,   criteriaIndex=11 },
            { index=12, desc="Complete Explore Northern Barrens.",             npc=nil, coords={x=49.0,y=58.0}, mapID=10,  criteriaIndex=12 },
            { index=13, desc="Complete Explore Silithus.",                     npc=nil, coords={x=55.0,y=36.0}, mapID=81,  criteriaIndex=13 },
            { index=14, desc="Complete Explore Southern Barrens.",             npc=nil, coords={x=49.0,y=67.0}, mapID=199, criteriaIndex=14 },
            { index=15, desc="Complete Explore Stonetalon Mountains.",         npc=nil, coords={x=49.0,y=51.0}, mapID=65,  criteriaIndex=15 },
            { index=16, desc="Complete Explore Tanaris.",                      npc=nil, coords={x=52.0,y=28.0}, mapID=71,  criteriaIndex=16 },
            { index=17, desc="Complete Explore Teldrassil.",                   npc=nil, coords={x=55.0,y=52.0}, mapID=57,  criteriaIndex=17 },
            { index=18, desc="Complete Explore Thousand Needles.",             npc=nil, coords={x=46.0,y=51.0}, mapID=64,  criteriaIndex=18 },
            { index=19, desc="Complete Explore Un'Goro Crater.",               npc=nil, coords={x=55.0,y=62.0}, mapID=78,  criteriaIndex=19 },
            { index=20, desc="Complete Explore Winterspring.",                 npc=nil, coords={x=60.0,y=36.0}, mapID=83,  criteriaIndex=20 },
            { index=21, desc="Complete Explore Uldum.",                        npc=nil, coords={x=54.0,y=33.0}, mapID=249, criteriaIndex=21 },
            { index=22, desc="Complete Explore Hyjal.",                        npc=nil, coords={x=62.0,y=24.0}, mapID=606, criteriaIndex=22 },
        },
    },

    [1678] = {
        id       = 1678,
        name     = "Loremaster of Kalimdor",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete questing achievements in all major Kalimdor zones (Ashenvale, Azshara, Azuremyst Isle, Bloodmyst Isle, Darkshore, Desolace, Dustwallow Marsh, Felwood, Feralas, Hyjal, Mulgore, Northern Barrens, Southern Barrens, Silithus, Stonetalon Mountains, Tanaris, Teldrassil, Thousand Needles, Uldum, Un'Goro Crater, Winterspring).",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- NORTHREND ZONES (Wrath of the Lich King)
    -- =========================================================================

    -- =========================================================================
    -- BOREAN TUNDRA (mapID 114)
    -- Level 68-72 starting zone (Northrend)
    -- =========================================================================

    [1264] = {
        id       = 1264,
        name     = "Explore Borean Tundra",
        category = "Exploration",
        zone     = "Borean Tundra",
        mapID    = 114,
        steps = {
            { index=1,  desc="Discover Valiance Keep.",              npc=nil, coords={x=57.0,y=65.0}, mapID=114, criteriaIndex=1  },
            { index=2,  desc="Discover Warsong Hold.",               npc=nil, coords={x=41.0,y=54.0}, mapID=114, criteriaIndex=2  },
            { index=3,  desc="Discover Fizzcrank Airstrip.",         npc=nil, coords={x=57.0,y=18.0}, mapID=114, criteriaIndex=3  },
            { index=4,  desc="Discover Bor'gorok Outpost.",          npc=nil, coords={x=49.0,y=11.0}, mapID=114, criteriaIndex=4  },
            { index=5,  desc="Discover Temple City of En'kilah.",    npc=nil, coords={x=54.0,y=44.0}, mapID=114, criteriaIndex=5  },
            { index=6,  desc="Discover The Dens of Dying.",          npc=nil, coords={x=73.0,y=23.0}, mapID=114, criteriaIndex=6  },
            { index=7,  desc="Discover Kaskala.",                    npc=nil, coords={x=64.0,y=45.0}, mapID=114, criteriaIndex=7  },
            { index=8,  desc="Discover Amber Ledge.",                npc=nil, coords={x=45.0,y=33.0}, mapID=114, criteriaIndex=8  },
            { index=9,  desc="Discover Coldarra.",                   npc=nil, coords={x=25.0,y=35.0}, mapID=114, criteriaIndex=9  },
            { index=10, desc="Discover Garrosh's Landing.",          npc=nil, coords={x=27.0,y=53.0}, mapID=114, criteriaIndex=10 },
            { index=11, desc="Discover Riplash Strand.",             npc=nil, coords={x=78.0,y=52.0}, mapID=114, criteriaIndex=11 },
            { index=12, desc="Discover Death's Stand.",              npc=nil, coords={x=87.0,y=24.0}, mapID=114, criteriaIndex=12 },
            { index=13, desc="Discover The Geyser Fields.",          npc=nil, coords={x=66.0,y=28.0}, mapID=114, criteriaIndex=13 },
        },
    },

    [33] = {
        id       = 33,
        name     = "Nothing Boring About Borean",
        category = "Quests",
        zone     = "Borean Tundra",
        mapID    = 114,
        steps = {
            { index=1, desc="Complete 130 quests in Borean Tundra.",              npc=nil, coords={x=57.0,y=65.0}, mapID=114, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- HOWLING FJORD (mapID 117)
    -- Level 68-72 starting zone (Northrend)
    -- =========================================================================

    [1263] = {
        id       = 1263,
        name     = "Explore Howling Fjord",
        category = "Exploration",
        zone     = "Howling Fjord",
        mapID    = 117,
        steps = {
            { index=1,  desc="Discover Valgarde.",                   npc=nil, coords={x=60.0,y=16.0}, mapID=117, criteriaIndex=1  },
            { index=2,  desc="Discover Vengeance Landing.",          npc=nil, coords={x=79.0,y=29.0}, mapID=117, criteriaIndex=2  },
            { index=3,  desc="Discover Fort Wildervar.",             npc=nil, coords={x=60.0,y=28.0}, mapID=117, criteriaIndex=3  },
            { index=4,  desc="Discover New Agamand.",                npc=nil, coords={x=52.0,y=67.0}, mapID=117, criteriaIndex=4  },
            { index=5,  desc="Discover Kamagua.",                    npc=nil, coords={x=25.0,y=58.0}, mapID=117, criteriaIndex=5  },
            { index=6,  desc="Discover Nifflevar.",                  npc=nil, coords={x=67.0,y=50.0}, mapID=117, criteriaIndex=6  },
            { index=7,  desc="Discover Westguard Keep.",             npc=nil, coords={x=30.0,y=28.0}, mapID=117, criteriaIndex=7  },
            { index=8,  desc="Discover Camp Winterhoof.",            npc=nil, coords={x=49.0,y=11.0}, mapID=117, criteriaIndex=8  },
            { index=9,  desc="Discover Scalawag Point.",             npc=nil, coords={x=26.0,y=24.0}, mapID=117, criteriaIndex=9  },
            { index=10, desc="Discover Halgrind.",                   npc=nil, coords={x=50.0,y=19.0}, mapID=117, criteriaIndex=10 },
            { index=11, desc="Discover Gjalerhorn.",                 npc=nil, coords={x=36.0,y=8.0},  mapID=117, criteriaIndex=11 },
            { index=12, desc="Discover Baelgun's Excavation Site.",  npc=nil, coords={x=72.0,y=22.0}, mapID=117, criteriaIndex=12 },
            { index=13, desc="Discover Utgarde Keep.",               npc=nil, coords={x=58.0,y=46.0}, mapID=117, criteriaIndex=13 },
            { index=14, desc="Discover The Twisted Glade.",          npc=nil, coords={x=67.0,y=63.0}, mapID=117, criteriaIndex=14 },
            { index=15, desc="Discover Giant's Run.",                npc=nil, coords={x=72.0,y=67.0}, mapID=117, criteriaIndex=15 },
        },
    },

    [34] = {
        id       = 34,
        name     = "I've Toured the Fjord",
        category = "Quests",
        zone     = "Howling Fjord",
        mapID    = 117,
        steps = {
            { index=1, desc="Complete 105 quests in Howling Fjord.",              npc=nil, coords={x=60.0,y=16.0}, mapID=117, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- DRAGONBLIGHT (mapID 115)
    -- Level 72-74 zone
    -- =========================================================================

    [1265] = {
        id       = 1265,
        name     = "Explore Dragonblight",
        category = "Exploration",
        zone     = "Dragonblight",
        mapID    = 115,
        steps = {
            { index=1,  desc="Discover Wyrmrest Temple.",            npc=nil, coords={x=59.0,y=54.0}, mapID=115, criteriaIndex=1  },
            { index=2,  desc="Discover Moa'ki Harbor.",              npc=nil, coords={x=48.0,y=75.0}, mapID=115, criteriaIndex=2  },
            { index=3,  desc="Discover Star's Rest.",                npc=nil, coords={x=29.0,y=55.0}, mapID=115, criteriaIndex=3  },
            { index=4,  desc="Discover Kor'kron Vanguard.",          npc=nil, coords={x=37.0,y=46.0}, mapID=115, criteriaIndex=4  },
            { index=5,  desc="Discover Wintergarde Keep.",           npc=nil, coords={x=77.0,y=63.0}, mapID=115, criteriaIndex=5  },
            { index=6,  desc="Discover Agmar's Hammer.",             npc=nil, coords={x=38.0,y=18.0}, mapID=115, criteriaIndex=6  },
            { index=7,  desc="Discover Venomspite.",                 npc=nil, coords={x=76.0,y=63.0}, mapID=115, criteriaIndex=7  },
            { index=8,  desc="Discover Emerald Dragonshrine.",       npc=nil, coords={x=63.0,y=72.0}, mapID=115, criteriaIndex=8  },
            { index=9,  desc="Discover Ruby Dragonshrine.",          npc=nil, coords={x=52.0,y=50.0}, mapID=115, criteriaIndex=9  },
            { index=10, desc="Discover Bronze Dragonshrine.",        npc=nil, coords={x=71.0,y=40.0}, mapID=115, criteriaIndex=10 },
            { index=11, desc="Discover Obsidian Dragonshrine.",      npc=nil, coords={x=36.0,y=27.0}, mapID=115, criteriaIndex=11 },
            { index=12, desc="Discover Azure Dragonshrine.",         npc=nil, coords={x=55.0,y=30.0}, mapID=115, criteriaIndex=12 },
            { index=13, desc="Discover Light's Trust.",              npc=nil, coords={x=85.0,y=26.0}, mapID=115, criteriaIndex=13 },
            { index=14, desc="Discover Naxxramas.",                  npc=nil, coords={x=87.0,y=51.0}, mapID=115, criteriaIndex=14 },
            { index=15, desc="Discover Galakrond's Rest.",           npc=nil, coords={x=56.0,y=34.0}, mapID=115, criteriaIndex=15 },
            { index=16, desc="Discover Angrathar the Wrathgate.",    npc=nil, coords={x=38.0,y=18.0}, mapID=115, criteriaIndex=16 },
            { index=17, desc="Discover The Forgotten Shore.",        npc=nil, coords={x=81.0,y=49.0}, mapID=115, criteriaIndex=17 },
        },
    },

    [35] = {
        id       = 35,
        name     = "Might of Dragonblight",
        category = "Quests",
        zone     = "Dragonblight",
        mapID    = 115,
        steps = {
            { index=1, desc="Complete 115 quests in Dragonblight.",               npc=nil, coords={x=59.0,y=54.0}, mapID=115, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- GRIZZLY HILLS (mapID 116)
    -- Level 73-75 zone
    -- =========================================================================

    [1266] = {
        id       = 1266,
        name     = "Explore Grizzly Hills",
        category = "Exploration",
        zone     = "Grizzly Hills",
        mapID    = 116,
        steps = {
            { index=1,  desc="Discover Amberpine Lodge.",            npc=nil, coords={x=32.0,y=60.0}, mapID=116, criteriaIndex=1  },
            { index=2,  desc="Discover Conquest Hold.",              npc=nil, coords={x=20.0,y=64.0}, mapID=116, criteriaIndex=2  },
            { index=3,  desc="Discover Camp Oneqwah.",               npc=nil, coords={x=65.0,y=47.0}, mapID=116, criteriaIndex=3  },
            { index=4,  desc="Discover Drakil'jin Ruins.",           npc=nil, coords={x=16.0,y=47.0}, mapID=116, criteriaIndex=4  },
            { index=5,  desc="Discover Granite Springs.",            npc=nil, coords={x=16.0,y=47.0}, mapID=116, criteriaIndex=5  },
            { index=6,  desc="Discover Grizzlemaw.",                 npc=nil, coords={x=48.0,y=32.0}, mapID=116, criteriaIndex=6  },
            { index=7,  desc="Discover Dun Argol.",                  npc=nil, coords={x=77.0,y=53.0}, mapID=116, criteriaIndex=7  },
            { index=8,  desc="Discover Venture Bay.",                npc=nil, coords={x=78.0,y=17.0}, mapID=116, criteriaIndex=8  },
            { index=9,  desc="Discover Ursoc's Den.",                npc=nil, coords={x=51.0,y=42.0}, mapID=116, criteriaIndex=9  },
            { index=10, desc="Discover Thor Modan.",                 npc=nil, coords={x=69.0,y=67.0}, mapID=116, criteriaIndex=10 },
            { index=11, desc="Discover Blue Sky Logging Grounds.",   npc=nil, coords={x=33.0,y=33.0}, mapID=116, criteriaIndex=11 },
            { index=12, desc="Discover Westfall Brigade Encampment.",npc=nil, coords={x=59.0,y=26.0}, mapID=116, criteriaIndex=12 },
        },
    },

    [37] = {
        id       = 37,
        name     = "Fo' Grizzle My Shizzle",
        category = "Quests",
        zone     = "Grizzly Hills",
        mapID    = 116,
        steps = {
            { index=1, desc="Complete 85 quests in Grizzly Hills.",               npc=nil, coords={x=32.0,y=60.0}, mapID=116, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- ZUL'DRAK (mapID 121)
    -- Level 74-76 zone
    -- =========================================================================

    [1267] = {
        id       = 1267,
        name     = "Explore Zul'Drak",
        category = "Exploration",
        zone     = "Zul'Drak",
        mapID    = 121,
        steps = {
            { index=1,  desc="Discover Zim'Torga.",                  npc=nil, coords={x=59.0,y=57.0}, mapID=121, criteriaIndex=1  },
            { index=2,  desc="Discover The Argent Stand.",           npc=nil, coords={x=41.0,y=64.0}, mapID=121, criteriaIndex=2  },
            { index=3,  desc="Discover Light's Breach.",             npc=nil, coords={x=32.0,y=76.0}, mapID=121, criteriaIndex=3  },
            { index=4,  desc="Discover Drakil'jin Ruins.",           npc=nil, coords={x=17.0,y=58.0}, mapID=121, criteriaIndex=4  },
            { index=5,  desc="Discover Zol'Heb.",                    npc=nil, coords={x=77.0,y=43.0}, mapID=121, criteriaIndex=5  },
            { index=6,  desc="Discover Drak'Tharon Keep.",           npc=nil, coords={x=17.0,y=21.0}, mapID=121, criteriaIndex=6  },
            { index=7,  desc="Discover Voltarus.",                   npc=nil, coords={x=28.0,y=46.0}, mapID=121, criteriaIndex=7  },
            { index=8,  desc="Discover Gundrak.",                    npc=nil, coords={x=76.0,y=63.0}, mapID=121, criteriaIndex=8  },
            { index=9,  desc="Discover Altar of Sseratus.",          npc=nil, coords={x=72.0,y=46.0}, mapID=121, criteriaIndex=9  },
            { index=10, desc="Discover Altar of Quetz'lun.",         npc=nil, coords={x=76.0,y=45.0}, mapID=121, criteriaIndex=10 },
            { index=11, desc="Discover Altar of Har'koa.",           npc=nil, coords={x=63.0,y=58.0}, mapID=121, criteriaIndex=11 },
            { index=12, desc="Discover Altar of Mam'toth.",          npc=nil, coords={x=72.0,y=43.0}, mapID=121, criteriaIndex=12 },
            { index=13, desc="Discover Altar of Rhunok.",            npc=nil, coords={x=76.0,y=43.0}, mapID=121, criteriaIndex=13 },
            { index=14, desc="Discover Thrym's End.",                npc=nil, coords={x=47.0,y=78.0}, mapID=121, criteriaIndex=14 },
            { index=15, desc="Discover Amphitheater of Anguish.",    npc=nil, coords={x=48.0,y=56.0}, mapID=121, criteriaIndex=15 },
        },
    },

    [36] = {
        id       = 36,
        name     = "Into the Basin",
        category = "Quests",
        zone     = "Zul'Drak",
        mapID    = 121,
        steps = {
            { index=1, desc="Complete 100 quests in Zul'Drak.",                    npc=nil, coords={x=41.0,y=64.0}, mapID=121, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SHOLAZAR BASIN (mapID 119)
    -- Level 76-78 zone
    -- =========================================================================

    [1268] = {
        id       = 1268,
        name     = "Explore Sholazar Basin",
        category = "Exploration",
        zone     = "Sholazar Basin",
        mapID    = 119,
        steps = {
            { index=1,  desc="Discover Nesingwary Base Camp.",       npc=nil, coords={x=27.0,y=59.0}, mapID=119, criteriaIndex=1  },
            { index=2,  desc="Discover River's Heart.",              npc=nil, coords={x=47.0,y=61.0}, mapID=119, criteriaIndex=2  },
            { index=3,  desc="Discover The Savage Thicket.",         npc=nil, coords={x=45.0,y=81.0}, mapID=119, criteriaIndex=3  },
            { index=4,  desc="Discover The Mosslight Pillar.",       npc=nil, coords={x=36.0,y=75.0}, mapID=119, criteriaIndex=4  },
            { index=5,  desc="Discover The Suntouched Pillar.",      npc=nil, coords={x=33.0,y=52.0}, mapID=119, criteriaIndex=5  },
            { index=6,  desc="Discover The Skyreach Pillar.",        npc=nil, coords={x=49.0,y=37.0}, mapID=119, criteriaIndex=6  },
            { index=7,  desc="Discover Makers' Overlook.",           npc=nil, coords={x=81.0,y=55.0}, mapID=119, criteriaIndex=7  },
            { index=8,  desc="Discover The Lifeblood Pillar.",       npc=nil, coords={x=65.0,y=60.0}, mapID=119, criteriaIndex=8  },
            { index=9,  desc="Discover The Glimmering Pillar.",      npc=nil, coords={x=50.0,y=56.0}, mapID=119, criteriaIndex=9  },
            { index=10, desc="Discover Makers' Perch.",              npc=nil, coords={x=29.0,y=40.0}, mapID=119, criteriaIndex=10 },
            { index=11, desc="Discover Rainspeaker Canopy.",         npc=nil, coords={x=53.0,y=56.0}, mapID=119, criteriaIndex=11 },
            { index=12, desc="Discover The Avalanche.",              npc=nil, coords={x=48.0,y=19.0}, mapID=119, criteriaIndex=12 },
            { index=13, desc="Discover Karnak's Maw.",               npc=nil, coords={x=25.0,y=81.0}, mapID=119, criteriaIndex=13 },
        },
    },

    [39] = {
        id       = 39,
        name     = "Into the Basin",
        category = "Quests",
        zone     = "Sholazar Basin",
        mapID    = 119,
        steps = {
            { index=1, desc="Complete 75 quests in Sholazar Basin.",              npc=nil, coords={x=27.0,y=59.0}, mapID=119, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- THE STORM PEAKS (mapID 120)
    -- Level 77-80 zone
    -- =========================================================================

    [1269] = {
        id       = 1269,
        name     = "Explore Storm Peaks",
        category = "Exploration",
        zone     = "The Storm Peaks",
        mapID    = 120,
        steps = {
            { index=1,  desc="Discover K3.",                         npc=nil, coords={x=41.0,y=86.0}, mapID=120, criteriaIndex=1  },
            { index=2,  desc="Discover Frosthold.",                  npc=nil, coords={x=29.0,y=74.0}, mapID=120, criteriaIndex=2  },
            { index=3,  desc="Discover Dun Niffelem.",               npc=nil, coords={x=65.0,y=51.0}, mapID=120, criteriaIndex=3  },
            { index=4,  desc="Discover Camp Tunka'lo.",              npc=nil, coords={x=68.0,y=60.0}, mapID=120, criteriaIndex=4  },
            { index=5,  desc="Discover Ulduar.",                     npc=nil, coords={x=41.0,y=18.0}, mapID=120, criteriaIndex=5  },
            { index=6,  desc="Discover Garm's Bane.",                npc=nil, coords={x=41.0,y=54.0}, mapID=120, criteriaIndex=6  },
            { index=7,  desc="Discover Nidavelir.",                  npc=nil, coords={x=24.0,y=41.0}, mapID=120, criteriaIndex=7  },
            { index=8,  desc="Discover Brunnhildar Village.",        npc=nil, coords={x=48.0,y=70.0}, mapID=120, criteriaIndex=8  },
            { index=9,  desc="Discover Temple of Storms.",           npc=nil, coords={x=34.0,y=58.0}, mapID=120, criteriaIndex=9  },
            { index=10, desc="Discover Terrace of the Makers.",      npc=nil, coords={x=57.0,y=43.0}, mapID=120, criteriaIndex=10 },
            { index=11, desc="Discover Valkyrion.",                  npc=nil, coords={x=24.0,y=63.0}, mapID=120, criteriaIndex=11 },
            { index=12, desc="Discover Engine of the Makers.",       npc=nil, coords={x=41.0,y=56.0}, mapID=120, criteriaIndex=12 },
            { index=13, desc="Discover Temple of Life.",             npc=nil, coords={x=64.0,y=44.0}, mapID=120, criteriaIndex=13 },
            { index=14, desc="Discover Uldis.",                      npc=nil, coords={x=38.0,y=45.0}, mapID=120, criteriaIndex=14 },
            { index=15, desc="Discover Thunderfall.",                npc=nil, coords={x=71.0,y=49.0}, mapID=120, criteriaIndex=15 },
            { index=16, desc="Discover Snowdrift Plains.",           npc=nil, coords={x=42.0,y=76.0}, mapID=120, criteriaIndex=16 },
        },
    },

    [38] = {
        id       = 38,
        name     = "The Summit of Storm Peaks",
        category = "Quests",
        zone     = "The Storm Peaks",
        mapID    = 120,
        steps = {
            { index=1, desc="Complete 100 quests in The Storm Peaks.",            npc=nil, coords={x=41.0,y=86.0}, mapID=120, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- ICECROWN (mapID 118)
    -- Level 77-80 zone
    -- =========================================================================

    [1270] = {
        id       = 1270,
        name     = "Explore Icecrown",
        category = "Exploration",
        zone     = "Icecrown",
        mapID    = 118,
        steps = {
            { index=1,  desc="Discover The Shadow Vault.",           npc=nil, coords={x=44.0,y=23.0}, mapID=118, criteriaIndex=1  },
            { index=2,  desc="Discover Onslaught Harbor.",           npc=nil, coords={x=8.0,y=45.0},  mapID=118, criteriaIndex=2  },
            { index=3,  desc="Discover Icecrown Citadel.",           npc=nil, coords={x=54.0,y=86.0}, mapID=118, criteriaIndex=3  },
            { index=4,  desc="Discover Ymirheim.",                   npc=nil, coords={x=55.0,y=46.0}, mapID=118, criteriaIndex=4  },
            { index=5,  desc="Discover The Fleshwerks.",             npc=nil, coords={x=77.0,y=61.0}, mapID=118, criteriaIndex=5  },
            { index=6,  desc="Discover Aldur'thar: The Desolation Gate.", npc=nil, coords={x=52.0,y=33.0}, mapID=118, criteriaIndex=6  },
            { index=7,  desc="Discover Corp'rethar: The Horror Gate.",npc=nil, coords={x=48.0,y=71.0}, mapID=118, criteriaIndex=7  },
            { index=8,  desc="Discover Mord'rethar: The Death Gate.",npc=nil, coords={x=67.0,y=67.0}, mapID=118, criteriaIndex=8  },
            { index=9,  desc="Discover Scourgeholme.",               npc=nil, coords={x=79.0,y=72.0}, mapID=118, criteriaIndex=9  },
            { index=10, desc="Discover The Bombardment.",            npc=nil, coords={x=63.0,y=57.0}, mapID=118, criteriaIndex=10 },
            { index=11, desc="Discover Jotunheim.",                  npc=nil, coords={x=26.0,y=38.0}, mapID=118, criteriaIndex=11 },
            { index=12, desc="Discover Valhalas.",                   npc=nil, coords={x=36.0,y=24.0}, mapID=118, criteriaIndex=12 },
            { index=13, desc="Discover The Broken Front.",           npc=nil, coords={x=68.0,y=62.0}, mapID=118, criteriaIndex=13 },
            { index=14, desc="Discover The Conflagration.",          npc=nil, coords={x=42.0,y=51.0}, mapID=118, criteriaIndex=14 },
            { index=15, desc="Discover Valley of Echoes.",           npc=nil, coords={x=83.0,y=73.0}, mapID=118, criteriaIndex=15 },
            { index=16, desc="Discover Sindragosa's Fall.",          npc=nil, coords={x=74.0,y=38.0}, mapID=118, criteriaIndex=16 },
            { index=17, desc="Discover The Court of Bones.",         npc=nil, coords={x=70.0,y=37.0}, mapID=118, criteriaIndex=17 },
            { index=18, desc="Discover Deathspeaker's Watch.",       npc=nil, coords={x=65.0,y=23.0}, mapID=118, criteriaIndex=18 },
        },
    },

    [40] = {
        id       = 40,
        name     = "Icecrown: The Final Goal",
        category = "Quests",
        zone     = "Icecrown",
        mapID    = 118,
        steps = {
            { index=1, desc="Complete 140 quests in Icecrown.",                    npc=nil, coords={x=44.0,y=23.0}, mapID=118, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- CRYSTALSONG FOREST (mapID 127)
    -- Level 74-80 zone (mostly a pass-through zone)
    -- =========================================================================

    [1457] = {
        id       = 1457,
        name     = "Explore Crystalsong Forest",
        category = "Exploration",
        zone     = "Crystalsong Forest",
        mapID    = 127,
        steps = {
            { index=1, desc="Discover Dalaran.",                  npc=nil, coords={x=30.0,y=40.0}, mapID=127, criteriaIndex=1 },
            { index=2, desc="Discover Sunreaver's Command.",      npc=nil, coords={x=78.0,y=50.0}, mapID=127, criteriaIndex=2 },
            { index=3, desc="Discover Windrunner's Overlook.",    npc=nil, coords={x=15.0,y=47.0}, mapID=127, criteriaIndex=3 },
            { index=4, desc="Discover The Decrepit Flow.",        npc=nil, coords={x=11.0,y=39.0}, mapID=127, criteriaIndex=4 },
            { index=5, desc="Discover The Azure Front.",          npc=nil, coords={x=18.0,y=82.0}, mapID=127, criteriaIndex=5 },
            { index=6, desc="Discover The Unbound Thicket.",      npc=nil, coords={x=62.0,y=23.0}, mapID=127, criteriaIndex=6 },
            { index=7, desc="Discover Forlorn Woods.",            npc=nil, coords={x=74.0,y=81.0}, mapID=127, criteriaIndex=7 },
            { index=8, desc="Discover The Great Tree.",           npc=nil, coords={x=52.0,y=62.0}, mapID=127, criteriaIndex=8 },
        },
    },

    -- =========================================================================
    -- WINTERGRASP (mapID 123)
    -- Level 77+ PvP zone
    -- =========================================================================

    [1260] = {
        id       = 1260,
        name     = "Explore Wintergrasp",
        category = "Exploration",
        zone     = "Wintergrasp",
        mapID    = 123,
        steps = {
            { index=1, desc="Discover Wintergrasp Fortress.",     npc=nil, coords={x=50.0,y=16.0}, mapID=123, criteriaIndex=1 },
            { index=2, desc="Discover The Sunken Ring.",          npc=nil, coords={x=24.0,y=38.0}, mapID=123, criteriaIndex=2 },
            { index=3, desc="Discover The Broken Temple.",        npc=nil, coords={x=42.0,y=36.0}, mapID=123, criteriaIndex=3 },
            { index=4, desc="Discover Windy Bluffs.",             npc=nil, coords={x=49.0,y=71.0}, mapID=123, criteriaIndex=4 },
            { index=5, desc="Discover Glacial Falls.",            npc=nil, coords={x=77.0,y=32.0}, mapID=123, criteriaIndex=5 },
            { index=6, desc="Discover The Steppe of Life.",       npc=nil, coords={x=60.0,y=75.0}, mapID=123, criteriaIndex=6 },
            { index=7, desc="Discover The Cauldron of Flames.",   npc=nil, coords={x=21.0,y=35.0}, mapID=123, criteriaIndex=7 },
        },
    },

    -- =========================================================================
    -- NORTHREND META ACHIEVEMENTS
    -- =========================================================================

    [45] = {
        id       = 45,
        name     = "Explore Northrend",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1,  desc="Complete Explore Borean Tundra.",               npc=nil, coords={x=57.0,y=65.0}, mapID=114, criteriaIndex=1  },
            { index=2,  desc="Complete Explore Howling Fjord.",               npc=nil, coords={x=60.0,y=16.0}, mapID=117, criteriaIndex=2  },
            { index=3,  desc="Complete Explore Dragonblight.",                npc=nil, coords={x=59.0,y=54.0}, mapID=115, criteriaIndex=3  },
            { index=4,  desc="Complete Explore Grizzly Hills.",               npc=nil, coords={x=32.0,y=60.0}, mapID=116, criteriaIndex=4  },
            { index=5,  desc="Complete Explore Zul'Drak.",                    npc=nil, coords={x=41.0,y=64.0}, mapID=121, criteriaIndex=5  },
            { index=6,  desc="Complete Explore Sholazar Basin.",              npc=nil, coords={x=27.0,y=59.0}, mapID=119, criteriaIndex=6  },
            { index=7,  desc="Complete Explore Storm Peaks.",                 npc=nil, coords={x=41.0,y=86.0}, mapID=120, criteriaIndex=7  },
            { index=8,  desc="Complete Explore Icecrown.",                    npc=nil, coords={x=44.0,y=23.0}, mapID=118, criteriaIndex=8  },
            { index=9,  desc="Complete Explore Crystalsong Forest.",          npc=nil, coords={x=30.0,y=40.0}, mapID=127, criteriaIndex=9  },
            { index=10, desc="Complete Explore Wintergrasp.",                 npc=nil, coords={x=50.0,y=16.0}, mapID=123, criteriaIndex=10 },
        },
    },

    [41] = {
        id       = 41,
        name     = "Loremaster of Northrend",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete questing achievements in all major Northrend zones: Nothing Boring About Borean (Borean Tundra), I've Toured the Fjord (Howling Fjord), Might of Dragonblight, Fo' Grizzle My Shizzle (Grizzly Hills), Into the Basin (Zul'Drak), Into the Basin (Sholazar Basin), The Summit of Storm Peaks, and Icecrown: The Final Goal.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- PANDARIA ZONES (Mists of Pandaria)
    -- =========================================================================

    -- =========================================================================
    -- THE JADE FOREST (mapID 371)
    -- Level 80-85 starting zone (Pandaria)
    -- =========================================================================

    [6351] = {
        id       = 6351,
        name     = "Explore Jade Forest",
        category = "Exploration",
        zone     = "The Jade Forest",
        mapID    = 371,
        steps = {
            { index=1,  desc="Discover Paw'don Village.",            npc=nil, coords={x=44.0,y=85.0}, mapID=371, criteriaIndex=1  },
            { index=2,  desc="Discover Honeydew Village.",           npc=nil, coords={x=28.0,y=47.0}, mapID=371, criteriaIndex=2  },
            { index=3,  desc="Discover Tian Monastery.",             npc=nil, coords={x=43.0,y=24.0}, mapID=371, criteriaIndex=3  },
            { index=4,  desc="Discover Dawn's Blossom.",             npc=nil, coords={x=47.0,y=37.0}, mapID=371, criteriaIndex=4  },
            { index=5,  desc="Discover Greenstone Village.",         npc=nil, coords={x=48.0,y=34.0}, mapID=371, criteriaIndex=5  },
            { index=6,  desc="Discover Sri-La Village.",             npc=nil, coords={x=55.0,y=56.0}, mapID=371, criteriaIndex=6  },
            { index=7,  desc="Discover Pearlfin Village.",           npc=nil, coords={x=59.0,y=83.0}, mapID=371, criteriaIndex=7  },
            { index=8,  desc="Discover Emperor's Omen.",             npc=nil, coords={x=50.0,y=42.0}, mapID=371, criteriaIndex=8  },
            { index=9,  desc="Discover Dreamer's Pavillion.",        npc=nil, coords={x=55.0,y=44.0}, mapID=371, criteriaIndex=9  },
            { index=10, desc="Discover Temple of the Jade Serpent.", npc=nil, coords={x=55.0,y=57.0}, mapID=371, criteriaIndex=10 },
            { index=11, desc="Discover Windward Isle.",              npc=nil, coords={x=66.0,y=33.0}, mapID=371, criteriaIndex=11 },
            { index=12, desc="Discover Nectarbreeze Orchard.",       npc=nil, coords={x=43.0,y=68.0}, mapID=371, criteriaIndex=12 },
            { index=13, desc="Discover The Arboretum.",              npc=nil, coords={x=33.0,y=63.0}, mapID=371, criteriaIndex=13 },
            { index=14, desc="Discover Terrace of Ten Thunders.",    npc=nil, coords={x=34.0,y=17.0}, mapID=371, criteriaIndex=14 },
            { index=15, desc="Discover Garrosh'ar Point.",           npc=nil, coords={x=28.0,y=24.0}, mapID=371, criteriaIndex=15 },
        },
    },

    [6300] = {
        id       = 6300,
        name     = "Upjade Complete",
        category = "Quests",
        zone     = "The Jade Forest",
        mapID    = 371,
        steps = {
            { index=1, desc="Complete 150 quests in The Jade Forest.",            npc=nil, coords={x=47.0,y=37.0}, mapID=371, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- VALLEY OF THE FOUR WINDS (mapID 376)
    -- Level 85-86 zone
    -- =========================================================================

    [6969] = {
        id       = 6969,
        name     = "Explore Valley of the Four Winds",
        category = "Exploration",
        zone     = "Valley of the Four Winds",
        mapID    = 376,
        steps = {
            { index=1,  desc="Discover Halfhill.",                   npc=nil, coords={x=56.0,y=50.0}, mapID=376, criteriaIndex=1  },
            { index=2,  desc="Discover Stoneplow.",                  npc=nil, coords={x=19.0,y=56.0}, mapID=376, criteriaIndex=2  },
            { index=3,  desc="Discover Pools of Purity.",            npc=nil, coords={x=60.0,y=27.0}, mapID=376, criteriaIndex=3  },
            { index=4,  desc="Discover Kunzen Village.",             npc=nil, coords={x=33.0,y=23.0}, mapID=376, criteriaIndex=4  },
            { index=5,  desc="Discover Thunderfoot Fields.",         npc=nil, coords={x=75.0,y=24.0}, mapID=376, criteriaIndex=5  },
            { index=6,  desc="Discover The Heartland.",              npc=nil, coords={x=43.0,y=51.0}, mapID=376, criteriaIndex=6  },
            { index=7,  desc="Discover Gilded Fan.",                 npc=nil, coords={x=54.0,y=38.0}, mapID=376, criteriaIndex=7  },
            { index=8,  desc="Discover Mudmug's Place.",             npc=nil, coords={x=68.0,y=43.0}, mapID=376, criteriaIndex=8  },
            { index=9,  desc="Discover Dustback Gorge.",             npc=nil, coords={x=13.0,y=75.0}, mapID=376, criteriaIndex=9  },
            { index=10, desc="Discover Paoquan Hollow.",             npc=nil, coords={x=18.0,y=29.0}, mapID=376, criteriaIndex=10 },
            { index=11, desc="Discover Silken Fields.",              npc=nil, coords={x=61.0,y=25.0}, mapID=376, criteriaIndex=11 },
            { index=12, desc="Discover Nesingwary's Safari.",        npc=nil, coords={x=16.0,y=82.0}, mapID=376, criteriaIndex=12 },
        },
    },

    [6301] = {
        id       = 6301,
        name     = "Rally the Valley",
        category = "Quests",
        zone     = "Valley of the Four Winds",
        mapID    = 376,
        steps = {
            { index=1, desc="Complete 125 quests in Valley of the Four Winds.",   npc=nil, coords={x=56.0,y=50.0}, mapID=376, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- KRASARANG WILDS (mapID 418)
    -- Level 85-86 zone
    -- =========================================================================

    [6978] = {
        id       = 6978,
        name     = "Explore Krasarang Wilds",
        category = "Exploration",
        zone     = "Krasarang Wilds",
        mapID    = 418,
        steps = {
            { index=1,  desc="Discover Zhu's Watch.",                npc=nil, coords={x=76.0,y=7.0},  mapID=418, criteriaIndex=1  },
            { index=2,  desc="Discover Marista.",                    npc=nil, coords={x=52.0,y=76.0}, mapID=418, criteriaIndex=2  },
            { index=3,  desc="Discover The Deepwild.",               npc=nil, coords={x=52.0,y=20.0}, mapID=418, criteriaIndex=3  },
            { index=4,  desc="Discover Nayeli Lagoon.",              npc=nil, coords={x=67.0,y=29.0}, mapID=418, criteriaIndex=4  },
            { index=5,  desc="Discover Krasari Ruins.",              npc=nil, coords={x=15.0,y=38.0}, mapID=418, criteriaIndex=5  },
            { index=6,  desc="Discover Ruins of Dojan.",             npc=nil, coords={x=55.0,y=34.0}, mapID=418, criteriaIndex=6  },
            { index=7,  desc="Discover Cradle of Chi-Ji.",           npc=nil, coords={x=31.0,y=63.0}, mapID=418, criteriaIndex=7  },
            { index=8,  desc="Discover Shrine of the Sands.",        npc=nil, coords={x=51.0,y=85.0}, mapID=418, criteriaIndex=8  },
            { index=9,  desc="Discover Unga Ingoo.",                 npc=nil, coords={x=52.0,y=32.0}, mapID=418, criteriaIndex=9  },
            { index=10, desc="Discover Red Wing Refuge.",            npc=nil, coords={x=15.0,y=35.0}, mapID=418, criteriaIndex=10 },
            { index=11, desc="Discover Anglers Wharf.",              npc=nil, coords={x=19.0,y=9.0},  mapID=418, criteriaIndex=11 },
            { index=12, desc="Discover The Forbidden Jungle.",       npc=nil, coords={x=13.0,y=46.0}, mapID=418, criteriaIndex=12 },
            { index=13, desc="Discover Dojani River.",               npc=nil, coords={x=40.0,y=52.0}, mapID=418, criteriaIndex=13 },
            { index=14, desc="Discover Temple of the Red Crane.",    npc=nil, coords={x=40.0,y=52.0}, mapID=418, criteriaIndex=14 },
        },
    },

    [6535] = {
        id       = 6535,
        name     = "Mighty Roamin' Krasaranger",
        category = "Quests",
        zone     = "Krasarang Wilds",
        mapID    = 418,
        steps = {
            { index=1, desc="Complete 85 quests in Krasarang Wilds.",             npc=nil, coords={x=76.0,y=7.0}, mapID=418, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- KUN-LAI SUMMIT (mapID 379)
    -- Level 87-88 zone
    -- =========================================================================

    [6976] = {
        id       = 6976,
        name     = "Explore Kun-Lai Summit",
        category = "Exploration",
        zone     = "Kun-Lai Summit",
        mapID    = 379,
        steps = {
            { index=1,  desc="Discover Binan Village.",              npc=nil, coords={x=72.0,y=92.0}, mapID=379, criteriaIndex=1  },
            { index=2,  desc="Discover The Grummle Bazaar.",         npc=nil, coords={x=64.0,y=61.0}, mapID=379, criteriaIndex=2  },
            { index=3,  desc="Discover Kota Basecamp.",              npc=nil, coords={x=42.0,y=69.0}, mapID=379, criteriaIndex=3  },
            { index=4,  desc="Discover Zouchin Village.",            npc=nil, coords={x=62.0,y=80.0}, mapID=379, criteriaIndex=4  },
            { index=5,  desc="Discover Shado-Pan Monastery.",        npc=nil, coords={x=36.0,y=47.0}, mapID=379, criteriaIndex=5  },
            { index=6,  desc="Discover Mogujia.",                    npc=nil, coords={x=44.0,y=89.0}, mapID=379, criteriaIndex=6  },
            { index=7,  desc="Discover Temple of the White Tiger.",  npc=nil, coords={x=68.0,y=43.0}, mapID=379, criteriaIndex=7  },
            { index=8,  desc="Discover Gate of the August Celestials.", npc=nil, coords={x=63.0,y=88.0}, mapID=379, criteriaIndex=8  },
            { index=9,  desc="Discover Peak of Serenity.",           npc=nil, coords={x=34.0,y=14.0}, mapID=379, criteriaIndex=9  },
            { index=10, desc="Discover Fire Camp Osul.",             npc=nil, coords={x=71.0,y=63.0}, mapID=379, criteriaIndex=10 },
            { index=11, desc="Discover Eastwind Rest.",              npc=nil, coords={x=62.0,y=80.0}, mapID=379, criteriaIndex=11 },
            { index=12, desc="Discover Westwind Rest.",              npc=nil, coords={x=54.0,y=83.0}, mapID=379, criteriaIndex=12 },
            { index=13, desc="Discover Mount Neverest.",             npc=nil, coords={x=44.0,y=52.0}, mapID=379, criteriaIndex=13 },
            { index=14, desc="Discover Valley of Emperors.",         npc=nil, coords={x=53.0,y=46.0}, mapID=379, criteriaIndex=14 },
            { index=15, desc="Discover Firebough Nook.",             npc=nil, coords={x=68.0,y=73.0}, mapID=379, criteriaIndex=15 },
        },
    },

    [6537] = {
        id       = 6537,
        name     = "Slum It in the Summit",
        category = "Quests",
        zone     = "Kun-Lai Summit",
        mapID    = 379,
        steps = {
            { index=1, desc="Complete 140 quests in Kun-Lai Summit.",             npc=nil, coords={x=72.0,y=92.0}, mapID=379, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TOWNLONG STEPPES (mapID 388)
    -- Level 88-89 zone
    -- =========================================================================

    [6977] = {
        id       = 6977,
        name     = "Explore Townlong Steppes",
        category = "Exploration",
        zone     = "Townlong Steppes",
        mapID    = 388,
        steps = {
            { index=1,  desc="Discover Longying Outpost.",           npc=nil, coords={x=71.0,y=57.0}, mapID=388, criteriaIndex=1  },
            { index=2,  desc="Discover Gao-Ran Battlefront.",        npc=nil, coords={x=74.0,y=84.0}, mapID=388, criteriaIndex=2  },
            { index=3,  desc="Discover Shado-Pan Garrison.",         npc=nil, coords={x=49.0,y=71.0}, mapID=388, criteriaIndex=3  },
            { index=4,  desc="Discover Sra'vess.",                   npc=nil, coords={x=60.0,y=25.0}, mapID=388, criteriaIndex=4  },
            { index=5,  desc="Discover Niuzao Temple.",              npc=nil, coords={x=39.0,y=62.0}, mapID=388, criteriaIndex=5  },
            { index=6,  desc="Discover Fire Camp Gai-Cho.",          npc=nil, coords={x=66.0,y=44.0}, mapID=388, criteriaIndex=6  },
            { index=7,  desc="Discover Hatred's Vice.",              npc=nil, coords={x=82.0,y=73.0}, mapID=388, criteriaIndex=7  },
            { index=8,  desc="Discover Kor'vess.",                   npc=nil, coords={x=39.0,y=35.0}, mapID=388, criteriaIndex=8  },
            { index=9,  desc="Discover Kri'vess.",                   npc=nil, coords={x=59.0,y=12.0}, mapID=388, criteriaIndex=9  },
            { index=10, desc="Discover Osul Mesa.",                  npc=nil, coords={x=67.0,y=51.0}, mapID=388, criteriaIndex=10 },
            { index=11, desc="Discover The Sunset Brewgarden.",      npc=nil, coords={x=18.0,y=63.0}, mapID=388, criteriaIndex=11 },
        },
    },

    [6536] = {
        id       = 6536,
        name     = "Upjade Complete",
        category = "Quests",
        zone     = "Townlong Steppes",
        mapID    = 388,
        steps = {
            { index=1, desc="Complete 101 quests in Townlong Steppes.",           npc=nil, coords={x=71.0,y=57.0}, mapID=388, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- DREAD WASTES (mapID 422)
    -- Level 89-90 zone
    -- =========================================================================

    [6979] = {
        id       = 6979,
        name     = "Explore Dread Wastes",
        category = "Exploration",
        zone     = "Dread Wastes",
        mapID    = 422,
        steps = {
            { index=1,  desc="Discover Klaxxi'vess.",                npc=nil, coords={x=55.0,y=35.0}, mapID=422, criteriaIndex=1  },
            { index=2,  desc="Discover The Sunset Brewgarden.",      npc=nil, coords={x=23.0,y=30.0}, mapID=422, criteriaIndex=2  },
            { index=3,  desc="Discover Soggy's Gamble.",             npc=nil, coords={x=56.0,y=71.0}, mapID=422, criteriaIndex=3  },
            { index=4,  desc="Discover Zan'vess.",                   npc=nil, coords={x=31.0,y=91.0}, mapID=422, criteriaIndex=4  },
            { index=5,  desc="Discover The Briny Muck.",             npc=nil, coords={x=42.0,y=82.0}, mapID=422, criteriaIndex=5  },
            { index=6,  desc="Discover Heart of Fear.",              npc=nil, coords={x=39.0,y=35.0}, mapID=422, criteriaIndex=6  },
            { index=7,  desc="Discover Kypari Vor.",                 npc=nil, coords={x=16.0,y=63.0}, mapID=422, criteriaIndex=7  },
            { index=8,  desc="Discover Kypari Zar.",                 npc=nil, coords={x=59.0,y=12.0}, mapID=422, criteriaIndex=8  },
            { index=9,  desc="Discover Terrace of Gurthan.",         npc=nil, coords={x=66.0,y=63.0}, mapID=422, criteriaIndex=9  },
            { index=10, desc="Discover Kypari'ik.",                  npc=nil, coords={x=41.0,y=37.0}, mapID=422, criteriaIndex=10 },
            { index=11, desc="Discover The Horrid March.",           npc=nil, coords={x=43.0,y=26.0}, mapID=422, criteriaIndex=11 },
            { index=12, desc="Discover Writhingwood.",               npc=nil, coords={x=66.0,y=24.0}, mapID=422, criteriaIndex=12 },
        },
    },

    [6540] = {
        id       = 6540,
        name     = "Dread Haste Makes Dread Waste",
        category = "Quests",
        zone     = "Dread Wastes",
        mapID    = 422,
        steps = {
            { index=1, desc="Complete 90 quests in Dread Wastes.",                npc=nil, coords={x=55.0,y=35.0}, mapID=422, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- VALE OF ETERNAL BLOSSOMS (mapID 390)
    -- Level 90 zone (endgame hub)
    -- =========================================================================


    [7438] = {
        id       = 7438,
        name     = "Could We Find More Like That?",
        category = "Quests",
        zone     = "Vale of Eternal Blossoms",
        mapID    = 390,
        steps = {
            { index=1, desc="Complete 25 daily quests in Vale of Eternal Blossoms.", npc=nil, coords={x=54.0,y=43.0}, mapID=390, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TIMELESS ISLE (mapID 554)
    -- Level 90 zone (Patch 5.4 content)
    -- =========================================================================

    [8712] = {
        id       = 8712,
        name     = "Explore Timeless Isle",
        category = "Exploration",
        zone     = "Timeless Isle",
        mapID    = 554,
        steps = {
            { index=1,  desc="Discover Timeless Shore.",             npc=nil, coords={x=23.0,y=50.0}, mapID=554, criteriaIndex=1  },
            { index=2,  desc="Discover Old Pi'jiu.",                 npc=nil, coords={x=37.0,y=63.0}, mapID=554, criteriaIndex=2  },
            { index=3,  desc="Discover Cavern of Lost Spirits.",     npc=nil, coords={x=43.0,y=42.0}, mapID=554, criteriaIndex=3  },
            { index=4,  desc="Discover Red Stone Run.",              npc=nil, coords={x=51.0,y=50.0}, mapID=554, criteriaIndex=4  },
            { index=5,  desc="Discover The Blazing Way.",            npc=nil, coords={x=64.0,y=50.0}, mapID=554, criteriaIndex=5  },
            { index=6,  desc="Discover Firewalkers' Path.",          npc=nil, coords={x=52.0,y=65.0}, mapID=554, criteriaIndex=6  },
            { index=7,  desc="Discover Ordon Sanctuary.",            npc=nil, coords={x=59.0,y=26.0}, mapID=554, criteriaIndex=7  },
            { index=8,  desc="Discover The Celestial Court.",        npc=nil, coords={x=35.0,y=30.0}, mapID=554, criteriaIndex=8  },
        },
    },

    -- =========================================================================
    -- PANDARIA META ACHIEVEMENTS
    -- =========================================================================

    [6974] = {
        id       = 6974,
        name     = "Explore Pandaria",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore Jade Forest.",                  npc=nil, coords={x=47.0,y=37.0}, mapID=371, criteriaIndex=1 },
            { index=2, desc="Complete Explore Valley of the Four Winds.",     npc=nil, coords={x=56.0,y=50.0}, mapID=376, criteriaIndex=2 },
            { index=3, desc="Complete Explore Krasarang Wilds.",              npc=nil, coords={x=76.0,y=7.0},  mapID=418, criteriaIndex=3 },
            { index=4, desc="Complete Explore Kun-Lai Summit.",               npc=nil, coords={x=72.0,y=92.0}, mapID=379, criteriaIndex=4 },
            { index=5, desc="Complete Explore Townlong Steppes.",             npc=nil, coords={x=71.0,y=57.0}, mapID=388, criteriaIndex=5 },
            { index=6, desc="Complete Explore Dread Wastes.",                 npc=nil, coords={x=55.0,y=35.0}, mapID=422, criteriaIndex=6 },
            { index=7, desc="Complete Explore Vale of Eternal Blossoms.",     npc=nil, coords={x=54.0,y=43.0}, mapID=390, criteriaIndex=7 },
        },
    },

    [6541] = {
        id       = 6541,
        name     = "Loremaster of Pandaria",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete questing achievements in all major Pandaria zones: Upjade Complete (Jade Forest), Rally the Valley (Valley of the Four Winds), Mighty Roamin' Krasaranger (Krasarang Wilds), Slum It in the Summit (Kun-Lai Summit), Upjade Complete (Townlong Steppes), and Dread Haste Makes Dread Waste (Dread Wastes).",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- OUTLAND ZONES (The Burning Crusade)
    -- =========================================================================

    -- =========================================================================
    -- HELLFIRE PENINSULA (mapID 100)
    -- Level 58-63 starting zone (Outland)
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Hellfire Peninsula" (ID 862)
    -- Discover all subzones in Hellfire Peninsula.
    -- -------------------------------------------------------------------------
    [862] = {
        id       = 862,
        name     = "Explore Hellfire Peninsula",
        category = "Exploration",
        zone     = "Hellfire Peninsula",
        mapID    = 100,
        steps = {
            { index=1,  desc="Discover Thrallmar.",                  npc=nil, coords={x=56.0,y=38.0}, mapID=100, criteriaIndex=1  },
            { index=2,  desc="Discover Honor Hold.",                 npc=nil, coords={x=54.0,y=63.0}, mapID=100, criteriaIndex=2  },
            { index=3,  desc="Discover Temple of Telhamat.",         npc=nil, coords={x=23.0,y=40.0}, mapID=100, criteriaIndex=3  },
            { index=4,  desc="Discover Falcon Watch.",               npc=nil, coords={x=27.0,y=60.0}, mapID=100, criteriaIndex=4  },
            { index=5,  desc="Discover The Stair of Destiny.",       npc=nil, coords={x=87.0,y=50.0}, mapID=100, criteriaIndex=5  },
            { index=6,  desc="Discover Zeth'Gor.",                   npc=nil, coords={x=67.0,y=43.0}, mapID=100, criteriaIndex=6  },
            { index=7,  desc="Discover Mag'har Post.",               npc=nil, coords={x=32.0,y=28.0}, mapID=100, criteriaIndex=7  },
            { index=8,  desc="Discover The Great Fissure.",          npc=nil, coords={x=41.0,y=37.0}, mapID=100, criteriaIndex=8  },
            { index=9,  desc="Discover Ruins of Sha'naar.",          npc=nil, coords={x=16.0,y=64.0}, mapID=100, criteriaIndex=9  },
            { index=10, desc="Discover Cenarion Post.",              npc=nil, coords={x=16.0,y=52.0}, mapID=100, criteriaIndex=10 },
            { index=11, desc="Discover Expedition Armory.",          npc=nil, coords={x=55.0,y=84.0}, mapID=100, criteriaIndex=11 },
            { index=12, desc="Discover Hellfire Citadel.",           npc=nil, coords={x=47.0,y=52.0}, mapID=100, criteriaIndex=12 },
            { index=13, desc="Discover Throne of Kil'jaeden.",       npc=nil, coords={x=58.0,y=18.0}, mapID=100, criteriaIndex=13 },
            { index=14, desc="Discover Pools of Aggonar.",           npc=nil, coords={x=39.0,y=39.0}, mapID=100, criteriaIndex=14 },
            { index=15, desc="Discover Forge Camp: Rage.",           npc=nil, coords={x=65.0,y=30.0}, mapID=100, criteriaIndex=15 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "To Hellfire and Back" (ID 1189 / 1271)
    -- Complete quests in Hellfire Peninsula.
    -- Two achievement IDs exist for this — likely Horde (1271) and Alliance (1189)
    -- variants, or an old threshold vs current. Both are valid in-game achievements.
    -- -------------------------------------------------------------------------
    [1189] = {
        id       = 1189,
        name     = "To Hellfire and Back",
        category = "Quests",
        zone     = "Hellfire Peninsula",
        mapID    = 100,
        steps = {
            { index=1, desc="Complete 90 quests in Hellfire Peninsula. Start at Thrallmar (Horde) or Honor Hold (Alliance).", npc=nil, coords={x=56.0,y=38.0}, mapID=100, criteriaIndex=1 },
        },
    },

    [1271] = {
        id       = 1271,
        name     = "To Hellfire and Back",
        category = "Quests",
        zone     = "Hellfire Peninsula",
        mapID    = 100,
        steps = {
            { index=1, desc="Complete 90 quests in Hellfire Peninsula. Start at Thrallmar (Horde) or Honor Hold (Alliance). Use /gp criteria 1271 to verify tracking.", npc=nil, coords={x=56.0,y=38.0}, mapID=100, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- ZANGARMARSH (mapID 102)
    -- Level 60-64 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Zangarmarsh" (ID 863)
    -- Discover all subzones in Zangarmarsh.
    -- -------------------------------------------------------------------------
    [863] = {
        id       = 863,
        name     = "Explore Zangarmarsh",
        category = "Exploration",
        zone     = "Zangarmarsh",
        mapID    = 102,
        steps = {
            { index=1,  desc="Discover Cenarion Refuge.",            npc=nil, coords={x=78.0,y=63.0}, mapID=102, criteriaIndex=1  },
            { index=2,  desc="Discover Zabra'jin.",                  npc=nil, coords={x=33.0,y=50.0}, mapID=102, criteriaIndex=2  },
            { index=3,  desc="Discover Telredor.",                   npc=nil, coords={x=67.0,y=49.0}, mapID=102, criteriaIndex=3  },
            { index=4,  desc="Discover Orebor Harborage.",           npc=nil, coords={x=42.0,y=28.0}, mapID=102, criteriaIndex=4  },
            { index=5,  desc="Discover Sporeggar.",                  npc=nil, coords={x=19.0,y=51.0}, mapID=102, criteriaIndex=5  },
            { index=6,  desc="Discover The Spawning Glen.",          npc=nil, coords={x=20.0,y=39.0}, mapID=102, criteriaIndex=6  },
            { index=7,  desc="Discover Ango'rosh Grounds.",          npc=nil, coords={x=22.0,y=27.0}, mapID=102, criteriaIndex=7  },
            { index=8,  desc="Discover Marshlight Lake.",            npc=nil, coords={x=78.0,y=81.0}, mapID=102, criteriaIndex=8  },
            { index=9,  desc="Discover Umbrafen Lake.",              npc=nil, coords={x=82.0,y=38.0}, mapID=102, criteriaIndex=9  },
            { index=10, desc="Discover Serpent Lake.",               npc=nil, coords={x=51.0,y=62.0}, mapID=102, criteriaIndex=10 },
            { index=11, desc="Discover The Dead Mire.",              npc=nil, coords={x=85.0,y=88.0}, mapID=102, criteriaIndex=11 },
            { index=12, desc="Discover The Lagoon.",                 npc=nil, coords={x=71.0,y=80.0}, mapID=102, criteriaIndex=12 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Mysteries of the Marsh" (ID 1190)
    -- Complete quests in Zangarmarsh.
    -- -------------------------------------------------------------------------
    [1190] = {
        id       = 1190,
        name     = "Mysteries of the Marsh",
        category = "Quests",
        zone     = "Zangarmarsh",
        mapID    = 102,
        steps = {
            { index=1, desc="Complete 54 quests in Zangarmarsh. Start with quests in Cenarion Refuge, Zabra'jin (Horde), and Telredor (Alliance).", npc=nil, coords={x=78.0,y=63.0}, mapID=102, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TEROKKAR FOREST (mapID 108)
    -- Level 62-65 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Terokkar Forest" (ID 867) — Exploration
    -- -------------------------------------------------------------------------
    [867] = {
        id       = 867,
        name     = "Explore Terokkar Forest",
        category = "Exploration",
        zone     = "Terokkar Forest",
        mapID    = 108,
        steps = {
            { index=1,  desc="Discover Shattrath City.",             npc=nil, coords={x=44.0,y=26.0}, mapID=108, criteriaIndex=1  },
            { index=2,  desc="Discover Stonebreaker Hold.",          npc=nil, coords={x=48.0,y=45.0}, mapID=108, criteriaIndex=2  },
            { index=3,  desc="Discover Allerian Stronghold.",        npc=nil, coords={x=58.0,y=54.0}, mapID=108, criteriaIndex=3  },
            { index=4,  desc="Discover Firewing Point.",             npc=nil, coords={x=69.0,y=44.0}, mapID=108, criteriaIndex=4  },
            { index=5,  desc="Discover Razorthorn Shelf.",           npc=nil, coords={x=62.0,y=35.0}, mapID=108, criteriaIndex=5  },
            { index=6,  desc="Discover Cenarion Thicket.",           npc=nil, coords={x=44.0,y=65.0}, mapID=108, criteriaIndex=6  },
            { index=7,  desc="Discover Tuurem.",                     npc=nil, coords={x=55.0,y=30.0}, mapID=108, criteriaIndex=7  },
            { index=8,  desc="Discover Auchindoun.",                 npc=nil, coords={x=40.0,y=66.0}, mapID=108, criteriaIndex=8  },
            { index=9,  desc="Discover Refugee Caravan.",            npc=nil, coords={x=38.0,y=52.0}, mapID=108, criteriaIndex=9  },
            { index=10, desc="Discover Ring of Observance.",         npc=nil, coords={x=39.0,y=65.0}, mapID=108, criteriaIndex=10 },
            { index=11, desc="Discover Bone Wastes.",                npc=nil, coords={x=51.0,y=75.0}, mapID=108, criteriaIndex=11 },
            { index=12, desc="Discover Veil Shienor.",               npc=nil, coords={x=28.0,y=55.0}, mapID=108, criteriaIndex=12 },
            { index=13, desc="Discover Carrion Hill.",               npc=nil, coords={x=40.0,y=39.0}, mapID=108, criteriaIndex=13 },
            { index=14, desc="Discover Bleeding Hollow Ruins.",      npc=nil, coords={x=64.0,y=54.0}, mapID=108, criteriaIndex=14 },
            { index=15, desc="Discover Skettis.",                    npc=nil, coords={x=62.0,y=78.0}, mapID=108, criteriaIndex=15 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Terror of Terokkar" (ID 1191) — Quests
    -- Complete 63 quests in Terokkar Forest.
    -- -------------------------------------------------------------------------
    [1191] = {
        id       = 1191,
        name     = "Terror of Terokkar",
        category = "Quests",
        zone     = "Terokkar Forest",
        mapID    = 108,
        steps = {
            { index=1, desc="Complete 63 quests in Terokkar Forest.", npc=nil, coords={x=58.0,y=54.0}, mapID=108, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Bombs Away" (ID 1275) — Quests
    -- Complete the bombing-run quests in Terokkar Forest.
    -- -------------------------------------------------------------------------
    [1275] = {
        id       = 1275,
        name     = "Bombs Away",
        category = "Quests",
        zone     = "Terokkar Forest",
        mapID    = 108,
        steps = {
            { index=1, desc="Complete the bombing run quests in Terokkar Forest. Pick up quests at Allerian Stronghold or Stonebreaker Hold.", npc=nil, coords={x=58.0,y=54.0}, mapID=108, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SHATTRATH CITY (mapID — confirm via /gp mapid while in Shattrath)
    -- Capital city of Outland, located in Terokkar Forest
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- Shattrath City Sashay — Skyriding races
    -- mapID TBD: confirm with /gp mapid while at the race course in Shattrath
    -- -------------------------------------------------------------------------
    [18679] = {
        id       = 18679,
        name     = "Shattrath City Sashay: Bronze",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay skyriding race within the bronze time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18680] = {
        id       = 18680,
        name     = "Shattrath City Sashay: Silver",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay skyriding race within the silver time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18681] = {
        id       = 18681,
        name     = "Shattrath City Sashay: Gold",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay skyriding race within the gold time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18682] = {
        id       = 18682,
        name     = "Shattrath City Sashay Advanced: Bronze",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Advanced skyriding race within the bronze time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18683] = {
        id       = 18683,
        name     = "Shattrath City Sashay Advanced: Silver",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Advanced skyriding race within the silver time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18684] = {
        id       = 18684,
        name     = "Shattrath City Sashay Advanced: Gold",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Advanced skyriding race within the gold time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18685] = {
        id       = 18685,
        name     = "Shattrath City Sashay Reverse: Bronze",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Reverse skyriding race within the bronze time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18686] = {
        id       = 18686,
        name     = "Shattrath City Sashay Reverse: Silver",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Reverse skyriding race within the silver time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [18687] = {
        id       = 18687,
        name     = "Shattrath City Sashay Reverse: Gold",
        category = "Skyriding",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the Shattrath City Sashay Reverse skyriding race within the gold time limit.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- Shattrath City — Event/World achievements (IDs 9486, 9632–9638)
    -- Details TBD — use /gp criteria <id> in-game to verify step criteria
    -- -------------------------------------------------------------------------
    [9486] = {
        id       = 9486,
        name     = "Goodness Gracious",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Goodness Gracious in Shattrath City. Use /gp criteria 9486 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9632] = {
        id       = 9632,
        name     = "The Power Is Yours",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for The Power Is Yours in Shattrath City. Use /gp criteria 9632 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9633] = {
        id       = 9633,
        name     = "Cut off the Head",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Cut off the Head in Shattrath City. Use /gp criteria 9633 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9634] = {
        id       = 9634,
        name     = "Charged Up",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Charged Up in Shattrath City. Use /gp criteria 9634 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9635] = {
        id       = 9635,
        name     = "Bobbing for Orcs",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Bobbing for Orcs in Shattrath City. Use /gp criteria 9635 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9636] = {
        id       = 9636,
        name     = "United We Stand",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for United We Stand in Shattrath City. Use /gp criteria 9636 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9637] = {
        id       = 9637,
        name     = "Poor Communication",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Poor Communication in Shattrath City. Use /gp criteria 9637 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    [9638] = {
        id       = 9638,
        name     = "Heralds of the Legion",
        category = "Quests",
        zone     = "Shattrath City",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete the requirements for Heralds of the Legion in Shattrath City. Use /gp criteria 9638 to verify.", npc=nil, coords={x=44.0,y=26.0}, mapID=nil, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- NAGRAND (mapID 107)
    -- Level 64-67 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Nagrand" (ID 866) — Exploration
    -- -------------------------------------------------------------------------
    [866] = {
        id       = 866,
        name     = "Explore Nagrand",
        category = "Exploration",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1,  desc="Discover Telaar.",                     npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1  },
            { index=2,  desc="Discover Garadar.",                    npc=nil, coords={x=56.0,y=34.0}, mapID=107, criteriaIndex=2  },
            { index=3,  desc="Discover Halaa.",                      npc=nil, coords={x=42.0,y=44.0}, mapID=107, criteriaIndex=3  },
            { index=4,  desc="Discover Laughing Skull Ruins.",       npc=nil, coords={x=45.0,y=20.0}, mapID=107, criteriaIndex=4  },
            { index=5,  desc="Discover The Ring of Trials.",         npc=nil, coords={x=67.0,y=52.0}, mapID=107, criteriaIndex=5  },
            { index=6,  desc="Discover Oshu'gun.",                   npc=nil, coords={x=54.0,y=70.0}, mapID=107, criteriaIndex=6  },
            { index=7,  desc="Discover Burning Blade Ruins.",        npc=nil, coords={x=73.0,y=69.0}, mapID=107, criteriaIndex=7  },
            { index=8,  desc="Discover Zangar Ridge.",               npc=nil, coords={x=11.0,y=43.0}, mapID=107, criteriaIndex=8  },
            { index=9,  desc="Discover Southwind Cleft.",            npc=nil, coords={x=47.0,y=57.0}, mapID=107, criteriaIndex=9  },
            { index=10, desc="Discover Windyreed Village.",          npc=nil, coords={x=71.0,y=40.0}, mapID=107, criteriaIndex=10 },
            { index=11, desc="Discover Sunspring Post.",             npc=nil, coords={x=32.0,y=43.0}, mapID=107, criteriaIndex=11 },
            { index=12, desc="Discover Forge Camp: Fear.",           npc=nil, coords={x=24.0,y=36.0}, mapID=107, criteriaIndex=12 },
            { index=13, desc="Discover Forge Camp: Hate.",           npc=nil, coords={x=25.0,y=76.0}, mapID=107, criteriaIndex=13 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Nagrand Slam" (ID 1192 / 1273) — Quests
    -- Complete 87 quests in Nagrand. Two IDs exist — likely Horde/Alliance
    -- variants or old/new threshold versions.
    -- -------------------------------------------------------------------------
    [1192] = {
        id       = 1192,
        name     = "Nagrand Slam",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete 87 quests in Nagrand. Use /gp criteria 1192 to verify tracking.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    [1273] = {
        id       = 1273,
        name     = "Nagrand Slam",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete 87 quests in Nagrand.",                     npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- Nagrand Arena achievements (PvP)
    -- -------------------------------------------------------------------------
    [100] = {
        id       = 100,
        name     = "Nagrand Arena",
        category = "Player vs. Player",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Win 10 Nagrand Arena matches.", npc=nil, coords={x=67.0,y=52.0}, mapID=107, criteriaIndex=1 },
        },
    },

    [101] = {
        id       = 101,
        name     = "Nagrand Arena",
        category = "Player vs. Player",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete 100 Nagrand Arena matches.", npc=nil, coords={x=67.0,y=52.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "World Wide Winner" (ID 699) — PvP (Halaa)
    -- -------------------------------------------------------------------------
    [699] = {
        id       = 699,
        name     = "World Wide Winner",
        category = "Player vs. Player",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Win Halaa in Nagrand.", npc=nil, coords={x=42.0,y=44.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Hills Like White Elekk" (ID 939) — Collections (mount)
    -- -------------------------------------------------------------------------
    [939] = {
        id       = 939,
        name     = "Hills Like White Elekk",
        category = "Collections",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Obtain the Elekk mount from the Kurenai (Alliance) or The Mag'har (Horde) at Exalted reputation. Turn in Obsidian Warbeads to gain rep.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Of Blood and Anguish" (ID 1576) — Quests / Lore
    -- -------------------------------------------------------------------------
    [1576] = {
        id       = 1576,
        name     = "Of Blood and Anguish",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete the Ring of Blood quest chain in the Laughing Skull Ruins area of Nagrand.", npc=nil, coords={x=45.0,y=20.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Nagrandeur" (ID 8928) — Quests (Draenor Nagrand)
    -- Note: ID 8927 is already in DB. 8928 may be a variant/threshold.
    -- -------------------------------------------------------------------------
    [8928] = {
        id       = 8928,
        name     = "Nagrandeur",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete quests in Nagrand (Draenor). Use /gp criteria 8928 to verify tracking.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- Stable Master / Husbandry achievements (ID 9539, 9540, 9705, 9706)
    -- These relate to the Draenor garrison stables in Nagrand.
    -- -------------------------------------------------------------------------
    [9539] = {
        id       = 9539,
        name     = "Advanced Husbandry",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete advanced stable quests in Nagrand (Draenor). Use /gp criteria 9539 to verify.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    [9540] = {
        id       = 9540,
        name     = "The Stable Master",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete stable mastery quests in Nagrand (Draenor). Use /gp criteria 9540 to verify.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    [9705] = {
        id       = 9705,
        name     = "Advanced Husbandry",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Advanced Husbandry variant. Use /gp criteria 9705 to verify tracking.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    [9706] = {
        id       = 9706,
        name     = "The Stable Master",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="The Stable Master variant. Use /gp criteria 9706 to verify tracking.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "With a Nagrand Cherry On Top" (ID 9615) — Quests
    -- -------------------------------------------------------------------------
    [9615] = {
        id       = 9615,
        name     = "With a Nagrand Cherry On Top",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 107,
        steps = {
            { index=1, desc="Complete Nagrand bonus objectives or specific quests. Use /gp criteria 9615 to verify.", npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- BLADE'S EDGE MOUNTAINS (mapID 105)
    -- Level 65-68 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Blade's Edge Mountains" (ID 865) — Exploration
    -- -------------------------------------------------------------------------
    [865] = {
        id       = 865,
        name     = "Explore Blade's Edge Mountains",
        category = "Exploration",
        zone     = "Blade's Edge Mountains",
        mapID    = 105,
        steps = {
            { index=1,  desc="Discover Evergrove.",                  npc=nil, coords={x=62.0,y=40.0}, mapID=105, criteriaIndex=1  },
            { index=2,  desc="Discover Toshley's Station.",          npc=nil, coords={x=61.0,y=68.0}, mapID=105, criteriaIndex=2  },
            { index=3,  desc="Discover Sylvanaar.",                  npc=nil, coords={x=36.0,y=63.0}, mapID=105, criteriaIndex=3  },
            { index=4,  desc="Discover Thunderlord Stronghold.",     npc=nil, coords={x=53.0,y=54.0}, mapID=105, criteriaIndex=4  },
            { index=5,  desc="Discover Mok'Nathal Village.",         npc=nil, coords={x=76.0,y=60.0}, mapID=105, criteriaIndex=5  },
            { index=6,  desc="Discover Gruul's Lair.",               npc=nil, coords={x=68.0,y=24.0}, mapID=105, criteriaIndex=6  },
            { index=7,  desc="Discover Ruuan Weald.",                npc=nil, coords={x=55.0,y=24.0}, mapID=105, criteriaIndex=7  },
            { index=8,  desc="Discover Veil Lashh.",                 npc=nil, coords={x=29.0,y=81.0}, mapID=105, criteriaIndex=8  },
            { index=9,  desc="Discover Veil Ruuan.",                 npc=nil, coords={x=48.0,y=39.0}, mapID=105, criteriaIndex=9  },
            { index=10, desc="Discover Razor Ridge.",                npc=nil, coords={x=63.0,y=26.0}, mapID=105, criteriaIndex=10 },
            { index=11, desc="Discover Forge Camp: Wrath.",          npc=nil, coords={x=28.0,y=84.0}, mapID=105, criteriaIndex=11 },
            { index=12, desc="Discover Forge Camp: Terror.",         npc=nil, coords={x=33.0,y=42.0}, mapID=105, criteriaIndex=12 },
            { index=13, desc="Discover Bladed Gulch.",               npc=nil, coords={x=62.0,y=23.0}, mapID=105, criteriaIndex=13 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "On the Blade's Edge" (ID 1193) — Quests
    -- Complete 90 quests in Blade's Edge Mountains.
    -- -------------------------------------------------------------------------
    [1193] = {
        id       = 1193,
        name     = "On the Blade's Edge",
        category = "Quests",
        zone     = "Blade's Edge Mountains",
        mapID    = 105,
        steps = {
            { index=1, desc="Complete 90 quests in Blade's Edge Mountains.", npc=nil, coords={x=61.0,y=68.0}, mapID=105, criteriaIndex=1 },
        },
    },

    [1276] = {
        id       = 1276,
        name     = "Blade's Edge Bomberman",
        category = "Quests",
        zone     = "Blade's Edge Mountains",
        mapID    = 105,
        steps = {
            { index=1, desc="Complete 90 quests in Blade's Edge Mountains.",      npc=nil, coords={x=61.0,y=68.0}, mapID=105, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- NETHERSTORM (mapID 109)
    -- Level 67-70 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Netherstorm" (ID 843) — Exploration
    -- -------------------------------------------------------------------------
    [843] = {
        id       = 843,
        name     = "Explore Netherstorm",
        category = "Exploration",
        zone     = "Netherstorm",
        mapID    = 109,
        steps = {
            { index=1,  desc="Discover Area 52.",                    npc=nil, coords={x=33.0,y=64.0}, mapID=109, criteriaIndex=1  },
            { index=2,  desc="Discover The Stormspire.",             npc=nil, coords={x=44.0,y=36.0}, mapID=109, criteriaIndex=2  },
            { index=3,  desc="Discover Cosmowrench.",                npc=nil, coords={x=65.0,y=67.0}, mapID=109, criteriaIndex=3  },
            { index=4,  desc="Discover Ruins of Farahlon.",          npc=nil, coords={x=69.0,y=38.0}, mapID=109, criteriaIndex=4  },
            { index=5,  desc="Discover Tempest Keep.",               npc=nil, coords={x=74.0,y=55.0}, mapID=109, criteriaIndex=5  },
            { index=6,  desc="Discover Manaforge Ultris.",           npc=nil, coords={x=26.0,y=41.0}, mapID=109, criteriaIndex=6  },
            { index=7,  desc="Discover Manaforge Coruu.",            npc=nil, coords={x=48.0,y=81.0}, mapID=109, criteriaIndex=7  },
            { index=8,  desc="Discover Manaforge Duro.",             npc=nil, coords={x=60.0,y=41.0}, mapID=109, criteriaIndex=8  },
            { index=9,  desc="Discover Manaforge Ara.",              npc=nil, coords={x=27.0,y=66.0}, mapID=109, criteriaIndex=9  },
            { index=10, desc="Discover Manaforge B'naar.",           npc=nil, coords={x=22.0,y=55.0}, mapID=109, criteriaIndex=10 },
            { index=11, desc="Discover Arklon Ruins.",               npc=nil, coords={x=42.0,y=17.0}, mapID=109, criteriaIndex=11 },
            { index=12, desc="Discover Celestial Ridge.",            npc=nil, coords={x=71.0,y=38.0}, mapID=109, criteriaIndex=12 },
            { index=13, desc="Discover Gyro-Plank Bridge.",          npc=nil, coords={x=23.0,y=76.0}, mapID=109, criteriaIndex=13 },
            { index=14, desc="Discover Eco-Dome Midrealm.",          npc=nil, coords={x=46.0,y=55.0}, mapID=109, criteriaIndex=14 },
            { index=15, desc="Discover The Heap.",                   npc=nil, coords={x=32.0,y=77.0}, mapID=109, criteriaIndex=15 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Into the Nether" (ID 1194) — Quests
    -- Complete 120 quests in Netherstorm.
    -- -------------------------------------------------------------------------
    [1194] = {
        id       = 1194,
        name     = "Into the Nether",
        category = "Quests",
        zone     = "Netherstorm",
        mapID    = 109,
        steps = {
            { index=1, desc="Complete 120 quests in Netherstorm.", npc=nil, coords={x=33.0,y=64.0}, mapID=109, criteriaIndex=1 },
        },
    },

    [1277] = {
        id       = 1277,
        name     = "Rapid Defense",
        category = "Quests",
        zone     = "Netherstorm",
        mapID    = 109,
        steps = {
            { index=1, desc="Complete 120 quests in Netherstorm.",                npc=nil, coords={x=33.0,y=64.0}, mapID=109, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SHADOWMOON VALLEY (mapID 104)
    -- Level 67-70 zone
    -- =========================================================================

    -- -------------------------------------------------------------------------
    -- "Explore Shadowmoon Valley" (ID 864) — Exploration
    -- -------------------------------------------------------------------------
    [864] = {
        id       = 864,
        name     = "Explore Shadowmoon Valley",
        category = "Exploration",
        zone     = "Shadowmoon Valley",
        mapID    = 104,
        steps = {
            { index=1,  desc="Discover Wildhammer Stronghold.",      npc=nil, coords={x=40.0,y=41.0}, mapID=104, criteriaIndex=1  },
            { index=2,  desc="Discover Shadowmoon Village.",         npc=nil, coords={x=30.0,y=28.0}, mapID=104, criteriaIndex=2  },
            { index=3,  desc="Discover Altar of Sha'tar.",           npc=nil, coords={x=62.0,y=28.0}, mapID=104, criteriaIndex=3  },
            { index=4,  desc="Discover The Deathforge.",             npc=nil, coords={x=40.0,y=38.0}, mapID=104, criteriaIndex=4  },
            { index=5,  desc="Discover Coilskar Cistern.",           npc=nil, coords={x=50.0,y=35.0}, mapID=104, criteriaIndex=5  },
            { index=6,  desc="Discover The Black Temple.",           npc=nil, coords={x=71.0,y=46.0}, mapID=104, criteriaIndex=6  },
            { index=7,  desc="Discover Illidari Point.",             npc=nil, coords={x=23.0,y=35.0}, mapID=104, criteriaIndex=7  },
            { index=8,  desc="Discover Ata'mal Terrace.",            npc=nil, coords={x=58.0,y=48.0}, mapID=104, criteriaIndex=8  },
            { index=9,  desc="Discover Warden's Cage.",              npc=nil, coords={x=57.0,y=49.0}, mapID=104, criteriaIndex=9  },
            { index=10, desc="Discover Eclipse Point.",              npc=nil, coords={x=47.0,y=69.0}, mapID=104, criteriaIndex=10 },
            { index=11, desc="Discover Netherwing Fields.",          npc=nil, coords={x=65.0,y=58.0}, mapID=104, criteriaIndex=11 },
            { index=12, desc="Discover Netherwing Ledge.",           npc=nil, coords={x=66.0,y=86.0}, mapID=104, criteriaIndex=12 },
            { index=13, desc="Discover Legion Hold.",                npc=nil, coords={x=23.0,y=38.0}, mapID=104, criteriaIndex=13 },
            { index=14, desc="Discover The Barrier Hills.",          npc=nil, coords={x=36.0,y=55.0}, mapID=104, criteriaIndex=14 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Shadow of the Betrayer" (ID 1195) — Quests
    -- Complete 90 quests in Shadowmoon Valley.
    -- -------------------------------------------------------------------------
    [1195] = {
        id       = 1195,
        name     = "Shadow of the Betrayer",
        category = "Quests",
        zone     = "Shadowmoon Valley",
        mapID    = 104,
        steps = {
            { index=1, desc="Complete 90 quests in Shadowmoon Valley.", npc=nil, coords={x=30.0,y=28.0}, mapID=104, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "On the Shadow's Trail" (ID 9528) — Quests (Draenor)
    -- -------------------------------------------------------------------------
    [9528] = {
        id       = 9528,
        name     = "On the Shadow's Trail",
        category = "Quests",
        zone     = "Shadowmoon Valley",
        mapID    = 539,
        steps = {
            { index=1, desc="Complete quests along the Shadow's Trail in Shadowmoon Valley (Draenor). Use /gp criteria 9528 to verify.", npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Shoot For the Moon" (ID 9602) — Quests (Draenor)
    -- -------------------------------------------------------------------------
    [9602] = {
        id       = 9602,
        name     = "Shoot For the Moon",
        category = "Quests",
        zone     = "Shadowmoon Valley",
        mapID    = 539,
        steps = {
            { index=1, desc="Complete the requirements for Shoot For the Moon in Shadowmoon Valley (Draenor). Use /gp criteria 9602 to verify.", npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=1 },
        },
    },

    -- -------------------------------------------------------------------------
    -- "Extinguishing Draenor" (ID 11277) — Quests (Draenor)
    -- -------------------------------------------------------------------------
    [11277] = {
        id       = 11277,
        name     = "Extinguishing Draenor",
        category = "Quests",
        zone     = "Shadowmoon Valley",
        mapID    = 539,
        steps = {
            { index=1, desc="Complete the requirements for Extinguishing Draenor in Shadowmoon Valley (Draenor). Use /gp criteria 11277 to verify.", npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- OUTLAND META ACHIEVEMENTS
    -- =========================================================================

    [1262] = {
        id       = 1262,
        name     = "Explore Outland",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore Hellfire Peninsula.",          npc=nil, coords={x=56.0,y=38.0}, mapID=100, criteriaIndex=1 },
            { index=2, desc="Complete Explore Zangarmarsh.",                 npc=nil, coords={x=78.0,y=63.0}, mapID=102, criteriaIndex=2 },
            { index=3, desc="Complete Explore Terokkar Forest.",             npc=nil, coords={x=58.0,y=54.0}, mapID=108, criteriaIndex=3 },
            { index=4, desc="Complete Explore Nagrand.",                     npc=nil, coords={x=55.0,y=37.0}, mapID=107, criteriaIndex=4 },
            { index=5, desc="Complete Explore Blade's Edge Mountains.",      npc=nil, coords={x=61.0,y=68.0}, mapID=105, criteriaIndex=5 },
            { index=6, desc="Complete Explore Netherstorm.",                 npc=nil, coords={x=33.0,y=64.0}, mapID=109, criteriaIndex=6 },
            { index=7, desc="Complete Explore Shadowmoon Valley.",           npc=nil, coords={x=30.0,y=28.0}, mapID=104, criteriaIndex=7 },
        },
    },


    -- =========================================================================
    -- DRAENOR ZONES (Warlords of Draenor)
    -- =========================================================================

    -- =========================================================================
    -- FROSTFIRE RIDGE (mapID 525)
    -- Level 90-92 Horde starting zone
    -- =========================================================================

    [8937] = {
        id       = 8937,
        name     = "Explore Frostfire Ridge",
        category = "Exploration",
        zone     = "Frostfire Ridge",
        mapID    = 525,
        steps = {
            { index=1,  desc="Discover Bladespire Citadel.",         npc=nil, coords={x=24.0,y=37.0}, mapID=525, criteriaIndex=1  },
            { index=2,  desc="Discover Frostwind Crag.",             npc=nil, coords={x=48.0,y=20.0}, mapID=525, criteriaIndex=2  },
            { index=3,  desc="Discover Grimfrost Hill.",             npc=nil, coords={x=53.0,y=53.0}, mapID=525, criteriaIndex=3  },
            { index=4,  desc="Discover Wor'gol.",                    npc=nil, coords={x=53.0,y=42.0}, mapID=525, criteriaIndex=4  },
            { index=5,  desc="Discover Bloodmaul Stronghold.",       npc=nil, coords={x=75.0,y=58.0}, mapID=525, criteriaIndex=5  },
            { index=6,  desc="Discover Stonefang Outpost.",          npc=nil, coords={x=49.0,y=48.0}, mapID=525, criteriaIndex=6  },
            { index=7,  desc="Discover Thunder Pass.",               npc=nil, coords={x=67.0,y=53.0}, mapID=525, criteriaIndex=7  },
            { index=8,  desc="Discover Colossal's Fall.",            npc=nil, coords={x=60.0,y=24.0}, mapID=525, criteriaIndex=8  },
            { index=9,  desc="Discover Grom'gar.",                   npc=nil, coords={x=66.0,y=48.0}, mapID=525, criteriaIndex=9  },
            { index=10, desc="Discover Iron Siegeworks.",            npc=nil, coords={x=85.0,y=50.0}, mapID=525, criteriaIndex=10 },
            { index=11, desc="Discover Throm'var.",                  npc=nil, coords={x=44.0,y=32.0}, mapID=525, criteriaIndex=11 },
        },
    },

    [8923] = {
        id       = 8923,
        name     = "Putting the Gore in Frostfire",
        category = "Quests",
        zone     = "Frostfire Ridge",
        mapID    = 525,
        steps = {
            { index=1, desc="Complete 100 quests in Frostfire Ridge.",            npc=nil, coords={x=53.0,y=42.0}, mapID=525, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SHADOWMOON VALLEY (DRAENOR) (mapID 539)
    -- Level 90-92 Alliance starting zone
    -- =========================================================================

    [8938] = {
        id       = 8938,
        name     = "Explore Shadowmoon Valley",
        category = "Exploration",
        zone     = "Shadowmoon Valley",
        mapID    = 539,
        steps = {
            { index=1,  desc="Discover Elodor.",                     npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=1  },
            { index=2,  desc="Discover Embaari Village.",            npc=nil, coords={x=45.0,y=39.0}, mapID=539, criteriaIndex=2  },
            { index=3,  desc="Discover The Draakorium.",             npc=nil, coords={x=55.0,y=73.0}, mapID=539, criteriaIndex=3  },
            { index=4,  desc="Discover Karabor.",                    npc=nil, coords={x=69.0,y=21.0}, mapID=539, criteriaIndex=4  },
            { index=5,  desc="Discover Anguish Fortress.",           npc=nil, coords={x=36.0,y=53.0}, mapID=539, criteriaIndex=5  },
            { index=6,  desc="Discover Path of the Light.",          npc=nil, coords={x=51.0,y=30.0}, mapID=539, criteriaIndex=6  },
            { index=7,  desc="Discover Shaz'gul.",                   npc=nil, coords={x=43.0,y=76.0}, mapID=539, criteriaIndex=7  },
            { index=8,  desc="Discover Shimmer Moor.",               npc=nil, coords={x=61.0,y=56.0}, mapID=539, criteriaIndex=8  },
            { index=9,  desc="Discover Socrethar's Rise.",           npc=nil, coords={x=46.0,y=70.0}, mapID=539, criteriaIndex=9  },
            { index=10, desc="Discover Gloomshade Grove.",           npc=nil, coords={x=70.0,y=34.0}, mapID=539, criteriaIndex=10 },
            { index=11, desc="Discover Gul'var.",                    npc=nil, coords={x=32.0,y=37.0}, mapID=539, criteriaIndex=11 },
        },
    },

    [8845] = {
        id       = 8845,
        name     = "As I Walk Through the Valley of the Shadow of Moon",
        category = "Quests",
        zone     = "Shadowmoon Valley",
        mapID    = 539,
        steps = {
            { index=1, desc="Complete 100 quests in Shadowmoon Valley.",          npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- GORGROND (mapID 543)
    -- Level 92-94 zone
    -- =========================================================================

    [8939] = {
        id       = 8939,
        name     = "Explore Gorgrond",
        category = "Exploration",
        zone     = "Gorgrond",
        mapID    = 543,
        steps = {
            { index=1,  desc="Discover Beastwatch.",                 npc=nil, coords={x=46.0,y=69.0}, mapID=543, criteriaIndex=1  },
            { index=2,  desc="Discover Bastion Rise.",               npc=nil, coords={x=46.0,y=55.0}, mapID=543, criteriaIndex=2  },
            { index=3,  desc="Discover Everbloom Wilds.",            npc=nil, coords={x=54.0,y=64.0}, mapID=543, criteriaIndex=3  },
            { index=4,  desc="Discover Crimson Fen.",                npc=nil, coords={x=46.0,y=76.0}, mapID=543, criteriaIndex=4  },
            { index=5,  desc="Discover Tangleheart.",                npc=nil, coords={x=58.0,y=70.0}, mapID=543, criteriaIndex=5  },
            { index=6,  desc="Discover Evermorn Springs.",           npc=nil, coords={x=65.0,y=50.0}, mapID=543, criteriaIndex=6  },
            { index=7,  desc="Discover Tailthrasher Basin.",         npc=nil, coords={x=50.0,y=48.0}, mapID=543, criteriaIndex=7  },
            { index=8,  desc="Discover The Pit.",                    npc=nil, coords={x=45.0,y=50.0}, mapID=543, criteriaIndex=8  },
            { index=9,  desc="Discover Stonemaul Arena.",            npc=nil, coords={x=42.0,y=56.0}, mapID=543, criteriaIndex=9  },
            { index=10, desc="Discover Gronn Canyon.",               npc=nil, coords={x=56.0,y=46.0}, mapID=543, criteriaIndex=10 },
            { index=11, desc="Discover Deadgrin.",                   npc=nil, coords={x=39.0,y=41.0}, mapID=543, criteriaIndex=11 },
        },
    },

    [8924] = {
        id       = 8924,
        name     = "Entre-Preneuer",
        category = "Quests",
        zone     = "Gorgrond",
        mapID    = 543,
        steps = {
            { index=1, desc="Complete 100 quests in Gorgrond.",                   npc=nil, coords={x=46.0,y=69.0}, mapID=543, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TALADOR (mapID 535)
    -- Level 94-96 zone
    -- =========================================================================

    [8940] = {
        id       = 8940,
        name     = "Explore Talador",
        category = "Exploration",
        zone     = "Talador",
        mapID    = 535,
        steps = {
            { index=1,  desc="Discover Auchindoun.",                 npc=nil, coords={x=45.0,y=72.0}, mapID=535, criteriaIndex=1  },
            { index=2,  desc="Discover Fort Wrynn.",                 npc=nil, coords={x=69.0,y=21.0}, mapID=535, criteriaIndex=2  },
            { index=3,  desc="Discover Vol'jin's Pride.",            npc=nil, coords={x=71.0,y=29.0}, mapID=535, criteriaIndex=3  },
            { index=4,  desc="Discover Shattrath City.",             npc=nil, coords={x=55.0,y=42.0}, mapID=535, criteriaIndex=4  },
            { index=5,  desc="Discover Gordal Fortress.",            npc=nil, coords={x=46.0,y=39.0}, mapID=535, criteriaIndex=5  },
            { index=6,  desc="Discover The Path of Glory.",          npc=nil, coords={x=54.0,y=25.0}, mapID=535, criteriaIndex=6  },
            { index=7,  desc="Discover Gul'rok.",                    npc=nil, coords={x=74.0,y=40.0}, mapID=535, criteriaIndex=7  },
            { index=8,  desc="Discover Tomb of Lights.",             npc=nil, coords={x=56.0,y=74.0}, mapID=535, criteriaIndex=8  },
            { index=9,  desc="Discover Anchorite's Sojourn.",        npc=nil, coords={x=65.0,y=50.0}, mapID=535, criteriaIndex=9  },
            { index=10, desc="Discover Zangarra.",                   npc=nil, coords={x=79.0,y=48.0}, mapID=535, criteriaIndex=10 },
            { index=11, desc="Discover Tuurem.",                     npc=nil, coords={x=57.0,y=65.0}, mapID=535, criteriaIndex=11 },
        },
    },

    [8925] = {
        id       = 8925,
        name     = "Don't Let the Tala-door Hit You on the Way Out",
        category = "Quests",
        zone     = "Talador",
        mapID    = 535,
        steps = {
            { index=1, desc="Complete 100 quests in Talador.",                    npc=nil, coords={x=69.0,y=21.0}, mapID=535, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SPIRES OF ARAK (mapID 542)
    -- Level 96-98 zone
    -- =========================================================================

    [8941] = {
        id       = 8941,
        name     = "Explore Spires of Arak",
        category = "Exploration",
        zone     = "Spires of Arak",
        mapID    = 542,
        steps = {
            { index=1,  desc="Discover Southport.",                  npc=nil, coords={x=37.0,y=44.0}, mapID=542, criteriaIndex=1  },
            { index=2,  desc="Discover Axefall.",                    npc=nil, coords={x=37.0,y=43.0}, mapID=542, criteriaIndex=2  },
            { index=3,  desc="Discover Pinchwhistle Gearworks.",     npc=nil, coords={x=61.0,y=73.0}, mapID=542, criteriaIndex=3  },
            { index=4,  desc="Discover Veil Akraz.",                 npc=nil, coords={x=33.0,y=24.0}, mapID=542, criteriaIndex=4  },
            { index=5,  desc="Discover Skettis.",                    npc=nil, coords={x=52.0,y=18.0}, mapID=542, criteriaIndex=5  },
            { index=6,  desc="Discover Admiral Taylor's Garrison.",  npc=nil, coords={x=58.0,y=90.0}, mapID=542, criteriaIndex=6  },
            { index=7,  desc="Discover Bladefist Hold.",             npc=nil, coords={x=36.0,y=39.0}, mapID=542, criteriaIndex=7  },
            { index=8,  desc="Discover Sethekk Hollow.",             npc=nil, coords={x=44.0,y=25.0}, mapID=542, criteriaIndex=8  },
            { index=9,  desc="Discover Terrace of Dawn.",            npc=nil, coords={x=42.0,y=23.0}, mapID=542, criteriaIndex=9  },
            { index=10, desc="Discover Ravenskar.",                  npc=nil, coords={x=52.0,y=35.0}, mapID=542, criteriaIndex=10 },
            { index=11, desc="Discover Bloodmane Valley.",           npc=nil, coords={x=47.0,y=54.0}, mapID=542, criteriaIndex=11 },
        },
    },

    [8926] = {
        id       = 8926,
        name     = "Between Arak and a Hard Place",
        category = "Quests",
        zone     = "Spires of Arak",
        mapID    = 542,
        steps = {
            { index=1, desc="Complete 100 quests in Spires of Arak.",             npc=nil, coords={x=37.0,y=44.0}, mapID=542, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- NAGRAND (DRAENOR) (mapID 550)
    -- Level 98-100 zone
    -- =========================================================================

    [8942] = {
        id       = 8942,
        name     = "Explore Nagrand",
        category = "Exploration",
        zone     = "Nagrand",
        mapID    = 550,
        steps = {
            { index=1,  desc="Discover Highmaul Harbor.",            npc=nil, coords={x=83.0,y=44.0}, mapID=550, criteriaIndex=1  },
            { index=2,  desc="Discover Lok-rath.",                   npc=nil, coords={x=45.0,y=21.0}, mapID=550, criteriaIndex=2  },
            { index=3,  desc="Discover Telaar.",                     npc=nil, coords={x=78.0,y=52.0}, mapID=550, criteriaIndex=3  },
            { index=4,  desc="Discover Throne of the Elements.",     npc=nil, coords={x=66.0,y=63.0}, mapID=550, criteriaIndex=4  },
            { index=5,  desc="Discover Zangar Shore.",               npc=nil, coords={x=79.0,y=70.0}, mapID=550, criteriaIndex=5  },
            { index=6,  desc="Discover The Ring of Trials.",         npc=nil, coords={x=51.0,y=78.0}, mapID=550, criteriaIndex=6  },
            { index=7,  desc="Discover Hallvalor.",                  npc=nil, coords={x=85.0,y=59.0}, mapID=550, criteriaIndex=7  },
            { index=8,  desc="Discover Mar'gok's Overwatch.",        npc=nil, coords={x=48.0,y=37.0}, mapID=550, criteriaIndex=8  },
            { index=9,  desc="Discover Ancestral Grounds.",          npc=nil, coords={x=70.0,y=48.0}, mapID=550, criteriaIndex=9  },
            { index=10, desc="Discover Ironfist Harbor.",            npc=nil, coords={x=80.0,y=27.0}, mapID=550, criteriaIndex=10 },
            { index=11, desc="Discover Oshu'gun.",                   npc=nil, coords={x=44.0,y=44.0}, mapID=550, criteriaIndex=11 },
        },
    },

    [8927] = {
        id       = 8927,
        name     = "Nagrandeur",
        category = "Quests",
        zone     = "Nagrand",
        mapID    = 550,
        steps = {
            { index=1, desc="Complete 100 quests in Nagrand.",                    npc=nil, coords={x=78.0,y=52.0}, mapID=550, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TANAAN JUNGLE (mapID 534)
    -- Level 100 zone (Patch 6.2 content)
    -- =========================================================================

    [10260] = {
        id       = 10260,
        name     = "Explore Tanaan Jungle",
        category = "Exploration",
        zone     = "Tanaan Jungle",
        mapID    = 534,
        steps = {
            { index=1,  desc="Discover Lion's Watch.",               npc=nil, coords={x=57.0,y=60.0}, mapID=534, criteriaIndex=1  },
            { index=2,  desc="Discover Vol'mar.",                    npc=nil, coords={x=60.0,y=53.0}, mapID=534, criteriaIndex=2  },
            { index=3,  desc="Discover Zeth'Gol.",                   npc=nil, coords={x=14.0,y=42.0}, mapID=534, criteriaIndex=3  },
            { index=4,  desc="Discover Ironhold Harbor.",            npc=nil, coords={x=82.0,y=49.0}, mapID=534, criteriaIndex=4  },
            { index=5,  desc="Discover Temple of Sha'naar.",         npc=nil, coords={x=30.0,y=40.0}, mapID=534, criteriaIndex=5  },
            { index=6,  desc="Discover Throne of Kil'jaeden.",       npc=nil, coords={x=13.0,y=53.0}, mapID=534, criteriaIndex=6  },
            { index=7,  desc="Discover Hellfire Citadel.",           npc=nil, coords={x=45.0,y=53.0}, mapID=534, criteriaIndex=7  },
            { index=8,  desc="Discover Ruins of Kra'nak.",           npc=nil, coords={x=15.0,y=61.0}, mapID=534, criteriaIndex=8  },
            { index=9,  desc="Discover The Iron Front.",             npc=nil, coords={x=61.0,y=42.0}, mapID=534, criteriaIndex=9  },
            { index=10, desc="Discover Rangari Refuge.",             npc=nil, coords={x=42.0,y=73.0}, mapID=534, criteriaIndex=10 },
        },
    },

    -- =========================================================================
    -- DRAENOR META ACHIEVEMENTS
    -- =========================================================================

    [8935] = {
        id       = 8935,
        name     = "Explore Draenor",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore Frostfire Ridge.",             npc=nil, coords={x=53.0,y=42.0}, mapID=525, criteriaIndex=1 },
            { index=2, desc="Complete Explore Shadowmoon Valley.",           npc=nil, coords={x=56.0,y=42.0}, mapID=539, criteriaIndex=2 },
            { index=3, desc="Complete Explore Gorgrond.",                    npc=nil, coords={x=46.0,y=69.0}, mapID=543, criteriaIndex=3 },
            { index=4, desc="Complete Explore Talador.",                     npc=nil, coords={x=69.0,y=21.0}, mapID=535, criteriaIndex=4 },
            { index=5, desc="Complete Explore Spires of Arak.",              npc=nil, coords={x=37.0,y=44.0}, mapID=542, criteriaIndex=5 },
            { index=6, desc="Complete Explore Nagrand.",                     npc=nil, coords={x=78.0,y=52.0}, mapID=550, criteriaIndex=6 },
        },
    },

    [8921] = {
        id       = 8921,
        name     = "Loremaster of Draenor",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete questing achievements in all major Draenor zones.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- BROKEN ISLES ZONES (Legion)
    -- =========================================================================

    -- =========================================================================
    -- AZSUNA (mapID 630)
    -- Level 100-110 zone
    -- =========================================================================

    [10665] = {
        id       = 10665,
        name     = "Explore Azsuna",
        category = "Exploration",
        zone     = "Azsuna",
        mapID    = 630,
        steps = {
            { index=1,  desc="Discover Illidari Stand.",             npc=nil, coords={x=62.0,y=46.0}, mapID=630, criteriaIndex=1  },
            { index=2,  desc="Discover Faronaar.",                   npc=nil, coords={x=17.0,y=41.0}, mapID=630, criteriaIndex=2  },
            { index=3,  desc="Discover Nar'thalas Academy.",         npc=nil, coords={x=26.0,y=31.0}, mapID=630, criteriaIndex=3  },
            { index=4,  desc="Discover Temple of a Thousand Lights.",npc=nil, coords={x=30.0,y=49.0}, mapID=630, criteriaIndex=4  },
            { index=5,  desc="Discover Llothien Highlands.",         npc=nil, coords={x=32.0,y=27.0}, mapID=630, criteriaIndex=5  },
            { index=6,  desc="Discover The Greenway.",               npc=nil, coords={x=55.0,y=27.0}, mapID=630, criteriaIndex=6  },
            { index=7,  desc="Discover Azurewing Repose.",           npc=nil, coords={x=48.0,y=25.0}, mapID=630, criteriaIndex=7  },
            { index=8,  desc="Discover Felblaze Ingress.",           npc=nil, coords={x=40.0,y=54.0}, mapID=630, criteriaIndex=8  },
            { index=9,  desc="Discover Ruined Sanctum.",             npc=nil, coords={x=37.0,y=30.0}, mapID=630, criteriaIndex=9  },
            { index=10, desc="Discover Isle of the Watchers.",       npc=nil, coords={x=63.0,y=35.0}, mapID=630, criteriaIndex=10 },
        },
    },

    [11157] = {
        id       = 11157,
        name     = "Azsuna Matata",
        category = "Quests",
        zone     = "Azsuna",
        mapID    = 630,
        steps = {
            { index=1, desc="Complete the Azsuna storylines.",                    npc=nil, coords={x=62.0,y=46.0}, mapID=630, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- VAL'SHARAH (mapID 641)
    -- Level 100-110 zone
    -- =========================================================================

    [10666] = {
        id       = 10666,
        name     = "Explore Val'sharah",
        category = "Exploration",
        zone     = "Val'sharah",
        mapID    = 641,
        steps = {
            { index=1,  desc="Discover Lorlathil.",                  npc=nil, coords={x=54.0,y=73.0}, mapID=641, criteriaIndex=1  },
            { index=2,  desc="Discover Black Rook Hold.",            npc=nil, coords={x=39.0,y=52.0}, mapID=641, criteriaIndex=2  },
            { index=3,  desc="Discover Shadowglen.",                 npc=nil, coords={x=43.0,y=73.0}, mapID=641, criteriaIndex=3  },
            { index=4,  desc="Discover Bradensbrook.",               npc=nil, coords={x=42.0,y=59.0}, mapID=641, criteriaIndex=4  },
            { index=5,  desc="Discover Grove of Cenarius.",          npc=nil, coords={x=52.0,y=56.0}, mapID=641, criteriaIndex=5  },
            { index=6,  desc="Discover Shala'nir.",                  npc=nil, coords={x=64.0,y=52.0}, mapID=641, criteriaIndex=6  },
            { index=7,  desc="Discover Mistvale.",                   npc=nil, coords={x=68.0,y=60.0}, mapID=641, criteriaIndex=7  },
            { index=8,  desc="Discover Moonclaw Vale.",              npc=nil, coords={x=64.0,y=36.0}, mapID=641, criteriaIndex=8  },
            { index=9,  desc="Discover Temple of Elune.",            npc=nil, coords={x=54.0,y=55.0}, mapID=641, criteriaIndex=9  },
            { index=10, desc="Discover Emerald Bay.",                npc=nil, coords={x=66.0,y=88.0}, mapID=641, criteriaIndex=10 },
        },
    },

    [11158] = {
        id       = 11158,
        name     = "That's Val'sharah Folks!",
        category = "Quests",
        zone     = "Val'sharah",
        mapID    = 641,
        steps = {
            { index=1, desc="Complete the Val'sharah storylines.",               npc=nil, coords={x=54.0,y=73.0}, mapID=641, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- HIGHMOUNTAIN (mapID 650)
    -- Level 100-110 zone
    -- =========================================================================

    [10667] = {
        id       = 10667,
        name     = "Explore Highmountain",
        category = "Exploration",
        zone     = "Highmountain",
        mapID    = 650,
        steps = {
            { index=1,  desc="Discover Thunder Totem.",              npc=nil, coords={x=46.0,y=61.0}, mapID=650, criteriaIndex=1  },
            { index=2,  desc="Discover Riverbend.",                  npc=nil, coords={x=42.0,y=49.0}, mapID=650, criteriaIndex=2  },
            { index=3,  desc="Discover Skyhorn.",                    npc=nil, coords={x=53.0,y=35.0}, mapID=650, criteriaIndex=3  },
            { index=4,  desc="Discover Bloodhunt Highland.",         npc=nil, coords={x=40.0,y=34.0}, mapID=650, criteriaIndex=4  },
            { index=5,  desc="Discover The Witchwood.",              npc=nil, coords={x=51.0,y=66.0}, mapID=650, criteriaIndex=5  },
            { index=6,  desc="Discover Shipwreck Cove.",             npc=nil, coords={x=39.0,y=76.0}, mapID=650, criteriaIndex=6  },
            { index=7,  desc="Discover Stonedark Grotto.",           npc=nil, coords={x=41.0,y=60.0}, mapID=650, criteriaIndex=7  },
            { index=8,  desc="Discover Pinerock Basin.",             npc=nil, coords={x=40.0,y=54.0}, mapID=650, criteriaIndex=8  },
            { index=9,  desc="Discover Rockcrawler Chasm.",          npc=nil, coords={x=28.0,y=40.0}, mapID=650, criteriaIndex=9  },
            { index=10, desc="Discover Nightmare Scar.",             npc=nil, coords={x=56.0,y=49.0}, mapID=650, criteriaIndex=10 },
        },
    },

    [11156] = {
        id       = 11156,
        name     = "Ain't No Mountain High Enough",
        category = "Quests",
        zone     = "Highmountain",
        mapID    = 650,
        steps = {
            { index=1, desc="Complete the Highmountain storylines.",             npc=nil, coords={x=46.0,y=61.0}, mapID=650, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- STORMHEIM (mapID 634)
    -- Level 100-110 zone
    -- =========================================================================

    [10668] = {
        id       = 10668,
        name     = "Explore Stormheim",
        category = "Exploration",
        zone     = "Stormheim",
        mapID    = 634,
        steps = {
            { index=1,  desc="Discover Valdisdall.",                 npc=nil, coords={x=60.0,y=51.0}, mapID=634, criteriaIndex=1  },
            { index=2,  desc="Discover Greywatch.",                  npc=nil, coords={x=30.0,y=71.0}, mapID=634, criteriaIndex=2  },
            { index=3,  desc="Discover Watchman's Rock.",            npc=nil, coords={x=45.0,y=65.0}, mapID=634, criteriaIndex=3  },
            { index=4,  desc="Discover Gates of Valor.",             npc=nil, coords={x=67.0,y=56.0}, mapID=634, criteriaIndex=4  },
            { index=5,  desc="Discover Dreadwake's Landing.",        npc=nil, coords={x=78.0,y=31.0}, mapID=634, criteriaIndex=5  },
            { index=6,  desc="Discover Tideskorn Harbor.",           npc=nil, coords={x=55.0,y=73.0}, mapID=634, criteriaIndex=6  },
            { index=7,  desc="Discover Shield's Rest.",              npc=nil, coords={x=63.0,y=40.0}, mapID=634, criteriaIndex=7  },
            { index=8,  desc="Discover Halls of Valor.",             npc=nil, coords={x=72.0,y=71.0}, mapID=634, criteriaIndex=8  },
            { index=9,  desc="Discover Haustvald.",                  npc=nil, coords={x=50.0,y=45.0}, mapID=634, criteriaIndex=9  },
            { index=10, desc="Discover The Runewood.",               npc=nil, coords={x=44.0,y=49.0}, mapID=634, criteriaIndex=10 },
        },
    },

    [11159] = {
        id       = 11159,
        name     = "Can't Hug Every Cat",
        category = "Quests",
        zone     = "Stormheim",
        mapID    = 634,
        steps = {
            { index=1, desc="Complete the Stormheim storylines.",                npc=nil, coords={x=60.0,y=51.0}, mapID=634, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- SURAMAR (mapID 680)
    -- Level 110 zone
    -- =========================================================================

    [10669] = {
        id       = 10669,
        name     = "Explore Suramar",
        category = "Exploration",
        zone     = "Suramar",
        mapID    = 680,
        steps = {
            { index=1,  desc="Discover Suramar City.",               npc=nil, coords={x=44.0,y=59.0}, mapID=680, criteriaIndex=1  },
            { index=2,  desc="Discover Meredil.",                    npc=nil, coords={x=35.0,y=70.0}, mapID=680, criteriaIndex=2  },
            { index=3,  desc="Discover The Waning Crescent.",        npc=nil, coords={x=30.0,y=56.0}, mapID=680, criteriaIndex=3  },
            { index=4,  desc="Discover Moon Guard Stronghold.",      npc=nil, coords={x=52.0,y=78.0}, mapID=680, criteriaIndex=4  },
            { index=5,  desc="Discover Tel'anor.",                   npc=nil, coords={x=41.0,y=78.0}, mapID=680, criteriaIndex=5  },
            { index=6,  desc="Discover Felsoul Hold.",               npc=nil, coords={x=22.0,y=36.0}, mapID=680, criteriaIndex=6  },
            { index=7,  desc="Discover The Arcway Vaults.",          npc=nil, coords={x=52.0,y=89.0}, mapID=680, criteriaIndex=7  },
            { index=8,  desc="Discover Crimson Thicket.",            npc=nil, coords={x=21.0,y=54.0}, mapID=680, criteriaIndex=8  },
            { index=9,  desc="Discover Ambervale.",                  npc=nil, coords={x=64.0,y=52.0}, mapID=680, criteriaIndex=9  },
            { index=10, desc="Discover Falanaar.",                   npc=nil, coords={x=21.0,y=60.0}, mapID=680, criteriaIndex=10 },
        },
    },

    [11260] = {
        id       = 11260,
        name     = "Good Suramaritan",
        category = "Quests",
        zone     = "Suramar",
        mapID    = 680,
        steps = {
            { index=1, desc="Complete the Suramar storylines.",                  npc=nil, coords={x=44.0,y=59.0}, mapID=680, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- BROKEN ISLES META ACHIEVEMENTS
    -- =========================================================================


    [11188] = {
        id       = 11188,
        name     = "Broken Isles Diplomat",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete all major storylines across the Broken Isles.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- BATTLE FOR AZEROTH ZONES (BFA)
    -- =========================================================================

    -- =========================================================================
    -- ZULDAZAR (mapID 862)
    -- Level 110-120 Horde zone
    -- =========================================================================

    [12559] = {
        id       = 12559,
        name     = "Explore Zuldazar",
        category = "Exploration",
        zone     = "Zuldazar",
        mapID    = 862,
        steps = {
            { index=1,  desc="Discover Dazar'alor.",                 npc=nil, coords={x=50.0,y=31.0}, mapID=862, criteriaIndex=1  },
            { index=2,  desc="Discover Xibala.",                     npc=nil, coords={x=52.0,y=43.0}, mapID=862, criteriaIndex=2  },
            { index=3,  desc="Discover The Sliver.",                 npc=nil, coords={x=46.0,y=26.0}, mapID=862, criteriaIndex=3  },
            { index=4,  desc="Discover Garden of the Loa.",          npc=nil, coords={x=48.0,y=24.0}, mapID=862, criteriaIndex=4  },
            { index=5,  desc="Discover Atal'Dazar.",                 npc=nil, coords={x=43.0,y=39.0}, mapID=862, criteriaIndex=5  },
            { index=6,  desc="Discover Tusk Isle.",                  npc=nil, coords={x=62.0,y=17.0}, mapID=862, criteriaIndex=6  },
            { index=7,  desc="Discover Savagelands.",                npc=nil, coords={x=48.0,y=49.0}, mapID=862, criteriaIndex=7  },
            { index=8,  desc="Discover Dreadpike Shore.",            npc=nil, coords={x=72.0,y=66.0}, mapID=862, criteriaIndex=8  },
            { index=9,  desc="Discover Atal'Gral.",                  npc=nil, coords={x=50.0,y=81.0}, mapID=862, criteriaIndex=9  },
            { index=10, desc="Discover The Necropolis.",             npc=nil, coords={x=39.0,y=66.0}, mapID=862, criteriaIndex=10 },
        },
    },

    [11861] = {
        id       = 11861,
        name     = "The Pride of Kul Tiras",
        category = "Quests",
        zone     = "Zuldazar",
        mapID    = 862,
        steps = {
            { index=1, desc="Complete the Zuldazar storylines.",                 npc=nil, coords={x=50.0,y=31.0}, mapID=862, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- NAZMIR (mapID 863)
    -- Level 110-120 Horde zone
    -- =========================================================================

    [12561] = {
        id       = 12561,
        name     = "Explore Nazmir",
        category = "Exploration",
        zone     = "Nazmir",
        mapID    = 863,
        steps = {
            { index=1,  desc="Discover Zal'amak.",                   npc=nil, coords={x=39.0,y=36.0}, mapID=863, criteriaIndex=1  },
            { index=2,  desc="Discover Zo'bal Ruins.",               npc=nil, coords={x=38.0,y=60.0}, mapID=863, criteriaIndex=2  },
            { index=3,  desc="Discover The Necropolis.",             npc=nil, coords={x=66.0,y=25.0}, mapID=863, criteriaIndex=3  },
            { index=4,  desc="Discover Heart of Darkness.",          npc=nil, coords={x=51.0,y=59.0}, mapID=863, criteriaIndex=4  },
            { index=5,  desc="Discover Torga's Rest.",               npc=nil, coords={x=48.0,y=46.0}, mapID=863, criteriaIndex=5  },
            { index=6,  desc="Discover Nazwatha.",                   npc=nil, coords={x=76.0,y=58.0}, mapID=863, criteriaIndex=6  },
            { index=7,  desc="Discover Krag'wa's Burrow.",           npc=nil, coords={x=73.0,y=50.0}, mapID=863, criteriaIndex=7  },
            { index=8,  desc="Discover Gloom Hollow.",               npc=nil, coords={x=33.0,y=53.0}, mapID=863, criteriaIndex=8  },
            { index=9,  desc="Discover The Frogmarsh.",              npc=nil, coords={x=69.0,y=58.0}, mapID=863, criteriaIndex=9  },
            { index=10, desc="Discover Primal Wetlands.",            npc=nil, coords={x=25.0,y=41.0}, mapID=863, criteriaIndex=10 },
        },
    },

    [11868] = {
        id       = 11868,
        name     = "The Dark Heart of Nazmir",
        category = "Quests",
        zone     = "Nazmir",
        mapID    = 863,
        steps = {
            { index=1, desc="Complete the Nazmir storylines.",                   npc=nil, coords={x=39.0,y=36.0}, mapID=863, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- VOL'DUN (mapID 864)
    -- Level 110-120 Horde zone
    -- =========================================================================

    [12560] = {
        id       = 12560,
        name     = "Explore Vol'dun",
        category = "Exploration",
        zone     = "Vol'dun",
        mapID    = 864,
        steps = {
            { index=1,  desc="Discover Vulpera Hideaway.",           npc=nil, coords={x=43.0,y=78.0}, mapID=864, criteriaIndex=1  },
            { index=2,  desc="Discover Vol'dun.",                    npc=nil, coords={x=29.0,y=51.0}, mapID=864, criteriaIndex=2  },
            { index=3,  desc="Discover Temple of Akunda.",           npc=nil, coords={x=53.0,y=90.0}, mapID=864, criteriaIndex=3  },
            { index=4,  desc="Discover Port of Zem'lan.",            npc=nil, coords={x=56.0,y=14.0}, mapID=864, criteriaIndex=4  },
            { index=5,  desc="Discover The Brine Basin.",            npc=nil, coords={x=63.0,y=21.0}, mapID=864, criteriaIndex=5  },
            { index=6,  desc="Discover Tortaka Refuge.",             npc=nil, coords={x=56.0,y=12.0}, mapID=864, criteriaIndex=6  },
            { index=7,  desc="Discover Whistlebloom Oasis.",         npc=nil, coords={x=49.0,y=66.0}, mapID=864, criteriaIndex=7  },
            { index=8,  desc="Discover Atul'Aman.",                  npc=nil, coords={x=44.0,y=58.0}, mapID=864, criteriaIndex=8  },
            { index=9,  desc="Discover The Cracked Coast.",          npc=nil, coords={x=32.0,y=29.0}, mapID=864, criteriaIndex=9  },
            { index=10, desc="Discover Terrace of the Devoted.",     npc=nil, coords={x=27.0,y=52.0}, mapID=864, criteriaIndex=10 },
        },
    },

    [11869] = {
        id       = 11869,
        name     = "Secrets in the Sands",
        category = "Quests",
        zone     = "Vol'dun",
        mapID    = 864,
        steps = {
            { index=1, desc="Complete the Vol'dun storylines.",                  npc=nil, coords={x=43.0,y=78.0}, mapID=864, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- TIRAGARDE SOUND (mapID 895)
    -- Level 110-120 Alliance zone
    -- =========================================================================

    [12556] = {
        id       = 12556,
        name     = "Explore Tiragarde Sound",
        category = "Exploration",
        zone     = "Tiragarde Sound",
        mapID    = 895,
        steps = {
            { index=1,  desc="Discover Boralus.",                    npc=nil, coords={x=73.0,y=70.0}, mapID=895, criteriaIndex=1  },
            { index=2,  desc="Discover Freehold.",                   npc=nil, coords={x=84.0,y=78.0}, mapID=895, criteriaIndex=2  },
            { index=3,  desc="Discover Anglepoint Wharf.",           npc=nil, coords={x=87.0,y=58.0}, mapID=895, criteriaIndex=3  },
            { index=4,  desc="Discover Norwington Estate.",          npc=nil, coords={x=52.0,y=26.0}, mapID=895, criteriaIndex=4  },
            { index=5,  desc="Discover Vigil Hill.",                 npc=nil, coords={x=56.0,y=60.0}, mapID=895, criteriaIndex=5  },
            { index=6,  desc="Discover Kennings Lodge.",             npc=nil, coords={x=76.0,y=82.0}, mapID=895, criteriaIndex=6  },
            { index=7,  desc="Discover Waning Glacier.",             npc=nil, coords={x=61.0,y=50.0}, mapID=895, criteriaIndex=7  },
            { index=8,  desc="Discover Fernwood Ridge.",             npc=nil, coords={x=55.0,y=45.0}, mapID=895, criteriaIndex=8  },
            { index=9,  desc="Discover Krakenbane Cove.",            npc=nil, coords={x=81.0,y=54.0}, mapID=895, criteriaIndex=9  },
            { index=10, desc="Discover Abandoned Junkheap.",         npc=nil, coords={x=56.0,y=70.0}, mapID=895, criteriaIndex=10 },
        },
    },

    [12473] = {
        id       = 12473,
        name     = "A Sound Plan",
        category = "Quests",
        zone     = "Tiragarde Sound",
        mapID    = 895,
        steps = {
            { index=1, desc="Complete the Tiragarde Sound storylines.",          npc=nil, coords={x=73.0,y=70.0}, mapID=895, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- DRUSTVAR (mapID 896)
    -- Level 110-120 Alliance zone
    -- =========================================================================

    [12557] = {
        id       = 12557,
        name     = "Explore Drustvar",
        category = "Exploration",
        zone     = "Drustvar",
        mapID    = 896,
        steps = {
            { index=1,  desc="Discover Fallhaven.",                  npc=nil, coords={x=55.0,y=35.0}, mapID=896, criteriaIndex=1  },
            { index=2,  desc="Discover Hangman's Point.",            npc=nil, coords={x=71.0,y=40.0}, mapID=896, criteriaIndex=2  },
            { index=3,  desc="Discover Corlain.",                    npc=nil, coords={x=27.0,y=48.0}, mapID=896, criteriaIndex=3  },
            { index=4,  desc="Discover Crimson Forest.",             npc=nil, coords={x=40.0,y=42.0}, mapID=896, criteriaIndex=4  },
            { index=5,  desc="Discover Gol Koval.",                  npc=nil, coords={x=60.0,y=62.0}, mapID=896, criteriaIndex=5  },
            { index=6,  desc="Discover Barbthorn Ridge.",            npc=nil, coords={x=46.0,y=26.0}, mapID=896, criteriaIndex=6  },
            { index=7,  desc="Discover Highroad Pass.",              npc=nil, coords={x=48.0,y=60.0}, mapID=896, criteriaIndex=7  },
            { index=8,  desc="Discover Fletcher's Hollow.",          npc=nil, coords={x=60.0,y=70.0}, mapID=896, criteriaIndex=8  },
            { index=9,  desc="Discover Waycrest Manor.",             npc=nil, coords={x=33.0,y=30.0}, mapID=896, criteriaIndex=9  },
            { index=10, desc="Discover Arom's Stand.",               npc=nil, coords={x=38.0,y=54.0}, mapID=896, criteriaIndex=10 },
        },
    },

    [12497] = {
        id       = 12497,
        name     = "Drust Do It",
        category = "Quests",
        zone     = "Drustvar",
        mapID    = 896,
        steps = {
            { index=1, desc="Complete the Drustvar storylines.",                 npc=nil, coords={x=55.0,y=35.0}, mapID=896, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- STORMSONG VALLEY (mapID 942)
    -- Level 110-120 Alliance zone
    -- =========================================================================

    [12558] = {
        id       = 12558,
        name     = "Explore Stormsong Valley",
        category = "Exploration",
        zone     = "Stormsong Valley",
        mapID    = 942,
        steps = {
            { index=1,  desc="Discover Brennadam.",                  npc=nil, coords={x=59.0,y=69.0}, mapID=942, criteriaIndex=1  },
            { index=2,  desc="Discover Fort Daelin.",                npc=nil, coords={x=64.0,y=47.0}, mapID=942, criteriaIndex=2  },
            { index=3,  desc="Discover Deadwash.",                   npc=nil, coords={x=66.0,y=30.0}, mapID=942, criteriaIndex=3  },
            { index=4,  desc="Discover Shrine of the Storm.",        npc=nil, coords={x=67.0,y=43.0}, mapID=942, criteriaIndex=4  },
            { index=5,  desc="Discover Warfang Hold.",               npc=nil, coords={x=61.0,y=31.0}, mapID=942, criteriaIndex=5  },
            { index=6,  desc="Discover Millstone Hamlet.",           npc=nil, coords={x=50.0,y=48.0}, mapID=942, criteriaIndex=6  },
            { index=7,  desc="Discover Sagehold.",                   npc=nil, coords={x=77.0,y=27.0}, mapID=942, criteriaIndex=7  },
            { index=8,  desc="Discover The Wailing Tideway.",        npc=nil, coords={x=54.0,y=58.0}, mapID=942, criteriaIndex=8  },
            { index=9,  desc="Discover Thornheart.",                 npc=nil, coords={x=68.0,y=62.0}, mapID=942, criteriaIndex=9  },
            { index=10, desc="Discover Briarback Kraul.",            npc=nil, coords={x=42.0,y=54.0}, mapID=942, criteriaIndex=10 },
        },
    },

    [12496] = {
        id       = 12496,
        name     = "Stormsong and Dance",
        category = "Quests",
        zone     = "Stormsong Valley",
        mapID    = 942,
        steps = {
            { index=1, desc="Complete the Stormsong Valley storylines.",         npc=nil, coords={x=59.0,y=69.0}, mapID=942, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- BFA META ACHIEVEMENTS
    -- =========================================================================

    [12988] = {
        id       = 12988,
        name     = "Battle for Azeroth Explorer",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore Zuldazar.",                    npc=nil, coords={x=50.0,y=31.0}, mapID=862, criteriaIndex=1 },
            { index=2, desc="Complete Explore Nazmir.",                      npc=nil, coords={x=39.0,y=36.0}, mapID=863, criteriaIndex=2 },
            { index=3, desc="Complete Explore Vol'dun.",                     npc=nil, coords={x=43.0,y=78.0}, mapID=864, criteriaIndex=3 },
            { index=4, desc="Complete Explore Tiragarde Sound.",             npc=nil, coords={x=73.0,y=70.0}, mapID=895, criteriaIndex=4 },
            { index=5, desc="Complete Explore Drustvar.",                    npc=nil, coords={x=55.0,y=35.0}, mapID=896, criteriaIndex=5 },
            { index=6, desc="Complete Explore Stormsong Valley.",            npc=nil, coords={x=59.0,y=69.0}, mapID=942, criteriaIndex=6 },
        },
    },

    [13294] = {
        id       = 13294,
        name     = "Loremaster of Zandalar",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete storylines in Zuldazar, Nazmir, and Vol'dun.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    [13297] = {
        id       = 13297,
        name     = "Loremaster of Kul Tiras",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete storylines in Tiragarde Sound, Drustvar, and Stormsong Valley.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- SHADOWLANDS ZONES
    -- =========================================================================

    -- =========================================================================
    -- BASTION (mapID 1533)
    -- Level 50-60 zone
    -- =========================================================================

    [14303] = {
        id       = 14303,
        name     = "Explore Bastion",
        category = "Exploration",
        zone     = "Bastion",
        mapID    = 1533,
        steps = {
            { index=1,  desc="Discover Elysian Hold.",               npc=nil, coords={x=52.0,y=47.0}, mapID=1533, criteriaIndex=1  },
            { index=2,  desc="Discover Hero's Rest.",                npc=nil, coords={x=44.0,y=62.0}, mapID=1533, criteriaIndex=2  },
            { index=3,  desc="Discover Aspirant's Rest.",            npc=nil, coords={x=54.0,y=79.0}, mapID=1533, criteriaIndex=3  },
            { index=4,  desc="Discover The Eternal Forge.",          npc=nil, coords={x=49.0,y=40.0}, mapID=1533, criteriaIndex=4  },
            { index=5,  desc="Discover Purity's Pinnacle.",          npc=nil, coords={x=59.0,y=33.0}, mapID=1533, criteriaIndex=5  },
            { index=6,  desc="Discover Agthia's Repose.",            npc=nil, coords={x=72.0,y=26.0}, mapID=1533, criteriaIndex=6  },
            { index=7,  desc="Discover Temple of Courage.",          npc=nil, coords={x=58.0,y=42.0}, mapID=1533, criteriaIndex=7  },
            { index=8,  desc="Discover Temple of Purity.",           npc=nil, coords={x=64.0,y=74.0}, mapID=1533, criteriaIndex=8  },
            { index=9,  desc="Discover Firstborne's Bounty.",        npc=nil, coords={x=39.0,y=55.0}, mapID=1533, criteriaIndex=9  },
        },
    },

    [14281] = {
        id       = 14281,
        name     = "The Path to Ascension",
        category = "Quests",
        zone     = "Bastion",
        mapID    = 1533,
        steps = {
            { index=1, desc="Complete the Bastion storylines.",                  npc=nil, coords={x=52.0,y=47.0}, mapID=1533, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- MALDRAXXUS (mapID 1536)
    -- Level 50-60 zone
    -- =========================================================================

    [14305] = {
        id       = 14305,
        name     = "Explore Maldraxxus",
        category = "Exploration",
        zone     = "Maldraxxus",
        mapID    = 1536,
        steps = {
            { index=1,  desc="Discover Seat of the Primus.",         npc=nil, coords={x=51.0,y=45.0}, mapID=1536, criteriaIndex=1  },
            { index=2,  desc="Discover House of the Chosen.",        npc=nil, coords={x=48.0,y=54.0}, mapID=1536, criteriaIndex=2  },
            { index=3,  desc="Discover House of Constructs.",        npc=nil, coords={x=58.0,y=57.0}, mapID=1536, criteriaIndex=3  },
            { index=4,  desc="Discover House of Plagues.",           npc=nil, coords={x=59.0,y=72.0}, mapID=1536, criteriaIndex=4  },
            { index=5,  desc="Discover House of Eyes.",              npc=nil, coords={x=54.0,y=68.0}, mapID=1536, criteriaIndex=5  },
            { index=6,  desc="Discover House of Rituals.",           npc=nil, coords={x=34.0,y=55.0}, mapID=1536, criteriaIndex=6  },
            { index=7,  desc="Discover Theater of Pain.",            npc=nil, coords={x=50.0,y=50.0}, mapID=1536, criteriaIndex=7  },
            { index=8,  desc="Discover Blighted Scar.",              npc=nil, coords={x=66.0,y=37.0}, mapID=1536, criteriaIndex=8  },
            { index=9,  desc="Discover The Spearhead.",              npc=nil, coords={x=39.0,y=42.0}, mapID=1536, criteriaIndex=9  },
        },
    },

    [14206] = {
        id       = 14206,
        name     = "Blade of the Primus",
        category = "Quests",
        zone     = "Maldraxxus",
        mapID    = 1536,
        steps = {
            { index=1, desc="Complete the Maldraxxus storylines.",               npc=nil, coords={x=51.0,y=45.0}, mapID=1536, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- ARDENWEALD (mapID 1565)
    -- Level 50-60 zone
    -- =========================================================================

    [14304] = {
        id       = 14304,
        name     = "Explore Ardenweald",
        category = "Exploration",
        zone     = "Ardenweald",
        mapID    = 1565,
        steps = {
            { index=1,  desc="Discover Heart of the Forest.",        npc=nil, coords={x=59.0,y=53.0}, mapID=1565, criteriaIndex=1  },
            { index=2,  desc="Discover Glitterfall Basin.",          npc=nil, coords={x=56.0,y=28.0}, mapID=1565, criteriaIndex=2  },
            { index=3,  desc="Discover Tirna Scithe.",               npc=nil, coords={x=37.0,y=54.0}, mapID=1565, criteriaIndex=3  },
            { index=4,  desc="Discover Hibernal Hollow.",            npc=nil, coords={x=48.0,y=67.0}, mapID=1565, criteriaIndex=4  },
            { index=5,  desc="Discover Gossamer Cliffs.",            npc=nil, coords={x=30.0,y=33.0}, mapID=1565, criteriaIndex=5  },
            { index=6,  desc="Discover Dreamsong Fenn.",             npc=nil, coords={x=72.0,y=33.0}, mapID=1565, criteriaIndex=6  },
            { index=7,  desc="Discover Glutharn's Decay.",           npc=nil, coords={x=61.0,y=44.0}, mapID=1565, criteriaIndex=7  },
            { index=8,  desc="Discover Claw's Edge.",                npc=nil, coords={x=27.0,y=48.0}, mapID=1565, criteriaIndex=8  },
            { index=9,  desc="Discover Mistveil Tangle.",            npc=nil, coords={x=67.0,y=59.0}, mapID=1565, criteriaIndex=9  },
        },
    },

    [14164] = {
        id       = 14164,
        name     = "Awaken, Ardenweald",
        category = "Quests",
        zone     = "Ardenweald",
        mapID    = 1565,
        steps = {
            { index=1, desc="Complete the Ardenweald storylines.",               npc=nil, coords={x=59.0,y=53.0}, mapID=1565, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- REVENDRETH (mapID 1525)
    -- Level 50-60 zone
    -- =========================================================================

    [14306] = {
        id       = 14306,
        name     = "Explore Revendreth",
        category = "Exploration",
        zone     = "Revendreth",
        mapID    = 1525,
        steps = {
            { index=1,  desc="Discover Sinfall.",                    npc=nil, coords={x=51.0,y=76.0}, mapID=1525, criteriaIndex=1  },
            { index=2,  desc="Discover Darkhaven.",                  npc=nil, coords={x=60.0,y=63.0}, mapID=1525, criteriaIndex=2  },
            { index=3,  desc="Discover Halls of Atonement.",         npc=nil, coords={x=72.0,y=52.0}, mapID=1525, criteriaIndex=3  },
            { index=4,  desc="Discover Castle Nathria.",             npc=nil, coords={x=46.0,y=77.0}, mapID=1525, criteriaIndex=4  },
            { index=5,  desc="Discover The Ember Ward.",             npc=nil, coords={x=59.0,y=44.0}, mapID=1525, criteriaIndex=5  },
            { index=6,  desc="Discover The Banewood.",               npc=nil, coords={x=36.0,y=70.0}, mapID=1525, criteriaIndex=6  },
            { index=7,  desc="Discover Chalice District.",           npc=nil, coords={x=61.0,y=38.0}, mapID=1525, criteriaIndex=7  },
            { index=8,  desc="Discover The Endmire.",                npc=nil, coords={x=62.0,y=56.0}, mapID=1525, criteriaIndex=8  },
            { index=9,  desc="Discover Pridefall Hamlet.",           npc=nil, coords={x=64.0,y=69.0}, mapID=1525, criteriaIndex=9  },
        },
    },

    [13878] = {
        id       = 13878,
        name     = "The Master of Revendreth",
        category = "Quests",
        zone     = "Revendreth",
        mapID    = 1525,
        steps = {
            { index=1, desc="Complete the Revendreth storylines.",               npc=nil, coords={x=51.0,y=76.0}, mapID=1525, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- THE MAW (mapID 1543)
    -- Level 60 zone
    -- =========================================================================

    [14663] = {
        id       = 14663,
        name     = "Explore The Maw",
        category = "Exploration",
        zone     = "The Maw",
        mapID    = 1543,
        steps = {
            { index=1,  desc="Discover Perdition Hold.",             npc=nil, coords={x=39.0,y=40.0}, mapID=1543, criteriaIndex=1  },
            { index=2,  desc="Discover The Beastwarrens.",           npc=nil, coords={x=45.0,y=53.0}, mapID=1543, criteriaIndex=2  },
            { index=3,  desc="Discover Gorgoa: River of Souls.",     npc=nil, coords={x=28.0,y=28.0}, mapID=1543, criteriaIndex=3  },
            { index=4,  desc="Discover Tremaculum.",                 npc=nil, coords={x=57.0,y=48.0}, mapID=1543, criteriaIndex=4  },
            { index=5,  desc="Discover Zovaal's Cauldron.",          npc=nil, coords={x=37.0,y=62.0}, mapID=1543, criteriaIndex=5  },
            { index=6,  desc="Discover Desmotaeron.",                npc=nil, coords={x=52.0,y=76.0}, mapID=1543, criteriaIndex=6  },
        },
    },

    -- =========================================================================
    -- SHADOWLANDS META ACHIEVEMENTS
    -- =========================================================================

    [14758] = {
        id       = 14758,
        name     = "Shadowlands Explorer",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore Bastion.",                     npc=nil, coords={x=52.0,y=47.0}, mapID=1533, criteriaIndex=1 },
            { index=2, desc="Complete Explore Maldraxxus.",                  npc=nil, coords={x=51.0,y=45.0}, mapID=1536, criteriaIndex=2 },
            { index=3, desc="Complete Explore Ardenweald.",                  npc=nil, coords={x=59.0,y=53.0}, mapID=1565, criteriaIndex=3 },
            { index=4, desc="Complete Explore Revendreth.",                  npc=nil, coords={x=51.0,y=76.0}, mapID=1525, criteriaIndex=4 },
            { index=5, desc="Complete Explore The Maw.",                     npc=nil, coords={x=39.0,y=40.0}, mapID=1543, criteriaIndex=5 },
        },
    },

    [14280] = {
        id       = 14280,
        name     = "Loremaster of Shadowlands",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete storylines in Bastion, Maldraxxus, Ardenweald, and Revendreth.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

    -- =========================================================================
    -- DRAGON ISLES ZONES (Dragonflight)
    -- =========================================================================

    -- =========================================================================
    -- THE WAKING SHORES (mapID 2022)
    -- Level 60-70 zone
    -- =========================================================================

    [16400] = {
        id       = 16400,
        name     = "Explore the Waking Shores",
        category = "Exploration",
        zone     = "The Waking Shores",
        mapID    = 2022,
        steps = {
            { index=1,  desc="Discover Wingrest Embassy.",           npc=nil, coords={x=76.0,y=35.0}, mapID=2022, criteriaIndex=1  },
            { index=2,  desc="Discover Dragonheart Outpost.",        npc=nil, coords={x=69.0,y=46.0}, mapID=2022, criteriaIndex=2  },
            { index=3,  desc="Discover Ruby Life Pools.",            npc=nil, coords={x=54.0,y=66.0}, mapID=2022, criteriaIndex=3  },
            { index=4,  desc="Discover Life-Binder Conservatory.",   npc=nil, coords={x=62.0,y=58.0}, mapID=2022, criteriaIndex=4  },
            { index=5,  desc="Discover Obsidian Bulwark.",           npc=nil, coords={x=44.0,y=61.0}, mapID=2022, criteriaIndex=5  },
            { index=6,  desc="Discover The Seat of the Aspects.",    npc=nil, coords={x=53.0,y=38.0}, mapID=2022, criteriaIndex=6  },
            { index=7,  desc="Discover Apex Canopy.",                npc=nil, coords={x=23.0,y=61.0}, mapID=2022, criteriaIndex=7  },
            { index=8,  desc="Discover Flashfrost Enclave.",         npc=nil, coords={x=58.0,y=78.0}, mapID=2022, criteriaIndex=8  },
            { index=9,  desc="Discover Skytop Observatory.",         npc=nil, coords={x=75.0,y=57.0}, mapID=2022, criteriaIndex=9  },
            { index=10, desc="Discover Scalecracker Keep.",          npc=nil, coords={x=73.0,y=20.0}, mapID=2022, criteriaIndex=10 },
        },
    },

    [16334] = {
        id       = 16334,
        name     = "Waking Hope",
        category = "Quests",
        zone     = "The Waking Shores",
        mapID    = 2022,
        steps = {
            { index=1, desc="Complete the Waking Shores storylines.",            npc=nil, coords={x=76.0,y=35.0}, mapID=2022, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- OHN'AHRAN PLAINS (mapID 2023)
    -- Level 60-70 zone
    -- =========================================================================

    [16457] = {
        id       = 16457,
        name     = "Explore the Ohn'ahran Plains",
        category = "Exploration",
        zone     = "Ohn'ahran Plains",
        mapID    = 2023,
        steps = {
            { index=1,  desc="Discover Maruukai.",                   npc=nil, coords={x=61.0,y=40.0}, mapID=2023, criteriaIndex=1  },
            { index=2,  desc="Discover Shikaar Highlands.",          npc=nil, coords={x=81.0,y=37.0}, mapID=2023, criteriaIndex=2  },
            { index=3,  desc="Discover Ohn'ahra's Roost.",           npc=nil, coords={x=57.0,y=31.0}, mapID=2023, criteriaIndex=3  },
            { index=4,  desc="Discover The Eternal Kurgans.",        npc=nil, coords={x=47.0,y=46.0}, mapID=2023, criteriaIndex=4  },
            { index=5,  desc="Discover Rusza'thar Reach.",           npc=nil, coords={x=86.0,y=53.0}, mapID=2023, criteriaIndex=5  },
            { index=6,  desc="Discover Teerakai.",                   npc=nil, coords={x=42.0,y=56.0}, mapID=2023, criteriaIndex=6  },
            { index=7,  desc="Discover Timberstep Outpost.",         npc=nil, coords={x=76.0,y=63.0}, mapID=2023, criteriaIndex=7  },
            { index=8,  desc="Discover Nokhudon Hold.",              npc=nil, coords={x=30.0,y=40.0}, mapID=2023, criteriaIndex=8  },
            { index=9,  desc="Discover Windsong Rise.",              npc=nil, coords={x=77.0,y=23.0}, mapID=2023, criteriaIndex=9  },
            { index=10, desc="Discover Emerald Gardens.",            npc=nil, coords={x=30.0,y=60.0}, mapID=2023, criteriaIndex=10 },
        },
    },

    [16405] = {
        id       = 16405,
        name     = "Sojourner of Ohn'ahran Plains",
        category = "Quests",
        zone     = "Ohn'ahran Plains",
        mapID    = 2023,
        steps = {
            { index=1, desc="Complete the Ohn'ahran Plains storylines.",         npc=nil, coords={x=61.0,y=40.0}, mapID=2023, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- THE AZURE SPAN (mapID 2024)
    -- Level 60-70 zone
    -- =========================================================================

    [16460] = {
        id       = 16460,
        name     = "Explore the Azure Span",
        category = "Exploration",
        zone     = "The Azure Span",
        mapID    = 2024,
        steps = {
            { index=1,  desc="Discover Iskaara.",                    npc=nil, coords={x=13.0,y=49.0}, mapID=2024, criteriaIndex=1  },
            { index=2,  desc="Discover Theron's Watch.",             npc=nil, coords={x=64.0,y=25.0}, mapID=2024, criteriaIndex=2  },
            { index=3,  desc="Discover Azure Archives.",             npc=nil, coords={x=39.0,y=63.0}, mapID=2024, criteriaIndex=3  },
            { index=4,  desc="Discover Cobalt Assembly.",            npc=nil, coords={x=49.0,y=23.0}, mapID=2024, criteriaIndex=4  },
            { index=5,  desc="Discover Camp Nowhere.",               npc=nil, coords={x=63.0,y=48.0}, mapID=2024, criteriaIndex=5  },
            { index=6,  desc="Discover Three-Falls Lookout.",        npc=nil, coords={x=19.0,y=24.0}, mapID=2024, criteriaIndex=6  },
            { index=7,  desc="Discover Rustpine Den.",               npc=nil, coords={x=27.0,y=48.0}, mapID=2024, criteriaIndex=7  },
            { index=8,  desc="Discover Vakthros.",                   npc=nil, coords={x=74.0,y=39.0}, mapID=2024, criteriaIndex=8  },
            { index=9,  desc="Discover The Fallen Course.",          npc=nil, coords={x=55.0,y=30.0}, mapID=2024, criteriaIndex=9  },
            { index=10, desc="Discover Brackenhide Hollow.",         npc=nil, coords={x=11.0,y=36.0}, mapID=2024, criteriaIndex=10 },
        },
    },

    [16428] = {
        id       = 16428,
        name     = "Sojourner of Azure Span",
        category = "Quests",
        zone     = "The Azure Span",
        mapID    = 2024,
        steps = {
            { index=1, desc="Complete the Azure Span storylines.",               npc=nil, coords={x=13.0,y=49.0}, mapID=2024, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- THALDRASZUS (mapID 2025)
    -- Level 60-70 zone
    -- =========================================================================

    [16518] = {
        id       = 16518,
        name     = "Explore Thaldraszus",
        category = "Exploration",
        zone     = "Thaldraszus",
        mapID    = 2025,
        steps = {
            { index=1,  desc="Discover Valdrakken.",                 npc=nil, coords={x=61.0,y=59.0}, mapID=2025, criteriaIndex=1  },
            { index=2,  desc="Discover Algeth'ar Academy.",          npc=nil, coords={x=62.0,y=41.0}, mapID=2025, criteriaIndex=2  },
            { index=3,  desc="Discover Temporal Conflux.",           npc=nil, coords={x=52.0,y=79.0}, mapID=2025, criteriaIndex=3  },
            { index=4,  desc="Discover Gelikyr Overlook.",           npc=nil, coords={x=52.0,y=69.0}, mapID=2025, criteriaIndex=4  },
            { index=5,  desc="Discover Vault of the Incarnates.",    npc=nil, coords={x=72.0,y=56.0}, mapID=2025, criteriaIndex=5  },
            { index=6,  desc="Discover Tyrhold.",                    npc=nil, coords={x=61.0,y=58.0}, mapID=2025, criteriaIndex=6  },
            { index=7,  desc="Discover Veiled Ossuary.",             npc=nil, coords={x=65.0,y=57.0}, mapID=2025, criteriaIndex=7  },
            { index=8,  desc="Discover South Hold Gate.",            npc=nil, coords={x=35.0,y=85.0}, mapID=2025, criteriaIndex=8  },
            { index=9,  desc="Discover Passage of Time.",            npc=nil, coords={x=57.0,y=78.0}, mapID=2025, criteriaIndex=9  },
        },
    },

    [16363] = {
        id       = 16363,
        name     = "Just Don't Ask Me to Spell It",
        category = "Quests",
        zone     = "Thaldraszus",
        mapID    = 2025,
        steps = {
            { index=1, desc="Complete the Thaldraszus storylines.",              npc=nil, coords={x=61.0,y=59.0}, mapID=2025, criteriaIndex=1 },
        },
    },

    -- =========================================================================
    -- ZARALEK CAVERN (mapID 2133)
    -- Level 70 zone (Patch 10.1 content)
    -- =========================================================================

    [17766] = {
        id       = 17766,
        name     = "Explore Zaralek Cavern",
        category = "Exploration",
        zone     = "Zaralek Cavern",
        mapID    = 2133,
        steps = {
            { index=1,  desc="Discover Loamm.",                      npc=nil, coords={x=56.0,y=56.0}, mapID=2133, criteriaIndex=1  },
            { index=2,  desc="Discover The Throughway.",             npc=nil, coords={x=62.0,y=52.0}, mapID=2133, criteriaIndex=2  },
            { index=3,  desc="Discover Aberrus Approach.",           npc=nil, coords={x=47.0,y=24.0}, mapID=2133, criteriaIndex=3  },
            { index=4,  desc="Discover Glimmerogg.",                 npc=nil, coords={x=43.0,y=82.0}, mapID=2133, criteriaIndex=4  },
            { index=5,  desc="Discover Nal ks'kol.",                 npc=nil, coords={x=62.0,y=70.0}, mapID=2133, criteriaIndex=5  },
            { index=6,  desc="Discover Acidbite Ravine.",            npc=nil, coords={x=47.0,y=50.0}, mapID=2133, criteriaIndex=6  },
            { index=7,  desc="Discover Slitherdrake Roost.",         npc=nil, coords={x=29.0,y=46.0}, mapID=2133, criteriaIndex=7  },
        },
    },

    -- =========================================================================
    -- DRAGONFLIGHT META ACHIEVEMENTS
    -- =========================================================================

    [16761] = {
        id       = 16761,
        name     = "Dragon Isles Explorer",
        category = "Exploration",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            { index=1, desc="Complete Explore the Waking Shores.",           npc=nil, coords={x=76.0,y=35.0}, mapID=2022, criteriaIndex=1 },
            { index=2, desc="Complete Explore the Ohn'ahran Plains.",        npc=nil, coords={x=61.0,y=40.0}, mapID=2023, criteriaIndex=2 },
            { index=3, desc="Complete Explore the Azure Span.",              npc=nil, coords={x=13.0,y=49.0}, mapID=2024, criteriaIndex=3 },
            { index=4, desc="Complete Explore Thaldraszus.",                 npc=nil, coords={x=61.0,y=59.0}, mapID=2025, criteriaIndex=4 },
        },
    },

    [16585] = {
        id       = 16585,
        name     = "Loremaster of the Dragon Isles",
        category = "Quests",
        zone     = "Multiple Zones",
        mapID    = nil,
        steps = {
            {
                index         = 1,
                desc          = "Complete storylines in the Waking Shores, Ohn'ahran Plains, Azure Span, and Thaldraszus.",
                npc           = nil,
                coords        = nil,
                mapID         = nil,
                criteriaIndex = nil,
            },
        },
    },

}

-- Zone → achievement ID list, populated at load time in AchievementData.lua
GP.Data.ByZone = {}
