-- Interface do usuário
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ReiGarden 1.0"

-- Frame principal
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Active = true
mainFrame.Draggable = true

-- Abas
local tabButtons = {}
local tabs = {}

local function createTab(name, index)
    local button = Instance.new("TextButton", mainFrame)
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new(0, index * 100, 0, 0)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1, 1, 1)

    local frame = Instance.new("Frame", mainFrame)
    frame.Size = UDim2.new(1, 0, 1, -30)
    frame.Position = UDim2.new(0, 0, 0, 30)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Visible = index == 0

    button.MouseButton1Click:Connect(function()
        for i, f in pairs(tabs) do
            f.Visible = false
        end
        frame.Visible = true
    end)

    tabButtons[name] = button
    tabs[name] = frame
end

-- Aba Main
createTab("Main", 0)
local label = Instance.new("TextLabel", tabs["Main"])
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "Criador: ReiMobBR"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Font = Enum.Font.SourceSansBold
label.TextScaled = true

-- Aba AFK com auto pulo
createTab("AFK", 1)
local jumping = false

local afkButton = Instance.new("TextButton", tabs["AFK"])
afkButton.Size = UDim2.new(0, 200, 0, 50)
afkButton.Position = UDim2.new(0.5, -100, 0.5, -25)
afkButton.Text = "Ativar Auto Pulo"
afkButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
afkButton.TextColor3 = Color3.new(1, 1, 1)
afkButton.Font = Enum.Font.SourceSansBold
afkButton.TextScaled = true

-- Função de auto pulo
task.spawn(function()
    while true do
        if jumping then
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(2)
    end
end)

afkButton.MouseButton1Click:Connect(function()
    jumping = not jumping
    afkButton.Text = jumping and "Desativar Auto Pulo" or "Ativar Auto Pulo"
end)
