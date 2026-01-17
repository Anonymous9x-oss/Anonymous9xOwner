-- Anonymous9x_RepText v1.1 MOBILE FRIENDLY
-- RESPONSIVE & DRAGGABLE

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

-- Main Frame - UKURAN RESPONSIVE UNTUK HP
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.85, 0, 0, 500)  -- 85% lebar layar
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title Bar - BISA DIGESER
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12, 0, 0)
titleCorner.Parent = titleBar

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔐 ANONYMOUS9X REPTEXT"
title.TextColor3 = Color3.fromRGB(220, 230, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -40, 0.5, -17.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- Content Area
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -65)
contentFrame.Position = UDim2.new(0, 10, 0, 55)
contentFrame.BackgroundTransparency = 1
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

-- Report Options
local reports = {
    ["🚫 NSFW Avatar Bypass"] = "I'm reporting NSFW 'bypass' avatar items. This violates Roblox's Community Standards on Sexual Content.",
    ["🔞 Sexualized Avatar"] = "Reporting a sexualized avatar with inappropriate appearances. This violates safety guidelines.",
    ["🎭 Scamming & Fraud"] = "Reporting a scam/fraud promising free Robux or items. Violates Terms of Service.",
    ["💢 Harassment & Hate Speech"] = "Reporting harassment, hate speech, bullying, or threats in chat/username.",
    ["⚡ Exploiting & Cheating"] = "Reporting a player using exploits/cheats for unfair advantages.",
    ["⚠️ Multiple Violations"] = "Reporting multiple violations: NSFW content, scamming, harassment, and exploiting."
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
        textBox.Text = desc
        optionsFrame.Visible = false
    end)
end

-- Text Box
local textBox = Instance.new("TextBox")
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
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = "Status: Ready"
status.TextColor3 = Color3.fromRGB(150, 200, 255)
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Center
status.Parent = contentFrame

-- FUNGSI DRAGGABLE (BISA DIGESER)
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

-- FUNGSI DROPDOWN
dropdown.MouseButton1Click:Connect(function()
    optionsFrame.Visible = not optionsFrame.Visible
end)

-- FUNGSI COPY
copyBtn.MouseButton1Click:Connect(function()
    if textBox.Text ~= "Select report type above..." then
        if setclipboard then
            setclipboard(textBox.Text)
            copyBtn.Text = "✅ COPIED!"
            copyBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
            status.Text = "✓ Text copied! Paste in Roblox report form"
            task.wait(1.5)
            copyBtn.Text = "📋 COPY TEXT"
            copyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        else
            textBox:CaptureFocus()
            textBox:SelectAll()
            status.Text = "⚠️ Select text (Ctrl+A) then Ctrl+C"
        end
    else
        status.Text = "⚠️ Select report type first!"
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
    Title = "Anonymous9x RepText",
    Text = "Mobile-friendly GUI Loaded!",
    Duration = 3
})

print("========================================")
print("Anonymous9x RepText v1.1 - MOBILE READY")
print("Drag title bar to move GUI")
print("========================================")

return "Anonymous9x RepText Loaded Successfully!"
