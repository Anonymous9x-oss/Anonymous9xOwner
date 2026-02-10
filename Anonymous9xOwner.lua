-- Anonymous9x RepText UI v2.2 - ULTRA COMPACT & DRAGGABLE
-- Size: 240x290px | Drag Support | Help Guide | Smooth Scroll

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local UI_CONFIG = {
    Name = "Anonymous9x RepText",
    Creator = "Anonymous9x",
    Version = "2.2",
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

local REPORT_TEXTS = {
    ["Harassment"] = {
        title = "Harassment",
        texts = {
            "I was repeatedly targeted with harassment including toxic language and disrespectful comments during gameplay. This player's behavior violates community standards and creates a negative environment for other players. The harassment continued even after I requested them to stop.",
            "I am a victim of ongoing harassment from another player. They used offensive language directed at me specifically, attempting to provoke confrontation and make me uncomfortable. Multiple witnesses were present during this incident and can confirm the behavior.",
            "A player engaged in a harassment campaign against me including name-calling and derogatory remarks. This constitutes clear bullying behavior that disrupts normal gameplay experience. The targeting was persistent and intentional.",
            "I was harassed by a player with insults and toxic behavior throughout multiple game sessions. When I requested them to stop, the harassment continued unabated. This is a clear violation of Roblox community guidelines."
        }
    },
    ["18+ Content"] = {
        title = "18+ Content",
        texts = {
            "A player created inappropriate 18+ sexual content in the game environment. Sexual dialogue and explicit material are present which violates Roblox community standards for an all-ages platform.",
            "A player engaged in sexual roleplay and posted adult content repeatedly in the public game chat. This explicitly violates platform policy regarding mature content that has no place on a family-friendly game.",
            "I witnessed inappropriate sexual behavior including explicit language and adult roleplay from another player. Multiple players witnessed this conduct and reported discomfort. Immediate action is required.",
            "A player spammed 18+ content and sexual messages throughout the public chat. They attempted to engage other players in adult conversations and continue despite being ignored.",
            "A player promoted adult content with links and references to inappropriate material. This directly violates Roblox Terms of Service regarding sexual content that is inappropriate on a youth platform."
        }
    },
    ["Advertising"] = {
        title = "Advertising",
        texts = {
            "A player spammed advertisements repeatedly in the game chat. They posted multiple links and promotional content against platform rules and continued even after being asked to stop.",
            "I observed a player advertising external Discord servers, YouTube channels, and promotional links continuously in the game chat. This is prohibited advertising behavior that violates Roblox platform policies.",
            "There was significant spam flooding in the game chat with repetitive messages, multiple links, and promotional content disrupting normal gameplay.",
            "A player engaged in persistent spam advertising including game recommendations, Discord server invites, and external links throughout their session.",
            "I observed a player repeatedly advertise and spam the same promotional content and links multiple times within a short timeframe."
        }
    },
    ["Exploiting"] = {
        title = "Exploiting",
        texts = {
            "I observed another player utilizing an exploit or hack that grants unfair gameplay advantage. I directly witnessed them flying, using speed hacks, and becoming invisible in a game where none of these abilities exist normally.",
            "A player was using a game exploit or vulnerability that I could clearly observe. They were walking through walls, having infinite health, and teleporting around the map.",
            "I detected clear exploitation from another player. They were using external tools or scripts to gain an unfair advantage in the game.",
            "I confirmed a player using exploits with impossible abilities that should not exist in normal gameplay. They were generating infinite money and items from nothing.",
            "A player was utilizing a paid exploit menu or mod tool. I observed wallhacking and speedhacking which was clearly affecting other players' gameplay experience negatively."
        }
    },
    ["Scamming"] = {
        title = "Scamming",
        texts = {
            "I was scammed by a player in a game trade. They promised certain items in exchange but completely failed to deliver. This is fraudulent behavior that violates the game's trading guidelines.",
            "A player conducted a clear scam operation. They took my valuable items and currency with false promises of return that never happened.",
            "I am a victim of a scam from another player. They promised to provide services or items but completely failed to deliver as promised.",
            "A player is running a scam scheme targeting multiple players. They make false promises to players in exchange for items and currency.",
            "I was scammed by a player who engaged in item and currency fraud. They took my items claiming they would be doubled or returned, but kept everything."
        }
    },
    ["Racism"] = {
        title = "Racism",
        texts = {
            "A player used racist slurs and discriminatory language toward other players. They engaged in hate speech directed at players based on race and ethnicity.",
            "I observed a player engaged in discriminatory behavior. They made racist comments and hateful language creating a hostile environment.",
            "A player directed racism at other players. They used slurs and discriminatory statements about race and nationality.",
            "I witnessed a player make discriminatory comments based on religion and ethnicity. They used hateful language that violates community standards.",
            "A player promoted discriminatory ideology through racist remarks and hate speech. This violates platform policy on equality and respect."
        }
    },
    ["Threats"] = {
        title = "Threats",
        texts = {
            "A player made serious threatening statements toward me. They made death threats and used intimidation tactics attempting to scare me.",
            "I reported another player who threatened me with doxxing and real-world harm. This is serious threatening behavior that requires immediate action.",
            "A player engaged in intimidation directed at me. They made threatening statements about hacking my account and falsely reporting me.",
            "I received violent threats from a player including specific harm threats. This constitutes serious threatening behavior.",
            "A player threatened to file false reports, hack my account, and cause real-world harm. These are intimidation tactics creating an unsafe environment."
        }
    },
    ["Username"] = {
        title = "Username",
        texts = {
            "A player has an inappropriate username containing offensive language and slurs. This violates username policy requirements.",
            "The username I observed contains explicit adult content that is inappropriate for this platform.",
            "A player's username contains hate speech and slurs. This directly violates Roblox naming standards.",
            "I found a username that includes sexual and adult content that is completely inappropriate for a family-friendly platform.",
            "A player's username contains offensive language and slurs that creates a hostile environment."
        }
    },
    ["Game Content"] = {
        title = "Game Content",
        texts = {
            "This game contains inappropriate 18+ sexual content throughout. Explicit dialogue, animations, and digital assets are present that violate platform content policy.",
            "This game features adult content including repeated sexual references and mature material that is unsuitable for the Roblox platform.",
            "This game includes hate speech and offensive content. Racial slurs and discriminatory material are present in the game mechanics.",
            "This game contains excessive violence and gore that is inappropriate for platform standards.",
            "This game is designed to promote adult behavior and sexual roleplay. The content and game mechanics explicitly violate Roblox community standards."
        }
    },
    ["Impersonation"] = {
        title = "Impersonation",
        texts = {
            "Another player is impersonating me or another legitimate player. Their username and avatar are designed to look identical to the real account.",
            "A player is impersonating a game developer or staff member. They make false claims of authority which cause confusion.",
            "A player created an account impersonating a legitimate account to scam and deceive other players.",
            "A player is pretending to be my friend or a content creator to deceive other players.",
            "I observed a clear impersonation attempt where a player mimicked a verified account appearance to conduct fraud."
        }
    },
    ["Child Safety"] = {
        title = "Child Safety",
        texts = {
            "A player exhibited behavior that is concerning regarding child safety. They made inappropriate comments directed toward younger players.",
            "I observed a player engaged in grooming behavior toward younger players. They attempted to manipulate children into private conversations.",
            "I am reporting a child safety concern: A player made solicitations toward minors that are inappropriate and concerning.",
            "I witnessed predatory behavior from a player who was targeting younger players.",
            "A player attempted to contact younger players for inappropriate offline communication. This is a major safety concern."
        }
    },
    ["Bot Account"] = {
        title = "Bot Account",
        texts = {
            "I identified another account that appears to be a bot or fake account. The automated behavior and spam patterns are obvious.",
            "An account is displaying clear bot characteristics including highly repetitive behavior and suspicious activity patterns.",
            "I observed a suspicious account exhibiting bot-like behavior. Automated responses and unnatural gameplay patterns suggest this is a fake account.",
            "I confirmed an account is likely a bot. It shows zero legitimate gameplay interaction.",
            "An account has been confirmed as a bot account. It displays automated advertising and spam patterns with a suspicious activity timeline."
        }
    },
    ["Toxicity"] = {
        title = "Toxicity",
        texts = {
            "I observed a player exhibiting toxic and rude behavior toward multiple other players. They used aggressive language throughout their session.",
            "A player displayed extremely toxic behavior in the game chat. They made rude comments and created a negative atmosphere.",
            "I witnessed toxicity from a player who made rude remarks to other players constantly.",
            "A player displayed rudeness and a generally toxic attitude. They gave aggressive responses and treated other players with disrespect.",
            "A player exhibited toxic behavior including rude language and disrespectful treatment of other players."
        }
    }
}

local function createRepTextUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RepTextUI"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    
    -- Main Container (Ultra Compact)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 240, 0, 290)
    mainFrame.Position = UDim2.new(0.5, -120, 0.5, -145)
    mainFrame.BackgroundColor3 = UI_CONFIG.Theme.Background
    mainFrame.BorderColor3 = UI_CONFIG.Theme.Border
    mainFrame.BorderSizePixel = 2
    mainFrame.Parent = screenGui
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 6)
    mainCorner.Parent = mainFrame
    
    -- Drag Support (hanya di title text area)
    local isDragging = false
    local dragStart = Vector2.new(0, 0)
    local dragOffset = Vector2.new(0, 0)
    
    titleText.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            dragOffset = Vector2.new(mainFrame.Position.X.Offset - input.Position.X, mainFrame.Position.Y.Offset - input.Position.Y)
        end
    end)
    
    titleText.InputEnded:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
    
    titleText.InputChanged:Connect(function(input, gameProcessed)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local newX = input.Position.X + dragOffset.X
            local newY = input.Position.Y + dragOffset.Y
            mainFrame.Position = UDim2.new(0, newX, 0, newY)
        end
    end)
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 32)
    titleBar.BackgroundColor3 = UI_CONFIG.Theme.Dark
    titleBar.BorderColor3 = UI_CONFIG.Theme.Border
    titleBar.BorderSizePixel = 1
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 6)
    titleCorner.Parent = titleBar
    
    -- Title Text (draggable area)
    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, -78, 1, 0)
    titleText.BackgroundTransparency = 1
    titleText.TextColor3 = UI_CONFIG.Theme.Text
    titleText.TextSize = 10
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = "Anonymous9x"
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    local titlePadding = Instance.new("UIPadding")
    titlePadding.PaddingLeft = UDim.new(0, 6)
    titlePadding.Parent = titleText
    
    -- Button Container (keeps all buttons in bounds)
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Size = UDim2.new(0, 72, 1, 0)
    buttonContainer.Position = UDim2.new(1, -72, 0, 0)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = titleBar
    
    -- Help Button (leftmost)
    local helpBtn = Instance.new("TextButton")
    helpBtn.Name = "HelpBtn"
    helpBtn.Size = UDim2.new(0, 22, 0, 22)
    helpBtn.Position = UDim2.new(0, 2, 0.5, -11)
    helpBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    helpBtn.BorderColor3 = UI_CONFIG.Theme.Border
    helpBtn.BorderSizePixel = 1
    helpBtn.TextColor3 = UI_CONFIG.Theme.Text
    helpBtn.TextSize = 11
    helpBtn.Font = Enum.Font.GothamBold
    helpBtn.Text = "?"
    helpBtn.Parent = buttonContainer
    
    local helpCorner = Instance.new("UICorner")
    helpCorner.CornerRadius = UDim.new(0, 3)
    helpCorner.Parent = helpBtn
    
    -- Minimize Button (middle)
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeBtn"
    minimizeBtn.Size = UDim2.new(0, 22, 0, 22)
    minimizeBtn.Position = UDim2.new(0, 26, 0.5, -11)
    minimizeBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    minimizeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    minimizeBtn.BorderSizePixel = 1
    minimizeBtn.TextColor3 = UI_CONFIG.Theme.Text
    minimizeBtn.TextSize = 13
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Text = "−"
    minimizeBtn.Parent = buttonContainer
    
    local minCorner = Instance.new("UICorner")
    minCorner.CornerRadius = UDim.new(0, 3)
    minCorner.Parent = minimizeBtn
    
    -- Close Button (rightmost)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(0, 50, 0.5, -11)
    closeBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    closeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    closeBtn.BorderSizePixel = 1
    closeBtn.TextColor3 = UI_CONFIG.Theme.Text
    closeBtn.TextSize = 13
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.Parent = buttonContainer
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 3)
    closeCorner.Parent = closeBtn
    
    -- Button hover effects
    helpBtn.MouseEnter:Connect(function()
        helpBtn.BackgroundColor3 = UI_CONFIG.Theme.Hover
    end)
    
    helpBtn.MouseLeave:Connect(function()
        helpBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    end)
    
    minimizeBtn.MouseEnter:Connect(function()
        minimizeBtn.BackgroundColor3 = UI_CONFIG.Theme.Hover
    end)
    
    minimizeBtn.MouseLeave:Connect(function()
        minimizeBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    end)
    
    closeBtn.MouseEnter:Connect(function()
        closeBtn.BackgroundColor3 = UI_CONFIG.Theme.Hover
    end)
    
    closeBtn.MouseLeave:Connect(function()
        closeBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
    end)
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -32)
    contentFrame.Position = UDim2.new(0, 0, 0, 32)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- Category Scroll
    local categoryScroll = Instance.new("ScrollingFrame")
    categoryScroll.Name = "CategoryScroll"
    categoryScroll.Size = UDim2.new(1, 0, 0, 38)
    categoryScroll.BackgroundColor3 = UI_CONFIG.Theme.Dark
    categoryScroll.BorderColor3 = UI_CONFIG.Theme.Border
    categoryScroll.BorderSizePixel = 1
    categoryScroll.ScrollBarThickness = 2
    categoryScroll.CanvasSize = UDim2.new(4, 0, 0, 38)
    categoryScroll.Parent = contentFrame
    
    pcall(function() categoryScroll.ScrollDirection = Enum.ScrollDirection.X end)
    
    local catLayout = Instance.new("UIListLayout")
    catLayout.FillDirection = Enum.FillDirection.Horizontal
    catLayout.Padding = UDim.new(0, 4)
    catLayout.Parent = categoryScroll
    
    local catPadding = Instance.new("UIPadding")
    catPadding.PaddingLeft = UDim.new(0, 4)
    catPadding.PaddingRight = UDim.new(0, 4)
    catPadding.Parent = categoryScroll
    
    -- Text Scroll
    local textScroll = Instance.new("ScrollingFrame")
    textScroll.Name = "TextScroll"
    textScroll.Size = UDim2.new(1, 0, 1, -42)
    textScroll.Position = UDim2.new(0, 0, 0, 38)
    textScroll.BackgroundColor3 = UI_CONFIG.Theme.Background
    textScroll.BorderColor3 = UI_CONFIG.Theme.Border
    textScroll.BorderSizePixel = 1
    textScroll.ScrollBarThickness = 2
    textScroll.CanvasSize = UDim2.new(0, 0, 10, 0)
    textScroll.Parent = contentFrame
    
    local textLayout = Instance.new("UIListLayout")
    textLayout.FillDirection = Enum.FillDirection.Vertical
    textLayout.Padding = UDim.new(0, 4)
    textLayout.Parent = textScroll
    
    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 5)
    textPadding.PaddingRight = UDim.new(0, 5)
    textPadding.PaddingTop = UDim.new(0, 5)
    textPadding.PaddingBottom = UDim.new(0, 5)
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
    loadingBox.Size = UDim2.new(0, 90, 0, 60)
    loadingBox.Position = UDim2.new(0.5, -45, 0.5, -30)
    loadingBox.BackgroundColor3 = UI_CONFIG.Theme.Dark
    loadingBox.BorderColor3 = UI_CONFIG.Theme.Border
    loadingBox.BorderSizePixel = 2
    loadingBox.Parent = loadingScreen
    
    local loadCorner = Instance.new("UICorner")
    loadCorner.CornerRadius = UDim.new(0, 4)
    loadCorner.Parent = loadingBox
    
    local dotsContainer = Instance.new("Frame")
    dotsContainer.Size = UDim2.new(1, 0, 0.5, 0)
    dotsContainer.BackgroundTransparency = 1
    dotsContainer.Parent = loadingBox
    
    local dots = {}
    for i = 1, 3 do
        local dot = Instance.new("TextLabel")
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.Position = UDim2.new(0.5, -10 + (i-1)*10, 0.5, -2)
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
    loadText.TextSize = 8
    loadText.Font = Enum.Font.GothamBold
    loadText.Text = "Loading..."
    loadText.Parent = loadingBox
    
    -- Help Panel
    local helpPanel = Instance.new("Frame")
    helpPanel.Name = "HelpPanel"
    helpPanel.Size = UDim2.new(1, 0, 1, 0)
    helpPanel.BackgroundColor3 = UI_CONFIG.Theme.Background
    helpPanel.Visible = false
    helpPanel.Parent = mainFrame
    
    local helpScroll = Instance.new("ScrollingFrame")
    helpScroll.Size = UDim2.new(1, 0, 1, -32)
    helpScroll.Position = UDim2.new(0, 0, 0, 32)
    helpScroll.BackgroundTransparency = 1
    helpScroll.ScrollBarThickness = 2
    helpScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
    helpScroll.Parent = helpPanel
    
    local helpText = Instance.new("TextLabel")
    helpText.Size = UDim2.new(1, -10, 0, 150)
    helpText.BackgroundTransparency = 1
    helpText.TextColor3 = UI_CONFIG.Theme.TextSecondary
    helpText.TextSize = 7
    helpText.Font = Enum.Font.Gotham
    helpText.Text = "HOW TO USE:\n\n1. Scroll right ↔ to find category\n\n2. Click category to load texts\n\n3. Read text preview\n\n4. Click COPY button\n\n5. Open Roblox report form\n\n6. Paste text (Ctrl+V)\n\n7. Submit report\n\nDRAG: Click & drag UI anywhere\n\nMINIMIZE: Click − button\n\nCLOSE: Click × button\n\nHELP: Click ? button"
    helpText.TextWrapped = true
    helpText.TextXAlignment = Enum.TextXAlignment.Left
    helpText.TextYAlignment = Enum.TextYAlignment.Top
    helpText.Parent = helpScroll
    
    local helpPadding = Instance.new("UIPadding")
    helpPadding.PaddingLeft = UDim.new(0, 5)
    helpPadding.PaddingRight = UDim.new(0, 5)
    helpPadding.PaddingTop = UDim.new(0, 5)
    helpPadding.Parent = helpText
    
    -- Variables
    local isMinimized = false
    local selectedCategory = nil
    
    -- Create Category Button
    local function createCategoryButton(categoryName)
        local btn = Instance.new("TextButton")
        btn.Name = categoryName
        btn.Size = UDim2.new(0, 50, 0, 30)
        btn.BackgroundColor3 = UI_CONFIG.Theme.Dark
        btn.BorderColor3 = UI_CONFIG.Theme.Border
        btn.BorderSizePixel = 1
        btn.TextColor3 = UI_CONFIG.Theme.TextSecondary
        btn.TextSize = 7
        btn.Font = Enum.Font.GothamBold
        btn.Text = REPORT_TEXTS[categoryName].title
        btn.TextWrapped = true
        btn.Parent = categoryScroll
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 3)
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
            
            if selectedCategory and categoryScroll:FindFirstChild(selectedCategory) then
                local prevBtn = categoryScroll:FindFirstChild(selectedCategory)
                prevBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
                prevBtn.TextColor3 = UI_CONFIG.Theme.TextSecondary
            end
            
            selectedCategory = categoryName
            btn.BackgroundColor3 = UI_CONFIG.Theme.Accent
            btn.TextColor3 = UI_CONFIG.Theme.Text
            
            for _, child in ipairs(textScroll:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            wait(0.2)
            
            for i, text in ipairs(REPORT_TEXTS[categoryName].texts) do
                local textCard = Instance.new("Frame")
                textCard.Size = UDim2.new(1, -10, 0, 65)
                textCard.BackgroundColor3 = UI_CONFIG.Theme.Card
                textCard.BorderColor3 = UI_CONFIG.Theme.Border
                textCard.BorderSizePixel = 1
                textCard.Parent = textScroll
                
                local cardCorner = Instance.new("UICorner")
                cardCorner.CornerRadius = UDim.new(0, 4)
                cardCorner.Parent = textCard
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, -6, 1, -26)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = UI_CONFIG.Theme.TextSecondary
                textLabel.TextSize = 6.5
                textLabel.Font = Enum.Font.Gotham
                textLabel.Text = text
                textLabel.TextWrapped = true
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.TextYAlignment = Enum.TextYAlignment.Top
                textLabel.Parent = textCard
                
                local labelPadding = Instance.new("UIPadding")
                labelPadding.PaddingLeft = UDim.new(0, 3)
                labelPadding.PaddingRight = UDim.new(0, 3)
                labelPadding.PaddingTop = UDim.new(0, 3)
                labelPadding.Parent = textLabel
                
                local copyBtn = Instance.new("TextButton")
                copyBtn.Size = UDim2.new(1, -6, 0, 18)
                copyBtn.Position = UDim2.new(0, 3, 1, -21)
                copyBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
                copyBtn.BorderColor3 = UI_CONFIG.Theme.Border
                copyBtn.BorderSizePixel = 1
                copyBtn.TextColor3 = UI_CONFIG.Theme.Text
                copyBtn.TextSize = 7
                copyBtn.Font = Enum.Font.GothamBold
                copyBtn.Text = "COPY"
                copyBtn.Parent = textCard
                
                local btnCorner2 = Instance.new("UICorner")
                btnCorner2.CornerRadius = UDim.new(0, 2)
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
                        task.wait(1)
                        copyBtn.Text = "COPY"
                    end)
                end)
                
                textCard.LayoutOrder = i
            end
            
            textScroll.CanvasSize = UDim2.new(0, 0, 0, textLayout.AbsoluteContentSize.Y + 10)
            loadingScreen.Visible = false
        end)
        
        return btn
    end
    
    for categoryName, _ in pairs(REPORT_TEXTS) do
        createCategoryButton(categoryName)
    end
    
    -- Button Click Handlers (Fixed)
    local helpClicked = false
    helpBtn.MouseButton1Click:Connect(function()
        helpClicked = not helpClicked
        if helpClicked then
            helpPanel.Visible = true
            contentFrame.Visible = false
            helpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        else
            helpPanel.Visible = false
            contentFrame.Visible = true
            helpBtn.BackgroundColor3 = UI_CONFIG.Theme.Accent
        end
    end)
    
    local minimizeClicked = false
    minimizeBtn.MouseButton1Click:Connect(function()
        minimizeClicked = not minimizeClicked
        if minimizeClicked then
            isMinimized = true
            contentFrame.Visible = false
            helpPanel.Visible = false
            mainFrame.Size = UDim2.new(0, 240, 0, 32)
            minimizeBtn.Text = "+"
        else
            isMinimized = false
            contentFrame.Visible = true
            mainFrame.Size = UDim2.new(0, 240, 0, 290)
            minimizeBtn.Text = "−"
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        pcall(function()
            screenGui:Destroy()
        end)
    end)
    
    -- Loading Animation
    RunService.RenderStepped:Connect(function()
        if loadingScreen.Visible then
            local elapsed = tick() % 0.6
            for i, dot in ipairs(dots) do
                local delay = (i - 1) * 0.1
                local phase = (elapsed - delay) % 0.6
                
                if phase < 0.3 then
                    local t = phase / 0.3
                    dot.BackgroundTransparency = 0.5 - (0.3 * t)
                else
                    local t = (phase - 0.3) / 0.3
                    dot.BackgroundTransparency = 0.2 + (0.3 * t)
                end
            end
        end
    end)
    
    -- Mobile Swipe
    local startX = 0
    contentFrame.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Touch then
            startX = input.Position.X
        end
    end)
    
    contentFrame.InputChanged:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.Touch then
            local deltaX = startX - input.Position.X
            if math.abs(deltaX) > 2 then
                categoryScroll.CanvasPosition = categoryScroll.CanvasPosition + Vector2.new(deltaX * 0.5, 0)
                startX = input.Position.X
            end
        end
    end)
    
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

local function safeInit()
    local success, err = pcall(createRepTextUI)
    if not success then
        warn("RepText Error: " .. tostring(err))
    end
end

safeInit()
print("✓ Anonymous9x RepText v2.2 - Ultra Compact Loaded!")
