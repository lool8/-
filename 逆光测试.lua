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
    Name = "自然灾害",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name ="传送到安全位置",
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -261.54,  194.76,  301.28)
    end
})

local Tab = Window:MakeTab({
    Name = "强壮传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddToggle({
    Name = "自动吃食物",
    Callback = function(v)
        getgenv().autousefood = v
        while true do
            if not getgenv().autousefood then return end
            local args = {"Food"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseTool"):FireServer(unpack(args))
            wait(1) -- 添加延迟防止过快执行
        end
    end
})

Tab:AddToggle({
    Name = "自动售出",
    Callback = function(v)
        getgenv().autosell = v
        while getgenv().autosell do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("YieldSell"):InvokeServer()
            wait(1) -- 添加1秒延迟防止过快执行
        end
    end
})

Tab:AddToggle({
    Name = "自动挥拳",
    Callback = function(state)
        while state do
            local args = {"Punch"}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseTool"):FireServer(unpack(args))
            task.wait(0.1) -- Adjust this delay as needed (0.1 seconds between punches)
        end
    end
})

Tab:AddButton({
    Name = "自动解锁所有岛屿",
    Callback = function()
        local coordinates = {
            {718.34, 1717.45, 2058.72},
            {703.17, 3340.41, 2041.46},
            {715.11, 5938.00, 2057.97},
            {771.49, 9188.80, 2060.20},
            {663.26, 12854.54, 2046.93},
            {709.37, 16609.40, 2009.45},
            {734.86, 21916.71, 2090.01},
            {691.55, 30306.88, 2050.44}
        }
        
        for i, coord in ipairs(coordinates) do
            task.wait(2) -- 2 second delay
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(coord[1], coord[2], coord[3])
        end
    end
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "实用功能"
})

-- 自动比赛开关
Tab:AddToggle({
    Name = "自动比赛开关",
    Callback = function(Value)
        while Value do
            task.wait(2)
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
        end
    end
})

-- 自动举哑铃
Tab:AddToggle({
    Name = "自动举哑铃",
    Callback = function(Value)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while Value do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                -- Equip weight tool
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Weight" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        -- Clean up part when toggled off
        if not Value and part then
            part:Destroy()
        end
    end
})

-- 自动俯卧撑
Tab:AddToggle({
    Name = "自动俯卧撑",
    Callback = function(Value)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while Value do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                -- Equip pushups tool
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Pushups" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        -- Clean up part when toggled off
        if not Value and part then
            part:Destroy()
        end
    end
})

-- 自动仰卧起坐
Tab:AddToggle({
    Name = "自动仰卧起坐",
    Callback = function(Value)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while Value do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                -- Equip situps tool
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Situps" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        -- Clean up part when toggled off
        if not Value and part then
            part:Destroy()
        end
    end
})

-- 自动倒立身体
Tab:AddToggle({
    Name = "自动倒立身体",
    Callback = function(Value)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while Value do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                -- Equip handstands tool
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Handstands" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        -- Clean up part when toggled off
        if not Value and part then
            part:Destroy()
        end
    end
})

-- 自动锻炼
Tab:AddToggle({
    Name = "自动锻炼",
    Callback = function(Value)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while Value do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                -- Equip all exercise tools
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and (v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or v.Name == "Weight") then
                        local numberValue = v:FindFirstChildOfClass("NumberValue")
                        if numberValue then
                            numberValue.Value = 0
                        end
                        character:WaitForChild("Humanoid"):EquipTool(v)
                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                    end
                end
            end
        end
        
        -- Clean up part when toggled off
        if not Value and part then
            part:Destroy()
        end
    end
})

-- 自动重生
Tab:AddToggle({
    Name = "自动重生",
    Callback = function(Value)
        while Value do
            task.wait()
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
        end
    end
})

-- 收集宝石 (Button)
Tab:AddButton({
    Name = "收集宝石",
    Callback = function()
        local jk = {}
        for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
            if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then
                table.insert(jk, v.Name)
            end
        end
        for i = 1, #jk do
            task.wait(2)
            game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
        end
    end
})

local Section = Tab:AddSection({
	Name = "主要功能"
})


-- 传送到幸运抽奖区域
Tab:AddButton({
    Name = "传送到幸运抽奖区域",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-2606, -2, 5753)
            end
        end
    end
})

-- 传送到肌肉之王健身房
Tab:AddButton({
    Name = "传送到肌肉之王健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-8554, 22, -5642)
            end
        end
    end
})

-- 传送到传说健身房
Tab:AddButton({
    Name = "传送到传说健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(4676, 997, -3915)
            end
        end
    end
})

-- 传送到永恒健身房
Tab:AddButton({
    Name = "传送到永恒健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-6686, 13, -1284)
            end
        end
    end
})

-- 传送到神话健身房
Tab:AddButton({
    Name = "传送到神话健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(2177, 13, 1070)
            end
        end
    end
})

-- 传送到冰霜健身房
Tab:AddButton({
    Name = "传送到冰霜健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-2543, 13, -410)
            end
        end
    end
})

-- 传送到丛林健身房
Tab:AddButton({
    Name = "传送到丛林健身房",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-8760.79, 46.58, 2394.51)
            end
        end
    end
})

local Section = Tab:AddSection({
	Name = "温馨提示建议把体型调成2"
})

Tab:AddToggle({
    Name = "自动打石头0",
    Callback = function(Value)
        getgenv().rock = Value
        while getgenv().rock do
            wait()
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.Name == "Punch" then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                end
            end
            for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if h:IsA("Tool") and h.Name == "Punch" then
                    h:Activate()
                end
            end
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159)
        end
        if not getgenv().rock then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头10",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 10 then
            getgenv().rock = Value
            while getgenv().rock do
                wait()
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299)
            end
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头100",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock do
                wait()
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928)
            end
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头5000",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock do
                wait()
                -- Equip Punch tool from backpack
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                -- Activate Punch tool if equipped
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                -- Teleport to new mining location
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(
                    283.42, 3.71, -590.84,
                    -0.921312928, -1.80826774e-07, -0.38882193,
                    -9.13036544e-08, 1, -2.48719346e-07,
                    0.38882193, -1.93647494e-07, -0.921312928
                )
            end
            -- Unequip tools when toggled off
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头150000",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock do
                wait()
                -- Equip Punch tool from backpack
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                -- Activate Punch tool if equipped
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                -- Teleport to new position (only X,Y,Z coordinates)
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2585.99, 17.38, -249.59)
            end
            -- Unequip tools when toggled off
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头400000",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock do
                wait()
                -- 装备背包中的Punch工具
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                -- 激活已装备的Punch工具
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                -- 传送到指定坐标位置
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2220.94, 12.67, 1252.67)
            end
            -- 关闭时卸下所有工具
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头100万",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock and task.wait() do
                -- 自动装备Punch工具
                local character = game.Players.LocalPlayer.Character
                local backpack = game.Players.LocalPlayer.Backpack
                
                -- 从背包装备工具
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        if character then
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                end
                
                -- 使用已装备的工具
                if character then
                    for _, tool in ipairs(character:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Punch" then
                            tool:Activate()
                        end
                    end
                    
                    -- 传送到新坐标位置
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(4178.57, 1012.66, -4062.21)
                    end
                end
            end
            
            -- 关闭功能时卸下工具
            if not getgenv().rock then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:UnequipTools()
                    end
                end
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头500万",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock do
                task.wait()
                -- 自动装备背包中的Punch工具
                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool)
                    end
                end
                
                -- 自动使用已装备的Punch工具
                for _, tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        tool:Activate()
                    end
                end
                
                -- 传送到指定坐标位置
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(-8919.20, 40.01, -6014.81)
                    end
                end
            end
            
            -- 当关闭功能时卸下所有工具
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
})

Tab:AddToggle({
    Name = "自动打石头1000万",
    Callback = function(Value)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = Value
            while getgenv().rock and task.wait() do
                -- 自动装备Punch工具
                local character = game.Players.LocalPlayer.Character
                local backpack = game.Players.LocalPlayer.Backpack
                
                -- 从背包装备工具
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        if character then
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                            end
                        end
                    end
                end
                
                -- 使用已装备的工具
                if character then
                    for _, tool in ipairs(character:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Punch" then
                            tool:Activate()
                        end
                    end
                    
                    -- 传送到新坐标位置
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(-7689.18, 61.99, 2869.29)
                    end
                end
            end
            
            -- 关闭功能时卸下工具
            if not getgenv().rock then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:UnequipTools()
                    end
                end
            end
        end
    end
})

local Section = Tab:AddSection({
	Name = "建议把体型调成1再跑"
})

-- Beach Treadmill (10 Agility)
Tab:AddToggle({
    Name = "沙滩跑步机10",
    Default = false,
    Callback = function(Value)
        getgenv().PPJ10 = Value
        while getgenv().PPJ10 and task.wait() do
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoid then
                    humanoid.WalkSpeed = 10
                end
                
                if rootPart then
                    rootPart.CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874)
                end
            end
            
            local RunService = game:GetService("RunService")
            RunService:BindToRenderStep("PPJ10_move", Enum.RenderPriority.Character.Value + 1, function()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid:Move(Vector3.new(10000, 0, -1), true)
                    end
                end
            end)
        end
        
        if not getgenv().PPJ10 then
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

Tab:AddToggle({
    Name = "健身房跑步机1000",
    Callback = function(Value)
        getgenv().PPJ10 = Value
        
        -- 启动跑步机功能
        if Value then
            -- 设置移动速度并传送到指定位置
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        -- 使用新坐标 (-394.19, 13.23, -262.74)
                        rootPart.CFrame = CFrame.new(-394.19, 13.23, -262.74)
                    end
                end
            end
            
            -- 绑定每帧移动逻辑
            game:GetService("RunService"):BindToRenderStep("PPJ10_move", 
                Enum.RenderPriority.Character.Value + 1, 
                function()
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            
            -- 主循环
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            -- 关闭时解除绑定
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

Tab:AddToggle({
    Name = "冰霜跑步机2000",
    Callback = function(Value)
        getgenv().PPJ10 = Value
        
        -- 启动跑步机功能
        if Value then
            -- 设置移动速度并传送到指定位置
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        -- 使用新坐标 (-2994.07, 14.33, -467.44)
                        rootPart.CFrame = CFrame.new(-2994.07, 14.33, -467.44)
                    end
                end
            end
            
            -- 绑定每帧移动逻辑
            game:GetService("RunService"):BindToRenderStep("PPJ10_move", 
                Enum.RenderPriority.Character.Value + 1, 
                function()
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            
            -- 主循环
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            -- 关闭时解除绑定
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

Tab:AddToggle({
    Name = "神话健身房跑步机3000",
    Callback = function(Value)
        getgenv().PPJ10 = Value
        
        -- 启动跑步机功能
        if Value then
            -- 设置移动速度并传送到指定位置
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        -- 使用新坐标 (2659.45, 21.64, 951.18)
                        rootPart.CFrame = CFrame.new(2659.45, 21.64, 951.18)
                    end
                end
            end
            
            -- 绑定每帧移动逻辑
            game:GetService("RunService"):BindToRenderStep("PPJ10_move", 
                Enum.RenderPriority.Character.Value + 1, 
                function()
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            
            -- 主循环
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            -- 关闭时解除绑定
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

Tab:AddToggle({
    Name = "传奇跑步机10",
    Callback = function(Value)
        getgenv().PPJ10 = Value
        
        -- 启动跑步机功能
        if Value then
            -- 设置移动速度并传送到指定位置
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        -- 使用新坐标 (4362.67, 999.36, -3650.33)
                        rootPart.CFrame = CFrame.new(4362.67, 999.36, -3650.33)
                    end
                end
            end
            
            -- 绑定每帧移动逻辑
            game:GetService("RunService"):BindToRenderStep("PPJ10_move", 
                Enum.RenderPriority.Character.Value + 1, 
                function()
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            
            -- 主循环
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            -- 关闭时解除绑定
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

Tab:AddToggle({
    Name = "丛林跑步机20000",
    Callback = function(Value)
        getgenv().PPJ10 = Value
        
        -- 启动跑步机功能
        if Value then
            -- 设置移动速度并传送到指定位置
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        -- 使用新坐标 (-8133.48, 27.98, 2814.74)
                        rootPart.CFrame = CFrame.new(-8133.48, 27.98, 2814.74)
                    end
                end
            end
            
            -- 绑定每帧移动逻辑
            game:GetService("RunService"):BindToRenderStep("PPJ10_move", 
                Enum.RenderPriority.Character.Value + 1, 
                function()
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            
            -- 主循环
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            -- 关闭时解除绑定
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
    end
})

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

-- 2. 自动售卖
Tab:AddToggle({
    Name = "自动售卖",
    Callback = function(state)
        Interstellar.sell = state
        if Interstellar.sell then
            while Interstellar.sell do
                firetouchinterest(workspace.sellAreaCircles:GetChildren()[20].circleInner, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                firetouchinterest(workspace.sellAreaCircles:GetChildren()[20].circleInner, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                task.wait()
            end
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

-- 4. 收集气（Blue Chi Crate）
Tab:AddToggle({
    Name = "收集气",
    Callback = function(state)
        Interstellar.spawnedCoins = state
        if Interstellar.spawnedCoins then
            while Interstellar.spawnedCoins do
                for i, v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
                    if v.Name == "Blue Chi Crate" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                        wait(2)
                    end
                end
            end
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

-- 1. 最大跳跃次数
Tab:AddButton({
    Name = "最大跳跃次数",
    Callback = function()
        game.Players.LocalPlayer.multiJumpCount.Value = "50"
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

-- 4. 收集所有宝箱
Tab:AddButton({
    Name = "收集所有宝箱",
    Callback = function()
        for _, v in next, workspace:GetChildren() do
            if v.Name:find("Chest") then
                while wait() do
                    firetouchinterest(v.circleInner.CFrame, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    firetouchinterest(v.circleInner.CFrame, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
            end
        end
    end
})

-- 5. 服务器跳转
Tab:AddButton({
    Name = "服务器跳转",
    Callback = function()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false

        -- 读取或初始化服务器ID存储文件
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end

        -- 服务器ID获取与传送逻辑
        function TPReturner()
            local Site
            -- 根据是否有下一页游标拼接请求链接
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end

            local ID = ""
            -- 更新下一页游标
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end

            local num = 0
            for i, v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                -- 筛选非满员服务器
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            -- 排除已记录的服务器ID
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            -- 跨小时时清空历史记录
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end

                    -- 传送至目标服务器
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end

        -- 循环执行跳转逻辑
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end

        Teleport()
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

-- 4. 自动买阶级
Tab:AddToggle({
    Name = "自动买阶级",
    Callback = function(state)
        Interstellar.buy = state
        if Interstellar.buy then
            while Interstellar.buy do
                local buyType = "buyRank"
                local targetRanks = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
                -- 遍历所有Ground阶级购买
                for i = 1, #targetRanks do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetRanks[i])
                    wait()
                end
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

-- 2. 靠近自动攻击(必开)
Tab:AddToggle({
    Name = "靠近自动攻击(必开)",
    Callback = function(state)
        if state then
            -- 清理旧配置与连接（避免重复执行）
            local connections = getgenv().configs and getgenv().configs.connections
            if connections then
                local Disable = getgenv().configs.Disable
                -- 断开所有旧连接
                for _, v in pairs(connections) do
                    v:Disconnect()
                end
                -- 触发关闭事件并销毁
                Disable:Fire()
                Disable:Destroy()
                table.clear(getgenv().configs)
            end

            -- 初始化新配置
            local Disable = Instance.new("BindableEvent")
            getgenv().configs = {
                connections = {},
                Disable = Disable,
                Size = Vector3.new(10, 10, 10), -- 攻击检测范围
                DeathCheck = true -- 是否检测目标存活状态
            }

            -- 服务与变量定义
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local lp = Players.LocalPlayer
            local Run = true -- 循环控制开关
            local Ignorelist = OverlapParams.new()
            Ignorelist.FilterType = Enum.RaycastFilterType.Include -- 检测时仅包含目标实例

            -- 工具函数：获取玩家角色模型
            local function getchar(plr)
                plr = plr or lp
                return plr.Character
            end

            -- 工具函数：获取角色人形对象
            local function gethumanoid(plr)
                local char = plr:IsA("Model") and plr or getchar(plr)
                if char then
                    return char:FindFirstChildWhichIsA("Humanoid")
                end
            end

            -- 工具函数：判断人形是否存活
            local function IsAlive(Humanoid)
                return Humanoid and Humanoid.Health > 0
            end

            -- 工具函数：获取工具的触摸传输器（用于触发攻击）
            local function GetTouchInterest(Tool)
                return Tool and Tool:FindFirstChildWhichIsA("TouchTransmitter", true)
            end

            -- 工具函数：获取所有玩家角色（排除本地玩家）
            local function GetCharacters(LocalPlayerChar)
                local Characters = {}
                for _, v in pairs(Players:GetPlayers()) do
                    table.insert(Characters, getchar(v))
                end
                -- 移除本地玩家角色
                for i, char in pairs(Characters) do
                    if char == LocalPlayerChar then
                        table.remove(Characters, i)
                        break
                    end
                end
                return Characters
            end

            -- 工具函数：执行攻击逻辑（激活工具+触发触摸事件）
            local function Attack(Tool, TouchPart, ToTouch)
                if Tool:IsDescendantOf(workspace) then
                    Tool:Activate()
                    firetouchinterest(TouchPart, ToTouch, 1) -- 触发触摸开始
                    firetouchinterest(TouchPart, ToTouch, 0) -- 触发触摸结束
                end
            end

            -- 添加关闭事件连接（用于开关关闭时终止循环）
            table.insert(getgenv().configs.connections, Disable.Event:Connect(function()
                Run = false
            end))

            -- 自动攻击主循环（每帧检测）
            while Run do
                local char = getchar()
                -- 仅当本地角色存活时执行检测
                if IsAlive(gethumanoid(char)) then
                    local Tool = char and char:FindFirstChildWhichIsA("Tool") -- 获取当前装备的工具
                    local TouchInterest = Tool and GetTouchInterest(Tool) -- 获取工具的触摸传输器

                    if TouchInterest then
                        local TouchPart = TouchInterest.Parent -- 工具的触摸检测部件
                        local Characters = GetCharacters(char) -- 所有目标玩家角色
                        Ignorelist.FilterDescendantsInstances = Characters -- 设置检测过滤列表（仅检测目标角色）

                        -- 检测范围内的部件（触摸部件+配置的检测范围）
                        local InstancesInBox = workspace:GetPartBoundsInBox(
                            TouchPart.CFrame,
                            TouchPart.Size + getgenv().configs.Size,
                            Ignorelist
                        )

                        -- 对检测到的部件执行攻击
                        for _, v in pairs(InstancesInBox) do
                            local Character = v:FindFirstAncestorWhichIsA("Model") -- 获取部件所属的角色模型
                            if table.find(Characters, Character) then -- 确认是目标角色
                                -- 根据配置判断是否检测目标存活状态
                                if getgenv().configs.DeathCheck and IsAlive(gethumanoid(Character)) then
                                    Attack(Tool, TouchPart, v)
                                elseif not getgenv().configs.DeathCheck then
                                    Attack(Tool, TouchPart, v)
                                end
                            end
                        end
                    end
                end
                RunService.Heartbeat:Wait() -- 每帧等待，避免卡顿
            end
        else
            -- 开关关闭时：清理配置与连接，终止攻击循环
            local Disable = getgenv().configs and getgenv().configs.Disable
            if Disable then
                Disable:Fire() -- 触发关闭事件
                Disable:Destroy() -- 销毁事件对象
            end

            -- 断开所有连接并清空配置
            if getgenv().configs and getgenv().configs.connections then
                for _, connection in pairs(getgenv().configs.connections) do
                    connection:Disconnect()
                end
                table.clear(getgenv().configs.connections)
            end
            Run = false -- 强制终止循环
        end
    end
})

