--[[
    Script By Nuxzz
    Subscribe YouTube Nuxzz
    Compatible with Delta, Arceus X, Fluxus, etc.
]]--

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Hapus GUI lama jika ada agar tidak duplikat
if CoreGui:FindFirstChild("NuxzzSpectateGUI") then
    CoreGui.NuxzzSpectateGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NuxzzSpectateGUI"
ScreenGui.ResetOnSpawn = false
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Variabel Utama Spectate
local playerList = {}
local currentIndex = 1
local isSpectating = false
local spectatingTarget = nil

-- Fungsi Animasi Tween
local function tween(obj, props, duration)
    TweenService:Create(obj, TweenInfo.new(duration or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

-- === MAIN FRAME (Background Gray) ===
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Abu-abu modern
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -160)
MainFrame.Size = UDim2.new(0, 300, 0, 320)
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 60, 60)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- === TOP BAR ===
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

-- Judul & Branding
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.Size = UDim2.new(0, 180, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Nuxzz Spectate GUI"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.Position = UDim2.new(1, -32, 0.5, -12)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tombol Minimize
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeBtn.Position = UDim2.new(1, -64, 0.5, -12)
MinimizeBtn.Size = UDim2.new(0, 24, 0, 24)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 14

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and UDim2.new(0, 300, 0, 40) or UDim2.new(0, 300, 0, 320)
    tween(MainFrame, {Size = targetSize}, 0.3)
end)

-- === CONTENT CONTAINER ===
local Content = Instance.new("ScrollingFrame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 45)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.CanvasSize = UDim2.new(0, 0, 0, 300)
Content.ScrollBarThickness = 4

-- Server Player Count Info
local CountLabel = Instance.new("TextLabel")
CountLabel.Parent = Content
CountLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CountLabel.Position = UDim2.new(0, 12, 0, 10)
CountLabel.Size = UDim2.new(1, -24, 0, 30)
CountLabel.Font = Enum.Font.GothamMedium
CountLabel.Text = "Total Player di Server: 0"
CountLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
CountLabel.TextSize = 12

local CountCorner = Instance.new("UICorner")
CountCorner.CornerRadius = UDim.new(0, 6)
CountCorner.Parent = CountLabel

-- Target Display Label
local TargetLabel = Instance.new("TextLabel")
TargetLabel.Parent = Content
TargetLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TargetLabel.Position = UDim2.new(0, 12, 0, 50)
TargetLabel.Size = UDim2.new(1, -24, 0, 40)
TargetLabel.Font = Enum.Font.GothamBold
TargetLabel.Text = "Target: [ Tidak Ada ]"
TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetLabel.TextSize = 13

local TargetCorner = Instance.new("UICorner")
TargetCorner.CornerRadius = UDim.new(0, 6)
TargetCorner.Parent = TargetLabel

-- Tombol Kiri (<) & Kanan (>)
local PrevBtn = Instance.new("TextButton")
PrevBtn.Parent = Content
PrevBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Tombol Putih
PrevBtn.Position = UDim2.new(0, 12, 0, 100)
PrevBtn.Size = UDim2.new(0.48, -6, 0, 38)
PrevBtn.Font = Enum.Font.GothamBold
PrevBtn.Text = "< Sebelumnya"
PrevBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
PrevBtn.TextSize = 12

local PrevCorner = Instance.new("UICorner")
PrevCorner.CornerRadius = UDim.new(0, 6)
PrevCorner.Parent = PrevBtn

local NextBtn = Instance.new("TextButton")
NextBtn.Parent = Content
NextBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Tombol Putih
NextBtn.Position = UDim2.new(0.5, 3, 0, 100)
NextBtn.Size = UDim2.new(0.48, -6, 0, 38)
NextBtn.Font = Enum.Font.GothamBold
NextBtn.Text = "Selanjutnya >"
NextBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
NextBtn.TextSize = 12

local NextCorner = Instance.new("UICorner")
NextCorner.CornerRadius = UDim.new(0, 6)
NextCorner.Parent = NextBtn

-- Tombol Toggle Spec On/Off
local ToggleSpecBtn = Instance.new("TextButton")
ToggleSpecBtn.Parent = Content
ToggleSpecBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Tombol Putih
ToggleSpecBtn.Position = UDim2.new(0, 12, 0, 148)
ToggleSpecBtn.Size = UDim2.new(1, -24, 0, 38)
ToggleSpecBtn.Font = Enum.Font.GothamBold
ToggleSpecBtn.Text = "Status Spec: OFF"
ToggleSpecBtn.TextColor3 = Color3.fromRGB(200, 40, 40)
ToggleSpecBtn.TextSize = 13

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleSpecBtn

-- Tombol Update List Manual
local UpdateListBtn = Instance.new("TextButton")
UpdateListBtn.Parent = Content
UpdateListBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Tombol Putih
UpdateListBtn.Position = UDim2.new(0, 12, 0, 196)
UpdateListBtn.Size = UDim2.new(1, -24, 0, 34)
UpdateListBtn.Font = Enum.Font.GothamMedium
UpdateListBtn.Text = "Update List Player"
UpdateListBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
UpdateListBtn.TextSize = 12

local UpdateCorner = Instance.new("UICorner")
UpdateCorner.CornerRadius = UDim.new(0, 6)
UpdateCorner.Parent = UpdateListBtn

-- Watermark / Credits Text
local Credit1 = Instance.new("TextLabel")
Credit1.Parent = Content
Credit1.BackgroundTransparency = 1
Credit1.Position = UDim2.new(0, 12, 0, 240)
Credit1.Size = UDim2.new(1, -24, 0, 20)
Credit1.Font = Enum.Font.GothamBold
Credit1.Text = "Script By Nuxzz"
Credit1.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit1.TextSize = 11

local Credit2 = Instance.new("TextLabel")
Credit2.Parent = Content
Credit2.BackgroundTransparency = 1
Credit2.Position = UDim2.new(0, 12, 0, 260)
Credit2.Size = UDim2.new(1, -24, 0, 20)
Credit2.Font = Enum.Font.GothamMedium
Credit2.Text = "Subscribe YouTube Nuxzz"
Credit2.TextColor3 = Color3.fromRGB(120, 120, 120)
Credit2.TextSize = 10

-- === LOGIC & SPECTATE SYSTEM ===

local function updatePlayerList()
    playerList = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(playerList, p)
        end
    end
    CountLabel.Text = "Total Player di Server: " .. tostring(#Players:GetPlayers())
    
    -- Validasi index jika player keluar
    if currentIndex > #playerList then
        currentIndex = 1
    end
end

-- Update otomatis pertama kali
updatePlayerList()

-- Loop auto-update list setiap 30 detik
task.spawn(function()
    while true do
        task.wait(30)
        pcall(updatePlayerList)
    end
end)

-- Fungsi Pilih Target & Mulai/Berhenti Spectate
local function applySpectate()
    if not isSpectating then return end
    if #playerList == 0 then
        TargetLabel.Text = "Target: [ Tidak Ada Player Lain ]"
        spectatingTarget = nil
        return
    end
    
    if currentIndex > #playerList then currentIndex = 1 end
    if currentIndex < 1 then currentIndex = #playerList end
    
    spectatingTarget = playerList[currentIndex]
    TargetLabel.Text = "Target: " .. spectatingTarget.Name
end

-- Tombol Kanan
NextBtn.MouseButton1Click:Connect(function()
    if not isSpectating then return end
    updatePlayerList()
    if #playerList > 0 then
        currentIndex = currentIndex + 1
        if currentIndex > #playerList then currentIndex = 1 end
        applySpectate()
    end
end)

-- Tombol Kiri
PrevBtn.MouseButton1Click:Connect(function()
    if not isSpectating then return end
    updatePlayerList()
    if #playerList > 0 then
        currentIndex = currentIndex - 1
        if currentIndex < 1 then currentIndex = #playerList end
        applySpectate()
    end
end)

-- Tombol Update Manual
UpdateListBtn.MouseButton1Click:Connect(function()
    updatePlayerList()
    if isSpectating then
        applySpectate()
    end
    -- Efek klik tombol
    tween(UpdateListBtn, {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, 0.1)
    task.wait(0.1)
    tween(UpdateListBtn, {BackgroundColor3 = Color3.fromRGB(240, 240, 240)}, 0.1)
end)

-- Toggle On/Off Spec
ToggleSpecBtn.MouseButton1Click:Connect(function()
    isSpectating = not isSpectating
    if isSpectating then
        ToggleSpecBtn.Text = "Status Spec: ON"
        ToggleSpecBtn.TextColor3 = Color3.fromRGB(40, 180, 40)
        updatePlayerList()
        currentIndex = 1
        applySpectate()
    else
        ToggleSpecBtn.Text = "Status Spec: OFF"
        ToggleSpecBtn.TextColor3 = Color3.fromRGB(200, 40, 40)
        TargetLabel.Text = "Target: [ Tidak Ada ]"
        spectatingTarget = nil
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    end
end)

-- RenderStepped untuk Mengunci Kamera ke Target (Aman meskipun Respawn)
RunService.RenderStepped:Connect(function()
    if isSpectating and spectatingTarget then
        -- Cek apakah target masih di server
        if not spectatingTarget:IsDescendantOf(Players) then
            -- Jika player keluar game, auto kembali/pindah ke player lain
            updatePlayerList()
            applySpectate()
            return
        end
        
        -- Cek karakter dan humanoid target (Aman saat Respawn)
        local char = spectatingTarget.Character
        if char and char:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject = char.Humanoid
        end
    end
end)

-- Event jika player keluar server secara langsung
Players.PlayerRemoving:Connect(function(plr)
    if plr == spectatingTarget then
        updatePlayerList()
        applySpectate()
    end
end)

print("Script By Nuxzz Loaded Successfully!")
