-- 1. 加载 WindUI 核心库（确保路径与核心库一致）
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local LP = game.Players.LocalPlayer
pcall(function()
    addRainbowTitleToLocalPlayer(LP, "DOLL用户※")
end)

-- 2. 创建主窗口
local MainWindow = WindUI:CreateWindow({
    Title = "DOLL脚本",  -- 窗口标题
    Author = "欢迎使用我的DOLL脚本※作者Q:3829174015",  -- 作者标识
    Folder = "CharacterControl",  -- 配置存储文件夹
    Size = UDim2.fromOffset(500, 380),  -- 窗口大小
    Theme = "Dark",  -- 初始主题（可选：Dark/Light/Emerald等）
    SideBarWidth = 180,  -- 侧边栏宽度
    Acrylic = true,  -- 启用亚克力透明效果
    OpenButton = {  -- 窗口打开按钮配置
        Title = "打开DOLL脚本",
        Icon = "user-gear",  -- 按钮图标（Lucide图标库）
        Color = ColorSequence.new({  -- 彩虹渐变按钮
            ColorSequenceKeypoint.new(0, Color3.fromHex("FF6B6B")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("4ECDC4")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("FFD166"))
        })
    }
})

-- 4. 创建侧边栏标签页：视角设置
local Tab1 = MainWindow:Tab({
    Title = "视角设置",
    Icon = "camera"
})

-- 4.1 视角控制分组
local Tab1Section = Tab1:Section({
    Title = "视角参数"
})

-- 4.1.1 滑动条：视角距离
Tab1Section:Slider({
    Title = "视角距离",
    Value = {
        Min = 0,
        Max = 120,
        Default = 30
    },
    Callback = function(value)
        local camera = game.Workspace.CurrentCamera
        if camera then
            camera.FieldOfView = tonumber(value)  -- 调节视角FOV
        end
    end
})

-- 4.1.2 下拉菜单：视角模式
Tab1Section:Dropdown({
    Title = "视角模式",
    Values = {"第三人称", "第一人称", "自由视角"},  -- 可选选项
    Value = "自由视角",  -- 默认选项
    Callback = function(selected)
        local camera = game.Workspace.CurrentCamera
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not camera or not humanoid then return end
        
        -- 根据选择切换视角模式
        if selected == "第一人称" then
            camera.CameraType = Enum.CameraType.Attach
            humanoid.CameraOffset = Vector3.new(0, 1.5, 0)
        elseif selected == "第三人称" then
            camera.CameraType = Enum.CameraType.Custom
            humanoid.CameraOffset = Vector3.new(0, 0, 0)
        elseif selected == "自由视角" then
            camera.CameraType = Enum.CameraType.Free
        end
    end
})

local Tab2 = MainWindow:Tab({
    Title = "玩家",
    Icon = "bolt"  -- 标签页图标
})

local Tab2Section = Tab2:Section({
    Title = "主要的"
})

-- 防摔落
Tab2Section:Button({
    Title = "防摔落",
    Icon = "shield-virus",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/Fall-injury/main/防止摔落伤害"))()
        WindUI:Notify({ Title = "防摔落", Content = "✅ 已执行", Icon = "bolt" })
    end
})

-- 无敌少侠
Tab2Section:Button({
    Title = "无敌少侠",
    Icon = "user-astronaut",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
        WindUI:Notify({ Title = "无敌少侠", Content = "✅ 已执行", Icon = "bolt" })
    end
})

Tab2Section:Button({
    Title = "DOLL飞行",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),  -- 按钮颜色
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
TextLabel.Text = "DOLL飞行"
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
	Title = "DOLL脚本";
	Text = "欢迎使用DOLL飞行 谢谢🙏";
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
        WindUI:Notify({
            Title = "已打开飞行",
            Content = "欢迎使用DOLL",
            Icon = "bolt"
        })
    end
})

local Tab2ESP = Tab2Section:Toggle({
    Title = "玩家透视",
    Desc = "高亮显示所有玩家，便于观察",
    Default = false,
    Callback = function(isEnabled)
        _G.PlayerESPEnabled = isEnabled
        
        -- 发送通知提示
        WindUI:Notify({
            Title = "玩家透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "user-check",
            Duration = 3
        })
    end
})

-- 高亮功能的核心代码
local FillColor = Color3.fromRGB(175, 25, 255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255, 255, 255)
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
    Highlight.OutlineTransparency = OutlineTransparency
    Highlight.Parent = Storage
    Highlight.Enabled = _G.PlayerESPEnabled -- 根据全局开关状态设置初始启用状态
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

-- 监听开关状态变化，更新所有高亮的启用状态
game:GetService("RunService").Heartbeat:Connect(function()
    if Storage then
        for _, highlight in ipairs(Storage:GetChildren()) do
            highlight.Enabled = _G.PlayerESPEnabled
        end
    end
end)

Players.PlayerAdded:Connect(Highlight)
for i, v in next, Players:GetPlayers() do
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

local Tab2GodmodeToggle = Tab2Section:Toggle({
    Title = "上帝模式",
    Desc = "开启后角色无敌且不掉血",
    Default = false,  -- 默认关闭
    Callback = function(isEnabled)
        local character = game.Players.LocalPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.MaxHealth = isEnabled and math.huge or 100
            humanoid.Health = isEnabled and math.huge or 100
        end
        -- 发送通知提示
        WindUI:Notify({
            Title = "上帝模式",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "shield",
            Duration = 3
        })
    end
})

local Tab2InfJumpToggle = Tab2Section:Toggle({
    Title = "无限跳",
    Desc = "开启后按跳跃键可持续跳跃",
    Default = false,  -- 默认关闭
    Callback = function(isEnabled)
        -- 先断开旧连接，避免重复绑定导致多次跳跃
        if _G.JumpConnection then
            _G.JumpConnection:Disconnect()
        end
        
        -- 开启时绑定跳跃请求事件
        if isEnabled then
            _G.JumpConnection = game.UserInputService.JumpRequest:Connect(function()
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
        
        -- 发送状态通知
        WindUI:Notify({
            Title = "无限跳",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "feather",
            Duration = 3
        })
    end 
})


-- 3.1.2 滑动条：移动速度调节
local Tab2NightVisionSlider = Tab2Section:Slider({
    Title = "移动速度",
    Desc = "调节角色行走/奔跑速度",
    Step = 1,  -- 调节步长
    Value = {
        Min = 16,    -- 最小速度（默认）
        Max = 500,    -- 最大速度
        Default = 16 -- 初始速度
    },
    Callback = function(value)
        local character = game.Players.LocalPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = tonumber(value)
        end
    end
})

Tab2Section:Slider({
    Title = "跳跃高度",
    Value = {
        Min = 1,
        Max = 200,
        Default = 50
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        -- 直接使用滑动条的值
        humanoid.JumpPower = value
    end
})

local Tab2NightVisionToggle = Tab2Section:Toggle({
    Title = "夜视",
    Desc = "顾名思义",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            game.Lighting.Ambient = Color3.new(1, 1, 1) -- 夜视开启：高亮环境光
        else
            game.Lighting.Ambient = Color3.new(0.3, 0.3, 0.3) -- 夜视关闭：恢复默认
        end
        
        -- 发送通知提示
        WindUI:Notify({
            Title = "夜视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "moon",
            Duration = 3
        })
    end
})

local Tab2Slider = Tab2Section:Slider({
    Title = "范围",
    Desc = "调整其他玩家碰撞箱大小",
    Step = 1,
    Value = {
        Min = 1,      -- 最小值
        Max = 100,     -- 最大值
        Default = 1   -- 初始值
    },
    Callback = function(value)
        -- 断开旧的事件连接，避免重复执行
        if _G.HeadSizeConnection then
            _G.HeadSizeConnection:Disconnect()
        end

        _G.HeadSize = value
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

Tab2Section:Button({
    Title = "控制玩家",
    Icon = "click",
    Color = Color3.fromHex("#000000"),  -- 按钮颜色
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
        WindUI:Notify({
            Title = "控制玩家",
            Content = "控制玩家已打开✅",
            Icon = "bolt"
        })
    end
})

-- 玩家提示 按钮
Tab2Section:Button({
    Title = "玩家提示",
    Icon = "info-circle",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
        WindUI:Notify({
            Title = "玩家提示",
            Content = "✅ 已执行",
            Icon = "bolt"
        })
    end
})

-- 撸管r15 按钮
Tab2Section:Button({
    Title = "撸管r15",
    Icon = "click",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        WindUI:Notify({
            Title = "撸管r15",
            Content = "✅ 已执行",
            Icon = "bolt"
        })
    end
})

-- 撸管r6 按钮
Tab2Section:Button({
    Title = "撸管r6",
    Icon = "click",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
        WindUI:Notify({
            Title = "撸管r6",
            Content = "✅ 已执行",
            Icon = "bolt"
        })
    end
})

local Tab3 = MainWindow:Tab({
    Title = "通用",
    Icon = "bolt"  -- 标签页图标
})

local Tab3Section = Tab3:Section({
    Title = "通用所有",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab3Section:Button({
    Title = "铁拳",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
        WindUI:Notify({
            Title = "铁拳开启成功✅",
            Content = "开始你的甩飞之旅吧",
            Icon = "bolt"
        })
    end
})



Tab3Section:Button({
    Title = "甩人",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        WindUI:Notify({
            Title = "甩人开启成功✅",
            Content = "甩飞全图吧👍👍",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "死亡笔记",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
        WindUI:Notify({
            Title = "死亡笔记开启成功✅",
            Content = "掏出你的小本本写上TA的名字吧",
            Icon = "bolt"
        })
    end
})


Tab3Section:Button({
    Title = "上墙",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        WindUI:Notify({
            Title = "上墙开启成功✅",
            Content = "开始你的阴暗爬行吧",
            Icon = "bolt"
        })
    end
})


Tab3Section:Button({
    Title = "飞车",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/63T0fkBm"))()
        WindUI:Notify({
            Title = "开启成功✅",
            Content = "这个可以带飞载具",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "穿墙",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/OtherScript/main/Noclip"))()
        WindUI:Notify({
            Title = "穿墙开启成功✅",
            Content = "疑似能穿地🤔",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "点击传送工具",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
        WindUI:Notify({
            Title = "点击传送工具已放入背包✅",
            Content = "装备后点击一个地方能传送",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "无敌",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
        WindUI:Notify({
            Title = "执行成功✅",
            Content = "🤡🤡🤡🤡🤡",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "隐身",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
        WindUI:Notify({
            Title = "隐身执行成功",
            Content = "🤡🤡🤡🤡",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "旋转",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
        WindUI:Notify({
            Title = "旋转执行成功✅",
            Content = "好像转的有点小慢",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "fps显示",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()
        WindUI:Notify({
            Title = "执行成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "动画中心",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
        WindUI:Notify({
            Title = "动画中心执行成功✅",
            Content = "动画美化包🤔",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "义勇军进行曲",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1845918434"
        sound.Parent = game.Workspace
        sound:Play()
        WindUI:Notify({
            Title = "正在播放义勇军进行曲✅",
            Content = "🇨🇳🇨🇳🇨🇳🇨🇳🇨🇳🇨🇳",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "工具",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
        WindUI:Notify({
            Title = "工具执行成功✅",
            Content = "难道要开始破坏了🤔",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "YI指令",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        -- 补充实际指令脚本链接（示例链接，可根据需求替换）
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        WindUI:Notify({
            Title = "YI指令已执行✅",
            Content = "难道你要玩指令?",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "键盘",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
        WindUI:Notify({
            Title = "键盘执行成功✅",
            Content = "你要当键盘侠了?",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "替身",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
        WindUI:Notify({
            Title = "替身开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "反挂机",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
        WindUI:Notify({
            Title = "反挂机开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "阿尔宙斯自瞄",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
        WindUI:Notify({
            Title = "阿尔宙斯自瞄✅开启成功",
            Content = "小提示",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "光影V4",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
        WindUI:Notify({
            Title = "光影V4开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "鼠标［手机不建议使用］",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
        WindUI:Notify({
            Title = "鼠标开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "传送玩家",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/YNVbeqPy")))()
        WindUI:Notify({
            Title = "传送玩家执行成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "变成蛇",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
        WindUI:Notify({
            Title = "变成蛇执行成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "子弹追踪",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()
        WindUI:Notify({
            Title = "子弹追踪执行成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "伪名说话",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
        WindUI:Notify({
            Title = "伪名说话开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "跟踪玩家",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
        WindUI:Notify({
            Title = "跟踪玩家执行成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "吸人",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()
        WindUI:Notify({
            Title = "吸人开启成功✅",
            Content = "👾",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "紫砂",
    Icon = "click",
    Color = Color3.fromHex("3B82F6"), 
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health=0
        WindUI:Notify({
            Title = "紫砂执行成功✅",
            Content = "😵",
            Icon = "bolt"
        })
    end
})

local Tab4 = MainWindow:Tab({
    Title = "凹凸世界自由森林",
    Icon = "bolt"  -- 标签页图标
})

local Tab4Section = Tab4:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

-- 获取所有装扮（按钮转开关，点击即触发一次，开关状态仅作提示）
local Tab4Toggle_GetAllSkins = Tab4Section:Toggle({ -- 修复：变量名唯一+关联正确Section
    Title = "获取所有装扮",
    Desc = "点击开启即可触发获取全部装扮",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            -- 触发四段请求（添加超时容错，避免卡死）
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Project", 5)
            if not remote then return end
            remote = remote:WaitForChild("RemoteEvent", 5)
            if not remote then return end
            remote = remote:WaitForChild("ControlMessageEvent", 5)
            if not remote then return end

            for i = 1, 4 do
                local args = {2, {2, i}}
                pcall(function() remote:FireServer(unpack(args)) end) -- 容错：避免单条请求失败
            end

            -- 提示并自动关闭开关（避免重复触发）
            WindUI:Notify({
                Title = "装扮获取",
                Content = "✅ 已发送所有装扮获取请求",
                Icon = "tshirt",
                Duration = 3
            })
            Tab4Toggle_GetAllSkins:SetValue(false) -- 修复：变量名与定义一致
        end
    end
})

-- 获取裁判球（循环功能，开关控制启停）
local loopConnection = nil
local Tab4Toggle_GetRefBall = Tab4Section:Toggle({ -- 修复：变量名唯一
    Title = "获取裁判球",
    Desc = "开启后持续获取裁判球",
    Default = false,
    Callback = function(isEnabled)
        WindUI:Notify({
            Title = "裁判球获取",
            Content = isEnabled and "✅ 已开启持续获取" or "❌ 已关闭",
            Icon = "soccer_ball",
            Duration = 3
        })

        -- 停止原有循环
        if loopConnection then
            task.cancel(loopConnection)
            loopConnection = nil
        end

        -- 开启新循环
        if isEnabled then
            loopConnection = task.spawn(function()
                -- 查找远程服务（添加超时容错）
                local remote = game:GetService("ReplicatedStorage"):WaitForChild("Project", 5)
                if not remote then return end
                remote = remote:WaitForChild("RemoteEvent", 5)
                if not remote then return end
                remote = remote:WaitForChild("ControlMessageEvent", 5)
                if not remote then return end

                local args = {2, {1, 1, 15}}
                while isEnabled do
                    pcall(function() remote:FireServer(unpack(args)) end) -- 容错：避免请求失败崩溃
                    task.wait(0.1) -- 修复：添加合理间隔，避免卡顿/被检测
                end
            end)
        end
    end
})

local Tab5 = MainWindow:Tab({
    Title = "强壮传奇",
    Icon = "bolt"  -- 标签页图标
})

local Tab5Section = Tab5:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local Tab5Toggle_AutoEat = Tab5Section:Toggle({
    Title = "自动吃食物",
    Desc = "自动使用食物道具",
    Default = false,
    Callback = function(isEnabled)
        getgenv().autousefood = isEnabled
        WindUI:Notify({
            Title = "自动吃食物",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "utensils",
            Duration = 3
        })

        -- 单独开循环避免阻塞：remote定义和循环必须放在 task.spawn 内部！
        task.spawn(function()
            -- 1. 查找远程服务（加5秒超时，避免卡加载）
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 5)
            if not remote then return end -- 没找到就退出，不报错
            remote = remote:WaitForChild("UseTool", 5)
            if not remote then return end

            -- 2. 循环执行（只在开启时运行）
            while getgenv().autousefood do
                pcall(function()
                    remote:FireServer("Food")
                end)
                task.wait(0.1) -- 间隔不能少，防止卡顿
            end
        end) -- 闭合 task.spawn 函数
    end -- 闭合 Callback 函数
}) -- 闭合 Toggle 定义


-- 自动售出
local Tab5Toggle_AutoSell = Tab5Section:Toggle({
    Title = "自动售出",
    Desc = "原地售出［关了售卖它也能售出］",
    Default = false,
    Callback = function(isEnabled)
        getgenv().autosell = isEnabled
        WindUI:Notify({
            Title = "自动售出",
            Content = isEnabled and "✅ 已开启（间隔1秒）" or "❌ 已关闭",
            Icon = "money_bill_trend_up",
            Duration = 3
        })

        -- 停止原有循环（单独局部变量，避免冲突）
        local sellLoop = nil
        if sellLoop then task.cancel(sellLoop) end
        if not isEnabled then return end

        -- 启动循环（添加pcall防报错+1秒间隔）
        sellLoop = task.spawn(function()
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("YieldSell")
            while getgenv().autosell do
                pcall(function()
                    remote:InvokeServer()
                end)
                task.wait(1) -- 修复：替换原task.wait(0.0)，避免卡顿
            end
        end)
    end
})

local Tab5Toggle = Tab5Section:Toggle({
    Title = "自动挥拳",
    Desc = "开启后自动持续挥拳",
    Default = false,  -- 默认关闭
    Callback = function(isEnabled)
        -- 状态提示
        WindUI:Notify({
            Title = "弹出的提示",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "bolt",
            Duration = 3
        })

        -- 断开旧循环，避免重复运行
        if _G.PunchLoop then
            task.cancel(_G.PunchLoop)
            _G.PunchLoop = nil
        end

        if not isEnabled then return end

        -- 启动自动挥拳循环（独立线程+容错）
        _G.PunchLoop = task.spawn(function()
            -- 查找远程服务（5秒超时容错）
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 5)
            if not remote then
                WindUI:Notify({Title = "错误", Content = "❌ 未找到Remotes服务", Icon = "x-circle"})
                return
            end
            remote = remote:WaitForChild("UseTool", 5)
            if not remote then
                WindUI:Notify({Title = "错误", Content = "❌ 未找到UseTool远程", Icon = "x-circle"})
                return
            end

            -- 自动挥拳核心逻辑
            local args = {"Punch"}
            while isEnabled do
                pcall(function()
                    remote:FireServer(unpack(args))
                end)
                task.wait(0.1)  -- 挥拳间隔，避免高频调用卡顿
            end
        end)
    end 
})

local Tab5Toggle = Tab1Section:Toggle({
    Title = "自动跺脚",
    Desc = "开启后持续触发跺脚技能",
    Default = false,  -- 默认关闭
    Callback = function(isEnabled)
        -- 状态提示
        WindUI:Notify({
            Title = "弹出的提示",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "bolt",
            Duration = 3
        })

        -- 断开旧循环，避免重复运行
        if _G.StompLoop then
            task.cancel(_G.StompLoop)
            _G.StompLoop = nil
        end

        if not isEnabled then return end

        -- 启动自动跺脚循环（独立线程+容错）
        _G.StompLoop = task.spawn(function()
            -- 查找远程服务（5秒超时容错）
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 5)
            if not remote then
                WindUI:Notify({Title = "错误", Content = "❌ 未找到Remotes服务", Icon = "x-circle"})
                return
            end
            remote = remote:WaitForChild("UseTool", 5)
            if not remote then
                WindUI:Notify({Title = "错误", Content = "❌ 未找到UseTool远程", Icon = "x-circle"})
                return
            end

            -- 自动跺脚核心逻辑
            local args = {"Stomp"}
            while isEnabled do
                pcall(function()
                    remote:FireServer(unpack(args))
                end)
                task.wait(0.3)  -- 跺脚间隔（可按需调整，数值越小频率越高）
            end
        end)
    end 
})

Tab5Section:Button({
    Title = "解锁所有岛屿",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        -- 1. 判断角色是否就绪，避免脚本加载时误触发
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            WindUI:Notify({
                Title = "提示",
                Content = "⚠️ 角色未加载，点击按钮后再解锁",
                Icon = "info-circle",
                Duration = 3
            })
            return
        end

        -- 2. 所有岛屿坐标（保留原顺序）
        local coordinates = {
            CFrame.new(697.86, 1698.29, 2048.00),   -- 蔬菜草地
            CFrame.new(718.67, 3287.09, 2079.90),   -- 面包沙漠
            CFrame.new(710.93, 5936.99, 2051.80),   -- 冰淇淋冻原
            CFrame.new(721.18, 9169.49, 2051.66),   -- 披萨荒地
            CFrame.new(717.12, 12844.32, 2047.88),  -- 甜甜圈银河
            CFrame.new(713.28, 16592.55, 2061.30),  -- 水晶糖果岛
            CFrame.new(699.60, 21918.35, 2048.25),  -- 巧克力王国
            CFrame.new(722.07, 30300.52, 2046.58)   -- 蘑菇绿洲
        }

        -- 3. 独立线程执行传送（避免阻塞）
        task.spawn(function()
            local plr = game.Players.LocalPlayer
            local islandNames = {"主岛", "蔬菜草地", "面包沙漠", "冰淇淋冻原", "披萨荒地", "甜甜圈银河", "水晶糖果岛", "巧克力王国", "蘑菇绿洲"}
            
            for i, cframe in ipairs(coordinates) do
                -- 等待角色就绪（容错角色重生）
                local char = plr.Character or plr.CharacterAdded:Wait()
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                if not rootPart then
                    WindUI:Notify({
                        Title = "传送失败",
                        Content = "❌ 角色核心部件缺失",
                        Icon = "x-circle",
                        Duration = 3
                    })
                    break
                end

                -- 执行传送（pcall容错，避免单次传送失败中断循环）
                pcall(function()
                    rootPart.CFrame = cframe
                end)

                -- 传送进度提示（告知当前解锁状态）
                WindUI:Notify({
                    Title = "解锁进度",
                    Content = string.format("📍 已解锁【%s】（%d/8）", islandNames[i], i),
                    Icon = "map-location-dot",
                    Duration = 2
                })

                task.wait(1.5)  -- 每个岛屿停留1.5秒，确保解锁生效
            end

            -- 4. 全部解锁完成提示
            WindUI:Notify({
                Title = "解锁完成",
                Content = "🎉 所有岛屿已全部解锁！",
                Icon = "trophy",
                Duration = 5
            })
        end) -- 补全：task.spawn的end

        -- 5. 按钮点击成功提示
        WindUI:Notify({
            Title = "解锁成功✅",
            Content = "🤓",
            Icon = "bolt"
        })
    end -- 补全：Callback的end
}) -- 补全：Button的end

Tab5Section:Dropdown({
    Title = "岛屿传送",
    Values = {"主岛", "蔬菜草地", "面包沙漠", "冰淇淋冻原", "披萨荒地", "甜甜圈银河", "水晶糖果岛", "巧克力王国", "蘑菇绿洲"},
    Value = "主岛", -- 默认选中主岛（仅显示，不触发传送）
    Callback = function(selected)
        -- 关键修复1：用“初始化标记”替代鼠标按住判断，避免操作时序问题
        local initFlag = true -- 标记是否为初始化触发
        -- 延迟0.1秒检测：初始化触发的Callback会立即执行，手动选择的会有延迟
        task.delay(0.1, function()
            initFlag = false
        end)
        -- 初始化触发（脚本启动/面板打开时）直接返回
        if initFlag then
            return
        end

        -- 关键修复2：优化角色加载校验（等待角色就绪，不超时）
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait() -- 无限等待角色加载（直到生成）
        local rootPart = char:WaitForChild("HumanoidRootPart", 10) -- 10秒内等待核心部件
        local humanoid = char:WaitForChildOfClass("Humanoid", 10)
        if not rootPart or not humanoid then
            WindUI:Notify({
                Title = "传送失败",
                Content = "❌ 角色核心部件缺失",
                Icon = "x-circle",
                Duration = 3
            })
            return
        end

        -- 坐标与岛屿一一对应（保留原顺序）
        local targetPos
        if selected == "主岛" then
            targetPos = CFrame.new(1335.53, 681.97, 2055.47)
        elseif selected == "蔬菜草地" then
            targetPos = CFrame.new(697.86, 1698.29, 2048.00)
        elseif selected == "面包沙漠" then
            targetPos = CFrame.new(718.67, 3287.09, 2079.90)
        elseif selected == "冰淇淋冻原" then
            targetPos = CFrame.new(710.93, 5936.99, 2051.80)
        elseif selected == "披萨荒地" then
            targetPos = CFrame.new(721.18, 9169.49, 2051.66)
        elseif selected == "甜甜圈银河" then
            targetPos = CFrame.new(717.12, 12844.32, 2047.88)
        elseif selected == "水晶糖果岛" then
            targetPos = CFrame.new(713.28, 16592.55, 2061.30)
        elseif selected == "巧克力王国" then
            targetPos = CFrame.new(699.60, 21918.35, 2048.25)
        elseif selected == "蘑菇绿洲" then
            targetPos = CFrame.new(722.07, 30300.52, 2046.58)
        end

        -- 执行传送（强化容错，确保生效）
        pcall(function()
            if rootPart and targetPos and humanoid.Health > 0 then
                -- 临时关闭碰撞，避免卡地形导致传送失效
                rootPart.CanCollide = false
                rootPart.CFrame = targetPos
                task.wait(0.2) -- 等待传送生效
                rootPart.CanCollide = true
                WindUI:Notify({
                    Title = "传送成功",
                    Content = string.format("✅ 已传送到【%s】", selected),
                    Icon = "map-location-dot",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "传送失败",
                    Content = "❌ 角色状态异常或坐标无效",
                    Icon = "x-circle",
                    Duration = 3
                })
            end
        end)
    end
})

-- 5. 快捷键设置：LeftControl 快速打开/关闭窗口
MainWindow:SetToggleKey(Enum.KeyCode.LeftControl)
