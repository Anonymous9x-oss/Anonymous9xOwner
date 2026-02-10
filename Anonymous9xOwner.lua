-- Anonymous9x RepText UI v1.2 - FIXED VERSION
-- Theme: Noir (Black Background, White Text & Border)
-- Mobile & PC Compatible with Horizontal Scroll

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- UI Configuration
local UI_CONFIG = {
    Name = "Anonymous9x RepText",
    Creator = "Anonymous9x",
    Version = "1.2",
    Theme = {
        Background = Color3.fromRGB(15, 15, 15),
        Border = Color3.fromRGB(255, 255, 255),
        Text = Color3.fromRGB(255, 255, 255),
        Dark = Color3.fromRGB(20, 20, 20),
        Hover = Color3.fromRGB(30, 30, 30)
    }
}

-- Report Categories dengan teks yang work untuk moderator Roblox (NO PLACEHOLDERS - COPY PASTE LANGSUNG)
local REPORT_TEXTS = {
    ["Harassment"] = {
        title = "Harassment/Bullying",
        texts = {
            "I was repeatedly targeted with harassment including toxic language and disrespectful comments during gameplay. This player's behavior violates community standards and creates a negative environment for other players. The harassment continued even after I requested them to stop.",
            "I am a victim of ongoing harassment from another player. They used offensive language directed at me specifically, attempting to provoke confrontation and make me uncomfortable. Multiple witnesses were present during this incident and can confirm the behavior.",
            "A player engaged in a harassment campaign against me including name-calling and derogatory remarks. This constitutes clear bullying behavior that disrupts normal gameplay experience. The targeting was persistent and intentional.",
            "I was harassed by a player with insults and toxic behavior throughout multiple game sessions. When I requested them to stop, the harassment continued unabated. This is a clear violation of Roblox community guidelines and creates an unsafe environment."
        }
    },
    ["18+ Content"] = {
        title = "18+ / Sexual Content",
        texts = {
            "A player created inappropriate 18+ sexual content in the game environment. Sexual dialogue and explicit material are present which violates Roblox community standards for an all-ages platform. The content is clearly designed to be inappropriate and has made other players uncomfortable.",
            "A player engaged in sexual roleplay and posted adult content repeatedly in the public game chat. This explicitly violates platform policy regarding mature content that has no place on a family-friendly game. Multiple players witnessed this inappropriate behavior.",
            "I witnessed inappropriate sexual behavior including explicit language and adult roleplay from another player. Multiple players witnessed this conduct and reported discomfort. Immediate action is required as this violates content policies.",
            "A player spammed 18+ content and sexual messages throughout the public chat. They attempted to engage other players in adult conversations and continue despite being ignored. This is a clear policy violation affecting the entire player base.",
            "A player promoted adult content with links and references to inappropriate material. This directly violates Roblox Terms of Service regarding sexual content that is completely inappropriate on a youth platform."
        }
    },
    ["Advertising/Spam"] = {
        title = "Advertising/Spam",
        texts = {
            "A player spammed advertisements repeatedly in the game chat. They posted multiple links and promotional content against platform rules and continued even after being asked to stop. This behavior disrupted the normal game experience for everyone.",
            "I observed a player advertising external Discord servers, YouTube channels, and promotional links continuously in the game chat. This is prohibited advertising behavior that violates Roblox platform policies and creates spam.",
            "There was significant spam flooding in the game chat with repetitive messages, multiple links, and promotional content disrupting normal gameplay. The same player posted these messages several times, clearly intentional spam.",
            "A player engaged in persistent spam advertising including game recommendations, Discord server invites, and external links throughout their session. This behavior violates anti-spam policy and makes the game unenjoyable.",
            "I observed a player repeatedly advertise and spam the same promotional content and links multiple times within a short timeframe. This creates clear disruption to the game environment and chat quality for all players."
        }
    },
    ["Exploiting"] = {
        title = "Exploiting/Hacking",
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
        texts = {
            "I was scammed by a player in a game trade. They promised certain items in exchange but completely failed to deliver. This is fraudulent behavior that violates the game's trading guidelines and took advantage of my trust.",
            "A player conducted a clear scam operation. They took my valuable items and currency with false promises of return that never happened. Multiple other players have reported being scammed by the same person using the same methods.",
            "I am a victim of a scam from another player. They promised to provide services or items but completely failed to deliver as promised. I lost significant in-game currency due to this deliberate scam.",
            "A player is running a scam scheme targeting multiple players. They make false promises to players in exchange for items and currency. Multiple reports from other players confirm this is an ongoing pattern of fraudulent activity.",
            "I was scammed by a player who engaged in item and currency fraud. They took my items claiming they would be doubled or returned, but kept everything. This is clear scamming behavior and intentional theft."
        }
    },
    ["Inappropriate Name"] = {
        title = "Inappropriate Username",
        texts = {
            "A player has an inappropriate username containing offensive language and slurs. This violates username policy requirements that are necessary for maintaining a respectful community environment for all players.",
            "The username I observed contains explicit adult content that is inappropriate for this platform. This represents a clear breach of username policy as it contains adult references and offensive slurs.",
            "A player's username contains hate speech and slurs. This directly violates Roblox naming standards and community conduct requirements that prohibit discriminatory and hateful usernames.",
            "I found a username that includes sexual and adult content that is completely inappropriate for a family-friendly platform. This breaches username conduct policy significantly.",
            "A player's username contains offensive language and slurs that creates a hostile environment. This violates community standards for username selection and appropriateness."
        }
    },
    ["Inappropriate Game Content"] = {
        title = "Inappropriate Game Content",
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
        texts = {
            "Another player is impersonating me or another legitimate player. Their username and avatar are designed to look identical to the real account, causing confusion and enabling fraud through deception.",
            "A player is impersonating a game developer or staff member. They make false claims of authority which cause confusion among other players. This violates impersonation policy and enables deception.",
            "A player created an account impersonating a legitimate account to scam and deceive other players. The fake account is designed to look nearly identical to the real account and has fooled multiple people.",
            "A player is pretending to be my friend or a content creator to deceive other players. They are deceiving players for personal gain through this false identity. This is a clear impersonation violation.",
            "I observed a clear impersonation attempt where a player mimicked a verified account appearance to conduct fraud. Multiple players were deceived by this false identity."
        }
    },
    ["Child Safety Concern"] = {
        title = "Child Safety Concern",
        texts = {
            "A player exhibited behavior that is concerning regarding child safety. They made inappropriate comments directed toward younger players in the game which raises serious safety concerns.",
            "I observed a player engaged in grooming behavior toward younger players. They attempted to manipulate children into private conversations for inappropriate purposes. This is predatory behavior.",
            "I am reporting a child safety concern: A player made solicitations toward minors that are inappropriate and concerning. This is a clear policy violation requiring immediate investigation by the safety team.",
            "I witnessed predatory behavior from a player who was targeting younger players. They made inappropriate proposals and requests that caused visible discomfort to the minors. This requires urgent attention.",
            "A player attempted to contact younger players for inappropriate offline communication. This is a major safety concern requiring immediate action to protect minors on the platform."
        }
    },
    ["Racism/Discrimination"] = {
        title = "Racism/Discrimination",
        texts = {
            "A player used racist slurs and discriminatory language toward other players. They engaged in hate speech directed at players based on race and ethnicity. This behavior is completely unacceptable.",
            "I observed a player engaged in discriminatory behavior. They made racist comments and hateful language creating a hostile environment. Multiple witnesses were present and can confirm this behavior.",
            "A player directed racism at other players. They used slurs and discriminatory statements about race and nationality. This violates anti-discrimination policy and creates an unsafe environment.",
            "I witnessed a player make discriminatory comments based on religion and ethnicity. They used hateful language that violates community standards for a respectful environment.",
            "A player promoted discriminatory ideology through racist remarks and hate speech. This violates platform policy on equality and respect for all players."
        }
    },
    ["Threatening Behavior"] = {
        title = "Threatening/Intimidation",
        texts = {
            "A player made serious threatening statements toward me. They made death threats and used intimidation tactics attempting to scare me and coerce my behavior. These are direct threats that create fear.",
            "I reported another player who threatened me with doxxing and real-world harm. This is serious threatening behavior that requires immediate action and investigation.",
            "A player engaged in intimidation directed at me. They made threatening statements about hacking my account and falsely reporting me to coerce compliance with their demands.",
            "I received violent threats from a player including specific harm threats. This constitutes serious threatening behavior that is a policy violation and creates genuine safety concerns.",
            "A player threatened to file false reports, hack my account, and cause real-world harm. These are intimidation tactics creating an unsafe environment and require investigation."
        }
    },
    ["Inappropriate Content"] = {
        title = "Inappropriate Content/Context",
        texts = {
            "A player shared inappropriate images and content in the game. Explicit or offensive material was displayed in chat and through game assets, violating content guidelines.",
            "I observed a player displaying inappropriate items and clothing using game customization features. Adult or offensive content was visible to all other players in the game.",
            "A player shared inappropriate content including references to drugs and alcohol in a way that violates age-appropriate content policy. This is not suitable for the platform.",
            "A player made inappropriate jokes and comments with sexual context. The crude and offensive language they used is disrupting the family-friendly environment.",
            "A player shared content that violates platform guidelines including explicit links and references that are inappropriate for the platform's user base."
        }
    },
    ["Bot/Fake Account"] = {
        title = "Bot/Suspicious Account",
        texts = {
            "I identified another account that appears to be a bot or fake account. The automated behavior and spam patterns are obvious. This account does not appear to be a legitimate player.",
            "An account is displaying clear bot characteristics including highly repetitive behavior and suspicious activity patterns. The account appears to be completely automated and not controlled by a real person.",
            "I observed a suspicious account exhibiting bot-like behavior. Automated responses and unnatural gameplay patterns strongly suggest this is a fake account.",
            "I confirmed an account is likely a bot. It shows zero legitimate gameplay interaction and only engages in repetitive spam and advertising behavior.",
            "An account has been confirmed as a bot account. It displays automated advertising and spam patterns with a suspicious activity timeline. This is not a genuine player account."
        }
    },
    ["Lag/Performance Abuse"] = {
        title = "Lag Abuse/Performance Exploit",
        texts = {
            "A player is intentionally causing lag to disrupt gameplay for everyone. They are using an exploit to deliberately reduce other players' performance unfairly.",
            "Another player is using a lag switch or lag abuse technique to create an unfair gameplay advantage through artificially reduced latency.",
            "I observed a player deliberately causing server and network issues that negatively affected all other players' experience. This lag abuse is intentional.",
            "A player is exploiting game mechanics to cause lag and stuttering that unfairly affects other players in the game.",
            "A player is utilizing a lag abuse technique for competitive advantage. The deliberate performance degradation is affecting fairness for everyone."
        }
    },
    ["Begging/Soliciting"] = {
        title = "Begging/Soliciting",
        texts = {
            "A player is constantly begging other players for items and currency. This repeated solicitation is disrupting the gameplay experience for everyone.",
            "Another player engaged in aggressive begging and solicitation of other players. They continue despite requests to stop, creating an uncomfortable environment.",
            "I observed constant begging from a player asking for items, money, and Robux. The disruption to normal gameplay is affecting the entire community.",
            "A player repeatedly solicits other players for items and currency. They ignore requests from other players to stop this behavior.",
            "A player is running a begging scheme targeting other players repeatedly. This constitutes harassment through persistent unwanted solicitation attempts."
        }
    },
    ["Rudeness/Toxicity"] = {
        title = "General Rudeness/Toxicity",
        texts = {
            "I observed a player exhibiting toxic and rude behavior toward multiple other players. They used aggressive language and made disrespectful comments throughout their entire gameplay session.",
            "A player displayed extremely toxic behavior in the game chat. They made rude comments, complained excessively, and created a negative atmosphere affecting everyone.",
            "I witnessed toxicity from a player who made rude remarks to other players, complained constantly, and created a very negative game atmosphere.",
            "A player displayed rudeness and a generally toxic attitude. They gave aggressive responses and treated other players with disrespect.",
            "A player exhibited toxic behavior including rude language and disrespectful treatment of other players. This creates a negative community experience."
        }
    }
}

-- Main GUI Creation dengan Better Error Handling
local function createRepTextUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RepTextUI"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    
    -- Main Container (Fixed Position, Small Size)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 280, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -140, 0.5, -175)
    mainFrame.BackgroundColor3 = UI_CONFIG.Theme.Background
    mainFrame.BorderColor3 = UI_CONFIG.Theme.Border
    mainFrame.BorderSizePixel = 2
    mainFrame.Parent = screenGui
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = UI_CONFIG.Theme.Dark
    titleBar.BorderColor3 = UI_CONFIG.Theme.Border
    titleBar.BorderSizePixel = 1
    titleBar.Parent = mainFrame
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -65, 1, 0)
    titleText.BackgroundTransparency = 1
    titleText.TextColor3 = UI_CONFIG.Theme.Text
    titleText.TextSize = 12
    titleText.Font = Enum.Font.GothamBold
    titleText.Text = "Anonymous9x RepText"
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    local titlePadding = Instance.new("UIPadding")
    titlePadding.PaddingLeft = UDim.new(0, 8)
    titlePadding.Parent = titleText
    
    -- Minimize Button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeBtn"
    minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
    minimizeBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
    minimizeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    minimizeBtn.BorderSizePixel = 1
    minimizeBtn.TextColor3 = UI_CONFIG.Theme.Text
    minimizeBtn.TextSize = 14
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Text = "−"
    minimizeBtn.Position = UDim2.new(1, -65, 0, 0)
    minimizeBtn.Parent = titleBar
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.BackgroundColor3 = UI_CONFIG.Theme.Dark
    closeBtn.BorderColor3 = UI_CONFIG.Theme.Border
    closeBtn.BorderSizePixel = 1
    closeBtn.TextColor3 = UI_CONFIG.Theme.Text
    closeBtn.TextSize = 14
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.Position = UDim2.new(1, -32, 0, 0)
    closeBtn.Parent = titleBar
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -35)
    contentFrame.Position = UDim2.new(0, 0, 0, 35)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- Create Tab System (Category Scroll - Horizontal)
    local categoryContainer = Instance.new("ScrollingFrame")
    categoryContainer.Name = "CategoryContainer"
    categoryContainer.Size = UDim2.new(1, 0, 0, 50)
    categoryContainer.BackgroundColor3 = UI_CONFIG.Theme.Dark
    categoryContainer.BorderColor3 = UI_CONFIG.Theme.Border
    categoryContainer.BorderSizePixel = 1
    categoryContainer.ScrollBarThickness = 4
    categoryContainer.CanvasSize = UDim2.new(6, 0, 0, 50)
    pcall(function() 
        categoryContainer.ScrollDirection = Enum.ScrollDirection.X 
    end)
    categoryContainer.Parent = contentFrame
    
    local categoryLayout = Instance.new("UIListLayout")
    categoryLayout.FillDirection = Enum.FillDirection.Horizontal
    categoryLayout.Padding = UDim.new(0, 5)
    categoryLayout.Parent = categoryContainer
    
    local categoryPadding = Instance.new("UIPadding")
    categoryPadding.PaddingLeft = UDim.new(0, 5)
    categoryPadding.PaddingRight = UDim.new(0, 5)
    categoryPadding.Parent = categoryContainer
    
    -- Text Display Area
    local textDisplay = Instance.new("ScrollingFrame")
    textDisplay.Name = "TextDisplay"
    textDisplay.Size = UDim2.new(1, 0, 1, -60)
    textDisplay.Position = UDim2.new(0, 0, 0, 50)
    textDisplay.BackgroundColor3 = UI_CONFIG.Theme.Background
    textDisplay.BorderColor3 = UI_CONFIG.Theme.Border
    textDisplay.BorderSizePixel = 1
    textDisplay.ScrollBarThickness = 4
    textDisplay.CanvasSize = UDim2.new(0, 0, 10, 0)
    textDisplay.Parent = contentFrame
    
    local textLayout = Instance.new("UIListLayout")
    textLayout.FillDirection = Enum.FillDirection.Vertical
    textLayout.Padding = UDim.new(0, 5)
    textLayout.Parent = textDisplay
    
    local textPadding = Instance.new("UIPadding")
    textPadding.PaddingLeft = UDim.new(0, 8)
    textPadding.PaddingRight = UDim.new(0, 8)
    textPadding.PaddingTop = UDim.new(0, 8)
    textPadding.PaddingBottom = UDim.new(0, 8)
    textPadding.Parent = textDisplay
    
    -- Bottom Info
    local infoBar = Instance.new("Frame")
    infoBar.Name = "InfoBar"
    infoBar.Size = UDim2.new(1, 0, 0, 20)
    infoBar.Position = UDim2.new(0, 0, 1, -20)
    infoBar.BackgroundColor3 = UI_CONFIG.Theme.Dark
    infoBar.BorderColor3 = UI_CONFIG.Theme.Border
    infoBar.BorderSizePixel = 1
    infoBar.Parent = contentFrame
    
    local infoText = Instance.new("TextLabel")
    infoText.Name = "InfoText"
    infoText.Size = UDim2.new(1, 0, 1, 0)
    infoText.BackgroundTransparency = 1
    infoText.TextColor3 = Color3.fromRGB(150, 150, 150)
    infoText.TextSize = 8
    infoText.Font = Enum.Font.Gotham
    infoText.Text = "Created By Anonymous9x"
    infoText.TextXAlignment = Enum.TextXAlignment.Center
    infoText.Parent = infoBar
    
    -- Loading Screen (Modern Animation)
    local loadingScreen = Instance.new("Frame")
    loadingScreen.Name = "LoadingScreen"
    loadingScreen.Size = UDim2.new(1, 0, 1, 0)
    loadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loadingScreen.BackgroundTransparency = 0.5
    loadingScreen.Visible = false
    loadingScreen.Parent = mainFrame
    
    local loadingBox = Instance.new("Frame")
    loadingBox.Size = UDim2.new(0, 140, 0, 100)
    loadingBox.Position = UDim2.new(0.5, -70, 0.5, -50)
    loadingBox.BackgroundColor3 = UI_CONFIG.Theme.Background
    loadingBox.BorderColor3 = UI_CONFIG.Theme.Border
    loadingBox.BorderSizePixel = 2
    loadingBox.Parent = loadingScreen
    
    -- Animated Dots Container
    local dotsContainer = Instance.new("Frame")
    dotsContainer.Size = UDim2.new(1, 0, 0.6, 0)
    dotsContainer.Position = UDim2.new(0, 0, 0, 8)
    dotsContainer.BackgroundTransparency = 1
    dotsContainer.Parent = loadingBox
    
    -- Create 3 animated dots
    local dots = {}
    for i = 1, 3 do
        local dot = Instance.new("TextLabel")
        dot.Name = "Dot" .. i
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = UDim2.new(0.5, -20 + (i-1)*15, 0.5, -4)
        dot.BackgroundColor3 = UI_CONFIG.Theme.Text
        dot.BackgroundTransparency = 0.3
        dot.BorderSizePixel = 0
        dot.Text = ""
        dot.Parent = dotsContainer
        
        -- Create corner radius effect
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = dot
        
        dots[i] = dot
    end
    
    -- Loading Text
    local loadingText = Instance.new("TextLabel")
    loadingText.Name = "LoadingText"
    loadingText.Size = UDim2.new(1, 0, 0.4, 0)
    loadingText.Position = UDim2.new(0, 0, 0.6, 0)
    loadingText.BackgroundTransparency = 1
    loadingText.TextColor3 = UI_CONFIG.Theme.Text
    loadingText.TextSize = 10
    loadingText.Font = Enum.Font.GothamBold
    loadingText.Text = "Loading..."
    loadingText.Parent = loadingBox
    
    -- Pulsing Circle Background (decorative)
    local pulseCircle = Instance.new("Frame")
    pulseCircle.Name = "PulseCircle"
    pulseCircle.Size = UDim2.new(0, 60, 0, 60)
    pulseCircle.Position = UDim2.new(0.5, -30, 0.5, -30)
    pulseCircle.BackgroundColor3 = UI_CONFIG.Theme.Border
    pulseCircle.BackgroundTransparency = 0.9
    pulseCircle.BorderSizePixel = 0
    pulseCircle.Parent = loadingBox
    pulseCircle.ZIndex = 0
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = pulseCircle
    
    -- Variables
    local isMinimized = false
    local selectedCategory = nil
    
    -- Function: Create Category Button
    local function createCategoryButton(categoryName)
        local btn = Instance.new("TextButton")
        btn.Name = categoryName
        btn.Size = UDim2.new(0, 75, 0, 40)
        btn.BackgroundColor3 = UI_CONFIG.Theme.Dark
        btn.BorderColor3 = UI_CONFIG.Theme.Border
        btn.BorderSizePixel = 1
        btn.TextColor3 = UI_CONFIG.Theme.Text
        btn.TextSize = 9
        btn.Font = Enum.Font.GothamBold
        btn.Text = REPORT_TEXTS[categoryName].title
        btn.TextWrapped = true
        btn.Parent = categoryContainer
        
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = UI_CONFIG.Theme.Hover
        end)
        
        btn.MouseLeave:Connect(function()
            if selectedCategory ~= categoryName then
                btn.BackgroundColor3 = UI_CONFIG.Theme.Dark
            end
        end)
        
        btn.MouseButton1Click:Connect(function()
            loadingScreen.Visible = true
            
            -- Reset previous selection
            if selectedCategory and categoryContainer:FindFirstChild(selectedCategory) then
                categoryContainer:FindFirstChild(selectedCategory).BackgroundColor3 = UI_CONFIG.Theme.Dark
            end
            
            selectedCategory = categoryName
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            
            -- Clear text display
            for _, child in ipairs(textDisplay:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            -- Simulate loading
            wait(0.3)
            
            -- Load texts for category
            local texts = REPORT_TEXTS[categoryName].texts
            for i, text in ipairs(texts) do
                local textFrame = Instance.new("Frame")
                textFrame.Size = UDim2.new(1, -16, 0, 90)
                textFrame.BackgroundColor3 = UI_CONFIG.Theme.Dark
                textFrame.BorderColor3 = UI_CONFIG.Theme.Border
                textFrame.BorderSizePixel = 1
                textFrame.Parent = textDisplay
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, -8, 1, -35)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = UI_CONFIG.Theme.Text
                textLabel.TextSize = 8
                textLabel.Font = Enum.Font.Gotham
                textLabel.Text = text
                textLabel.TextWrapped = true
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.TextYAlignment = Enum.TextYAlignment.Top
                textLabel.Parent = textFrame
                
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
                copyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                copyBtn.BorderColor3 = UI_CONFIG.Theme.Border
                copyBtn.BorderSizePixel = 1
                copyBtn.TextColor3 = UI_CONFIG.Theme.Text
                copyBtn.TextSize = 9
                copyBtn.Font = Enum.Font.GothamBold
                copyBtn.Text = "COPY TEXT"
                copyBtn.Parent = textFrame
                
                copyBtn.MouseEnter:Connect(function()
                    copyBtn.BackgroundColor3 = UI_CONFIG.Theme.Hover
                end)
                
                copyBtn.MouseLeave:Connect(function()
                    copyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                end)
                
                copyBtn.MouseButton1Click:Connect(function()
                    pcall(function()
                        setclipboard(text)
                        copyBtn.Text = "COPIED!"
                        task.wait(1.5)
                        copyBtn.Text = "COPY TEXT"
                    end)
                end)
                
                textFrame.LayoutOrder = i
            end
            
            textDisplay.CanvasSize = UDim2.new(0, 0, 0, textLayout.AbsoluteContentSize.Y + 16)
            loadingScreen.Visible = false
        end)
        
        return btn
    end
    
    -- Create Category Buttons
    for categoryName, _ in pairs(REPORT_TEXTS) do
        createCategoryButton(categoryName)
    end
    
    -- Minimize Button Function
    minimizeBtn.MouseButton1Click:Connect(function()
        if not isMinimized then
            isMinimized = true
            contentFrame.Visible = false
            mainFrame.Size = UDim2.new(0, 280, 0, 35)
            minimizeBtn.Text = "+"
        else
            isMinimized = false
            contentFrame.Visible = true
            mainFrame.Size = UDim2.new(0, 280, 0, 350)
            minimizeBtn.Text = "−"
        end
    end)
    
    -- Close Button Function
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    -- Modern Loading Animation
    RunService.RenderStepped:Connect(function()
        if loadingScreen.Visible then
            local elapsed = tick() % 1.2 -- 1.2 second cycle
            
            -- Pulsing circle animation
            if pulseCircle then
                local pulseIntensity = math.sin(elapsed * math.pi * 2) * 0.4 + 0.5
                pulseCircle.BackgroundTransparency = 0.85 + (0.1 * pulseIntensity)
                pulseCircle.Size = UDim2.new(0, 50 + (20 * pulseIntensity), 0, 50 + (20 * pulseIntensity))
                pulseCircle.Position = UDim2.new(0.5, -25 - (10 * pulseIntensity), 0.5, -30)
            end
            
            -- Animated dots
            for i, dot in ipairs(dots) do
                local delay = (i - 1) * 0.15
                local dotPhase = (elapsed - delay) % 1.2
                
                if dotPhase < 0.4 then
                    -- Expanding phase
                    local t = dotPhase / 0.4
                    dot.BackgroundTransparency = 0.3 - (0.2 * t)
                    dot.Size = UDim2.new(0, 8 + (6 * t), 0, 8 + (6 * t))
                    dot.Position = UDim2.new(0.5, -20 + (i-1)*15 - (3 * t), 0.5, -4 - (3 * t))
                elseif dotPhase < 0.8 then
                    -- Peak phase
                    dot.BackgroundTransparency = 0.1
                    dot.Size = UDim2.new(0, 14, 0, 14)
                    dot.Position = UDim2.new(0.5, -20 + (i-1)*15 - 3, 0.5, -7)
                else
                    -- Collapsing phase
                    local t = (dotPhase - 0.8) / 0.4
                    dot.BackgroundTransparency = 0.1 + (0.2 * t)
                    dot.Size = UDim2.new(0, 14 - (6 * t), 0, 14 - (6 * t))
                    dot.Position = UDim2.new(0.5, -20 + (i-1)*15 - (3 - 3*t), 0.5, -7 + (3 * t))
                end
            end
        end
    end)
    
    -- Mobile Scroll Support
    local function setupMobileScroll()
        local startX = 0
        
        mainFrame.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.UserInputType == Enum.UserInputType.Touch then
                startX = input.Position.X
            end
        end)
        
        mainFrame.InputChanged:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.Touch then
                local currentX = input.Position.X
                local deltaX = startX - currentX
                
                if math.abs(deltaX) > 5 then
                    if deltaX > 0 then
                        categoryContainer.CanvasPosition = categoryContainer.CanvasPosition + Vector2.new(20, 0)
                    else
                        categoryContainer.CanvasPosition = categoryContainer.CanvasPosition - Vector2.new(20, 0)
                    end
                    startX = currentX
                end
            end
        end)
    end
    
    setupMobileScroll()
    
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    return screenGui
end

-- Anti-Error Wrapper
local function safeCreateUI()
    local success, err = pcall(function()
        createRepTextUI()
    end)
    
    if not success then
        warn("RepText UI Error: " .. tostring(err))
        task.wait(0.5)
    end
end

-- Initialize
safeCreateUI()

print("✓ Anonymous9x RepText UI v1.2 Loaded Successfully - FIXED VERSION")
