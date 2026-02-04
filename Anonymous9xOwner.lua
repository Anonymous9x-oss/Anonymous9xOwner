--[[ ANONYMOUS9x VIP : BETA V 1.06  ]]
print(">> [ANONYMOUS9x]: Executing Fix v1.06...")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean up existing
if PlayerGui:FindFirstChild("HorizontalHub") then PlayerGui.HorizontalHub:Destroy() end

local Config = {
    Title = "ANONYMOUS9x VIP",
    LogoID = "rbxassetid://97269958324726",
    Theme = {
        Primary = Color3.fromRGB(255, 255, 255),
        Background = Color3.fromRGB(8, 8, 8),
        Card = Color3.fromRGB(15, 15, 15),
        Border = Color3.fromRGB(255, 255, 255),
        HackerGreen = Color3.fromRGB(0, 255, 100),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Scripts = {
        {Name = "Hybrid Attack", Icon = "Chaos", URL = "https://pastebin.com/raw/yTv5hwc5", Desc = "spam attack v1 auto attack 100k can't be changed."},
        {Name = "Spam Armagedon", Icon = "Chaos", URL = "https://pastebin.com/raw/dXNtX5PB", Desc = "spam attack v2 with customizable attacks, with full scan"},
        {Name = "Fly Noclip", Icon = "Player", URL = "https://pastebin.com/raw/ZrRwsPAe", Desc = "universal mobile fly with analog, keyboard with wasd"},
        {Name = "ESP Master", Icon = "Player", URL = "https://pastebin.com/raw/zdqzRRDe", Desc = "can see other players without range"},
        {Name = "Speed Walk", Icon = "Player", URL = "https://pastebin.com/raw/BAqbsBx0", Desc = "easily adjust your running speed"},
        {Name = "Ghost Mode", Icon = "Player", URL = "https://pastebin.com/raw/A26bz69Q", Desc = "set yourself to be invisible so you can become a ghost equipped with speedboost"},
        {Name = "No Clip", Icon = "Player", URL = "https://pastebin.com/raw/4Y3ium6c", Desc = "set you up so you can go through walls or other parts"},
        {Name = "Infinite Jump", Icon = "Player", URL = "https://pastebin.com/raw/qrMSz160", Desc = "you can do jump spam"},
        {Name = "Spectator Full", Icon = "Player", URL = "https://pastebin.com/raw/yYrK3kNi", Desc = "Spectator All Player with tp, follow, kick features"},
        {Name = "Fling Player", Icon = "Chaos", URL = "https://pastebin.com/raw/0r27fM5A", Desc = "can kick a player very high"}
    }
}

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "HorizontalHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function AddStroke(obj, thickness, color)
    local s = Instance.new("UIStroke", obj)
    s.Color = color or Config.Theme.Border
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return s
end

-- ==================== LOGIN FRAME (MOBILE FRIENDLY) ====================
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 260, 0, 300) -- UKURAN MOBILE STANDARD
LoginFrame.Position = UDim2.new(0.5, -130, 0.5, -150)
LoginFrame.BackgroundColor3 = Config.Theme.Background
LoginFrame.Active = false
LoginFrame.Draggable = false
Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 10)
AddStroke(LoginFrame, 1.5)

local LogLogo = Instance.new("ImageLabel", LoginFrame)
LogLogo.Size = UDim2.new(0, 60, 0, 60) -- KECIL
LogLogo.Position = UDim2.new(0.5, -30, 0.1, 0)
LogLogo.Image = Config.LogoID
LogLogo.BackgroundTransparency = 1

local LogTitle = Instance.new("TextLabel", LoginFrame)
LogTitle.Text = "ANONYMOUS9x VIP"
LogTitle.Size = UDim2.new(1, 0, 0, 25)
LogTitle.Position = UDim2.new(0, 0, 0.3, 0)
LogTitle.TextColor3 = Config.Theme.Text
LogTitle.Font = Enum.Font.GothamBlack
LogTitle.TextSize = 16
LogTitle.BackgroundTransparency = 1

local UserBox = Instance.new("TextBox", LoginFrame)
UserBox.Size = UDim2.new(0.85, 0, 0, 35)
UserBox.Position = UDim2.new(0.075, 0, 0.5, 0)
UserBox.Text = ""
UserBox.PlaceholderText = "Input User"
UserBox.BackgroundColor3 = Config.Theme.Card
UserBox.TextColor3 = Color3.new(1,1,1)
UserBox.Font = Enum.Font.GothamBold
UserBox.TextSize = 12
Instance.new("UICorner", UserBox)
AddStroke(UserBox, 1)

local KeyBox = Instance.new("TextBox", LoginFrame)
KeyBox.Size = UDim2.new(0.85, 0, 0, 35)
KeyBox.Position = UDim2.new(0.075, 0, 0.67, 0)
KeyBox.Text = ""
KeyBox.PlaceholderText = "Input Key"
KeyBox.BackgroundColor3 = Config.Theme.Card
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Font = Enum.Font.GothamBold
KeyBox.TextSize = 12
Instance.new("UICorner", KeyBox)
AddStroke(KeyBox, 1)

local LogBtn = Instance.new("TextButton", LoginFrame)
LogBtn.Size = UDim2.new(0.85, 0, 0, 40)
LogBtn.Position = UDim2.new(0.075, 0, 0.84, 0)
LogBtn.BackgroundColor3 = Color3.new(1,1,1)
LogBtn.Text = "AUTHENTICATE"
LogBtn.TextColor3 = Color3.new(0,0,0)
LogBtn.Font = Enum.Font.GothamBlack
LogBtn.TextSize = 13
Instance.new("UICorner", LogBtn)

-- ==================== MAIN PANEL (SAME SIZE AS BEFORE) ====================
local AppWindow = Instance.new("Frame", ScreenGui)
AppWindow.Size = UDim2.new(0, 420, 0, 320) -- UKURAN ASLI, TIDAK DIKECILKAN
AppWindow.Position = UDim2.new(0.5, -210, 0.5, -160)
AppWindow.BackgroundColor3 = Config.Theme.Background
AppWindow.Visible = false
AppWindow.Active = false
AppWindow.Draggable = false
Instance.new("UICorner", AppWindow).CornerRadius = UDim.new(0, 10)
AddStroke(AppWindow, 2)

-- HEADER (SAME)
local Header = Instance.new("Frame", AppWindow)
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundTransparency = 1

local Avatar = Instance.new("ImageLabel", Header)
Avatar.Image = Config.LogoID
Avatar.Size = UDim2.new(0, 30, 0, 30)
Avatar.Position = UDim2.new(0, 15, 0.5, -15)
Avatar.BackgroundTransparency = 1

local Username = Instance.new("TextLabel", Header)
Username.Text = Config.Title
Username.Size = UDim2.new(0, 160, 0, 20)
Username.Position = UDim2.new(0, 55, 0.5, -10)
Username.TextColor3 = Config.Theme.Text
Username.Font = Enum.Font.GothamBlack
Username.TextSize = 14
Username.TextXAlignment = "Left"
Username.BackgroundTransparency = 1

-- MINIMIZE BUTTON
local MinimizedApp = Instance.new("TextButton", ScreenGui)
MinimizedApp.Size = UDim2.new(0, 45, 0, 45)
MinimizedApp.Position = UDim2.new(0.02, 0, 0.02, 0)
MinimizedApp.BackgroundColor3 = Config.Theme.Background
MinimizedApp.Visible = false
MinimizedApp.Text = ""
MinimizedApp.Active = false
MinimizedApp.Draggable = false
Instance.new("UICorner", MinimizedApp).CornerRadius = UDim.new(0, 8)
AddStroke(MinimizedApp, 2)

local MinIcon = Instance.new("ImageLabel", MinimizedApp)
MinIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
MinIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
MinIcon.Image = Config.LogoID
MinIcon.BackgroundTransparency = 1

-- SEARCH
local Search = Instance.new("TextBox", Header)
Search.Size = UDim2.new(0, 100, 0, 24)
Search.Position = UDim2.new(1, -220, 0.5, -12)
Search.Text = ""
Search.PlaceholderText = "Search..."
Search.BackgroundColor3 = Config.Theme.Card
Search.TextColor3 = Color3.new(1,1,1)
Search.Font = Enum.Font.GothamBold
Search.TextSize = 11
Instance.new("UICorner", Search)
AddStroke(Search, 0.5)

-- HEADER BUTTONS
local function makeBtn(txt, x, col, func)
    local b = Instance.new("TextButton", Header)
    b.Size = UDim2.new(0, 28, 0, 28)
    b.Position = UDim2.new(1, x, 0.5, -14)
    b.BackgroundColor3 = col
    b.Text = txt
    b.Font = Enum.Font.GothamBlack
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(func)
end

makeBtn("×", -35, Color3.fromRGB(180, 0, 0), function() 
    ScreenGui:Destroy() 
end)

makeBtn("−", -70, Config.Theme.Card, function() 
    AppWindow.Visible = false 
    MinimizedApp.Visible = true 
end)

makeBtn("ℹ", -105, Color3.fromRGB(50, 50, 50), function()
    if AppWindow:FindFirstChild("InfoPanel") then 
        AppWindow.InfoPanel:Destroy() 
    else
        local p = Instance.new("Frame", AppWindow)
        p.Name = "InfoPanel"
        p.Size = UDim2.new(0, 220, 0, 150)
        p.Position = UDim2.new(0.5, -110, 0.5, -75)
        p.BackgroundColor3 = Config.Theme.Card
        p.ZIndex = 500
        p.Active = false
        p.Draggable = false
        Instance.new("UICorner", p)
        AddStroke(p, 1)
        
        local t = Instance.new("TextLabel", p)
        t.Size = UDim2.new(1, -30, 1, -20)
        t.Position = UDim2.new(0, 15, 0, 10)
        t.BackgroundTransparency = 1
        t.TextColor3 = Color3.new(1,1,1)
        t.Font = Enum.Font.GothamBold
        t.TextSize = 11
        t.TextXAlignment = "Left"
        t.Text = "• Key Access : Lifetime\n• User : Owner\n• Version : 1.06\n• Created By : Anonymous9x\n• Tiktok : @anonymous9x_"
        t.ZIndex = 501
        
        local cl = Instance.new("TextButton", p)
        cl.Size = UDim2.new(1,0,1,0)
        cl.BackgroundTransparency = 1
        cl.Text = ""
        cl.ZIndex = 502
        cl.MouseButton1Click:Connect(function() p:Destroy() end)
    end
end)

-- SCROLLING FRAME
local Scroll = Instance.new("ScrollingFrame", AppWindow)
Scroll.Size = UDim2.new(1, -20, 0, 190)
Scroll.Position = UDim2.new(0, 10, 0, 60)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 6
Scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.X
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
Scroll.BorderSizePixel = 0

local ScrollPadding = Instance.new("UIPadding", Scroll)
ScrollPadding.PaddingTop = UDim.new(0, 12)
ScrollPadding.PaddingBottom = UDim.new(0, 12)

local Layout = Instance.new("UIListLayout", Scroll)
Layout.FillDirection = Enum.FillDirection.Horizontal
Layout.Padding = UDim.new(0, 15)
Layout.SortOrder = Enum.SortOrder.LayoutOrder

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0, Layout.AbsoluteContentSize.X, 0, 0)
end)

-- CREATE CARDS (SAME SIZE)
local totalCardWidth = 0
for _, s in ipairs(Config.Scripts) do
    local Card = Instance.new("Frame", Scroll)
    Card.Name = s.Name
    Card.Size = UDim2.new(0, 140, 0, 180)
    Card.BackgroundColor3 = Config.Theme.Card
    Card.LayoutOrder = _
    Instance.new("UICorner", Card)
    AddStroke(Card, 1)
    
    local I = Instance.new("TextLabel", Card)
    I.Text = s.Icon -- ICON TETAP "Chaos", "Player"
    I.Size = UDim2.new(1, 0, 0, 35)
    I.Position = UDim2.new(0, 0, 0, 10)
    I.TextColor3 = Color3.new(1,1,1)
    I.Font = Enum.Font.GothamBlack
    I.TextSize = 16
    I.BackgroundTransparency = 1
    
    local N = Instance.new("TextLabel", Card)
    N.Text = s.Name
    N.Size = UDim2.new(1, -10, 0, 20)
    N.Position = UDim2.new(0, 5, 0, 45)
    N.TextColor3 = Color3.new(1,1,1)
    N.Font = Enum.Font.GothamBlack
    N.TextSize = 12
    N.BackgroundTransparency = 1
    
    local D = Instance.new("TextLabel", Card)
    D.Text = s.Desc
    D.Size = UDim2.new(1,-20,0,60)
    D.Position = UDim2.new(0,10,0,75)
    D.TextColor3 = Color3.fromRGB(180,180,180)
    D.Font = Enum.Font.GothamBold
    D.TextSize = 9
    D.TextWrapped = true
    D.TextXAlignment = "Left"
    D.TextYAlignment = "Top"
    D.BackgroundTransparency = 1

    local L = Instance.new("TextButton", Card)
    L.Text = "EXECUTE"
    L.Size = UDim2.new(0.85, 0, 0, 28)
    L.Position = UDim2.new(0.075, 0, 1, -35)
    L.BackgroundColor3 = Color3.new(1,1,1)
    L.TextColor3 = Color3.new(0,0,0)
    L.Font = Enum.Font.GothamBlack
    L.TextSize = 10
    Instance.new("UICorner", L).CornerRadius = UDim.new(0, 6)
    L.MouseButton1Click:Connect(function() 
        loadstring(game:HttpGet(s.URL))() 
    end)
    
    totalCardWidth = totalCardWidth + 155
end

Scroll.CanvasSize = UDim2.new(0, totalCardWidth, 0, 0)

-- ==================== FOOTER ====================
local Footer = Instance.new("Frame", AppWindow)
Footer.Size = UDim2.new(1, -20, 0, 35)
Footer.Position = UDim2.new(0, 10, 1, -45)
Footer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Footer.Active = false
Footer.Draggable = false
Instance.new("UICorner", Footer)
AddStroke(Footer, 1, Config.Theme.HackerGreen)

local TerminalTxt = Instance.new("TextLabel", Footer)
TerminalTxt.Size = UDim2.new(0.95, 0, 1, 0)
TerminalTxt.Position = UDim2.new(0.025, 0, 0, 0)
TerminalTxt.BackgroundTransparency = 1
TerminalTxt.TextColor3 = Config.Theme.HackerGreen
TerminalTxt.Font = Enum.Font.Code
TerminalTxt.TextSize = 10
TerminalTxt.TextXAlignment = "Left"
TerminalTxt.Text = "> INITIALIZING MONITOR..."

local function StartMonitor()
    task.spawn(function()
        while task.wait(0.5) do
            local ping = "0ms"
            pcall(function() 
                ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms" 
            end)
            local mem = math.floor(StatsService:GetTotalMemoryUsageMb()) .. "MB"
            local fps = math.floor(1/RunService.RenderStepped:Wait())
            TerminalTxt.Text = string.format("> NET: %s | MEM: %s | FPS: %d | STATUS: INJECTED", ping, mem, fps)
        end
    end)
end

-- ==================== SIMPLE LOADING SCREEN (WORKING) ====================
local function RunHackerLoading()
    -- BUAT LOADING FRAME DI DALAM APPWINDOW
    local LoadingFrame = Instance.new("Frame", AppWindow)
    LoadingFrame.Name = "LoadingFrame"
    LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
    LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoadingFrame.BackgroundTransparency = 0.7
    LoadingFrame.ZIndex = 100
    
    local LoadingContainer = Instance.new("Frame", LoadingFrame)
    LoadingContainer.Size = UDim2.new(0.8, 0, 0, 100)
    LoadingContainer.Position = UDim2.new(0.1, 0, 0.4, 0)
    LoadingContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    LoadingContainer.ZIndex = 101
    Instance.new("UICorner", LoadingContainer).CornerRadius = UDim.new(0, 8)
    AddStroke(LoadingContainer, 1, Config.Theme.HackerGreen)
    
    local LoadingText = Instance.new("TextLabel", LoadingContainer)
    LoadingText.Size = UDim2.new(0.9, 0, 0.7, 0)
    LoadingText.Position = UDim2.new(0.05, 0, 0.1, 0)
    LoadingText.BackgroundTransparency = 1
    LoadingText.TextColor3 = Config.Theme.HackerGreen
    LoadingText.Font = Enum.Font.Code
    LoadingText.TextSize = 11
    LoadingText.TextXAlignment = "Left"
    LoadingText.TextYAlignment = "Top"
    LoadingText.Text = "> LOADING SYSTEM..."
    LoadingText.ZIndex = 102
    
    -- SIMPLE LOADING ANIMATION
    local dots = {"", ".", "..", "..."}
    local dotIndex = 1
    
    -- ANIMASI LOADING DOTS
    local dotsConnection
    dotsConnection = RunService.Heartbeat:Connect(function()
        LoadingText.Text = "> LOADING SYSTEM" .. dots[dotIndex]
        dotIndex = dotIndex + 1
        if dotIndex > #dots then dotIndex = 1 end
    end)
    
    -- SIMULASI PROSES LOADING
    task.spawn(function()
        -- PROSES 1
        task.wait(1)
        LoadingText.Text = "> LOADING SYSTEM...\n> INITIALIZING COMPONENTS"
        
        -- PROSES 2
        task.wait(1)
        LoadingText.Text = "> LOADING SYSTEM...\n> INITIALIZING COMPONENTS\n> LOADING VIP MODULES"
        
        -- PROSES 3
        task.wait(1)
        LoadingText.Text = "> LOADING SYSTEM...\n> INITIALIZING COMPONENTS\n> LOADING VIP MODULES\n> READY FOR OPERATION"
        
        task.wait(0.5)
        
        -- HENTIKAN ANIMASI DOTS
        if dotsConnection then
            dotsConnection:Disconnect()
        end
        
        -- FADE OUT
        local fadeTween = TweenService:Create(
            LoadingFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad),
            {BackgroundTransparency = 1}
        )
        fadeTween:Play()
        
        fadeTween.Completed:Connect(function()
            LoadingFrame:Destroy()
            -- MULAI MONITOR SETELAH LOADING SELESAI
            StartMonitor()
        end)
    end)
end

-- ==================== EVENT HANDLERS ====================
LogBtn.MouseButton1Click:Connect(function()
    if UserBox.Text == "Owner" and KeyBox.Text == "123" then
        LogBtn.Text = "AUTHENTICATING..."
        task.wait(0.3)
        
        -- SEMBUNYIKAN LOGIN
        LoginFrame.Visible = false
        
        -- TAMPILKAN APPWINDOW (TETAPI MASIH LOADING)
        AppWindow.Visible = true
        
        -- JALANKAN LOADING SCREEN
        RunHackerLoading()
    else
        LogBtn.Text = "ACCESS DENIED"
        LogBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        task.wait(1)
        LogBtn.Text = "AUTHENTICATE"
        LogBtn.BackgroundColor3 = Color3.new(1,1,1)
    end
end)

MinimizedApp.MouseButton1Click:Connect(function() 
    AppWindow.Visible = true 
    MinimizedApp.Visible = false 
end)

Search:GetPropertyChangedSignal("Text"):Connect(function()
    local q = Search.Text:lower()
    for _, card in pairs(Scroll:GetChildren()) do
        if card:IsA("Frame") then 
            card.Visible = card.Name:lower():find(q) and true or false 
        end
    end
end)

print(">> [ANONYMOUS9x VIP]: GUI Loaded Successfully!")
