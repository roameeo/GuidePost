-- .luacheckrc
-- Tells luacheck which globals are provided by the WoW client and our addon,
-- so it stops flagging them as "undefined variable" warnings.

-- Target Lua 5.1 (the version WoW's engine runs)
std = "lua51"

-- Ignore some noisy warnings that are common in WoW addon code:
--   211 = unused variable
--   212 = unused argument
--   213 = unused loop variable
ignore = { "211", "212", "213" }

-- ── Our addon's own global namespace ─────────────────────────────────────────
globals = {
    "GuidePostNS",
    "GuidePostDB",
    "GuidePostCharDB",
}

-- ── WoW Client globals ────────────────────────────────────────────────────────
-- These are provided by the game engine at runtime.
read_globals = {
    -- Frame / UI factory
    "CreateFrame",
    "UIParent",
    "GetScreenWidth",
    "GetScreenHeight",

    -- Tooltip
    "GameTooltip",

    -- Unit / player info
    "UnitName",
    "GetZoneText",

    -- Achievement API
    "GetAchievementInfo",
    "GetAchievementCriteriaInfoByID",

    -- Slash commands
    "SlashCmdList",
    "SLASH_GUIDEPOST1",
    "SLASH_GUIDEPOST2",

    -- Saved variables (injected by WoW before PLAYER_LOGIN)
    "GuidePostDB",
    "GuidePostCharDB",

    -- Fonts & templates (referenced by name string, not as globals,
    -- but luacheck still flags the template strings sometimes)
    "GameFontNormal",
    "GameFontNormalSmall",
    "GameFontHighlight",
    "GameFontHighlightSmall",

    -- TomTom (external addon dependency)
    "TomTom",

    -- Minimap
    "Minimap",

    -- Misc WoW globals
    "print",
    "pairs",
    "ipairs",
    "tonumber",
    "tostring",
    "math",
    "string",
    "table",
}
