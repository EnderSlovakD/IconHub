local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local jumpCooldown = false
local jumpDelay = 0.3 -- čas medzi skokmi

local function isNearWall()
    local rayOrigin = rootPart.Position
    local rayDirection = rootPart.CFrame.LookVector * 3 -- 3 studs dopredu

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

    if raycastResult and raycastResult.Instance then
        return true
    else
        return false
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.Space then -- keď stlačíš skok
        if isNearWall() and not jumpCooldown then
            humanoid.Jump = true
            jumpCooldown = true
            wait(jumpDelay)
            jumpCooldown = false
        end
    end
end)
