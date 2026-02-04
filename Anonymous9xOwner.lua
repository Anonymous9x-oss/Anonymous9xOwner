-- [[ ANONYMOUS9x GUI VIP : BETA V 1.01 ]] --
print(">> [ANONYMOUS9x]: Executing Ultimate Fix...")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean up existing
if PlayerGui:FindFirstChild("HorizontalHub") then PlayerGui.HorizontalHub:Destroy() end

local Config = {
    Title = "ANONYMOUS9x GUI VIP",
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

-- ==================== LOGIN FRAME ====================
local LoginFrame = Instance.new("Frame", ScreenGui)
LoginFrame.Size = UDim2.new(0, 320, 0, 400)
LoginFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
LoginFrame.BackgroundColor3 = Config.Theme.Background
Instance.new("UICorner", LoginFrame).CornerRadius = UDim.new(0, 15)
AddStroke(LoginFrame, 1.5)

local LogLogo = Instance.new("ImageLabel", LoginFrame)
LogLogo.Size = UDim2.new(0, 90, 0, 90)
LogLogo.Position = UDim2.new(0.5, -45, 0.1, 0)
LogLogo.Image = Config.LogoID
LogLogo.BackgroundTransparency = 1

local LogTitle = Instance.new("TextLabel", LoginFrame)
LogTitle.Text = "ANONYMOUS9x LOGIN"
LogTitle.Size = UDim2.new(1, 0, 0, 40)
LogTitle.Position = UDim2.new(0, 0, 0.35, 0)
LogTitle.TextColor3 = Config.Theme.Text
LogTitle.Font = Enum.Font.GothamBlack
LogTitle.TextSize = 20
LogTitle.BackgroundTransparency = 1

local UserBox = Instance.new("TextBox", LoginFrame)
UserBox.Size = UDim2.new(0.8, 0, 0, 45)
UserBox.Position = UDim2.new(0.1, 0, 0.5, 0)
UserBox.Text = "" -- CLEAN
UserBox.PlaceholderText = "Input User"
UserBox.BackgroundColor3 = Config.Theme.Card
UserBox.TextColor3 = Color3.new(1,1,1)
UserBox.Font = Enum.Font.GothamBold
UserBox.TextSize = 14
Instance.new("UICorner", UserBox)
AddStroke(UserBox, 1)

local KeyBox = Instance.new("TextBox", LoginFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 45)
KeyBox.Position = UDim2.new(0.1, 0, 0.64, 0)
KeyBox.Text = "" -- CLEAN
KeyBox.PlaceholderText = "Input Key"
KeyBox.BackgroundColor3 = Config.Theme.Card
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Font = Enum.Font.GothamBold
KeyBox.TextSize = 14
Instance.new("UICorner", KeyBox)
AddStroke(KeyBox, 1)

local LogBtn = Instance.new("TextButton", LoginFrame)
LogBtn.Size = UDim2.new(0.8, 0, 0, 50)
LogBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
LogBtn.BackgroundColor3 = Color3.new(1,1,1)
LogBtn.Text = "AUTHENTICATE"
LogBtn.TextColor3 = Color3.new(0,0,0)
LogBtn.Font = Enum.Font.GothamBlack
LogBtn.TextSize = 16
Instance.new("UICorner", LogBtn)

-- ==================== MAIN PANEL ====================
local AppWindow = Instance.new("Frame", ScreenGui)
AppWindow.Size = UDim2.new(0, 480, 0, 360)
AppWindow.Position = UDim2.new(0.5, -240, 0.5, -180)
AppWindow.BackgroundColor3 = Config.Theme.Background
AppWindow.Visible = false -- Kunci: Harus false dulu
Instance.new("UICorner", AppWindow).CornerRadius = UDim.new(0, 10)
AddStroke(AppWindow, 2)

-- HEADER
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

-- MINIMIZE
local MinimizedApp = Instance.new("TextButton", ScreenGui)
MinimizedApp.Size = UDim2.new(0, 40, 0, 40)
MinimizedApp.Position = UDim2.new(0.9, 0, 0.2, 0)
MinimizedApp.BackgroundColor3 = Config.Theme.Background
MinimizedApp.Visible = false
MinimizedApp.Text = ""
Instance.new("UICorner", MinimizedApp).CornerRadius = UDim.new(1, 0)
AddStroke(MinimizedApp, 2)

local MinIcon = Instance.new("ImageLabel", MinimizedApp)
MinIcon.Size = UDim2.new(0.6,0,0.6,0)
MinIcon.Position = UDim2.new(0.2,0,0.2,0)
MinIcon.Image = Config.LogoID
MinIcon.BackgroundTransparency = 1

-- SEARCH (FIXED)
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

makeBtn("×", -35, Color3.fromRGB(180, 0, 0), function() ScreenGui:Destroy() end)
makeBtn("−", -70, Config.Theme.Card, function() AppWindow.Visible = false MinimizedApp.Visible = true end)
makeBtn("ℹ", -105, Color3.fromRGB(50, 50, 50), function()
    if AppWindow:FindFirstChild("InfoPanel") then AppWindow.InfoPanel:Destroy() else
        local p = Instance.new("Frame", AppWindow)
        p.Name = "InfoPanel"
        p.Size = UDim2.new(0, 220, 0, 150)
        p.Position = UDim2.new(0.5, -110, 0.5, -75)
        p.BackgroundColor3 = Config.Theme.Card
        p.ZIndex = 500
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
        t.Text = "• Key Access : Lifetime\n• User : Owner\n• Version : 1.01\n• Created By : Anonymous9x\n• Tiktok : @anonymous9x_"
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
Scroll.Size = UDim2.new(1, -20, 0, 220)
Scroll.Position = UDim2.new(0, 10, 0, 60)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 2
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.X
Scroll.CanvasSize = UDim2.new(0,0,0,0)

local ScrollPadding = Instance.new("UIPadding", Scroll)
ScrollPadding.PaddingTop = UDim.new(0, 12)

local Layout = Instance.new("UIListLayout", Scroll)
Layout.FillDirection = "Horizontal"
Layout.Padding = UDim.new(0, 15)

for _, s in ipairs(Config.Scripts) do
    local Card = Instance.new("Frame", Scroll)
    Card.Name = s.Name
    Card.Size = UDim2.new(0, 160, 0, 200)
    Card.BackgroundColor3 = Config.Theme.Card
    Instance.new("UICorner", Card)
    AddStroke(Card, 1)
    
    local I = Instance.new("TextLabel", Card)
    I.Text = s.Icon
    I.Size = UDim2.new(1, 0, 0, 40)
    I.Position = UDim2.new(0, 0, 0, 10)
    I.TextColor3 = Color3.new(1,1,1)
    I.Font = Enum.Font.GothamBlack
    I.TextSize = 18
    I.BackgroundTransparency = 1
    
    local N = Instance.new("TextLabel", Card)
    N.Text = s.Name
    N.Size = UDim2.new(1, -10, 0, 20)
    N.Position = UDim2.new(0, 5, 0, 50)
    N.TextColor3 = Color3.new(1,1,1)
    N.Font = Enum.Font.GothamBlack
    N.TextSize = 13
    N.BackgroundTransparency = 1
    
    local D = Instance.new("TextLabel", Card)
    D.Text = s.Desc
    D.Size = UDim2.new(1,-20,0,70)
    D.Position = UDim2.new(0,10,0,85)
    D.TextColor3 = Color3.fromRGB(180,180,180)
    D.Font = Enum.Font.GothamBold
    D.TextSize = 10
    D.TextWrapped = true
    D.TextXAlignment = "Left"
    D.TextYAlignment = "Top"
    D.BackgroundTransparency = 1

    local L = Instance.new("TextButton", Card)
    L.Text = "EXECUTE"
    L.Size = UDim2.new(0.85, 0, 0, 30)
    L.Position = UDim2.new(0.075, 0, 1, -40)
    L.BackgroundColor3 = Color3.new(1,1,1)
    L.TextColor3 = Color3.new(0,0,0)
    L.Font = Enum.Font.GothamBlack
    L.TextSize = 11
    Instance.new("UICorner", L).CornerRadius = UDim.new(0, 6)
    L.MouseButton1Click:Connect(function() loadstring(game:HttpGet(s.URL))() end)
end

-- ==================== FOOTER (REAL DATA) ====================
local Footer = Instance.new("Frame", AppWindow)
Footer.Size = UDim2.new(1, -20, 0, 35)
Footer.Position = UDim2.new(0, 10, 1, -45)
Footer.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
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
            pcall(function() ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms" end)
            local mem = math.floor(StatsService:GetTotalMemoryUsageMb()) .. "MB"
            local fps = math.floor(1/RunService.RenderStepped:Wait())
            TerminalTxt.Text = string.format("> NET: %s | MEM: %s | FPS: %d | STATUS: INJECTED", ping, mem, fps)
        end
    end)
end

-- ==================== LOADING (KUNCI UTAMA) ====================
local function RunHackerLoading()
    -- Buat Overlay di dalam ScreenGui
    local Overlay = Instance.new("Frame", ScreenGui)
    Overlay.Size = UDim2.new(1,0,1,0)
    Overlay.BackgroundColor3 = Color3.new(0,0,0)
    Overlay.ZIndex = 10000 -- Biar paling depan
    
    local C = Instance.new("TextLabel", Overlay)
    C.Size = UDim2.new(1,0,1,0)
    C.Position = UDim2.new(0, 40, 0, 0)
    C.BackgroundTransparency = 1
    C.TextColor3 = Config.Theme.HackerGreen
    C.Font = Enum.Font.Code
    C.TextSize = 18
    C.TextXAlignment = "Left"
    C.Text = "> BOOT_SEQUENCE_START..."
    
    local lns = {
        "> FETCHING_REMOTE_ASSETS...",
        "> BYPASSING_GUI_PROT...",
        "> INITIALIZING_COMPONENTS...",
        "> INJECTING_VIP_MODULES...",
        "> AUTHENTICATION_SUCCESSFUL."
    }
    
    -- Animasi Teks
    for _, l in ipairs(lns) do 
        task.wait(0.5) -- Kasih jeda biar kelihatan
        C.Text = C.Text .. "\n" .. l 
    end
    
    task.wait(0.5)
    Overlay:Destroy() -- Hapus loading
    AppWindow.Visible = true -- Tampilkan Menu
    StartMonitor() -- Jalankan Footer
end

LogBtn.MouseButton1Click:Connect(function()
    if UserBox.Text == "Owner" and KeyBox.Text == "123" then
        LoginFrame.Visible = false -- Tutup Login
        RunHackerLoading() -- Jalankan Loading baru masuk Menu
    else
        LogBtn.Text = "ACCESS_DENIED"
        task.wait(1)
        LogBtn.Text = "AUTHENTICATE"
    end
end)

MinimizedApp.MouseButton1Click:Connect(function() AppWindow.Visible = true MinimizedApp.Visible = false end)

Search:GetPropertyChangedSignal("Text"):Connect(function()
    local q = Search.Text:lower()
    for _, card in pairs(Scroll:GetChildren()) do
        if card:IsA("Frame") then card.Visible = card.Name:lower():find(q) and true or false end
    end
end)

local function dr(o)
    local d, s, p
    o.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true s = i.Position p = o.Position end end)
    UserInputService.InputChanged:Connect(function(i) if d and i.UserInputType == Enum.UserInputType.MouseMovement then
        local dt = i.Position - s
        o.Position = UDim2.new(p.X.Scale, p.X.Offset + dt.X, p.Y.Scale, p.Y.Offset + dt.Y)
    end end)
    o.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
end
dr(AppWindow); dr(LoginFrame); dr(MinimizedApp)
