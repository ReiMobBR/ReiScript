local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Interface principal
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ReiPulo"

-- Criação das abas
local tabFrame = Instance.new("Frame", screenGui)
tabFrame.Size = UDim2.new(0, 300, 0, 200)
tabFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
tabFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Botões de troca de abas
local mainTabButton = Instance.new("TextButton", tabFrame)
mainTabButton.Size = UDim2.new(0, 100, 0, 30)
mainTabButton.Position = UDim2.new(0, 0, 0, 0)
mainTabButton.Text = "Main"

local afkTabButton = Instance.new("TextButton", tabFrame)
afkTabButton.Size = UDim2.new(0, 100, 0, 30)
afkTabButton.Position = UDim2.new(0, 100, 0, 0)
afkTabButton.Text = "AFK"

-- Aba Main
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

-- Aba AFK
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

    while autoJumpEnabled do
        wait(2)
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
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
