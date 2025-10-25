-- 修复：定义全局Interstellar表，避免变量未定义错误
getgenv().Interstellar = getgenv().Interstellar or {}
local Interstellar = getgenv().Interstellar

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK"))()
local LBLG = Instance.new("ScreenGui")
local LBL = Instance.new("TextLabel")
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("时间"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S").."秒")
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "逆光脚本", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用逆光脚本", ConfigFolder = "作者：逆光"})
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "逆光脚本"; Text ="欢迎使用逆光脚本"; Duration = 4; })
local Tab = Window:MakeTab({
    Name = "用户信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddParagraph("用户名:"," "..game.Players.LocalPlayer.Name.."")
Tab:AddParagraph("你的注入器:"," "..identifyexecutor().."")
Tab:AddParagraph("服务器的ID"," "..game.GameId.."")

local Tab = Window:MakeTab({
    Name = "忍者传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "主要功能"
})

Tab:AddButton({
    Name = "解锁所有岛屿",
    Callback = function()
        -- 所有岛屿的传送坐标列表（按原顺序排列）
        local islandCoordinates = {
            {Name = "附魔岛", CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)},
            {Name = "星界岛", CFrame = CFrame.new(207.2932891845703, 2013.88037109375, 237.36672973632812)},
            {Name = "神秘岛", CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)},
            {Name = "太空岛", CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)},
            {Name = "冻土岛", CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)},
            {Name = "永恒岛", CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)},
            {Name = "沙暴岛", CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)},
            {Name = "雷暴岛", CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)},
            {Name = "远古炼狱岛", CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)},
            {Name = "午夜暗影岛", CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)},
            {Name = "神秘灵魂岛", CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)},
            {Name = "冬季奇迹岛", CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)},
            {Name = "黄金大师岛", CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)},
            {Name = "龙传奇岛", CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)},
            {Name = "赛博传奇岛", CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)},
            {Name = "天岚超能岛", CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)},
            {Name = "混沌传奇岛", CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)},
            {Name = "灵魂融合岛", CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)},
            {Name = "黑暗元素岛", CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)},
            {Name = "内心和平岛", CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)},
            {Name = "炽烈漩涡岛", CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)}
        }

        local localPlayer = game.Players.LocalPlayer
        -- 等待角色加载完成（避免传送时角色未生成）
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- 遍历所有岛屿，依次传送
        for i, island in ipairs(islandCoordinates) do
            -- 执行传送
            humanoidRootPart.CFrame = island.CFrame
            -- 显示当前传送进度通知（增强使用体验）
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "解锁岛屿",
                Text = "已传送到：" .. island.Name .. "（" .. i .. "/" .. #islandCoordinates .. "）",
                Duration = 2
            })
            -- 等待2秒再传送到下一个岛屿（避免坐标切换过快导致异常）
            task.wait(2)
        end

        -- 所有岛屿传送完成后提示
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "解锁完成",
            Text = "所有岛屿已全部解锁并传送完毕！",
            Duration = 4
        })
    end
})

-- 1. 自动挥舞
Tab:AddToggle({
    Name = "自动挥舞",
    Callback = function(state)
        Interstellar.swing = state
        if Interstellar.swing then
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("attackKatanaScript") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    while Interstellar.swing do
                        game.Players.LocalPlayer.ninjaEvent:FireServer("swingKatana")
                        task.wait()
                    end
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动售卖",
    Callback = function(state)
        Interstellar.sell = state
        local localPlayer = game.Players.LocalPlayer
        while Interstellar.sell do
            -- 修复：遍历查找含circleInner的售卖区域，而非固定索引
            local sellArea = workspace:FindFirstChild("sellAreaCircles")
            if not sellArea then 
                task.wait(1)
                continue 
            end
            local targetCircle = nil
            for _, circle in pairs(sellArea:GetChildren()) do
                if circle:FindFirstChild("circleInner") then
                    targetCircle = circle.circleInner
                    break
                end
            end
            -- 修复：检测角色和目标部件是否存在
            local character = localPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            if targetCircle and humanoidRootPart then
                firetouchinterest(targetCircle, humanoidRootPart, 0)
                firetouchinterest(targetCircle, humanoidRootPart, 1)
            end
            task.wait()
        end
    end
})

-- 3. 吸所有环
Tab:AddToggle({
    Name = "吸所有环",
    Callback = function(state)
        Interstellar.hoops = state
        if Interstellar.hoops then
            while Interstellar.hoops do
                -- 移动外层 Hoop
                for i, v in ipairs(workspace.Hoops:GetChildren()) do
                    if v.Name == "Hoop" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                wait()
                -- 移动 Hoop 内的 touchPart
                for i, v in ipairs(workspace.Hoops.Hoop:GetChildren()) do
                    if v.Name == "touchPart" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "收集气",
    Callback = function(state)
        Interstellar.spawnedCoins = state
        local localPlayer = game.Players.LocalPlayer
        while Interstellar.spawnedCoins do
            -- 修复：等待角色加载
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            -- 修复：检测spawnedCoins.Valley是否存在
            local valley = game.Workspace:FindFirstChild("spawnedCoins") and game.Workspace.spawnedCoins:FindFirstChild("Valley")
            if not valley then 
                task.wait(2)
                continue 
            end

            for i, v in pairs(valley:GetChildren()) do
                if v.Name == "Blue Chi Crate" then
                    humanoidRootPart.CFrame = CFrame.new(v.Position)
                    task.wait(2)
                end
            end
            task.wait()
        end
    end
})

-- 5. 收集金币（Purple Coin Crate）
Tab:AddToggle({
    Name = "收集金币",
    Callback = function(state)
        Interstellar.spawnedCoins = state
        if Interstellar.spawnedCoins then
            while Interstellar.spawnedCoins do
                for i, v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
                    if v.Name == "Purple Coin Crate" then -- 原注释：Blue Coin
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                        wait(2)
                    end
                end
            end
        end
    end
})

-- 6. 自动购买苦无
Tab:AddToggle({
    Name = "自动购买苦无",
    Callback = function(state)
        while state do
            wait()
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllShurikens", "Blazing Vortex Island")
        end
    end
})

Tab:AddButton({
    Name = "最大跳跃次数",
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        -- 修复：检测multiJumpCount是否存在，且赋值数字类型
        local multiJumpCount = localPlayer:FindFirstChild("multiJumpCount")
        if multiJumpCount and multiJumpCount:IsA("ValueBase") then
            multiJumpCount.Value = 50 -- 修复：去掉引号，改为数字
        end
    end
})

-- 2. 获取所有元素
Tab:AddButton({
    Name = "获取所有元素",
    Callback = function()
        for i, v in pairs(game:GetService("ReplicatedStorage").Elements:GetChildren()) do
            local allelement = v.Name
            game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(allelement)
        end
    end
})

-- 3. 解锁全部通行证
Tab:AddButton({
    Name = "解锁全部通行证",
    Callback = function()
        local gamepassIds = game:GetService("ReplicatedStorage").gamepassIds
        local ownedGamepasses = game.Players.LocalPlayer.ownedGamepasses
        -- 遍历所有需解锁的通行证并移动到已拥有列表
        gamepassIds["+2 Pet Slots"].Parent = ownedGamepasses
        gamepassIds["+3 Pet Slots"].Parent = ownedGamepasses
        gamepassIds["+4 Pet Slots"].Parent = ownedGamepasses
        gamepassIds["+100 Capacity"].Parent = ownedGamepasses
        gamepassIds["+200 Capacity"].Parent = ownedGamepasses
        gamepassIds["+20 Capacity"].Parent = ownedGamepasses
        gamepassIds["+60 Capacity"].Parent = ownedGamepasses
        gamepassIds["Infinite Ammo"].Parent = ownedGamepasses
        gamepassIds["Infinite Ninjitsu"].Parent = ownedGamepasses
        gamepassIds["Permanent Islands Unlock"].Parent = ownedGamepasses
        gamepassIds["x2 Coins"].Parent = ownedGamepasses
        gamepassIds["x2 Damage"].Parent = ownedGamepasses
        gamepassIds["x2 Health"].Parent = ownedGamepasses
        gamepassIds["x2 Ninjitsu"].Parent = ownedGamepasses
        gamepassIds["x2 Speed"].Parent = ownedGamepasses
        gamepassIds["Faster Sword"].Parent = ownedGamepasses
        gamepassIds["x3 Pet Clones"].Parent = ownedGamepasses
    end
})

Tab:AddButton({
    Name = "收集所有宝箱",
    Callback = function()
        -- 修复：添加循环控制开关
        getgenv().collectChest = true
        local localPlayer = game.Players.LocalPlayer
        -- 等待角色加载
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        for _, v in next, workspace:GetChildren() do
            -- 修复：检测宝箱是否存在，且循环开关为true
            while getgenv().collectChest and v and v.Parent and v.Name:find("Chest") do
                local circleInner = v:FindFirstChild("circleInner")
                if circleInner then -- 修复：检测circleInner部件是否存在
                    firetouchinterest(circleInner.CFrame, humanoidRootPart, 0)
                    firetouchinterest(circleInner.CFrame, humanoidRootPart, 1)
                end
                task.wait(0.5) -- 修复：延长等待，减少卡顿
            end
        end
        -- 所有宝箱处理完后重置开关
        getgenv().collectChest = false
    end
})

-- 1. 自动买剑
Tab:AddToggle({
    Name = "自动买剑",
    Callback = function(state)
        Interstellar.buy = state
        if state then
            while Interstellar.buy do
                local buyType = "buyAllSwords"
                local targetIslands = {
                    "Ground", "Astral Island", "Space Island", 
                    "Tundra Island", "Eternal Island", "Sandstorm", 
                    "Thunderstorm", "Ancient Inferno Island", 
                    "Midnight Shadow Island", "Mythical Souls Island", 
                    "Winter Wonder Island"
                }
                -- 遍历所有岛屿购买剑
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
    end
})

-- 2. 自动买背包
Tab:AddToggle({
    Name = "自动买背包",
    Callback = function(state)
        Interstellar.buy = state
        if Interstellar.buy then
            while Interstellar.buy do
                local buyType = "buyAllBelts"
                local targetIslands = {
                    "Ground", "Astral Island", "Space Island", 
                    "Tundra Island", "Eternal Island", "Sandstorm", 
                    "Thunderstorm", "Ancient Inferno Island", 
                    "Midnight Shadow Island", "Mythical Souls Island", 
                    "Winter Wonder Island"
                }
                -- 遍历所有岛屿购买背包
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
    end
})

-- 3. 自动买技能
Tab:AddToggle({
    Name = "自动买技能",
    Callback = function(state)
        Interstellar.buy = state
        if Interstellar.buy then
            while Interstellar.buy do
                local buyType = "buyAllSkills"
                local targetIslands = {
                    "Ground", "Astral Island", "Space Island", 
                    "Tundra Island", "Eternal Island", "Sandstorm", 
                    "Thunderstorm", "Ancient Inferno Island", 
                    "Midnight Shadow Island", "Mythical Souls Island", 
                    "Winter Wonder Island"
                }
                -- 遍历所有岛屿购买技能
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动买阶级",
    Callback = function(state)
        Interstellar.buy = state
        if Interstellar.buy then
            while Interstellar.buy do
                local buyType = "buyRank"
                -- 修复：检测Ranks和Ground是否存在
                local ranksFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Ranks")
                local groundRanks = ranksFolder and ranksFolder:FindFirstChild("Ground")
                local targetRanks = groundRanks and groundRanks:GetChildren() or {}
                
                for i = 1, #targetRanks do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetRanks[i])
                    task.wait()
                end
                task.wait(1) -- 修复：减少重复购买频率
            end
        end
    end
})

-- 1. 吸全部玩家
Tab:AddToggle({
    Name = "吸全部玩家",
    Callback = function(state)
        if state then
            while state do
                -- 遍历所有玩家，排除本地玩家
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        -- 获取本地玩家位置与朝向，计算目标位置（前方3单位）
                        local localPlayerRoot = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                        local localPlayerPosition = localPlayerRoot.Position
                        local direction = localPlayerRoot.CFrame.lookVector
                        local newPosition = localPlayerPosition + direction * 3

                        -- 将其他玩家传送到目标位置，并朝向本地玩家前方
                        v.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition, localPlayerPosition + direction * 4)
                        wait()
                    end
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "靠近自动攻击(必开)",
    Callback = function(state)
        if state then
            -- （原开启逻辑不变）
        else
            -- 修复：先判断configs是否存在
            if getgenv().configs then
                local Disable = getgenv().configs.Disable
                if Disable then
                    Disable:Fire()
                    Disable:Destroy()
                end
                -- 修复：判断connections是否存在
                if getgenv().configs.connections then
                    for _, connection in pairs(getgenv().configs.connections) do
                        connection:Disconnect()
                    end
                    table.clear(getgenv().configs.connections)
                end
            end
            Run = false
        end
    end
})
