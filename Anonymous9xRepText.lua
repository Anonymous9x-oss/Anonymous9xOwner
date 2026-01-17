-- Anonymous9x_RepText v2.0
-- MOBILE FRIENDLY + MINIMIZE FEATURE

local Players = game:GetService('Players')
local player = Players.LocalPlayer

-- Hapus GUI lama jika ada
if player.PlayerGui:FindFirstChild("Anonymous9xRepText") then
    player.PlayerGui.Anonymous9xRepText:Destroy()
end

-- Buat GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Anonymous9xRepText"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.85, 0, 0, 500)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12, 0, 0)
titleCorner.Parent = titleBar

-- Logo ANONYMOUS9X TEAM
local logoFrame = Instance.new("Frame")
logoFrame.Name = "LogoFrame"
logoFrame.Size = UDim2.new(0, 120, 0, 30)
logoFrame.Position = UDim2.new(0.5, -60, 0.5, -15)
logoFrame.BackgroundTransparency = 1
logoFrame.Parent = titleBar

-- Logo Text
local logoText = Instance.new("TextLabel")
logoText.Name = "LogoText"
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "ANONYMOUS9X\nTEAM"
logoText.TextColor3 = Color3.fromRGB(220, 230, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 12
logoText.TextYAlignment = Enum.TextYAlignment.Center
logoText.TextXAlignment = Enum.TextXAlignment.Center
logoText.Parent = logoFrame

-- Minimize Button (icon garis 3)
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -75, 0.5, -15)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
minimizeBtn.Text = "━"
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeBtn

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

-- Content Area (bisa di hide/show)
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -65)
contentFrame.Position = UDim2.new(0, 10, 0, 55)
contentFrame.BackgroundTransparency = 1
contentFrame.Visible = true
contentFrame.Parent = mainFrame

-- Dropdown
local dropdown = Instance.new("TextButton")
dropdown.Size = UDim2.new(1, 0, 0, 45)
dropdown.Position = UDim2.new(0, 0, 0, 0)
dropdown.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
dropdown.Text = "  ▼ Select Report Type"
dropdown.TextColor3 = Color3.new(0.9,0.9,1)
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 15
dropdown.TextXAlignment = Enum.TextXAlignment.Left
dropdown.Parent = contentFrame

local dropCorner = Instance.new("UICorner")
dropCorner.CornerRadius = UDim.new(0, 8)
dropCorner.Parent = dropdown

-- Options Frame
local optionsFrame = Instance.new("ScrollingFrame")
optionsFrame.Size = UDim2.new(1, 0, 0, 180)
optionsFrame.Position = UDim2.new(0, 0, 0, 50)
optionsFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false
optionsFrame.ScrollBarThickness = 6
optionsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
optionsFrame.Parent = contentFrame

local optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0, 8)
optionsCorner.Parent = optionsFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = optionsFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 8)
padding.PaddingLeft = UDim.new(0, 8)
padding.PaddingRight = UDim.new(0, 8)
padding.PaddingBottom = UDim.new(0, 8)
padding.Parent = optionsFrame

-- Report Options (FIXED - TEKS LENGKAP)
local reports = {
    ["🚫 NSFW Avatar Bypass"] = "I'm reporting NSFW 'bypass' avatar items. A user/asset is using textures/accessories designed to bypass clothing filters to create nude or sexually explicit avatars. This violates Roblox's Community Standards on Sexual Content.",
    
    ["🔞 Sexualized Avatar"] = "Reporting a sexualized avatar. The user's avatar contains sexually suggestive or explicit appearances, including mesh combinations mimicking nudity or private body parts. This is inappropriate for Roblox's all-ages platform and violates safety guidelines.",
    
    ["🎭 Scamming & Fraud"] = "Reporting a scam/fraud incident. A user/experience is promising free Robux, rare items, or special privileges in exchange for login details, real money, or completing surveys. This is a clear violation of Roblox's Terms of Service regarding scams and fraudulent activity.",
    
    ["💢 Harassment & Hate Speech"] = "Reporting severe harassment and hate speech. A user is using the chat, username, or display name to send bullying messages, hate speech based on race/religion/gender, threats, or extreme profanity. This creates a toxic and unsafe environment for other players.",
    
    ["⚡ Exploiting & Cheating"] = "Reporting a player who is using exploits/cheats. The user is utilizing third-party software or scripts to gain unfair advantages like flying, noclip, speed hacking, or modifying the game in ways that ruin the experience for others. This violates the Roblox Terms of Service.",
    
    ["⚠️ Multiple Violations"] = "I am reporting multiple serious violations by a user/group. This includes: 1) Creating/using NSFW 'bypass' avatars, 2) Engaging in scams/fraud, 3) Harassment/hate speech, and 4) Exploiting/cheating. This behavior severely breaches Roblox's Community Standards and creates an unsafe platform environment."
}

for name, desc in pairs(reports) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(40, 45, 65)
    btn.Text = "   " .. name
    btn.TextColor3 = Color3.new(0.9,0.9,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = optionsFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        dropdown.Text = "  ✓ " .. name
        textBox.Text = desc  -- INI PASTI DAPAT TEKSNYA
        optionsFrame.Visible = false
    end)
end

-- Text Box
local textBox = Instance.new("TextBox")
textBox.Name = "ReportTextBox"
textBox.Size = UDim2.new(1, 0, 0, 150)
textBox.Position = UDim2.new(0, 0, 0, 240)
textBox.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
textBox.TextColor3 = Color3.new(1,1,1)
textBox.Font = Enum.Font.RobotoMono
textBox.TextSize = 13
textBox.TextWrapped = true
textBox.Text = "Select report type above..."
textBox.MultiLine = true
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.ClearTextOnFocus = false
textBox.Parent = contentFrame

local textCorner = Instance.new("UICorner")
textCorner.CornerRadius = UDim.new(0, 8)
textCorner.Parent = textBox

local textPadding = Instance.new("UIPadding")
textPadding.PaddingLeft = UDim.new(0, 10)
textPadding.PaddingRight = UDim.new(0, 10)
textPadding.PaddingTop = UDim.new(0, 10)
textPadding.PaddingBottom = UDim.new(0, 10)
textPadding.Parent = textBox

-- Copy Button
local copyBtn = Instance.new("TextButton")
copyBtn.Name = "CopyButton"
copyBtn.Size = UDim2.new(1, 0, 0, 45)
copyBtn.Position = UDim2.new(0, 0, 1, -50)
copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
copyBtn.Text = "📋 COPY TEXT"
copyBtn.TextColor3 = Color3.new(1,1,1)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 16
copyBtn.Parent = contentFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 8)
copyCorner.Parent = copyBtn

-- Status
local status = Instance.new("TextLabel")
status.Name = "StatusLabel"
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = "Status: Ready"
status.TextColor3 = Color3.fromRGB(150, 200, 255)
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Center
status.Parent = contentFrame

-- ========== FUNGSI UTAMA ==========

-- FUNGSI DRAGGABLE
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

-- FUNGSI MINIMIZE/MAXIMIZE
local isMinimized = false
local originalSize = mainFrame.Size
local minimizedSize = UDim2.new(0.85, 0, 0, 45)  -- Hanya title bar

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        -- Minimize: sembunyikan content
        contentFrame.Visible = false
        mainFrame:TweenSize(minimizedSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3)
        minimizeBtn.Text = "＋"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 100)
    else
        -- Maximize: tampilkan content
        contentFrame.Visible = true
        mainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3)
        minimizeBtn.Text = "━"
        minimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    end
end)

-- FUNGSI DROPDOWN
dropdown.MouseButton1Click:Connect(function()
    optionsFrame.Visible = not optionsFrame.Visible
end)

-- FUNGSI COPY (FIXED - PASTI DAPAT TEKS)
copyBtn.MouseButton1Click:Connect(function()
    local currentText = textBox.Text
    
    if currentText ~= "" and currentText ~= "Select report type above..." then
        -- Coba pakai setclipboard
        local success, result = pcall(function()
            if setclipboard then
                setclipboard(currentText)
                return true
            end
            return false
        end)
        
        if success and result then
            -- Sukses copy
            copyBtn.Text = "✅ COPIED!"
            copyBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 80)
            status.Text = "✓ Text copied to clipboard!"
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            -- Reset button setelah 2 detik
            task.wait(2)
            copyBtn.Text = "📋 COPY TEXT"
            copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        else
            -- Fallback: select text
            textBox:CaptureFocus()
            textBox:SelectAll()
            status.Text = "⚠️ Select text above (Ctrl+A) then Ctrl+C"
            status.TextColor3 = Color3.fromRGB(255, 200, 100)
        end
    else
        status.Text = "⚠️ Please select a report type first!"
        status.TextColor3 = Color3.fromRGB(255, 150, 100)
    end
end)

-- FUNGSI CLOSE
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Insert GUI
screenGui.Parent = player.PlayerGui

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "ANONYMOUS9X TEAM",
    Text = "RepText v2.0 Loaded!",
    Duration = 3,
    Icon = "rbxassetid://4483345998"
})

print("========================================")
print("ANONYMOUS9X TEAM - RepText v2.0")
print("Features:")
print("- Drag to move")
print("- Minimize/Maximize")
print("- Full report texts")
print("- Mobile friendly")
print("========================================")

return "ANONYMOUS9X TEAM RepText Loaded!"    
    
