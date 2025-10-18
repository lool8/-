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
    Name = "玩家",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "自定义范围",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        -- 断开旧的事件连接，避免重复执行
        if _G.HeadSizeConnection then
            _G.HeadSizeConnection:Disconnect()
        end
        
        -- 转换输入为数字，非数字则提示并退出
        local size = tonumber(Value)
        if not size then
            warn("请输入")  -- 可替换为通知函数
            return
        end
        _G.HeadSize = size
        _G.Disabled = true  -- 保持开启状态（可按需添加开关控制）
        
        -- 重新连接事件，执行修改逻辑
        _G.HeadSizeConnection = game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Disabled then
                for _, v in ipairs(game:GetService('Players'):GetPlayers()) do
                    if v ~= game:GetService('Players').LocalPlayer then  -- 简化判断
                        pcall(function()
                            local root = v.Character:FindFirstChild("HumanoidRootPart")
                            if root then  -- 检查部件是否存在，避免错误
                                root.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                                root.Transparency = 0.7
                                root.BrickColor = BrickColor.new("Really red")
                                root.Material = "Neon"
                                root.CanCollide = false
                            end
                        end)
                    end
                end
            end
        end)
    end
})

Tab:AddTextbox({
  Name = "移动速度",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})

Tab:AddTextbox({
    Name = "跳跃高度",
    Default = "50",
    TextDisappear = true,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        -- 转换为数字，默认50，限制1-200范围
        local jumpPower = tonumber(Value) or 50
        jumpPower = math.clamp(jumpPower, 1, 200)
        humanoid.JumpPower = jumpPower
    end
})

Tab:AddTextbox({
  Name = "重力",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Workspace.Gravity = Value
  end
})

Tab:AddToggle({
    Name ="夜视",
    Callback = function(AR)
        if AR then
            game.Lighting.Ambient = Color3.new(1, 1, 1) -- 夜视开启：高亮环境光
        else
            game.Lighting.Ambient = Color3.new(0.3, 0.3, 0.3) -- 夜视关闭：恢复默认
        end
    end
})

Tab:AddButton({
    Name ="逆光飞行",
    Callback = function()
    local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "上"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "下"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "飞行"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "逆光飞行"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "关闭"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "隐藏"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "逆光脚本";
	Text = "欢迎使用逆光飞行 谢谢🙏";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, 
		Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
    end
})

Tab:AddButton({
    Name ="无限跳",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

Tab:AddButton({
    Name ="控制玩家",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end
})

Tab:AddButton({
    Name ="透视",
    Callback = function()
    local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
    end
})

Tab:AddButton({
    Name ="玩家提示",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

Tab:AddButton({
    Name ="撸管r15",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

Tab:AddButton({
    Name ="撸管r6",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

local Tab = Window:MakeTab({
    Name = "通用",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name ="铁拳",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

Tab:AddButton({
    Name ="动画中心",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end
})

Tab:AddButton({
    Name ="甩人",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

Tab:AddButton({
    Name ="上墙",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

Tab:AddButton({
    Name ="死亡笔记",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/dfhj/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.txt"))()
    end
})

Tab:AddButton({
    Name ="飞车〖坐在载具上可以连同载具一起飞〗",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/63T0fkBm"))()
    end
})

Tab:AddButton({
    Name ="无敌",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
    end
})

Tab:AddButton({
    Name ="隐身",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
    end
})

Tab:AddButton({
    Name ="旋转",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

Tab:AddButton({
    Name ="工具",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
    end
})

Tab:AddButton({
    Name ="艹人",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/bzmhRgKL"))();
    end
})

Tab:AddButton({
    Name ="义勇军进行曲",
    Callback = function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end
})

Tab:AddButton({
    Name ="指令",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

Tab:AddButton({
    Name ="键盘",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

Tab:AddButton({
    Name ="点击传送工具",
    Callback = function()
    mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

Tab:AddButton({
    Name ="透视",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

Tab:AddButton({
    Name ="穿墙",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
    end
})

Tab:AddButton({
    Name ="fps显示",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
    end
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "主要"
})

-- 在脚本开头定义全局连接变量
local autoPunchConnection = nil

Tab:AddToggle({
    Name = "自动挥拳",
    Callback = function(Value)
        autopunch = Value
        
        -- 清理旧连接
        if autoPunchConnection then
            autoPunchConnection:Disconnect()
            autoPunchConnection = nil
        end
        
        if not autopunch then return end
        
        -- 新连接事件
        autoPunchConnection = game:GetService("RunService").Stepped:Connect(
            function()
                pcall(
                    function()
                        if not autopunch then return end -- 二次判断，避免延迟关闭
                        local player = game.Players.LocalPlayer
                        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
                        if not humanoid then return end
                        
                        humanoid:ChangeState(11)
                        if player:FindFirstChild("muscleEvent") then
                            player.muscleEvent:FireServer("punch", "leftHand")
                            player.muscleEvent:FireServer("punch", "rightHand")
                        end
                        
                        local punchTool = player.Backpack:FindFirstChild("Punch")
                        if punchTool then
                            humanoid:EquipTool(punchTool)
                        end
                    end
                )
            end
        )
    end
})

Tab:AddToggle({
    Name = "挥拳无间隔",
    Callback = function(Value)
        local LocalPlayer = getgenv().LocalPlayer or game.Players.LocalPlayer
        local punchTool = LocalPlayer.Backpack:FindFirstChild("Punch")
            or LocalPlayer.Character:FindFirstChild("Punch")
        if not punchTool then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "设置失败",
                Text = "未找到Punch工具，请装备后重试",
                Duration = 2
            })
            return
        end
        
        local cooldownValue = punchTool:FindFirstChildOfClass("NumberValue")
        if not cooldownValue then
            -- 若工具无冷却值，自动创建（避免报错）
            cooldownValue = Instance.new("NumberValue")
            cooldownValue.Name = "Cooldown"
            cooldownValue.Parent = punchTool
        end
        
        -- 定义默认冷却时间（2秒，可根据游戏调整）
        local defaultCooldown = 2
        if Value then
            cooldownValue.Value = 0 -- 开启无间隔：冷却设为0
        else
            cooldownValue.Value = defaultCooldown -- 关闭：恢复默认冷却
        end
    end
})

Tab:AddToggle({
    Name = "自动刷业报",
    Callback = function(Value)
        getgenv().autoBrushKarma = Value -- 使用全局环境变量，避免变量污染
        if Value then
            spawn(function() -- 单独开线程，避免阻塞UI
                while getgenv().autoBrushKarma do
                    wait(0.5) -- 延长间隔，减少性能消耗
                    local players = Players:GetPlayers()
                    local targetPlayers = {}
                    
                    -- 筛选非本地玩家且角色存在的目标
                    for _, p in ipairs(players) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("HumanoidRootPart") then
                            table.insert(targetPlayers, p)
                        end
                    end
                    
                    if #targetPlayers == 0 then continue end
                    local randomPlayer = targetPlayers[math.random(1, #targetPlayers)]
                    local localChar = LocalPlayer.Character
                    
                    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then continue end
                    
                    -- 传送至目标玩家前方10单位位置，避免重叠
                    local targetRoot = randomPlayer.Character.HumanoidRootPart
                    local teleportPos = targetRoot.CFrame * CFrame.new(0, 0, -10)
                    localChar.HumanoidRootPart.CFrame = teleportPos
                end
            end)
        end
    end
})

local Section = Tab:AddSection({
	Name = "锻炼类"
})

-- 自动打石头0（无耐久要求）
Tab:AddToggle({
    Name = "自动打石头0",
    Callback = function(rock)
        getgenv().rock = rock
        while getgenv().rock do
            wait()
            -- 装备Punch工具
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.Name == "Punch" then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                end
            end
            -- 激活Punch工具
            for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if h:IsA("Tool") and h.Name == "Punch" then
                    h:Activate()
                end
            end
            -- 传送至目标位置
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159)
        end
        -- 关闭时卸下工具
        if not getgenv().rock then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

-- 自动打石头10（耐久≥10）
Tab:AddToggle({
    Name = "自动打石头10",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        -- 耐久检测
        if player.Durability.Value >= 10 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                -- 装备Punch工具
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                -- 激活Punch工具
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                -- 传送至目标位置
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299)
            end
            -- 关闭时卸下工具
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头100（耐久≥100）
Tab:AddToggle({
    Name = "自动打石头100",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 100 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928)
            end
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头500万（耐久≥5000000）
Tab:AddToggle({
    Name = "自动打石头500万",
    Callback = function(rock)
        local LocalPlayer = getgenv().LocalPlayer or game.Players.LocalPlayer
        if not LocalPlayer.Durability then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "功能失效",
                Text = "未找到耐久值属性，无法使用该功能",
                Duration = 2
            })
            return
        end
        
        if LocalPlayer.Durability.Value >= 5000000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait(0.1) -- 控制打石头频率，减少性能消耗
                
                -- 1. 装备Punch工具
                local punchTool = LocalPlayer.Backpack:FindFirstChild("Punch")
                local character = LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if punchTool and humanoid then
                    humanoid:EquipTool(punchTool)
                end
                
                -- 2. 激活Punch工具（触发攻击）
                if character then
                    for _, h in pairs(character:GetChildren()) do
                        if h:IsA("Tool") and h.Name == "Punch" then
                            h:Activate()
                        end
                    end
                end
                
                -- 3. 传送至目标石头位置（补充实际坐标，示例为(2000, 5, 2000)）
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = CFrame.new(2000.0, 5.0, 2000.0)
                end
            end
            
            -- 4. 关闭功能时卸下工具
            if not getgenv().rock and humanoid then
                humanoid:UnequipTools()
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "权限不足",
                Text = "耐久值需≥500万才能使用该功能",
                Duration = 2
            })
        end
    end
})

-- 自动打石头150000（耐久≥150000）
Tab:AddToggle({
    Name = "自动打石头150000",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 150000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579)
            end
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头400000（耐久≥400000）
Tab:AddToggle({
    Name = "自动打石头400000",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 400000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148)
            end
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头750000（耐久≥750000）
Tab:AddToggle({
    Name = "自动打石头750000",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 750000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783)
            end
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头100万（耐久≥1000000）
Tab:AddToggle({
    Name = "自动打石头100万",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 1000000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997)
            end
            if not getgenv().rock then
                player.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

-- 自动打石头500万（耐久≥5000000）
Tab:AddToggle({
    Name = "自动打石头500万",
    Callback = function(rock)
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= 5000000 then
            getgenv().rock = rock
            while getgenv().rock do
                wait()
                for i, v in pairs(player.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        player.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
       
-- 海滩跑步机10（无敏捷要求）
Tab:AddToggle({
    Name = "海滩跑步机10",
    Callback = function(treadmill)
        getgenv().spam = treadmill
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        while getgenv().spam do
            wait()
            if localPlayer.Character then
                -- 设置移动速度与传送位置
                local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874)

                -- 绑定移动渲染步骤
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                        localPlayer.Character.Humanoid:Move(Vector3.new(10000, 0, -1), true)
                    end
                end)
            end
        end

        -- 关闭时解绑渲染步骤
        if not getgenv().spam then
            RunService:UnbindFromRenderStep("move")
        end
    end
})

-- 健身房跑步机2000（敏捷≥2000）
Tab:AddToggle({
    Name = "健身房跑步机2000",
    Callback = function(treadmill)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        -- 敏捷值检测
        if localPlayer.Agility.Value >= 2000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    humanoid.WalkSpeed = 10
                    rootPart.CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816)

                    RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                            localPlayer.Character.Humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end)
                end
            end
        end

        -- 关闭时解绑渲染步骤
        if not getgenv().spam then
            RunService:UnbindFromRenderStep("move")
        end
    end
})

-- 神话健身房跑步机2000（敏捷≥2000）
Tab:AddToggle({
    Name = "神话健身房跑步机2000",
    Callback = function(treadmill)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        if localPlayer.Agility.Value >= 2000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    humanoid.WalkSpeed = 10
                    rootPart.CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231)

                    RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                            localPlayer.Character.Humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end)
                end
            end
        end

        if not getgenv().spam then
            RunService:UnbindFromRenderStep("move")
        end
    end
})

-- 永恒健身房跑步机3500（敏捷≥3500）
Tab:AddToggle({
    Name = "永恒健身房跑步机3500",
    Callback = function(treadmill)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        if localPlayer.Agility.Value >= 3500 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    humanoid.WalkSpeed = 10
                    rootPart.CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594)

                    RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                            localPlayer.Character.Humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end)
                end
            end
        end

        if not getgenv().spam then
            RunService:UnbindFromRenderStep("move")
        end
    end
})

-- 传奇健身房跑步机3000（敏捷≥3000）
Tab:AddToggle({
    Name = "传奇健身房跑步机3000",
    Callback = function(treadmill)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer

        if localPlayer.Agility.Value >= 3000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    humanoid.WalkSpeed = 10
                    rootPart.CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)

                    RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                            localPlayer.Character.Humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end)
                end
            end
        end

        if not getgenv().spam then
            RunService:UnbindFromRenderStep("move")
        end
    end
})

-- 沙滩深蹲架（力量≥1000）
Tab:AddToggle({
    Name = "沙滩深蹲架",
    Callback = function(rack)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        -- 力量值检测
        if localPlayer.leaderstats.Strength.Value >= 1000 then
            getgenv().spam = rack
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    -- 检测是否未使用器械
                    if localPlayer.machineInUse.Value == nil then
                        -- 传送至器械位置并按E交互
                        rootPart.CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        -- 已使用器械时发送重复动作事件
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Squat Rack"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        -- 关闭时让角色跳跃（退出器械）
        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 深蹲架霜冻健身房（力量≥4000）
Tab:AddToggle({
    Name = "深蹲架霜冻健身房",
    Callback = function(rack)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        if localPlayer.leaderstats.Strength.Value >= 4000 then
            getgenv().spam = rack
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    if localPlayer.machineInUse.Value == nil then
                        rootPart.CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Squat Rack"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 深蹲架传奇健身房（无力量要求）
Tab:AddToggle({
    Name = "深蹲架传奇健身房",
    Callback = function(rack)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        getgenv().spam = rack
        while getgenv().spam do
            wait()
            if localPlayer.Character then
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                if localPlayer.machineInUse.Value == nil then
                    rootPart.CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = Workspace.machinesFolder["Squat Rack"].interactSeat
                    local Event = localPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 深蹲架肌肉健身房（无力量要求）
Tab:AddToggle({
    Name = "深蹲架肌肉健身房",
    Callback = function(rack)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        getgenv().spam = rack
        while getgenv().spam do
            wait()
            if localPlayer.Character then
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                if localPlayer.machineInUse.Value == nil then
                    rootPart.CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = Workspace.machinesFolder["Squat Rack"].interactSeat
                    local Event = localPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 引体向上海滩（力量≥1000）
Tab:AddToggle({
    Name = "引体向上海滩",
    Callback = function(pull)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        -- 力量值检测（≥1000）
        if localPlayer.leaderstats.Strength.Value >= 1000 then
            getgenv().spam = pull
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    -- 检测器械是否未被使用
                    if localPlayer.machineInUse.Value == nil then
                        -- 传送至引体向上器械位置并按E交互
                        rootPart.CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        -- 已使用器械时发送重复动作事件
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Legends Pullup"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        -- 关闭功能时让角色跳跃（退出器械）
        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 引体向上神话游戏（力量≥4000）
Tab:AddToggle({
    Name = "引体向上神话游戏",
    Callback = function(pull)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        if localPlayer.leaderstats.Strength.Value >= 4000 then
            getgenv().spam = pull
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    if localPlayer.machineInUse.Value == nil then
                        rootPart.CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Legends Pullup"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 引体向上传奇健身房（无力量要求）
Tab:AddToggle({
    Name = "引体向上传奇健身房",
    Callback = function(pull)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        getgenv().spam = pull
        while getgenv().spam do
            wait()
            if localPlayer.Character then
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                if localPlayer.machineInUse.Value == nil then
                    rootPart.CFrame = CFrame.new(4305.08203, 989.963623, -4118.44873, -0.953815758, -7.58000382e-08, -0.30039227, -8.98859724e-08, 1, 3.30721512e-08, 0.30039227, 5.85457904e-08, -0.953815758)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = Workspace.machinesFolder["Legends Pullup"].interactSeat
                    local Event = localPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推海滩（力量≥150）
Tab:AddToggle({
    Name = "卧推海滩",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        -- 力量值检测（≥150）
        if localPlayer.leaderstats.Strength.Value >= 150 then
            getgenv().spam = bench
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    -- 检测器械是否空闲
                    if localPlayer.machineInUse.Value == nil then
                        -- 传送至卧推器械并触发E键交互
                        rootPart.CFrame = CFrame.new(-241.827469, 7.91391563, 346.321808, 0.811665356, -1.43794319e-08, -0.584122717, -3.94010407e-08, 1, -7.93666999e-08, 0.584122717, 8.74342447e-08, 0.811665356)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        -- 器械已使用时发送重复动作事件
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        -- 关闭功能时跳跃退出器械
        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推冰上体操（力量≥7500）
Tab:AddToggle({
    Name = "卧推冰上体操",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        if localPlayer.leaderstats.Strength.Value >= 7500 then
            getgenv().spam = bench
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    if localPlayer.machineInUse.Value == nil then
                        rootPart.CFrame = CFrame.new(-3020.7019, 32.5691414, -194.773117, 0.924556971, 2.05821564e-08, 0.381043822, -3.5507064e-08, 1, 3.21384199e-08, -0.381043822, -4.32435456e-08, 0.924556971)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推神话游戏（力量≥15000）
Tab:AddToggle({
    Name = "卧推神话游戏",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        if localPlayer.leaderstats.Strength.Value >= 15000 then
            getgenv().spam = bench
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    if localPlayer.machineInUse.Value == nil then
                        rootPart.CFrame = CFrame.new(2363.95483, 42.2141037, 1243.50562, -0.944882751, 2.18911698e-08, 0.32740894, 4.06544087e-09, 1, -5.51292381e-08, -0.32740894, -5.07596027e-08, -0.944882751)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推永恒健身房（力量≥15000）
Tab:AddToggle({
    Name = "卧推永恒健身房",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        if localPlayer.leaderstats.Strength.Value >= 15000 then
            getgenv().spam = bench
            while getgenv().spam do
                wait()
                if localPlayer.Character then
                    local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                    if localPlayer.machineInUse.Value == nil then
                        rootPart.CFrame = CFrame.new(-7172.77002, 48.3923645, -1105.06018, -0.972435296, -4.87620122e-09, 0.233172983, -2.76572942e-09, 1, 9.37805122e-09, -0.233172983, 8.47465476e-09, -0.972435296)
                        local vim = game:service("VirtualInputManager")
                        vim:SendKeyEvent(true, "E", false, game)
                    else
                        local A_1 = "rep"
                        local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                        local Event = localPlayer.muscleEvent
                        Event:FireServer(A_1, A_2)
                    end
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推传奇体操（无力量要求）
Tab:AddToggle({
    Name = "卧推传奇体操",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        getgenv().spam = bench
        while getgenv().spam do
            wait()
            if localPlayer.Character then
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                if localPlayer.machineInUse.Value == nil then
                    rootPart.CFrame = CFrame.new(4109.81152, 1024.02734, -3800.75122, 0.446250677, -7.44993258e-08, -0.894908011, -1.94296179e-09, 1, -8.4216893e-08, 0.894908011, 3.93206179e-08, 0.446250677)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                    local Event = localPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

-- 卧推肌肉运动（无力量要求）
Tab:AddToggle({
    Name = "卧推肌肉运动",
    Callback = function(bench)
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")
        local localPlayer = Players.LocalPlayer

        getgenv().spam = bench
        while getgenv().spam do
            wait()
            if localPlayer.Character then
                local rootPart = localPlayer.Character:WaitForChild("HumanoidRootPart")
                if localPlayer.machineInUse.Value == nil then
                    rootPart.CFrame = CFrame.new(-8592.99805, 49.1056519, -6042.80322, -0.975815654, -1.70261014e-08, 0.218595073, -1.06326148e-08, 1, 3.04244203e-08, -0.218595073, 2.73643881e-08, -0.975815654)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = Workspace.machinesFolder["Bench Press"].interactSeat
                    local Event = localPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end

        if not getgenv().spam and localPlayer.Character then
            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
            humanoid.Jump = true
        end
    end
})

Tab:AddToggle({
    Name = "投掷海滩",
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tab:AddToggle({
    Name = "扔神话游戏",
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tab:AddToggle({
    Name = "投掷传奇体操",
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tab:AddToggle({
    Name = "投掷肌肉",
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(8933.69434, 13.5269222, -5700.12598, -0.823058188, 6.96304259e-09, 0.567957044, -1.19721832e-08, 1, -2.96093621e-08, -0.567957044, -3.11699146e-08, -0.823058188)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

local Tab = Window:MakeTab({
    Name = "墨水游戏",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
    Name ="初始化墨水游戏（必点）",
    Callback = function()
    -- 在脚本开头（OrionLib加载后）补充全局变量定义
local LocalPlayer = game.Players.LocalPlayer -- 统一使用大写L开头的LocalPlayer，与Roblox官方命名习惯一致
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
    end
})

Tab:AddButton({
    Name ="初始化2（必点）",
    Callback = function()
    getgenv().a = {
    selectname = "",
    autoPush = false
}
    end
})

Tab:AddButton({
    Name ="初始化墨水游戏3（必点）",
    Callback = function()
        -- 1. 补充全局服务与玩家变量（统一命名）
        getgenv().LocalPlayer = game.Players.LocalPlayer
        getgenv().Players = game:GetService("Players")
        getgenv().RunService = game:GetService("RunService")
        getgenv().UserInputService = game:GetService("UserInputService")
        getgenv().ReplicatedStorage = game:GetService("ReplicatedStorage")
        
        -- 2. 实现ESP核心功能（透视高亮系统）
        getgenv().ESP = {
            Folders = {}, -- 存储ESP高亮组件的父文件夹
            AddESP = function(folderName, labelText, adornee, color)
                -- 创建ESP父文件夹（避免重复创建）
                if not ESP.Folders[folderName] then
                    local folder = Instance.new("Folder")
                    folder.Name = folderName
                    folder.Parent = game.CoreGui -- 放在CoreGui避免被游戏清理
                    ESP.Folders[folderName] = folder
                end
                local folder = ESP.Folders[folderName]
                
                -- 创建高亮组件（Highlight）
                local highlight = Instance.new("Highlight")
                highlight.Name = labelText
                highlight.Adornee = adornee -- 绑定到目标对象（角色/玻璃）
                highlight.FillColor = color
                highlight.OutlineColor = Color3.new(1,1,1) -- 白色描边，增强辨识度
                highlight.FillTransparency = 0.5 -- 半透明填充
                highlight.OutlineTransparency = 0
                highlight.DepthMode = Enum.DepthMode.AlwaysOnTop -- 穿透遮挡显示
                highlight.Parent = folder
            end,
            Clear = function(folderName)
                -- 清理指定文件夹下的所有ESP组件
                if ESP.Folders[folderName] then
                    ESP.Folders[folderName]:Destroy()
                    ESP.Folders[folderName] = nil
                end
            end
        }
    end
})

-- 透视躲藏者功能修改后
Tab:AddToggle({
    Name = "透视躲藏者",
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= localPlayer and v:GetAttribute("IsHider") then
                    ESP.AddESP("HiderESPFolder", "躲藏者" .. v.Name, v.Character, Color3.new(0,0,1))
                end
            end
        else
            ESP.Clear("HiderESPFolder")
        end
    end
})

-- 透视搜查者功能修改后
Tab:AddToggle({
    Name = "透视搜查者",
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v:GetAttribute("IsHunter") then
                    ESP.AddESP("HunterESPFolder", "搜查者" .. v.Name, v.Character, Color3.new(1,0,0))
                end
            end
        else
            ESP.Clear("HunterESPFolder")
        end
    end
})

Tab:AddToggle({
    Name = "透视假玻璃板",
    Callback = function(state)
        if state then
            for _, v in next, workspace.GlassBridge.GlassHolder:GetChildren() do
                if v.Name:find("ClonedPanel") then
                    for _, panelChild in next, v:GetChildren() do
                        for _, glassPart in next, panelChild:GetChildren() do
                            if glassPart.Name == "glasspart" and glassPart:FindFirstChild("TouchInterest") then
                                ESP.AddESP("GlassESPFolder", "假玻璃", glassPart, Color3.new(0, 1, 0))
                            end
                        end
                    end
                end
            end
        else
            ESP.Clear("GlassESPFolder")
        end
    end
})


-- 选择推人目标功能修改后
Tab:AddTextbox({
    Name = "选择推人目标",
    Default = "输入玩家全称",
    TextDisappear = true,
    Callback = function(option)
        getgenv().a.selectname = option
        -- 提示目标已选择
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "推人目标设置",
            Text = "已选择目标：" .. option,
            Duration = 2
        })
    end
})

Tab:AddToggle({
    Name = "自动推人",
    Callback = function(state)
        local a = getgenv().a -- 获取全局配置表
        a.autoPush = state
        
        if state then
            spawn(function() -- 开独立线程，避免阻塞UI
                while a.autoPush do
                    wait(0.1) -- 控制推人频率，避免服务器检测
                    
                    -- 1. 获取全局变量与目标玩家
                    local LocalPlayer = getgenv().LocalPlayer
                    local Players = getgenv().Players
                    local targetPlayer = Players:FindFirstChild(a.selectname)
                    
                    -- 2. 检测必要对象是否存在
                    if not targetPlayer or not targetPlayer.Character then
                        continue -- 目标玩家未加载，跳过
                    end
                    local localChar = LocalPlayer.Character
                    local localHumanoid = localChar and localChar:FindFirstChildOfClass("Humanoid")
                    if not localChar or not localHumanoid then
                        continue -- 本地角色未加载，跳过
                    end
                    
                    -- 3. 移动到目标玩家附近（避免重叠）
                    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        local movePos = targetRoot.CFrame * CFrame.new(0, 0, -3) -- 目标前方3单位
                        localHumanoid:MoveTo(movePos.Position)
                    end
                    
                    -- 4. 触发推人工具（检测工具是否存在）
                    local pushTool = LocalPlayer.Backpack:FindFirstChild("Push") 
                        or localChar:FindFirstChild("Push") -- 检测背包/手中工具
                    if pushTool then
                        local ReplicatedStorage = getgenv().ReplicatedStorage
                        local UsedToolRemote = ReplicatedStorage:FindFirstChild("Remotes") 
                            and ReplicatedStorage.Remotes:FindFirstChild("UsedTool")
                        if UsedToolRemote then
                            -- 发送推人请求（匹配游戏远程事件参数）
                            UsedToolRemote:FireServer("UsingMoveCustom", pushTool, nil, {["AutoUse"] = true})
                        end
                    end
                end
            end)
        end
    end
})

Tab:AddToggle({
    Name = "自动砍人(捉迷藏)",
    Callback = function(state)
        if state then
            spawn(function()
                while state and wait() do
                    local potentialTargets = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                            if player.Character:GetAttribute("IsHunter") == true then
                                table.insert(potentialTargets, player)
                            end
                        end
                    end
                    if #potentialTargets > 0 then
                        local targetPlayer = potentialTargets[math.random(1, #potentialTargets)]
                        local localChar = LocalPlayer.Character
                        local targetChar = targetPlayer.Character
                        
                        if localChar and targetChar then
                            localChar:MoveTo(targetChar:GetPivot().Position)
                            local knifeTool = LocalPlayer.Backpack:FindFirstChild("Knife")
                            if knifeTool then
                                local args = {
                                    [1] = "UsingMoveCustom",
                                    [2] = knifeTool,
                                    [4] = {["Clicked"] = true}
                                }
                                ReplicatedStorage.Remotes.UsedTool:FireServer(unpack(args))
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tab:AddTextbox({
    Name = "速度提升加成(1-500)",
    Default = "16",
    TextDisappear = true,
    Callback = function(Value)
        local numValue = tonumber(Value) or 16
        numValue = math.clamp(numValue, 1, 500)
        LocalPlayer.Boosts["Faster Sprint"].Value = numValue
    end
})

Tab:AddTextbox({
    Name = "胜利加成(1-500)",
    Default = "16",
    TextDisappear = true,
    Callback = function(Value)
        local numValue = tonumber(Value) or 16
        numValue = math.clamp(numValue, 1, 500)
        LocalPlayer.Boosts["Won Boost"].Value = numValue
    end
})

Tab:AddTextbox({
    Name = "伤害加成(1-500)",
    Default = "16",
    TextDisappear = true,
    Callback = function(Value)
        local numValue = tonumber(Value) or 16
        numValue = math.clamp(numValue, 1, 500)
        LocalPlayer.Boosts["Damage Boost"].Value = numValue
    end
})

-- 工具函数关联UI：坐标传送
Tab:AddTextbox({
    Name = "坐标传送(X,Y,Z)",
    Default = "例：100,5,200",
    TextDisappear = true,
    Callback = function(posText)
        local x, y, z = string.match(posText, "(%-?%d+%.?%d*),(%-?%d+%.?%d*),(%-?%d+%.?%d*)")
        if x and y and z then
            local cf = CFrame.new(tonumber(x), tonumber(y), tonumber(z))
            tpTo(cf)
        end
    end
})

-- 工具函数关联UI：触发附近提示框
Tab:AddToggle({
    Name = "自动触发附近提示框",
    Callback = function(state)
        if state then
            spawn(function()
                while state and wait(0.5) do
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, prompt in ipairs(workspace:GetDescendants()) do
                            if prompt:IsA("ProximityPrompt") then
                                local distance = (prompt.Parent.Position - hrp.Position).Magnitude
                                if distance <= prompt.MaxActivationDistance then
                                    fireProximityPrompt(prompt)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

-- 工具函数关联UI：多边形区域检测（显示提示）
Tab:AddToggle({
    Name = "检测是否在安全区域",
    Callback = function(state)
        if state then
            spawn(function()
                while state and wait(1) do
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local pos = Vector2.new(hrp.Position.X, hrp.Position.Z)
                        local inPoly = isPointInPolygon(pos, polygon)
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "区域检测",
                            Text = inPoly and "当前在安全区域内" or "当前在安全区域外",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end
})

Tab:AddButton({
    Name ="木头人初始化",
    Callback = function()
    
-- 全局变量初始化（补充缺失的关键变量）
local lastUpdate = 0
local updateInterval = 2 -- 操作冷却间隔，默认2秒
local playerSpeed = 28
local isInfiniteJumpEnabled = false
local isNoclipEnabled = false
local noclipParts = {}
local lastWalkSpeedUpdate = 0
local lastJumpTime = 0
local lastNoclipCheck = 0
local isAimbotEnabled = false
local isEspEnabled = false
local aimbotLerpFactor = 0.1
local espCache = {}
local lastEspUpdate = 0
local lastCombatUpdate = 0
local isRedLightGodMode = false
local lastRootPartCFrame = nil
local isGreenLight = false
-- 补充多边形坐标（木头人关帮助玩家功能依赖，默认示例可根据实际场景修改）
local polygon = {
    Vector2.new(-200, -200),
    Vector2.new(200, -200),
    Vector2.new(200, 200),
    Vector2.new(-200, 200)
}

-- 工具函数（复用并确保功能完整性）
local function isPointInPolygon(point, poly)
    local inside = false
    local j = #poly
    for i = 1, #poly do
        local xi, zi = poly[i].X, poly[i].Y
        local xj, zj = poly[j].X, poly[j].Y
        if ((zi > point.Y) ~= (zj > point.Y)) and
            (point.X < (xj - xi) * (point.Y - zi) / (zj - zi + 1e-9) + xi) then
            inside = not inside
        end
        j = i
    end
    return inside
end

local function tpTo(cf)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = cf
    end
end

local function fireProximityPrompt(prompt)
    if fireproximityprompt then
        pcall(fireproximityprompt, prompt)
    elseif prompt and prompt:IsA("ProximityPrompt") then
        prompt:InputHoldBegin()
        task.wait(0.1)
        prompt:InputHoldEnd()
    end
end
    end
})

Tab:AddButton({
    Name = "帮助玩家到终点(木头人关)",
    Callback = function()
        -- 1. 先获取全局变量（避免未初始化报错）
        local LocalPlayer = getgenv().LocalPlayer
        local lastUpdate = getgenv().lastUpdate or 0
        local updateInterval = getgenv().updateInterval or 2
        
        -- 2. 操作冷却判断（避免频繁触发）
        if tick() - lastUpdate < updateInterval then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "帮助玩家",
                Text = "操作过于频繁，请稍后再试",
                Duration = 1
            })
            return
        end
        getgenv().lastUpdate = tick()
        
        -- 3. 核心逻辑：定位安全区域终点并传送
        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "帮助失败",
                Text = "角色未加载，请等待重生",
                Duration = 1
            })
            return
        end
        
        -- 示例：假设木头人关终点坐标为(1000, 10, 500)（可根据实际游戏调整）
        local endPos = CFrame.new(-46, 1024, 110)
        hrp.CFrame = endPos
        
        -- 4. 提示操作成功
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "帮助成功",
            Text = "已传送至木头人关终点附近",
            Duration = 2
        })
    end
})

Tab:AddTextbox({
  Name = "移动速度",
  Default = "16",
  TextDisappear = true,
  Callback = function(Value)
    local player = LocalPlayer
    local character = player.Character
    if not character then return end -- 角色未加载时退出
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end -- 人形对象不存在时退出
    
    -- 转换为数字，限制1-500范围，避免速度异常
    local speed = tonumber(Value) or 16
    speed = math.clamp(speed, 1, 500)
    humanoid.WalkSpeed = speed
  end
})

-- 无限跳跃 - Toggle 适配
Tab:AddToggle({
    Name = "无限跳跃",
    Callback = function(state)
        isInfiniteJumpEnabled = state
    end
})

-- 穿墙模式 - Toggle 适配
Tab:AddToggle({
    Name = "穿墙模式",
    Callback = function(state)
        isNoclipEnabled = state
        if not state then
            for part, _ in pairs(noclipParts) do
                if part and part.Parent then
                    part.CanCollide = true
                end
            end
            noclipParts = {}
        end
    end
})

-- 无限跳跃输入监听（保留原逻辑）
local lastJumpTime = 0
UserInputService.JumpRequest:Connect(function()
    if isInfiniteJumpEnabled and tick() - lastJumpTime > 0.1 then
        lastJumpTime = tick()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- 穿墙模式逻辑（保留原逻辑）
local lastNoclipCheck = 0
RunService.Stepped:Connect(function()
    if isNoclipEnabled and LocalPlayer.Character then
        if tick() - lastNoclipCheck > 0.1 then
            lastNoclipCheck = tick()
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.CanCollide then
                        noclipParts[part] = true
                        part.CanCollide = false
                    end
                end
            end
        end
    end
end)

-- 自瞄 (Rebel) - Toggle 适配
Tab:AddToggle({
    Name = "自瞄 (Rebel)",
    Callback = function(state)
        isAimbotEnabled = state
    end
})

-- ESP透视 (Rebel) - Toggle 适配
Tab:AddToggle({
    Name = "ESP透视 (Rebel)",
    Callback = function(state)
        isEspEnabled = state
        if not isEspEnabled then
            for _, esp in pairs(espCache) do
                if esp and esp.Parent then
                    esp:Destroy()
                end
            end
            espCache = {}
        end
    end
})

-- 战斗逻辑（自瞄+ESP，保留原逻辑）
local lastCombatUpdate = 0
RunService.RenderStepped:Connect(function()
    local now = tick()
    if now - lastCombatUpdate < updateInterval then return end
    lastCombatUpdate = now
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local rootPart = character.HumanoidRootPart
    local nearestTarget = nil
    local nearestDistance = math.huge

    if now - lastEspUpdate > 0.5 then
        lastEspUpdate = now
        if isEspEnabled then
            for _, model in ipairs(workspace:GetDescendants()) do
                if model:IsA("Model") and not model:IsDescendantOf(Players) and not model:IsDescendantOf(character) then
                    local modelName = model.Name:lower()
                    if modelName:find("guard") or modelName:find("guy") or modelName:find("squid") then
                        local part = model:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local distance = (part.Position - rootPart.Position).Magnitude
                            if distance < nearestDistance then
                                nearestTarget = model
                                nearestDistance = distance
                            end
                            
                            if not espCache[part] then
                                local espBox = Instance.new("BoxHandleAdornment")
                                espBox.Name = "ESP"
                                espBox.Adornee = part
                                espBox.Size = part.Size
                                espBox.Color3 = Color3.fromRGB(255, 0, 0)
                                espBox.AlwaysOnTop = true
                                espBox.ZIndex = 10
                                espBox.Transparency = 0.25
                                espBox.AdornCullingMode = Enum.AdornCullingMode.Never
                                espBox.Parent = part
                                espCache[part] = espBox
                            end
                        end
                    end
                end
            end
        end
    end

    if isAimbotEnabled and nearestTarget then
        local targetPart = nearestTarget:FindFirstChild("Head") or nearestTarget:FindFirstChild("Torso")
        if targetPart then
            local cameraPos = workspace.CurrentCamera.CFrame.Position
            local targetDir = (targetPart.Position - cameraPos).Unit
            local currentCFrame = workspace.CurrentCamera.CFrame
            local newCFrame = currentCFrame:Lerp(CFrame.new(cameraPos, targetPart.Position), aimbotLerpFactor)
            workspace.CurrentCamera.CFrame = newCFrame
        end
    end
end)

Tab:AddToggle({
    Name = "红绿灯无敌模式",
    Callback = function(state)
        isRedLightGodMode = state
    end
})

Tab:AddToggle({
    Name = "自动完成糖饼",
    Callback = function(state)
        if state then
            pcall(function()
                local DalgonaClientModule = game.ReplicatedStorage.Modules.Games.DalgonaClient
                for _, Value in ipairs(getreg()) do
                    if typeof(Value) == "function" and islclosure(Value) then
                        if getfenv(Value).script == DalgonaClientModule then
                            if getinfo(Value).nups == 73 then
                                setupvalue(Value, 31, 9e9)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tab:AddToggle({
    Name = "自动拔河",
    Callback = function(state)
        if state then
            pcall(function()
                local TemporaryReachedBindableRemote = ReplicatedStorage.Remotes.TemporaryReachedBindable
                local VALID_PULL_DATA = {["PerfectQTE"] = true}
                while task.wait(0.025) and state do
                    TemporaryReachedBindableRemote:FireServer(VALID_PULL_DATA)
                end
            end)
        end
    end
})

Tab:AddToggle({
    Name = "玻璃桥ESP",
    Callback = function(state)
        pcall(function()
            local GlassHolder = workspace.GlassBridge.GlassHolder
            for _, PanelPair in ipairs(GlassHolder:GetChildren()) do
                for _, Panel in ipairs(PanelPair:GetChildren()) do
                    local GlassPart = Panel:FindFirstChild("glasspart")
                    if GlassPart then
                        if state then
                            local Color = GlassPart:GetAttribute("exploitingisevil") and Color3.fromRGB(248, 87, 87) or Color3.fromRGB(28, 235, 87)
                            GlassPart.Color = Color
                            GlassPart.Transparency = 0
                            GlassPart.Material = Enum.Material.Neon
                        else
                            GlassPart.Color = Color3.fromRGB(106, 106, 106)
                            GlassPart.Transparency = 0.45
                            GlassPart.Material = Enum.Material.SmoothPlastic
                        end
                    end
                end
            end
        end)
    end
})
