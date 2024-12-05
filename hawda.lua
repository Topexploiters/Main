local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function findNearestPlayer()
    local nearestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            local targetCharacter = player.Character
            if targetCharacter then
                local distance = (character.HumanoidRootPart.Position - targetCharacter.HumanoidRootPart.Position).magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestPlayer = targetCharacter
                end
            end
        end
    end
    return nearestPlayer
end

local function walkToNearestPlayer()
    local target = findNearestPlayer()
    if target then
        humanoid:MoveTo(target.HumanoidRootPart.Position)
    else
        print("No other players found.")
    end
end

while wait(.1) do
    walkToNearestPlayer()
end
