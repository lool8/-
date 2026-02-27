local character = game.Players.LocalPlayer.Character
local hrp = character.HumanoidRootPart
local speed = 6

local target1 = CFrame.new(3.83, 517.48, 165.80)
local target2 = CFrame.new(-3.16, 517.48, 428.53)

local function smoothTeleport(target)
    local start = hrp.CFrame
    local startTime = tick()
    
    repeat
        local elapsed = tick() - startTime
        local alpha = math.min(elapsed / speed, 1)
        hrp.CFrame = start:Lerp(target, alpha)
        game:GetService("RunService").Heartbeat:Wait()
    until alpha >= 1
end

smoothTeleport(target1)
smoothTeleport(target2)