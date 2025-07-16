-- ReiGrow Menu v1.0
-- Criado por ReiMobBR

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Configurações do menu
local ReiGrow = {
    MainColor = Color3.fromRGB(25, 150, 50),  -- Verde jardim
    AccentColor = Color3.fromRGB(255, 215, 0), -- Dourado
    TextColor = Color3.fromRGB(255, 255, 255)  -- Branco
}

-- Criar a GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ReiGrowMenu"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = ReiGrow.MainColor
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "ReiGrow"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = ReiGrow.MainColor
Title.TextColor3 = ReiGrow.TextColor
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.BorderSizePixel = 0
Title.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Name = "TabButtons"
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.Position = UDim2.new(0, 0, 0, 40)
TabButtons.BackgroundTransparency = 1
TabButtons.Parent = MainFrame

local MainTabButton = Instance.new("TextButton")
MainTabButton.Name = "MainTabButton"
MainTabButton.Text = "Main"
MainTabButton.Size = UDim2.new(0.5, 0, 1, 0)
MainTabButton.Position = UDim2.new(0, 0, 0, 0)
MainTabButton.BackgroundColor3 = ReiGrow.MainColor
MainTabButton.TextColor3 = ReiGrow.TextColor
MainTabButton.Font = Enum.Font.Gotham
MainTabButton.TextSize = 14
MainTabButton.BorderSizePixel = 0
MainTabButton.Parent = TabButtons

local AFKTabButton = Instance.new("TextButton")
AFKTabButton.Name = "AFKTabButton"
AFKTabButton.Text = "AFK"
AFKTabButton.Size = UDim2.new(0.5, 0, 1, 0)
AFKTabButton.Position = UDim2.new(0.5, 0, 0, 0)
AFKTabButton.BackgroundColor3 = ReiGrow.MainColor
AFKTabButton.TextColor3 = ReiGrow.TextColor
AFKTabButton.Font = Enum.Font.Gotham
AFKTabButton.TextSize = 14
AFKTabButton.BorderSizePixel = 0
AFKTabButton.Parent = TabButtons

local TabContent = Instance.new("Frame")
TabContent.Name = "TabContent"
TabContent.Size = UDim2.new(1, -20, 1, -80)
TabContent.Position = UDim2.new(0, 10, 0, 80)
TabContent.BackgroundTransparency = 1
TabContent.Parent = MainFrame

-- Conteúdo da aba Main
local MainTab = Instance.new("Frame")
MainTab.Name = "MainTab"
MainTab.Size = UDim2.new(1, 0, 1, 0)
MainTab.BackgroundTransparency = 1
MainTab.Visible = true
MainTab.Parent = TabContent

local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Name = "CreatorLabel"
CreatorLabel.Text = "Criado por: ReiMobBR"
CreatorLabel.Size = UDim2.new(1, 0, 0, 30)
CreatorLabel.Position = UDim2.new(0, 0, 0, 0)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.TextColor3 = ReiGrow.TextColor
CreatorLabel.Font = Enum.Font.Gotham
CreatorLabel.TextSize = 16
CreatorLabel.Parent = MainTab

local Decoration1 = Instance.new("Frame")
Decoration1.Name = "Decoration1"
Decoration1.Size = UDim2.new(1, 0, 0, 2)
Decoration1.Position = UDim2.new(0, 0, 0, 35)
Decoration1.BackgroundColor3 = ReiGrow.AccentColor
Decoration1.BorderSizePixel = 0
Decoration1.Parent = MainTab

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Name = "WelcomeLabel"
WelcomeLabel.Text = "Bem-vindo ao ReiGrow!"
WelcomeLabel.Size = UDim2.new(1, 0, 0, 50)
WelcomeLabel.Position = UDim2.new(0, 0, 0, 40)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.TextColor3 = ReiGrow.TextColor
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextSize = 18
WelcomeLabel.Parent = MainTab

local Decoration2 = Instance.new("ImageLabel")
Decoration2.Name = "Decoration2"
Decoration2.Size = UDim2.new(0, 100, 0, 100)
Decoration2.Position = UDim2.new(0.5, -50, 0.5, -50)
Decoration2.BackgroundTransparency = 1
Decoration2.Image = "rbxassetid://6065821980" -- ID de uma imagem de planta (substitua se necessário)
Decoration2.Parent = MainTab

-- Conteúdo da aba AFK
local AFKTab = Instance.new("Frame")
AFKTab.Name = "AFKTab"
AFKTab.Size = UDim2.new(1, 0, 1, 0)
AFKTab.BackgroundTransparency = 1
AFKTab.Visible = false
AFKTab.Parent = TabContent

local AutoJumpLabel = Instance.new("TextLabel")
AutoJumpLabel.Name = "AutoJumpLabel"
AutoJumpLabel.Text = "Auto Pulo:"
AutoJumpLabel.Size = UDim2.new(0.6, 0, 0, 30)
AutoJumpLabel.Position = UDim2.new(0, 0, 0, 20)
AutoJumpLabel.BackgroundTransparency = 1
AutoJumpLabel.TextColor3 = ReiGrow.TextColor
AutoJumpLabel.Font = Enum.Font.Gotham
AutoJumpLabel.TextSize = 16
AutoJumpLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoJumpLabel.Parent = AFKTab

local AutoJumpToggle = Instance.new("TextButton")
AutoJumpToggle.Name = "AutoJumpToggle"
AutoJumpToggle.Text = "OFF"
AutoJumpToggle.Size = UDim2.new(0.3, 0, 0, 30)
AutoJumpToggle.Position = UDim2.new(0.65, 0, 0, 20)
AutoJumpToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AutoJumpToggle.TextColor3 = ReiGrow.TextColor
AutoJumpToggle.Font = Enum.Font.GothamBold
AutoJumpToggle.TextSize = 14
AutoJumpToggle.BorderSizePixel = 0
AutoJumpToggle.Parent = AFKTab

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 4)
Corner2.Parent = AutoJumpToggle

local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Name = "DescriptionLabel"
DescriptionLabel.Text = "Ative para pular automaticamente e evitar desconexão por AFK."
DescriptionLabel.Size = UDim2.new(1, 0, 0, 50)
DescriptionLabel.Position = UDim2.new(0, 0, 0, 60)
DescriptionLabel.BackgroundTransparency = 1
DescriptionLabel.TextColor3 = ReiGrow.TextColor
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.TextSize = 14
DescriptionLabel.TextWrapped = true
DescriptionLabel.Parent = AFKTab

-- Lógica das abas
MainTabButton.MouseButton1Click:Connect(function()
    MainTab.Visible = true
    AFKTab.Visible = false
    MainTabButton.BackgroundColor3 = ReiGrow.AccentColor
    AFKTabButton.BackgroundColor3 = ReiGrow.MainColor
end)

AFKTabButton.MouseButton1Click:Connect(function()
    MainTab.Visible = false
    AFKTab.Visible = true
    MainTabButton.BackgroundColor3 = ReiGrow.MainColor
    AFKTabButton.BackgroundColor3 = ReiGrow.AccentColor
end)

-- Função de Auto Pulo
local autoJumpEnabled = false
local jumpCooldown = false

local function jump()
    if character:FindFirstChild("Humanoid") then
        character.Humanoid.Jump = true
    end
end

UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Space and not gameProcessed then
        jumpCooldown = true
        wait(0.5)
        jumpCooldown = false
    end
end)

AutoJumpToggle.MouseButton1Click:Connect(function()
    autoJumpEnabled = not autoJumpEnabled
    
    if autoJumpEnabled then
        AutoJumpToggle.Text = "ON"
        AutoJumpToggle.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        
        -- Loop de pulo automático
        spawn(function()
            while autoJumpEnabled do
                if not jumpCooldown then
                    jump()
                end
                wait(1.5) -- Intervalo entre pulos
            end
        end)
    else
        AutoJumpToggle.Text = "OFF"
        AutoJumpToggle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

-- Atualizar referência do personagem quando morrer
player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

-- Configuração inicial
MainTabButton.BackgroundColor3 = ReiGrow.AccentColor
