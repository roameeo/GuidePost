-- =============================================================================
-- GuidePost: ui/MinimapButton.lua
-- =============================================================================
-- Creates the minimap button that opens/closes the main window.
-- The button snaps to the outside edge of the minimap and can be dragged
-- around the full 360 degrees. Its angle is saved between sessions.
-- =============================================================================

local GP = GuidePostNS

GP.UI = GP.UI or {}
GP.UI.MinimapButton = {}
local MB = GP.UI.MinimapButton

-- Calculate the radius needed to place the button on the outer edge.
-- We derive it from the minimap's actual rendered width at call time,
-- so it stays correct after the player resizes the minimap in Edit Mode.
local function GetMinimapRadius()
    -- Minimap:GetWidth() returns the current size including any Edit Mode scaling.
    -- We add 10px so the button sits just outside the border, not on top of it.
    return (Minimap:GetWidth() / 2) + 10
end

-- Default angle in degrees (225 = bottom-left)
local DEFAULT_ANGLE = 225

-- Reposition the button at a given angle (degrees, 0 = right, goes counter-clockwise)
local function SetButtonAngle(button, degrees)
    local rad    = math.rad(degrees)
    local radius = GetMinimapRadius()
    button:ClearAllPoints()
    button:SetPoint("CENTER", Minimap, "CENTER",
        radius * math.cos(rad),
        radius * math.sin(rad))
end

-- Work out the angle in degrees from the minimap center to the cursor
local function GetCursorAngle()
    local cx, cy = Minimap:GetCenter()
    local mx, my = GetCursorPosition()
    -- GetCursorPosition returns raw screen coords; divide by UIParent scale
    local scale  = UIParent:GetEffectiveScale()
    mx, my = mx / scale, my / scale
    return math.deg(math.atan2(my - cy, mx - cx))
end

function MB.Initialize()
    local button = CreateFrame("Button", "GuidePostMinimapButton", Minimap)
    button:SetSize(32, 32)
    button:SetFrameStrata("MEDIUM")
    button:SetClampedToScreen(false)  -- we handle clamping ourselves via angle

    -- ── Textures ─────────────────────────────────────────────────────────────

    -- Circular border that blends with other minimap buttons
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetSize(32, 32)
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    -- Custom GuidePost icon
    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("CENTER")
    icon:SetTexture("Interface\\AddOns\\GuidePost\\Media\\icon.png")
    icon:SetTexCoord(0, 1, 0, 1)

    -- Highlight ring on hover
    local hl = button:CreateTexture(nil, "HIGHLIGHT")
    hl:SetSize(32, 32)
    hl:SetAllPoints()
    hl:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    hl:SetVertexColor(1, 1, 0.5, 0.6)

    -- ── Initial position (restore saved angle or use default) ─────────────────
    local savedAngle = (GuidePostDB and GuidePostDB.minimapAngle) or DEFAULT_ANGLE
    SetButtonAngle(button, savedAngle)
    button.angle = savedAngle

    -- ── Drag: orbit around the minimap edge ───────────────────────────────────
    button:RegisterForDrag("LeftButton")

    button:SetScript("OnDragStart", function(self)
        self.dragging = true
        -- Update position every frame while dragging
        self:SetScript("OnUpdate", function()
            local newAngle = GetCursorAngle()
            SetButtonAngle(self, newAngle)
            self.angle = newAngle
        end)
    end)

    button:SetScript("OnDragStop", function(self)
        self.dragging = false
        self:SetScript("OnUpdate", nil)
        -- Save the final angle so it persists across sessions
        if GuidePostDB then
            GuidePostDB.minimapAngle = self.angle
        end
    end)

    -- ── Tooltip ───────────────────────────────────────────────────────────────
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ccffGuidePost|r")
        GameTooltip:AddLine("Click to open / close", 1, 1, 1)
        GameTooltip:AddLine("Drag to reposition", 0.6, 0.6, 0.6)
        local tracked = GP.Progress.GetTrackedList()
        if #tracked > 0 then
            GameTooltip:AddLine(
                string.format("%d achievement(s) tracked", #tracked), 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- ── Click ─────────────────────────────────────────────────────────────────
    button:SetScript("OnClick", function(self, mouseButton)
        if mouseButton == "LeftButton" and not self.dragging then
            GP.UI.MainFrame.Toggle()
        end
    end)

    MB.Button = button

    -- Reposition whenever the minimap is resized (Edit Mode scaling)
    Minimap:HookScript("OnSizeChanged", function()
        SetButtonAngle(button, button.angle or DEFAULT_ANGLE)
    end)
end
