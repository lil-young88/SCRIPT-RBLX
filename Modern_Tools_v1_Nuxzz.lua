--[[
    Modern Tools Gui V1 By Nuxzz
    Features: Invisible, FullBright, WalkSpeed (Auto-detect & Custom 1-1000)
    Theme: Modern Clean (White & Gray) with Smooth Animations
]]--

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Notifikasi awal
task.spawn(function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Modern Tools V1";
            Text = "Script By Nuxzz - Loaded!";
            Duration = 4;
        })
    end)
end)

-- Hapus GUI lama jika ada
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("NuxzzModernGui") then
        game:GetService("CoreGui").NuxzzModernGui:Destroy()
    end
    if player.PlayerGui:FindFirstChild("NuxzzModernGui") then
        player.PlayerGui.NuxzzModernGui:Destroy()
    end
end)

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NuxzzModernGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
end

-- Main Frame (Modern White & Gray, Compact & Sleek)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 247) -- Light Gray Modern
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -115)
MainFrame.Size = UDim2.new(0, 220, 0, 265)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Untuk animasi opening

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(210, 210, 215)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

-- Animasi Opening Mulus
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 220, 0, 265),
    BackgroundTransparency = 0
}):Play()

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- Memperbaiki sudut bawah titlebar agar lurus
local TitleFix = Instance.new("Frame")
TitleFix.Parent = TitleBar
TitleFix.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleFix.BorderSizePixel = 0
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0.05, 0, 0, 0)
TitleText.Size = UDim2.new(0.6, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "Nuxzz Tools"
TitleText.TextColor3 = Color3.fromRGB(40, 40, 45)
TitleText.TextSize = 13
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Minimize (-)
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
MinBtn.Position = UDim2.new(0.62, 0, 0.2, 0)
MinBtn.Size = UDim2.new(0, 24, 0, 24)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(80, 80, 90)
MinBtn.TextSize = 14

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinBtn

-- Tombol Close (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 235, 235)
CloseBtn.Position = UDim2.new(0.81, 0, 0.2, 0)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Container Menu Utama
local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 0, 0, 45)
ContentContainer.Size = UDim2.new(1, 0, 1, -45)
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 230)
ContentContainer.ScrollBarThickness = 2

-- Watermark Text (Script By Nuxzz)
local Watermark = Instance.new("TextLabel")
Watermark.Parent = ContentContainer
Watermark.BackgroundTransparency = 1
Watermark.Position = UDim2.new(0, 0, 0, 195)
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Font = Enum.Font.GothamMedium
Watermark.Text = "Script By Nuxzz"
Watermark.TextColor3 = Color3.fromRGB(160, 160, 170)
Watermark.TextSize = 10

-- Helper Fungsi Pembuatan Tombol Toggle Modern
local function createToggle(name, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentContainer
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.Position = UDim2.new(0.07, 0, 0, posY)
    btn.Size = UDim2.new(0, 190, 0, 32)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "  " .. name .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(100, 100, 110)
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(225, 225, 230)
    stroke.Thickness = 1
    stroke.Parent = btn

    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(230, 245, 230)}):Play()
            stroke.Color = Color3.fromRGB(70, 200, 100)
            btn.TextColor3 = Color3.fromRGB(40, 140, 70)
            btn.Text = "  " .. name .. ": ON"
        else
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            stroke.Color = Color3.fromRGB(225, 225, 230)
            btn.TextColor3 = Color3.fromRGB(100, 100, 110)
            btn.Text = "  " .. name .. ": OFF"
        end
        callback(active)
    end)
end

-- 1. FITUR: INVISIBLE (Tidak Terlihat)
local originalTransparency = {}
createToggle("Invisible", 10, function(state)
    local char = player.Character
    if not char then return end
    
    if state then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("MeshPart") then
                originalTransparency[v] = v.Transparency
                v.Transparency = 1
                if v.Name == "HumanoidRootPart" then v.Transparency = 1 end
            elseif v:IsA("Accessory") then
                local handle = v:FindFirstChild("Handle")
                if handle then
                    originalTransparency[handle] = handle.Transparency
                    handle.Transparency = 1
                end
            end
        end
    else
        for v, trans in pairs(originalTransparency) do
            if v and v.Parent then
                v.Transparency = trans
            end
        end
    end
end)

-- 2. FITUR: FULLBRIGHT (Menerangi Seluruh Map)
local lightingConfig = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

createToggle("FullBright", 52, function(state)
    if state then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = lightingConfig.Brightness
        Lighting.ClockTime = lightingConfig.ClockTime
        Lighting.FogEnd = lightingConfig.FogEnd
        Lighting.GlobalShadows = lightingConfig.GlobalShadows
        Lighting.OutdoorAmbient = lightingConfig.OutdoorAmbient
    end
end)

-- 3. FITUR: WALK SPEED (Deteksi Default & Custom 1 - 1000)
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Parent = ContentContainer
SpeedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedFrame.Position = UDim2.new(0.07, 0, 0, 94)
SpeedFrame.Size = UDim2.new(0, 190, 0, 52)

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedFrame

local SpeedStroke = Instance.new("UIStroke")
SpeedStroke.Color = Color3.fromRGB(225, 225, 230)
SpeedStroke.Thickness = 1
SpeedStroke.Parent = SpeedFrame

-- Deteksi Default Kecepatan Player
local defaultSpeed = 16
task.spawn(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        defaultSpeed = hum.WalkSpeed
    end
end)

player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        defaultSpeed = hum.WalkSpeed
    end
end)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = SpeedFrame
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0.05, 0, 0, 4)
SpeedLabel.Size = UDim2.new(0.9, 0, 0, 20)
SpeedLabel.Font = Enum.Font.GothamMedium
SpeedLabel.Text = "WalkSpeed: " .. defaultSpeed
SpeedLabel.TextColor3 = Color3.fromRGB(100, 100, 110)
SpeedLabel.TextSize = 11
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Min Speed (-)
local MinusBtn = Instance.new("TextButton")
MinusBtn.Parent = SpeedFrame
MinusBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
MinusBtn.Position = UDim2.new(0.05, 0, 0.48, 0)
MinusBtn.Size = UDim2.new(0, 40, 0, 22)
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.Text = "-"
MinusBtn.TextColor3 = Color3.fromRGB(80, 80, 90)
MinusBtn.TextSize = 14

local MinusC = Instance.new("UICorner")
MinusC.CornerRadius = UDim.new(0, 5)
MinusC.Parent = MinusBtn

-- Kotak Nilai Speed
local SpeedValBox = Instance.new("TextBox")
SpeedValBox.Parent = SpeedFrame
SpeedValBox.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
SpeedValBox.Position = UDim2.new(0.28, 0, 0.48, 0)
SpeedValBox.Size = UDim2.new(0, 75, 0, 22)
SpeedValBox.Font = Enum.Font.GothamBold
SpeedValBox.Text = tostring(defaultSpeed)
SpeedValBox.TextColor3 = Color3.fromRGB(40, 40, 45)
SpeedValBox.TextSize = 12

local BoxC = Instance.new("UICorner")
BoxC.CornerRadius = UDim.new(0, 5)
BoxC.Parent = SpeedValBox

-- Tombol Plus Speed (+)
local PlusBtn = Instance.new("TextButton")
PlusBtn.Parent = SpeedFrame
PlusBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
PlusBtn.Position = UDim2.new(0.72, 0, 0.48, 0)
PlusBtn.Size = UDim2.new(0, 40, 0, 22)
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(80, 80, 90)
PlusBtn.TextSize = 14

local PlusC = Instance.new("UICorner")
PlusC.CornerRadius = UDim.new(0, 5)
PlusC.Parent = PlusBtn

-- Logika Pengaturan WalkSpeed (1 - 1000)
local function applySpeed(val)
    local num = tonumber(val)
    if not num then return end
    if num < 1 then num = 1 end
    if num > 1000 then num = 1000 end
    
    SpeedValBox.Text = tostring(num)
    SpeedLabel.Text = "WalkSpeed: " .. num
    
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = num
    end
end

PlusBtn.MouseButton1Click:Connect(function()
    local current = tonumber(SpeedValBox.Text) or defaultSpeed
    if current < 1000 then
        applySpeed(current + 5)
    end
end)

MinusBtn.MouseButton1Click:Connect(function()
    local current = tonumber(SpeedValBox.Text) or defaultSpeed
    if current > 1 then
        applySpeed(current - 5)
    end
end)

SpeedValBox.FocusLost:Connect(function()
    applySpeed(SpeedValBox.Text)
end)

-- Loop agar WalkSpeed tetap konsisten saat respawn
RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    local speedNum = tonumber(SpeedValBox.Text)
    if speedNum and speedNum ~= defaultSpeed then
        local char = player.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            if char:FindFirstChildOfClass("Humanoid").WalkSpeed ~= speedNum then
                char:FindFirstChildOfClass("Humanoid").WalkSpeed = speedNum
            end
        end
    end
end)

-- 4. FITUR MINIMIZE (Kecilin Tab / Buka Kembali)
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 220, 0, 40)}):Play()
        ContentContainer.Visible = false
        MinBtn.Text = "+"
    else
        ContentContainer.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 220, 0, 265)}):Play()
        MinBtn.Text = "-"
    end
end)

-- 5. FITUR KONFIRMASI CLOSE (Tombol OK Konfirmasi sebelum keluar)
CloseBtn.MouseButton1Click:Connect(function()
    -- Buat Popup Dialog Konfirmasi OK
    local ConfirmOverlay = Instance.new("Frame")
    ConfirmOverlay.Parent = ScreenGui
    ConfirmOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ConfirmOverlay.BackgroundTransparency = 0.5
    ConfirmOverlay.Size = UDim2.new(1, 0, 1, 0)
    
    local DialogBox = Instance.new("Frame")
    DialogBox.Parent = ConfirmOverlay
    DialogBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DialogBox.Position = UDim2.new(0.5, -90, 0.5, -50)
    DialogBox.Size = UDim2.new(0, 180, 0, 95)
    
    local DialogC = Instance.new("UICorner")
    DialogC.CornerRadius = UDim.new(0, 10)
    DialogC.Parent = DialogBox
    
    local DialogText = Instance.new("TextLabel")
    DialogText.Parent = DialogBox
    DialogText.BackgroundTransparency = 1
    DialogText.Position = UDim2.new(0, 0, 0, 10)
    DialogText.Size = UDim2.new(1, 0, 0, 35)
    DialogText.Font = Enum.Font.GothamMedium
    DialogText.Text = "Yakin ingin menutup\nscript ini?"
    DialogText.TextColor3 = Color3.fromRGB(50, 50, 55)
    DialogText.TextSize = 12
    
    -- Tombol OK (Tutup Permanen)
    local OkBtn = Instance.new("TextButton")
    OkBtn.Parent = DialogBox
    OkBtn.BackgroundColor3 = Color3.fromRGB(230, 60, 60)
    OkBtn.Position = UDim2.new(0.1, 0, 0.62, 0)
    OkBtn.Size = UDim2.new(0, 75, 0, 26)
    OkBtn.Font = Enum.Font.GothamBold
    OkBtn.Text = "OK"
    OkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OkBtn.TextSize = 12
    
    local OkC = Instance.new("UICorner")
    OkC.CornerRadius = UDim.new(0, 6)
    OkC.Parent = OkBtn
    
    -- Tombol Batal
    local CancelBtn = Instance.new("TextButton")
    CancelBtn.Parent = DialogBox
    CancelBtn.BackgroundColor3 = Color3.fromRGB(230, 230, 235)
    CancelBtn.Position = UDim2.new(0.53, 0, 0.62, 0)
    CancelBtn.Size = UDim2.new(0, 75, 0, 26)
    CancelBtn.Font = Enum.Font.GothamBold
    CancelBtn.Text = "Batal"
    CancelBtn.TextColor3 = Color3.fromRGB(80, 80, 90)
    CancelBtn.TextSize = 12
    
    local CancelC = Instance.new("UICorner")
    CancelC.CornerRadius = UDim.new(0, 6)
    CancelC.Parent = CancelBtn
    
    OkBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CancelBtn.MouseButton1Click:Connect(function()
        ConfirmOverlay:Destroy()
    end)
end)
