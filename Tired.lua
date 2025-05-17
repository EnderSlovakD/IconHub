local player = game.Players.LocalPlayer
local hrp = player.Character.HumanoidRootPart

local flySpeed = 50

game:GetService("RunService").RenderStepped:Connect(function()
    hrp.Velocity = Vector3.new(0, flySpeed, 0) -- drží hráča vo vzduchu
end)
