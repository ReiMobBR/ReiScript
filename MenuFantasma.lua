-- Script Local em StarterGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Criar a interface
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuFantasma"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = screenGui

local btnFantasma = Instance.new("TextButton")
btnFantasma.Size = UDim2.new(0, 200, 0, 50)
btnFantasma.Position = UDim2.new(0.5, -100, 0.5, -25)
btnFantasma.Text = "Modo Fantasma"
btnFantasma.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
btnFantasma.TextColor3 = Color3.new(1, 1, 1)
btnFantasma.Font = Enum.Font.Fantasy
btnFantasma.TextSize = 24
btnFantasma.Parent = frame

-- Função que ativa o modo fantasma
btnFantasma.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()

    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Transforma o estado físico para evitar empurrões
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)

        -- Ativa estado fantasmal temporário
        humanoid.PlatformStand = true
        print("Modo Fantasma ativado!")
        wait(2) -- tempo ativo
        humanoid.PlatformStand = false
        print("Modo Fantasma desativado!")
    end
end)
