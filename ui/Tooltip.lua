-- =============================================================================
-- GuidePost: ui/Tooltip.lua
-- =============================================================================
-- Hooks into the standard GameTooltip to add achievement hints when the player
-- hovers over NPCs or items that are linked to tracked achievements.
-- =============================================================================

local GP = select(2, ...)

GP.UI = GP.UI or {}
GP.UI.Tooltip = {}

-- Build a reverse-lookup: npcName → { achievementID, stepIndex }
-- so we can quickly check if a hovered unit matches any achievement step.
local npcIndex = {}

local function BuildNPCIndex()
    for id, ach in pairs(GP.Data.Achievements) do
        for _, step in ipairs(ach.steps) do
            if step.npc then
                local key = step.npc:lower()
                npcIndex[key] = npcIndex[key] or {}
                table.insert(npcIndex[key], { achID = id, step = step })
            end
        end
    end
end

-- Hook the tooltip shown when hovering a unit (NPC, player, etc.)
local function HookTooltip()
    GameTooltip:HookScript("OnTooltipSetUnit", function(self)
        local _, unit = self:GetUnit()
        if not unit then return end

        local name = UnitName(unit)
        if not name then return end

        local matches = npcIndex[name:lower()]
        if not matches then return end

        self:AddLine(" ")  -- spacer
        self:AddLine("|cff00ccff[GuidePost]|r")

        for _, match in ipairs(matches) do
            local ach = GP.Data.Achievements[match.achID]
            if ach and not GP.IsAchievementCompleted(match.achID) then
                self:AddLine(string.format("  • %s - Step %d", ach.name, match.step.index),
                    0.9, 0.9, 0.2)
            end
        end
    end)
end

-- Called during addon load (from Events.lua PLAYER_LOGIN handler)
function GP.UI.Tooltip.Initialize()
    BuildNPCIndex()
    HookTooltip()
end
