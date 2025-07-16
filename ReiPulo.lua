local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Principal
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "TabbedMenu"

-- Menu de abas
local tabFrame = Instance.new("Frame", screenGui)
tabFrame.Size = UDim2.new(0, 300, 0, 200)
tabFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
tabFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
tabFrame.Visible = true

-- Botões das abas
local mainTabButton = Instance.new("TextButton", tabFrame)
mainTabButton.Size = UDim2.new(0, 100, 0, 30)
mainTabButton.Position = UDim2.new(0, 0, 0, 0)
mainTabButton.Text = "Main"

local afkTabButton = Instance.new("TextButton", tabFrame)
afkTabButton.Size = UDim2.new(0, 100, 0, 30)
afkTabButton.Position = UDim2.new(0, 100, 0, 0)
afkTabButton.Text = "AFK"

-- Conteúdo aba Main
local mainTab = Instance.new("Frame", tabFrame)
mainTab.Size = UDim2.new(1, 0, 1, -30)
mainTab.Position = UDim2.new(0, 0, 0, 30)
mainTab.Visible = true

local creatorLabel = Instance.new("TextLabel", mainTab)
creatorLabel.Size = UDim2.new(1, 0, 0, 50)
creatorLabel.Position = UDim2.new(0, 0, 0, 0)
creatorLabel.Text = "Criador: ReiMobBR"
creatorLabel.BackgroundTransparency = 1
creatorLabel.TextScaled = true
creatorLabel.TextColor3 = Color3.new(1, 1, 1)

-- Conteúdo aba AFK
local afkTab = Instance.new("Frame", tabFrame)
afkTab.Size = UDim2.new(1, 0, 1, -30)
afkTab.Position = UDim2.new(0, 0, 0, 30)
afkTab.Visible = false

local toggleButton = Instance.new("TextButton", afkTab)
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
toggleButton.Text = "Auto Pulo: OFF"

local autoJumpEnabled = false

toggleButton.MouseButton1Click:Connect(function()
    autoJumpEnabled = not autoJumpEnabled
    toggleButton.Text = "Auto Pulo: " .. (autoJumpEnabled and "ON" or "OFF")

    spawn(function()
        while autoJumpEnabled do
            wait(2)
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end)

-- Alternância entre abas
mainTabButton.MouseButton1Click:Connect(function()
    mainTab.Visible = true
    afkTab.Visible = false
end)

afkTabButton.MouseButton1Click:Connect(function()
    mainTab.Visible = false
    afkTab.Visible = true
end)

-- Botão para abrir/fechar menu
local toggleMenuButton = Instance.new("ImageButton", screenGui)
toggleMenuButton.Size = UDim2.new(0, 40, 0, 40)
toggleMenuButton.Position = UDim2.new(0, 10, 0, 10)
toggleMenuButton.BackgroundTransparency = 1
toggleMenuButton.Image = "rbxassetid://6031094678" -- Ícone de menu

local menuVisible = true

toggleMenuButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    tabFrame.Visible = menuVisible
    toggleMenuButton.Image = menuVisible and "rbxassetid://6031094678" or "rbxassetid://6031094697" -- Menu ou X
end)
