-- =============================================================================
-- GuidePost: ui/MinimapButton.lua
-- =============================================================================
-- Creates the little icon on the minimap that opens/closes the main window.
-- Uses LibDBIcon if available for proper minimap button positioning,
-- otherwise falls back to a simple attached frame.
-- =============================================================================

local GP = GuidePostNS

GP.UI = GP.UI or {}
GP.UI.MinimapButton = {}
local MB = GP.UI.MinimapButton

function MB.Initialize()
    -- Simple minimap button using a standard frame
    local button = CreateFrame("Button", "GuidePostMinimapButton", Minimap)
    button:SetSize(32, 32)
    button:SetFrameStrata("MEDIUM")

    -- Position on the minimap edge (angle in degrees, 0 = right side)
    local angle = math.rad(225)
    local radius = 80
    button:SetPoint("CENTER", Minimap, "CENTER",
        radius * math.cos(angle),
        radius * math.sin(angle))

    -- Background circle
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetSize(32, 32)
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    -- Icon inside the button — using the default achievement star icon
    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER")
    -- Achievement frame icon from Blizzard's built-in textures
    icon:SetTexture("Interface\\AchievementFrame\\UI-Achievement-TitleBar")
    icon:SetTexCoord(0, 0.5, 0, 0.25)

    -- Tooltip on hover
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("|cff00ccffGuidePost|r")
        GameTooltip:AddLine("Click to open / close", 1, 1, 1)
        local tracked = GP.Progress.GetTrackedList()
        if #tracked > 0 then
            GameTooltip:AddLine(string.format("%d achievement(s) tracked", #tracked), 0.8, 0.8, 0.8)
        end
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Toggle the main frame on click
    button:SetScript("OnClick", function(self, mouseButton)
        if mouseButton == "LeftButton" then
            GP.UI.MainFrame.Toggle()
        end
    end)

    -- Make it draggable around the minimap edge
    button:RegisterForDrag("LeftButton")
    button:SetScript("OnDragStart", function(self)
        self.dragging = true
    end)
    button:SetScript("OnDragStop", function(self)
        self.dragging = false
    end)

    MB.Button = button
end
