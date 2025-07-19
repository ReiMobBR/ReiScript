-- Script Local em StarterGui
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Criar GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "MenuFantasma"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local btnFantasma = Instance.new("TextButton", frame)
btnFantasma.Size = UDim2.new(0, 200, 0, 50)
btnFantasma.Position = UDim2.new(0.5, -100, 0.5, -25)
btnFantasma.Text = "Modo Fantasma"
btnFantasma.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
btnFantasma.TextColor3 = Color3.new(1, 1, 1)

-- Função de atravessar paredes
btnFantasma.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false -- desativa colisão
        end
    end
    print("Modo fantasma ativado!")
end)
