local GP = GuidePostNS or {}

GuidePostListPanelMixin = {}

local function PopulateList(frame)
    print("Dummy list population")
end

function GuidePostListPanelMixin:OnLoad()
    self.SearchBox:SetMaxLetters(50)
    self.SearchBox:SetFontObject("GameFontHighlightSmall")
    self.SearchBox.Instructions:SetText("Search by name")
    self.SearchBox:SetScript("OnEscapePressed", function(sb)
        sb:ClearFocus()
    end)
    self.SearchBox:SetScript("OnTextChanged", function(sb)
        if sb:GetText() == "" and not sb.Instructions:IsShown() then sb.Instructions:Show()
        elseif sb:GetText() ~= "" and sb.Instructions:IsShown() then sb.Instructions:Hide()
        end
        -- Filter achievements as user types
        self:GetParent().SearchFilter = sb:GetText():lower()
        PopulateList(self:GetParent())
    end)

    self.CategoryDropdown.Middle:SetWidth(self.CategoryDropdown.Middle:GetWidth() + 15)
    self.StatusDropdown.Middle:SetWidth(self.StatusDropdown.Middle:GetWidth() + 15)
    self.ZoneDropdown.Middle:SetWidth(self.ZoneDropdown.Middle:GetWidth() + 15)
    self:InitializeCategoryDropdown()
    self:InitializeStatusDropdown()
    self:InitializeZoneDropdown()

    self.LhfCheckbox:SetChecked(GuidePostDB.filters.lowHangingFruit)
    self.LhfCheckbox:HookScript("OnClick", function(cb)
        GuidePostDB.filters.lowHangingFruit = cb:GetChecked()
        PopulateList(self:GetParent())
    end)
    self.LhfCheckbox:HookScript("OnEnter", function(cb)
        GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
        GameTooltip:SetText("Show achievements closest to completion first", 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    self.LhfCheckbox:SetScript("OnLeave", function() GameTooltip:Hide() end)
    self.LhfButton:HookScript("OnClick", function() self.LhfCheckbox:Click() end)
end

function GuidePostListPanelMixin:InitializeCategoryDropdown()
    UIDropDownMenu_Initialize(self.CategoryDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local categories = { "All" }
        local seen = {}
        for _, ach in pairs(GP.Data.Achievements) do
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
        GuidePostDB.filters = GuidePostDB.filters or {}
        for _, cat in ipairs(categories) do
            info.text = cat
            info.value = cat
            info.checked = (GuidePostDB.filters.category == cat)
            info.func = function(btn)
                GuidePostDB.filters.category = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                PopulateList(self:GetParent())
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.CategoryDropdown, GuidePostDB.filters.category)
end

function GuidePostListPanelMixin:InitializeStatusDropdown()
    UIDropDownMenu_Initialize(self.StatusDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local statuses = { "All", "In Progress", "Not Started", "Completed" }
        for _, status in ipairs(statuses) do
            info.text = status
            info.value = status
            info.checked = (GuidePostDB.filters.status == status)
            info.func = function(btn)
                GuidePostDB.filters.status = btn.value
                GuidePostDB.filters.status = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                PopulateList(self:GetParent())
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.StatusDropdown, GuidePostDB.filters.status)
end

function GuidePostListPanelMixin:InitializeZoneDropdown()
    UIDropDownMenu_Initialize(self.ZoneDropdown, function(dropdown, level)
        local info = UIDropDownMenu_CreateInfo()
        local zones = { "All", "Current Zone" }
        for _, zone in ipairs(zones) do
            info.text = zone
            info.value = zone
            info.checked = (GuidePostDB.filters.zone == zone)
            info.func = function(btn)
                MF.Filters.zone = btn.value
                GuidePostDB.filters.zone = btn.value
                UIDropDownMenu_SetText(dropdown, btn.value)
                PopulateList(self:GetParent())
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(self.ZoneDropdown, GuidePostDB.filters.zone)
end