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

-- Search filter text (lowercase for case-insensitive matching)
MF.SearchFilter = ""

-- Active filters (persisted in SavedVars)
MF.Filters = {
    category = "All",  -- "All" or specific category name
    status = "All",    -- "All", "In Progress", "Not Started", "Completed"
    zone = "All",      -- "All", "Current Zone"
    lowHangingFruit = false  -- Sort by completion percentage
}

-- ─── Frame Creation ──────────────────────────────────────────────────────────

-- ─── Layout constants (panels recompute from these on resize) ────────────────
local PANEL_GAP    =   6   -- gap / divider width
local MARGIN_L     =  10   -- left margin from frame edge
local MARGIN_R     =  10   -- right margin from frame edge
local MARGIN_TOP   =  30   -- top margin (below title bar)
local MARGIN_BOT   =  24   -- bottom margin
local MIN_W        = 380   -- minimum frame width
local MIN_H        = 300   -- minimum frame height
local MIN_LIST_W   =  80   -- minimum list panel width
local MIN_DETAIL_W =  80   -- minimum detail panel width

-- Current list width — persisted in SavedVars
local function GetListWidth()
    GuidePostDB = GuidePostDB or {}
    return GuidePostDB.listWidth or 175
end
local function SetListWidth(w)
    GuidePostDB = GuidePostDB or {}
    GuidePostDB.listWidth = w
end

-- Recompute panel sizes
local function LayoutPanels(f)
    local fw      = f:GetWidth()
    local fh      = f:GetHeight()
    local panelH  = fh - MARGIN_TOP - MARGIN_BOT
    local listW   = math.max(MIN_LIST_W, math.min(GetListWidth(),
                        fw - MARGIN_L - MARGIN_R - PANEL_GAP - MIN_DETAIL_W))
    local detailW = fw - MARGIN_L - listW - PANEL_GAP - MARGIN_R

    f.ListPanel:SetSize(listW, panelH)
    f.DetailPanel:SetSize(math.max(detailW, MIN_DETAIL_W), panelH)

    -- Reposition divider
    if f.Divider then
        f.Divider:SetHeight(panelH)
        f.Divider:ClearAllPoints()
        f.Divider:SetPoint("TOPLEFT", f, "TOPLEFT", MARGIN_L + listW, -MARGIN_TOP)
    end

    -- Reflow list content width
    if f.ListContent then
        f.ListContent:SetWidth(listW - 25)
    end

    -- Reflow progress bar
    if f.ProgressBar then
        f.ProgressBar:SetWidth(math.max(detailW - 20, 40))
    end
end

local PopulateList  -- forward declaration; defined below

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

    -- Minimize/Maximize button — positioned to the left of the close button
    local minBtn = CreateFrame("Button", nil, f)
    minBtn:SetSize(24, 24)
    minBtn:SetPoint("RIGHT", f.CloseButton, "LEFT", -2, 0)
    minBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    minBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    minBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    minBtn:SetScript("OnClick", function()
        MF.ToggleMinimize()
    end)
    minBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if f.isMinimized then
            GameTooltip:SetText("Maximize", 1, 1, 1, 1)
        else
            GameTooltip:SetText("Minimize to title bar", 1, 1, 1, 1)
        end
        GameTooltip:Show()
    end)
    minBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    f.MinimizeButton = minBtn

    -- Summary text shown when minimized
    local summaryText = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    summaryText:SetPoint("LEFT", f.TitleText, "RIGHT", 10, 0)
    summaryText:SetJustifyH("LEFT")
    summaryText:Hide()
    f.SummaryText = summaryText

    -- Track minimized state
    f.isMinimized = false

    -- ── Left panel: achievement list ─────────────────────────────────────────
    local listPanel = CreateFrame("Frame", nil, f, "InsetFrameTemplate")
    listPanel:SetSize(GetListWidth(), 420)
    listPanel:SetPoint("TOPLEFT", f, "TOPLEFT", MARGIN_L, -MARGIN_TOP)
    f.ListPanel = listPanel

    local listLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    listLabel:SetPoint("TOPLEFT", 5, -5)
    listLabel:SetText("|cffaaaaaaAchievements|r")

    -- Search box
    local searchBox = CreateFrame("EditBox", nil, listPanel, "InputBoxTemplate")
    searchBox:SetSize(GetListWidth() - 15, 20)
    searchBox:SetPoint("TOPLEFT", 8, -22)
    searchBox:SetAutoFocus(false)
    searchBox:SetMaxLetters(50)
    searchBox:SetFontObject(GameFontHighlightSmall)
    searchBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    searchBox:SetScript("OnTextChanged", function(self)
        -- Filter achievements as user types
        MF.SearchFilter = self:GetText():lower()
        PopulateList(f)
    end)
    searchBox:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Search achievements by name", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    searchBox:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    f.SearchBox = searchBox

    -- Search clear button (X)
    local clearBtn = CreateFrame("Button", nil, listPanel)
    clearBtn:SetSize(16, 16)
    clearBtn:SetPoint("RIGHT", searchBox, "RIGHT", -4, 0)
    clearBtn:SetNormalTexture("Interface\\FriendsFrame\\ClearBroadcastIcon")
    clearBtn:SetScript("OnClick", function()
        searchBox:SetText("")
        searchBox:ClearFocus()
        MF.SearchFilter = ""
        PopulateList(f)
    end)
    clearBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Clear search", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    clearBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    f.SearchClearBtn = clearBtn

    -- ── Filter Controls ───────────────────────────────────────────────────────
    -- Load persisted filters
    GuidePostDB = GuidePostDB or {}
    GuidePostDB.filters = GuidePostDB.filters or {}
    MF.Filters.category = GuidePostDB.filters.category or "All"
    MF.Filters.status = GuidePostDB.filters.status or "All"
    MF.Filters.zone = GuidePostDB.filters.zone or "All"
    MF.Filters.lowHangingFruit = GuidePostDB.filters.lowHangingFruit or false

    local filterY = -47  -- Start position for filters

    -- Category filter dropdown
    local categoryLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    categoryLabel:SetPoint("TOPLEFT", 8, filterY)
    categoryLabel:SetText("|cffaaaaaaCategory:|r")

    local categoryBtn = CreateFrame("Button", nil, listPanel)
    categoryBtn:SetSize(GetListWidth() - 80, 20)
    categoryBtn:SetPoint("TOPLEFT", 65, filterY)
    categoryBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Left")
    categoryBtn:GetNormalTexture():SetTexCoord(0, 0, 0, 1)
    
    local categoryBtnBg = categoryBtn:CreateTexture(nil, "BACKGROUND")
    categoryBtnBg:SetAllPoints()
    categoryBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    
    local categoryBtnText = categoryBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    categoryBtnText:SetPoint("LEFT", 5, 0)
    categoryBtnText:SetText(MF.Filters.category)
    f.CategoryBtnText = categoryBtnText
    
    categoryBtn:SetScript("OnClick", function()
        MF.ShowCategoryMenu(categoryBtn)
    end)
    categoryBtn:SetScript("OnEnter", function()
        categoryBtnBg:SetColorTexture(0.15, 0.15, 0.25, 0.9)
    end)
    categoryBtn:SetScript("OnLeave", function()
        categoryBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    end)

    filterY = filterY - 25

    -- Status filter dropdown
    local statusLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    statusLabel:SetPoint("TOPLEFT", 8, filterY)
    statusLabel:SetText("|cffaaaaaaStatus:|r")

    local statusBtn = CreateFrame("Button", nil, listPanel)
    statusBtn:SetSize(GetListWidth() - 80, 20)
    statusBtn:SetPoint("TOPLEFT", 65, filterY)
    
    local statusBtnBg = statusBtn:CreateTexture(nil, "BACKGROUND")
    statusBtnBg:SetAllPoints()
    statusBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    
    local statusBtnText = statusBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    statusBtnText:SetPoint("LEFT", 5, 0)
    statusBtnText:SetText(MF.Filters.status)
    f.StatusBtnText = statusBtnText
    
    statusBtn:SetScript("OnClick", function()
        MF.ShowStatusMenu(statusBtn)
    end)
    statusBtn:SetScript("OnEnter", function()
        statusBtnBg:SetColorTexture(0.15, 0.15, 0.25, 0.9)
    end)
    statusBtn:SetScript("OnLeave", function()
        statusBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    end)

    filterY = filterY - 25

    -- Zone filter and Low-Hanging Fruit checkbox on same row
    local zoneLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneLabel:SetPoint("TOPLEFT", 8, filterY)
    zoneLabel:SetText("|cffaaaaaaZone:|r")

    local zoneBtn = CreateFrame("Button", nil, listPanel)
    zoneBtn:SetSize((GetListWidth() - 85) / 2, 20)
    zoneBtn:SetPoint("TOPLEFT", 45, filterY)
    
    local zoneBtnBg = zoneBtn:CreateTexture(nil, "BACKGROUND")
    zoneBtnBg:SetAllPoints()
    zoneBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    
    local zoneBtnText = zoneBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    zoneBtnText:SetPoint("LEFT", 5, 0)
    zoneBtnText:SetText(MF.Filters.zone)
    f.ZoneBtnText = zoneBtnText
    
    zoneBtn:SetScript("OnClick", function()
        MF.ShowZoneMenu(zoneBtn)
    end)
    zoneBtn:SetScript("OnEnter", function()
        zoneBtnBg:SetColorTexture(0.15, 0.15, 0.25, 0.9)
    end)
    zoneBtn:SetScript("OnLeave", function()
        zoneBtnBg:SetColorTexture(0.1, 0.1, 0.1, 0.8)
    end)

    -- Low-Hanging Fruit checkbox
    local lhfCheck = CreateFrame("CheckButton", nil, listPanel, "UICheckButtonTemplate")
    lhfCheck:SetSize(20, 20)
    lhfCheck:SetPoint("LEFT", zoneBtn, "RIGHT", 5, 0)
    lhfCheck:SetChecked(MF.Filters.lowHangingFruit)
    lhfCheck:SetScript("OnClick", function(self)
        MF.Filters.lowHangingFruit = self:GetChecked()
        GuidePostDB.filters.lowHangingFruit = MF.Filters.lowHangingFruit
        PopulateList(f)
    end)
    lhfCheck:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Low-Hanging Fruit\nShow achievements closest to completion first", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    lhfCheck:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    local lhfLabel = listPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lhfLabel:SetPoint("LEFT", lhfCheck, "RIGHT", 2, 0)
    lhfLabel:SetText("|cffaaaaaa↓%|r")
    f.LowHangingFruitCheck = lhfCheck

    filterY = filterY - 28

    -- ScrollFrame for the list (adjusted for filter controls)
    local scroll = CreateFrame("ScrollFrame", nil, listPanel, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT",     5, filterY)
    scroll:SetPoint("BOTTOMRIGHT", -25, 5)

    local listContent = CreateFrame("Frame", nil, scroll)
    listContent:SetSize(GetListWidth() - 25, 1)
    scroll:SetScrollChild(listContent)

    f.ListContent = listContent

    -- ── Draggable divider ─────────────────────────────────────────────────────
    local divider = CreateFrame("Button", nil, f)
    divider:SetSize(PANEL_GAP, 420)
    divider:SetPoint("TOPLEFT", listPanel, "TOPRIGHT", 0, 0)

    -- Visual bar in the center of the divider
    local divBar = divider:CreateTexture(nil, "ARTWORK")
    divBar:SetSize(2, 420)
    divBar:SetPoint("CENTER")
    divBar:SetColorTexture(0.35, 0.35, 0.35, 0.8)

    -- Highlight on hover
    divider:SetScript("OnEnter", function(self)
        divBar:SetColorTexture(0.6, 0.8, 1.0, 0.9)
        -- Show a resize cursor hint via tooltip
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to resize panels", 0.8, 0.8, 0.8, 1)        GameTooltip:Show()
    end)
    divider:SetScript("OnLeave", function(self)
        divBar:SetColorTexture(0.35, 0.35, 0.35, 0.8)
        GameTooltip:Hide()
    end)

    -- Drag logic: track mouse X movement and resize list panel
    divider:RegisterForDrag("LeftButton")
    divider:SetScript("OnDragStart", function(self)
        self.dragging = true
        self.startX   = select(1, GetCursorPosition()) / UIParent:GetEffectiveScale()
        self.startW   = f.ListPanel:GetWidth()
    end)
    divider:SetScript("OnUpdate", function(self)
        if not self.dragging then return end
        local curX = select(1, GetCursorPosition()) / UIParent:GetEffectiveScale()
        local delta = curX - self.startX
        local fw    = f:GetWidth()
        local newW  = math.max(MIN_LIST_W,
                        math.min(self.startW + delta,
                            fw - MARGIN_L - MARGIN_R - PANEL_GAP - MIN_DETAIL_W))
        SetListWidth(newW)
        LayoutPanels(f)
    end)
    divider:SetScript("OnDragStop", function(self)
        self.dragging = false
        -- Save final width
        SetListWidth(f.ListPanel:GetWidth())
    end)

    f.Divider = divider

    -- ── Right panel: step details ─────────────────────────────────────────────
    local detailPanel = CreateFrame("Frame", nil, f, "InsetFrameTemplate")
    detailPanel:SetSize(255, 420)
    detailPanel:SetPoint("TOPLEFT", divider, "TOPRIGHT", 0, 0)
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

-- ─── Filter Menu Helpers ─────────────────────────────────────────────────────

-- Show category filter dropdown menu
function MF.ShowCategoryMenu(anchor)
    local menu = CreateFrame("Frame", "GuidePostCategoryMenu", UIParent, "UIDropDownMenuTemplate")
    
    -- Get unique categories from achievements
    local categories = {"All"}
    local seen = {}
    for id, ach in pairs(GP.Data.Achievements) do
        if ach.category and not seen[ach.category] then
            seen[ach.category] = true
            table.insert(categories, ach.category)
        end
    end
    table.sort(categories, function(a, b)
        if a == "All" then return true end
        if b == "All" then return false end
        return a < b
    end)
    
    local menuList = {}
    for _, cat in ipairs(categories) do
        table.insert(menuList, {
            text = cat,
            func = function()
                MF.Filters.category = cat
                GuidePostDB.filters.category = cat
                MF.Frame.CategoryBtnText:SetText(cat)
                PopulateList(MF.Frame)
            end,
            checked = (MF.Filters.category == cat)
        })
    end
    
    EasyMenu(menuList, menu, anchor, 0, 0, "MENU")
end

-- Show status filter dropdown menu
function MF.ShowStatusMenu(anchor)
    local menu = CreateFrame("Frame", "GuidePostStatusMenu", UIParent, "UIDropDownMenuTemplate")
    
    local statuses = {"All", "In Progress", "Not Started", "Completed"}
    local menuList = {}
    for _, status in ipairs(statuses) do
        table.insert(menuList, {
            text = status,
            func = function()
                MF.Filters.status = status
                GuidePostDB.filters.status = status
                MF.Frame.StatusBtnText:SetText(status)
                PopulateList(MF.Frame)
            end,
            checked = (MF.Filters.status == status)
        })
    end
    
    EasyMenu(menuList, menu, anchor, 0, 0, "MENU")
end

-- Show zone filter dropdown menu
function MF.ShowZoneMenu(anchor)
    local menu = CreateFrame("Frame", "GuidePostZoneMenu", UIParent, "UIDropDownMenuTemplate")
    
    local zones = {"All", "Current Zone"}
    local menuList = {}
    for _, zone in ipairs(zones) do
        table.insert(menuList, {
            text = zone,
            func = function()
                MF.Filters.zone = zone
                GuidePostDB.filters.zone = zone
                MF.Frame.ZoneBtnText:SetText(zone)
                PopulateList(MF.Frame)
            end,
            checked = (MF.Filters.zone == zone)
        })
    end
    
    EasyMenu(menuList, menu, anchor, 0, 0, "MENU")
end

-- Check if an achievement matches the current search filter and active filters
local function MatchesFilter(id)
    local ach = GP.Data.Achievements[id]
    if not ach then return false end
    
    -- Search text filter
    if MF.SearchFilter and MF.SearchFilter ~= "" then
        local name = (ach.name or ""):lower()
        local category = (ach.category or ""):lower()
        local zone = (ach.zone or ""):lower()
        
        local searchMatch = name:find(MF.SearchFilter, 1, true) or 
                           category:find(MF.SearchFilter, 1, true) or 
                           zone:find(MF.SearchFilter, 1, true)
        if not searchMatch then return false end
    end
    
    -- Category filter
    if MF.Filters.category ~= "All" then
        if ach.category ~= MF.Filters.category then
            return false
        end
    end
    
    -- Status filter
    if MF.Filters.status ~= "All" then
        local isComplete = GP.AchievementData.IsCompleted(id)
        local done, total = GP.AchievementData.GetCriteriaProgress(id)
        local isInProgress = (done > 0 and done < total) or GP.Progress.IsTracked(id)
        
        if MF.Filters.status == "Completed" and not isComplete then
            return false
        elseif MF.Filters.status == "In Progress" and (not isInProgress or isComplete) then
            return false
        elseif MF.Filters.status == "Not Started" and (isInProgress or isComplete) then
            return false
        end
    end
    
    -- Zone filter
    if MF.Filters.zone == "Current Zone" then
        local currentZone = GetZoneText()
        if ach.zone ~= currentZone then
            return false
        end
    end
    
    return true
end

-- Tracks which zone groups are collapsed. Persisted in SavedVars.
local function GetCollapsed()
    GuidePostDB = GuidePostDB or {}
    GuidePostDB.collapsedZones = GuidePostDB.collapsedZones or {}
    return GuidePostDB.collapsedZones
end

local function MakeListButton(parent, id, yOffset, width)
    local ach = GP.Data.Achievements[id]
    if not ach then return nil, 0 end
    width = width or 140

    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, 34)
    btn:SetPoint("TOPLEFT", 0, -yOffset)

    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.15, 0.15, 0.15, 0.6)

    -- Completed checkmark or name
    local isComplete = GP.AchievementData.IsCompleted(id)
    local nameText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    nameText:SetPoint("TOPLEFT", 4, -4)
    nameText:SetWidth(width - 32)
    nameText:SetWordWrap(true)
    nameText:SetJustifyH("LEFT")
    if isComplete then
        nameText:SetText("|cff888888" .. ach.name .. "|r")
    else
        nameText:SetText(ach.name)
    end

    -- Progress fraction (bottom right)
    local done, total = GP.AchievementData.GetCriteriaProgress(id)
    if total > 0 then
        local prog = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        prog:SetPoint("BOTTOMRIGHT", -4, 4)
        if isComplete then
            prog:SetText("|cff00ff00✓|r")
        else
            prog:SetText(string.format("|cffaaaaaa%d/%d|r", done, total))
        end
    end

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
        for _, child in ipairs({parent:GetChildren()}) do
            if child:GetScript("OnLeave") then
                child:GetScript("OnLeave")(child)
            end
        end
        bg:SetColorTexture(0.2, 0.4, 0.6, 0.8)
    end)

    return btn, 36
end

-- Creates a clickable zone group header that toggles collapse
local function MakeZoneHeader(parent, zoneName, yOffset, width, onToggle)
    width = width or 140
    local collapsed = GetCollapsed()[zoneName]

    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, 20)
    btn:SetPoint("TOPLEFT", 0, -yOffset)

    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.08, 0.08, 0.12, 0.9)

    -- Arrow indicator ▶ collapsed / ▼ expanded
    local arrow = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    arrow:SetPoint("LEFT", 3, 0)
    arrow:SetText(collapsed and "|cffaaaaaa▶|r" or "|cffaaaaaa▼|r")

    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    label:SetPoint("LEFT", 16, 0)
    label:SetWidth(width - 20)
    label:SetJustifyH("LEFT")
    label:SetText("|cffffcc00" .. zoneName .. "|r")

    btn:SetScript("OnEnter", function()
        bg:SetColorTexture(0.15, 0.15, 0.25, 0.9)
    end)
    btn:SetScript("OnLeave", function()
        bg:SetColorTexture(0.08, 0.08, 0.12, 0.9)
    end)
    btn:SetScript("OnClick", function()
        GetCollapsed()[zoneName] = not GetCollapsed()[zoneName]
        if onToggle then onToggle() end
    end)

    return btn, 22
end

-- Sort achievements by completion percentage (descending)
local function SortByCompletion(list)
    if not MF.Filters.lowHangingFruit then return end
    
    table.sort(list, function(a, b)
        local doneA, totalA = GP.AchievementData.GetCriteriaProgress(a)
        local doneB, totalB = GP.AchievementData.GetCriteriaProgress(b)
        
        -- Calculate percentages (avoid division by zero)
        local pctA = (totalA > 0) and (doneA / totalA) or 0
        local pctB = (totalB > 0) and (doneB / totalB) or 0
        
        -- Sort by percentage descending (highest completion first)
        return pctA > pctB
    end)
end

PopulateList = function(frame)
    -- Clear existing content
    for _, child in ipairs({frame.ListContent:GetChildren()}) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, region in ipairs({frame.ListContent:GetRegions()}) do
        region:Hide()
    end

    local listWidth = frame.ListContent:GetWidth() or 145
    local yOff = 0

    -- ── Tracked section ───────────────────────────────────────────────────────
    local tracked = GP.Progress.GetTrackedList()
    local filteredTracked = {}
    for _, id in ipairs(tracked) do
        if MatchesFilter(id) then
            table.insert(filteredTracked, id)
        end
    end
    SortByCompletion(filteredTracked)

    if #filteredTracked > 0 then
        local hdr = frame.ListContent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        hdr:SetPoint("TOPLEFT", 2, -yOff)
        hdr:SetText("|cff00ff88Tracked|r")
        yOff = yOff + 18

        for _, id in ipairs(filteredTracked) do
            local _, h = MakeListButton(frame.ListContent, id, yOff, listWidth)
            yOff = yOff + h + 2
        end
        yOff = yOff + 4
    end

    -- ── In This Zone section ──────────────────────────────────────────────────
    local suggestions = GP.AchievementData.CurrentZoneSuggestions
    local filteredSuggestions = {}
    for _, id in ipairs(suggestions) do
        if MatchesFilter(id) then
            table.insert(filteredSuggestions, id)
        end
    end
    SortByCompletion(filteredSuggestions)

    if #filteredSuggestions > 0 then
        local hdr = frame.ListContent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        hdr:SetPoint("TOPLEFT", 2, -yOff)
        hdr:SetText("|cff00ccffIn This Zone|r")
        yOff = yOff + 18

        for _, id in ipairs(filteredSuggestions) do
            local _, h = MakeListButton(frame.ListContent, id, yOff, listWidth)
            yOff = yOff + h + 2
        end
        yOff = yOff + 4
    end

    -- ── All achievements grouped by zone ─────────────────────────────────────
    -- Build zone → [ids] map sorted by zone name
    local zoneMap = {}
    local zoneNames = {}
    for _, id in ipairs(GP.AchievementData.GetAll()) do
        if MatchesFilter(id) then
            local ach = GP.Data.Achievements[id]
            local zone = (ach and ach.zone) or "Unknown"
            if not zoneMap[zone] then
                zoneMap[zone] = {}
                table.insert(zoneNames, zone)
            end
            table.insert(zoneMap[zone], id)
        end
    end
    table.sort(zoneNames)

    local function Repopulate() PopulateList(frame) end

    for _, zone in ipairs(zoneNames) do
        local ids = zoneMap[zone]
        SortByCompletion(ids)
        if #ids > 0 then  -- Only show zone header if it has matching achievements
            local _, hh = MakeZoneHeader(frame.ListContent, zone, yOff, listWidth, Repopulate)
            yOff = yOff + hh

            if not GetCollapsed()[zone] then
                for _, id in ipairs(ids) do
                    local _, h = MakeListButton(frame.ListContent, id, yOff, listWidth)
                    yOff = yOff + h + 2
                end
            end
            yOff = yOff + 4
        end
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
            local ok, _, _, completed = pcall(GetAchievementCriteriaInfo, id, step.criteriaIndex)
            done = ok and completed or false
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
                GameTooltip:SetText("Set TomTom waypoint", 1, 1, 1, 1)
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

-- ─── Minimize/Maximize ───────────────────────────────────────────────────────

function MF.ToggleMinimize()
    local f = MF.Frame
    if not f then return end

    f.isMinimized = not f.isMinimized
    local db = GuidePostDB or {}
    db.isMinimized = f.isMinimized

    if f.isMinimized then
        -- Minimize: hide content, shrink to title bar only
        f.savedHeight = f:GetHeight()
        f:SetHeight(40)
        f.Inset:Hide()
        f.ListPanel:Hide()
        f.DetailPanel:Hide()
        f.Divider:Hide()
        f.ZoneLabel:Hide()
        f.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
        f.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Highlight")
        f.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")

        -- Show summary line
        local tracked = GP.Progress.GetTrackedList()
        local zoneSuggestions = GP.AchievementData.CurrentZoneSuggestions
        f.SummaryText:SetText(string.format("|cffffff00%d tracked | %d in zone|r", 
            #tracked, #zoneSuggestions))
        f.SummaryText:Show()
    else
        -- Maximize: restore content
        f:SetHeight(f.savedHeight or MIN_H)
        f.Inset:Show()
        f.ListPanel:Show()
        f.DetailPanel:Show()
        f.Divider:Show()
        f.ZoneLabel:Show()
        f.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
        f.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
        f.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
        f.SummaryText:Hide()
        LayoutPanels(f)
    end
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

    -- Restore minimized state if it was minimized when closed
    if db and db.isMinimized then
        MF.Frame.isMinimized = false  -- reset first so ToggleMinimize works
        MF.ToggleMinimize()
    end
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
