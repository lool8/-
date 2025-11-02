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
    Name = "主要",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddToggle({
    Name = "删除1×4的弹窗［直接删除］",
    Callback = function(state)
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        local LocalPlayer = Players.LocalPlayer
        local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")

        local AutoPopup = {
            Enabled = false,
            Task = nil,
            Connections = {}
        }

        local function deletePopups()
            if not LocalPlayer or not LocalPlayer:FindFirstChild("PlayerGui") then
                return false
            end
            
            local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
            if not tempUI then
                return false
            end
            
            local deleted = false
            for _, popup in ipairs(tempUI:GetChildren()) do
                if popup.Name == "1x1x1x1Popup" then
                    popup:Destroy()
                    deleted = true
                end
            end
            return deleted
        end

        local function triggerEntangled()
            local args = { [1] = "Entangled" }
            pcall(function()
                RemoteEvent:FireServer(unpack(args))
            end)
        end

        local function setupPopupListener()
            if not LocalPlayer:FindFirstChild("PlayerGui") then return end
            
            local tempUI = LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
            if not tempUI then
                tempUI = Instance.new("Folder")
                tempUI.Name = "TemporaryUI"
                tempUI.Parent = LocalPlayer.PlayerGui
            end
            
            AutoPopup.Connections.ChildAdded = tempUI.ChildAdded:Connect(function(child)
                if AutoPopup.Enabled and child.Name == "1x1x1x1Popup" then
                    task.defer(function()
                        child:Destroy()
                    end)
                end
            end)
        end

        local function runMainTask()
            while AutoPopup.Enabled do
                deletePopups()
                triggerEntangled()
                task.wait(0.5)
            end
        end

        local function startAutoPopup()
            if AutoPopup.Enabled then return end
            
            AutoPopup.Enabled = true
            setupPopupListener()
            AutoPopup.Task = task.spawn(runMainTask)
        end

        local function stopAutoPopup()
            if not AutoPopup.Enabled then return end
            
            AutoPopup.Enabled = false
            
            if AutoPopup.Task then
                task.cancel(AutoPopup.Task)
                AutoPopup.Task = nil
            end
            
            for _, connection in pairs(AutoPopup.Connections) do
                connection:Disconnect()
            end
            AutoPopup.Connections = {}
        end

        if state then
            startAutoPopup()
        else
            stopAutoPopup()
        end
    end
})

-- 自动点击1×1×1弹窗 (已修复)
Tab:AddToggle({
    Name = "自动点击1×4弹窗［自动点击］",
    Callback = function(state)
        if state then
            while wait() and state do
                for _, v in next, game.Players.LocalPlayer.PlayerGui.TemporaryUI:GetChildren() do
                    if v.Name == "1x1x1x1Popup" then
                        game.VirtualBallsManager:SendMouseButtonEvent(v.AbsolutePosition.X + (v.AbsoluteSize.X / 2), v.AbsolutePosition.Y + (v.AbsoluteSize.Y / 2), Enum.UserInputType.MouseButton1.Value, true, game.Players.PlayerGui, 1)
                        game.VirtualBallsManager:SendMouseButtonEvent(v.AbsolutePosition.X + (v.AbsoluteSize.X / 2), v.AbsolutePosition.Y + (v.AbsoluteSize.Y / 2), Enum.UserInputType.MouseButton1.Value, false, game.Players.PlayerGui, 1)
                    end
                end
            end
        end
    end
})

-- 自动修电箱
Tab:AddToggle({
    Name = "自动修电机",
    Callback = function(state)
        _G.BTE = state

        local function RepairGenerators()
            local map = workspace:FindFirstChild("Map")
            local ingame = map and map:FindFirstChild("Ingame")
            local currentMap = ingame and ingame:FindFirstChild("Map")

            if currentMap then
                for _, obj in ipairs(currentMap:GetChildren()) do
                    if obj.Name == "Generator" and obj:FindFirstChild("Progress") and obj.Progress.Value < 100 then
                        local remote = obj:FindFirstChild("Remotes") and obj.Remotes:FindFirstChild("RE")
                        if remote then
                            remote:FireServer()
                        end
                    end
                end
            end
        end

        if state then
            task.spawn(function()
                while _G.BTE do
                    RepairGenerators()
                    task.wait(_G.REP or 1.80) 
                end
            end)
        end
    end
})

Tab:AddToggle({
    Name = "自动修电机［随机秒数］",
    Callback = function(state)
        if state then
            while state and wait() do
                wait(6)
                local FartNapFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map")
                if FartNapFolder then
                    local closestGenerator, closestDistance = nil, math.huge
                    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    for _, g in ipairs(FartNapFolder:GetChildren()) do
                        if g.Name == "Generator" and g.Progress.Value < 100 then
                            local distance = (g.Main.Position - playerPosition).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestGenerator = g
                            end
                        end
                    end
                    if closestGenerator then
                        closestGenerator.Remotes.RE:FireServer()
                    end
                end
            end
        end
    end
})

local Tab = Window:MakeTab({
    Name = "体力",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 无限体力(1)
Tab:AddToggle({
    Name = "无限体力(1)",
    Callback = function(state)
        local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        if state then
            while state and wait() do
                sprintModule.StaminaLossDisabled = true
            end
        else
            sprintModule.StaminaLossDisabled = false
        end
    end
})

-- 无限体力(2)
Tab:AddToggle({
    Name = "无限体力(2)",
    Callback = function(state)
        local sprintModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        if state then
            while state and wait() do
                sprintModule.MinStamina = -100000
            end
        else
            sprintModule.MinStamina = 0
        end
    end
})

local Tab = Window:MakeTab({
    Name = "幸存者",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Shedletsky幸存者"
})

-- 自动斩击(被动)
Tab:AddToggle({
    Name = "自动斩击(被动)",
    Callback = function(state)
        local autoSlashEnabled = false
        local slashConnection = nil
        local RunService = game:GetService("RunService")

        local function checkAndSlash()
            local player = game.Players.LocalPlayer
            if not player or not player.Character then return end
            
            local character = player.Character
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            local killersFolder = workspace:FindFirstChild("Players")
            if not killersFolder then return end
            
            local killers = killersFolder:FindFirstChild("Killers")
            if not killers then return end
            
            local playerPosition = humanoidRootPart.Position
            
            for _, killer in ipairs(killers:GetChildren()) do
                local killerRoot = killer:FindFirstChild("HumanoidRootPart")
                if killerRoot then
                    local distance = (playerPosition - killerRoot.Position).Magnitude
                    if distance <= 10 then
                        local args = {
                            [1] = "UseActorAbility",
                            [2] = "Slash"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                        break
                    end
                end
            end
        end

        autoSlashEnabled = state
        
        if state then
            if slashConnection then
                slashConnection:Disconnect()
            end
            slashConnection = RunService.Heartbeat:Connect(function()
                if autoSlashEnabled then
                    checkAndSlash()
                end
            end)
        else
            if slashConnection then
                slashConnection:Disconnect()
                slashConnection = nil
            end
        end
    end
})

-- 自动瞄准
Tab:AddToggle({
    Name = "自动瞄准",
    Callback = function(state)
        local shedletskyAimbotEnabled = false
        local shedloop = nil

        local function shedletskyAimbot(state)
            shedletskyAimbotEnabled = state
            
            if state then
               
                if game:GetService("Players").LocalPlayer.Character.Name ~= "Shedletsky" then
                    return
                end
                
                shedloop = game:GetService("Players").LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
                    if not shedletskyAimbotEnabled then return end
                    if child:IsA("Sound") then 
                        local FAN = child.Name
                        if FAN == "rbxassetid://12222225" or FAN == "83851356262523" then 
                            local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                            if killersFolder then 
                                local killer = killersFolder:FindFirstChildOfClass("Model")
                                if killer and killer:FindFirstChild("HumanoidRootPart") then 
                                    local killerHRP = killer.HumanoidRootPart
                                    local playerHRP = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                    if playerHRP then 
                                        local distance = (killerHRP.Position - playerHRP.Position).Magnitude
                                       
                                        if distance <= 30 then
                                            local num = 1
                                            local maxIterations = 100
                                            while num <= maxIterations do
                                                task.wait(0.01)
                                                num = num + 1
                                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                                playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if shedloop then 
                    shedloop:Disconnect()
                    shedloop = nil
                end
            end
        end

        shedletskyAimbot(state)
    end
})

local Section = Tab:AddSection({
	Name = "Chance幸存者"
})

-- 高级自动瞄准
Tab:AddToggle({
    Name = "高级自动瞄准",
    Callback = function(state)
        local RunService = game:GetService("RunService")
        local LocalPlayer = game:GetService("Players").LocalPlayer

        local PredictionAim = {
            Enabled = false,
            Prediction = 1,
            Duration = 1.7,
            MaxDistance = 50, 
            Targets = { "Jason", "c00lkidd", "JohnDoe", "1x1x1x1", "Noli" },
            TrackedAnimations = {
                ["103601716322988"] = true, ["133491532453922"] = true, ["86371356500204"] = true,
                ["76649505662612"] = true, ["81698196845041"] = true
            },
            Humanoid = nil,
            HRP = nil,
            LastTriggerTime = 0,
            IsAiming = false,
            OriginalState = nil
        }

        local function setupCharacter(char)
            PredictionAim.Humanoid = char:WaitForChild("Humanoid")
            PredictionAim.HRP = char:WaitForChild("HumanoidRootPart")
        end

        local function getValidTarget()
            local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if killersFolder then
                for _, name in ipairs(PredictionAim.Targets) do
                    local target = killersFolder:FindFirstChild(name)
                    if target and target:FindFirstChild("HumanoidRootPart") then
                        if PredictionAim.HRP and (PredictionAim.HRP.Position - target.HumanoidRootPart.Position).Magnitude <= PredictionAim.MaxDistance then
                            return target.HumanoidRootPart
                        end
                    end
                end
            end
            return nil
        end

        local function getPlayingAnimationIds()
            local ids = {}
            if PredictionAim.Humanoid then
                for _, track in ipairs(PredictionAim.Humanoid:GetPlayingAnimationTracks()) do
                    if track.Animation and track.Animation.AnimationId then
                        local id = track.Animation.AnimationId:match("%d+")
                        if id then ids[id] = true end
                    end
                end
            end
            return ids
        end

        local function OnRenderStep()
            if not PredictionAim.Enabled or not PredictionAim.Humanoid or not PredictionAim.HRP then return end
            local playing = getPlayingAnimationIds()
            local triggered = false
            for id in pairs(PredictionAim.TrackedAnimations) do
                if playing[id] then triggered = true; break end
            end

            if triggered then
                PredictionAim.LastTriggerTime = tick()
                PredictionAim.IsAiming = true
            end

            if PredictionAim.IsAiming and tick() - PredictionAim.LastTriggerTime <= PredictionAim.Duration then
                if not PredictionAim.OriginalState then
                    PredictionAim.OriginalState = {
                        WalkSpeed = PredictionAim.Humanoid.WalkSpeed,
                        JumpPower = PredictionAim.Humanoid.JumpPower,
                        AutoRotate = PredictionAim.Humanoid.AutoRotate
                    }
                    PredictionAim.Humanoid.AutoRotate = false
                    PredictionAim.HRP.AssemblyAngularVelocity = Vector3.zero
                end
                local targetHRP = getValidTarget()
                if targetHRP then
                    local predictedPos = targetHRP.Position + (targetHRP.CFrame.LookVector * PredictionAim.Prediction)
                    local direction = (predictedPos - PredictionAim.HRP.Position).Unit
                    local yRot = math.atan2(-direction.X, -direction.Z)
                    PredictionAim.HRP.CFrame = CFrame.new(PredictionAim.HRP.Position) * CFrame.Angles(0, yRot, 0)
                end
            elseif PredictionAim.IsAiming then
                PredictionAim.IsAiming = false
                if PredictionAim.OriginalState then
                    PredictionAim.Humanoid.WalkSpeed = PredictionAim.OriginalState.WalkSpeed
                    PredictionAim.Humanoid.JumpPower = PredictionAim.OriginalState.JumpPower
                    PredictionAim.Humanoid.AutoRotate = PredictionAim.OriginalState.AutoRotate
                    PredictionAim.OriginalState = nil
                end
            end
        end

        if LocalPlayer.Character then setupCharacter(LocalPlayer.Character) end
        LocalPlayer.CharacterAdded:Connect(setupCharacter)
        
        -- 连接渲染步骤事件
        RunService.RenderStepped:Connect(OnRenderStep)

        -- 设置开关状态
        PredictionAim.Enabled = state
    end
})

-- 瞄准预测值输入框 (移到外面来了！)
Tab:AddTextbox({
    Name = "瞄准预测值",
    Default = "1",
    TextDisappear = true,
    Callback = function(inputValue)
        -- 检查 PredictionAim 是否存在
        if _G.PredictionAim then
            local num = tonumber(inputValue)
            if num and num >= 1 and num <= 10 then
                _G.PredictionAim.Prediction = num
            else
                warn("请输入1到10之间的有效数字")
            end
        else
            -- 如果 PredictionAim 不存在，我们需要先创建它
            _G.PredictionAim = { Prediction = 1 }
            local num = tonumber(inputValue)
            if num and num >= 1 and num <= 10 then
                _G.PredictionAim.Prediction = num
            else
                warn("请输入1到10之间的有效数字")
            end
        end
    end
})

-- 自动翻转硬币(3)
Tab:AddToggle({
    Name = "自动翻转硬币(3)［直到翻到3］",
    Callback = function(state)
        local AutoFlipCoins = false
        local flipCoinsThread = nil
        
        AutoFlipCoins = state
        
        if AutoFlipCoins then
            flipCoinsThread = task.spawn(function()
                while AutoFlipCoins and task.wait() do
                    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                    local chargesText = playerGui:FindFirstChild("MainUI") and 
                                       playerGui.MainUI:FindFirstChild("AbilityContainer") and
                                       playerGui.MainUI.AbilityContainer:FindFirstChild("Shoot") and
                                       playerGui.MainUI.AbilityContainer.Shoot:FindFirstChild("Charges")
                    
                    if chargesText and chargesText:IsA("TextLabel") and chargesText.Text == "3" then
                        break
                    else
                        local args = {
                            [1] = "UseActorAbility",
                            [2] = "CoinFlip"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    end
                end
            end)
        elseif flipCoinsThread then
            task.cancel(flipCoinsThread)
            flipCoinsThread = nil
        end
    end
})

-- 自动翻转硬币(1)
Tab:AddToggle({
    Name = "自动翻转硬币(1)［直到减少到1］",
    Callback = function(state)
        local AutoFlipCoins = false
        local flipCoinsThread = nil
        
        AutoFlipCoins = state
        
        if AutoFlipCoins then
            flipCoinsThread = task.spawn(function()
                while AutoFlipCoins and task.wait() do
                    local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
                    local chargesText = playerGui:FindFirstChild("MainUI") and 
                                       playerGui.MainUI:FindFirstChild("AbilityContainer") and
                                       playerGui.MainUI.AbilityContainer:FindFirstChild("Shoot") and
                                       playerGui.MainUI.AbilityContainer.Shoot:FindFirstChild("Charges")
                    
                    if chargesText and chargesText:IsA("TextLabel") and chargesText.Text == "1" then
                        break
                    else
                        local args = {
                            [1] = "UseActorAbility",
                            [2] = "CoinFlip"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                    end
                end
            end)
        elseif flipCoinsThread then
            task.cancel(flipCoinsThread)
            flipCoinsThread = nil
        end
    end
})

local Section = Tab:AddSection({
	Name = "Guest 1337幸存者［牢达! man!😋］"
})

-- 自动格挡
Tab:AddToggle({
    Name = "自动格挡",
    Callback = function(enabled)
        if not _G.AutoBlockSystem then
            _G.AutoBlockSystem = {
                Active = false,
                SteppedConnection = nil
            }
        end
        
        local config = {
            BlockDistance = 15,
            ScanInterval = 0.05,
            BlockCooldown = 0.5,
            DebugMode = false, -- 为了不刷屏，默认关闭调试模式
            TargetSoundIds = {
                "rbxassetid://102228729296384",
                "rbxassetid://140242176732868",
                "rbxassetid://12222216",
                "rbxassetid://86174610237192",
                "rbxassetid://101199185291628",
                "rbxassetid://95079963655241",
                "rbxassetid://112809109188560",
                "rbxassetid://84307400688050",
                "rbxassetid://136323728355613",
                "rbxassetid://115026634746636"
            }
        }

        local LocalPlayer = game:GetService("Players").LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RemoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
        local lastBlockTime = 0

        local function HasTargetSound(character)
            if not character then return false end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                for _, child in ipairs(humanoidRootPart:GetDescendants()) do
                    if child:IsA("Sound") then
                        for _, targetId in ipairs(config.TargetSoundIds) do
                            if child.SoundId == targetId then
                                if config.DebugMode then
                                    print("Audio detected:", humanoidRootPart:GetFullName(), "ID:", child.SoundId)
                                end
                                return true
                            end
                        end
                    end
                end
            end
            
            for _, sound in ipairs(character:GetDescendants()) do
                if sound:IsA("Sound") then
                    for _, targetId in ipairs(config.TargetSoundIds) do
                        if sound.SoundId == targetId then
                            if config.DebugMode then
                                print("Audio detected:", sound:GetFullName(), "ID:", sound.SoundId)
                            end
                            return true
                        end
                    end
                end
            end
            
            return false
        end

        local function GetKillersInRange()
            local killers = {}
            local killersFolder = workspace:FindFirstChild("Killers") or (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers"))
            if not killersFolder then return killers end
            
            local myCharacter = LocalPlayer.Character
            if not myCharacter or not myCharacter:FindFirstChild("HumanoidRootPart") then return killers end
            
            local myPos = myCharacter.HumanoidRootPart.Position
            
            for _, killer in ipairs(killersFolder:GetChildren()) do
                if killer:FindFirstChild("HumanoidRootPart") then
                    local distance = (killer.HumanoidRootPart.Position - myPos).Magnitude
                    if distance <= config.BlockDistance then
                        table.insert(killers, killer)
                    end
                end
            end
            
            return killers
        end

        local function PerformBlock()
            if os.clock() - lastBlockTime >= config.BlockCooldown then
                RemoteEvent:FireServer("UseActorAbility", "Block")
                lastBlockTime = os.clock()
                if config.DebugMode then
                    print("Block performed at:", os.clock())
                end
            end
        end

        local function CheckConditions()
            local killers = GetKillersInRange()
            
            for _, killer in ipairs(killers) do
                if HasTargetSound(killer) then
                    PerformBlock()
                    break
                end
            end
        end

        if not enabled then
            if _G.AutoBlockSystem.Active then
                if _G.AutoBlockSystem.SteppedConnection then
                    _G.AutoBlockSystem.SteppedConnection:Disconnect()
                end
                print("Auto Block system disabled")
                _G.AutoBlockSystem.Active = false
            end
            return
        end
        
        if _G.AutoBlockSystem.Active then
            return
        end
        
        _G.AutoBlockSystem.Active = true
        
        if not LocalPlayer.Character then
            LocalPlayer.CharacterAdded:Wait()
        end

        _G.AutoBlockSystem.SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
            pcall(CheckConditions)
        end)
        
        print("Auto Block system enabled")
        print("Range:", config.BlockDistance, "m | Audio IDs:", #config.TargetSoundIds)
    end
})

local Tab = Window:MakeTab({
    Name = "绘制危险类",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 绘制陷阱范围
Tab:AddToggle({
    Name = "绘制陷阱范围",
    Callback = function(state)
        if not _G.ShadowTrapESP then
            _G.ShadowTrapESP = {
                Active = false,
                Shadow = nil,
                Highlight = nil,
                Billboard = nil,
                BoxHandle = nil,
                HeartbeatConnection = nil
            }
        end
        
        if not state then
            if _G.ShadowTrapESP.Active then
                if _G.ShadowTrapESP.Highlight and _G.ShadowTrapESP.Highlight.Parent then
                    _G.ShadowTrapESP.Highlight:Destroy()
                end
                if _G.ShadowTrapESP.Billboard and _G.ShadowTrapESP.Billboard.Parent then
                    _G.ShadowTrapESP.Billboard:Destroy()
                end
                if _G.ShadowTrapESP.BoxHandle and _G.ShadowTrapESP.BoxHandle.Parent then
                    _G.ShadowTrapESP.BoxHandle:Destroy()
                end
                if _G.ShadowTrapESP.HeartbeatConnection then
                    _G.ShadowTrapESP.HeartbeatConnection:Disconnect()
                end
                
                _G.ShadowTrapESP.Active = false
                _G.ShadowTrapESP.Shadow = nil
            end
            return
        end
        
        if _G.ShadowTrapESP.Active then
            return
        end
        
        _G.ShadowTrapESP.Active = true
        
        local function findShadowInFolder(folder)
            for _, child in ipairs(folder:GetChildren()) do
                if child.Name == "Shadow" then
                    return child
                elseif child:IsA("Folder") or child:IsA("Model") then
                    local found = findShadowInFolder(child)
                    if found then return found end
                end
            end
            return nil
        end

        local shadow = findShadowInFolder(workspace.Map.Ingame)
        _G.ShadowTrapESP.Shadow = shadow

        if shadow then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
            local function getObjectSize(obj)
                if obj:IsA("BasePart") then
                    return obj.Size
                elseif obj:IsA("Model") and obj.PrimaryPart then
                    local cf = obj:GetBoundingBox()
                    return (cf[2] - cf[1]).Magnitude
                else
                    return Vector3.new(5, 5, 5) 
                end
            end
            
            local objectSize = getObjectSize(shadow)
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "ShadowRangeIndicator"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.8
            highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
            highlight.OutlineTransparency = 0.5
            highlight.Parent = shadow
            _G.ShadowTrapESP.Highlight = highlight

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ShadowNameDisplay"
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 180, 0, 60) 
            billboard.StudsOffset = Vector3.new(0, objectSize.Y/2 + 2, 0) 
            billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            billboard.Parent = shadow
            _G.ShadowTrapESP.Billboard = billboard
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "TrapLabel"
            textLabel.Text = "TRAP"
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.Position = UDim2.new(0, 0, 0, 0) 
            textLabel.Font = Enum.Font.Arcade 
            textLabel.TextSize = 18  
            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) 
            textLabel.BackgroundTransparency = 1 
            textLabel.TextStrokeTransparency = 0 
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) 
            textLabel.TextXAlignment = Enum.TextXAlignment.Center
            textLabel.TextYAlignment = Enum.TextYAlignment.Center
            textLabel.Parent = billboard

            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Name = "DistanceLabel"
            distanceLabel.Text = "Distance: Calculating..."
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0) 
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0) 
            distanceLabel.Font = Enum.Font.Arcade 
            distanceLabel.TextSize = 14  
            distanceLabel.TextColor3 = Color3.fromRGB(0, 255, 255) 
            distanceLabel.BackgroundTransparency = 1 
            distanceLabel.TextStrokeTransparency = 0 
            distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) 
            distanceLabel.TextXAlignment = Enum.TextXAlignment.Center
            distanceLabel.TextYAlignment = Enum.TextYAlignment.Center
            distanceLabel.Parent = billboard
            
            if shadow:IsA("BasePart") then
                local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                boxHandleAdornment.Name = "SizeIndicator"
                boxHandleAdornment.Adornee = shadow
                boxHandleAdornment.AlwaysOnTop = true
                boxHandleAdornment.Size = shadow.Size
                boxHandleAdornment.Transparency = 0.7
                boxHandleAdornment.Color3 = Color3.fromRGB(255, 50, 50)
                boxHandleAdornment.ZIndex = 10
                boxHandleAdornment.Parent = shadow
                _G.ShadowTrapESP.BoxHandle = boxHandleAdornment
            end
            
            local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not shadow or not shadow.Parent then return end
                if not humanoidRootPart or not humanoidRootPart.Parent then return end
                
                local distance = (humanoidRootPart.Position - shadow.Position).Magnitude
                distanceLabel.Text = string.format("Distance: %.1f m", distance)  
                
                local baseScale = math.clamp(40 / math.max(1, distance), 0.4, 1.8) 
                
                textLabel.TextSize = 18 * baseScale
                distanceLabel.TextSize = 14 * baseScale
                
                local overallTransparency = math.clamp(distance / 80, 0.1, 0.4)
                
                local strokeTransparency = overallTransparency * 0.1 
                textLabel.TextStrokeTransparency = strokeTransparency
                distanceLabel.TextStrokeTransparency = strokeTransparency
                
                highlight.FillTransparency = math.clamp(distance/70, 0.3, 0.8)
            end)
            _G.ShadowTrapESP.HeartbeatConnection = heartbeatConnection
        end
    end
})

-- 高亮Taph绊线陷阱
Tab:AddToggle({
    Name = "高亮Taph绊线陷阱",
    Callback = function(enabled)
        if not _G.TaphTripwireESP then
            _G.TaphTripwireESP = {
                Active = false,
                DescendantConnection = nil,
                PlayerChattedConnection = nil
            }
        end
        
        local DEEP_PURPLE = Color3.fromRGB(102, 0, 153)

        local HIGHLIGHT_SETTINGS = {
            FillColor = DEEP_PURPLE,
            OutlineColor = DEEP_PURPLE,
            FillTransparency = 0.2,
            OutlineTransparency = 0,
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
            OutlineThickness = 2,
        }

        local function clearExistingHighlights()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Highlight") and obj.Name == "TaphTripwire_DeepPurpleHighlight" then
                    obj:Destroy()
                end
            end
        end

        local function getTargetFolder()
            local map = workspace:FindFirstChild("Map")
            if not map then return nil end
            local ingame = map:FindFirstChild("Ingame")
            if not ingame then return nil end
            return ingame
        end

        local function applyDeepPurpleHighlight(obj)
            local highlight = Instance.new("Highlight")
            highlight.Name = "TaphTripwire_DeepPurpleHighlight"
            highlight.Parent = obj
            for setting, value in pairs(HIGHLIGHT_SETTINGS) do
                highlight[setting] = value
            end
            if obj:IsA("BasePart") then
                local glow = Instance.new("SurfaceAppearance")
                glow.ColorMap = DEEP_PURPLE
                glow.Parent = obj
            end
        end

        local function highlightTaphTripwireObjects()
            clearExistingHighlights()
            local targetFolder = getTargetFolder()
            if not targetFolder then return end
            local count = 0
            for _, obj in pairs(targetFolder:GetDescendants()) do
                if obj.Name:find("TaphTripwire") then
                    applyDeepPurpleHighlight(obj)
                    count += 1
                end
            end
            print("高亮完成 数量: "..count)
            
            if _G.TaphTripwireESP.DescendantConnection then
                _G.TaphTripwireESP.DescendantConnection:Disconnect()
            end
            
            _G.TaphTripwireESP.DescendantConnection = targetFolder.DescendantAdded:Connect(function(newObj)
                if newObj.Name:find("TaphTripwire") then
                    applyDeepPurpleHighlight(newObj)
                end
            end)
        end

        if not enabled then
            if _G.TaphTripwireESP.Active then
                clearExistingHighlights()
                if _G.TaphTripwireESP.DescendantConnection then
                    _G.TaphTripwireESP.DescendantConnection:Disconnect()
                end
                if _G.TaphTripwireESP.PlayerChattedConnection then
                    _G.TaphTripwireESP.PlayerChattedConnection:Disconnect()
                end
                _G.TaphTripwireESP.Active = false
            end
            return
        end
        
        if _G.TaphTripwireESP.Active then
            return
        end
        
        _G.TaphTripwireESP.Active = true
        
        highlightTaphTripwireObjects()
        
        game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
            Text = "输入 /highlighttaph 重新执行高亮",
            Color = DEEP_PURPLE,
            Font = Enum.Font.SourceSansBold
        })
        
        _G.TaphTripwireESP.PlayerChattedConnection = game:GetService("Players").PlayerAdded:Connect(function(player)
            player.Chatted:Connect(function(msg)
                if msg:lower() == "/highlighttaph" then
                    highlightTaphTripwireObjects()
                end
            end)
        end)
    end
})

local Tab = Window:MakeTab({
    Name = "绘制",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 绘制假电机
Tab:AddToggle({
    Name = "绘制假电机",
    Callback = function(enabled)
        if not _G.FakeGeneratorESP then
            _G.FakeGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.FakeGeneratorESP.Active then
                for _, connection in _G.FakeGeneratorESP.Connections do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in _G.FakeGeneratorESP.Data do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.NameLabel and data.NameLabel.Parent then
                            data.NameLabel:Destroy()
                        end
                    end
                end
                
                _G.FakeGeneratorESP.Data = {}
                _G.FakeGeneratorESP.Connections = {}
                _G.FakeGeneratorESP.Active = false
            end
            return
        end
        
        if _G.FakeGeneratorESP.Active then
            return
        end
        
        _G.FakeGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function createFakeGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.FakeGeneratorESP.Data[gen] then 
                return 
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "FakeGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local nameBillboard = Instance.new("BillboardGui")
            nameBillboard.Name = "FakeGeneratorNameESP"
            nameBillboard.Size = UDim2.new(4, 0, 1, 0)
            nameBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
            nameBillboard.Adornee = gen.Main
            nameBillboard.Parent = gen.Main
            nameBillboard.AlwaysOnTop = true
            nameBillboard.Enabled = true
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextScaled = false
            nameLabel.Text = "假电机"
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.Arcade
            nameLabel.TextStrokeTransparency = 0
            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            nameLabel.TextSize = 12
            nameLabel.Parent = nameBillboard
            
            _G.FakeGeneratorESP.Data[gen] = {
                Highlight = highlight,
                NameLabel = nameLabel,
                NameBillboard = nameBillboard
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.FakeGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        for gen in mapSubFolder:GetDescendants() do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "FakeGenerator" then
                                createFakeGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
        
        local mainConnection
        local mapFolder = workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                local mapSubFolder = ingameFolder:FindFirstChild("Map")
                if mapSubFolder then
                    mainConnection = mapSubFolder.DescendantAdded:Connect(function(v)
                        if v:IsA("Model") and v:FindFirstChild("Main") and v.Name == "FakeGenerator" then
                            createFakeGeneratorESP(v)
                        end
                    end)
                end
            end
        end
        
        if mainConnection then
            table.insert(_G.FakeGeneratorESP.Connections, mainConnection)
        end
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
            end
            
            local gensToRemove = {}
            for gen, data in _G.FakeGeneratorESP.Data do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                end
            end
            
            for _, gen in gensToRemove do
                if _G.FakeGeneratorESP.Data[gen] then
                    if _G.FakeGeneratorESP.Data[gen].Highlight then 
                        _G.FakeGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameLabel then 
                        _G.FakeGeneratorESP.Data[gen].NameLabel:Destroy() 
                    end
                    if _G.FakeGeneratorESP.Data[gen].NameBillboard then 
                        _G.FakeGeneratorESP.Data[gen].NameBillboard:Destroy() 
                    end
                    _G.FakeGeneratorESP.Data[gen] = nil
                end
            end
        end)
        
        table.insert(_G.FakeGeneratorESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

-- 绘制真电机
Tab:AddToggle({
    Name = "绘制真电机",
    Callback = function(enabled)
        if not _G.RealGeneratorESP then
            _G.RealGeneratorESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.RealGeneratorESP.Active then
                for _, connection in _G.RealGeneratorESP.Connections do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in _G.RealGeneratorESP.Data do
                    if type(data) == "table" then
                        if data.Billboard and data.Billboard.Parent then
                            data.Billboard:Destroy()
                        end
                        if data.DistanceBillboard and data.DistanceBillboard.Parent then
                            data.DistanceBillboard:Destroy()
                        end
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                    end
                end
                
                _G.RealGeneratorESP.Data = {}
                _G.RealGeneratorESP.Connections = {}
                _G.RealGeneratorESP.Active = false
            end
            return
        end
        
        if _G.RealGeneratorESP.Active then
            return
        end
        
        _G.RealGeneratorESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        local maxGenerators = 20
        
        local distanceSettings = {
            MinDistance = 5,
            MaxDistance = 500,
            MinScale = 0.8,
            MaxScale = 1.5,
            MinTextSize = 8,
            MaxTextSize = 10
        }
        
        local function updateGeneratorESP(gen, data)
            if not gen or not gen.Parent or not gen:FindFirstChild("Main") then
                return false
            end
            
            if #_G.RealGeneratorESP.Data > maxGenerators then
                return false
            end
            
            if gen:FindFirstChild("Progress") then
                local progress = gen.Progress.Value
                if progress >= 99 then
                    return false
                end
                
                if data.TextLabel then
                    data.TextLabel.Text = string.format("真电机: %d%%", progress)
                end
                
                local character = game:GetService("Players").LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart and data.DistanceLabel then
                    local distance = (gen.Main.Position - humanoidRootPart.Position).Magnitude
                    
                    data.DistanceLabel.Text = string.format("距离: %d米", math.floor(distance))
                    
                    local distanceRatio = math.clamp(
                        (distance - distanceSettings.MinDistance) / 
                        (distanceSettings.MaxDistance - distanceSettings.MinDistance),
                        0, 1
                    )
                    
                    local scale = distanceSettings.MinScale + 
                        distanceRatio * (distanceSettings.MaxScale - distanceSettings.MinScale)
                    
                    local textSize = distanceSettings.MinTextSize + 
                        distanceRatio * (distanceSettings.MaxTextSize - distanceSettings.MinTextSize)
                    
                    if data.Billboard then 
                        data.Billboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.Billboard.Enabled = true
                    end
                    
                    if data.DistanceBillboard then 
                        data.DistanceBillboard.Size = UDim2.new(4 * scale, 0, 1 * scale, 0)
                        data.DistanceBillboard.Enabled = true
                    end
                    
                    if data.TextLabel then 
                        data.TextLabel.TextSize = textSize
                        data.TextLabel.Visible = true
                    end
                    
                    if data.DistanceLabel then 
                        data.DistanceLabel.TextSize = textSize
                        data.DistanceLabel.Visible = true
                    end
                    
                    if data.Highlight then
                        data.Highlight.Enabled = true
                        local transparency = math.clamp((distance - 50) / 100, 0, 0.4)
                        data.Highlight.FillTransparency = 0.85 + (transparency * 0.5)
                        data.Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
                        data.Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    end
                end
            end
            
            return true
        end
        
        local function createGeneratorESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.RealGeneratorESP.Data[gen] then 
                return 
            end
            
            if #_G.RealGeneratorESP.Data >= maxGenerators then
                return
            end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "RealGeneratorESP"
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            billboard.Enabled = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 0.5, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextScaled = false
            textLabel.Text = "真电机加载中..."
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            textLabel.Font = Enum.Font.Arcade
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextSize = 8
            textLabel.Parent = billboard
            
            local distanceBillboard = Instance.new("BillboardGui")
            distanceBillboard.Name = "RealGeneratorDistanceESP"
            distanceBillboard.Size = UDim2.new(4, 0, 1, 0)
            distanceBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
            distanceBillboard.Adornee = gen.Main
            distanceBillboard.Parent = gen.Main
            distanceBillboard.AlwaysOnTop = true
            distanceBillboard.Enabled = true
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.TextScaled = false
            distanceLabel.Text = "计算距离中..."
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            distanceLabel.Font = Enum.Font.Arcade
            distanceLabel.TextStrokeTransparency = 0
            distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            distanceLabel.TextSize = 8
            distanceLabel.Parent = distanceBillboard
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "RealGeneratorHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.FillTransparency = 0.9
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            _G.RealGeneratorESP.Data[gen] = {
                Billboard = billboard,
                DistanceBillboard = distanceBillboard,
                TextLabel = textLabel,
                DistanceLabel = distanceLabel,
                Highlight = highlight
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.RealGeneratorESP.Data[gen] then
                    if _G.RealGeneratorESP.Data[gen].Billboard then 
                        _G.RealGeneratorESP.Data[gen].Billboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].DistanceBillboard then 
                        _G.RealGeneratorESP.Data[gen].DistanceBillboard:Destroy() 
                    end
                    if _G.RealGeneratorESP.Data[gen].Highlight then 
                        _G.RealGeneratorESP.Data[gen].Highlight:Destroy() 
                    end
                    _G.RealGeneratorESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.RealGeneratorESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            local mapFolder = workspace:FindFirstChild("Map")
            if mapFolder then
                local ingameFolder = mapFolder:FindFirstChild("Ingame")
                if ingameFolder then
                    local mapSubFolder = ingameFolder:FindFirstChild("Map")
                    if mapSubFolder then
                        for gen in mapSubFolder:GetDescendants() do
                            if gen:IsA("Model") and gen:FindFirstChild("Main") and gen.Name == "Generator" then
                                createGeneratorESP(gen)
                            end
                        end
                    end
                end
            end
        end
                local updateConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not _G.RealGeneratorESP.Active then return end
            
            local currentTime = os.clock()
            if currentTime - lastScanTime >= scanInterval then
                scanGenerators()
                lastScanTime = currentTime
            end
            
            for gen, data in _G.RealGeneratorESP.Data do
                if not updateGeneratorESP(gen, data) then
                    if data.Billboard then data.Billboard.Enabled = false end
                    if data.DistanceBillboard then data.DistanceBillboard.Enabled = false end
                    if data.Highlight then data.Highlight.Enabled = false end
                end
            end
        end)
        
        table.insert(_G.RealGeneratorESP.Connections, updateConnection)
        
        scanGenerators()
    end
})

-- 绘制Noli传送电机
Tab:AddToggle({
    Name = "绘制Noli即将传送的电机",
    Callback = function(enabled)
        if not _G.NoliWarningESP then
            _G.NoliWarningESP = {
                Active = false,
                Data = {},
                Connections = {}
            }
        end
        
        if not enabled then
            if _G.NoliWarningESP.Active then
                for _, connection in _G.NoliWarningESP.Connections do
                    if connection and connection.Connected then
                        connection:Disconnect()
                    end
                end
                
                for gen, data in _G.NoliWarningESP.Data do
                    if type(data) == "table" then
                        if data.Highlight and data.Highlight.Parent then
                            data.Highlight:Destroy()
                        end
                        if data.Label and data.Label.Parent then
                            data.Label:Destroy()
                        end
                    end
                end
                
                _G.NoliWarningESP.Data = {}
                _G.NoliWarningESP.Connections = {}
                _G.NoliWarningESP.Active = false
            end
            return
        end
        
        if _G.NoliWarningESP.Active then
            return
        end
        
        _G.NoliWarningESP.Active = true
        
        local scanInterval = 1.0
        local lastScanTime = 0
        
        local function hasNoliWarning(gen)
            if string.find(gen.Name, "NoliWarningIncoming") then
                return true
            end
            
            for child in gen:GetDescendants() do
                if (child:IsA("StringValue") or child:IsA("ObjectValue")) and 
                   string.find(tostring(child.Value), "NoliWarningIncoming") then
                    return true
                elseif child:IsA("BasePart") and string.find(child.Name, "NoliWarningIncoming") then
                    return true
                end
            end
            
            return false
        end
        
        local function createNoliWarningESP(gen)
            if not gen or not gen:FindFirstChild("Main") or _G.NoliWarningESP.Data[gen] then 
                return 
            end
            
            if not hasNoliWarning(gen) then
                return
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NoliWarningHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Enabled = true
            highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
            highlight.FillTransparency = 0.7
            highlight.OutlineTransparency = 0
            highlight.Parent = gen
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NoliWarningBillboard"
            billboard.Size = UDim2.new(6, 0, 2, 0)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Adornee = gen.Main
            billboard.Parent = gen.Main
            billboard.AlwaysOnTop = true
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "[Noli即将传送]"
            label.TextColor3 = Color3.fromRGB(255, 0, 255)
            label.Font = Enum.Font.Arcade
            label.TextSize = 14
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.Parent = billboard
            
            _G.NoliWarningESP.Data[gen] = {
                Highlight = highlight,
                Label = label,
                Billboard = billboard,
                LastCheck = os.time()
            }
            
            local destroyConnection
            destroyConnection = gen.Destroying:Connect(function()
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
                if destroyConnection then
                    destroyConnection:Disconnect()
                end
            end)
            
            table.insert(_G.NoliWarningESP.Connections, destroyConnection)
        end
        
        local function scanGenerators()
            for gen in workspace:GetDescendants() do
                if gen:IsA("Model") and gen:FindFirstChild("Main") and 
                   (gen.Name == "Generator" or gen.Name == "FakeGenerator") then
                    createNoliWarningESP(gen)
                end
            end
        end
        
        local function updateExistingGenerators()
            local gensToRemove = {}
            for gen, data in _G.NoliWarningESP.Data do
                if not gen or not gen.Parent then
                    table.insert(gensToRemove, gen)
                else
                    if os.time() - data.LastCheck > 5 then
                        if not hasNoliWarning(gen) then
                            table.insert(gensToRemove, gen)
                        else
                            data.LastCheck = os.time()
                        end
                    end
                end
            end
            
            for _, gen in gensToRemove do
                if _G.NoliWarningESP.Data[gen] then
                    if _G.NoliWarningESP.Data[gen].Highlight then 
                        _G.NoliWarningESP.Data[gen].Highlight:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Label then 
                        _G.NoliWarningESP.Data[gen].Label:Destroy() 
                    end
                    if _G.NoliWarningESP.Data[gen].Billboard then 
                        _G.NoliWarningESP.Data[gen].Billboard:Destroy() 
                    end
                    _G.NoliWarningESP.Data[gen] = nil
                end
            end
        end
        
        local mainConnection = workspace.DescendantAdded:Connect(function(v)
            if v:IsA("Model") and v:FindFirstChild("Main") and 
               (v.Name == "Generator" or v.Name == "FakeGenerator") then
                createNoliWarningESP(v)
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, mainConnection)
        
        local heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            lastScanTime = lastScanTime + deltaTime
            if lastScanTime >= scanInterval then
                lastScanTime = 0
                scanGenerators()
                updateExistingGenerators()
            end
        end)
        
        table.insert(_G.NoliWarningESP.Connections, heartbeatConnection)
        
        scanGenerators()
    end
})

local Tab = Window:MakeTab({
    Name = "透视",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 透视NPC
Tab:AddToggle({
    Name = "透视NPC",
    Callback = function(state)
        if state then
            -- 检查文件夹是否存在
            local npcsFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Lobby") and workspace.Map.Lobby:FindFirstChild("NPCs")
            if npcsFolder then
                for _,v in next, npcsFolder:GetChildren() do
                    if v:IsA("Model") then
                        ESPNPCS(v.Name, v, Color3.new(0, 0, 1))
                    end
                end
                
                -- 保存连接到变量，以便后续断开
                local npcChildAddedConn
                npcChildAddedConn = npcsFolder.ChildAdded:Connect(function(v)
                    if v:IsA("Model") and state then
                        ESPNPCS(v.Name, v, Color3.new(0, 0, 1))
                    else
                        -- 如果状态已关闭，断开连接
                        npcChildAddedConn:Disconnect()
                    end
                end)
            end
        else
            -- 安全地销毁ESP
            local espFolder = workspace:FindFirstChild("NPCESPFloder")
            if espFolder then
                espFolder:Destroy()
            end
        end
    end
})

-- 透视杀手
Tab:AddToggle({
    Name = "透视杀手",
    Callback = function(state)
        if state then
            -- 检查文件夹是否存在
            local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
            if killersFolder then
                for _,v in next, killersFolder:GetChildren() do
                    if v:IsA("Model") then
                        ESPKiller(v.Name, v, Color3.new(1, 0, 1)) -- 修正颜色值 (255,0,255) -> (1,0,1)
                    end
                end
                
                local killerChildAddedConn
                killerChildAddedConn = killersFolder.ChildAdded:Connect(function(v)
                    if v:IsA("Model") and state then
                        ESPKiller(v.Name, v, Color3.new(1, 0, 1)) -- 修正颜色值
                    else
                        killerChildAddedConn:Disconnect()
                    end
                end)
            end
        else 
            local espFolder = workspace:FindFirstChild("KillerESPFloder")
            if espFolder then
                espFolder:Destroy()
            end
        end
    end
})

-- 透视幸存者
Tab:AddToggle({
    Name = "透视幸存者",
    Callback = function(state)
        if state then
            -- 检查文件夹是否存在
            local survivorsFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
            if survivorsFolder then
                for _,v in next, survivorsFolder:GetChildren() do
                    if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name then
                        ESPSurvivors(v.Name, v, Color3.new(0, 1, 0))
                    end
                end
                
                local survivorChildAddedConn
                survivorChildAddedConn = survivorsFolder.ChildAdded:Connect(function(v)
                    if v:IsA("Model") and state then
                        ESPSurvivors(v.Name, v, Color3.new(0, 1, 0)) -- 修正颜色值 (0,0,1) -> (0,1,0)
                    else
                        survivorChildAddedConn:Disconnect()
                    end
                end)
            end
        else
            local espFolder = workspace:FindFirstChild("SurvivorsESPFloder")
            if espFolder then
                espFolder:Destroy()
            end
        end
    end
})

-- 透视工具
Tab:AddToggle({
    Name = "透视工具",
    Callback = function(state)
        if state then
            -- 检查文件夹是否存在
            local ingameFolder = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")
            if ingameFolder then
                for _,v in next, ingameFolder:GetChildren() do
                    if v:IsA("Tool") then
                        ESPTool(v.Name, v, Color3.new(1, 1, 1)) -- 修正颜色值 (255,255,255) -> (1,1,1)
                    end
                end
                
                local toolChildAddedConn
                toolChildAddedConn = ingameFolder.ChildAdded:Connect(function(v)
                    if v:IsA("Tool") and state then
                        ESPTool(v.Name, v, Color3.new(1, 1, 1)) -- 修正颜色值
                    else
                        toolChildAddedConn:Disconnect()
                    end
                end)
            end
        else
            local espFolder = workspace:FindFirstChild("ToolESPFloder")
            if espFolder then
                espFolder:Destroy()
            end
        end
    end
})

local Tab = Window:MakeTab({
    Name = "娱乐",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "玩家手上抬45°其他玩家可以看见"
})

-- 角色动画修改
Tab:AddToggle({
    Name = "角色动画修改",
    Callback = function(state)
        -- 确保 _G 表中有 AnimMod 字段，用于存储全局状态
        if not _G.AnimMod then
            _G.AnimMod = {
                isActive = false,
                connections = {},
                tracks = {}
            }
        end

        if state then
            if _G.AnimMod.isActive then return end -- 防止重复激活
            
            local Players     = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local firstAnimId  = "rbxassetid://77894750279891"
            local secondAnimId = "rbxassetid://98261071866527"
            local secondPause  = 0.33
            
            local function loadAndPause(humanoid, assetId, t, priority)
                local anim = Instance.new("Animation")
                anim.AnimationId = assetId
                local track = humanoid:LoadAnimation(anim)
                track.Priority = priority
                track:Play()
                track.TimePosition = t
                track:AdjustSpeed(0)
                return track
            end
            
            do
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid  = character:WaitForChild("Humanoid")
                
                -- 保存动画轨道引用，以便后续停止
                local firstTrack  = loadAndPause(humanoid, firstAnimId, 0.3, Enum.AnimationPriority.Action)
                local secondTrack = loadAndPause(humanoid, secondAnimId, secondPause, Enum.AnimationPriority.Core)
                
                table.insert(_G.AnimMod.tracks, firstTrack)
                table.insert(_G.AnimMod.tracks, secondTrack)
                
                -- 保存连接引用
                local runningConn = humanoid.Running:Connect(function(speed)
                    if speed == 0 then
                        task.wait(0.05)
                        if humanoid and humanoid.Parent then
                            local newSecondTrack = loadAndPause(humanoid, secondAnimId, secondPause, Enum.AnimationPriority.Core)
                            table.insert(_G.AnimMod.tracks, newSecondTrack)
                            secondTrack = newSecondTrack
                        end
                    else
                        if secondTrack and secondTrack.IsPlaying then
                            secondTrack:Stop()
                        end
                    end
                end)
                
                table.insert(_G.AnimMod.connections, runningConn)
            end
            
            _G.AnimMod.isActive = true
        else
            if not _G.AnimMod.isActive then return end -- 防止重复关闭
            
            -- 停止所有自定义动画轨道
            for _, track in ipairs(_G.AnimMod.tracks) do
                if track and track.IsPlaying then
                    track:Stop()
                end
            end
            
            -- 断开所有连接
            for _, conn in ipairs(_G.AnimMod.connections) do
                if conn and conn.Connected then
                    conn:Disconnect()
                end
            end
            
            -- 重置状态
            _G.AnimMod = {
                isActive = false,
                connections = {},
                tracks = {}
            }
        end
    end
})

-- 角色外观自定义
Tab:AddToggle({
    Name = "Jason美化",
    Callback = function(state)
        -- 确保 _G 表中有 JasonSkin 字段，用于存储全局状态
        if not _G.JasonSkin then
            _G.JasonSkin = {
                originalAppearance = {
                    bodyColors = {},
                    shirtTemplate = "",
                    pantsTemplate = "",
                    removedAccessories = {},
                    addedAccessories = {}
                },
                character = nil,
                bodyColors = nil
            }
        end

        local player = game.Players.LocalPlayer  
        local character = player.Character or player.CharacterAdded:Wait()
        _G.JasonSkin.character = character

        local bodyColors = character:FindFirstChild("Body Colors")
        _G.JasonSkin.bodyColors = bodyColors

        if state then
            -- 备份原始外观数据，以便关闭时恢复
            if bodyColors then
                _G.JasonSkin.originalAppearance.bodyColors.HeadColor = bodyColors.HeadColor
                _G.JasonSkin.originalAppearance.bodyColors.LeftArmColor = bodyColors.LeftArmColor
                _G.JasonSkin.originalAppearance.bodyColors.RightArmColor = bodyColors.RightArmColor
                _G.JasonSkin.originalAppearance.bodyColors.LeftLegColor = bodyColors.LeftLegColor
                _G.JasonSkin.originalAppearance.bodyColors.RightLegColor = bodyColors.RightLegColor
                _G.JasonSkin.originalAppearance.bodyColors.TorsoColor = bodyColors.TorsoColor
            end

            local shirt = character:FindFirstChildOfClass("Shirt")
            if shirt then
                _G.JasonSkin.originalAppearance.shirtTemplate = shirt.ShirtTemplate
            end
            local pants = character:FindFirstChildOfClass("Pants")
            if pants then
                _G.JasonSkin.originalAppearance.pantsTemplate = pants.PantsTemplate
            end

            -- 1. 全身变黑
            if bodyColors then
                bodyColors.HeadColor = BrickColor.new("Really black")
                bodyColors.LeftArmColor = BrickColor.new("Really black")
                bodyColors.RightArmColor = BrickColor.new("Really black")
                bodyColors.LeftLegColor = BrickColor.new("Really black")
                bodyColors.RightLegColor = BrickColor.new("Really black")
                bodyColors.TorsoColor = BrickColor.new("Really black")
            end

            -- 2. 移除旧面具
            _G.JasonSkin.originalAppearance.removedAccessories = {} -- 清空之前的备份
            for _, obj in pairs(character:GetDescendants()) do
                if obj.Name == "Mask" then
                    table.insert(_G.JasonSkin.originalAppearance.removedAccessories, obj:Clone())
                    obj:Destroy()
                end
            end

            -- 3. 穿上新衣服
            local newShirt = character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", character)
            newShirt.ShirtTemplate = "rbxassetid://130919586308395"

            local newPants = character:FindFirstChildOfClass("Pants") or Instance.new("Pants", character)
            newPants.PantsTemplate = "rbxassetid://83940216283729"

            -- 4. 添加新配饰
            local function addAccessory(name, meshId, textureId, parentPartName, handleSize, position, rotation, customWeldC0, customWeldC1, meshScale, meshOffset)
                local accessory = Instance.new("Accessory")
                accessory.Name = name
                local handle = Instance.new("Part")
                handle.Name = "Handle"
                handle.Size = Vector3.new(unpack(handleSize))
                handle.CanCollide = false
                handle.Anchored = false
                handle.Parent = accessory
                local mesh = Instance.new("SpecialMesh", handle)
                mesh.MeshId = meshId
                if textureId ~= "" then
                    mesh.TextureId = textureId
                end
                if meshScale then
                    mesh.Scale = Vector3.new(unpack(meshScale))
                else
                    mesh.Scale = Vector3.new(1, 1, 1)
                end
                if meshOffset then
                    mesh.Offset = Vector3.new(unpack(meshOffset))
                else
                    mesh.Offset = Vector3.new(0, 0, 0)
                end
                local targetPart = character:FindFirstChild(parentPartName)
                if not targetPart then
                    warn("Target part '" .. parentPartName .. "' not found in character!")
                    return
                end
                local weld = Instance.new("Weld")
                weld.Part0 = targetPart
                weld.Part1 = handle
                if customWeldC0 and customWeldC1 then
                    weld.C0 = CFrame.new(unpack(customWeldC0))
                    weld.C1 = CFrame.new(unpack(customWeldC1))
                else
                    weld.C0 = CFrame.new(unpack(position)) * CFrame.Angles(math.rad(rotation[1]), math.rad(rotation[2]), math.rad(rotation[3]))
                end
                weld.Parent = handle
                accessory.Parent = character
                table.insert(_G.JasonSkin.originalAppearance.addedAccessories, accessory)
            end

            _G.JasonSkin.originalAppearance.addedAccessories = {} -- 清空之前的添加记录
            addAccessory(
                "Scarf", 
                "rbxassetid://131343945015522", 
                "rbxassetid://78916578261510", 
                "Torso", -- 假设围巾应该挂在躯干上，而不是一个叫"Scarf"的部位
                {1, 0.5, 1},
                {0, 0, 0},
                {0, 0, 0}
            )

            addAccessory(
                "NewMask", 
                "rbxassetid://119998744532277", 
                "rbxassetid://85762572283089", 
                "Head", 
                {1, 1, 1},
                {0, 0, 0},
                {0, 260, 0}
            )
        else
            -- 恢复原始外观函数
            local character = _G.JasonSkin.character
            local bodyColors = _G.JasonSkin.bodyColors
            local original = _G.JasonSkin.originalAppearance

            if not character then return end

                        if bodyColors and original.bodyColors.HeadColor then
                bodyColors.HeadColor = original.bodyColors.HeadColor
                bodyColors.LeftArmColor = original.bodyColors.LeftArmColor
                bodyColors.RightArmColor = original.bodyColors.RightArmColor
                bodyColors.LeftLegColor = original.bodyColors.LeftLegColor
                bodyColors.RightLegColor = original.bodyColors.RightLegColor
                bodyColors.TorsoColor = original.bodyColors.TorsoColor
            end

            -- 恢复服装
            local shirt = character:FindFirstChildOfClass("Shirt")
            if shirt and original.shirtTemplate ~= "" then
                shirt.ShirtTemplate = original.shirtTemplate
            end
            local pants = character:FindFirstChildOfClass("Pants")
            if pants and original.pantsTemplate ~= "" then
                pants.PantsTemplate = original.pantsTemplate
            end

            -- 移除添加的配饰
            for _, accessory in ipairs(original.addedAccessories) do
                if accessory and accessory.Parent then
                    accessory:Destroy()
                end
            end

            -- 恢复移除的旧面具
            for _, accessory in ipairs(original.removedAccessories) do
                if accessory then
                    local newAccessory = accessory:Clone()
                    newAccessory.Parent = character
                end
            end

            -- 重置添加/移除的记录
            _G.JasonSkin.originalAppearance.addedAccessories = {}
            _G.JasonSkin.originalAppearance.removedAccessories = {}
        end
    end
})
