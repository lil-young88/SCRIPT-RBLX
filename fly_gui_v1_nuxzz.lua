--[[
    Fly Gui V1 By Nuxzz
    Universal Script for Mobile & Desktop Executors
    Optimized & Bug-Free Version
]]--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- 1. Notifikasi awal saat script dijalankan (aman dari error jika StarterGui belum siap)
task.spawn(function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Fly Gui V1";
            Text = "By Nuxzz - Successfully Loaded!";
            Duration = 4;
        })
    end)
end)

-- 2. Hapus GUI lama jika script dieksekusi ulang (mencegah duplikat GUI)
pcall(function()
    if CoreGui:FindFirstChild("NuxzzFlyGui") then
        CoreGui.NuxzzFlyGui:Destroy()
    end
    if player.PlayerGui:FindFirstChild("NuxzzFlyGui") then
        player.PlayerGui.NuxzzFlyGui:Destroy()
    end
end)

-- 3. ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NuxzzFlyGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Support berbagai executor (Mobile/Desktop protection)
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
end

-- 4. Main Frame (Dark Gray + Neon Purple Accent)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28) -- Dark Gray
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 170)
MainFrame.Active = true
MainFrame.Draggable = true -- Bisa digeser di mobile/desktop

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(147, 51, 234) -- Neon Purple
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- 5. Title Bar
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Fly Gui V1 | Nuxzz"
Title.TextColor3 = Color3.fromRGB(216, 180, 254)
Title.TextSize = 13

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- 6. Fly Toggle Button
local FlyBtn = Instance.new("TextButton")
FlyBtn.Name = "FlyBtn"
FlyBtn.Parent = MainFrame
FlyBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
FlyBtn.Position = UDim2.new(0.08, 0, 0.28, 0)
FlyBtn.Size = UDim2.new(0, 185, 0, 36)
FlyBtn.Font = Enum.Font.GothamBold
FlyBtn.Text = "Fly: OFF"
FlyBtn.TextColor3 = Color3.fromRGB(239, 68, 68) -- Merah saat OFF
FlyBtn.TextSize = 14

local FlyBtnCorner = Instance.new("UICorner")
FlyBtnCorner.CornerRadius = UDim.new(0, 6)
FlyBtnCorner.Parent = FlyBtn

local FlyBtnStroke = Instance.new("UIStroke")
FlyBtnStroke.Color = Color3.fromRGB(147, 51, 234)
FlyBtnStroke.Thickness = 1
FlyBtnStroke.Parent = FlyBtn

-- 7. Speed Container & Controls
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Parent = MainFrame
SpeedFrame.BackgroundTransparency = 1
SpeedFrame.Position = UDim2.new(0.08, 0, 0.58, 0)
SpeedFrame.Size = UDim2.new(0, 185, 0, 50)

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = SpeedFrame
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Size = UDim2.new(1, 0, 0, 18)
SpeedLabel.Font = Enum.Font.GothamMedium
SpeedLabel.Text = "Speed: 2"
SpeedLabel.TextColor3 = Color3.fromRGB(209, 213, 219)
SpeedLabel.TextSize = 12

-- Tombol Minus (-)
local MinusBtn = Instance.new("TextButton")
MinusBtn.Parent = SpeedFrame
MinusBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 90)
MinusBtn.Position = UDim2.new(0, 0, 0.4, 0)
MinusBtn.Size = UDim2.new(0, 50, 0, 26)
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.Text = "-"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.TextSize = 16

local MinusCorner = Instance.new("UICorner")
MinusCorner.CornerRadius = UDim.new(0, 5)
MinusCorner.Parent = MinusBtn

-- Nilai Speed di Tengah
local SpeedValLabel = Instance.new("TextLabel")
SpeedValLabel.Parent = SpeedFrame
SpeedValLabel.BackgroundTransparency = 1
SpeedValLabel.Position = UDim2.new(0.3, 0, 0.4, 0)
SpeedValLabel.Size = UDim2.new(0, 75, 0, 26)
SpeedValLabel.Font = Enum.Font.GothamBold
SpeedValLabel.Text = "2"
SpeedValLabel.TextColor3 = Color3.fromRGB(216, 180, 254)
SpeedValLabel.TextSize = 15

-- Tombol Plus (+)
local PlusBtn = Instance.new("TextButton")
PlusBtn.Parent = SpeedFrame
PlusBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 150)
PlusBtn.Position = UDim2.new(0.72, 0, 0.4, 0)
PlusBtn.Size = UDim2.new(0, 50, 0, 26)
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.TextSize = 16

local PlusCorner = Instance.new("UICorner")
PlusCorner.CornerRadius = UDim.new(0, 5)
PlusCorner.Parent = PlusBtn

-- 8. Core Flight Logic & Physics Handling
local flying = false
local speed = 2
local bg, bv
local flyConnection

local function stopFly()
    flying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    
    FlyBtn.Text = "Fly: OFF"
    FlyBtn.TextColor3 = Color3.fromRGB(239, 68, 68)
    
    if bg then bg:Destroy() bg = nil end
    if bv then bv:Destroy() bv = nil end

    -- Kembalikan state platform/gravitasi karakter jika ada
    local char = player.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").PlatformStand = false
    end
end

local function startFly()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    flying = true
    FlyBtn.Text = "Fly: ON"
    FlyBtn.TextColor3 = Color3.fromRGB(74, 222, 128) -- Hijau saat ON

    bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e4, 9e4, 9e4)
    bg.cframe = hrp.CFrame
    bg.Parent = hrp

    bv = Instance.new("BodyVelocity")
    bv.velocity = Vector3.new(0, 0, 0)
    bv.maxForce = Vector3.new(9e4, 9e4, 9e4)
    bv.Parent = hrp

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flying or not player.Character or player.Character ~= char or not hrp.Parent then
            stopFly()
            return
        end

        local camera = workspace.CurrentCamera
        local moveDir = Vector3.new()
        
        if humanoid.MoveDirection.Magnitude > 0 then
            moveDir = camera.CFrame:VectorToWorldSpace(Vector3.new(humanoid.MoveDirection.X, 0, humanoid.MoveDirection.Z)).Unit
        end
        
        bv.velocity = moveDir * (speed * 20)
        bg.cframe = camera.CFrame
        humanoid.PlatformStand = true
    end)
end

-- 9. Button Event Listeners
PlusBtn.MouseButton1Click:Connect(function()
    if speed < 100 then
        speed = speed + 1
        SpeedLabel.Text = "Speed: " .. speed
        SpeedValLabel.Text = tostring(speed)
    end
end)

MinusBtn.MouseButton1Click:Connect(function()
    if speed > 1 then
        speed = speed - 1
        SpeedLabel.Text = "Speed: " .. speed
        SpeedValLabel.Text = tostring(speed)
    end
end)

FlyBtn.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

-- 10. Safety Check: Matikan fly otomatis jika karakter reset / mati
player.CharacterAdded:Connect(function(newChar)
    stopFly()
end)
