-- Anonymous9x RepText UI v2.0 - MODERN REDESIGN
-- Modern Card-Based Layout, Sleek Design
-- Theme: Noir (Black & White)

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- UI Configuration
local UI_CONFIG = {
    Name = "Anonymous9x RepText",
    Creator = "Anonymous9x",
    Version = "2.0",
    Theme = {
        Background = Color3.fromRGB(12, 12, 12),
        Dark = Color3.fromRGB(18, 18, 18),
        Card = Color3.fromRGB(22, 22, 22),
        Border = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200),
        Hover = Color3.fromRGB(35, 35, 35),
        Accent = Color3.fromRGB(45, 45, 45)
    }
}

-- Report Categories
local REPORT_TEXTS = {
    ["Harassment"] = {
        title = "Harassment",
        icon = "🎯",
        texts = {
            "I was repeatedly targeted with harassment including toxic language and disrespectful comments during gameplay. This player's behavior violates community standards and creates a negative environment for other players. The harassment continued even after I requested them to stop.",
            "I am a victim of ongoing harassment from another player. They used offensive language directed at me specifically, attempting to provoke confrontation and make me uncomfortable. Multiple witnesses were present during this incident and can confirm the behavior.",
            "A player engaged in a harassment campaign against me including name-calling and derogatory remarks. This constitutes clear bullying behavior that disrupts normal gameplay experience. The targeting was persistent and intentional.",
            "I was harassed by a player with insults and toxic behavior throughout multiple game sessions. When I requested them to stop, the harassment continued unabated. This is a clear violation of Roblox community guidelines and creates an unsafe environment."
        }
    },
    ["18+ Content"] = {
        title = "18+ Content",
        icon = "⚠️",
        texts = {
            "A player created inappropriate 18+ sexual content in the game environment. Sexual dialogue and explicit material are present which violates Roblox community standards for an all-ages platform. The content is clearly designed to be inappropriate and has made other players uncomfortable.",
            "A player engaged in sexual roleplay and posted adult content repeatedly in the public game chat. This explicitly violates platform policy regarding mature content that has no place on a family-friendly game. Multiple players witnessed this inappropriate behavior.",
            "I witnessed inappropriate sexual behavior including explicit language and adult roleplay from another player. Multiple players witnessed this conduct and reported discomfort. Immediate action is required as this violates content policies.",
            "A player spammed 18+ content and sexual messages throughout the public chat. They attempted to engage other players in adult conversations and continue despite being ignored. This is a clear policy violation affecting the entire player base.",
            "A player promoted adult content with links and references to inappropriate material. This directly violates Roblox Terms of Service regarding sexual content that is completely inappropriate on a youth platform."
        }
    },
    ["Advertising"] = {
        title = "Advertising",
        icon = "📢",
        texts = {
            "A player spammed advertisements repeatedly in the game chat. They posted multiple links and promotional content against platform rules and continued even after being asked to stop. This behavior disrupted the normal game experience for everyone.",
            "I observed a player advertising external Discord servers, YouTube channels, and promotional links continuously in the game chat. This is prohibited advertising behavior that violates Roblox platform policies and creates spam.",
            "There was significant spam flooding in the game chat with repetitive messages, multiple links, and promotional content disrupting normal gameplay. The same player posted these messages several times, clearly intentional spam.",
            "A player engaged in persistent spam advertising including game recommendations, Discord server invites, and external links throughout their session. This behavior violates anti-spam policy and makes the game unenjoyable.",
            "I observed a player repeatedly advertise and spam the same promotional content and links multiple times within a short timeframe. This creates clear disruption to the game environment and chat quality for all players."
        }
    },
    ["Exploiting"] = {
        title = "Exploiting",
        icon = "💀",
        texts = {
            "I observed another player utilizing an exploit or hack that grants unfair gameplay advantage. I directly witnessed them flying, using speed hacks, and becoming invisible in a game where none of these abilities exist normally. This breaches game integrity completely.",
            "A player was using a game exploit or vulnerability that I could clearly observe. They were walking through walls, having infinite health, and teleporting around the map. This unfair advantage was confirmed by multiple other players in the game.",
            "I detected clear exploitation from another player. They were using external tools or scripts to gain an unfair advantage in the game. This behavior is ruining the experience for legitimate players and affects competitive fairness.",
            "I confirmed a player using exploits with impossible abilities that should not exist in normal gameplay. They were generating infinite money and items from nothing, demonstrating a clear code violation.",
            "A player was utilizing a paid exploit menu or mod tool. I observed wallhacking and speedhacking which was clearly affecting other players' gameplay experience negatively and creating unfair competition."
        }
    },
    ["Scamming"] = {
        title = "Scamming",
        icon = "💰",
        texts = {
            "I was scammed by a player in a game trade. They promised certain items in exchange but completely failed to deliver. This is fraudulent behavior that violates the game's trading guidelines and took advantage of my trust.",
            "A player conducted a clear scam operation. They took my valuable items and currency with false promises of return that never happened. Multiple other players have reported being scammed by the same person using the same methods.",
            "I am a victim of a scam from another player. They promised to provide services or items but completely failed to deliver as promised. I lost significant in-game currency due to this deliberate scam.",
            "A player is running a scam scheme targeting multiple players. They make false promises to players in exchange for items and currency. Multiple reports from other players confirm this is an ongoing pattern of fraudulent activity.",
            "I was scammed by a player who engaged in item and currency fraud. They took my items claiming they would be doubled or returned, but kept everything. This is clear scamming behavior and intentional theft."
        }
    },
    ["Racism"] = {
        title = "Racism",
        icon = "⛔",
        texts = {
            "A player used racist slurs and discriminatory language toward other players. They engaged in hate speech directed at players based on race and ethnicity. This behavior is completely unacceptable.",
            "I observed a player engaged in discriminatory behavior. They made racist comments and hateful language creating a hostile environment. Multiple witnesses were present and can confirm this behavior.",
            "A player directed racism at other players. They used slurs and discriminatory statements about race and nationality. This violates anti-discrimination policy and creates an unsafe environment.",
            "I witnessed a player make discriminatory comments based on religion and ethnicity. They used hateful language that violates community standards for a respectful environment.",
            "A player promoted discriminatory ideology through racist remarks and hate speech. This violates platform policy on equality and respect for all players."
        }
    },
    ["Threats"] = {
        title = "Threats",
        icon = "🚨",
        texts = {
            "A player made serious threatening statements toward me. They made death threats and used intimidation tactics attempting to scare me and coerce my behavior. These are direct threats that create fear.",
            "I reported another player who threatened me with doxxing and real-world harm. This is serious threatening behavior that requires immediate action and investigation.",
            "A player engaged in intimidation directed at me. They made threatening statements about hacking my account and falsely reporting me to coerce compliance with their demands.",
            "I received violent threats from a player including specific harm threats. This constitutes serious threatening behavior that is a policy violation and creates genuine safety concerns.",
            "A player threatened to file false reports, hack my account, and cause real-world harm. These are intimidation tactics creating an unsafe environment and require investigation."
        }
    },
    ["Inappropriate Username"] = {
        title = "Username",
        icon = "🔤",
        texts = {
            "A player has an inappropriate username containing offensive language and slurs. This violates username policy requirements that are necessary for maintaining a respectful community environment for all players.",
            "The username I observed contains explicit adult content that is inappropriate for this platform. This represents a clear breach of username policy as it contains adult references and offensive slurs.",
            "A player's username contains hate speech and slurs. This directly violates Roblox naming standards and community conduct requirements that prohibit discriminatory and hateful usernames.",
            "I found a username that includes sexual and adult content that is completely inappropriate for a family-friendly platform. This breaches username conduct policy significantly.",
            "A player's username contains offensive language and slurs that creates a hostile environment. This violates community standards for username selection and appropriateness."
        }
    },
    ["Inappropriate Game"] = {
        title = "Game Content",
        icon = "📵",
        texts = {
            "This game contains inappropriate 18+ sexual content throughout. Explicit dialogue, animations, and digital assets are present that violate platform content policy for what should be an all-ages game. The sexual content is clear and intentional.",
            "This game features adult content including repeated sexual references and mature material that is unsuitable for the Roblox platform. It violates content guidelines that protect younger players.",
            "This game includes hate speech and offensive content. Racial slurs and discriminatory material are present in the game mechanics and dialogue. This is a clear policy violation.",
            "This game contains excessive violence and gore that is inappropriate for platform standards. The graphic content violates age-appropriate content guidelines and is disturbing.",
            "This game is designed to promote adult behavior and sexual roleplay. The content and game mechanics explicitly violate Roblox community standards for appropriate game experiences."
        }
    },
    ["Impersonation"] = {
        title = "Impersonation",
        icon = "🎭",
        texts = {
            "Another player is impersonating me or another legitimate player. Their username and avatar are designed to look identical to the real account, causing confusion and enabling fraud through deception.",
            "A player is impersonating a game developer or staff member. They make false claims of authority which cause confusion among other players. This violates impersonation policy and enables deception.",
            "A player created an account impersonating a legitimate account to scam and deceive other players. The fake account is designed to look nearly identical to the real account and has fooled multiple people.",
            "A player is pretending to be my friend or a content creator to deceive other players. They are deceiving players for personal gain through this false identity. This is a clear impersonation violation.",
            "I observed a clear impersonation attempt where a player mimicked a verified account appearance to conduct fraud. Multiple players were deceived by this false identity."
        }
    },
    ["Child Safety"] = {
        title = "Child Safety",
        icon = "🛡️",
        texts = {
            "A player exhibited behavior that is concerning regarding child safety. They made inappropriate comments directed toward younger players in the game which raises serious safety concerns.",
            "I observed a player engaged in grooming behavior toward younger players. They attempted to manipulate children into private conversations for inappropriate purposes. This is predatory behavior.",
            "I am reporting a child safety concern: A player made solicitations toward minors that are inappropriate and concerning. This is a clear policy violation requiring immediate investigation by the safety team.",
            "I witnessed predatory behavior from a player who was targeting younger players. They made inappropriate proposals and requests that caused visible discomfort to the minors. This requires urgent attention.",
            "A player attempted to contact younger players for inappropriate offline communication. This is a major safety concern requiring immediate action to protect minors on the platform."
        }
    },
    ["Bot Account"] = {
        title = "Bot Account",
        icon = "🤖",
        texts = {
            "I identified another account that appears to be a bot or fake account. The automated behavior and spam patterns are obvious. This account does not appear to be a legitimate player.",
            "An account is displaying clear bot characteristics including highly repetitive behavior and suspicious activity patterns. The account appears to be completely automated and not controlled by a real person.",
            "I observed a suspicious account exhibiting bot-like behavior. Automated responses and unnatural gameplay patterns strongly suggest this is a fake account.",
            "I confirmed an account is likely a bot. It shows zero legitimate gameplay interaction and only engages in repetitive spam and advertising behavior.",
            "An account has been confirmed as a bot account. It displays automated advertising and spam patterns with a suspicious activity timeline. This is not a genuine player account."
        }
    },
    ["Toxicity"] = {
        title = "Toxicity",
        icon = "😠",
        texts = {
            "I observed a player exhibiting toxic and rude behavior toward multiple other players. They used aggressive language and made disrespectful comments throughout their entire gameplay session.",
            "A player displayed extremely toxic behavior in the game chat. They made rude comments, complained excessively, and created a negative atmosphere affecting everyone.",
            "I witnessed toxicity from a player who made rude remarks to other players, complained constantly, and created a very negative game atmosphere.",
            "A player displayed rudeness and a generally toxic attitude. They gave aggressive responses and treated other players with disrespect.",
            "A player exhibited toxic behavior including rude language and disrespectful treatment of other players. This creates a negative community experience."
        }
    }
}

-- Main GUI Creation
local function createRepTextUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RepTextUI"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    
    -- Main Container (Compact)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 350, 0, 420)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -210)
    mainFrame.BackgroundColor3 = UI_CONFIG.Theme.Background
    mainFrame.BorderColor3 = UI_CONFIG.Theme.Border
    mainFrame.BorderSizePixel = 2
    mainFrame.Parent = screenGui
    
    -- Add rounded corners
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 8)
    mainCorner.Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = UI_CONFIG.Theme.Dark
    titleBar.BorderColor3 = UI_CONFIG.Theme.Border
    titleBar.BorderSizePixel = 1
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -70, 1, 0)
    titleText.BackgroundTransparency = 1
    titleText.TextColor3 = UI_CONFIG.Theme.Text
    titleText.TextSize = 13
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = "Anonymous9x RepText"
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    local titlePadding = Instance.new("UIPadding")
    titlePadding.PaddingLeft = UDim.new(0, 12)
    titlePadding.Parent = titleText
    
    -- Minimize Button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeBtn"
    minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
    minimizeBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
    minimizeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    minimizeBtn.BorderSizePixel = 1
    minimizeBtn.TextColor3 = UI_CONFIG.Theme.Text
    minimizeBtn.TextSize = 16
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Text = "−"
    minimizeBtn.Position = UDim2.new(1, -66, 0, 6)
    minimizeBtn.Parent = titleBar
    
    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = UDim.new(0, 4)
    minCorner.Parent = minimizeBtn
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
    closeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    closeBtn.BorderSizePixel = 1
    closeBtn.TextColor3 = UI_CONFIG.Theme.Text
    closeBtn.TextSize = 16
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.Position = UDim2.new(1, -34, 0, 6)
    closeBtn.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeBtn
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- Category Tabs (Horizontal Scroll)
    local categoryScroll = Instance.new("ScrollingFrame")
    categoryScroll.Name = "CategoryScroll"
    categoryScroll.Size = UDim2.new(1, 0, 0, 50)
    categoryScroll.BackgroundColor3 = UI_CONFIG.Theme.Dark
    categoryScroll.BorderColor3 = UI_CONFIG.Theme.Border
    categoryScroll.BorderSizePixel = 1
    categoryScroll.ScrollBarThickness = 3
    categoryScroll.CanvasSize = UDim2.new(4, 0, 0, 50)
    categoryScroll.Parent = contentFrame
    
    pcall(function() categoryScroll.ScrollDirection = Enum.ScrollDirection.X end)
    
    local catLayout = Instance.new("UIListLayout")
    catLayout.FillDirection = Enum.FillDirection.Horizontal
    catLayout.Padding = UDim.new(0, 6)
    catLayout.Parent = categoryScroll
    
    local catPadding = Instance.new("UIPadding")
    catPadding.PaddingLeft = UDim.new(0, 6)
    catPadding.PaddingRight = UDim.new(0, 6)
    catPadding.Parent = categoryScroll
    
    -- Text Display (Vertical Scroll)
    local textScroll = Instance.new("ScrollingFrame")
    textScroll.Name = "TextScroll"
    textScroll.Size = UDim2.new(1, 0, 1, -54)
    textScroll.Position = UDim2.new(0, 0, 0, 50)
    textScroll.BackgroundColor3 = UI_CONFIG.Theme.Background
    textScroll.BorderColor3 = UI_CONFIG.Theme.Border
    textScroll.BorderSizePixel = 1
    textScroll.ScrollBarThickness = 3
    textScroll.CanvasSize = UDim2.new(0, 0, 10, 0)
    textScroll.Parent = contentFrame
    
    local textLayout = Instance.new("UIListLayout")
    textLayout.FillDirection = Enum.FillDirection.Vertical
    textLayout.Padding = UDim.new(0, 6)
    textLayout.Parent = textScroll
    
    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 8)
    textPadding.PaddingRight = UDim.new(0, 8)
    textPadding.PaddingTop = UDim.new(0, 8)
    textPadding.PaddingBottom = UDim.new(0, 8)
    textPadding.Parent = textScroll
    
    -- Loading Screen
    local loadingScreen = Instance.new("Frame")
    loadingScreen.Name = "LoadingScreen"
    loadingScreen.Size = UDim2.new(1, 0, 1, 0)
    loadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loadingScreen.BackgroundTransparency = 0.5
    loadingScreen.Visible = false
    loadingScreen.Parent = mainFrame
    
    local loadingBox = Instance.new("Frame")
    loadingBox.Size = UDim2.new(0, 120, 0, 80)
    loadingBox.Position = UDim2.new(0.5, -60, 0.5, -40)
    loadingBox.BackgroundColor3 = UI_CONFIG.Theme.Dark
    loadingBox.BorderColor3 = UI_CONFIG.Theme.Border
    loadingBox.BorderSizePixel = 2
    loadingBox.Parent = loadingScreen
    
    local loadCorner = Instance.new("UICorner")
    loadCorner.CornerRadius = UDim.new(0, 6)
    loadCorner.Parent = loadingBox
    
    -- Animated dots
    local dotsContainer = Instance.new("Frame")
    dotsContainer.Size = UDim2.new(1, 0, 0.5, 0)
    dotsContainer.BackgroundTransparency = 1
    dotsContainer.Parent = loadingBox
    
    local dots = {}
    for i = 1, 3 do
        local dot = Instance.new("TextLabel")
        dot.Size = UDim2.new(0, 6, 0, 6)
        dot.Position = UDim2.new(0.5, -14 + (i-1)*12, 0.5, -3)
        dot.BackgroundColor3 = UI_CONFIG.Theme.Border
        dot.BorderSizePixel = 0
        dot.Text = ""
        dot.Parent = dotsContainer
        
        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot
        
        dots[i] = dot
    end
    
    local loadText = Instance.new("TextLabel")
    loadText.Size = UDim2.new(1, 0, 0.5, 0)
    loadText.Position = UDim2.new(0, 0, 0.5, 0)
    loadText.BackgroundTransparency = 1
    loadText.TextColor3 = UI_CONFIG.Theme.Text
    loadText.TextSize = 10
    loadText.Font = Enum.Font.GothamBold
    loadText.Text = "Loading..."
    loadText.Parent = loadingBox
    
    -- Variables
    local isMinimized = false
    local selectedCategory = nil
    
    -- Create Category Button
    local function createCategoryButton(categoryName)
        local btn = Instance.new("TextButton")
        btn.Name = categoryName
        btn.Size = UDim2.new(0, 55, 0, 38)
        btn.BackgroundColor3 = UI_CONFIG.Theme.Dark
        btn.BorderColor3 = UI_CONFIG.Theme.Border
        btn.BorderSizePixel = 1
        btn.TextColor3 = UI_CONFIG.Theme.TextSecondary
        btn.TextSize = 9
        btn.Font = Enum.Font.GothamBold
        btn.Text = REPORT_TEXTS[categoryName].title
        btn.TextWrapped = true
        btn.Parent = categoryScroll
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = btn
        
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = UI_CONFIG.Theme.Hover
            btn.TextColor3 = UI_CONFIG.Theme.Text
        end)
        
        btn.MouseLeave:Connect(function()
            if selectedCategory ~= categoryName then
                btn.BackgroundColor3 = UI_CONFIG.Theme.Dark
                btn.TextColor3 = UI_CONFIG.Theme.TextSecondary
            end
        end)
        
        btn.MouseButton1Click:Connect(function()
            loadingScreen.Visible = true
            
            -- Reset previous
            if selectedCategory and categoryScroll:FindFirstChild(selectedCategory) then
                local prevBtn = categoryScroll:FindFirstChild(selectedCategory)
                prevBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
                prevBtn.TextColor3 = UI_CONFIG.Theme.TextSecondary
            end
            
            selectedCategory = categoryName
            btn.BackgroundColor3 = UI_CONFIG.Theme.Accent
            btn.TextColor3 = UI_CONFIG.Theme.Text
            
            -- Clear text
            for _, child in ipairs(textScroll:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            wait(0.25)
            
            -- Load texts
            for i, text in ipairs(REPORT_TEXTS[categoryName].texts) do
                local textCard = Instance.new("Frame")
                textCard.Size = UDim2.new(1, -16, 0, 78)
                textCard.BackgroundColor3 = UI_CONFIG.Theme.Card
                textCard.BorderColor3 = UI_CONFIG.Theme.Border
                textCard.BorderSizePixel = 1
                textCard.Parent = textScroll
                
                local cardCorner = Instance.new("UICorner")
                cardCorner.CornerRadius = UDim.new(0, 5)
                cardCorner.Parent = textCard
                
                -- Text Label
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, -8, 1, -30)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = UI_CONFIG.Theme.TextSecondary
                textLabel.TextSize = 7.5
                textLabel.Font = Enum.Font.Gotham
                textLabel.Text = text
                textLabel.TextWrapped = true
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.TextYAlignment = Enum.TextYAlignment.Top
                textLabel.Parent = textCard
                
                local labelPadding = Instance.new("UIPadding")
                labelPadding.PaddingLeft = UDim.new(0, 4)
                labelPadding.PaddingRight = UDim.new(0, 4)
                labelPadding.PaddingTop = UDim.new(0, 4)
                labelPadding.Parent = textLabel
                
                -- Copy Button
                local copyBtn = Instance.new("TextButton")
                copyBtn.Name = "CopyBtn"
                copyBtn.Size = UDim2.new(1, -8, 0, 22)
                copyBtn.Position = UDim2.new(0, 4, 1, -26)
                copyBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
                copyBtn.BorderColor3 = UI_CONFIG.Theme.Border
                copyBtn.BorderSizePixel = 1
                copyBtn.TextColor3 = UI_CONFIG.Theme.Text
                copyBtn.TextSize = 8
                copyBtn.Font = Enum.Font.GothamBold
                copyBtn.Text = "COPY"
                copyBtn.Parent = textCard
                
                local btnCorner2 = Instance.new("UICorner")
                btnCorner2.CornerRadius = UDim.new(0, 3)
                btnCorner2.Parent = copyBtn
                
                copyBtn.MouseEnter:Connect(function()
                    copyBtn.BackgroundColor3 = UI_CONFIG.Theme.Hover
                end)
                
                copyBtn.MouseLeave:Connect(function()
                    copyBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
                end)
                
                copyBtn.MouseButton1Click:Connect(function()
                    pcall(function()
                        setclipboard(text)
                        copyBtn.Text = "✓"
                        task.wait(1.2)
                        copyBtn.Text = "COPY"
                    end)
                end)
                
                textCard.LayoutOrder = i
            end
            
            textScroll.CanvasSize = UDim2.new(0, 0, 0, textLayout.AbsoluteContentSize.Y + 16)
            loadingScreen.Visible = false
        end)
        
        return btn
    end
    
    -- Create all category buttons
    for categoryName, _ in pairs(REPORT_TEXTS) do
        createCategoryButton(categoryName)
    end
    
    -- Button Functions
    minimizeBtn.MouseButton1Click:Connect(function()
        if not isMinimized then
            isMinimized = true
            contentFrame.Visible = false
            mainFrame.Size = UDim2.new(0, 350, 0, 40)
            minimizeBtn.Text = "+"
        else
            isMinimized = false
            contentFrame.Visible = true
            mainFrame.Size = UDim2.new(0, 350, 0, 420)
            minimizeBtn.Text = "−"
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    -- Loading Animation
    RunService.RenderStepped:Connect(function()
        if loadingScreen.Visible then
            local elapsed = tick() % 0.8
            for i, dot in ipairs(dots) do
                local delay = (i - 1) * 0.15
                local phase = (elapsed - delay) % 0.8
                
                if phase < 0.4 then
                    local t = phase / 0.4
                    dot.BackgroundTransparency = 0.4 - (0.3 * t)
                else
                    local t = (phase - 0.4) / 0.4
                    dot.BackgroundTransparency = 0.1 + (0.3 * t)
                end
            end
        end
    end)
    
    -- Mobile Swipe Support
    local startX = 0
    mainFrame.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Touch then
            startX = input.Position.X
        end
    end)
    
    mainFrame.InputChanged:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.Touch then
            local deltaX = startX - input.Position.X
            if math.abs(deltaX) > 3 then
                categoryScroll.CanvasPosition = categoryScroll.CanvasPosition + Vector2.new(deltaX * 0.5, 0)
                startX = input.Position.X
            end
        end
    end)
    
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

-- Safe Initialize
local function safeInit()
    local success, err = pcall(createRepTextUI)
    if not success then
        warn("RepText Error: " .. tostring(err))
    end
end

safeInit()
print("✓ Anonymous9x RepText v2.0 - Modern Design Loaded!")
