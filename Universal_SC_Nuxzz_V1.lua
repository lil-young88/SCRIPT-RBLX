-- =====================================================================
-- NUXZZ UNIVERSAL SCRIPT V1.8
-- Universal Map & Games - Mobile & Desktop Support
-- Designed with Modern Minimalist Neon Theme
-- =====================================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or CoreGui

-- Hapus UI lama jika ada agar tidak double
if CoreGui:FindFirstChild("NuxzzUniversalUI") then
    CoreGui.NuxzzUniversalUI:Destroy()
end

-- =====================================================================
-- KEY SYSTEM GUI
-- =====================================================================
local KeyScreenGui = Instance.new("ScreenGui")
KeyScreenGui.Name = "NuxzzUniversalUI_Key"
KeyScreenGui.Parent = CoreGui
KeyScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local KeyMainFrame = Instance.new("Frame")
KeyMainFrame.Name = "MainFrame"
KeyMainFrame.Size = UDim2.new(0, 380, 0, 240)
KeyMainFrame.Position = UDim2.new(0.5, -190, 0.5, -120)
KeyMainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
KeyMainFrame.BorderSizePixel = 0
KeyMainFrame.Parent = KeyScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyMainFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 170, 255)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyMainFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "NUXZZ UNIVERSAL - ACCESS KEY"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = Size = 16
KeyTitle.Parent = KeyMainFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 45)
KeyBox.Position = UDim2.new(0.075, 0, 0, 60)
KeyBox.BackgroundColor3 = Color3.fromRGB(15, 25, 50)
KeyBox.BorderSizePixel = 0
KeyBox.Font = Enum.Font.Gotham
KeyBox.PlaceholderText = "Enter your key here..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 150)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 14
KeyBox.Parent = KeyMainFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.41, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 120)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "SUBMIT KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Parent = KeyMainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitBtn

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.41, 0, 0, 40)
GetKeyBtn.Position = UDim2.new(0.515, 0, 0, 120)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 40, 75)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
GetKeyBtn.TextSize = 14
GetKeyBtn.Parent = KeyMainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 180)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.TextSize = 13
StatusLabel.Parent = KeyMainFrame

-- Fungsi Utama Main GUI (Akan dipanggil setelah Key benar)
local function LoadMainUI()
    KeyScreenGui:Destroy()

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NuxzzUniversalUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main Container
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 520, 0, 380)
    MainFrame.Position = UDim2.new(0.5, -260, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3.fromRGB(8, 12, 22)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(0, 170, 255)
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame

    -- TopBar Header
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 45)
    TopBar.BackgroundColor3 = Color3.fromRGB(12, 18, 32)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 10)
    TopBarCorner.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "NUXZZ UNIVERSAL SCRIPT V1.8"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar

    -- Minimize Button (-)
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 35, 0, 35)
    MinBtn.Position = UDim2.new(1, -80, 0.5, -17)
    MinBtn.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
    MinBtn.TextSize = 18
    MinBtn.Parent = TopBar

    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 8)
    MinCorner.Parent = MinBtn

    -- Close/Credit indicator (Script by Nuxzz)
    local CreditLabel = Instance.new("TextLabel")
    CreditLabel.Size = UDim2.new(1, 0, 0, 20)
    CreditLabel.Position = UDim2.new(0, 0, 1, -22)
    CreditLabel.BackgroundTransparency = 1
    CreditLabel.Font = Enum.Font.GothamItalic
    CreditLabel.Text = "Script By Nuxzz"
    CreditLabel.TextColor3 = Color3.fromRGB(120, 150, 180)
    CreditLabel.TextSize = 11
    CreditLabel.Parent = MainFrame

    -- Tab Navigation Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(1, -20, 0, 35)
    TabContainer.Position = UDim2.new(0, 10, 0, 55)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame

    local FeaturesTabBtn = Instance.new("TextButton")
    FeaturesTabBtn.Size = UDim2.new(0.48, 0, 1, 0)
    FeaturesTabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    FeaturesTabBtn.Font = Enum.Font.GothamBold
    FeaturesTabBtn.Text = "FEATURES"
    FeaturesTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    FeaturesTabBtn.TextSize = 13
    FeaturesTabBtn.Parent = TabContainer

    local FeaturesTabCorner = Instance.new("UICorner")
    FeaturesTabCorner.CornerRadius = UDim.new(0, 8)
    FeaturesTabCorner.Parent = FeaturesTabBtn

    local InfoTabBtn = Instance.new("TextButton")
    InfoTabBtn.Size = UDim2.new(0.48, 0, 1, 0)
    InfoTabBtn.Position = UDim2.new(0.52, 0, 0, 0)
    InfoTabBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
    InfoTabBtn.Font = Enum.Font.GothamBold
    InfoTabBtn.Text = "PLAYER INFO"
    InfoTabBtn.TextColor3 = Color3.fromRGB(150, 180, 210)
    InfoTabBtn.TextSize = 13
    InfoTabBtn.Parent = TabContainer

    local InfoTabCorner = Instance.new("UICorner")
    InfoTabCorner.CornerRadius = UDim.new(0, 8)
    InfoTabCorner.Parent = InfoTabBtn

    -- Pages Container
    local PagesContainer = Instance.new("Frame")
    PagesContainer.Size = UDim2.new(1, -20, 1, -125)
    PagesContainer.Position = UDim2.new(0, 10, 0, 98)
    PagesContainer.BackgroundTransparency = 1
    PagesContainer.Parent = MainFrame

    -- Features Scroll Page
    local FeaturesPage = Instance.new("ScrollingFrame")
    FeaturesPage.Size = UDim2.new(1, 0, 1, 0)
    FeaturesPage.BackgroundTransparency = 1
    FeaturesPage.BorderSizePixel = 0
    FeaturesPage.CanvasSize = UDim2.new(0, 0, 0, 480)
    FeaturesPage.ScrollBarThickness = 4
    FeaturesPage.Visible = true
    FeaturesPage.Parent = PagesContainer

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 8)
    UIListLayout.Parent = FeaturesPage

    -- Info Page
    local InfoPage = Instance.new("ScrollingFrame")
    InfoPage.Size = UDim2.new(1, 0, 1, 0)
    InfoPage.BackgroundTransparency = 1
    InfoPage.BorderSizePixel = 0
    InfoPage.CanvasSize = UDim2.new(0, 0, 0, 300)
    InfoPage.ScrollBarThickness = 4
    InfoPage.Visible = false
    InfoPage.Parent = PagesContainer

    local InfoListLayout = Instance.new("UIListLayout")
    InfoListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    InfoListLayout.Padding = UDim.new(0, 6)
    InfoListLayout.Parent = InfoPage

    -- Tab Switching Logic
    FeaturesTabBtn.MouseButton1Click:Connect(function()
        FeaturesPage.Visible = true
        InfoPage.Visible = false
        FeaturesTabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        FeaturesTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        InfoTabBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
        InfoTabBtn.TextColor3 = Color3.fromRGB(150, 180, 210)
    end)

    InfoTabBtn.MouseButton1Click:Connect(function()
        InfoPage.Visible = true
        FeaturesPage.Visible = false
        InfoTabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        InfoTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        FeaturesTabBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
        FeaturesTabBtn.TextColor3 = Color3.fromRGB(150, 180, 210)
    end)

    -- =====================================================================
    -- BUILD FEATURES TOGGLES / CONTROLS
    -- =====================================================================

    local function CreateToggle(name, desc, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -5, 0, 48)
        Frame.BackgroundColor3 = Color3.fromRGB(12, 18, 32)
        Frame.BorderSizePixel = 0
        Frame.Parent = FeaturesPage

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(0.7, 0, 1, 0)
        Title.Position = UDim2.new(0, 12, 0, 0)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = name
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 13
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Frame

        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Size = UDim2.new(0, 50, 0, 26)
        ToggleBtn.Position = UDim2.new(1, -62, 0.5, -13)
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 65)
        ToggleBtn.Font = Enum.Font.GothamBold
        ToggleBtn.Text = "OFF"
        ToggleBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        ToggleBtn.TextSize = 11
        ToggleBtn.Parent = Frame

        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 13)
        ToggleCorner.Parent = ToggleBtn

        local toggled = false
        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            if toggled then
                ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleBtn.Text = "ON"
            else
                ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 65)
                ToggleBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
                ToggleBtn.Text = "OFF"
            end
            pcall(function()
                callback(toggled)
            end)
        end)
    end

    -- 1. FullBright Feature
    CreateToggle("FullBright", "Makes the entire map bright and clear.", function(state)
        if state then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 0
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end)

    -- 2. ESP Feature
    local espEnabled = false
    local espFolder = Instance.new("Folder")
    espFolder.Name = "NuxzzESPFolder"
    espFolder.Parent = CoreGui

    local function updateESP()
        for _, obj in pairs(espFolder:GetChildren()) do
            obj:Destroy()
        end
        if not espEnabled then return end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local char = player.Character
                local hl = Instance.new("Highlight")
                hl.Name = player.Name .. "_ESP"
                hl.Adornee = char
                hl.FillColor = Color3.fromRGB(0, 170, 255)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.FillTransparency = 0.5
                hl.OutlineTransparency = 0
                hl.Parent = espFolder
            end
        end
    end

    CreateToggle("ESP Players", "Highlight all players on the map.", function(state)
        espEnabled = state
        updateESP()
    end)

    RunService.RenderStepped:Connect(function()
        if espEnabled then
            pcall(updateESP)
        end
    end)

    -- 3. WalkSpeed Feature & Customizer
    local speedEnabled = false
    local customSpeed = 16

    local SpeedFrame = Instance.new("Frame")
    SpeedFrame.Size = UDim2.new(1, -5, 0, 60)
    SpeedFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 32)
    SpeedFrame.BorderSizePixel = 0
    SpeedFrame.Parent = FeaturesPage

    local SpeedCorner = Instance.new("UICorner")
    SpeedCorner.CornerRadius = UDim.new(0, 8)
    SpeedCorner.Parent = SpeedFrame

    local SpeedTitle = Instance.new("TextLabel")
    SpeedTitle.Size = UDim2.new(0.6, 0, 0, 30)
    SpeedTitle.Position = UDim2.new(0, 12, 0, 5)
    SpeedTitle.BackgroundTransparency = 1
    SpeedTitle.Font = Enum.Font.GothamBold
    SpeedTitle.Text = "Walk Speed (1 - 1000)"
    SpeedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedTitle.TextSize = 13
    SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
    SpeedTitle.Parent = SpeedFrame

    local SpeedBox = Instance.new("TextBox")
    SpeedBox.Size = UDim2.new(0, 80, 0, 26)
    SpeedBox.Position = UDim2.new(1, -92, 0, 27)
    SpeedBox.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
    SpeedBox.BorderSizePixel = 0
    SpeedBox.Font = Enum.Font.Gotham
    SpeedBox.Text = "16"
    SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBox.TextSize = 12
    SpeedBox.Parent = SpeedFrame

    local SpeedBoxCorner = Instance.new("UICorner")
    SpeedBoxCorner.CornerRadius = UDim.new(0, 6)
    SpeedBoxCorner.Parent = SpeedBox

    local SpeedToggleBtn = Instance.new("TextButton")
    SpeedToggleBtn.Size = UDim2.new(0, 50, 0, 26)
    SpeedToggleBtn.Position = UDim2.new(1, -150, 0, 27)
    SpeedToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 65)
    SpeedToggleBtn.Font = Enum.Font.GothamBold
    SpeedToggleBtn.Text = "OFF"
    SpeedToggleBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    SpeedToggleBtn.TextSize = 11
    SpeedToggleBtn.Parent = SpeedFrame

    local SpeedToggleCorner = Instance.new("UICorner")
    SpeedToggleCorner.CornerRadius = UDim.new(0, 13)
    SpeedToggleCorner.Parent = SpeedToggleBtn

    SpeedToggleBtn.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        if speedEnabled then
            SpeedToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            SpeedToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            SpeedToggleBtn.Text = "ON"
        else
            SpeedToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 65)
            SpeedToggleBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            SpeedToggleBtn.Text = "OFF"
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
            end
        end
    end)

    SpeedBox.FocusLost:Connect(function()
        local val = tonumber(SpeedBox.Text)
        if val then
            if val < 1 then val = 1 end
            if val > 1000 then val = 1000 end
            customSpeed = val
            SpeedBox.Text = tostring(val)
        else
            SpeedBox.Text = tostring(customSpeed)
        end
    end)

    RunService.Heartbeat:Connect(function()
        if speedEnabled then
            pcall(function()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.WalkSpeed = customSpeed
                end
            end)
        end
    end)

    -- 4. Invisible Feature
    local invisEnabled = false
    CreateToggle("Invisible", "Become invisible to other players.", function(state)
        invisEnabled = state
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = state and 1 or 0
                elseif part:IsA("Decal") then
                    part.Transparency = state and 1 or 0
                end
            end
        end)
    end)

    -- 5. No Clip Feature (Safe against ground/void/stairs)
    local noclipEnabled = false
    CreateToggle("No Clip", "Walk through walls securely without falling into the void.", function(state)
        noclipEnabled = state
    end)

    RunService.Stepped:Connect(function()
        if noclipEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            -- Pastikan tidak menembus bagian bawah tanah ekstrem/void secara tidak sengaja
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end)

    -- 6. God Mode Feature
    local godEnabled = false
    CreateToggle("God Mode", "Immune to any damage.", function(state)
        godEnabled = state
    end)

    RunService.Heartbeat:Connect(function()
        if godEnabled then
            pcall(function()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Health = hum.MaxHealth
                end
            end)
        end
    end)

    -- 7. Copy Skins / UGC Feature
    local SkinsFrame = Instance.new("Frame")
    SkinsFrame.Size = UDim2.new(1, -5, 0, 95)
    SkinsFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 32)
    SkinsFrame.BorderSizePixel = 0
    SkinsFrame.Parent = FeaturesPage

    local SkinsCorner = Instance.new("UICorner")
    SkinsCorner.CornerRadius = UDim.new(0, 8)
    SkinsCorner.Parent = SkinsFrame

    local SkinsTitle = Instance.new("TextLabel")
    SkinsTitle.Size = UDim2.new(1, -12, 0, 25)
    SkinsTitle.Position = UDim2.new(0, 12, 0, 5)
    SkinsTitle.BackgroundTransparency = 1
    SkinsTitle.Font = Enum.Font.GothamBold
    SkinsTitle.Text = "Copy Skins & UGC"
    SkinsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SkinsTitle.TextSize = 13
    SkinsTitle.TextXAlignment = Enum.TextXAlignment.Left
    SkinsTitle.Parent = SkinsFrame

    local TargetUserBox = Instance.new("TextBox")
    TargetUserBox.Size = UDim2.new(1, -24, 0, 28)
    TargetUserBox.Position = UDim2.new(0, 12, 0, 32)
    TargetUserBox.BackgroundColor3 = Color3.fromRGB(20, 30, 55)
    TargetUserBox.BorderSizePixel = 0
    TargetUserBox.Font = Enum.Font.Gotham
    TargetUserBox.PlaceholderText = "Enter Username to copy..."
    TargetUserBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 150)
    TargetUserBox.Text = ""
    TargetUserBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetUserBox.TextSize = 12
    TargetUserBox.Parent = SkinsFrame

    local TargetUserBoxCorner = Instance.new("UICorner")
    TargetUserBoxCorner.CornerRadius = UDim.new(0, 6)
    TargetUserBoxCorner.Parent = TargetUserBox

    local CopySkinBtn = Instance.new("TextButton")
    CopySkinBtn.Size = UDim2.new(0.48, 0, 0, 26)
    CopySkinBtn.Position = UDim2.new(0, 12, 0, 64)
    CopySkinBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    CopySkinBtn.Font = Enum.Font.GothamBold
    CopySkinBtn.Text = "APPLY SKIN"
    CopySkinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopySkinBtn.TextSize = 11
    CopySkinBtn.Parent = SkinsFrame

    local CopySkinCorner = Instance.new("UICorner")
    CopySkinCorner.CornerRadius = UDim.new(0, 6)
    CopySkinCorner.Parent = CopySkinBtn

    local ResetSkinBtn = Instance.new("TextButton")
    ResetSkinBtn.Size = UDim2.new(0.48, 0, 0, 26)
    ResetSkinBtn.Position = UDim2.new(0.5, 0, 0, 64)
    ResetSkinBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 75)
    ResetSkinBtn.Font = Enum.Font.GothamBold
    ResetSkinBtn.Text = "RESET SKIN"
    ResetSkinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResetSkinBtn.TextSize = 11
    ResetSkinBtn.Parent = SkinsFrame

    local ResetSkinCorner = Instance.new("UICorner")
    ResetSkinCorner.CornerRadius = UDim.new(0, 6)
    ResetSkinCorner.Parent = ResetSkinBtn

    CopySkinBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local targetName = TargetUserBox.Text
            local targetPlayer = nil
            for _, p in pairs(Players:GetPlayers()) do
                if string.sub(string.lower(p.Name), 1, #targetName) == string.lower(targetName) or string.sub(string.lower(p.DisplayName), 1, #targetName) == string.lower(targetName) then
                    targetPlayer = p
                    break
                end
            end
            if targetPlayer and targetPlayer.Character then
                local myChar = LocalPlayer.Character
                if myChar and myChar:FindFirstChild("Humanoid") then
                    local desc = Players:GetHumanoidDescriptionFromUserId(targetPlayer.UserId)
                    myChar.Humanoid:ApplyDescription(desc)
                end
            end
        end)
    end)

    ResetSkinBtn.MouseButton1Click:Connect(function()
        pcall(function()
            LocalPlayer.Character:BreakJoints() -- Respawn otomatis untuk reset
        end)
    end)

    -- =====================================================================
    -- PLAYER INFO TAB POPULATION
    -- =====================================================================
    local function CreateInfoRow(labelTitle, labelValue)
        local Row = Instance.new("Frame")
        Row.Size = UDim2.new(1, -5, 0, 36)
        Row.BackgroundColor3 = Color3.fromRGB(12, 18, 32)
        Row.BorderSizePixel = 0
        Row.Parent = InfoPage

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 6)
        Corner.Parent = Row

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(0.4, 0, 1, 0)
        Title.Position = UDim2.new(0, 10, 0, 0)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = labelTitle
        Title.TextColor3 = Color3.fromRGB(180, 200, 230)
        Title.TextSize = 12
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Row

        local Value = Instance.new("TextLabel")
        Value.Size = UDim2.new(0.58, 0, 1, 0)
        Value.Position = UDim2.new(0.4, 0, 0, 0)
        Value.BackgroundTransparency = 1
        Value.Font = Enum.Font.Gotham
        Value.Text = labelValue
        Value.TextColor3 = Color3.fromRGB(255, 255, 255)
        Value.TextSize = 12
        Value.TextXAlignment = Enum.TextXAlignment.Right
        Value.Parent = Row
        
        return Value
    end

    CreateInfoRow("Display Name:", LocalPlayer.DisplayName)
    CreateInfoRow("Username:", "@" .. LocalPlayer.Name)
    
    local deviceType = "Desktop"
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        deviceType = "Mobile"
    end
    CreateInfoRow("Device Type:", deviceType)

    local executorName = identifyexecutor and identifyexecutor() or "Unknown Executor"
    CreateInfoRow("Executor:", executorName)

    local deviceId = tostring(LocalPlayer.UserId) -- Identifier aman
    CreateInfoRow("Device ID / UID:", deviceId)

    -- =====================================================================
    -- MINIMIZE TO FLOATING ROUND BUTTON FUNCTIONALITY
    -- =====================================================================
    local minimized = false
    
    -- Membuat Tombol Bundar Mengambang (Floating Icon)
    local FloatBtn = Instance.new("TextButton")
    FloatBtn.Name = "NuxzzFloatBtn"
    FloatBtn.Size = UDim2.new(0, 50, 0, 50)
    FloatBtn.Position = UDim2.new(0.9, -60, 0.1, 0)
    FloatBtn.BackgroundColor3 = Color3.fromRGB(10, 15, 30)
    FloatBtn.Font = Enum.Font.GothamBold
    FloatBtn.Text = "NUX"
    FloatBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
    FloatBtn.TextSize = 12
    FloatBtn.Visible = false
    FloatBtn.Active = true
    FloatBtn.Draggable = true
    FloatBtn.Parent = ScreenGui

    local FloatCorner = Instance.new("UICorner")
    FloatCorner.CornerRadius = UDim.new(1, 0) -- Bentuk Bulat Sempurna
    FloatCorner.Parent = FloatBtn

    local FloatStroke = Instance.new("UIStroke")
    FloatStroke.Color = Color3.fromRGB(0, 170, 255)
    FloatStroke.Thickness = 2
    FloatStroke.Parent = FloatBtn

    MinBtn.MouseButton1Click:Connect(function()
        minimized = true
        MainFrame.Visible = false
        FloatBtn.Visible = true
    end)

    FloatBtn.MouseButton1Click:Connect(function()
        minimized = false
        MainFrame.Visible = true
        FloatBtn.Visible = false
    end)
end

-- =====================================================================
-- KEY VERIFICATION LOGIC
-- =====================================================================
SubmitBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    if enteredKey == "SCBYNUXZZ" or enteredKey == "123" then
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
        StatusLabel.Text = "Key Verified! Loading UI..."
        task.wait(0.6)
        LoadMainUI()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        StatusLabel.Text = "Invalid Key! Please check again."
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard("https://linkvertise.com") -- Placeholder link Subs2Unlock / Get Key standar
    end)
    StatusLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    StatusLabel.Text = "Link copied to clipboard! Complete Subs2Unlock."
end)