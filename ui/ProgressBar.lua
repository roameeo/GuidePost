-- =============================================================================
-- GuidePost: ui/ProgressBar.lua
-- =============================================================================
-- A reusable progress-bar widget.  Call ProgressBar.New(parent) to create one,
-- then bar:SetProgress(0-100) to update it.
-- =============================================================================

local GP = GuidePostNS

GP.UI = GP.UI or {}
GP.UI.ProgressBar = {}
local PB = GP.UI.ProgressBar

-- ─── Constructor ─────────────────────────────────────────────────────────────

-- Creates and returns a new progress bar attached to `parent`.
-- width / height are optional (defaults: 200 x 16)
function PB.New(parent, width, height)
    width  = width  or 200
    height = height or 16

    -- Outer container (background track)
    local container = CreateFrame("Frame", nil, parent)
    container:SetSize(width, height)

    local bg = container:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.8)  -- dark grey background

    -- Border
    local border = container:CreateTexture(nil, "BORDER")
    border:SetPoint("TOPLEFT",     -1,  1)
    border:SetPoint("BOTTOMRIGHT",  1, -1)
    border:SetColorTexture(0.3, 0.3, 0.3, 1)

    -- Filled bar (starts at zero width)
    local fill = container:CreateTexture(nil, "ARTWORK")
    fill:SetPoint("TOPLEFT",    1, -1)
    fill:SetPoint("BOTTOMLEFT", 1,  1)
    fill:SetWidth(1)   -- minimum 1 px so it doesn't error
    fill:SetColorTexture(0.0, 0.8, 0.2, 1)  -- green fill

    -- Percentage label in the centre
    local label = container:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetPoint("CENTER")
    label:SetText("0%")

    -- ── Methods ──────────────────────────────────────────────────────────────

    -- percent: 0-100 integer
    function container:SetProgress(percent)
        percent = math.max(0, math.min(100, percent or 0))
        local fillWidth = math.max(1, math.floor((width - 2) * percent / 100))
        fill:SetWidth(fillWidth)
        label:SetText(percent .. "%")

        -- Colour shifts: red → yellow → green
        if percent < 33 then
            fill:SetColorTexture(0.8, 0.1, 0.1, 1)
        elseif percent < 66 then
            fill:SetColorTexture(0.9, 0.7, 0.0, 1)
        else
            fill:SetColorTexture(0.0, 0.8, 0.2, 1)
        end
    end

    function container:SetLabel(text)
        label:SetText(text)
    end

    return container
end
