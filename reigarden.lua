-- Função para criar abas reutilizáveis
local function createTab(name, index, gui)
    local button = Instance.new("TextButton", gui)
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new(0, index * 100, 0, 0)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.FredokaOne
    button.TextScaled = true

    local tabFrame = Instance.new("Frame", gui)
    tabFrame.Size = UDim2.new(1, 0, 1, -30)
    tabFrame.Position = UDim2.new(0, 0, 0, 30)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = index == 0

    button.MouseButton1Click:Connect(function()
        for _, tab in pairs(gui:GetChildren()) do
            if tab:IsA("Frame") and tab ~= tabFrame then
                tab.Visible = false
            end
        end
        tabFrame.Visible = true
    end)

    return tabFrame
end

-- Criação da aba Farm
local farmTab = createTab("Farm", 2, mainFrame)

-- Título
local farmTitle = Instance.new("TextLabel", farmTab)
farmTitle.Size = UDim2.new(1, 0, 0, 30)
farmTitle.Position = UDim2.new(0, 0, 0, 0)
farmTitle.Text = "🌱 Loja de Sementes"
farmTitle.TextColor3 = Color3.new(1, 1, 1)
farmTitle.Font = Enum.Font.FredokaOne
farmTitle.TextScaled = true
farmTitle.BackgroundTransparency = 1

-- Lista de sementes (simulação)
local seeds = {"Cenoura", "Tomate", "Milho", "Morango", "Girassol"}
for i, seedName in ipairs(seeds) do
    local item = Instance.new("TextLabel", farmTab)
    item.Size = UDim2.new(1, -20, 0, 20)
    item.Position = UDim2.new(0, 10, 0, 30 + (i - 1) * 25)
    item.Text = "- " .. seedName
    item.TextColor3 = Color3.fromRGB(240, 240, 240)
    item.Font = Enum.Font.FredokaOne
    item.TextScaled = true
    item.BackgroundTransparency = 1
end

-- Botão de ativação de auto compra de sementes
local autoBuySeeds = false
local seedButton = Instance.new("TextButton", farmTab)
seedButton.Size = UDim2.new(0, 250, 0, 40)
seedButton.Position = UDim2.new(0.5, -125, 0, 180)
seedButton.Text = "Comprar Sementes [OFF]"
seedButton.BackgroundColor3 = Color3.fromRGB(100, 160, 100)
seedButton.TextColor3 = Color3.new(1, 1, 1)
seedButton.Font = Enum.Font.FredokaOne
seedButton.TextScaled = true

local seedCorner = Instance.new("UICorner", seedButton)
seedCorner.CornerRadius = UDim.new(0, 12)

seedButton.MouseButton1Click:Connect(function()
    autoBuySeeds = not autoBuySeeds
    seedButton.Text = "Comprar Sementes [" .. (autoBuySeeds and "ON" or "OFF") .. "]"
end)

-- Botões adicionais para Gear e Pet
local autoBuyGear = false
local gearButton = seedButton:Clone()
gearButton.Parent = farmTab
gearButton.Position = UDim2.new(0.5, -125, 0, 225)
gearButton.Text = "Comprar Gear [OFF]"

gearButton.MouseButton1Click:Connect(function()
    autoBuyGear = not autoBuyGear
    gearButton.Text = "Comprar Gear [" .. (autoBuyGear and "ON" or "OFF") .. "]"
end)

local autoBuyPet = false
local petButton = seedButton:Clone()
petButton.Parent = farmTab
petButton.Position = UDim2.new(0.5, -125, 0, 270)
petButton.Text = "Comprar Pet [OFF]"

petButton.MouseButton1Click:Connect(function()
    autoBuyPet = not autoBuyPet
    petButton.Text = "Comprar Pet [" .. (autoBuyPet and "ON" or "OFF") .. "]"
end)
