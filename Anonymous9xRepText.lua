--// Anonymous9x RepText
--// Final Stable Version (Mobile + PC)
--// UI Safe | Draggable | No Black Screen

-- Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- Remove old GUI
pcall(function()
    if player.PlayerGui:FindFirstChild("Anonymous9xRepText") then
        player.PlayerGui.Anonymous9xRepText:Destroy()
    end
end)

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "Anonymous9xRepText"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(460, 520)
main.Position = UDim2.fromOffset(40, 70) -- SAFE MOBILE
main.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
main.BorderSizePixel = 0
main.ZIndex = 5
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Top Bar
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 48)
top.BackgroundColor3 = Color3.fromRGB(12, 16, 26)
top.BorderSizePixel = 0
top.ZIndex = 6
top.Parent = main

Instance.new("UICorner", top).CornerRadius = UDim.new(0, 14)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "🔐 ANONYMOUS9X REPORT TEXT"
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextColor3 = Color3.fromRGB(220, 230, 255)
title.TextXAlignment = Left
title.ZIndex = 7
title.Parent = top

-- Close Button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(32, 32)
close.Position = UDim2.new(1, -40, 0, 8)
close.BackgroundColor3 = Color3.fromRGB(190, 60, 60)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.TextColor3 = Color3.new(1,1,1)
close.ZIndex = 7
close.Parent = top

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

-- Draggable (MOBILE SAFE)
do
    local dragging = false
    local dragStart, startPos

    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Dropdown
local dropdown = Instance.new("TextButton")
dropdown.Size = UDim2.new(0.9, 0, 0, 42)
dropdown.Position = UDim2.fromOffset(23, 70)
dropdown.BackgroundColor3 = Color3.fromRGB(35, 40, 60)
dropdown.Text = "  ▼ Select Report Type"
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 15
dropdown.TextColor3 = Color3.fromRGB(235, 240, 255)
dropdown.TextXAlignment = Left
dropdown.ZIndex = 6
dropdown.Parent = main

Instance.new("UICorner", dropdown).CornerRadius = UDim.new(0, 8)

-- Option Frame
local optFrame = Instance.new("Frame")
optFrame.Size = UDim2.new(0.9, 0, 0, 0)
optFrame.Position = dropdown.Position + UDim2.fromOffset(0, 46)
optFrame.BackgroundColor3 = Color3.fromRGB(28, 32, 50)
optFrame.ClipsDescendants = true
optFrame.Visible = false
optFrame.ZIndex = 6
optFrame.Parent = main

Instance.new("UICorner", optFrame).CornerRadius = UDim.new(0, 8)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -8, 1, -8)
scroll.Position = UDim2.fromOffset(4, 4)
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.BackgroundTransparency = 1
scroll.ZIndex = 6
scroll.Parent = optFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.Parent = scroll

-- TextBox
local box = Instance.new("TextBox")
box.Size = UDim2.new(0.9, 0, 0, 190)
box.Position = UDim2.fromOffset(23, 280)
box.BackgroundColor3 = Color3.fromRGB(22, 26, 42)
box.TextWrapped = true
box.MultiLine = true
box.ClearTextOnFocus = false
box.Text = "Select report type above..."
box.Font = Enum.Font.RobotoMono
box.TextSize = 13
box.TextColor3 = Color3.new(1,1,1)
box.ZIndex = 6
box.Parent = main

Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

-- Copy Button
local copy = Instance.new("TextButton")
copy.Size = UDim2.new(0.9, 0, 0, 46)
copy.Position = UDim2.fromOffset(23, 485)
copy.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
copy.Text = "📋 COPY REPORT TEXT"
copy.Font = Enum.Font.GothamBold
copy.TextSize = 16
copy.TextColor3 = Color3.new(1,1,1)
copy.ZIndex = 6
copy.Parent = main

Instance.new("UICorner", copy).CornerRadius = UDim.new(0, 10)

-- Report Data
local reports = {
    ["🚫 NSFW Avatar Bypass"] =
        "I am reporting an avatar that uses NSFW bypass items which violate Roblox Community Standards.",

    ["🔞 Sexualized Avatar"] =
        "This avatar contains sexualized or inappropriate visual content not allowed on Roblox.",

    ["🎭 Scamming / Fraud"] =
        "The player is scamming users by offering fake Robux or misleading rewards.",

    ["💢 Harassment / Hate Speech"] =
        "The player is engaging in harassment, hate speech, or abusive behavior.",

    ["⚡ Exploiting / Cheating"] =
        "The player is exploiting or cheating to gain unfair advantages.",

    ["⚠️ Multiple Violations"] =
        "This player is committing multiple violations including scamming, harassment, and inappropriate content."
}

-- Create Options
for name, text in pairs(reports) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -6, 0, 34)
    btn.BackgroundColor3 = Color3.fromRGB(45, 50, 75)
    btn.Text = "  "..name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(235, 240, 255)
    btn.TextXAlignment = Left
    btn.ZIndex = 6
    btn.Parent = scroll

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        dropdown.Text = "  ✓ "..name
        box.Text = text
        optFrame.Visible = false
    end)
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 6)
    optFrame.Size = UDim2.new(0.9, 0, 0, math.clamp(layout.AbsoluteContentSize.Y + 8, 0, 180))
end)

-- Button Logic
dropdown.MouseButton1Click:Connect(function()
    optFrame.Visible = not optFrame.Visible
end)

copy.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(box.Text)
        copy.Text = "✅ COPIED!"
        task.wait(1.2)
        copy.Text = "📋 COPY REPORT TEXT"
    end
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Notification
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Anonymous9x RepText",
        Text = "Loaded Successfully",
        Duration = 3
    })
end)

print("[Anonymous9x RepText] Loaded successfully")
