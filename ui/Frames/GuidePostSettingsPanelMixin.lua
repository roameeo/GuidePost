local GP = select(2, ...)

local settingsScopes = {
    account = { label = "Account (Warband)", tip = "Show all achievements shared across your entire account" },
    character = { label = "Character", tip = "Show only achievements that have in-progress criteria or are\ntracked on this character" },
    guild = { label = "Guild (Coming Soon)", tip = "Show guild achievements. (Requires guild achievements in the\ndatabase — coming in a future update.)" },
}

GuidePostSettingsPanelMixin = {}

function GuidePostSettingsPanelMixin:OnLoad()
    tinsert(UISpecialFrames, self:GetName())
    self.TitleText:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("GuidePost").." • Settings")
    self.CloseButton:HookScript("OnClick", function() self:Hide() end)

    -- Configure radio buttons once on load, then on every UpdateScope event trigger
    self:ConfigureRadioButtons(true)
    EventRegistry:RegisterCallback("GuidePost.UpdateScope", function()
        self:ConfigureRadioButtons()
    end)

    self.AutoCheck:SetChecked(GuidePostDB.settings.autoScan or false)
    self.AutoCheck:HookScript("OnEnter", function(btn)
        GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Automatically runs /gp scan when you enter a new zone and prints a chat message once complete", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)
    self.AutoCheck:HookScript("OnLeave", function() GameTooltip:Hide() end)
    self.AutoCheck:HookScript("OnClick", function()
        GuidePostDB.settings.autoScan = not GuidePostDB.settings.autoScan
    end)
    
end

function GuidePostSettingsPanelMixin:OnDragStart() self:StartMoving() end

function GuidePostSettingsPanelMixin:OnDragStop() self:StopMovingOrSizing() end

function GuidePostSettingsPanelMixin:Toggle()
    if self:IsShown() then self:Hide() else self:Show() end
end

function GuidePostSettingsPanelMixin:ConfigureRadioButtons(isOnLoad)
    for _, child in ipairs({ self:GetChildren() }) do
        if child.gpScope then
            for scope, details in pairs(settingsScopes) do
                if child.gpScope == scope then
                    child.text:SetText(details.label)
                    child:SetEnabled(child.gpScope ~= "guild") -- TODO: Remove once guild achievements are enabled
                    if child.gpScope == "guild" then child.text:SetTextColor(0.65, 0.65, 0.65) end
                    child:SetChecked(GuidePostDB.settings.scope == child.gpScope)
                    if isOnLoad then
                        child:HookScript("OnClick", function(btn)
                            GuidePostDB.settings.scope = scope
                            EventRegistry:TriggerEvent("GuidePost.UpdateScope")
                        end)
                        child:HookScript("OnEnter", function(btn)
                            GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                            GameTooltip:AddLine(details.tip, 1, 1, 1, true)
                            GameTooltip:Show()
                        end)
                        child:HookScript("OnLeave", function() GameTooltip:Hide() end)
                    end
                    break
                end
            end
        end
    end
end