-- =============================================================================
-- GuidePost: ui/SettingsFrame.lua
-- =============================================================================
-- Settings panel. Opened via the gear button in the main frame title bar
-- or via /gp settings.
--
-- Settings stored in GuidePostDB.settings:
--   scope    = "account" | "character" | "guild"
--   autoScan = true | false
-- =============================================================================

local GP = select(2, ...)

GP.UI         = GP.UI or {}
GP.UI.Settings = {}
local S = GP.UI.Settings

-- ─── Defaults ────────────────────────────────────────────────────────────────

local DEFAULTS = {
    scope    = "account",
    autoScan = false,
}

function S.GetSettings()
    GuidePostDB          = GuidePostDB or {}
    GuidePostDB.settings = GuidePostDB.settings or {}
    local s = GuidePostDB.settings
    for k, v in pairs(DEFAULTS) do
        if s[k] == nil then s[k] = v end
    end
    return s
end

function S.Get(key)
    return S.GetSettings()[key]
end

function S.Set(key, value)
    S.GetSettings()[key] = value
end

-- ─── Frame Construction ───────────────────────────────────────────────────────

local function CreateSettingsFrame()
    local f = CreateFrame("Frame", "GuidePostSettingsFrame", UIParent,
                          "BasicFrameTemplateWithInset")
    f:SetSize(310, 240)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop",  f.StopMovingOrSizing)
    f:Hide()

    f.TitleText:SetText("|cff00ccffGuidePost|r  ·  Settings")
    f.CloseButton:SetScript("OnClick", function() f:Hide() end)

    local y = -35  -- running Y offset from top

    -- ── Section: Achievement Scope ────────────────────────────────────────────
    local scopeHeader = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scopeHeader:SetPoint("TOPLEFT", 15, y)
    scopeHeader:SetText("Achievement Scope")
    y = y - 18

    local scopeDesc = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    scopeDesc:SetPoint("TOPLEFT", 15, y)
    scopeDesc:SetTextColor(0.65, 0.65, 0.65)
    scopeDesc:SetText("Controls which achievements are shown in the list.")
    y = y - 22

    local SCOPES = {
        { value = "account",   label = "Account (Warband)",
          tip = "Show all achievements shared across your entire account." },
        { value = "character", label = "Character",
          tip = "Show only achievements that have in-progress criteria or are\ntracked on this character." },
        { value = "guild",     label = "Guild (Coming Soon)",
          tip = "Show guild achievements. (Requires guild achievements in the\ndatabase — coming in a future update.)" },
    }

    local radioGroup = {}

    local function SetScope(value)
        S.Set("scope", value)
        for _, rb in ipairs(radioGroup) do
            rb:SetChecked(rb.gpValue == value)
        end
        -- Refresh the main list if it's open
        if GP.UI.MainFrame and GP.UI.MainFrame.Frame
                and GP.UI.MainFrame.Frame:IsShown() then
            GP.UI.MainFrame.RefreshList()
        end
    end

    for _, scope in ipairs(SCOPES) do
        local radio = CreateFrame("CheckButton", nil, f, "UIRadioButtonTemplate")
        radio:SetPoint("TOPLEFT", 20, y)
        radio:SetSize(20, 20)
        radio.gpValue = scope.value
        radio:SetEnabled(scope.value ~= "guild")
        radio:SetChecked(S.Get("scope") == scope.value)
        radio:SetScript("OnClick", function() SetScope(scope.value) end)
        radio:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(scope.tip, 1, 1, 1, 1)
            GameTooltip:Show()
        end)
        radio:SetScript("OnLeave", function() GameTooltip:Hide() end)

        local lbl = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        lbl:SetPoint("LEFT", radio, "RIGHT", 4, 0)
        lbl:SetText(scope.label)
        if scope.value == "guild" then lbl:SetTextColor(0.65, 0.65, 0.65) end

        table.insert(radioGroup, radio)
        y = y - 22
    end

    f.RadioGroup = radioGroup

    -- Separator
    y = y - 6
    local sep = f:CreateTexture(nil, "ARTWORK")
    sep:SetSize(280, 1)
    sep:SetPoint("TOPLEFT", 15, y)
    sep:SetColorTexture(0.3, 0.3, 0.3, 0.8)
    y = y - 12

    -- ── Section: Automation ───────────────────────────────────────────────────
    local autoHeader = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    autoHeader:SetPoint("TOPLEFT", 15, y)
    autoHeader:SetText("Automation")
    y = y - 20

    local autoCheck = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    autoCheck:SetPoint("TOPLEFT", 14, y)
    autoCheck:SetSize(24, 24)
    autoCheck:SetChecked(S.Get("autoScan"))
    autoCheck:SetScript("OnClick", function(self)
        S.Set("autoScan", self:GetChecked() and true or false)
    end)
    autoCheck:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Auto-Scan on Zone Change", 1, 1, 1)
        GameTooltip:AddLine("Automatically run /gp scan when you enter a new\nzone and print matching achievements to chat.", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    autoCheck:SetScript("OnLeave", function() GameTooltip:Hide() end)
    f.AutoScanCheck = autoCheck

    local autoLabel = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    autoLabel:SetPoint("LEFT", autoCheck, "RIGHT", 2, 0)
    autoLabel:SetText("Auto-scan when entering a new zone")

    S.Frame = f
end

-- ─── Public API ──────────────────────────────────────────────────────────────

function S.Initialize()
    CreateSettingsFrame()
end

function S.Toggle()
    if not S.Frame then return end
    if S.Frame:IsShown() then
        S.Frame:Hide()
    else
        -- Refresh radio state from DB in case it changed externally
        local current = S.Get("scope")
        for _, rb in ipairs(S.Frame.RadioGroup) do
            rb:SetChecked(rb.gpValue == current)
        end
        S.Frame.AutoScanCheck:SetChecked(S.Get("autoScan"))
        S.Frame:Show()
    end
end
