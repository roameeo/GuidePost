-- =============================================================================
-- GuidePost: ui/MainFrame.lua
-- =============================================================================
-- The primary UI window.  Shows:
--   • A list of tracked (and zone-suggested) achievements
--   • Per-achievement progress bar
--   • Step-by-step guidance for the selected achievement
--   • "Set Waypoint" button per step
-- =============================================================================

local GP = GuidePostNS

GP.UI = GP.UI or {}
GP.UI.MainFrame = {}
local MF = GP.UI.MainFrame

-- The ID of the achievement currently selected in the list (nil = none)
MF.SelectedID = nil

-- ─── Frame Creation ──────────────────────────────────────────────────────────

-- ─── Layout constants (panels recompute from these on resize) ────────────────
local LIST_WIDTH   = 175   -- fixed width of the left list panel
local PANEL_GAP    =   8   -- gap between list and detail panels
local MARGIN_L     =  10   -- left margin from frame edge
local MARGIN_R     =  10   -- right margin from frame edge
local MARGIN_TOP   =  30   -- top margin (below title bar)
local MARGIN_BOT   =  24   -- bottom margin (above zone label / resize grip)
local MIN_W        = 380   -- minimum frame width
local MIN_H        = 300   -- minimum frame height

-- Recompute panel sizes whenever the frame is resized
local function LayoutPanels(f)
    local fw = f:GetWidth()
    local fh = f:GetHeight()

    local panelH     = fh - MARGIN_TOP - MARGIN_BOT
    local detailW    = fw - MARGIN_L - LIST_WIDTH - PANEL_GAP - MARGIN_R

    f.ListPanel:SetSize(LIST_WIDTH, panelH)
    f.DetailPanel:SetSize(math.max(detailW, 60), panelH)

    -- Reflow the progress bar to match detail panel width
    if f.ProgressBar then
        f.ProgressBar:SetWidth(math.max(detailW - 20, 40))
    end
end

local function CreateMainFrame()
    -- Root window
    local f = CreateFrame("Frame", "GuidePostFrame", UIParent,
                          "BasicFrameTemplateWithInset")
    f:SetSize(460, 520)
    f:SetPoint("CENTER")

    -- ── Moveable ──────────────────────────────────────────────────────────────
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop",  function(self)
        self:StopMovingOrSizing()
        -- Snap position into screen bounds so it can't be dragged off-screen
        local x, y = self:GetLeft(), self:GetTop()
        local sw, sh = GetScreenWidth(), GetScreenHeight()
        x = math.max(0, math.min(x, sw - self:GetWidth()))
        y = math.min(sh, math.max(y, self:GetHeight()))
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
        -- Persist position so it survives /reload and relog
        local db = GuidePostDB
        if db then db.windowX = x; db.windowY = y end
    end)

    -- ── Resizeable ────────────────────────────────────────────────────────────
    f:SetResizable(true)
    f:SetResizeBounds(MIN_W, MIN_H, 900, 800)

    -- Resize grip in the bottom-right corner
    local grip = CreateFrame("Button", nil, f)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", -2, 2)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:SetScript("OnMouseDown", function() f:StartSizing("BOTTOMRIGHT") end)
    grip:SetScript("OnMouseUp",   function()
        f:StopMovingOrSizing()
        LayoutPanels(f)
        -- Refresh step detail widths if an achievement is selected
        if MF.SelectedID then MF.SelectAchievement(MF.SelectedID) end
    end)

    -- Also reflow continuously while dragging so panels follow the edge
    f:SetScript("OnSizeChanged", function(self)
        LayoutPanels(self)
    end)

    f:Hide()   -- hidden by default; opened via minimap button or /ag

    -- Title text
    f.TitleText:SetText("|cff00ccffGuidePost|r")

    -- Close button — save position+size before hiding
    f.CloseButton:SetScript("OnClick", function()
        local db = GuidePostDB
        if db then
            db.windowX = f:GetLeft()
            db.windowY = f:GetTop()
            db.windowW = f:GetWidth()
            db.windowH = f:GetHeight()
        end
        f:Hide()
    end)

    -- ── Left panel: achievement list ─────────────────────────────────────────
    local listPanel = CreateFrame("Frame", nil, f, "InsetFrameTemplate")
    listPanel:SetSize(LIST_WIDTH, 420)
    listPanel:SetPoint("TOPLEFT", f, "TOPLEFT", MARGIN_L, -MARGIN_TOP)
    f.ListPanel = listPanel

    local listLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    listLabel:SetPoint("TOPLEFT", 5, -5)
    listLabel:SetText("|cffaaaaaaAchievements|r")

    -- ScrollFrame for the list
    local scroll = CreateFrame("ScrollFrame", nil, listPanel, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT",     5, -20)
    scroll:SetPoint("BOTTOMRIGHT", -25, 5)

    local listContent = CreateFrame("Frame", nil, scroll)
    listContent:SetSize(145, 1)
    scroll:SetScrollChild(listContent)

    f.ListContent = listContent

    -- ── Right panel: step details ─────────────────────────────────────────────
    local detailPanel = CreateFrame("Frame", nil, f, "InsetFrameTemplate")
    detailPanel:SetSize(255, 420)
    detailPanel:SetPoint("TOPLEFT", listPanel, "TOPRIGHT", PANEL_GAP, 0)
    f.DetailPanel = detailPanel

    -- Achievement name at top of detail panel
    -- SetPoint to TOPRIGHT so it stretches as the panel widens
    local achName = detailPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    achName:SetPoint("TOPLEFT",  8, -8)
    achName:SetPoint("TOPRIGHT", detailPanel, "TOPRIGHT", -8, -8)
    achName:SetJustifyH("LEFT")
    achName:SetWordWrap(true)
    achName:SetText("Select an achievement")
    f.AchName = achName

    -- Progress bar below the name — anchored left and right so it fills the panel
    local bar = GP.UI.ProgressBar.New(detailPanel, 235, 14)
    bar:SetPoint("TOPLEFT",  achName, "BOTTOMLEFT",  0, -6)
    bar:SetPoint("TOPRIGHT", detailPanel, "TOPRIGHT", -8, -(achName:GetHeight() + 14))
    bar:SetProgress(0)
    f.ProgressBar = bar

    -- Steps scroll area
    local stepsScroll = CreateFrame("ScrollFrame", nil, detailPanel, "UIPanelScrollFrameTemplate")
    stepsScroll:SetPoint("TOPLEFT",     8, -70)
    stepsScroll:SetPoint("BOTTOMRIGHT", -25, 5)

    local stepsContent = CreateFrame("Frame", nil, stepsScroll)
    stepsContent:SetSize(215, 1)
    stepsScroll:SetScrollChild(stepsContent)
    f.StepsContent = stepsContent

    -- ── Bottom bar: zone suggestions label ───────────────────────────────────
    local zoneLabel = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    zoneLabel:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 14, 8)
    zoneLabel:SetText("")
    f.ZoneLabel = zoneLabel

    return f
end

-- ─── List Population ─────────────────────────────────────────────────────────

local function MakeListButton(parent, id, yOffset)
    local ach = GP.Data.Achievements[id]
    if not ach then return end

    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(140, 34)
    btn:SetPoint("TOPLEFT", 0, -yOffset)

    -- Background highlight
    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.15, 0.15, 0.15, 0.6)

    local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    nameText:SetPoint("TOPLEFT", 4, -4)
    nameText:SetWidth(132)
    nameText:SetWordWrap(true)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(ach.name)

    -- Tiny progress fraction
    local done, total = GP.AchievementData.GetCriteriaProgress(id)
    if total > 0 then
        local prog = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        prog:SetPoint("BOTTOMRIGHT", -4, 4)
        prog:SetText(string.format("|cffaaaaaa%d/%d|r", done, total))
    end

    -- Selected highlight
    btn:SetScript("OnEnter", function(self)
        bg:SetColorTexture(0.25, 0.25, 0.45, 0.8)
    end)
    btn:SetScript("OnLeave", function(self)
        if MF.SelectedID == id then
            bg:SetColorTexture(0.2, 0.4, 0.6, 0.8)
        else
            bg:SetColorTexture(0.15, 0.15, 0.15, 0.6)
        end
    end)

    btn:SetScript("OnClick", function()
        MF.SelectAchievement(id)
        -- Re-colour all buttons (deselect old, select new)
        for _, child in ipairs({parent:GetChildren()}) do
            child:GetScript("OnLeave")(child)  -- reset colour
        end
        bg:SetColorTexture(0.2, 0.4, 0.6, 0.8)
    end)

    return btn
end

local function PopulateList(frame)
    -- Clear existing buttons
    for _, child in ipairs({frame.ListContent:GetChildren()}) do
        child:Hide()
        child:SetParent(nil)
    end

    local yOff = 0
    local totalHeight = 0

    -- Tracked achievements first
    local tracked = GP.Progress.GetTrackedList()
    if #tracked > 0 then
        local header = frame.ListContent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        header:SetPoint("TOPLEFT", 0, -yOff)
        header:SetText("|cff00ff88Tracked|r")
        yOff = yOff + 16

        for _, id in ipairs(tracked) do
            MakeListButton(frame.ListContent, id, yOff)
            yOff = yOff + 36
        end
    end

    -- Zone suggestions
    local suggestions = GP.AchievementData.CurrentZoneSuggestions
    if #suggestions > 0 then
        local header = frame.ListContent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        header:SetPoint("TOPLEFT", 0, -yOff)
        header:SetText("|cffffcc00In This Zone|r")
        yOff = yOff + 16

        for _, id in ipairs(suggestions) do
            MakeListButton(frame.ListContent, id, yOff)
            yOff = yOff + 36
        end
    end

    -- All others
    local header2 = frame.ListContent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    header2:SetPoint("TOPLEFT", 0, -yOff)
    header2:SetText("|cffaaaaaaAll|r")
    yOff = yOff + 16

    for _, id in ipairs(GP.AchievementData.GetAll()) do
        MakeListButton(frame.ListContent, id, yOff)
        yOff = yOff + 36
    end

    frame.ListContent:SetHeight(yOff + 10)
end

-- ─── Step Details ─────────────────────────────────────────────────────────────

function MF.SelectAchievement(id)
    MF.SelectedID = id
    local frame = MF.Frame
    if not frame then return end

    local ach = GP.Data.Achievements[id]
    if not ach then return end

    frame.AchName:SetText(ach.name)

    if GP.AchievementData.IsCompleted(id) then
        frame.ProgressBar:SetProgress(100)
        frame.ProgressBar:SetLabel("|cff00ff00Completed!|r")
    else
        local pct = GP.AchievementData.GetPercent(id)
        frame.ProgressBar:SetProgress(pct)
    end

    -- Clear old step rows
    for _, child in ipairs({frame.StepsContent:GetChildren()}) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, child in ipairs({frame.StepsContent:GetRegions()}) do
        child:Hide()
    end

    local yOff = 0

    for _, step in ipairs(ach.steps) do
        -- Check if this step's criteria is complete
        local done = false
        if step.criteriaIndex then
            local _, _, completed = GetAchievementCriteriaInfo(id, step.criteriaIndex)
            done = completed
        end

        -- Step container
        local row = CreateFrame("Frame", nil, frame.StepsContent)
        row:SetSize(210, 48)
        row:SetPoint("TOPLEFT", 0, -yOff)

        local rowBG = row:CreateTexture(nil, "BACKGROUND")
        rowBG:SetAllPoints()
        if done then
            rowBG:SetColorTexture(0.1, 0.25, 0.1, 0.6)  -- green tint = done
        else
            rowBG:SetColorTexture(0.15, 0.15, 0.15, 0.6)
        end

        -- Step number badge
        local badge = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        badge:SetPoint("TOPLEFT", 4, -6)
        badge:SetText(done and "|cff00ff00✓|r" or ("|cffaaaaaa" .. step.index .. ".|r"))

        -- Description text — width leaves room for the waypoint button
        local desc = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        desc:SetPoint("TOPLEFT", 20, -6)
        desc:SetPoint("TOPRIGHT", row, "TOPRIGHT", -36, -6)  -- stretches, leaves room for W button
        desc:SetWordWrap(true)
        desc:SetJustifyH("LEFT")
        desc:SetText(done and ("|cff888888" .. step.desc .. "|r") or step.desc)

        -- NPC label (if any) — pinned below the desc with a small gap
        local rowHeight = 52   -- minimum row height
        if step.npc then
            local npcLabel = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            npcLabel:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -2)
            npcLabel:SetText("|cffffcc00" .. step.npc .. "|r")
            rowHeight = 68
        end
        row:SetHeight(rowHeight)

        -- Waypoint button (only on steps that have coords and aren't done)
        if step.coords and not done then
            local wpBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            wpBtn:SetSize(28, 18)
            wpBtn:SetPoint("TOPRIGHT", -2, -4)
            wpBtn:SetText("|cff00ccffW|r")
            wpBtn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText("Set TomTom waypoint")
                GameTooltip:Show()
            end)
            wpBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
            wpBtn:SetScript("OnClick", function(self)
                if self.clicked then return end   -- guard against double-fire
                self.clicked = true
                C_Timer.After(0.5, function() self.clicked = false end)
                GP.TomTom.SetWaypoint(id, step)
                if not GP.Progress.IsTracked(id) then
                    GP.Progress.Track(id)
                end
            end)
        end

        yOff = yOff + rowHeight + 4
    end

    frame.StepsContent:SetHeight(yOff + 10)

    -- Track button at the bottom of detail panel
    if not frame.TrackButton then
        local tb = CreateFrame("Button", nil, frame.DetailPanel, "UIPanelButtonTemplate")
        tb:SetSize(110, 22)
        tb:SetPoint("BOTTOMRIGHT", frame.DetailPanel, "BOTTOMRIGHT", -8, 8)
        frame.TrackButton = tb
    end

    local tb = frame.TrackButton
    if GP.Progress.IsTracked(id) then
        tb:SetText("Untrack")
        tb:SetScript("OnClick", function()
            GP.Progress.Untrack(id)
            MF.SelectAchievement(id)
        end)
    else
        tb:SetText("Track & Waypoint")
        tb:SetScript("OnClick", function()
            GP.Progress.Track(id)
            MF.SelectAchievement(id)
        end)
    end
    tb:Show()
end

-- ─── Public API ───────────────────────────────────────────────────────────────

function MF.Open()
    if not MF.Frame then
        MF.Frame = CreateMainFrame()
    end

    -- Restore saved window position and size (if any)
    local db = GuidePostDB
    if db then
        if db.windowW and db.windowH then
            MF.Frame:SetSize(
                math.max(db.windowW, MIN_W),
                math.max(db.windowH, MIN_H))
        end
        if db.windowX and db.windowY then
            MF.Frame:ClearAllPoints()
            MF.Frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", db.windowX, db.windowY)
        end
    end

    LayoutPanels(MF.Frame)   -- ensure panels fit current frame size on (re)open
    PopulateList(MF.Frame)

    local zone = GetZoneText()
    local count = #GP.AchievementData.CurrentZoneSuggestions
    if count > 0 then
        MF.Frame.ZoneLabel:SetText(string.format("|cffffcc00%d suggestion(s) in %s|r", count, zone))
    else
        MF.Frame.ZoneLabel:SetText("")
    end

    MF.Frame:Show()
end

function MF.Close()
    if MF.Frame then MF.Frame:Hide() end
end

function MF.Toggle()
    if MF.Frame and MF.Frame:IsShown() then
        MF.Close()
    else
        MF.Open()
    end
end

-- Called by Events.lua when criteria change
function MF.RefreshIfVisible()
    if MF.Frame and MF.Frame:IsShown() then
        PopulateList(MF.Frame)
        if MF.SelectedID then
            MF.SelectAchievement(MF.SelectedID)
        end
    end
end
