local addonName, addon = ...

-- Get SharedMedia-3.0
local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)

-- Register default WoW fonts with SharedMedia if available
if LSM then
    LSM:Register("font", "Friz Quadrata TT", "Fonts\\FRIZQT__.TTF")
    LSM:Register("font", "Arial Narrow", "Fonts\\ARIALN.TTF")
    LSM:Register("font", "Skurri", "Fonts\\skurri.ttf")
    LSM:Register("font", "Morpheus", "Fonts\\MORPHEUS.ttf")
end

-- Default settings
local defaults = {
    cursorCircleEnabled = true,
    circleRadius = 20,
    circleColor = {r = 1, g = 1, b = 1, a = 0.8},
    lineThickness = 3,
    combatTextEnabled = true,
    combatTextEnter = "ENTERING COMBAT!",
    combatTextLeave = "Leaving Combat",
    combatTextSize = 32,
    combatTextX = 0,
    combatTextY = 200,
    disableBlizzardCombatText = true,
    disableBlizzardBagBar = false,
    actionBarsMouseover = {
        enabled = true,
        MultiBarBottomLeft = false,
        MultiBarBottomRight = false,
        MultiBarRight = false,
        MultiBarLeft = false,
        MultiBar5 = false,
        MultiBar6 = false,
        MultiBar7 = false,
    },
    combatTimer = {
        enabled = true,
        borderSize = 1,
        fontSize = 14,
        bgTexture = "Interface\\DialogFrame\\UI-DialogBox-Background",
        borderColor = {r = 1, g = 0, b = 0, a = 1},
        anchorFrame = "AUTO",
        anchorPoint = "TOP",
        anchorRelativePoint = "BOTTOM",
        anchorOffsetX = 0,
        anchorOffsetY = -5,
    },
    autoLogging = {
        enabled = true,
        dungeonsMythicPlus = false,
        raidMythic = false,
        raidHeroic = false,
        raidNormal = false,
        raidFinder = false,
        arena = false,
        scenarios = false,
    },
    gateway = {
        enabled = true,
        text = "Gateway usable",
        missingText = "Keybind Gateway Control Shard is missing",
        fontSize = 24,
        x = 0,
        y = 150,
    },
    lustTracker = {
        enabled = true,
        iconId = 132313,
        iconSize = 48,
        x = 0,
        y = 250,
        fontSize = 18,
    },
    buffTrackers = {
        enabled = true,
        list = {},
        nextId = 1,
    },
    globalFont = "Friz Quadrata TT",
}

-- Initialize settings
local function InitializeSettings()
    if not UsefulStuffDB then
        UsefulStuffDB = {}
    end
    if UsefulStuffDB.cursorCircleEnabled == nil then
        UsefulStuffDB.cursorCircleEnabled = defaults.cursorCircleEnabled
    end
    if not UsefulStuffDB.circleRadius then
        UsefulStuffDB.circleRadius = defaults.circleRadius
    end
    if not UsefulStuffDB.circleColor then
        UsefulStuffDB.circleColor = {r = defaults.circleColor.r, g = defaults.circleColor.g, b = defaults.circleColor.b, a = defaults.circleColor.a}
    end
    if not UsefulStuffDB.lineThickness then
        UsefulStuffDB.lineThickness = defaults.lineThickness
    end
    if UsefulStuffDB.combatTextEnabled == nil then
        UsefulStuffDB.combatTextEnabled = defaults.combatTextEnabled
    end
    if not UsefulStuffDB.combatTextEnter then
        UsefulStuffDB.combatTextEnter = defaults.combatTextEnter
    end
    if not UsefulStuffDB.combatTextLeave then
        UsefulStuffDB.combatTextLeave = defaults.combatTextLeave
    end
    if not UsefulStuffDB.combatTextSize then
        UsefulStuffDB.combatTextSize = defaults.combatTextSize
    end
    if not UsefulStuffDB.combatTextX then
        UsefulStuffDB.combatTextX = defaults.combatTextX
    end
    if not UsefulStuffDB.combatTextY then
        UsefulStuffDB.combatTextY = defaults.combatTextY
    end
    if UsefulStuffDB.disableBlizzardCombatText == nil then
        UsefulStuffDB.disableBlizzardCombatText = defaults.disableBlizzardCombatText
    end
    if UsefulStuffDB.disableBlizzardBagBar == nil then
        UsefulStuffDB.disableBlizzardBagBar = defaults.disableBlizzardBagBar
    end
    if not UsefulStuffDB.actionBarsMouseover then
        UsefulStuffDB.actionBarsMouseover = {}
    end
    for barName, defaultValue in pairs(defaults.actionBarsMouseover) do
        if UsefulStuffDB.actionBarsMouseover[barName] == nil then
            UsefulStuffDB.actionBarsMouseover[barName] = defaultValue
        end
    end
    if not UsefulStuffDB.combatTimer then
        UsefulStuffDB.combatTimer = {}
    end
    if UsefulStuffDB.combatTimer.enabled == nil then
        UsefulStuffDB.combatTimer.enabled = defaults.combatTimer.enabled
    end
    if not UsefulStuffDB.combatTimer.borderSize then
        UsefulStuffDB.combatTimer.borderSize = defaults.combatTimer.borderSize
    end
    if not UsefulStuffDB.combatTimer.fontSize then
        UsefulStuffDB.combatTimer.fontSize = defaults.combatTimer.fontSize
    end
    if not UsefulStuffDB.combatTimer.bgTexture then
        UsefulStuffDB.combatTimer.bgTexture = defaults.combatTimer.bgTexture
    end
    if not UsefulStuffDB.combatTimer.borderColor then
        UsefulStuffDB.combatTimer.borderColor = {r = defaults.combatTimer.borderColor.r, g = defaults.combatTimer.borderColor.g, b = defaults.combatTimer.borderColor.b, a = defaults.combatTimer.borderColor.a}
    end
    if not UsefulStuffDB.combatTimer.anchorFrame then
        UsefulStuffDB.combatTimer.anchorFrame = defaults.combatTimer.anchorFrame
    end
    if not UsefulStuffDB.combatTimer.anchorPoint then
        UsefulStuffDB.combatTimer.anchorPoint = defaults.combatTimer.anchorPoint
    end
    if not UsefulStuffDB.combatTimer.anchorRelativePoint then
        UsefulStuffDB.combatTimer.anchorRelativePoint = defaults.combatTimer.anchorRelativePoint
    end
    if not UsefulStuffDB.combatTimer.anchorOffsetX then
        UsefulStuffDB.combatTimer.anchorOffsetX = defaults.combatTimer.anchorOffsetX
    end
    if not UsefulStuffDB.combatTimer.anchorOffsetY then
        UsefulStuffDB.combatTimer.anchorOffsetY = defaults.combatTimer.anchorOffsetY
    end
    if not UsefulStuffDB.autoLogging then
        UsefulStuffDB.autoLogging = {}
    end
    for logType, defaultValue in pairs(defaults.autoLogging) do
        if UsefulStuffDB.autoLogging[logType] == nil then
            UsefulStuffDB.autoLogging[logType] = defaultValue
        end
    end
    if not UsefulStuffDB.gateway then
        UsefulStuffDB.gateway = {}
    end
    if UsefulStuffDB.gateway.enabled == nil then
        UsefulStuffDB.gateway.enabled = defaults.gateway.enabled
    end
    if not UsefulStuffDB.gateway.text then
        UsefulStuffDB.gateway.text = defaults.gateway.text
    end
    if not UsefulStuffDB.gateway.missingText then
        UsefulStuffDB.gateway.missingText = defaults.gateway.missingText
    end
    if not UsefulStuffDB.gateway.fontSize then
        UsefulStuffDB.gateway.fontSize = defaults.gateway.fontSize
    end
    if not UsefulStuffDB.gateway.x then
        UsefulStuffDB.gateway.x = defaults.gateway.x
    end
    if not UsefulStuffDB.gateway.y then
        UsefulStuffDB.gateway.y = defaults.gateway.y
    end
    if not UsefulStuffDB.lustTracker then
        UsefulStuffDB.lustTracker = {}
    end
    if UsefulStuffDB.lustTracker.enabled == nil then
        UsefulStuffDB.lustTracker.enabled = defaults.lustTracker.enabled
    end
    if not UsefulStuffDB.lustTracker.iconId then
        UsefulStuffDB.lustTracker.iconId = defaults.lustTracker.iconId
    end
    if not UsefulStuffDB.lustTracker.iconSize then
        UsefulStuffDB.lustTracker.iconSize = defaults.lustTracker.iconSize
    end
    if not UsefulStuffDB.lustTracker.x then
        UsefulStuffDB.lustTracker.x = defaults.lustTracker.x
    end
    if not UsefulStuffDB.lustTracker.y then
        UsefulStuffDB.lustTracker.y = defaults.lustTracker.y
    end
    if not UsefulStuffDB.lustTracker.fontSize then
        UsefulStuffDB.lustTracker.fontSize = defaults.lustTracker.fontSize
    end
    if not UsefulStuffDB.buffTrackers then
        UsefulStuffDB.buffTrackers = {}
    end
    if UsefulStuffDB.buffTrackers.enabled == nil then
        UsefulStuffDB.buffTrackers.enabled = defaults.buffTrackers.enabled
    end
    if not UsefulStuffDB.buffTrackers.list then
        UsefulStuffDB.buffTrackers.list = {}
    end
    if not UsefulStuffDB.buffTrackers.nextId then
        UsefulStuffDB.buffTrackers.nextId = 1
    end
    for _, entry in ipairs(UsefulStuffDB.buffTrackers.list) do
        if entry.fontSize == nil then entry.fontSize = 20 end
        if entry.x == nil then entry.x = 0 end
        if entry.y == nil then entry.y = 0 end
        if entry.color == nil then entry.color = {r = 1, g = 1, b = 1, a = 1} end
        if entry.locked == nil then entry.locked = true end
        if entry.showDuration == nil then entry.showDuration = false end
        if entry.layout == nil then entry.layout = "stacks_duration" end
    end

    -- Font is now a single global setting shared by every module (Size stays
    -- per-module). Migrate from whichever per-module font a returning user
    -- had set before, preferring the one most likely to be intentional.
    if not UsefulStuffDB.globalFont then
        UsefulStuffDB.globalFont = UsefulStuffDB.combatTextFont
            or (UsefulStuffDB.chatFont and UsefulStuffDB.chatFont.font)
            or (UsefulStuffDB.combatTimer and UsefulStuffDB.combatTimer.font)
            or (UsefulStuffDB.gateway and UsefulStuffDB.gateway.font)
            or (UsefulStuffDB.lustTracker and UsefulStuffDB.lustTracker.font)
            or defaults.globalFont
    end
end

-- Function to get font path from font name
local function GetFontPath(fontName)
    if LSM then
        -- Try to fetch from SharedMedia
        local success, path = pcall(LSM.Fetch, LSM, "font", fontName)
        if success and path then
            return path
        end
    end

    -- Fallback to default fonts
    local defaultFonts = {
        ["Friz Quadrata TT"] = "Fonts\\FRIZQT__.TTF",
        ["Arial Narrow"] = "Fonts\\ARIALN.TTF",
        ["Skurri"] = "Fonts\\skurri.ttf",
        ["Morpheus"] = "Fonts\\MORPHEUS.ttf",
    }

    return defaultFonts[fontName] or "Fonts\\FRIZQT__.TTF"
end

-- Function to apply Blizzard combat text setting
local function ApplyBlizzardCombatTextSetting()
    if UsefulStuffDB.disableBlizzardCombatText then
        SetCVar("enableFloatingCombatText", "0")
    else
        SetCVar("enableFloatingCombatText", "1")
    end
end

-- Function to apply Blizzard bag bar setting
local function ApplyBlizzardBagBarSetting()
    if UsefulStuffDB.disableBlizzardBagBar then
        -- Hide the bag bar
        if BagsBar then
            BagsBar:Hide()
            BagsBar:SetAlpha(0)
        end
        if MicroButtonAndBagsBar then
            if MicroButtonAndBagsBar.BagBar then
                MicroButtonAndBagsBar.BagBar:Hide()
                MicroButtonAndBagsBar.BagBar:SetAlpha(0)
            end
        end
        -- Also try to hide individual bag buttons
        for i = 0, 4 do
            local bagButton = _G["CharacterBag"..i.."Slot"]
            if bagButton then
                bagButton:Hide()
            end
        end
        if MainMenuBarBackpackButton then
            MainMenuBarBackpackButton:Hide()
        end
    else
        -- Show the bag bar
        if BagsBar then
            BagsBar:Show()
            BagsBar:SetAlpha(1)
        end
        if MicroButtonAndBagsBar then
            if MicroButtonAndBagsBar.BagBar then
                MicroButtonAndBagsBar.BagBar:Show()
                MicroButtonAndBagsBar.BagBar:SetAlpha(1)
            end
        end
        -- Also show individual bag buttons
        for i = 0, 4 do
            local bagButton = _G["CharacterBag"..i.."Slot"]
            if bagButton then
                bagButton:Show()
            end
        end
        if MainMenuBarBackpackButton then
            MainMenuBarBackpackButton:Show()
        end
    end
end

-- Action Bar Mouseover functionality
local actionBarFrames = {
    MultiBarBottomLeft = "MultiBarBottomLeft",
    MultiBarBottomRight = "MultiBarBottomRight",
    MultiBarRight = "MultiBarRight",
    MultiBarLeft = "MultiBarLeft",
    MultiBar5 = "MultiBar5",
    MultiBar6 = "MultiBar6",
    MultiBar7 = "MultiBar7",
}

local actionBarOriginalAlpha = {}
local actionBarHoverStates = {}

local function ShowActionBar(barName)
    local frameName = actionBarFrames[barName]
    local frame = _G[frameName]
    if frame then
        frame:SetAlpha(actionBarOriginalAlpha[barName] or 1)
    end
end

local function HideActionBar(barName)
    local frameName = actionBarFrames[barName]
    local frame = _G[frameName]
    if frame then
        frame:SetAlpha(0)
    end
end

local function ApplyActionBarMouseover(barName, enable)
    local frameName = actionBarFrames[barName]
    local frame = _G[frameName]

    if not frame then
        return
    end

    if enable then
        -- Store original alpha if not already stored
        if not actionBarOriginalAlpha[barName] then
            actionBarOriginalAlpha[barName] = frame:GetAlpha()
        end

        -- Initialize hover state
        actionBarHoverStates[barName] = false

        -- Set to transparent
        frame:SetAlpha(0)

        -- Add mouseover scripts to the bar frame
        frame:SetScript("OnEnter", function(self)
            actionBarHoverStates[barName] = true
            ShowActionBar(barName)
        end)

        frame:SetScript("OnLeave", function(self)
            actionBarHoverStates[barName] = false
            C_Timer.After(0.1, function()
                if not actionBarHoverStates[barName] then
                    HideActionBar(barName)
                end
            end)
        end)

        -- Also add mouseover to all buttons on the bar
        for i = 1, 12 do
            local button = _G[frameName .. "Button" .. i]
            if button then
                button:HookScript("OnEnter", function(self)
                    actionBarHoverStates[barName] = true
                    ShowActionBar(barName)
                end)
                button:HookScript("OnLeave", function(self)
                    actionBarHoverStates[barName] = false
                    C_Timer.After(0.1, function()
                        if not actionBarHoverStates[barName] then
                            HideActionBar(barName)
                        end
                    end)
                end)
            end
        end
    else
        -- Remove mouseover scripts
        frame:SetScript("OnEnter", nil)
        frame:SetScript("OnLeave", nil)

        -- Restore original alpha
        if actionBarOriginalAlpha[barName] then
            frame:SetAlpha(actionBarOriginalAlpha[barName])
        else
            frame:SetAlpha(1)
        end

        actionBarHoverStates[barName] = nil
    end
end

local function ApplyAllActionBarMouseovers()
    local masterEnabled = UsefulStuffDB.actionBarsMouseover.enabled
    for barName, _ in pairs(actionBarFrames) do
        local enable = masterEnabled and UsefulStuffDB.actionBarsMouseover[barName]
        ApplyActionBarMouseover(barName, enable)
    end
end

-- Create the main frame for the cursor circle
local circleFrame = CreateFrame("Frame", "UsefulStuff_CursorCircle", UIParent)
circleFrame:SetFrameStrata("TOOLTIP")
circleFrame:Hide()

local circleLines = {}

-- Build or rebuild the circle based on current settings
local function BuildCircle()
    -- Clear existing lines
    for _, line in ipairs(circleLines) do
        line:Hide()
        line:SetParent(nil)
    end
    wipe(circleLines)

    local numSegments = 32
    local radius = UsefulStuffDB.circleRadius
    local lineThickness = UsefulStuffDB.lineThickness
    local color = UsefulStuffDB.circleColor

    circleFrame:SetSize(radius * 2, radius * 2)

    for i = 1, numSegments do
        local angle1 = (i - 1) * (2 * math.pi / numSegments)
        local angle2 = i * (2 * math.pi / numSegments)

        local line = circleFrame:CreateTexture(nil, "OVERLAY")
        line:SetTexture("Interface\\Buttons\\WHITE8X8")
        line:SetVertexColor(color.r, color.g, color.b, color.a)

        local x1 = math.cos(angle1) * radius
        local y1 = math.sin(angle1) * radius
        local x2 = math.cos(angle2) * radius
        local y2 = math.sin(angle2) * radius

        local dx = x2 - x1
        local dy = y2 - y1
        local length = math.sqrt(dx * dx + dy * dy)

        line:SetSize(length, lineThickness)
        line:SetPoint("CENTER", circleFrame, "CENTER", (x1 + x2) / 2, (y1 + y2) / 2)

        local angle = math.atan2(dy, dx)
        line:SetRotation(angle)

        table.insert(circleLines, line)
    end
end

-- Track mouse button state
local isRightMouseDown = false

-- Update circle position to follow cursor
circleFrame:SetScript("OnUpdate", function(self)
    if isRightMouseDown then
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x / scale, y / scale)
    end
end)

-- Mouse button detection
local function CheckMouseButton()
    if not UsefulStuffDB or not UsefulStuffDB.cursorCircleEnabled then
        if isRightMouseDown then
            isRightMouseDown = false
            circleFrame:Hide()
        end
        return
    end
    if IsMouseButtonDown("RightButton") then
        if not isRightMouseDown then
            isRightMouseDown = true
            circleFrame:Show()
        end
    else
        if isRightMouseDown then
            isRightMouseDown = false
            circleFrame:Hide()
        end
    end
end

-- Continuous checking for mouse button state
local checkFrame = CreateFrame("Frame")
checkFrame:SetScript("OnUpdate", function(self, elapsed)
    CheckMouseButton()
end)

-- Combat Text Frame
local combatTextFrame = CreateFrame("Frame", "UsefulStuff_CombatText", UIParent)
combatTextFrame:SetSize(400, 100)
combatTextFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
combatTextFrame:SetFrameStrata("HIGH")
combatTextFrame:Hide()

local combatText = combatTextFrame:CreateFontString(nil, "OVERLAY")
combatText:SetPoint("CENTER")
combatText:SetJustifyH("CENTER")

-- Animation for combat text
local animGroup = combatTextFrame:CreateAnimationGroup()
local translate = animGroup:CreateAnimation("Translation")
translate:SetOffset(0, 100)
translate:SetDuration(1.5)
translate:SetSmoothing("OUT")

local alpha = animGroup:CreateAnimation("Alpha")
alpha:SetFromAlpha(1)
alpha:SetToAlpha(0)
alpha:SetDuration(1.5)
alpha:SetSmoothing("OUT")

animGroup:SetScript("OnFinished", function()
    combatTextFrame:Hide()
end)

-- Function to show combat text
local function ShowCombatText(text)
    if not UsefulStuffDB.combatTextEnabled then return end
    combatTextFrame:ClearAllPoints()
    combatTextFrame:SetPoint("CENTER", UIParent, "CENTER", UsefulStuffDB.combatTextX, UsefulStuffDB.combatTextY)

    local fontPath = GetFontPath(UsefulStuffDB.globalFont)
    combatText:SetFont(fontPath, UsefulStuffDB.combatTextSize, "OUTLINE")
    combatText:SetText(text)

    combatTextFrame:SetAlpha(1)
    combatTextFrame:Show()

    animGroup:Stop()
    animGroup:Play()
end

-- Combat events
local combatEventFrame = CreateFrame("Frame")
combatEventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
combatEventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
combatEventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ShowCombatText(UsefulStuffDB.combatTextEnter)
    elseif event == "PLAYER_REGEN_ENABLED" then
        ShowCombatText(UsefulStuffDB.combatTextLeave)
    end
end)

-- Combat Timer
local combatTimerFrame = CreateFrame("Frame", "UsefulStuff_CombatTimer", UIParent, "BackdropTemplate")
combatTimerFrame:SetSize(80, 30)
combatTimerFrame:SetFrameStrata("MEDIUM")
combatTimerFrame:Hide()

local combatTimerText = combatTimerFrame:CreateFontString(nil, "OVERLAY")
combatTimerText:SetPoint("CENTER")
combatTimerText:SetJustifyH("CENTER")

local combatStartTime = 0
local combatTimerUpdateFrame = CreateFrame("Frame")

-- Function to find and anchor to player unit frame
local function AnchorCombatTimer()
    combatTimerFrame:ClearAllPoints()

    local settings = UsefulStuffDB.combatTimer
    local frameName = settings.anchorFrame
    local targetFrame = nil

    -- Auto detection
    if frameName == "AUTO" then
        -- Try common unit frame addons in order
        local autoFrames = {
            "ElvUF_Player",
            "oUF_Unhalted_Player",
            "UnhaltedPlayer",
            "SUFUnitplayer",
            "PlayerFrame"
        }

        for _, name in ipairs(autoFrames) do
            local frame = _G[name]
            if frame and frame:IsShown() then
                targetFrame = frame
                break
            end
        end

        -- Fallback to PlayerFrame if nothing found
        if not targetFrame and PlayerFrame then
            targetFrame = PlayerFrame
        end
    else
        -- Try to find the specified frame
        targetFrame = _G[frameName]
    end

    -- Anchor to found frame or fallback to center
    if targetFrame then
        combatTimerFrame:SetPoint(
            settings.anchorPoint,
            targetFrame,
            settings.anchorRelativePoint,
            settings.anchorOffsetX,
            settings.anchorOffsetY
        )
    else
        -- Fallback: center of screen
        combatTimerFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
    end
end

-- Function to update combat timer appearance
local function UpdateCombatTimerAppearance()
    local settings = UsefulStuffDB.combatTimer

    -- Update backdrop
    combatTimerFrame:SetBackdrop({
        bgFile = settings.bgTexture,
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        tile = false,
        tileSize = 0,
        edgeSize = settings.borderSize,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
    combatTimerFrame:SetBackdropColor(0, 0, 0, 0.7)

    local borderColor = settings.borderColor
    combatTimerFrame:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)

    -- Update font
    local fontPath = GetFontPath(UsefulStuffDB.globalFont)
    combatTimerText:SetFont(fontPath, settings.fontSize, "OUTLINE")
end

-- Function to show/hide combat timer
local function SetCombatTimerVisible(visible)
    if not UsefulStuffDB.combatTimer.enabled then
        combatTimerFrame:Hide()
        return
    end

    if visible then
        AnchorCombatTimer()
        UpdateCombatTimerAppearance()
        combatTimerFrame:Show()
    else
        combatTimerFrame:Hide()
    end
end

-- Update timer display
combatTimerUpdateFrame:SetScript("OnUpdate", function(self, elapsed)
    if combatTimerFrame:IsShown() then
        local elapsedTime = GetTime() - combatStartTime
        local minutes = math.floor(elapsedTime / 60)
        local seconds = math.floor(elapsedTime % 60)
        combatTimerText:SetText(string.format("%d:%02d", minutes, seconds))
    end
end)

-- Hook into combat events for timer
combatEventFrame:HookScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        combatStartTime = GetTime()
        SetCombatTimerVisible(true)
    elseif event == "PLAYER_REGEN_ENABLED" then
        SetCombatTimerVisible(false)
    end
end)

-- Auto Combat Logging
local isLoggingActive = false
local currentInstanceType = nil

local function StartCombatLogging()
    if not isLoggingActive then
        SetCVar("advancedCombatLogging", "1")
        LoggingCombat(true)
        isLoggingActive = true
        print("|cFF00FF00UsefulStuff:|r Combat logging started")
    end
end

local function StopCombatLogging()
    if isLoggingActive then
        LoggingCombat(false)
        isLoggingActive = false
        print("|cFF00FF00UsefulStuff:|r Combat logging stopped")
    end
end

local function ShouldLogCurrentContent()
    local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceID, instanceGroupSize, lfgDungeonID = GetInstanceInfo()

    if not instanceType or instanceType == "none" then
        return false
    end

    local settings = UsefulStuffDB.autoLogging
    if not settings.enabled then
        return false
    end

    -- Mythic+ Dungeons (Challenge Mode)
    if instanceType == "party" and C_ChallengeMode.IsChallengeModeActive() then
        return settings.dungeonsMythicPlus
    end

    -- Raids
    if instanceType == "raid" then
        -- 16 = Mythic, 15 = Heroic, 14 = Normal, 17 = LFR
        if difficultyID == 16 then
            return settings.raidMythic
        elseif difficultyID == 15 then
            return settings.raidHeroic
        elseif difficultyID == 14 then
            return settings.raidNormal
        elseif difficultyID == 17 then
            return settings.raidFinder
        end
    end

    -- Arena
    if instanceType == "arena" then
        return settings.arena
    end

    -- Scenarios
    if instanceType == "scenario" then
        return settings.scenarios
    end

    return false
end

local function CheckAndUpdateLogging()
    if ShouldLogCurrentContent() then
        StartCombatLogging()
        currentInstanceType = select(2, GetInstanceInfo())
    else
        if currentInstanceType then
            StopCombatLogging()
            currentInstanceType = nil
        end
    end
end

-- Auto Logging Event Handler
local autoLoggingFrame = CreateFrame("Frame")
autoLoggingFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
autoLoggingFrame:RegisterEvent("CHALLENGE_MODE_START")
autoLoggingFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
autoLoggingFrame:RegisterEvent("ENCOUNTER_START")
autoLoggingFrame:RegisterEvent("ENCOUNTER_END")
autoLoggingFrame:SetScript("OnEvent", function(self, event)
    CheckAndUpdateLogging()
end)

-- Gateway Control Shard Detection
local GATEWAY_SPELL_ID = 188152
local gatewayActionId = nil

local gatewayFrame = CreateFrame("Frame", "UsefulStuff_GatewayText", UIParent)
gatewayFrame:SetSize(400, 50)
gatewayFrame:SetFrameStrata("HIGH")
gatewayFrame:Hide()

local gatewayText = gatewayFrame:CreateFontString(nil, "OVERLAY")
gatewayText:SetPoint("CENTER")
gatewayText:SetJustifyH("CENTER")

local function GetGatewayActionId()
    for i = 1, 200 do
        local actionType, id = GetActionInfo(i)
        if id == GATEWAY_SPELL_ID then
            gatewayActionId = i
            return
        end
    end
    gatewayActionId = nil
end

local function UpdateGatewayDisplay()
    if not UsefulStuffDB or not UsefulStuffDB.gateway.enabled then
        gatewayFrame:Hide()
        return
    end

    local settings = UsefulStuffDB.gateway
    local fontPath = GetFontPath(UsefulStuffDB.globalFont)
    gatewayText:SetFont(fontPath, settings.fontSize, "OUTLINE")

    gatewayFrame:ClearAllPoints()
    gatewayFrame:SetPoint("CENTER", UIParent, "CENTER", settings.x, settings.y)

    if gatewayActionId == nil then
        gatewayText:SetText(settings.missingText)
        gatewayText:SetTextColor(1, 0.3, 0.3, 1)
        gatewayFrame:Show()
    elseif IsUsableAction(gatewayActionId) then
        gatewayText:SetText(settings.text)
        gatewayText:SetTextColor(0, 1, 0, 1)
        gatewayFrame:Show()
    else
        gatewayFrame:Hide()
    end
end

local gatewayEventFrame = CreateFrame("Frame")
gatewayEventFrame:RegisterEvent("ACTIONBAR_UPDATE_USABLE")
gatewayEventFrame:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
gatewayEventFrame:SetScript("OnEvent", function(self, event)
    if event == "ACTIONBAR_SLOT_CHANGED" then
        GetGatewayActionId()
    end
    UpdateGatewayDisplay()
end)

local function InitGateway()
    GetGatewayActionId()
    UpdateGatewayDisplay()
end

-- Lust Tracker
local lustLastHaste = nil
local lustExpirationTime = 0

local lustFrame = CreateFrame("Frame", "UsefulStuff_LustTracker", UIParent)
lustFrame:SetFrameStrata("HIGH")
lustFrame:Hide()

local lustIcon = lustFrame:CreateTexture(nil, "BACKGROUND")
lustIcon:SetAllPoints()

local lustTimerText = lustFrame:CreateFontString(nil, "OVERLAY")
lustTimerText:SetPoint("CENTER", lustFrame, "CENTER", 0, 0)
lustTimerText:SetJustifyH("CENTER")

local function UpdateLustTrackerAppearance()
    local settings = UsefulStuffDB.lustTracker
    local size = settings.iconSize
    lustFrame:SetSize(size, size)
    lustFrame:ClearAllPoints()
    lustFrame:SetPoint("CENTER", UIParent, "CENTER", settings.x, settings.y)
    lustIcon:SetTexture(settings.iconId)
    local fontPath = GetFontPath(UsefulStuffDB.globalFont)
    lustTimerText:SetFont(fontPath, settings.fontSize, "OUTLINE")
end

lustFrame:SetScript("OnUpdate", function(self, elapsed)
    local remaining = lustExpirationTime - GetTime()
    if remaining <= 0 then
        self:Hide()
        return
    end
    lustTimerText:SetText(string.format("%.1f", remaining))
end)

local lustEventFrame = CreateFrame("Frame")
lustEventFrame:RegisterEvent("UNIT_SPELL_HASTE")
lustEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
lustEventFrame:SetScript("OnEvent", function(self, event, ...)
    if not UsefulStuffDB or not UsefulStuffDB.lustTracker.enabled then
        lustFrame:Hide()
        return
    end

    local now = GetHaste() + 100
    if not lustLastHaste then
        lustLastHaste = now
        return
    end

    local lustValue = lustLastHaste * 1.3
    local diff = now - lustValue
    if diff > -0.2 and diff < 0.2 then
        lustExpirationTime = GetTime() + 40
        UpdateLustTrackerAppearance()
        lustFrame:Show()
    end
    lustLastHaste = now
end)

local function InitLustTracker()
    lustLastHaste = GetHaste() + 100
    UpdateLustTrackerAppearance()
end

-- ============================================================
-- Buff Stack Tracker (native AuraContainer - the EUI approach)
--
-- Earlier version called C_UnitAuras.GetUnitAuraBySpellID from plain addon
-- Lua on a timer/event - confirmed NOT reliable in combat (12.1 auras-secret
-- content denies even a single-spellID read back to addon code in practice).
--
-- EllesmereUI's AuraBars don't hit that wall because they never read the
-- value into Lua at all: they create Blizzard's own native
-- CreateFrame("AuraContainer", ..., "CustomAuraContainerTemplate") widget
-- (shipped with the client since 12.1 - see EllesmereUI_AuraKit.lua, and the
-- same template is used by DBM, Plater, MiniAuras, BuffReminders, etc.), add
-- an aura group filtered to one spell ID, and call
-- button:SetApplicationCount(fontString) EXACTLY ONCE when the button is
-- created. From then on Blizzard's own trusted code keeps that fontstring's
-- text updated directly - including while auras are secret - because the
-- addon never touches the number again. Any later Lua write into that button
-- subtree is what gets denied in combat, so this only ever writes to it once,
-- at creation, before that lockdown applies.
-- ============================================================
local buffTrackerAnchors = {}  -- [id] = draggable anchor frame (holds the container)
local buffTrackerPending = {}  -- [id] = entry, build was denied (combat lockdown), retry later

-- Blizzard reports a plain (non-stacking) buff as 0 applications, so the
-- fontstring bound via SetApplicationCount literally reads "0" while the buff
-- is up but not stacked - we can't tell that apart from "no extra stacks yet"
-- because the value stays secret; we never get to read it ourselves to
-- decide. The same textFormatter mechanism SetDurationText uses (a
-- NumericRuleFormatter evaluated engine-side, so the raw number never has to
-- reach addon Lua) lets us render blank for 0-1 and the real count from 2
-- up, without ever seeing the value: this is Blizzard's own code deciding,
-- not ours. Built once and cached; nil means "not supported on this client",
-- in which case SetApplicationCount falls back to its default behavior.
local buffTrackerAppFormatter -- nil = not yet tried, false = tried and unsupported
local function GetBuffTrackerAppFormatter()
    if buffTrackerAppFormatter == nil then
        local formatter = false
        if C_StringUtil and C_StringUtil.CreateNumericRuleFormatter and Enum.NumericRuleFormatRounding then
            local f = C_StringUtil.CreateNumericRuleFormatter()
            local ok = pcall(f.SetBreakpoints, f, {
                { threshold = 0, format = "",   step = 1, rounding = Enum.NumericRuleFormatRounding.Down },
                { threshold = 2, format = "%d", step = 1, rounding = Enum.NumericRuleFormatRounding.Down },
            })
            if ok then formatter = f end
        end
        buffTrackerAppFormatter = formatter
    end
    return buffTrackerAppFormatter or nil
end

local function ApplyBuffTrackerLockState(entry)
    local anchor = buffTrackerAnchors[entry.id]
    if not anchor then return end
    anchor:EnableMouse(not entry.locked)
    -- The placeholder is OUR OWN plain fontstring (never bound via
    -- SetApplicationCount), so freely showing/hiding it is always safe, even
    -- in combat - unlike the real button's text once Blizzard owns it.
    if anchor.placeholder then
        anchor.placeholder:SetShown(not entry.locked)
    end
end

-- Builds (or rebuilds) the anchor + AuraContainer for one entry. Called at
-- login, on Add, and whenever font/size changes (simplest safe way to change
-- the display: it changes the button, so it is recreated rather than
-- mutated). Frame/AddAuraGroup creation can be denied while InCombatLockdown,
-- so this is pcall-wrapped and queued for retry via buffTrackerPending.
local function BuildBuffTrackerEntry(entry)
    local old = buffTrackerAnchors[entry.id]
    if old then
        old:Hide()
        old:SetParent(nil)
        buffTrackerAnchors[entry.id] = nil
    end

    local ok = pcall(function()
        local anchor = CreateFrame("Frame", "UsefulStuffBuffTrackerAnchor" .. entry.id, UIParent)
        anchor:SetSize(math.max(40, entry.fontSize * 3), entry.fontSize + 10)
        anchor:SetFrameStrata("MEDIUM")
        anchor:SetMovable(true)
        anchor:SetClampedToScreen(true)
        anchor:RegisterForDrag("LeftButton")
        anchor:ClearAllPoints()
        anchor:SetPoint("CENTER", UIParent, "CENTER", entry.x, entry.y)

        local fontPath = GetFontPath(UsefulStuffDB.globalFont)
        local c = entry.color or {r = 1, g = 1, b = 1, a = 1}

        -- Positioning aid only, shown while unlocked: the real display (below)
        -- only exists while the buff is actually up, so without this there
        -- would be nothing to grab and drag when the buff is inactive. Uses a
        -- dot, not a number, so it is never mistaken for a real stack count.
        local placeholder = anchor:CreateFontString(nil, "OVERLAY")
        placeholder:SetPoint("CENTER")
        placeholder:SetFont(fontPath, entry.fontSize, "OUTLINE")
        placeholder:SetTextColor(c.r, c.g, c.b, 0.4)
        placeholder:SetText("•")
        placeholder:Hide()
        anchor.placeholder = placeholder

        anchor:SetScript("OnDragStart", function(self)
            if not entry.locked then
                self:StartMoving()
            end
        end)
        anchor:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local _, _, _, x, y = self:GetPoint()
            entry.x = math.floor(x + 0.5)
            entry.y = math.floor(y + 0.5)
        end)

        local container = CreateFrame("AuraContainer", nil, anchor, "CustomAuraContainerTemplate")
        container:SetPoint("CENTER", anchor, "CENTER", 0, 0)
        container:SetSize(1, 1)
        container:AddAuraGroup("stack", "HELPFUL", {
            maxFrameCount = 1,
            candidateFilters = { includeSpellIDs = { [entry.spellID] = true } },
            initializeFrame = function(button)
                button:EnableMouse(false)
                local width = math.max(20, entry.fontSize * 2) * (entry.showDuration and 2 or 1)
                button:SetSize(width, entry.fontSize + 6)

                local stackText = button:CreateFontString(nil, "OVERLAY")
                stackText:SetJustifyH("CENTER")
                -- Must be styled BEFORE SetApplicationCount/SetDurationText:
                -- those calls fire an immediate SetText, and an unstyled
                -- (fontless) fontstring hard-errors inside the engine.
                stackText:SetFont(fontPath, entry.fontSize, "OUTLINE")
                stackText:SetTextColor(c.r, c.g, c.b, c.a)

                local durationText
                if entry.showDuration then
                    durationText = button:CreateFontString(nil, "OVERLAY")
                    durationText:SetJustifyH("CENTER")
                    durationText:SetFont(fontPath, entry.fontSize, "OUTLINE")
                    durationText:SetTextColor(c.r, c.g, c.b, c.a)
                end

                if durationText then
                    -- "duration_stacks": Duration - Stacks (duration on the
                    -- left). Anything else ("stacks_duration", the default):
                    -- Stacks - Duration.
                    if entry.layout == "duration_stacks" then
                        durationText:SetPoint("RIGHT", button, "CENTER", -3, 0)
                        stackText:SetPoint("LEFT", button, "CENTER", 3, 0)
                    else
                        stackText:SetPoint("RIGHT", button, "CENTER", -3, 0)
                        durationText:SetPoint("LEFT", button, "CENTER", 3, 0)
                    end
                else
                    stackText:SetPoint("CENTER", button, "CENTER", 0, 0)
                end

                local formatter = GetBuffTrackerAppFormatter()
                local bound = formatter and pcall(button.SetApplicationCount, button, stackText, { textFormatter = formatter })
                if not bound then
                    -- Formatter unsupported on this client: fall back to
                    -- Blizzard's raw count (may show "0" for a 1-instance,
                    -- non-stacking buff - see comment above).
                    button:SetApplicationCount(stackText)
                end

                if durationText then
                    button:SetDurationText(durationText)
                end
            end,
        })
        container:SetUnit("player")
        container:UpdateAllAuras()
        anchor.container = container

        buffTrackerAnchors[entry.id] = anchor
    end)

    if ok then
        buffTrackerPending[entry.id] = nil
        ApplyBuffTrackerLockState(entry)
    else
        buffTrackerPending[entry.id] = entry
    end
    return ok
end

local function RetryPendingBuffTrackers()
    if not next(buffTrackerPending) then return end
    local retry = buffTrackerPending
    buffTrackerPending = {}
    for _, entry in pairs(retry) do
        BuildBuffTrackerEntry(entry)
    end
end

local buffTrackerLiftWatcher = CreateFrame("Frame")
buffTrackerLiftWatcher:RegisterEvent("PLAYER_REGEN_ENABLED")
buffTrackerLiftWatcher:RegisterEvent("ENCOUNTER_END")
buffTrackerLiftWatcher:RegisterEvent("PLAYER_ENTERING_WORLD")
buffTrackerLiftWatcher:SetScript("OnEvent", RetryPendingBuffTrackers)

local function AddBuffTracker(spellID)
    spellID = tonumber(spellID)
    if not spellID or spellID <= 0 then return nil end

    local db = UsefulStuffDB.buffTrackers
    local entry = {
        id = db.nextId,
        spellID = spellID,
        x = 0,
        y = 0,
        fontSize = 24,
        color = {r = 1, g = 1, b = 1, a = 1},
        locked = false, -- start unlocked so there's something visible to drag right away
        showDuration = false,
        layout = "stacks_duration", -- or "duration_stacks"
    }
    db.nextId = db.nextId + 1
    table.insert(db.list, entry)
    if UsefulStuffDB.buffTrackers.enabled then
        BuildBuffTrackerEntry(entry)
    end
    return entry
end

local function RemoveBuffTracker(id)
    local db = UsefulStuffDB.buffTrackers
    for i, entry in ipairs(db.list) do
        if entry.id == id then
            local anchor = buffTrackerAnchors[id]
            if anchor then
                anchor:Hide()
                anchor:SetParent(nil)
                buffTrackerAnchors[id] = nil
            end
            buffTrackerPending[id] = nil
            table.remove(db.list, i)
            return true
        end
    end
    return false
end

local function SetBuffTrackersEnabled(enabled)
    UsefulStuffDB.buffTrackers.enabled = enabled
    if enabled then
        for _, entry in ipairs(UsefulStuffDB.buffTrackers.list) do
            if not buffTrackerAnchors[entry.id] then
                BuildBuffTrackerEntry(entry)
            end
        end
    else
        for _, anchor in pairs(buffTrackerAnchors) do
            anchor:Hide()
        end
    end
end

local function InitBuffTrackers()
    if not UsefulStuffDB.buffTrackers.enabled then return end
    for _, entry in ipairs(UsefulStuffDB.buffTrackers.list) do
        BuildBuffTrackerEntry(entry)
    end
end

local UsefulStuffFrame -- set by CreateSettingsPanel; used by the slash command / launcher button

local function ToggleUsefulStuffFrame()
    if not UsefulStuffFrame then return end
    if UsefulStuffFrame:IsShown() then
        UsefulStuffFrame:Hide()
    else
        UsefulStuffFrame:Show()
    end
end

-- Create settings panel: a standalone, movable window (EllesmereUI-style: a
-- left sidebar listing every module with its own on/off toggle - greyed out
-- label when off - and the selected module's settings on the right), rather
-- than an inline Blizzard AddOns-list canvas.
local function CreateSettingsPanel()
    local mainFrame = CreateFrame("Frame", "UsefulStuffMainFrame", UIParent, "BackdropTemplate")
    mainFrame:SetSize(860, 560)
    mainFrame:SetPoint("CENTER")
    mainFrame:SetFrameStrata("HIGH")
    mainFrame:SetMovable(true)
    mainFrame:EnableMouse(true)
    mainFrame:SetClampedToScreen(true)
    mainFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    mainFrame:SetBackdropColor(0.04, 0.04, 0.05, 0.97)
    mainFrame:SetBackdropBorderColor(0.16, 0.16, 0.18, 1)
    mainFrame:Hide()
    -- Deliberately NOT added to UISpecialFrames: that ties this frame into
    -- Blizzard's "close special windows" cascade, which also fires when the
    -- Settings/AddOns panel itself is closed - so opening us from that
    -- panel's launcher button and then closing the panel closed us too.
    UsefulStuffFrame = mainFrame

    -- Title bar: drag anywhere on it to move the whole window
    local titleBar = CreateFrame("Frame", nil, mainFrame)
    titleBar:SetHeight(36)
    titleBar:SetPoint("TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", 0, 0)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function() mainFrame:StartMoving() end)
    titleBar:SetScript("OnDragStop", function() mainFrame:StopMovingOrSizing() end)

    local titleBg = titleBar:CreateTexture(nil, "BACKGROUND")
    titleBg:SetAllPoints()
    titleBg:SetColorTexture(0.08, 0.09, 0.1, 1)

    local title = titleBar:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("LEFT", 16, 0)
    title:SetText("UsefulStuff")

    local closeButton = CreateFrame("Button", nil, mainFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", -4, -4)
    closeButton:SetScript("OnClick", function() mainFrame:Hide() end)

    -- Sidebar: one row per module
    local SIDEBAR_WIDTH = 190
    local sidebar = CreateFrame("Frame", nil, mainFrame)
    sidebar:SetWidth(SIDEBAR_WIDTH)
    sidebar:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 0, 0)
    sidebar:SetPoint("BOTTOMLEFT", mainFrame, "BOTTOMLEFT", 0, 0)

    local sidebarBg = sidebar:CreateTexture(nil, "BACKGROUND")
    sidebarBg:SetAllPoints()
    sidebarBg:SetColorTexture(0.065, 0.065, 0.075, 1)

    local sidebarDivider = mainFrame:CreateTexture(nil, "ARTWORK")
    sidebarDivider:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 0, 0)
    sidebarDivider:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMRIGHT", 0, 0)
    sidebarDivider:SetWidth(1)
    sidebarDivider:SetColorTexture(0.2, 0.2, 0.23, 1)

    -- Content area: every module panel below anchors into THIS (kept named
    -- "panel" so the existing per-tab panel code further down - which
    -- anchors to `panel` - needs no changes beyond its own top-left point).
    local panel = CreateFrame("Frame", "UsefulStuffOptionsPanel", mainFrame)
    panel:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 0, 0)
    panel:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", 0, 0)

    local tabs = {}
    local tabPanels = {}
    local selectedIndex = 1

    local function SelectTab(id)
        selectedIndex = id
        for i, row in ipairs(tabs) do
            if row.RefreshVisual then row.RefreshVisual(i == id) end
            if tabPanels[i] then
                if i == id then tabPanels[i]:Show() else tabPanels[i]:Hide() end
            end
        end
    end

    -- One entry per module panel below, in the same order they get inserted
    -- into tabPanels (General, Cursor Circle, Combat Text, Action Bars,
    -- Combat Timer, Auto Logging, Gateway, Lust Tracker, Buff Tracker).
    -- isEnabled/setEnabled are omitted for General: it holds only sub-toggles
    -- of its own (bag bar, chat font), not a single master switch.
    local MODULES = {
        { label = "General" },
        { label = "Cursor Circle",
            isEnabled = function() return UsefulStuffDB.cursorCircleEnabled end,
            setEnabled = function(v) UsefulStuffDB.cursorCircleEnabled = v end },
        { label = "Combat Text",
            isEnabled = function() return UsefulStuffDB.combatTextEnabled end,
            setEnabled = function(v) UsefulStuffDB.combatTextEnabled = v end },
        { label = "Action Bars",
            isEnabled = function() return UsefulStuffDB.actionBarsMouseover.enabled end,
            setEnabled = function(v)
                UsefulStuffDB.actionBarsMouseover.enabled = v
                ApplyAllActionBarMouseovers()
            end },
        { label = "Combat Timer",
            isEnabled = function() return UsefulStuffDB.combatTimer.enabled end,
            setEnabled = function(v) UsefulStuffDB.combatTimer.enabled = v end },
        { label = "Auto Logging",
            isEnabled = function() return UsefulStuffDB.autoLogging.enabled end,
            setEnabled = function(v) UsefulStuffDB.autoLogging.enabled = v end },
        { label = "Gateway",
            isEnabled = function() return UsefulStuffDB.gateway.enabled end,
            setEnabled = function(v)
                UsefulStuffDB.gateway.enabled = v
                UpdateGatewayDisplay()
            end },
        { label = "Lust Tracker",
            isEnabled = function() return UsefulStuffDB.lustTracker.enabled end,
            setEnabled = function(v)
                UsefulStuffDB.lustTracker.enabled = v
                if not v then lustFrame:Hide() end
            end },
        { label = "Buff Tracker",
            isEnabled = function() return UsefulStuffDB.buffTrackers.enabled end,
            setEnabled = function(v) SetBuffTrackersEnabled(v) end },
    }

    local ROW_HEIGHT = 34
    local LABEL_ON = { 0.92, 0.92, 0.94 }
    local LABEL_OFF = { 0.45, 0.45, 0.48 }

    for i, mod in ipairs(MODULES) do
        local row = CreateFrame("Button", nil, sidebar)
        row:SetHeight(ROW_HEIGHT)
        row:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 0, -10 - (i - 1) * ROW_HEIGHT)
        row:SetPoint("RIGHT", sidebar, "RIGHT", 0, 0)

        local rowBg = row:CreateTexture(nil, "BACKGROUND")
        rowBg:SetAllPoints()
        rowBg:SetColorTexture(1, 1, 1, 0)

        local accent = row:CreateTexture(nil, "ARTWORK")
        accent:SetPoint("TOPLEFT", 0, 0)
        accent:SetPoint("BOTTOMLEFT", 0, 0)
        accent:SetWidth(3)
        accent:SetColorTexture(0.16, 0.82, 0.62, 1)
        accent:Hide()

        local label = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        label:SetPoint("LEFT", 14, 0)
        label:SetText(mod.label)

        local toggle
        if mod.isEnabled then
            toggle = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            toggle:SetSize(44, 20)
            toggle:SetPoint("RIGHT", -10, 0)
        else
            label:SetPoint("RIGHT", -10, 0)
        end

        local function Refresh(selected)
            local enabled = (not mod.isEnabled) or mod.isEnabled()
            local c = enabled and LABEL_ON or LABEL_OFF
            label:SetTextColor(c[1], c[2], c[3])
            if toggle then
                toggle:SetText(enabled and "ON" or "OFF")
            end
            if selected then
                rowBg:SetColorTexture(1, 1, 1, 0.06)
                accent:Show()
            else
                rowBg:SetColorTexture(1, 1, 1, 0)
                accent:Hide()
            end
        end
        row.RefreshVisual = Refresh

        row:SetScript("OnClick", function() SelectTab(i) end)
        row:SetScript("OnEnter", function()
            if selectedIndex ~= i then rowBg:SetColorTexture(1, 1, 1, 0.03) end
        end)
        row:SetScript("OnLeave", function() Refresh(selectedIndex == i) end)

        if toggle then
            toggle:SetScript("OnClick", function()
                mod.setEnabled(not mod.isEnabled())
                Refresh(selectedIndex == i)
            end)
        end

        Refresh(false)
        table.insert(tabs, row)
    end

    -- Panel 1: General Settings
    local generalScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    generalScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    generalScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    generalScroll:Hide()
    local generalPanel = CreateFrame("Frame", nil, generalScroll)
    generalPanel:SetSize(600, 900)
    generalScroll:SetScrollChild(generalPanel)
    table.insert(tabPanels, generalScroll)

    -- Disable Blizzard Bag Bar Checkbox
    local disableBagBarCheckbox = CreateFrame("CheckButton", "UsefulStuffDisableBagBarCheckbox", generalPanel, "UICheckButtonTemplate")
    disableBagBarCheckbox:SetPoint("TOPLEFT", 0, -10)
    disableBagBarCheckbox:SetSize(24, 24)
    disableBagBarCheckbox:SetChecked(UsefulStuffDB.disableBlizzardBagBar)

    local disableBagBarLabel = generalPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    disableBagBarLabel:SetPoint("LEFT", disableBagBarCheckbox, "RIGHT", 5, 0)
    disableBagBarLabel:SetText("Disable Blizzard Bag Bar")

    disableBagBarCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.disableBlizzardBagBar = self:GetChecked()
        ApplyBlizzardBagBarSetting()
    end)

    -- Font Section: one global font used by every module below (Combat Text,
    -- Combat Timer, Gateway, Lust Tracker, Buff Tracker). Each module keeps
    -- its own font SIZE setting; only the face is shared.
    local fontTitle = generalPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    fontTitle:SetPoint("TOPLEFT", disableBagBarCheckbox, "BOTTOMLEFT", 0, -25)
    fontTitle:SetText("Font")

    local fontDesc = generalPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    fontDesc:SetPoint("TOPLEFT", fontTitle, "BOTTOMLEFT", 0, -5)
    fontDesc:SetWidth(560)
    fontDesc:SetJustifyH("LEFT")
    fontDesc:SetText("Used by every module below. Each module still has its own font size setting.")

    local fontLabel = generalPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fontLabel:SetPoint("TOPLEFT", fontDesc, "BOTTOMLEFT", 0, -15)
    fontLabel:SetText("Font:")

    local fontDropdown = CreateFrame("Frame", "UsefulStuffGlobalFontDropdown", generalPanel, "UIDropDownMenuTemplate")
    fontDropdown:SetPoint("TOPLEFT", fontLabel, "BOTTOMLEFT", -15, -5)

    UIDropDownMenu_SetWidth(fontDropdown, 150)
    UIDropDownMenu_Initialize(fontDropdown, function(self, level)
        local fonts = {}
        if LSM then
            for _, fontName in pairs(LSM:List("font")) do
                table.insert(fonts, fontName)
            end
            table.sort(fonts)
        else
            fonts = {"Friz Quadrata TT", "Arial Narrow", "Skurri", "Morpheus"}
        end

        for i, fontName in ipairs(fonts) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = fontName
            info.func = function()
                UsefulStuffDB.globalFont = fontName
                UIDropDownMenu_SetText(fontDropdown, fontName)
                UpdateCombatTimerAppearance()
                UpdateGatewayDisplay()
                UpdateLustTrackerAppearance()
                if UsefulStuffDB.buffTrackers.enabled then
                    for _, entry in ipairs(UsefulStuffDB.buffTrackers.list) do
                        BuildBuffTrackerEntry(entry)
                    end
                end
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    UIDropDownMenu_SetText(fontDropdown, UsefulStuffDB.globalFont)

    -- Panel 2: Cursor Circle Settings
    local circleScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    circleScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    circleScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    circleScroll:Hide()
    local circlePanel = CreateFrame("Frame", nil, circleScroll)
    circlePanel:SetSize(600, 900)
    circleScroll:SetScrollChild(circlePanel)
    table.insert(tabPanels, circleScroll)

    -- Enable Cursor Circle Checkbox
    local enableCircleCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableCircleCheckbox", circlePanel, "UICheckButtonTemplate")
    enableCircleCheckbox:SetPoint("TOPLEFT", 0, -10)
    enableCircleCheckbox:SetSize(24, 24)
    enableCircleCheckbox:SetChecked(UsefulStuffDB.cursorCircleEnabled)

    local enableCircleLabel = circlePanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableCircleLabel:SetPoint("LEFT", enableCircleCheckbox, "RIGHT", 5, 0)
    enableCircleLabel:SetText("Enable Cursor Circle")

    enableCircleCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.cursorCircleEnabled = self:GetChecked()
    end)

    -- Circle Size Slider
    local sizeSlider = CreateFrame("Slider", "UsefulStuffSizeSlider", circlePanel, "OptionsSliderTemplate")
    sizeSlider:SetPoint("TOPLEFT", enableCircleCheckbox, "BOTTOMLEFT", 0, -30)
    sizeSlider:SetMinMaxValues(20, 150)
    sizeSlider:SetValue(UsefulStuffDB.circleRadius)
    sizeSlider:SetValueStep(5)
    sizeSlider:SetObeyStepOnDrag(true)
    sizeSlider:SetWidth(200)
    _G[sizeSlider:GetName() .. "Low"]:SetText("20")
    _G[sizeSlider:GetName() .. "High"]:SetText("150")
    _G[sizeSlider:GetName() .. "Text"]:SetText("Circle Size: " .. UsefulStuffDB.circleRadius)
    sizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 5) * 5
        UsefulStuffDB.circleRadius = value
        _G[self:GetName() .. "Text"]:SetText("Circle Size: " .. value)
        BuildCircle()
    end)

    -- Line Thickness Slider
    local thicknessSlider = CreateFrame("Slider", "UsefulStuffThicknessSlider", circlePanel, "OptionsSliderTemplate")
    thicknessSlider:SetPoint("TOPLEFT", sizeSlider, "BOTTOMLEFT", 0, -40)
    thicknessSlider:SetMinMaxValues(1, 5)
    thicknessSlider:SetValue(UsefulStuffDB.lineThickness)
    thicknessSlider:SetValueStep(0.5)
    thicknessSlider:SetObeyStepOnDrag(true)
    thicknessSlider:SetWidth(200)
    _G[thicknessSlider:GetName() .. "Low"]:SetText("1")
    _G[thicknessSlider:GetName() .. "High"]:SetText("5")
    _G[thicknessSlider:GetName() .. "Text"]:SetText("Line Thickness: " .. UsefulStuffDB.lineThickness)
    thicknessSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 0.5) * 0.5
        UsefulStuffDB.lineThickness = value
        _G[self:GetName() .. "Text"]:SetText("Line Thickness: " .. value)
        BuildCircle()
    end)

    -- Color Picker Button
    local colorLabel = circlePanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    colorLabel:SetPoint("TOPLEFT", thicknessSlider, "BOTTOMLEFT", 0, -40)
    colorLabel:SetText("Circle Color:")

    local colorButton = CreateFrame("Button", "UsefulStuffColorButton", circlePanel, "UIPanelButtonTemplate")
    colorButton:SetPoint("TOPLEFT", colorLabel, "BOTTOMLEFT", 0, -8)
    colorButton:SetSize(120, 25)
    colorButton:SetText("Choose Color")
    colorButton:SetScript("OnClick", function()
        local color = UsefulStuffDB.circleColor
        local previousColor = {
            r = color.r,
            g = color.g,
            b = color.b,
            a = color.a
        }

        ColorPickerFrame:SetupColorPickerAndShow({
            swatchFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = ColorPickerFrame:GetColorAlpha()
                UsefulStuffDB.circleColor.r = r
                UsefulStuffDB.circleColor.g = g
                UsefulStuffDB.circleColor.b = b
                UsefulStuffDB.circleColor.a = a
                BuildCircle()
            end,
            opacityFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = ColorPickerFrame:GetColorAlpha()
                UsefulStuffDB.circleColor.r = r
                UsefulStuffDB.circleColor.g = g
                UsefulStuffDB.circleColor.b = b
                UsefulStuffDB.circleColor.a = a
                BuildCircle()
            end,
            cancelFunc = function()
                UsefulStuffDB.circleColor.r = previousColor.r
                UsefulStuffDB.circleColor.g = previousColor.g
                UsefulStuffDB.circleColor.b = previousColor.b
                UsefulStuffDB.circleColor.a = previousColor.a
                BuildCircle()
            end,
            hasOpacity = true,
            opacity = color.a,
            r = color.r,
            g = color.g,
            b = color.b,
        })
    end)

    -- Panel 2: Combat Text Settings
    local combatScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    combatScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    combatScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    combatScroll:Hide()
    local combatPanel = CreateFrame("Frame", nil, combatScroll)
    combatPanel:SetSize(600, 900)
    combatScroll:SetScrollChild(combatPanel)
    table.insert(tabPanels, combatScroll)

    -- Enable Combat Text Checkbox
    local enableCombatTextCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableCombatTextCheckbox", combatPanel, "UICheckButtonTemplate")
    enableCombatTextCheckbox:SetPoint("TOPLEFT", 0, -10)
    enableCombatTextCheckbox:SetSize(24, 24)
    enableCombatTextCheckbox:SetChecked(UsefulStuffDB.combatTextEnabled)

    local enableCombatTextLabel = combatPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableCombatTextLabel:SetPoint("LEFT", enableCombatTextCheckbox, "RIGHT", 5, 0)
    enableCombatTextLabel:SetText("Enable Combat Text")

    enableCombatTextCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.combatTextEnabled = self:GetChecked()
    end)

    -- Enter Combat Text
    local enterTextLabel = combatPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enterTextLabel:SetPoint("TOPLEFT", enableCombatTextCheckbox, "BOTTOMLEFT", 0, -15)
    enterTextLabel:SetText("Enter Combat Text:")

    local enterTextBox = CreateFrame("EditBox", "UsefulStuffEnterTextBox", combatPanel, "InputBoxTemplate")
    enterTextBox:SetPoint("TOPLEFT", enterTextLabel, "BOTTOMLEFT", 5, -5)
    enterTextBox:SetSize(200, 20)
    enterTextBox:SetAutoFocus(false)
    enterTextBox:SetText(UsefulStuffDB.combatTextEnter)
    enterTextBox:SetScript("OnEnterPressed", function(self)
        UsefulStuffDB.combatTextEnter = self:GetText()
        self:ClearFocus()
    end)
    enterTextBox:SetScript("OnEscapePressed", function(self)
        self:SetText(UsefulStuffDB.combatTextEnter)
        self:ClearFocus()
    end)

    -- Leave Combat Text
    local leaveTextLabel = combatPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    leaveTextLabel:SetPoint("TOPLEFT", enterTextBox, "BOTTOMLEFT", -5, -15)
    leaveTextLabel:SetText("Leave Combat Text:")

    local leaveTextBox = CreateFrame("EditBox", "UsefulStuffLeaveTextBox", combatPanel, "InputBoxTemplate")
    leaveTextBox:SetPoint("TOPLEFT", leaveTextLabel, "BOTTOMLEFT", 5, -5)
    leaveTextBox:SetSize(200, 20)
    leaveTextBox:SetAutoFocus(false)
    leaveTextBox:SetText(UsefulStuffDB.combatTextLeave)
    leaveTextBox:SetScript("OnEnterPressed", function(self)
        UsefulStuffDB.combatTextLeave = self:GetText()
        self:ClearFocus()
    end)
    leaveTextBox:SetScript("OnEscapePressed", function(self)
        self:SetText(UsefulStuffDB.combatTextLeave)
        self:ClearFocus()
    end)

    -- Font Size Slider
    local fontSizeSlider = CreateFrame("Slider", "UsefulStuffFontSizeSlider", combatPanel, "OptionsSliderTemplate")
    fontSizeSlider:SetPoint("TOPLEFT", leaveTextBox, "BOTTOMLEFT", -5, -30)
    fontSizeSlider:SetMinMaxValues(12, 72)
    fontSizeSlider:SetValue(UsefulStuffDB.combatTextSize)
    fontSizeSlider:SetValueStep(2)
    fontSizeSlider:SetObeyStepOnDrag(true)
    fontSizeSlider:SetWidth(200)
    _G[fontSizeSlider:GetName() .. "Low"]:SetText("12")
    _G[fontSizeSlider:GetName() .. "High"]:SetText("72")
    _G[fontSizeSlider:GetName() .. "Text"]:SetText("Font Size: " .. UsefulStuffDB.combatTextSize)
    fontSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 2) * 2
        UsefulStuffDB.combatTextSize = value
        _G[self:GetName() .. "Text"]:SetText("Font Size: " .. value)
    end)

    -- Position X Slider
    local posXSlider = CreateFrame("Slider", "UsefulStuffPosXSlider", combatPanel, "OptionsSliderTemplate")
    posXSlider:SetPoint("TOPLEFT", fontSizeSlider, "BOTTOMLEFT", 0, -40)
    posXSlider:SetMinMaxValues(-500, 500)
    posXSlider:SetValue(UsefulStuffDB.combatTextX)
    posXSlider:SetValueStep(10)
    posXSlider:SetObeyStepOnDrag(true)
    posXSlider:SetWidth(200)
    _G[posXSlider:GetName() .. "Low"]:SetText("-500")
    _G[posXSlider:GetName() .. "High"]:SetText("500")
    _G[posXSlider:GetName() .. "Text"]:SetText("Position X: " .. UsefulStuffDB.combatTextX)
    posXSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.combatTextX = value
        _G[self:GetName() .. "Text"]:SetText("Position X: " .. value)
    end)

    -- Position Y Slider
    local posYSlider = CreateFrame("Slider", "UsefulStuffPosYSlider", combatPanel, "OptionsSliderTemplate")
    posYSlider:SetPoint("TOPLEFT", posXSlider, "BOTTOMLEFT", 0, -40)
    posYSlider:SetMinMaxValues(-500, 500)
    posYSlider:SetValue(UsefulStuffDB.combatTextY)
    posYSlider:SetValueStep(10)
    posYSlider:SetObeyStepOnDrag(true)
    posYSlider:SetWidth(200)
    _G[posYSlider:GetName() .. "Low"]:SetText("-500")
    _G[posYSlider:GetName() .. "High"]:SetText("500")
    _G[posYSlider:GetName() .. "Text"]:SetText("Position Y: " .. UsefulStuffDB.combatTextY)
    posYSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.combatTextY = value
        _G[self:GetName() .. "Text"]:SetText("Position Y: " .. value)
    end)

    -- Disable Blizzard Combat Text Checkbox
    local disableBlizzCheckbox = CreateFrame("CheckButton", "UsefulStuffDisableBlizzCheckbox", combatPanel, "UICheckButtonTemplate")
    disableBlizzCheckbox:SetPoint("TOPLEFT", posYSlider, "BOTTOMLEFT", 0, -40)
    disableBlizzCheckbox:SetSize(24, 24)
    disableBlizzCheckbox:SetChecked(UsefulStuffDB.disableBlizzardCombatText)

    local disableBlizzLabel = combatPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    disableBlizzLabel:SetPoint("LEFT", disableBlizzCheckbox, "RIGHT", 5, 0)
    disableBlizzLabel:SetText("Disable Blizzard Combat Text")

    disableBlizzCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.disableBlizzardCombatText = self:GetChecked()
        ApplyBlizzardCombatTextSetting()
    end)

    -- Test Combat Text Button
    local testButton = CreateFrame("Button", "UsefulStuffTestButton", combatPanel, "UIPanelButtonTemplate")
    testButton:SetPoint("TOPLEFT", disableBlizzCheckbox, "BOTTOMLEFT", 0, -20)
    testButton:SetSize(200, 25)
    testButton:SetText("Test Combat Text")
    testButton:SetScript("OnClick", function()
        ShowCombatText(UsefulStuffDB.combatTextEnter)
    end)

    -- Panel 4: Action Bars Settings
    local actionBarsScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    actionBarsScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    actionBarsScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    actionBarsScroll:Hide()
    local actionBarsPanel = CreateFrame("Frame", nil, actionBarsScroll)
    actionBarsPanel:SetSize(600, 900)
    actionBarsScroll:SetScrollChild(actionBarsPanel)
    table.insert(tabPanels, actionBarsScroll)

    local abTitle = actionBarsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    abTitle:SetPoint("TOPLEFT", 0, 0)
    abTitle:SetText("Show on Mouseover")

    local abDesc = actionBarsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    abDesc:SetPoint("TOPLEFT", abTitle, "BOTTOMLEFT", 0, -5)
    abDesc:SetText("Hide action bars until you hover over them with your mouse")

    -- Define action bars with friendly names
    local actionBarList = {
        {key = "MultiBarBottomLeft", name = "Bar 2"},
        {key = "MultiBarBottomRight", name = "Bar 3"},
        {key = "MultiBarRight", name = "Bar 4"},
        {key = "MultiBarLeft", name = "Bar 5"},
        {key = "MultiBar5", name = "Bar 6"},
        {key = "MultiBar6", name = "Bar 7"},
        {key = "MultiBar7", name = "Bar 8"},
    }

    local lastCheckbox = abDesc
    for i, barInfo in ipairs(actionBarList) do
        local checkbox = CreateFrame("CheckButton", "UsefulStuffActionBar"..barInfo.key.."Checkbox", actionBarsPanel, "UICheckButtonTemplate")
        if i == 1 then
            checkbox:SetPoint("TOPLEFT", lastCheckbox, "BOTTOMLEFT", 0, -15)
        else
            checkbox:SetPoint("TOPLEFT", lastCheckbox, "BOTTOMLEFT", 0, -5)
        end
        checkbox:SetSize(24, 24)
        checkbox:SetChecked(UsefulStuffDB.actionBarsMouseover[barInfo.key])

        local label = actionBarsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        label:SetPoint("LEFT", checkbox, "RIGHT", 5, 0)
        label:SetText(barInfo.name)

        checkbox:SetScript("OnClick", function(self)
            UsefulStuffDB.actionBarsMouseover[barInfo.key] = self:GetChecked()
            ApplyActionBarMouseover(barInfo.key, self:GetChecked())
        end)

        lastCheckbox = checkbox
    end

    -- Panel 5: Combat Timer Settings
    local combatTimerScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    combatTimerScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    combatTimerScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    combatTimerScroll:Hide()
    local combatTimerPanel = CreateFrame("Frame", nil, combatTimerScroll)
    combatTimerPanel:SetSize(600, 900)
    combatTimerScroll:SetScrollChild(combatTimerPanel)
    table.insert(tabPanels, combatTimerScroll)

    local ctTitle = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    ctTitle:SetPoint("TOPLEFT", 0, 0)
    ctTitle:SetText("Combat Timer")

    local ctDesc = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    ctDesc:SetPoint("TOPLEFT", ctTitle, "BOTTOMLEFT", 0, -5)
    ctDesc:SetText("Shows a timer during combat. Auto-anchors to PlayerFrame, SUF, or ElvUI")

    -- Enable Combat Timer Checkbox
    local enableCTCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableCTCheckbox", combatTimerPanel, "UICheckButtonTemplate")
    enableCTCheckbox:SetPoint("TOPLEFT", ctDesc, "BOTTOMLEFT", 0, -15)
    enableCTCheckbox:SetSize(24, 24)
    enableCTCheckbox:SetChecked(UsefulStuffDB.combatTimer.enabled)

    local enableCTLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableCTLabel:SetPoint("LEFT", enableCTCheckbox, "RIGHT", 5, 0)
    enableCTLabel:SetText("Enable Combat Timer")

    enableCTCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.combatTimer.enabled = self:GetChecked()
    end)

    -- Border Size Slider
    local borderSizeSlider = CreateFrame("Slider", "UsefulStuffCTBorderSizeSlider", combatTimerPanel, "OptionsSliderTemplate")
    borderSizeSlider:SetPoint("TOPLEFT", enableCTCheckbox, "BOTTOMLEFT", 0, -30)
    borderSizeSlider:SetMinMaxValues(1, 5)
    borderSizeSlider:SetValue(UsefulStuffDB.combatTimer.borderSize)
    borderSizeSlider:SetValueStep(1)
    borderSizeSlider:SetObeyStepOnDrag(true)
    borderSizeSlider:SetWidth(200)
    _G[borderSizeSlider:GetName() .. "Low"]:SetText("1")
    _G[borderSizeSlider:GetName() .. "High"]:SetText("5")
    _G[borderSizeSlider:GetName() .. "Text"]:SetText("Border Size: " .. UsefulStuffDB.combatTimer.borderSize)
    borderSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value)
        UsefulStuffDB.combatTimer.borderSize = value
        _G[self:GetName() .. "Text"]:SetText("Border Size: " .. value)
        UpdateCombatTimerAppearance()
    end)

    -- Font Size Slider
    local ctFontSizeSlider = CreateFrame("Slider", "UsefulStuffCTFontSizeSlider", combatTimerPanel, "OptionsSliderTemplate")
    ctFontSizeSlider:SetPoint("TOPLEFT", borderSizeSlider, "BOTTOMLEFT", 0, -40)
    ctFontSizeSlider:SetMinMaxValues(10, 32)
    ctFontSizeSlider:SetValue(UsefulStuffDB.combatTimer.fontSize)
    ctFontSizeSlider:SetValueStep(2)
    ctFontSizeSlider:SetObeyStepOnDrag(true)
    ctFontSizeSlider:SetWidth(200)
    _G[ctFontSizeSlider:GetName() .. "Low"]:SetText("10")
    _G[ctFontSizeSlider:GetName() .. "High"]:SetText("32")
    _G[ctFontSizeSlider:GetName() .. "Text"]:SetText("Font Size: " .. UsefulStuffDB.combatTimer.fontSize)
    ctFontSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 2) * 2
        UsefulStuffDB.combatTimer.fontSize = value
        _G[self:GetName() .. "Text"]:SetText("Font Size: " .. value)
        UpdateCombatTimerAppearance()
    end)

    -- Background Texture Dropdown
    local ctBgLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctBgLabel:SetPoint("TOPLEFT", ctFontSizeSlider, "BOTTOMLEFT", 0, -40)
    ctBgLabel:SetText("Background Texture:")

    local ctBgDropdown = CreateFrame("Frame", "UsefulStuffCTBgDropdown", combatTimerPanel, "UIDropDownMenuTemplate")
    ctBgDropdown:SetPoint("TOPLEFT", ctBgLabel, "BOTTOMLEFT", -15, -5)

    local bgTextures = {
        {name = "Dialog Box", path = "Interface\\DialogFrame\\UI-DialogBox-Background"},
        {name = "Tooltip", path = "Interface\\Tooltips\\UI-Tooltip-Background"},
        {name = "Solid Black", path = "Interface\\Buttons\\WHITE8X8"},
        {name = "Chat Background", path = "Interface\\ChatFrame\\ChatFrameBackground"},
    }

    UIDropDownMenu_SetWidth(ctBgDropdown, 150)
    UIDropDownMenu_Initialize(ctBgDropdown, function(self, level)
        for i, texture in ipairs(bgTextures) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = texture.name
            info.func = function()
                UsefulStuffDB.combatTimer.bgTexture = texture.path
                UIDropDownMenu_SetText(ctBgDropdown, texture.name)
                UpdateCombatTimerAppearance()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    -- Set initial dropdown text
    local currentTextureName = "Dialog Box"
    for i, texture in ipairs(bgTextures) do
        if texture.path == UsefulStuffDB.combatTimer.bgTexture then
            currentTextureName = texture.name
            break
        end
    end
    UIDropDownMenu_SetText(ctBgDropdown, currentTextureName)

    -- Anchor Frame Name Input
    local ctFrameLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctFrameLabel:SetPoint("TOPLEFT", ctBgDropdown, "BOTTOMLEFT", 15, -30)
    ctFrameLabel:SetText("Anchor To Frame:")

    local ctFrameHint = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    ctFrameHint:SetPoint("TOPLEFT", ctFrameLabel, "BOTTOMLEFT", 0, -2)
    ctFrameHint:SetText("(Use AUTO for auto-detect, or frame name like PlayerFrame, ElvUF_Player, etc.)")
    ctFrameHint:SetTextColor(0.7, 0.7, 0.7, 1)

    local ctFrameInput = CreateFrame("EditBox", "UsefulStuffCTFrameInput", combatTimerPanel, "InputBoxTemplate")
    ctFrameInput:SetPoint("TOPLEFT", ctFrameHint, "BOTTOMLEFT", 5, -5)
    ctFrameInput:SetSize(250, 20)
    ctFrameInput:SetAutoFocus(false)
    ctFrameInput:SetText(UsefulStuffDB.combatTimer.anchorFrame)
    ctFrameInput:SetScript("OnEnterPressed", function(self)
        UsefulStuffDB.combatTimer.anchorFrame = self:GetText()
        self:ClearFocus()
        AnchorCombatTimer()
    end)
    ctFrameInput:SetScript("OnEscapePressed", function(self)
        self:SetText(UsefulStuffDB.combatTimer.anchorFrame)
        self:ClearFocus()
    end)

    -- Anchor Point Dropdown
    local ctPointLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctPointLabel:SetPoint("TOPLEFT", ctFrameInput, "BOTTOMLEFT", -5, -20)
    ctPointLabel:SetText("Anchor Point:")

    local ctPointDropdown = CreateFrame("Frame", "UsefulStuffCTPointDropdown", combatTimerPanel, "UIDropDownMenuTemplate")
    ctPointDropdown:SetPoint("TOPLEFT", ctPointLabel, "BOTTOMLEFT", -15, -5)

    local anchorPoints = {"TOP", "BOTTOM", "LEFT", "RIGHT", "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT", "CENTER"}

    UIDropDownMenu_SetWidth(ctPointDropdown, 120)
    UIDropDownMenu_Initialize(ctPointDropdown, function(self, level)
        for i, point in ipairs(anchorPoints) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = point
            info.func = function()
                UsefulStuffDB.combatTimer.anchorPoint = point
                UIDropDownMenu_SetText(ctPointDropdown, point)
                AnchorCombatTimer()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(ctPointDropdown, UsefulStuffDB.combatTimer.anchorPoint)

    -- Relative Point Dropdown
    local ctRelPointLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctRelPointLabel:SetPoint("LEFT", ctPointDropdown, "RIGHT", 10, 2)
    ctRelPointLabel:SetText("To:")

    local ctRelPointDropdown = CreateFrame("Frame", "UsefulStuffCTRelPointDropdown", combatTimerPanel, "UIDropDownMenuTemplate")
    ctRelPointDropdown:SetPoint("LEFT", ctRelPointLabel, "RIGHT", -10, -2)

    UIDropDownMenu_SetWidth(ctRelPointDropdown, 120)
    UIDropDownMenu_Initialize(ctRelPointDropdown, function(self, level)
        for i, point in ipairs(anchorPoints) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = point
            info.func = function()
                UsefulStuffDB.combatTimer.anchorRelativePoint = point
                UIDropDownMenu_SetText(ctRelPointDropdown, point)
                AnchorCombatTimer()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(ctRelPointDropdown, UsefulStuffDB.combatTimer.anchorRelativePoint)

    -- Offset X Input
    local ctOffsetXLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctOffsetXLabel:SetPoint("TOPLEFT", ctPointDropdown, "BOTTOMLEFT", 15, -20)
    ctOffsetXLabel:SetText("Offset X:")

    local ctOffsetXInput = CreateFrame("EditBox", "UsefulStuffCTOffsetXInput", combatTimerPanel, "InputBoxTemplate")
    ctOffsetXInput:SetPoint("LEFT", ctOffsetXLabel, "RIGHT", 10, 0)
    ctOffsetXInput:SetSize(60, 20)
    ctOffsetXInput:SetAutoFocus(false)
    ctOffsetXInput:SetText(tostring(UsefulStuffDB.combatTimer.anchorOffsetX))
    ctOffsetXInput:SetScript("OnEnterPressed", function(self)
        local value = tonumber(self:GetText()) or 0
        UsefulStuffDB.combatTimer.anchorOffsetX = value
        self:ClearFocus()
        AnchorCombatTimer()
    end)
    ctOffsetXInput:SetScript("OnEscapePressed", function(self)
        self:SetText(tostring(UsefulStuffDB.combatTimer.anchorOffsetX))
        self:ClearFocus()
    end)

    -- Offset Y Input
    local ctOffsetYLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctOffsetYLabel:SetPoint("LEFT", ctOffsetXInput, "RIGHT", 20, 0)
    ctOffsetYLabel:SetText("Y:")

    local ctOffsetYInput = CreateFrame("EditBox", "UsefulStuffCTOffsetYInput", combatTimerPanel, "InputBoxTemplate")
    ctOffsetYInput:SetPoint("LEFT", ctOffsetYLabel, "RIGHT", 10, 0)
    ctOffsetYInput:SetSize(60, 20)
    ctOffsetYInput:SetAutoFocus(false)
    ctOffsetYInput:SetText(tostring(UsefulStuffDB.combatTimer.anchorOffsetY))
    ctOffsetYInput:SetScript("OnEnterPressed", function(self)
        local value = tonumber(self:GetText()) or 0
        UsefulStuffDB.combatTimer.anchorOffsetY = value
        self:ClearFocus()
        AnchorCombatTimer()
    end)
    ctOffsetYInput:SetScript("OnEscapePressed", function(self)
        self:SetText(tostring(UsefulStuffDB.combatTimer.anchorOffsetY))
        self:ClearFocus()
    end)

    -- Border Color Picker
    local ctBorderColorLabel = combatTimerPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ctBorderColorLabel:SetPoint("TOPLEFT", ctOffsetXLabel, "BOTTOMLEFT", -15, -25)
    ctBorderColorLabel:SetText("Border Color:")

    local ctBorderColorButton = CreateFrame("Button", "UsefulStuffCTBorderColorButton", combatTimerPanel, "UIPanelButtonTemplate")
    ctBorderColorButton:SetPoint("TOPLEFT", ctBorderColorLabel, "BOTTOMLEFT", 0, -8)
    ctBorderColorButton:SetSize(120, 25)
    ctBorderColorButton:SetText("Choose Color")
    ctBorderColorButton:SetScript("OnClick", function()
        local color = UsefulStuffDB.combatTimer.borderColor
        local previousColor = {
            r = color.r,
            g = color.g,
            b = color.b,
            a = color.a
        }

        ColorPickerFrame:SetupColorPickerAndShow({
            swatchFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = ColorPickerFrame:GetColorAlpha()
                UsefulStuffDB.combatTimer.borderColor.r = r
                UsefulStuffDB.combatTimer.borderColor.g = g
                UsefulStuffDB.combatTimer.borderColor.b = b
                UsefulStuffDB.combatTimer.borderColor.a = a
                UpdateCombatTimerAppearance()
            end,
            opacityFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                local a = ColorPickerFrame:GetColorAlpha()
                UsefulStuffDB.combatTimer.borderColor.r = r
                UsefulStuffDB.combatTimer.borderColor.g = g
                UsefulStuffDB.combatTimer.borderColor.b = b
                UsefulStuffDB.combatTimer.borderColor.a = a
                UpdateCombatTimerAppearance()
            end,
            cancelFunc = function()
                UsefulStuffDB.combatTimer.borderColor.r = previousColor.r
                UsefulStuffDB.combatTimer.borderColor.g = previousColor.g
                UsefulStuffDB.combatTimer.borderColor.b = previousColor.b
                UsefulStuffDB.combatTimer.borderColor.a = previousColor.a
                UpdateCombatTimerAppearance()
            end,
            hasOpacity = true,
            opacity = color.a,
            r = color.r,
            g = color.g,
            b = color.b,
        })
    end)

    -- Panel 6: Auto Logging Settings
    local autoLoggingScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    autoLoggingScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    autoLoggingScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    autoLoggingScroll:Hide()
    local autoLoggingPanel = CreateFrame("Frame", nil, autoLoggingScroll)
    autoLoggingPanel:SetSize(600, 900)
    autoLoggingScroll:SetScrollChild(autoLoggingPanel)
    table.insert(tabPanels, autoLoggingScroll)

    local autoLoggingTitle = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    autoLoggingTitle:SetPoint("TOPLEFT", 0, 0)
    autoLoggingTitle:SetText("Automatic Combat Logging")

    local autoLoggingDesc = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    autoLoggingDesc:SetPoint("TOPLEFT", autoLoggingTitle, "BOTTOMLEFT", 0, -8)
    autoLoggingDesc:SetText("Automatically start/stop advanced combat logging when entering/leaving content types:")

    -- Mythic+ Dungeons Checkbox
    local dungeonsMPlusCheckbox = CreateFrame("CheckButton", "UsefulStuffDungeonsMPlusCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    dungeonsMPlusCheckbox:SetPoint("TOPLEFT", autoLoggingDesc, "BOTTOMLEFT", 0, -15)
    dungeonsMPlusCheckbox:SetSize(24, 24)
    dungeonsMPlusCheckbox:SetChecked(UsefulStuffDB.autoLogging.dungeonsMythicPlus)

    local dungeonsMPlusLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    dungeonsMPlusLabel:SetPoint("LEFT", dungeonsMPlusCheckbox, "RIGHT", 5, 0)
    dungeonsMPlusLabel:SetText("Mythic+ Dungeons")

    dungeonsMPlusCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.dungeonsMythicPlus = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Raid: Mythic Checkbox
    local raidMythicCheckbox = CreateFrame("CheckButton", "UsefulStuffRaidMythicCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    raidMythicCheckbox:SetPoint("TOPLEFT", dungeonsMPlusCheckbox, "BOTTOMLEFT", 0, -8)
    raidMythicCheckbox:SetSize(24, 24)
    raidMythicCheckbox:SetChecked(UsefulStuffDB.autoLogging.raidMythic)

    local raidMythicLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    raidMythicLabel:SetPoint("LEFT", raidMythicCheckbox, "RIGHT", 5, 0)
    raidMythicLabel:SetText("Raid: Mythic")

    raidMythicCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.raidMythic = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Raid: Heroic Checkbox
    local raidHeroicCheckbox = CreateFrame("CheckButton", "UsefulStuffRaidHeroicCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    raidHeroicCheckbox:SetPoint("TOPLEFT", raidMythicCheckbox, "BOTTOMLEFT", 0, -8)
    raidHeroicCheckbox:SetSize(24, 24)
    raidHeroicCheckbox:SetChecked(UsefulStuffDB.autoLogging.raidHeroic)

    local raidHeroicLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    raidHeroicLabel:SetPoint("LEFT", raidHeroicCheckbox, "RIGHT", 5, 0)
    raidHeroicLabel:SetText("Raid: Heroic")

    raidHeroicCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.raidHeroic = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Raid: Normal Checkbox
    local raidNormalCheckbox = CreateFrame("CheckButton", "UsefulStuffRaidNormalCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    raidNormalCheckbox:SetPoint("TOPLEFT", raidHeroicCheckbox, "BOTTOMLEFT", 0, -8)
    raidNormalCheckbox:SetSize(24, 24)
    raidNormalCheckbox:SetChecked(UsefulStuffDB.autoLogging.raidNormal)

    local raidNormalLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    raidNormalLabel:SetPoint("LEFT", raidNormalCheckbox, "RIGHT", 5, 0)
    raidNormalLabel:SetText("Raid: Normal")

    raidNormalCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.raidNormal = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Raid: Finder Checkbox
    local raidFinderCheckbox = CreateFrame("CheckButton", "UsefulStuffRaidFinderCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    raidFinderCheckbox:SetPoint("TOPLEFT", raidNormalCheckbox, "BOTTOMLEFT", 0, -8)
    raidFinderCheckbox:SetSize(24, 24)
    raidFinderCheckbox:SetChecked(UsefulStuffDB.autoLogging.raidFinder)

    local raidFinderLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    raidFinderLabel:SetPoint("LEFT", raidFinderCheckbox, "RIGHT", 5, 0)
    raidFinderLabel:SetText("Raid: Finder")

    raidFinderCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.raidFinder = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Arena Checkbox
    local arenaCheckbox = CreateFrame("CheckButton", "UsefulStuffArenaCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    arenaCheckbox:SetPoint("TOPLEFT", raidFinderCheckbox, "BOTTOMLEFT", 0, -8)
    arenaCheckbox:SetSize(24, 24)
    arenaCheckbox:SetChecked(UsefulStuffDB.autoLogging.arena)

    local arenaLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    arenaLabel:SetPoint("LEFT", arenaCheckbox, "RIGHT", 5, 0)
    arenaLabel:SetText("Arena")

    arenaCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.arena = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Scenarios Checkbox
    local scenariosCheckbox = CreateFrame("CheckButton", "UsefulStuffScenariosCheckbox", autoLoggingPanel, "UICheckButtonTemplate")
    scenariosCheckbox:SetPoint("TOPLEFT", arenaCheckbox, "BOTTOMLEFT", 0, -8)
    scenariosCheckbox:SetSize(24, 24)
    scenariosCheckbox:SetChecked(UsefulStuffDB.autoLogging.scenarios)

    local scenariosLabel = autoLoggingPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    scenariosLabel:SetPoint("LEFT", scenariosCheckbox, "RIGHT", 5, 0)
    scenariosLabel:SetText("Scenarios")

    scenariosCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.autoLogging.scenarios = self:GetChecked()
        CheckAndUpdateLogging()
    end)

    -- Panel 7: Gateway Settings
    local gatewayScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    gatewayScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    gatewayScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    gatewayScroll:Hide()
    local gatewayPanel = CreateFrame("Frame", nil, gatewayScroll)
    gatewayPanel:SetSize(600, 900)
    gatewayScroll:SetScrollChild(gatewayPanel)
    table.insert(tabPanels, gatewayScroll)

    local gwTitle = gatewayPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    gwTitle:SetPoint("TOPLEFT", 0, 0)
    gwTitle:SetText("Gateway Control Shard")

    local gwDesc = gatewayPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    gwDesc:SetPoint("TOPLEFT", gwTitle, "BOTTOMLEFT", 0, -5)
    gwDesc:SetText("Shows a notification when Gateway Control Shard (spell 188152) is usable")

    -- Enable Gateway Checkbox
    local enableGWCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableGWCheckbox", gatewayPanel, "UICheckButtonTemplate")
    enableGWCheckbox:SetPoint("TOPLEFT", gwDesc, "BOTTOMLEFT", 0, -15)
    enableGWCheckbox:SetSize(24, 24)
    enableGWCheckbox:SetChecked(UsefulStuffDB.gateway.enabled)

    local enableGWLabel = gatewayPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableGWLabel:SetPoint("LEFT", enableGWCheckbox, "RIGHT", 5, 0)
    enableGWLabel:SetText("Enable Gateway Notification")

    enableGWCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.gateway.enabled = self:GetChecked()
        UpdateGatewayDisplay()
    end)

    -- Gateway Usable Text
    local gwTextLabel = gatewayPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    gwTextLabel:SetPoint("TOPLEFT", enableGWCheckbox, "BOTTOMLEFT", 0, -15)
    gwTextLabel:SetText("Usable Text:")

    local gwTextBox = CreateFrame("EditBox", "UsefulStuffGWTextBox", gatewayPanel, "InputBoxTemplate")
    gwTextBox:SetPoint("TOPLEFT", gwTextLabel, "BOTTOMLEFT", 5, -5)
    gwTextBox:SetSize(200, 20)
    gwTextBox:SetAutoFocus(false)
    gwTextBox:SetText(UsefulStuffDB.gateway.text)
    gwTextBox:SetScript("OnEnterPressed", function(self)
        UsefulStuffDB.gateway.text = self:GetText()
        self:ClearFocus()
        UpdateGatewayDisplay()
    end)
    gwTextBox:SetScript("OnEscapePressed", function(self)
        self:SetText(UsefulStuffDB.gateway.text)
        self:ClearFocus()
    end)

    -- Gateway Missing Text
    local gwMissingLabel = gatewayPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    gwMissingLabel:SetPoint("TOPLEFT", gwTextBox, "BOTTOMLEFT", -5, -15)
    gwMissingLabel:SetText("Missing Text:")

    local gwMissingBox = CreateFrame("EditBox", "UsefulStuffGWMissingBox", gatewayPanel, "InputBoxTemplate")
    gwMissingBox:SetPoint("TOPLEFT", gwMissingLabel, "BOTTOMLEFT", 5, -5)
    gwMissingBox:SetSize(200, 20)
    gwMissingBox:SetAutoFocus(false)
    gwMissingBox:SetText(UsefulStuffDB.gateway.missingText)
    gwMissingBox:SetScript("OnEnterPressed", function(self)
        UsefulStuffDB.gateway.missingText = self:GetText()
        self:ClearFocus()
        UpdateGatewayDisplay()
    end)
    gwMissingBox:SetScript("OnEscapePressed", function(self)
        self:SetText(UsefulStuffDB.gateway.missingText)
        self:ClearFocus()
    end)

    -- Font Size Slider
    local gwFontSizeSlider = CreateFrame("Slider", "UsefulStuffGWFontSizeSlider", gatewayPanel, "OptionsSliderTemplate")
    gwFontSizeSlider:SetPoint("TOPLEFT", gwMissingBox, "BOTTOMLEFT", -5, -30)
    gwFontSizeSlider:SetMinMaxValues(12, 72)
    gwFontSizeSlider:SetValue(UsefulStuffDB.gateway.fontSize)
    gwFontSizeSlider:SetValueStep(2)
    gwFontSizeSlider:SetObeyStepOnDrag(true)
    gwFontSizeSlider:SetWidth(200)
    _G[gwFontSizeSlider:GetName() .. "Low"]:SetText("12")
    _G[gwFontSizeSlider:GetName() .. "High"]:SetText("72")
    _G[gwFontSizeSlider:GetName() .. "Text"]:SetText("Font Size: " .. UsefulStuffDB.gateway.fontSize)
    gwFontSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 2) * 2
        UsefulStuffDB.gateway.fontSize = value
        _G[self:GetName() .. "Text"]:SetText("Font Size: " .. value)
        UpdateGatewayDisplay()
    end)

    -- Position X Slider
    local gwPosXSlider = CreateFrame("Slider", "UsefulStuffGWPosXSlider", gatewayPanel, "OptionsSliderTemplate")
    gwPosXSlider:SetPoint("TOPLEFT", gwFontSizeSlider, "BOTTOMLEFT", 0, -40)
    gwPosXSlider:SetMinMaxValues(-500, 500)
    gwPosXSlider:SetValue(UsefulStuffDB.gateway.x)
    gwPosXSlider:SetValueStep(10)
    gwPosXSlider:SetObeyStepOnDrag(true)
    gwPosXSlider:SetWidth(200)
    _G[gwPosXSlider:GetName() .. "Low"]:SetText("-500")
    _G[gwPosXSlider:GetName() .. "High"]:SetText("500")
    _G[gwPosXSlider:GetName() .. "Text"]:SetText("Position X: " .. UsefulStuffDB.gateway.x)
    gwPosXSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.gateway.x = value
        _G[self:GetName() .. "Text"]:SetText("Position X: " .. value)
        UpdateGatewayDisplay()
    end)

    -- Position Y Slider
    local gwPosYSlider = CreateFrame("Slider", "UsefulStuffGWPosYSlider", gatewayPanel, "OptionsSliderTemplate")
    gwPosYSlider:SetPoint("TOPLEFT", gwPosXSlider, "BOTTOMLEFT", 0, -40)
    gwPosYSlider:SetMinMaxValues(-500, 500)
    gwPosYSlider:SetValue(UsefulStuffDB.gateway.y)
    gwPosYSlider:SetValueStep(10)
    gwPosYSlider:SetObeyStepOnDrag(true)
    gwPosYSlider:SetWidth(200)
    _G[gwPosYSlider:GetName() .. "Low"]:SetText("-500")
    _G[gwPosYSlider:GetName() .. "High"]:SetText("500")
    _G[gwPosYSlider:GetName() .. "Text"]:SetText("Position Y: " .. UsefulStuffDB.gateway.y)
    gwPosYSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.gateway.y = value
        _G[self:GetName() .. "Text"]:SetText("Position Y: " .. value)
        UpdateGatewayDisplay()
    end)

    -- Panel 8: Lust Tracker Settings
    local lustScroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    lustScroll:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    lustScroll:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -30, 10)
    lustScroll:Hide()
    local lustPanel = CreateFrame("Frame", nil, lustScroll)
    lustPanel:SetSize(600, 900)
    lustScroll:SetScrollChild(lustPanel)
    table.insert(tabPanels, lustScroll)

    local ltTitle = lustPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    ltTitle:SetPoint("TOPLEFT", 0, 0)
    ltTitle:SetText("Lust Tracker")

    local ltDesc = lustPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    ltDesc:SetPoint("TOPLEFT", ltTitle, "BOTTOMLEFT", 0, -5)
    ltDesc:SetText("Displays an icon with countdown when Bloodlust/Heroism/Time Warp is detected")

    -- Enable Lust Tracker Checkbox
    local enableLTCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableLTCheckbox", lustPanel, "UICheckButtonTemplate")
    enableLTCheckbox:SetPoint("TOPLEFT", ltDesc, "BOTTOMLEFT", 0, -15)
    enableLTCheckbox:SetSize(24, 24)
    enableLTCheckbox:SetChecked(UsefulStuffDB.lustTracker.enabled)

    local enableLTLabel = lustPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableLTLabel:SetPoint("LEFT", enableLTCheckbox, "RIGHT", 5, 0)
    enableLTLabel:SetText("Enable Lust Tracker")

    enableLTCheckbox:SetScript("OnClick", function(self)
        UsefulStuffDB.lustTracker.enabled = self:GetChecked()
        if not self:GetChecked() then
            lustFrame:Hide()
        end
    end)

    -- Icon ID Input
    local ltIconLabel = lustPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    ltIconLabel:SetPoint("TOPLEFT", enableLTCheckbox, "BOTTOMLEFT", 0, -15)
    ltIconLabel:SetText("Icon ID:")

    local ltIconInput = CreateFrame("EditBox", "UsefulStuffLTIconInput", lustPanel, "InputBoxTemplate")
    ltIconInput:SetPoint("LEFT", ltIconLabel, "RIGHT", 10, 0)
    ltIconInput:SetSize(80, 20)
    ltIconInput:SetAutoFocus(false)
    ltIconInput:SetText(tostring(UsefulStuffDB.lustTracker.iconId))
    ltIconInput:SetScript("OnEnterPressed", function(self)
        local value = tonumber(self:GetText()) or defaults.lustTracker.iconId
        UsefulStuffDB.lustTracker.iconId = value
        self:ClearFocus()
        UpdateLustTrackerAppearance()
    end)
    ltIconInput:SetScript("OnEscapePressed", function(self)
        self:SetText(tostring(UsefulStuffDB.lustTracker.iconId))
        self:ClearFocus()
    end)

    -- Icon Size Slider
    local ltSizeSlider = CreateFrame("Slider", "UsefulStuffLTSizeSlider", lustPanel, "OptionsSliderTemplate")
    ltSizeSlider:SetPoint("TOPLEFT", ltIconLabel, "BOTTOMLEFT", 0, -30)
    ltSizeSlider:SetMinMaxValues(24, 96)
    ltSizeSlider:SetValue(UsefulStuffDB.lustTracker.iconSize)
    ltSizeSlider:SetValueStep(4)
    ltSizeSlider:SetObeyStepOnDrag(true)
    ltSizeSlider:SetWidth(200)
    _G[ltSizeSlider:GetName() .. "Low"]:SetText("24")
    _G[ltSizeSlider:GetName() .. "High"]:SetText("96")
    _G[ltSizeSlider:GetName() .. "Text"]:SetText("Icon Size: " .. UsefulStuffDB.lustTracker.iconSize)
    ltSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 4) * 4
        UsefulStuffDB.lustTracker.iconSize = value
        _G[self:GetName() .. "Text"]:SetText("Icon Size: " .. value)
        UpdateLustTrackerAppearance()
    end)

    -- Font Size Slider
    local ltFontSizeSlider = CreateFrame("Slider", "UsefulStuffLTFontSizeSlider", lustPanel, "OptionsSliderTemplate")
    ltFontSizeSlider:SetPoint("TOPLEFT", ltSizeSlider, "BOTTOMLEFT", 0, -40)
    ltFontSizeSlider:SetMinMaxValues(10, 48)
    ltFontSizeSlider:SetValue(UsefulStuffDB.lustTracker.fontSize)
    ltFontSizeSlider:SetValueStep(2)
    ltFontSizeSlider:SetObeyStepOnDrag(true)
    ltFontSizeSlider:SetWidth(200)
    _G[ltFontSizeSlider:GetName() .. "Low"]:SetText("10")
    _G[ltFontSizeSlider:GetName() .. "High"]:SetText("48")
    _G[ltFontSizeSlider:GetName() .. "Text"]:SetText("Font Size: " .. UsefulStuffDB.lustTracker.fontSize)
    ltFontSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 2) * 2
        UsefulStuffDB.lustTracker.fontSize = value
        _G[self:GetName() .. "Text"]:SetText("Font Size: " .. value)
        UpdateLustTrackerAppearance()
    end)

    -- Position X Slider
    local ltPosXSlider = CreateFrame("Slider", "UsefulStuffLTPosXSlider", lustPanel, "OptionsSliderTemplate")
    ltPosXSlider:SetPoint("TOPLEFT", ltFontSizeSlider, "BOTTOMLEFT", 0, -40)
    ltPosXSlider:SetMinMaxValues(-500, 500)
    ltPosXSlider:SetValue(UsefulStuffDB.lustTracker.x)
    ltPosXSlider:SetValueStep(10)
    ltPosXSlider:SetObeyStepOnDrag(true)
    ltPosXSlider:SetWidth(200)
    _G[ltPosXSlider:GetName() .. "Low"]:SetText("-500")
    _G[ltPosXSlider:GetName() .. "High"]:SetText("500")
    _G[ltPosXSlider:GetName() .. "Text"]:SetText("Position X: " .. UsefulStuffDB.lustTracker.x)
    ltPosXSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.lustTracker.x = value
        _G[self:GetName() .. "Text"]:SetText("Position X: " .. value)
        UpdateLustTrackerAppearance()
    end)

    -- Position Y Slider
    local ltPosYSlider = CreateFrame("Slider", "UsefulStuffLTPosYSlider", lustPanel, "OptionsSliderTemplate")
    ltPosYSlider:SetPoint("TOPLEFT", ltPosXSlider, "BOTTOMLEFT", 0, -40)
    ltPosYSlider:SetMinMaxValues(-500, 500)
    ltPosYSlider:SetValue(UsefulStuffDB.lustTracker.y)
    ltPosYSlider:SetValueStep(10)
    ltPosYSlider:SetObeyStepOnDrag(true)
    ltPosYSlider:SetWidth(200)
    _G[ltPosYSlider:GetName() .. "Low"]:SetText("-500")
    _G[ltPosYSlider:GetName() .. "High"]:SetText("500")
    _G[ltPosYSlider:GetName() .. "Text"]:SetText("Position Y: " .. UsefulStuffDB.lustTracker.y)
    ltPosYSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value / 10) * 10
        UsefulStuffDB.lustTracker.y = value
        _G[self:GetName() .. "Text"]:SetText("Position Y: " .. value)
        UpdateLustTrackerAppearance()
    end)

    -- Panel 9: Buff Tracker Settings
    local buffPanel = CreateFrame("Frame", nil, panel)
    buffPanel:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -10)
    buffPanel:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -10, 10)
    buffPanel:Hide()
    table.insert(tabPanels, buffPanel)

    local btTitle = buffPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    btTitle:SetPoint("TOPLEFT", 0, 0)
    btTitle:SetText("Buff Tracker")

    local btDesc = buffPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    btDesc:SetPoint("TOPLEFT", btTitle, "BOTTOMLEFT", 0, -5)
    btDesc:SetWidth(560)
    btDesc:SetJustifyH("LEFT")
    btDesc:SetText("Track a buff's stack count by Spell ID. Only the number is shown, no icon - and only from 2 stacks up; at 0 or 1 stack nothing is displayed. Click 'Unlock' on an entry, then drag its number anywhere on screen; click 'Lock' again when done.")

    -- Enable Buff Tracker Checkbox
    local enableBTCheckbox = CreateFrame("CheckButton", "UsefulStuffEnableBTCheckbox", buffPanel, "UICheckButtonTemplate")
    enableBTCheckbox:SetPoint("TOPLEFT", btDesc, "BOTTOMLEFT", 0, -15)
    enableBTCheckbox:SetSize(24, 24)
    enableBTCheckbox:SetChecked(UsefulStuffDB.buffTrackers.enabled)

    local enableBTLabel = buffPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    enableBTLabel:SetPoint("LEFT", enableBTCheckbox, "RIGHT", 5, 0)
    enableBTLabel:SetText("Enable Buff Tracker")

    enableBTCheckbox:SetScript("OnClick", function(self)
        SetBuffTrackersEnabled(self:GetChecked())
    end)

    -- Add new tracker
    local btAddLabel = buffPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    btAddLabel:SetPoint("TOPLEFT", enableBTCheckbox, "BOTTOMLEFT", 0, -20)
    btAddLabel:SetText("Spell ID:")

    local btAddInput = CreateFrame("EditBox", "UsefulStuffBTAddInput", buffPanel, "InputBoxTemplate")
    btAddInput:SetPoint("LEFT", btAddLabel, "RIGHT", 10, 0)
    btAddInput:SetSize(100, 20)
    btAddInput:SetAutoFocus(false)
    btAddInput:SetNumeric(true)

    local btAddButton = CreateFrame("Button", "UsefulStuffBTAddButton", buffPanel, "UIPanelButtonTemplate")
    btAddButton:SetPoint("LEFT", btAddInput, "RIGHT", 10, 0)
    btAddButton:SetSize(80, 22)
    btAddButton:SetText("Add")

    -- Forward declaration so the Add/Remove buttons below can refresh the list
    local RefreshBuffTrackerRows

    btAddButton:SetScript("OnClick", function()
        local spellID = tonumber(btAddInput:GetText())
        if spellID and spellID > 0 then
            AddBuffTracker(spellID)
            btAddInput:SetText("")
            btAddInput:ClearFocus()
            if RefreshBuffTrackerRows then RefreshBuffTrackerRows() end
        end
    end)
    btAddInput:SetScript("OnEnterPressed", function()
        btAddButton:Click()
    end)

    local btListLabel = buffPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    btListLabel:SetPoint("TOPLEFT", btAddLabel, "BOTTOMLEFT", 0, -20)
    btListLabel:SetText("Tracked Spells:")

    local btScrollFrame = CreateFrame("ScrollFrame", "UsefulStuffBTScrollFrame", buffPanel, "UIPanelScrollFrameTemplate")
    btScrollFrame:SetPoint("TOPLEFT", btListLabel, "BOTTOMLEFT", 0, -10)
    btScrollFrame:SetPoint("BOTTOMRIGHT", buffPanel, "BOTTOMRIGHT", -30, 10)

    local btScrollChild = CreateFrame("Frame", "UsefulStuffBTScrollChild", btScrollFrame)
    btScrollChild:SetSize(600, 1)
    btScrollFrame:SetScrollChild(btScrollChild)

    local btRowWidgets = {}

    RefreshBuffTrackerRows = function()
        for _, row in ipairs(btRowWidgets) do
            row:Hide()
            row:SetParent(nil)
        end
        wipe(btRowWidgets)

        local yOffset = 0
        for _, entry in ipairs(UsefulStuffDB.buffTrackers.list) do
            local row = CreateFrame("Frame", nil, btScrollChild)
            row:SetSize(600, 50)
            row:SetPoint("TOPLEFT", 0, -yOffset)

            local nameText = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
            nameText:SetPoint("TOPLEFT", 0, 0)
            nameText:SetWidth(580)
            nameText:SetJustifyH("LEFT")
            local spellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo(entry.spellID)
            local spellName = spellInfo and spellInfo.name or "Unknown"
            nameText:SetText(string.format("%d - %s", entry.spellID, spellName))

            local lockButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            lockButton:SetSize(65, 20)
            lockButton:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -6)
            lockButton:SetText(entry.locked and "Unlock" or "Lock")
            lockButton:SetScript("OnClick", function(self)
                entry.locked = not entry.locked
                self:SetText(entry.locked and "Unlock" or "Lock")
                ApplyBuffTrackerLockState(entry)
            end)

            local sizeLabel = row:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
            sizeLabel:SetPoint("LEFT", lockButton, "RIGHT", 8, 0)
            sizeLabel:SetText("Size:")

            local sizeInput = CreateFrame("EditBox", nil, row, "InputBoxTemplate")
            sizeInput:SetSize(35, 20)
            sizeInput:SetPoint("LEFT", sizeLabel, "RIGHT", 5, 0)
            sizeInput:SetAutoFocus(false)
            sizeInput:SetNumeric(true)
            sizeInput:SetText(tostring(entry.fontSize))
            sizeInput:SetScript("OnEnterPressed", function(self)
                local value = tonumber(self:GetText()) or entry.fontSize
                entry.fontSize = math.max(6, value)
                self:SetText(tostring(entry.fontSize))
                self:ClearFocus()
                BuildBuffTrackerEntry(entry)
            end)

            -- Duration toggle + layout template (only relevant, and only
            -- shown, while Duration is checked). Both rebuild the tracker
            -- since duration/layout are baked in at creation, same as size.
            local durationCheckbox = CreateFrame("CheckButton", nil, row, "UICheckButtonTemplate")
            durationCheckbox:SetSize(20, 20)
            durationCheckbox:SetPoint("LEFT", sizeInput, "RIGHT", 8, 0)
            durationCheckbox:SetChecked(entry.showDuration)

            local durationLabel = row:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
            durationLabel:SetPoint("LEFT", durationCheckbox, "RIGHT", 2, 0)
            durationLabel:SetText("Duration")

            local templateButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            templateButton:SetSize(80, 20)
            templateButton:SetPoint("LEFT", durationLabel, "RIGHT", 8, 0)
            local function UpdateTemplateButtonText()
                templateButton:SetText(entry.layout == "duration_stacks" and "Dur - Stk" or "Stk - Dur")
            end
            UpdateTemplateButtonText()
            templateButton:SetShown(entry.showDuration)
            templateButton:SetScript("OnClick", function()
                entry.layout = (entry.layout == "duration_stacks") and "stacks_duration" or "duration_stacks"
                UpdateTemplateButtonText()
                BuildBuffTrackerEntry(entry)
            end)

            durationCheckbox:SetScript("OnClick", function(self)
                entry.showDuration = self:GetChecked() and true or false
                templateButton:SetShown(entry.showDuration)
                BuildBuffTrackerEntry(entry)
            end)

            local testButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            testButton:SetSize(55, 20)
            testButton:SetPoint("LEFT", templateButton, "RIGHT", 8, 0)
            testButton:SetText("Test")
            testButton:SetScript("OnClick", function()
                local ok, aura = pcall(C_UnitAuras.GetUnitAuraBySpellID, "player", entry.spellID, "HELPFUL")
                local secret = C_Secrets and C_Secrets.ShouldAurasBeSecret and C_Secrets.ShouldAurasBeSecret()
                if ok and aura then
                    print(string.format("|cFF00FF00UsefulStuff:|r Spell %d found, stacks=%d, auras secret=%s",
                        entry.spellID, aura.applications or 0, tostring(secret)))
                else
                    print(string.format("|cFFFF0000UsefulStuff:|r Spell %d NOT found (call ok=%s), auras secret=%s",
                        entry.spellID, tostring(ok), tostring(secret)))
                end
            end)

            local removeButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            removeButton:SetSize(65, 20)
            removeButton:SetPoint("LEFT", testButton, "RIGHT", 8, 0)
            removeButton:SetText("Remove")
            removeButton:SetScript("OnClick", function()
                RemoveBuffTracker(entry.id)
                RefreshBuffTrackerRows()
            end)

            table.insert(btRowWidgets, row)
            yOffset = yOffset + 54
        end

        btScrollChild:SetSize(600, math.max(yOffset, 1))
    end

    RefreshBuffTrackerRows()

    -- Select first tab by default
    SelectTab(1)
end

-- Minimal entry in ESC > Options > AddOns > UsefulStuff: just a launcher
-- button for the movable window above, the way Method Raid Tools and similar
-- addons do it, instead of an inline settings canvas.
local function CreateBlizzardLauncherPanel()
    local launcherPanel = CreateFrame("Frame")
    launcherPanel.name = "UsefulStuff"

    local openButton = CreateFrame("Button", nil, launcherPanel, "UIPanelButtonTemplate")
    openButton:SetSize(200, 32)
    openButton:SetPoint("CENTER")
    openButton:SetText("Open UsefulStuff")
    openButton:SetScript("OnClick", ToggleUsefulStuffFrame)

    local category = Settings.RegisterCanvasLayoutCategory(launcherPanel, "UsefulStuff")
    Settings.RegisterAddOnCategory(category)
end

SLASH_USEFULSTUFF1 = "/usefulstuff"
SLASH_USEFULSTUFF2 = "/us"
SlashCmdList["USEFULSTUFF"] = ToggleUsefulStuffFrame

-- Initialize addon
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        InitializeSettings()
        BuildCircle()
        ApplyBlizzardCombatTextSetting()
        ApplyBlizzardBagBarSetting()
        ApplyAllActionBarMouseovers()
        AnchorCombatTimer()
        UpdateCombatTimerAppearance()
        InitGateway()
        InitLustTracker()
        InitBuffTrackers()
        CreateSettingsPanel()
        CreateBlizzardLauncherPanel()
        print("|cFF00FF00UsefulStuff|r loaded! Type /usefulstuff (or /us) to open, or ESC > Options > AddOns > UsefulStuff")
    end
end)
