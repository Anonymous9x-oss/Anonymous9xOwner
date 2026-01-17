 -- ANONYMOUS9X TEAM - RepText v4.0 MOBILE
-- UKURAN KECIL & MOBILE FRIENDLY

local Players = game:GetService('Players')
local player = Players.LocalPlayer

-- Hapus GUI lama
if player.PlayerGui:FindFirstChild("Anonymous9xRepText") then
    player.PlayerGui.Anonymous9xRepText:Destroy()
end

-- Buat GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Anonymous9xRepText"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Main Frame - UKURAN LEBIH KECIL
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.9, 0, 0, 400)  -- 90% lebar, tinggi 400 (bukan 500)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Title Bar - LEBIH RENDAH
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 35)  -- 35 pixel (bukan 45)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10, 0, 0)
titleCorner.Parent = titleBar

-- Logo - UKURAN LEBIH KECIL
local logoText = Instance.new("TextLabel")
logoText.Name = "LogoText"
logoText.Size = UDim2.new(0.6, 0, 1, 0)
logoText.Position = UDim2.new(0.02, 0, 0, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "ANONYMOUS9X"
logoText.TextColor3 = Color3.fromRGB(220, 230, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 14  -- Lebih kecil
logoText.TextXAlignment = Enum.TextXAlignment.Left
logoText.Parent = titleBar

-- Minimize Button - LEBIH KECIL
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)  -- 25x25 (bukan 30x30)
minimizeBtn.Position = UDim2.new(1, -55, 0.5, -12.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
minimizeBtn.Text = "━"
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16  -- Lebih kecil
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 5)
minimizeCorner.Parent = minimizeBtn

-- Close Button - LEBIH KECIL
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -25, 0.5, -12.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeBtn

-- Content Area - UKURAN DIPERKECIL
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -10, 1, -45)  -- Padding lebih kecil
contentFrame.Position = UDim2.new(0, 5, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- VARIABEL GLOBAL
local selectedReport = nil
local reportText = ""

-- Dropdown - LEBIH KECIL
local dropdown = Instance.new("TextButton")
dropdown.Size = UDim2.new(1, 0, 0, 35)  -- 35 pixel (bukan 45)
dropdown.Position = UDim2.new(0, 0, 0, 0)
dropdown.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
dropdown.Text = "  ▼ Pilih Laporan"
dropdown.TextColor3 = Color3.new(0.9,0.9,1)
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 13  -- Lebih kecil
dropdown.TextXAlignment = Enum.TextXAlignment.Left
dropdown.Parent = contentFrame

local dropCorner = Instance.new("UICorner")
dropCorner.CornerRadius = UDim.new(0, 6)
dropCorner.Parent = dropdown

-- Options Frame - LEBIH KECIL
local optionsFrame = Instance.new("ScrollingFrame")
optionsFrame.Size = UDim2.new(1, 0, 0, 150)  -- 150 pixel (bukan 200)
optionsFrame.Position = UDim2.new(0, 0, 0, 40)
optionsFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false
optionsFrame.ScrollBarThickness = 5
optionsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
optionsFrame.Parent = contentFrame

local optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0, 6)
optionsCorner.Parent = optionsFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = optionsFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 5)
padding.Parent = optionsFrame

-- ========== REPORT DATA ==========
local reportData = {
    {
        name = "🚫 NSFW Avatar Bypass",
        text = "I'm reporting NSFW 'bypass' avatar items. A user/asset is using textures/accessories designed to bypass clothing filters to create nude or sexually explicit avatars. This violates Roblox's Community Standards on Sexual Content."
    },
    {
        name = "🔞 Sexualized Avatar", 
        text = "Reporting a sexualized avatar. The user's avatar contains sexually suggestive or explicit appearances, including mesh combinations mimicking nudity or private body parts. This is inappropriate for Roblox's all-ages platform and violates safety guidelines."
    },
    {
        name = "🎭 Scamming & Fraud",
        text = "Reporting a scam/fraud incident. A user/experience is promising free Robux, rare items, or special privileges in exchange for login details, real money, or completing surveys. This is a clear violation of Roblox's Terms of Service regarding scams and fraudulent activity."
    },
    {
        name = "💢 Harassment & Hate Speech",
        text = "Reporting severe harassment and hate speech. A user is using the chat, username, or display name to send bullying messages, hate speech based on race/religion/gender, threats, or extreme profanity. This creates a toxic and unsafe environment for other players."
    },
    {
        name = "⚡ Exploiting & Cheating",
        text = "Reporting a player who is using exploits/cheats. The user is utilizing third-party software or scripts to gain unfair advantages like flying, noclip, speed hacking, or modifying the game in ways that ruin the experience for others. This violates the Roblox Terms of Service."
    },
    {
        name = "⚠️ Multiple Violations",
        text = "I am reporting multiple serious violations by a user/group. This includes: 1) Creating/using NSFW 'bypass' avatars, 2) Engaging in scams/fraud, 3) Harassment/hate speech, and 4) Exploiting/cheating. This behavior severely breaches Roblox's Community Standards and creates an unsafe platform environment."
    }
}

-- Create option buttons - LEBIH KECIL
for i, data in ipairs(reportData) do
    local btn = Instance.new("TextButton")
    btn.Name = "Option_" .. i
    btn.Size = UDim2.new(1, -5, 0, 30)  -- 30 pixel (bukan 40)
    btn.BackgroundColor3 = Color3.fromRGB(40, 45, 65)
    btn.Text = " " .. data.name
    btn.TextColor3 = Color3.new(0.9,0.9,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12  -- Lebih kecil
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = optionsFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    -- Click handler
    btn.MouseButton1Click:Connect(function()
        selectedReport = data.name
        reportText = data.text
        dropdown.Text = " ✓ " .. data.name:gsub("[🚫🔞🎭💢⚡⚠️]", "")
        textBox.Text = data.text
        optionsFrame.Visible = false
        status.Text = "✓ " .. data.name:gsub("[🚫🔞🎭💢⚡⚠️]", "") .. " dipilih"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
    end)
end

-- Text Box - LEBIH KECIL
local textBox = Instance.new("TextBox")
textBox.Name = "ReportTextBox"
textBox.Size = UDim2.new(1, 0, 0, 100)  -- 100 pixel (bukan 150)
textBox.Position = UDim2.new(0, 0, 0, 200)
textBox.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
textBox.TextColor3 = Color3.new(1,1,1)
textBox.Font = Enum.Font.RobotoMono
textBox.TextSize = 12  -- Lebih kecil
textBox.TextWrapped = true
textBox.Text = "Pilih jenis laporan di atas..."
textBox.MultiLine = true
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.ClearTextOnFocus = false
textBox.Parent = contentFrame

local textCorner = Instance.new("UICorner")
textCorner.CornerRadius = UDim.new(0, 6)
textCorner.Parent = textBox

local textPadding = Instance.new("UIPadding")
textPadding.PaddingLeft = UDim.new(0, 8)
textPadding.PaddingRight = UDim.new(0, 8)
textPadding.PaddingTop = UDim.new(0, 8)
textPadding.PaddingBottom = UDim.new(0, 8)
textPadding.Parent = textBox

-- Copy Button - LEBIH KECIL
local copyBtn = Instance.new("TextButton")
copyBtn.Name = "CopyButton"
copyBtn.Size = UDim2.new(1, 0, 0, 35)  -- 35 pixel (bukan 45)
copyBtn.Position = UDim2.new(0, 0, 1, -40)
copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
copyBtn.Text = "📋 COPY"
copyBtn.TextColor3 = Color3.new(1,1,1)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 14  -- Lebih kecil
copyBtn.Parent = contentFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 6)
copyCorner.Parent = copyBtn

-- Status - LEBIH KECIL
local status = Instance.new("TextLabel")
status.Name = "StatusLabel"
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -18)
status.BackgroundTransparency = 1
status.Text = "Ready"
status.TextColor3 = Color3.fromRGB(150, 200, 255)
status.Font = Enum.Font.Gotham
status.TextSize = 11  -- Lebih kecil
status.TextXAlignment = Enum.TextXAlignment.Center
status.Parent = contentFrame

-- ========== FUNCTIONS ==========

-- Draggable
local dragging = false
local dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, 
        startPos.X.Offset + delta.X,
        startPos.Y.Scale, 
        startPos.Y.Offset + delta.Y
    )
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        update(input)
    end
end)

-- Minimize/Maximize
local isMinimized = false
local originalSize = UDim2.new(0.9, 0, 0, 400)
local minimizedSize = UDim2.new(0.9, 0, 0, 35)

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        contentFrame.Visible = false
        mainFrame:TweenSize(minimizedSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        minimizeBtn.Text = "＋"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 100)
    else
        contentFrame.Visible = true
        mainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2)
        minimizeBtn.Text = "━"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    end
end)

-- Dropdown toggle
dropdown.MouseButton1Click:Connect(function()
    optionsFrame.Visible = not optionsFrame.Visible
end)

-- Copy function
copyBtn.MouseButton1Click:Connect(function()
    if selectedReport and reportText ~= "" then
        if setclipboard then
            setclipboard(reportText)
            copyBtn.Text = "✅ COPIED"
            copyBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 80)
            status.Text = "Teks disalin!"
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            task.wait(1.5)
            copyBtn.Text = "📋 COPY"
            copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        else
            textBox:CaptureFocus()
            textBox:SelectAll()
            status.Text = "Pilih teks lalu Ctrl+C"
            status.TextColor3 = Color3.fromRGB(255, 200, 100)
        end
    else
        status.Text = "Pilih laporan dulu!"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Insert GUI
screenGui.Parent = player.PlayerGui

-- Notification kecil
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "ANONYMOUS9X",
    Text = "RepText v4.0 Loaded",
    Duration = 2
})

print("========================================")
print("ANONYMOUS9X - RepText v4.0 MOBILE")
print("Ukuran kecil - Mobile friendly")
print("========================================")

return "Mobile GUI Loaded!"       
