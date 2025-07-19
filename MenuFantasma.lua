local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Interface
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PainelPoderes"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Botão modo fantasma
local btnFantasma = Instance.new("TextButton", frame)
btnFantasma.Size = UDim2.new(0, 180, 0, 40)
btnFantasma.Position = UDim2.new(0, 10, 0, 10)
btnFantasma.Text = "Toggle Fantasma"
btnFantasma.BackgroundColor3 = Color3.fromRGB(150, 0, 255)

-- Botão voo
local btnVoo = Instance.new("TextButton", frame)
btnVoo.Size = UDim2.new(0, 180, 0, 40)
btnVoo.Position = UDim2.new(0, 10, 0, 60)
btnVoo.Text = "Toggle Voo"
btnVoo.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

-- Botão speed
local btnSpeed = Instance.new("TextButton", frame)
btnSpeed.Size = UDim2.new(0, 180, 0, 40)
btnSpeed.Position = UDim2.new(0, 10, 0, 110)
btnSpeed.Text = "Toggle Speed"
btnSpeed.BackgroundColor3 = Color3.fromRGB(0, 255, 100)

-- Botão super pulo
local btnJump = Instance.new("TextButton", frame)
btnJump.Size = UDim2.new(0, 180, 0, 40)
btnJump.Position = UDim2.new(0, 10, 0, 160)
btnJump.Text = "Toggle Super Pulo"
btnJump.BackgroundColor3 = Color3.fromRGB(255, 170, 0)

-- Flags
local fantasmaAtivo = false
local vooAtivo = false
local speedAtivo = false
local jumpAtivo = false

-- Função fantasma
btnFantasma.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    fantasmaAtivo = not fantasmaAtivo

    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not fantasmaAtivo
        end
    end

    print(fantasmaAtivo and "Modo Fantasma ativado" or "Modo Fantasma desativado")
end)

-- Função voo
btnVoo.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    vooAtivo = not vooAtivo
    if vooAtivo then
        local fly = Instance.new("BodyVelocity", humanoidRootPart)
        fly.Name = "FlyForce"
        fly.Velocity = Vector3.new(0, 50, 0)
        fly.MaxForce = Vector3.new(0, math.huge, 0)
    else
        local flyForce = humanoidRootPart:FindFirstChild("FlyForce")
        if flyForce then flyForce:Destroy() end
    end
    print(vooAtivo and "Voo ativado" or "Voo desativado")
end)

-- Função speed
btnSpeed.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    speedAtivo = not speedAtivo
    humanoid.WalkSpeed = speedAtivo and 100 or 16
    print(speedAtivo and "Speed ativado" or "Speed desativado")
end)

-- Função super pulo
btnJump.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    jumpAtivo = not jumpAtivo
    humanoid.JumpPower = jumpAtivo and 150 or 50
    print(jumpAtivo and "Super Pulo ativado" or "Super Pulo desativado")
end)
