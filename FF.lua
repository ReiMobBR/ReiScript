-- Serverscript (deve ser colocado em um Script no ServerScriptService)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Criar RemoteEvents para comunicação cliente-servidor
local OpenMenuEvent = Instance.new("RemoteEvent")
OpenMenuEvent.Name = "OpenMenuEvent"
OpenMenuEvent.Parent = ReplicatedStorage

local CloseMenuEvent = Instance.new("RemoteEvent")
CloseMenuEvent.Name = "CloseMenuEvent"
CloseMenuEvent.Parent = ReplicatedStorage

local HighJumpEvent = Instance.new("RemoteEvent")
HighJumpEvent.Name = "HighJumpEvent"
HighJumpEvent.Parent = ReplicatedStorage

-- Função para fazer o player pular alto
local function activateHighJump(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            -- Aumentar a força do pulo temporariamente
            humanoid.JumpPower = 100 -- Pulo muito alto (valor normal é 50)
            
            -- Resetar após 5 segundos
            task.wait(5)
            humanoid.JumpPower = 50
        end
    end
end

-- Evento para pular alto
HighJumpEvent.OnServerEvent:Connect(function(player)
    activateHighJump(player)
end)

-- Função para criar o menu
local function createMenu(player)
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BrainrotMenu"
    screenGui.ResetOnSpawn = false
    
    -- Frame principal do menu
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 250) -- Aumentado para 250 de altura
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Título
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.Text = "ROUBE UM BRAINROT"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 20
    title.Parent = mainFrame
    
    -- Botão de fechar
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 100, 0, 40)
    closeButton.Position = UDim2.new(0.5, -50, 0.8, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    closeButton.Text = "FECHAR"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 16
    closeButton.Parent = mainFrame
    
    -- Conectar evento do botão de fechar
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        CloseMenuEvent:FireClient(player)
    end)
    
    -- Botão de ação (roubar brainrot)
    local stealButton = Instance.new("TextButton")
    stealButton.Size = UDim2.new(0, 150, 0, 40)
    stealButton.Position = UDim2.new(0.5, -75, 0.3, 0)
    stealButton.BackgroundColor3 = Color3.fromRGB(60, 150, 60)
    stealButton.Text = "ROUBAR BRAINROT"
    stealButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    stealButton.Font = Enum.Font.SourceSansBold
    stealButton.TextSize = 16
    stealButton.Parent = mainFrame
    
    -- Ação de roubar brainrot
    stealButton.MouseButton1Click:Connect(function()
        print(player.Name .. " roubou um brainrot!")
    end)
    
    -- Botão de pular alto
    local highJumpButton = Instance.new("TextButton")
    highJumpButton.Size = UDim2.new(0, 150, 0, 40)
    highJumpButton.Position = UDim2.new(0.5, -75, 0.55, 0)
    highJumpButton.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
    highJumpButton.Text = "PULAR ALTO"
    highJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    highJumpButton.Font = Enum.Font.SourceSansBold
    highJumpButton.TextSize = 16
    highJumpButton.Parent = mainFrame
    
    -- Ação de pular alto
    highJumpButton.MouseButton1Click:Connect(function()
        HighJumpEvent:FireServer()
    end)
    
    screenGui.Parent = playerGui
    return screenGui
end

-- Evento para abrir menu
OpenMenuEvent.OnServerEvent:Connect(function(player)
    local playerGui = player:WaitForChild("PlayerGui")
    local existingMenu = playerGui:FindFirstChild("BrainrotMenu")
    
    if existingMenu then
        existingMenu:Destroy()
    end
    
    createMenu(player)
end)

-- Evento para fechar menu
CloseMenuEvent.OnServerEvent:Connect(function(player)
    local playerGui = player:WaitForChild("PlayerGui")
    local existingMenu = playerGui:FindFirstChild("BrainrotMenu")
    
    if existingMenu then
        existingMenu:Destroy()
    end
end)

print("Sistema Brainrot carregado!")
