getgenv().Interstellar = getgenv().Interstellar or {}
local Interstellar = getgenv().Interstellar
-- 1. 加载 WindUI 核心库（确保路径与核心库一致）
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/-/refs/heads/main/DOLLUI.lua"))()

-- 2. 创建主窗口
local MainWindow = WindUI:CreateWindow({
    Title = "DOLL脚本",  -- 窗口标题
    Author = "欢迎使用我的DOLL脚本※Q群:1058549962",
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
local speeds = 1 -- 新增：局部变量声明
local nowe = false -- 新增：局部变量声明
local tpwalking = false -- 新增：局部变量声明
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
    Title = "重新加入服务器",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        WindUI:Notify({
            Title = "✅",
            Content = "✅",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "隐身道具",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
        WindUI:Notify({
            Title = "获取成功✅",
            Content = "非常厉害",
            Icon = "bolt"
        })
    end
})

local autoInteract = false -- 全局变量存储状态

local Tab3Toggle = Tab3Section:Toggle({
    Title = "自动互动",
    Desc = "自动触发所有近距离交互提示",
    Default = false,
    Callback = function(isEnabled)
        autoInteract = isEnabled
        
        -- 弹出状态提示
        WindUI:Notify({
            Title = "自动互动",
            Content = isEnabled and "✅ 已开启自动交互功能" or "❌ 已关闭自动交互功能",
            Icon = "bolt",
            Duration = 3
        })
        
        -- 开启时循环触发ProximityPrompt
        if isEnabled then
            task.spawn(function()
                while autoInteract do
                    for _, descendant in pairs(workspace:GetDescendants()) do
                        if descendant:IsA("ProximityPrompt") then
                            fireproximityprompt(descendant)
                        end
                    end
                    task.wait(0.25) -- 交互间隔（可调整）
                end
            end)
        end
    end
})

-- 最大血量滑块
local Tab3Slider_MaxHealth = Tab3Section:Slider({
    Title = "修改最大血量",
    Desc = "调整角色最大生命值上限",
    Step = 10, -- 每步调整10点（可按需修改）
    Value = {
        Min = 100,    -- 最小100血
        Max = 5000,   -- 最大5000血
        Default = 100 -- 初始默认100血
    },
    Callback = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            local humanoid = char.Humanoid
            humanoid.MaxHealth = value
            -- 同步当前血量为新的最大血量，避免血量溢出/不足
            if humanoid.Health > value then
                humanoid.Health = value
            end
            WindUI:Notify({
                Title = "最大血量修改",
                Content = "✅ 已设置最大血量为 " .. value,
                Icon = "heart",
                Duration = 2
            })
        end
    end
})

-- 当前血量滑块
local Tab3Slider_CurrentHealth = Tab3Section:Slider({
    Title = "修改当前血量",
    Desc = "调整角色当前生命值（不超过最大血量）",
    Step = 10, -- 每步调整10点（可按需修改）
    Value = {
        Min = 1,      -- 最小1血（避免直接死亡）
        Max = 5000,   -- 与最大血量上限一致
        Default = 100 -- 初始默认100血
    },
    Callback = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            local humanoid = char.Humanoid
            -- 限制当前血量不超过最大血量
            local finalValue = math.min(value, humanoid.MaxHealth)
            humanoid.Health = finalValue
            WindUI:Notify({
                Title = "当前血量修改",
                Content = "✅ 已设置当前血量为 " .. finalValue,
                Icon = "heart-pulse",
                Duration = 2
            })
        end
    end
})

Tab3Section:Button({
    Title = "载人飞行",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/单一物体飞行载自己最终优化版"))()
        WindUI:Notify({
            Title = "开启成功✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "铁拳",
    Icon = "click",
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Title = "子弹追踪",
    Icon = "click",
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Color = Color3.fromHex("#000000"), 
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
    Title = "预留",
    Icon = "bolt"
})

-- 创建功能分区
local Tab4Section = Tab4:Section({
    Title = "预留",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local Tab5 = MainWindow:Tab({
    Title = "DOLL黑客☠️",
    Icon = "bolt"  -- 标签页图标
})

local Tab5Section = Tab5:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab5Section:Button({
    Title = "DOOL释放木马病毒",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Configuration --
local Message = "DOLL入侵服务器!※!※!※!"
local mes2text = "DOLL入侵服务器!※!※!※!"

-- Don't touch unless you know what You're doing --

local mes = Instance.new("Hint")
mes.Parent = workspace
mes.Text = Message
game.Lighting:ClearAllChildren()
game.Lighting.FogEnd = 100
game.Lighting.FogColor = Color3.new(0, 0, 0)
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.Looped = true
sound.PlaybackSpeed = 0.3
sound.Volume = 5
sound.SoundId = "rbxassetid://1842908121"
sound:Play()
local mes2 = Instance.new("Message")
mes2.Parent = workspace
mes2.Text = mes2text
for i, v in pairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") and v.Parent:IsA("Model") then
		local outline = Instance.new("SelectionBox")
		v.Name = Message
		outline.Parent = v
		outline.Adornee = v
		outline.Color3 = Color3.new(1, 1, 1)
		v.Color = Color3.new(0, 0, 0)
		local fire = Instance.new("Fire")
		fire.Parent = v
		fire.Size = 100
		fire.Color = Color3.new(1, 1, 1)
		local sky = Instance.new("Sky")
		sky.CelestialBodiesShown = false
		sky.Parent = game.Lighting
		sky.SkyboxUp = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxBk = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxDn = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxRt = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxLf = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxFt = "http://www.roblox.com/asset/?id=99915080584370"
		local bill = Instance.new("BillboardGui")
		local Text = Instance.new("TextLabel")
		bill.Parent = v
		bill.Adornee = v
		bill.Size = UDim2.new(0, 200, 0, 200)
		Text.Parent = bill
		Text.Size = UDim2.new(0, 200, 0, 200)
		Text.BackgroundTransparency = 1
		Text.TextScaled = false
		Text.TextSize = 30
		Text.TextColor3 = Color3.new(1, 0, 0.0156863)
		Text.TextTransparency = 0
		Text.Font = Enum.Font.Cartoon
		Text.Text = Message
	end
end
        WindUI:Notify({
            Title = "DOLL已入侵服务器✅",
            Content = "开始毁灭❌❌",
            Icon = "bolt"
        })
    end
})

Tab5Section:Button({
    Title = "修改天空",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        local sky = Instance.new("Sky")
		sky.CelestialBodiesShown = false
		sky.Parent = game.Lighting
		sky.SkyboxUp = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxBk = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxDn = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxRt = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxLf = "http://www.roblox.com/asset/?id=99915080584370"
		sky.SkyboxFt = "http://www.roblox.com/asset/?id=99915080584370"
        WindUI:Notify({
            Title = "修改成功✅",
            Content = "修改成功",
            Icon = "bolt"
        })
    end
})

Tab5Section:Button({
    Title = "Tuber93音乐",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://6129291390"
sound:Play()
        WindUI:Notify({
            Title = "开始播放✅",
            Content = "播放",
            Icon = "bolt"
        })
    end
})

Tab5Section:Button({
    Title = "Tuber93说话",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://7153945201"
sound:Play()
        WindUI:Notify({
            Title = "播放成功✅",
            Content = "开始播放",
            Icon = "bolt"
        })
    end
})

Tab5Section:Button({
    Title = "Tuber93弹窗",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://6129291390"
sound:Play()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")


local LocalPlayer = Players.LocalPlayer


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ImageNotification"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")


local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageNotificationImage"
ImageLabel.Size = UDim2.new(1, 0, 1, 0) 
ImageLabel.BackgroundTransparency = 0 
ImageLabel.Image = "rbxassetid://4891344370" 
ImageLabel.ImageColor3 = Color3.new(1, 1, 1) 
ImageLabel.ZIndex = 10
ImageLabel.Parent = ScreenGui


local function showImageNotification()
    ScreenGui.Enabled = true
end


local function hideImageNotification()
    ScreenGui.Enabled = false
end


showImageNotification()


wait(5)
hideImageNotification()
        WindUI:Notify({
            Title = "开启成功✅",
            Content = "已显示",
            Icon = "bolt"
        })
    end
})

local Tab6 = MainWindow:Tab({
    Title = "绘制",
    Icon = "bolt"  -- 标签页图标
})

local Tab6Section = Tab6:Section({
    Title = "玩家绘制",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local playerESP = {
    enabled = false,
    drawings = {}, -- 存储所有绘制对象，便于关闭时清理
    connections = {} -- 存储所有事件连接，便于关闭时断开
}

local Tab6Toggle_NameTag = Tab6Section:Toggle({
    Title = "绘制玩家名字",
    Desc = "在玩家头顶显示名字标签（仅本地可见）",
    Default = false,
    Callback = function(isEnabled)
        playerESP.enabled = isEnabled
        
        -- 弹出状态提示
        WindUI:Notify({
            Title = "玩家名字绘制",
            Content = isEnabled and "✅ 已开启玩家名字标签" or "❌ 已关闭玩家名字标签",
            Icon = "user-tag",
            Duration = 3
        })

        if isEnabled then
            -- 开启ESP：初始化绘制
            local c = workspace.CurrentCamera
            local ps = game:GetService("Players")
            local lp = ps.LocalPlayer
            local rs = game:GetService("RunService")

            -- 绘制单个玩家名字的函数
            local function esp(p, cr)
                local h = cr:FindFirstChildOfClass("Humanoid")
                local hrp = cr:FindFirstChild("Head")
                if not h or not hrp then return end

                -- 创建文本绘制对象
                local text = Drawing.new("Text")
                text.Visible = false
                text.Center = true
                text.Outline = false
                text.Font = 3
                text.Size = 16.16
                text.Color = Color3.new(170, 170, 170)

                -- 存储绘制对象和连接，便于后续清理
                local drawId = tostring(p.UserId) .. "_" .. tostring(cr:GetHashCode())
                playerESP.drawings[drawId] = text

                -- 断开连接和清理绘制的函数
                local function dc()
                    if playerESP.drawings[drawId] then
                        playerESP.drawings[drawId].Visible = false
                        playerESP.drawings[drawId]:Remove()
                        playerESP.drawings[drawId] = nil
                    end
                    if playerESP.connections[drawId] then
                        for _, conn in pairs(playerESP.connections[drawId]) do
                            conn:Disconnect()
                        end
                        playerESP.connections[drawId] = nil
                    end
                end

                -- 监听角色移除、死亡事件
                local connections = {}
                connections.ancestry = cr.AncestryChanged:Connect(function(_, parent)
                    if not parent then dc() end
                end)
                connections.health = h.HealthChanged:Connect(function(v)
                    if v <= 0 or h:GetState() == Enum.HumanoidStateType.Dead then dc() end
                end)
                connections.render = rs.RenderStepped:Connect(function()
                    -- 仅在ESP开启时更新绘制
                    if not playerESP.enabled then return end
                    
                    local hrp_pos, hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
                    if hrp_onscreen then
                        text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y - 27)
                        text.Text = "[ " .. p.Name .. " ]"
                        text.Visible = true
                    else
                        text.Visible = false
                    end
                end)

                playerESP.connections[drawId] = connections
            end

            -- 玩家加入时初始化ESP
            local function p_added(p)
                if p == lp then return end -- 跳过本地玩家
                local function initESP(cr)
                    if playerESP.enabled then esp(p, cr) end
                end
                if p.Character then initESP(p.Character) end
                p.CharacterAdded:Connect(initESP)
            end

            -- 初始化现有玩家
            for _, p in pairs(ps:GetPlayers()) do
                p_added(p)
            end
            -- 监听新玩家加入
            table.insert(playerESP.connections, ps.PlayerAdded:Connect(p_added))
        else
            -- 关闭ESP：清理所有绘制和连接
            for _, draw in pairs(playerESP.drawings) do
                draw.Visible = false
                draw:Remove()
            end
            playerESP.drawings = {}

            for _, connTable in pairs(playerESP.connections) do
                if type(connTable) == "table" then
                    for _, conn in pairs(connTable) do
                        conn:Disconnect()
                    end
                else
                    connTable:Disconnect()
                end
            end
            playerESP.connections = {}
        end
    end
})

local playerHighlight = {
    enabled = false,
    storage = nil, -- 存储Highlight实例的文件夹
    connections = {} -- 存储事件连接
}

local Tab6Toggle_Highlight = Tab6Section:Toggle({
    Title = "玩家边框高亮",
    Desc = "用高亮边框标记所有玩家（队友绿色/默认青色，仅本地可见）",
    Default = false,
    Callback = function(isEnabled)
        playerHighlight.enabled = isEnabled
        
        -- 弹出状态提示
        WindUI:Notify({
            Title = "玩家边框高亮",
            Content = isEnabled and "✅ 已开启玩家高亮边框" or "❌ 已关闭玩家高亮边框",
            Icon = "highlight",
            Duration = 3
        })

        if isEnabled then
            -- 初始化高亮存储文件夹
            local CoreGui = game:GetService("CoreGui")
            playerHighlight.storage = Instance.new("Folder")
            playerHighlight.storage.Name = "Highlight_Storage"
            playerHighlight.storage.Parent = CoreGui

            local Players = game:GetService("Players")
            local lp = Players.LocalPlayer

            -- 高亮配置（可自定义）
            local highlightConfig = {
                FillColor = Color3.fromRGB(65, 255, 0), -- 默认填充色（队友沿用）
                EnemyFillColor = Color3.fromRGB(0, 255, 255), -- 敌人填充色
                DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, -- 始终显示在最上层
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(255, 255, 255),
                OutlineTransparency = 0
            }

            -- 为单个玩家创建高亮
            local function createHighlight(plr)
                if plr == lp then return end -- 跳过本地玩家

                local highlight = Instance.new("Highlight")
                highlight.Name = plr.Name
                -- 按队伍设置填充色
                highlight.FillColor = (plr.TeamColor == lp.TeamColor) and highlightConfig.FillColor or highlightConfig.EnemyFillColor
                highlight.DepthMode = highlightConfig.DepthMode
                highlight.FillTransparency = highlightConfig.FillTransparency
                highlight.OutlineColor = highlightConfig.OutlineColor
                highlight.OutlineTransparency = highlightConfig.OutlineTransparency
                highlight.Parent = playerHighlight.storage

                -- 绑定角色
                if plr.Character then
                    highlight.Adornee = plr.Character
                end

                -- 监听角色重生
                playerHighlight.connections[plr] = plr.CharacterAdded:Connect(function(char)
                    highlight.Adornee = char
                    -- 角色切换时更新队伍颜色
                    highlight.FillColor = (plr.TeamColor == lp.TeamColor) and highlightConfig.FillColor or highlightConfig.EnemyFillColor
                end)
            end

            -- 初始化现有玩家
            for _, plr in pairs(Players:GetPlayers()) do
                createHighlight(plr)
            end

            -- 监听新玩家加入
            table.insert(playerHighlight.connections, Players.PlayerAdded:Connect(createHighlight))

            -- 监听玩家离开，清理高亮
            table.insert(playerHighlight.connections, Players.PlayerRemoving:Connect(function(plr)
                if playerHighlight.storage and playerHighlight.storage:FindFirstChild(plr.Name) then
                    playerHighlight.storage[plr.Name]:Destroy()
                end
                if playerHighlight.connections[plr] then
                    playerHighlight.connections[plr]:Disconnect()
                    playerHighlight.connections[plr] = nil
                end
            end))
        else
            -- 关闭时清理所有资源
            if playerHighlight.storage then
                playerHighlight.storage:Destroy()
                playerHighlight.storage = nil
            end
            for _, conn in pairs(playerHighlight.connections) do
                if typeof(conn) == "RBXScriptConnection" then
                    conn:Disconnect()
                end
            end
            playerHighlight.connections = {}
        end
    end
})

local playerBoxESP = {
    enabled = false,
    drawings = {}, -- 存储所有玩家的线条绘制对象
    connections = {} -- 存储所有事件连接（便于关闭时断开）
}

local Tab6Toggle_Box = Tab6Section:Toggle({
    Title = "绘制玩家方框",
    Desc = "在玩家周围绘制矩形方框（队友绿色/敌人红色，仅本地可见）",
    Default = false,
    Callback = function(isEnabled)
        playerBoxESP.enabled = isEnabled
        
        -- 弹出状态提示
        WindUI:Notify({
            Title = "玩家方框绘制",
            Content = isEnabled and "✅ 已开启玩家方框ESP" or "❌ 已关闭玩家方框ESP",
            Icon = "square",
            Duration = 3
        })

        if isEnabled then
            local plr = game.Players.LocalPlayer
            local camera = workspace.CurrentCamera
            local rs = game:GetService("RunService")
            local ps = game:GetService("Players")

            -- 为单个玩家创建方框线条
            local function createBoxForPlayer(targetPlr)
                if targetPlr == plr then return end -- 跳过本地玩家

                -- 创建方框的四条边
                local lines = {
                    Top = Drawing.new("Line"),
                    Bottom = Drawing.new("Line"),
                    Left = Drawing.new("Line"),
                    Right = Drawing.new("Line")
                }

                -- 初始化线条属性
                for _, line in pairs(lines) do
                    line.Visible = false
                    line.From = Vector2.new(0, 0)
                    line.To = Vector2.new(200, 200)
                    line.Color = Color3.fromRGB(255, 0, 0) -- 默认敌人红色
                    line.Thickness = 2
                    line.Transparency = 1
                end

                -- 存储线条，用玩家ID作为键
                local plrKey = "plr_" .. targetPlr.UserId
                playerBoxESP.drawings[plrKey] = lines

                -- 角色加载后绑定ESP逻辑
                local function bindToCharacter(character)
                    if not character then return end
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if not humanoid or not hrp then return end

                    -- 实时更新方框位置和状态
                    local renderConn = rs.RenderStepped:Connect(function()
                        if not playerBoxESP.enabled then
                            for _, line in pairs(lines) do line.Visible = false end
                            return
                        end

                        -- 角色死亡/消失时隐藏方框
                        if humanoid.Health <= 0 or humanoid:GetState() == Enum.HumanoidStateType.Dead then
                            for _, line in pairs(lines) do line.Visible = false end
                            return
                        end

                        -- 计算玩家在屏幕上的位置
                        local _, onScreen = camera:WorldToViewportPoint(hrp.Position)
                        if not onScreen then
                            for _, line in pairs(lines) do line.Visible = false end
                            return
                        end

                        -- 基于角色头部尺寸计算方框大小
                        local scale = character.Head.Size.Y / 2
                        local size = Vector3.new(2, 3, 0) * (scale * 2)

                        -- 计算方框四个角的屏幕坐标
                        local tl = camera:WorldToViewportPoint((hrp.CFrame * CFrame.new(size.X, size.Y, 0)).p)
                        local tr = camera:WorldToViewportPoint((hrp.CFrame * CFrame.new(-size.X, size.Y, 0)).p)
                        local bl = camera:WorldToViewportPoint((hrp.CFrame * CFrame.new(size.X, -size.Y, 0)).p)
                        local br = camera:WorldToViewportPoint((hrp.CFrame * CFrame.new(-size.X, -size.Y, 0)).p)

                        -- 更新线条位置
                        lines.Top.From = Vector2.new(tl.X, tl.Y)
                        lines.Top.To = Vector2.new(tr.X, tr.Y)
                        lines.Left.From = Vector2.new(tl.X, tl.Y)
                        lines.Left.To = Vector2.new(bl.X, bl.Y)
                        lines.Right.From = Vector2.new(tr.X, tr.Y)
                        lines.Right.To = Vector2.new(br.X, br.Y)
                        lines.Bottom.From = Vector2.new(bl.X, bl.Y)
                        lines.Bottom.To = Vector2.new(br.X, br.Y)

                        -- 按队伍切换颜色（队友绿/敌人红）
                        local boxColor = (targetPlr.TeamColor == plr.TeamColor) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                        for _, line in pairs(lines) do
                            line.Color = boxColor
                            line.Visible = true
                        end
                    end)

                    -- 存储连接，便于后续断开
                    table.insert(playerBoxESP.connections, renderConn)
                end

                -- 绑定当前角色，监听角色重生
                if targetPlr.Character then
                    bindToCharacter(targetPlr.Character)
                end
                local charAddedConn = targetPlr.CharacterAdded:Connect(bindToCharacter)
                table.insert(playerBoxESP.connections, charAddedConn)
            end

            -- 初始化现有玩家
            for _, targetPlr in pairs(ps:GetPlayers()) do
                createBoxForPlayer(targetPlr)
            end

            -- 监听新玩家加入
            local playerAddedConn = ps.PlayerAdded:Connect(createBoxForPlayer)
            table.insert(playerBoxESP.connections, playerAddedConn)

            -- 监听玩家离开，清理线条
            local playerRemovingConn = ps.PlayerRemoving:Connect(function(targetPlr)
                local plrKey = "plr_" .. targetPlr.UserId
                if playerBoxESP.drawings[plrKey] then
                    for _, line in pairs(playerBoxESP.drawings[plrKey]) do
                        line.Visible = false
                        line:Remove()
                    end
                    playerBoxESP.drawings[plrKey] = nil
                end
            end)
            table.insert(playerBoxESP.connections, playerRemovingConn)
        else
            -- 关闭时清理所有资源
            -- 销毁所有绘制线条
            for _, lines in pairs(playerBoxESP.drawings) do
                for _, line in pairs(lines) do
                    line.Visible = false
                    line:Remove()
                end
            end
            playerBoxESP.drawings = {}

            -- 断开所有事件连接
            for _, conn in pairs(playerBoxESP.connections) do
                if typeof(conn) == "RBXScriptConnection" then
                    conn:Disconnect()
                end
            end
            playerBoxESP.connections = {}
        end
    end
})

local skeletonESP = {
    enabled = false,
    skeletons = {}, -- 存储所有骨骼ESP实例
    library = nil -- 存储骨骼库对象
}

local Tab6Toggle_Skeleton = Tab6Section:Toggle({
    Title = "透视骨骼ESP",
    Desc = "显示玩家骨骼结构（穿透墙壁可见，仅本地）",
    Default = false,
    Callback = function(isEnabled)
        skeletonESP.enabled = isEnabled
        
        -- 弹出状态提示
        WindUI:Notify({
            Title = "透视骨骼",
            Content = isEnabled and "✅ 已开启玩家骨骼透视" or "❌ 已关闭玩家骨骼透视",
            Icon = "bone",
            Duration = 3
        })

        if isEnabled then
            -- 加载骨骼库（仅首次开启时加载）
            if not skeletonESP.library then
                local success, lib = pcall(function()
                    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()
                end)
                if not success then
                    WindUI:Notify({
                        Title = "加载失败",
                        Content = "❌ 骨骼库加载失败，请检查网络",
                        Icon = "x-circle",
                        Duration = 3
                    })
                    skeletonESP.enabled = false
                    return
                end
                skeletonESP.library = lib
            end

            local ps = game:GetService("Players")
            local lp = ps.LocalPlayer

            -- 为单个玩家创建骨骼ESP
            local function createSkeleton(Player)
                if Player == lp or not skeletonESP.library then return end
                -- 检查是否已存在该玩家的骨骼实例
                for _, skel in pairs(skeletonESP.skeletons) do
                    if skel.Player == Player then return end
                end
                -- 创建骨骼并存储
                local skel = skeletonESP.library:NewSkeleton(Player, true)
                skel.Visible = true -- 显示骨骼
                table.insert(skeletonESP.skeletons, skel)
            end

            -- 初始化现有玩家
            for _, Player in pairs(ps:GetPlayers()) do
                createSkeleton(Player)
            end

            -- 监听新玩家加入
            skeletonESP.playerAddedConn = ps.PlayerAdded:Connect(createSkeleton)
        else
            -- 关闭时隐藏所有骨骼并清理
            if skeletonESP.skeletons then
                for _, skel in pairs(skeletonESP.skeletons) do
                    if skel.Visible ~= nil then
                        skel.Visible = false -- 隐藏骨骼
                    end
                end
                skeletonESP.skeletons = {}
            end
            -- 断开玩家加入监听
            if skeletonESP.playerAddedConn then
                skeletonESP.playerAddedConn:Disconnect()
                skeletonESP.playerAddedConn = nil
            end
        end
    end
})

-- 创建音频标签页
local Tab7 = MainWindow:Tab({
    Title = "音频播放",
    Icon = "bolt"
})

-- 创建音频功能分区
local Tab7Section = Tab7:Section({
    Title = "趣味音频库",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

-- 音频播放通用函数（简化代码）
local function createSoundButton(title, soundId, icon, colorHex)
    Tab7Section:Button({
        Title = title,
        Icon = icon,
        Color = Color3.fromHex(colorHex),
        Callback = function()
            -- 创建并播放音频
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. soundId
            sound.Volume = 1 -- 音量（0-1可调整）
            sound.Parent = game.Workspace
            sound:Play()
            
            -- 播放完成后自动销毁音频实例
            sound.Ended:Connect(function()
                sound:Destroy()
            end)
            
            -- 弹出提示
            WindUI:Notify({
                Title = "音频播放",
                Content = "▶️ 正在播放：" .. title,
                Icon = "music",
                Duration = 2
            })
        end
    })
end

-- 音频按钮列表（按原顺序排列，自定义图标和颜色）
createSoundButton("国歌", "1845918434", "flag", "#FF0000")
createSoundButton("钢管落地", "6011094380", "wrench", "#888888")
createSoundButton("钢管落地【全损音质】", "6729922069", "wrench-off", "#555555")
createSoundButton("化粪池爆炸", "3175432527", "explosion", "#964B00")
createSoundButton("串稀", "4809574295", "droplets", "#4CAF50")
createSoundButton("全损音质【串稀】", "6445594239", "droplets-off", "#2E7D32")
createSoundButton("在我们之中", "6453086701", "users", "#42A5F5")
createSoundButton("doors拿金币", "8646410774", "coin", "#FFD700")
createSoundButton("苹果手机【闹钟】", "4203251375", "bell", "#666666")



local Tab8 = MainWindow:Tab({
    Title = "凹凸世界自由森林",
    Icon = "bolt"  -- 标签页图标
})

local Tab8Section = Tab8:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local Tab8Toggle_GetAllSkins = Tab8Section:Toggle({
    Title = "获取所有装扮",
    Desc = "点击开启即可触发获取全部装扮",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Project", 5)
            if not remote then return end
            remote = remote:WaitForChild("RemoteEvent", 5)
            if not remote then return end
            remote = remote:WaitForChild("ControlMessageEvent", 5)
            if not remote then return end
            for i = 1, 4 do
                local args = {2, {2, i}}
                pcall(function() remote:FireServer(unpack(args)) end)
            end
            WindUI:Notify({
                Title = "装扮获取",
                Content = "✅ 已发送所有装扮获取请求",
                Icon = "tshirt",
                Duration = 3
            })
            Tab8Toggle_GetAllSkins:SetValue(false) -- 变量名与定义一致
        end
    end
})

-- 获取裁判球（循环功能，开关控制启停）
local loopConnection = nil
local Tab8Toggle_GetRefBall = Tab8Section:Toggle({ -- 修复：变量名唯一
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

local Tab9 = MainWindow:Tab({
    Title = "强壮传奇",
    Icon = "bolt"  -- 标签页图标
})

local Tab9Section = Tab9:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local Tab9Toggle_AutoEat = Tab9Section:Toggle({
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
local Tab9Toggle_AutoSell = Tab9Section:Toggle({
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

local Tab9Toggle_AutoPunch = Tab9Section:Toggle({
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

local Tab9Toggle_AutoStomp = Tab9Section:Toggle({
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

Tab9Section:Button({
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

local Tab10 = MainWindow:Tab({
    Title = "自然灾害",
    Icon = "bolt"  -- 标签页图标
})

local Tab10Section = Tab10:Section({
    Title = "黑洞合集",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

-- 黑洞V1按钮
Tab10Section:Button({
    Title = "黑洞V1",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V1.lua.txt"))()
        end)
        if success then
            WindUI:Notify({
                Title = "黑洞V1",
                Content = "✅ 已成功加载黑洞V1",
                Icon = "black-hole"
            })
        else
            WindUI:Notify({
                Title = "加载失败",
                Content = "❌ 黑洞V1加载出错：" .. err,
                Icon = "x-circle"
            })
        end
    end
})

-- 黑洞V3按钮
Tab10Section:Button({
    Title = "黑洞V3",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V3.txt"))()
        end)
        if success then
            WindUI:Notify({
                Title = "黑洞V3",
                Content = "✅ 已成功加载黑洞V3",
                Icon = "black-hole"
            })
        else
            WindUI:Notify({
                Title = "加载失败",
                Content = "❌ 黑洞V3加载出错：" .. err,
                Icon = "x-circle"
            })
        end
    end
})

-- 黑洞V4按钮
Tab10Section:Button({
    Title = "黑洞V4",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V4.txt"))()
        end)
        if success then
            WindUI:Notify({
                Title = "黑洞V4",
                Content = "✅ 已成功加载黑洞V4",
                Icon = "black-hole"
            })
        else
            WindUI:Notify({
                Title = "加载失败",
                Content = "❌ 黑洞V4加载出错：" .. err,
                Icon = "x-circle"
            })
        end
    end
})

-- 黑洞V5按钮
Tab10Section:Button({
    Title = "黑洞V5",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V5.txt"))()
        end)
        if success then
            WindUI:Notify({
                Title = "黑洞V5",
                Content = "✅ 已成功加载黑洞V5",
                Icon = "black-hole"
            })
        else
            WindUI:Notify({
                Title = "加载失败",
                Content = "❌ 黑洞V5加载出错：" .. err,
                Icon = "x-circle"
            })
        end
    end
})

-- 黑洞V6按钮
Tab10Section:Button({
    Title = "黑洞V6",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V6.txt"))()
        end)
        if success then
            WindUI:Notify({
                Title = "黑洞V6",
                Content = "✅ 已成功加载黑洞V6",
                Icon = "black-hole"
            })
        else
            WindUI:Notify({
                Title = "加载失败",
                Content = "❌ 黑洞V6加载出错：" .. err,
                Icon = "x-circle"
            })
        end
    end
})

local Tab11 = MainWindow:Tab({
    Title = "造船寻宝",
    Icon = "bolt"  -- 标签页图标
})

local Tab11Section = Tab11:Section({
    Title = "刷金币",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab11Section:Button({
    Title = "自动刷金币",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local positions = {
    Vector3.new(-59.20, 0.57, 1182.52),
    Vector3.new(-54.12, 8.71, 1689.17),
    Vector3.new(-41.68, 3.59, 2519.15),
    Vector3.new(-53.87, 32.09, 3179.87),
    Vector3.new(-60.09, 14.87, 4018.43),
    Vector3.new(-75.24, 20.15, 4773.91),
    Vector3.new(-61.26, 16.50, 5534.33),
    Vector3.new(-58.33, 14.65, 6296.06),
    Vector3.new(-52.90, 13.00, 7157.79),
    Vector3.new(-48.33, 26.10, 7850.43),
    Vector3.new(-64.59, 23.17, 8472.87),
    Vector3.new(-47.24, -333.20, 8726.69),
    Vector3.new(-57.57, -353.98, 9359.17),
    Vector3.new(-58.00, -354.70, 9490.83)
}

for _, pos in ipairs(positions) do
    local startTime = tick()
    
    -- 在该坐标固定1.5秒钟
    while tick() - startTime < 1.5 do
        humanoidRootPart.CFrame = CFrame.new(pos)
        task.wait() -- 每帧传送一次以确保位置固定
    end
    
    -- 可选：短暂等待后再移动到下一个坐标
    task.wait(0.1)
end
        WindUI:Notify({
            Title = "成功刷完一次✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- 坐标列表
local positions = {
    Vector3.new(-59.20, 0.57, 1182.52),
    Vector3.new(-54.12, 8.71, 1689.17),
    Vector3.new(-41.68, 3.59, 2519.15),
    Vector3.new(-53.87, 32.09, 3179.87),
    Vector3.new(-60.09, 14.87, 4018.43),
    Vector3.new(-75.24, 20.15, 4773.91),
    Vector3.new(-61.26, 16.50, 5534.33),
    Vector3.new(-58.33, 14.65, 6296.06),
    Vector3.new(-52.90, 13.00, 7157.79),
    Vector3.new(-48.33, 26.10, 7850.43),
    Vector3.new(-64.59, 23.17, 8472.87),
    Vector3.new(-47.24, -333.20, 8726.69),
    Vector3.new(-57.57, -353.98, 9359.17),
    Vector3.new(-58.00, -354.70, 9490.83)
}

local isTeleporting = false

local Tab11Toggle = Tab11Section:Toggle({
    Title = "自动刷金币［自动版］",
    Desc = "这是凭运气中途可能死亡👀",
    Default = false,
    Callback = function(isEnabled)
        isTeleporting = isEnabled
        
        WindUI:Notify({
            Title = "自动传送",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "bolt",
            Duration = 3
        })
        
        if isEnabled then
            -- 开启时启动循环传送
            task.spawn(function()
                while isTeleporting do
                    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    
                    -- 循环传送所有坐标
                    for _, pos in ipairs(positions) do
                        if not isTeleporting then break end -- 检查是否关闭
                        
                        local startTime = tick()
                        while tick() - startTime < 1.5 and isTeleporting do
                            humanoidRootPart.CFrame = CFrame.new(pos)
                            task.wait()
                        end
                        
                        if not isTeleporting then break end -- 再次检查是否关闭
                        task.wait(0.1)
                    end
                    
                    -- 如果仍然开启，继续下一轮循环
                    if isTeleporting then
                        WindUI:Notify({
                            Title = "自动传送",
                            Content = "🔁 开始新一轮传送循环",
                            Icon = "refresh",
                            Duration = 2
                        })
                    end
                end
            end)
        end
    end 
})

Tab11Section:Button({
    Title = "飞车",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/63T0fkBm"))()
        WindUI:Notify({
            Title = "飞车开启成功✅",
            Content = "坐上载具能同载具一起飞",
            Icon = "bolt"
        })
    end
})

local Tab11Section = Tab11:Section({
    Title = "传送",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab11Section:Button({
    Title = "传送至紫队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( 377.18,  -9.17,  647.20)
        WindUI:Notify({
            Title = "已传送至紫队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至黄队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -483.94,  -9.17,  639.88)
        WindUI:Notify({
            Title = "已传送至黄队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至蓝队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( 375.78,  -9.17,  301.21)
        WindUI:Notify({
            Title = "已传送至蓝队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至绿队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -483.14,  -9.17,  293.13)
        WindUI:Notify({
            Title = "已传送至绿队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至红队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( 375.27,  -9.17,  -64.94)
        WindUI:Notify({
            Title = "已传送至红队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至黑队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -483.38,  -9.17,  -69.95)
        WindUI:Notify({
            Title = "已传送至黑队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

Tab11Section:Button({
    Title = "传送至白队",
    Icon = "bolt",
    Color = Color3.fromHex("#000000"), 
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -49.86,  -9.17,  -497.90)
        WindUI:Notify({
            Title = "已传送至白队✅",
            Content = "小提示✅",
            Icon = "bolt"
        })
    end
})

local Tab12 = MainWindow:Tab({
    Title = "极速传奇",
    Icon = "bolt"
})

local Tab12Section = Tab12:Section({
    Title = "自动功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local isRunning = false
local loopConnection = nil

local Tab12Toggle = Tab12Section:Toggle({
    Title = "自动收集所有颜色的球和钻石",
    Desc = "自动收集蓝球、红球、钻石、橙球、黄球",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            if not isRunning then
                isRunning = true
                loopConnection = task.spawn(function()
                    while isRunning do
                        local orbsToCollect = {
                            "Blue Orb",
                            "Red Orb", 
                            "Gem",
                            "Orange Orb",
                            "Yellow Orb"
                        }
                        
                        for _, orbName in ipairs(orbsToCollect) do
                            if not isRunning then break end
                            
                            local args = {
                                "collectOrb",
                                orbName,
                                "City"
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
                            task.wait(0.0)
                        end
                        task.wait(1)
                    end
                end)
            end
            WindUI:Notify({
                Title = "自动收集",
                Content = "✅ 已开启自动收集功能",
                Icon = "bolt",
                Duration = 3
            })
        else
            isRunning = false
            if loopConnection then
                task.cancel(loopConnection)
                loopConnection = nil
            end
            WindUI:Notify({
                Title = "自动收集",
                Content = "❌ 已关闭自动收集功能",
                Icon = "bolt",
                Duration = 3
            })
        end
    end 
})

Tab12Section:Button({
    Title = "解锁所有通行证",
    Icon = "unlock",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        for i, v in ipairs(game:GetService("ReplicatedStorage").gamepassIds:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.ownedGamepasses
        end
        WindUI:Notify({
                Title = "通行证解锁",
                Content = "✅ 所有通行证已解锁",
                Icon = "unlock"
            })
    end
})

Tab12Section:Button({
    Title = "快速刷升级",
    Icon = "trending-up",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/T9wTL150"))()
        WindUI:Notify({
                Title = "刷级脚本",
                Content = "✅ 已加载外部刷级脚本",
                Icon = "trending-up"
            })
    end
})

-- 如果需要滑块功能可以这样添加
local Tab12Slider = Tab1Section:Slider({
    Title = "收集间隔时间",
    Desc = "设置自动收集的时间间隔",
    Step = 0.1,
    Value = {
        Min = 0.1,
        Max = 5.0,
        Default = 1.0
    },
    Callback = function(value)
        -- 这里可以添加调整收集间隔的逻辑
        WindUI:Notify({
            Title = "间隔设置",
            Content = "收集间隔已设置为: " .. value .. "秒",
            Icon = "clock",
            Duration = 3
        })
    end
})

-- 下拉菜单示例
Tab12Section:Dropdown({
    Title = "收集模式",
    Values = {"快速模式", "普通模式", "安全模式"},
    Value = "普通模式",
    Callback = function(selected)
        if selected == "快速模式" then
            -- 快速模式逻辑
            WindUI:Notify({
                Title = "收集模式",
                Content = "✅ 已切换到快速模式",
                Icon = "zap"
            })
        elseif selected == "普通模式" then
            -- 普通模式逻辑
            WindUI:Notify({
                Title = "收集模式",
                Content = "✅ 已切换到普通模式",
                Icon = "settings"
            })
        elseif selected == "安全模式" then
            -- 安全模式逻辑
            WindUI:Notify({
                Title = "收集模式",
                Content = "✅ 已切换到安全模式",
                Icon = "shield"
            })
        end
    end
})

local Tab13 = MainWindow:Tab({
    Title = "力量传奇［主要功能］",
    Icon = "bolt"
})

local Tab13Section = Tab13:Section({
    Title = "实用功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab13Section:Toggle({
    Title = "自动比赛开关",
    Desc = "自动参加比赛",
    Default = false,
    Callback = function(isEnabled)
        while isEnabled do
            task.wait(2)
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
        end
        WindUI:Notify({
            Title = "自动比赛",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "trophy",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动举哑铃",
    Desc = "自动进行哑铃训练",
    Default = false,
    Callback = function(isEnabled)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while isEnabled do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Weight" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        if not isEnabled and part then
            part:Destroy()
        end
        WindUI:Notify({
            Title = "自动举哑铃",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "dumbbell",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动俯卧撑",
    Desc = "自动进行俯卧撑训练",
    Default = false,
    Callback = function(isEnabled)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while isEnabled do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Pushups" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        if not isEnabled and part then
            part:Destroy()
        end
        WindUI:Notify({
            Title = "自动俯卧撑",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动仰卧起坐",
    Desc = "自动进行仰卧起坐训练",
    Default = false,
    Callback = function(isEnabled)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while isEnabled do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Situps" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        if not isEnabled and part then
            part:Destroy()
        end
        WindUI:Notify({
            Title = "自动仰卧起坐",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "user",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动倒立身体",
    Desc = "自动进行倒立训练",
    Default = false,
    Callback = function(isEnabled)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while isEnabled do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Handstands" then
                        v.Parent = character
                    end
                end
                
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
        end
        
        if not isEnabled and part then
            part:Destroy()
        end
        WindUI:Notify({
            Title = "自动倒立身体",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "rotate-ccw",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动锻炼",
    Desc = "自动进行综合锻炼",
    Default = false,
    Callback = function(isEnabled)
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        
        while isEnabled do
            task.wait()
            local character = game.Players.LocalPlayer.Character
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                end
                
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
        
        if not isEnabled and part then
            part:Destroy()
        end
        WindUI:Notify({
            Title = "自动锻炼",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "zap",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动重生",
    Desc = "自动进行重生",
    Default = false,
    Callback = function(isEnabled)
        while isEnabled do
            task.wait()
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
        end
        WindUI:Notify({
            Title = "自动重生",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "refresh-cw",
            Duration = 3
        })
    end 
})

Tab13Section:Button({
    Title = "收集宝石",
    Icon = "gem",
    Color = Color3.fromHex("#000000"),
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
        WindUI:Notify({
            Title = "收集宝石",
            Content = "✅ 宝石收集完成",
            Icon = "gem"
        })
    end
})

Tab13Section:Button({
    Title = "传送到幸运抽奖区域",
    Icon = "gift",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-2606, -2, 5753)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到幸运抽奖区域",
            Icon = "map-pin"
        })
    end
})

local Tab13Section = Tab13:Section({
    Title = "传送功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab13Section:Button({
    Title = "传送到肌肉之王健身房",
    Icon = "building",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-8554, 22, -5642)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到肌肉之王健身房",
            Icon = "map-pin"
        })
    end
})

Tab13Section:Button({
    Title = "传送到传说健身房",
    Icon = "castle",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(4676, 997, -3915)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到传说健身房",
            Icon = "map-pin"
        })
    end
})

Tab13Section:Button({
    Title = "传送到永恒健身房",
    Icon = "infinity",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-6686, 13, -1284)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到永恒健身房",
            Icon = "map-pin"
        })
    end
})

Tab13Section:Button({
    Title = "传送到神话健身房",
    Icon = "sparkles",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(2177, 13, 1070)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到神话健身房",
            Icon = "map-pin"
        })
    end
})

Tab13Section:Button({
    Title = "传送到冰霜健身房",
    Icon = "snowflake",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-2543, 13, -410)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到冰霜健身房",
            Icon = "map-pin"
        })
    end
})

Tab13Section:Button({
    Title = "传送到丛林健身房",
    Icon = "tree-pine",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-8760.79, 46.58, 2394.51)
            end
        end
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送到丛林健身房",
            Icon = "map-pin"
        })
    end
})

local Tab13Section = Tab13:Section({
    Title = "［自动锻炼］建议把体型调成2",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab13Section:Toggle({
    Title = "自动打石头0",
    Desc = "耐久度要求：无",
    Default = false,
    Callback = function(isEnabled)
        getgenv().rock = isEnabled
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
        WindUI:Notify({
            Title = "自动打石头0",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头10",
    Desc = "耐久度要求：10",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 10 then
            getgenv().rock = isEnabled
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
        else
            WindUI:Notify({
                Title = "自动打石头10",
                Content = "❌ 耐久度不足10",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头10",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

local Tab13Section = Tab13:Section({
    Title = "自动打石头功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab13Section:Toggle({
    Title = "自动打石头100",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
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
        else
            WindUI:Notify({
                Title = "自动打石头100",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头100",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头5000",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
            while getgenv().rock do
                wait()
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(283.42, 3.71, -590.84, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928)
            end
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        else
            WindUI:Notify({
                Title = "自动打石头5000",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头5000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头150000",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
            while getgenv().rock do
                wait()
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2585.99, 17.38, -249.59)
            end
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        else
            WindUI:Notify({
                Title = "自动打石头150000",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头150000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头400000",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
            while getgenv().rock do
                wait()
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                    end
                end
                for _,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if h:IsA("Tool") and h.Name == "Punch" then
                        h:Activate()
                    end
                end
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2220.94, 12.67, 1252.67)
            end
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        else
            WindUI:Notify({
                Title = "自动打石头400000",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头400000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头500万",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
            while getgenv().rock do
                task.wait()
                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool)
                    end
                end
                
                for _, tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name == "Punch" then
                        tool:Activate()
                    end
                end
                
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(-8919.20, 40.01, -6014.81)
                    end
                end
            end
            
            if not getgenv().rock then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        else
            WindUI:Notify({
                Title = "自动打石头500万",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头500万",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "自动打石头1000万",
    Desc = "耐久度要求：100",
    Default = false,
    Callback = function(isEnabled)
        if game.Players.LocalPlayer.Durability.Value >= 100 then
            getgenv().rock = isEnabled
            while getgenv().rock and task.wait() do
                local character = game.Players.LocalPlayer.Character
                local backpack = game.Players.LocalPlayer.Backpack
                
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
                
                if character then
                    for _, tool in ipairs(character:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Punch" then
                            tool:Activate()
                        end
                    end
                    
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(-7689.18, 61.99, 2869.29)
                    end
                end
            end
            
            if not getgenv().rock then
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:UnequipTools()
                    end
                end
            end
        else
            WindUI:Notify({
                Title = "自动打石头1000万",
                Content = "❌ 耐久度不足100",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
        WindUI:Notify({
            Title = "自动打石头1000万",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "hammer",
            Duration = 3
        })
    end 
})

local Tab3Section = Tab3:Section({
    Title = "［跑步机］建议把体型调成1再跑",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab13Section:Toggle({
    Title = "沙滩跑步机10",
    Desc = "敏捷度：10",
    Default = false,
    Callback = function(isEnabled)
        getgenv().PPJ10 = isEnabled
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
        WindUI:Notify({
            Title = "沙滩跑步机10",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "健身房跑步机1000",
    Desc = "敏捷度：1000",
    Default = false,
    Callback = function(isEnabled)
        getgenv().PPJ10 = isEnabled
        
        if isEnabled then
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-394.19, 13.23, -262.74)
                    end
                end
            end
            
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
            
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
        WindUI:Notify({
            Title = "健身房跑步机1000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "神话健身房跑步机3000",
    Desc = "敏捷度：3000",
    Default = false,
    Callback = function(isEnabled)
        getgenv().PPJ10 = isEnabled
        
        if isEnabled then
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        rootPart.CFrame = CFrame.new(2659.45, 21.64, 951.18)
                    end
                end
            end
            
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
            
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
        WindUI:Notify({
            Title = "神话健身房跑步机3000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "传奇跑步机10",
    Desc = "敏捷度：10",
    Default = false,
    Callback = function(isEnabled)
        getgenv().PPJ10 = isEnabled
        
        if isEnabled then
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        rootPart.CFrame = CFrame.new(4362.67, 999.36, -3650.33)
                    end
                end
            end
            
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
            
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
        WindUI:Notify({
            Title = "传奇跑步机10",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

Tab13Section:Toggle({
    Title = "丛林跑步机20000",
    Desc = "敏捷度：20000",
    Default = false,
    Callback = function(isEnabled)
        getgenv().PPJ10 = isEnabled
        
        if isEnabled then
            local function setupTreadmill()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoid then
                        humanoid.WalkSpeed = 10
                    end
                    
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-8133.48, 27.98, 2814.74)
                    end
                end
            end
            
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
            
            while getgenv().PPJ10 and task.wait() do
                setupTreadmill()
            end
        else
            game:GetService("RunService"):UnbindFromRenderStep("PPJ10_move")
        end
        WindUI:Notify({
            Title = "丛林跑步机20000",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "activity",
            Duration = 3
        })
    end 
})

local Tab14 = MainWindow:Tab({
    Title = "忍者传奇",
    Icon = "shield"
})

local Tab14Section = Tab14:Section({
    Title = "主要功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab14Section:Button({
    Title = "解锁所有岛屿",
    Icon = "map",
    Color = Color3.fromHex("#000000"),
    Callback = function()
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
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        for i, island in ipairs(islandCoordinates) do
            humanoidRootPart.CFrame = island.CFrame
            WindUI:Notify({
                Title = "解锁岛屿",
                Content = "已传送到：" .. island.Name .. "（" .. i .. "/" .. #islandCoordinates .. "）",
                Icon = "map-pin",
                Duration = 2
            })
            task.wait(2)
        end

        WindUI:Notify({
            Title = "解锁完成",
            Content = "✅ 所有岛屿已全部解锁并传送完毕！",
            Icon = "check-circle",
            Duration = 4
        })
    end
})

Tab14Section:Toggle({
    Title = "自动挥舞",
    Desc = "自动挥舞武器",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.swing = isEnabled
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
        WindUI:Notify({
            Title = "自动挥舞",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "sword",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "自动售卖",
    Desc = "自动售卖物品",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.sell = isEnabled
        local localPlayer = game.Players.LocalPlayer
        while Interstellar.sell do
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
            local character = localPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            if targetCircle and humanoidRootPart then
                firetouchinterest(targetCircle, humanoidRootPart, 0)
                firetouchinterest(targetCircle, humanoidRootPart, 1)
            end
            task.wait()
        end
        WindUI:Notify({
            Title = "自动售卖",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "shopping-bag",
            Duration = 3
        })
    end 
})

local Tab14Section = Tab14:Section({
    Title = "收集功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab14Section:Button({
    Title = "收集所有宝箱",
    Icon = "treasure-chest",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        getgenv().collectChest = true
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        for _, v in next, workspace:GetChildren() do
            while getgenv().collectChest and v and v.Parent and v.Name:find("Chest") do
                local circleInner = v:FindFirstChild("circleInner")
                if circleInner then
                    firetouchinterest(circleInner.CFrame, humanoidRootPart, 0)
                    firetouchinterest(circleInner.CFrame, humanoidRootPart, 1)
                end
                task.wait(0.5)
            end
        end
        getgenv().collectChest = false
        WindUI:Notify({
            Title = "收集宝箱",
            Content = "✅ 宝箱收集完成",
            Icon = "treasure-chest"
        })
    end
})

Tab14Section:Toggle({
    Title = "吸所有环",
    Desc = "自动收集环",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.hoops = isEnabled
        if Interstellar.hoops then
            while Interstellar.hoops do
                for i, v in ipairs(workspace.Hoops:GetChildren()) do
                    if v.Name == "Hoop" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                wait()
                for i, v in ipairs(workspace.Hoops.Hoop:GetChildren()) do
                    if v.Name == "touchPart" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
        WindUI:Notify({
            Title = "吸所有环",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "circle",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "收集气",
    Desc = "自动收集气",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.spawnedCoins = isEnabled
        local localPlayer = game.Players.LocalPlayer
        while Interstellar.spawnedCoins do
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
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
        WindUI:Notify({
            Title = "收集气",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "wind",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "收集金币",
    Desc = "自动收集金币",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.spawnedCoins = isEnabled
        if Interstellar.spawnedCoins then
            while Interstellar.spawnedCoins do
                for i, v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
                    if v.Name == "Purple Coin Crate" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                        wait(2)
                    end
                end
            end
        end
        WindUI:Notify({
            Title = "收集金币",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "coin",
            Duration = 3
        })
    end 
})

local Tab14Section = Tab14:Section({
    Title = "自动购买",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab14Section:Toggle({
    Title = "自动买剑",
    Desc = "自动购买所有剑",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.buy = isEnabled
        if isEnabled then
            while Interstellar.buy do
                local buyType = "buyAllSwords"
                local targetIslands = {
                    "Ground", "Astral Island", "Space Island", 
                    "Tundra Island", "Eternal Island", "Sandstorm", 
                    "Thunderstorm", "Ancient Inferno Island", 
                    "Midnight Shadow Island", "Mythical Souls Island", 
                    "Winter Wonder Island"
                }
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
        WindUI:Notify({
            Title = "自动买剑",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "sword",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "自动买背包",
    Desc = "自动购买所有背包",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.buy = isEnabled
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
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
        WindUI:Notify({
            Title = "自动买背包",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "backpack",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "自动买技能",
    Desc = "自动购买所有技能",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.buy = isEnabled
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
                for i = 1, #targetIslands do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetIslands[i])
                    wait()
                end
            end
        end
        WindUI:Notify({
            Title = "自动买技能",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "zap",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "自动买阶级",
    Desc = "自动购买阶级",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.buy = isEnabled
        if Interstellar.buy then
            while Interstellar.buy do
                local buyType = "buyRank"
                local ranksFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Ranks")
                local groundRanks = ranksFolder and ranksFolder:FindFirstChild("Ground")
                local targetRanks = groundRanks and groundRanks:GetChildren() or {}
                
                for i = 1, #targetRanks do
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(buyType, targetRanks[i])
                    task.wait()
                end
                task.wait(1)
            end
        end
        WindUI:Notify({
            Title = "自动买阶级",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "award",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "自动购买苦无",
    Desc = "自动购买苦无",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.buy = isEnabled
        while Interstellar.buy do
            wait()
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("buyAllShurikens", "Blazing Vortex Island")
        end
        WindUI:Notify({
            Title = "自动购买苦无",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "target",
            Duration = 3
        })
    end 
})

local Tab14Section = Tab14:Section({
    Title = "其他功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab14Section:Toggle({
    Title = "吸全部玩家",
    Desc = "将其他玩家吸引到身边",
    Default = false,
    Callback = function(isEnabled)
        Interstellar = Interstellar or {}
        Interstellar.attractPlayers = isEnabled
        if isEnabled then
            while Interstellar.attractPlayers do
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        local localPlayerRoot = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                        local localPlayerPosition = localPlayerRoot.Position
                        local direction = localPlayerRoot.CFrame.lookVector
                        local newPosition = localPlayerPosition + direction * 3

                        v.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition, localPlayerPosition + direction * 4)
                        wait()
                    end
                end
            end
        end
        WindUI:Notify({
            Title = "吸全部玩家",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "users",
            Duration = 3
        })
    end 
})

Tab14Section:Toggle({
    Title = "靠近自动攻击",
    Desc = "必开功能",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            -- 开启逻辑
        else
            if getgenv().configs then
                local Disable = getgenv().configs.Disable
                if Disable then
                    Disable:Fire()
                    Disable:Destroy()
                end
                if getgenv().configs.connections then
                    for _, connection in pairs(getgenv().configs.connections) do
                        connection:Disconnect()
                    end
                    table.clear(getgenv().configs.connections)
                end
            end
            Run = false
        end
        WindUI:Notify({
            Title = "靠近自动攻击",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "target",
            Duration = 3
        })
    end 
})

Tab14Section:Button({
    Title = "获取所有元素",
    Icon = "atom",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        for i, v in pairs(game:GetService("ReplicatedStorage").Elements:GetChildren()) do
            local allelement = v.Name
            game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(allelement)
        end
        WindUI:Notify({
            Title = "获取元素",
            Content = "✅ 已获取所有元素",
            Icon = "atom"
        })
    end
})

Tab14Section:Button({
    Title = "解锁全部通行证",
    Icon = "unlock",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local gamepassIds = game:GetService("ReplicatedStorage").gamepassIds
        local ownedGamepasses = game.Players.LocalPlayer.ownedGamepasses
        
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
        
        WindUI:Notify({
            Title = "解锁通行证",
            Content = "✅ 已解锁全部通行证",
            Icon = "unlock"
        })
    end
})

Tab14Section:Button({
    Title = "最大跳跃次数",
    Icon = "arrow-up",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local multiJumpCount = localPlayer:FindFirstChild("multiJumpCount")
        if multiJumpCount and multiJumpCount:IsA("ValueBase") then
            multiJumpCount.Value = 50
        end
        WindUI:Notify({
            Title = "跳跃次数",
            Content = "✅ 已设置最大跳跃次数",
            Icon = "arrow-up"
        })
    end
})

local Tab15 = MainWindow:Tab({
    Title = "生存7天",
    Icon = "shield"
})

local Tab15Section = Tab15:Section({
    Title = "透视功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local ESPName = {
    "ScpESPFloder",
    "AnimalESPFloder",
}
for _,v in next,ESPName do
    local ESPFloder = Instance.new("Folder")
    ESPFloder.Parent = workspace
    ESPFloder.Name = v
end

local function ESPMonster(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.ScpESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local function ESPAnimal(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.AnimalESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local OAO = game.Players.LocalPlayer
local QWQ = game.ReplicatedStorage
local OvO = {
    instantlycutofftree = false,
    AutoCollectScraps = false,
    AutoCollectDirt = false,
    AutoCollectHarvt = false,
    KillAll = false,
    KillAura = false,
    AutoTpPine = false,
    AutoHeli = false
}

local function findClosestPine()
    local closestPine = nil
    local shortestDistance = math.huge
    for _, v in next, workspace.trees:GetChildren() do
        if v.Name:find("Pine") and v.PrimaryPart then
            local distance = (v.PrimaryPart.Position - OAO.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPine = v
                shortestDistance = distance
            end
        end
    end
    return closestPine
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local animalConnection
local scpConnection

Tab15Section:Toggle({
    Title = "动物透视",
    Desc = "显示动物位置",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            if animalConnection then animalConnection:Disconnect() end
            for _, v in next, workspace.animals:GetChildren() do
                ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
            end
            animalConnection = workspace.animals.ChildAdded:Connect(function(v)
                ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
            end)
        else
            if animalConnection then animalConnection:Disconnect() end
            workspace.AnimalESPFloder:ClearAllChildren()
        end
        WindUI:Notify({
            Title = "动物透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "eye",
            Duration = 3
        })
    end 
})

Tab15Section:Toggle({
    Title = "怪物透视",
    Desc = "显示怪物位置",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            if scpConnection then scpConnection:Disconnect() end
            for _, v in next, workspace.scps:GetChildren() do
                ESPMonster("怪物", v, Color3.new(0, 0, 1))
            end
            scpConnection = workspace.scps.ChildAdded:Connect(function(v)
                ESPMonster("怪物", v, Color3.new(0, 0, 1))
            end)
        else
            if scpConnection then scpConnection:Disconnect() end
            workspace.ScpESPFloder:ClearAllChildren()
        end
        WindUI:Notify({
            Title = "怪物透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "eye",
            Duration = 3
        })
    end 
})

local Tab15Section2 = Tab15:Section({
    Title = "自动功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab15Section2:Toggle({
    Title = "秒砍树",
    Desc = "快速砍树",
    Default = false,
    Callback = function(isEnabled)
        OvO.instantlycutofftree = isEnabled
        spawn(function()
            while OvO.instantlycutofftree do wait()
                QWQ.remotes.swing_axe:FireServer()
                for _,v in next,workspace.logs:GetChildren() do
                    if v.Name == "log" then
                        fireproximityprompt(v.main.ProximityPrompt)
                    end
                end
            end
        end)
        WindUI:Notify({
            Title = "秒砍树",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "tree",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "自动钓鱼",
    Desc = "自动钓鱼功能",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoCast = isEnabled
        spawn(function()
            while OvO.AutoCast do wait()
                game:GetService("ReplicatedStorage").remotes.cast:FireServer()
                task.wait(0.2)
                for i = 1,8 do
                    game:GetService("ReplicatedStorage").remotes.hit_fish:FireServer()
                end
            end
        end)
        WindUI:Notify({
            Title = "自动钓鱼",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "fish",
            Duration = 3
        })
    end 
})

Tab15Section2:Button({
    Title = "秒吃食物",
    Icon = "utensils",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        for _,v in pairs(OAO.Backpack:GetChildren()) do
            if v:FindFirstChild("eat") and OAO.Character.hunger.Value < 30 then
                for i = 1, 20 do
                    v.Parent = OAO.Character
                    OAO.Character[v.Name].eat:FireServer()
                end
            end
        end
        WindUI:Notify({
            Title = "秒吃食物",
            Content = "✅ 已快速进食",
            Icon = "utensils"
        })
    end
})

Tab15Section2:Toggle({
    Title = "自动收集材料",
    Desc = "收集废料材料",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoCollectScraps = isEnabled
        spawn(function()
            while OvO.AutoCollectScraps do wait()
                local oldcf = OAO.Character.HumanoidRootPart.CFrame
                for _, v in pairs(workspace.scraps:GetChildren()) do
                    local material = v:FindFirstChild("defaultMaterial10")
                    if material and OvO.AutoCollectScraps then
                        local prompt = material:FindFirstChild("ProximityPrompt")
                        if prompt and OvO.AutoCollectScraps then
                            OAO.Character.HumanoidRootPart.CFrame = material.CFrame + Vector3.new(0, 3, 0)
                            wait(0.2)
                            fireproximityprompt(prompt)
                            wait(0.2) 
                            OAO.Character.HumanoidRootPart.CFrame = oldcf
                        end
                    end
                end
            end
        end)
        WindUI:Notify({
            Title = "自动收集材料",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "package",
            Duration = 3
        })
    end 
})

Tab15Section2:Button({
    Title = "传送回出生点",
    Icon = "home",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        OAO.Character.HumanoidRootPart.CFrame = CFrame.new(57,42,416)
        WindUI:Notify({
            Title = "传送",
            Content = "✅ 已传送回出生点",
            Icon = "home"
        })
    end
})

Tab15Section2:Toggle({
    Title = "自动收集成熟品",
    Desc = "收集成熟作物",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoCollectHarvt = isEnabled
        if OvO.AutoCollectHarvt then
            oldpos = OAO.Character.HumanoidRootPart.CFrame
            spawn(function()
                while OvO.AutoCollectHarvt do wait()
                    for _,v in next,workspace.harvest:GetChildren() do
                        OAO.Character.HumanoidRootPart.CFrame = v.main.CFrame
                        fireproximityprompt(v.main.ProximityPrompt)
                    end
                end
            end)
        else
            OAO.Character.HumanoidRootPart.CFrame = oldpos
        end
        WindUI:Notify({
            Title = "自动收集成熟品",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "package",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "自动收集生鹿肉",
    Desc = "收集鹿肉",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoCollectHarvt = isEnabled
        if OvO.AutoCollectHarvt then
            oldpos = OAO.Character.HumanoidRootPart.CFrame
            spawn(function()
                while OvO.AutoCollectHarvt do wait()
                    for _,v in next,workspace.interact:GetChildren() do
                        if v.Name == "deer" then
                            OAO.Character.HumanoidRootPart.CFrame = v["lungs,heart,intestines"].CFrame
                            fireproximityprompt(v["lungs,heart,intestines"].ProximityPrompt)
                        end
                    end
                end
            end)
        else
            OAO.Character.HumanoidRootPart.CFrame = oldpos
        end
        WindUI:Notify({
            Title = "自动收集生鹿肉",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "package",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "自动收集包菜",
    Desc = "收集包菜",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoCollectDirt = isEnabled
        if OvO.AutoCollectDirt then
            oldpos = OAO.Character.HumanoidRootPart.CFrame
            spawn(function()
                while OvO.AutoCollectDirt do wait()
                    OAO.Character.HumanoidRootPart.CFrame = workspace.builds["Cabbage Farm"].dirt.CFrame
                    fireproximityprompt(workspace.builds["Cabbage Farm"].dirt.ProximityPrompt)
                end
            end)
        else
            OAO.Character.HumanoidRootPart.CFrame = oldpos
        end
        WindUI:Notify({
            Title = "自动收集包菜",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "package",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "枪械光环",
    Desc = "自动攻击敌人",
    Default = false,
    Callback = function(isEnabled)
        OvO.KillAll = isEnabled
        spawn(function()
            while OvO.KillAll do wait()
                for _,v in next,workspace.scps:GetChildren() do
                    if v:FindFirstChild("HumanoidRootPart") then
                        local args = {
                            [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                        }
                        game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                        game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                    end
                end
                for _,v in next,workspace.animals:GetChildren() do
                    if v:FindFirstChild("HumanoidRootPart") then
                        local args = {
                            [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                        }
                        game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                        game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                    end
                end
            end
        end)
        WindUI:Notify({
            Title = "枪械光环",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "target",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "子弹追踪(锁头)",
    Desc = "精准锁定目标",
    Default = false,
    Callback = function(isEnabled)
        OvO.KillAura = isEnabled
        spawn(function()
            while OvO.KillAura do wait()
                if OAO.Character.HumanoidRootPart then
                    for _, scp in ipairs(workspace.scps:GetChildren()) do
                        local HitPart = scp:FindFirstChild("HumanoidRootPart") or scp:FindFirstChild("Head")
                        if HitPart and scp:FindFirstChildWhichIsA("Humanoid") and scp.Humanoid.Health > 0 then
                            game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                        end
                    end
                    for _, animal in ipairs(workspace.animals:GetChildren()) do
                        local HitPart = animal:FindFirstChild("HumanoidRootPart") or animal:FindFirstChild("Head")
                        if HitPart and scp:FindFirstChildWhichIsA("Humanoid") and scp.Humanoid.Health > 0 then
                            game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                        end
                    end
                end
            end
        end)
        WindUI:Notify({
            Title = "子弹追踪",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "crosshair",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "自动传送最近的木头",
    Desc = "自动传送到松树",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoTpPine = isEnabled
        spawn(function()
            while OvO.AutoTpPine do wait()
                local closestPine = findClosestPine()
                if closestPine then
                    local targetPosition = closestPine.PrimaryPart.Position
                    OAO.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(targetPosition.X, targetPosition.Y - 30, targetPosition.Z))
                    OAO.Character.HumanoidRootPart.Anchored = OvO.AutoTpPine
                end
            end
        end)
        WindUI:Notify({
            Title = "自动传送木头",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "tree-pine",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "开启无限模式",
    Desc = "无限模式开关",
    Default = false,
    Callback = function(isEnabled)
        workspace.infinite.Value = isEnabled
        WindUI:Notify({
            Title = "无限模式",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "infinity",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "开启雨天",
    Desc = "雨天效果开关",
    Default = false,
    Callback = function(isEnabled)
        workspace.raining.Value = isEnabled
        WindUI:Notify({
            Title = "雨天效果",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "cloud-rain",
            Duration = 3
        })
    end 
})

Tab15Section2:Toggle({
    Title = "自动拾取飞机残骸",
    Desc = "拾取直升机残骸",
    Default = false,
    Callback = function(isEnabled)
        OvO.AutoHeli = isEnabled
        spawn(function()
            while OvO.AutoHeli do wait()
                for _,v in next,workspace.interact:GetChildren() do
                    if v.Name == "heli" then
                        fireproximityprompt(v.Body.ProximityPrompt)
                    end
                end
            end
        end)
        WindUI:Notify({
            Title = "自动拾取飞机残骸",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "helicopter",
            Duration = 3
        })
    end 
})

local Tab16 = MainWindow:Tab({
    Title = "战争大亨",
    Icon = "shield"
})

local Tab16Section = Tab16:Section({
    Title = "传送功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab16Section:Button({
    Title = "当前玩家基地: " .. game.Players.LocalPlayer.Team.Name,
    Icon = "map-pin",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        WindUI:Notify({
            Title = "基地信息",
            Content = "当前基地: " .. game.Players.LocalPlayer.Team.Name,
            Icon = "map-pin",
            Duration = 3
        })
    end
})

local Positions = {
    ["Alpha"] = CFrame.new(-1197, 65, -4790),
    ["Bravo"] = CFrame.new(-220, 65, -4919),
    ["Charlie"] = CFrame.new(797, 65, -4740),
    ["Delta"] = CFrame.new(2044, 65, -3984),
    ["Echo"] = CFrame.new(2742, 65, -3031),
    ["Foxtrot"] = CFrame.new(3045, 65, -1788),
    ["Golf"] = CFrame.new(3376, 65, -562),
    ["Hotel"] = CFrame.new(3290, 65, 587),
    ["Juliet"] = CFrame.new(2955, 65, 1804),
    ["Kilo"] = CFrame.new(2569, 65, 2926),
    ["Lima"] = CFrame.new(989, 65, 3419),
    ["Omega"] = CFrame.new(-319, 65, 3932),
    ["Romeo"] = CFrame.new(-1479, 65, 3722),
    ["Sierra"] = CFrame.new(-2528, 65, 2549),
    ["Tango"] = CFrame.new(-3018, 65, 1503),
    ["Victor"] = CFrame.new(-3587, 65, 634),
    ["Yankee"] = CFrame.new(-3957, 65, -287),
    ["Zulu"] = CFrame.new(-4049, 65, -1334)
}

Tab16Section:Dropdown({
    Title = "传送基地",
    Values = {"Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "Juliet", "Kilo", "Lima", "Omega", "Romeo", "Sierra", "Tango", "Victor", "Yankee", "Zulu"},
    Value = "Alpha",
    Callback = function(selected)
        local LP = game.Players.LocalPlayer
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = Positions[selected]
            WindUI:Notify({
                Title = "传送",
                Content = "已传送到 " .. selected .. " 基地",
                Icon = "map-pin",
                Duration = 3
            })
        end
    end
})

local Tab16Section2 = Tab16:Section({
    Title = "自动功能",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local function GetAvailableBases()
    local bases = {}
    if not ExcludedBases then
        ExcludedBases = {}
    end
    if not workspace:FindFirstChild("Tycoon") or not workspace.Tycoon:FindFirstChild("Tycoons") then
        return bases
    end
    
    local tycoons = workspace.Tycoon.Tycoons:GetChildren()
    for _, tycoon in ipairs(tycoons) do
        if not table.find(ExcludedBases, tycoon.Name) then
            table.insert(bases, tycoon.Name)
        end
    end
    
    return bases
end

local basesDropdown = Tab16Section2:Dropdown({
    Title = "基地白名单{排除列表}",
    Values = GetAvailableBases(),
    Multi = true,
    Default = {},
    Callback = function(selected)
        ExcludedBases = selected
    end
})

Tab16Section2:Button({
    Title = "刷新基地列表",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        basesDropdown:Refresh(GetAvailableBases())
        WindUI:Notify({
            Title = "刷新",
            Content = "基地列表已刷新",
            Icon = "refresh-cw",
            Duration = 3
        })
    end
})

Tab16Section2:Toggle({
    Title = "自动箱子",
    Desc = "自动收集箱子",
    Default = false,
    Callback = function(isEnabled)
        getgenv().auto = isEnabled
        WindUI:Notify({
            Title = "自动箱子",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "package",
            Duration = 3
        })
    end
})

Tab16Section2:Toggle({
    Title = "自动升级",
    Desc = "自动升级基地",
    Default = false,
    Callback = function(isEnabled)
        getgenv().autoTeleport = isEnabled
        WindUI:Notify({
            Title = "自动升级",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "trending-up",
            Duration = 3
        })
    end
})

Tab16Section2:Button({
    Title = "自动重生",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        WindUI:Notify({
            Title = "自动重生",
            Content = "功能开发中...",
            Icon = "refresh-cw",
            Duration = 3
        })
    end
})

Tab16Section2:Button({
    Title = "自动空投",
    Icon = "package",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        WindUI:Notify({
            Title = "自动空投",
            Content = "功能开发中...",
            Icon = "package",
            Duration = 3
        })
    end
})

local Tab16Section = Tab16:Section({
    Title = "ESP设置",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

Tab16Section:Toggle({
    Title = "透视开启",
    Desc = "启用透视功能",
    Default = false,
    Callback = function(isEnabled)
        getgenv().ESPEnabled = isEnabled
        WindUI:Notify({
            Title = "透视功能",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "eye",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "模型透视",
    Desc = "显示玩家骨架",
    Default = false,
    Callback = function(isEnabled)
        getgenv().ShowSkeleton = isEnabled
        WindUI:Notify({
            Title = "模型透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "user",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "方框透视",
    Desc = "显示玩家方框",
    Default = false,
    Callback = function(isEnabled)
        getgenv().ShowBox = isEnabled
        WindUI:Notify({
            Title = "方框透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "square",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "射线透视",
    Desc = "显示玩家射线",
    Default = false,
    Callback = function(isEnabled)
        getgenv().ShowTracer = isEnabled
        WindUI:Notify({
            Title = "射线透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "crosshair",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "名字透视",
    Desc = "显示玩家名字",
    Default = false,
    Callback = function(isEnabled)
        getgenv().ShowName = isEnabled
        WindUI:Notify({
            Title = "名字透视",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "tag",
            Duration = 3
        })
    end
})

local Tab16Section = Tab16:Section({
    Title = "游戏辅助",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local blockFDMG = false
local oldNamecall = nil
local isHookActive = false

local function initHook()
    if isHookActive then return end
    
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if blockFDMG and getnamecallmethod() == "FireServer" and tostring(self) == "FDMG" then
            return nil
        end
        return oldNamecall(self, ...)
    end)
    
    isHookActive = true
end

local function removeHook()
    if not isHookActive or not oldNamecall then return end
    
    hookmetamethod(game, "__namecall", oldNamecall)
    oldNamecall = nil
    isHookActive = false
end

Tab16Section:Toggle({
    Title = "坠落无伤害",
    Desc = "防止坠落伤害",
    Default = false,
    Callback = function(isEnabled)
        blockFDMG = isEnabled
        
        if isEnabled then
            if not isHookActive then
                initHook()
            end
        else
            if isHookActive then
                removeHook()
            end
        end
        WindUI:Notify({
            Title = "坠落无伤害",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "shield",
            Duration = 3
        })
    end
})

Tab16Section:Button({
    Title = "删除所有门",
    Icon = "trash-2",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        for k,v in pairs(workspace.Tycoon.Tycoons:GetChildren()) do
            for x,y in pairs(v.PurchasedObjects:GetChildren()) do
                if(y.Name:find("Door") or y.Name:find("Gate")) then 
                    y:destroy()
                end
            end
        end
        WindUI:Notify({
            Title = "删除门",
            Content = "✅ 所有门已删除",
            Icon = "trash-2"
        })
    end
})

Tab16Section:Toggle({
    Title = "无CD状态",
    Desc = "技能无冷却",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            local ContextActions = workspace[game.Players.LocalPlayer.Name].ContextActions
            local ContextMain = require(ContextActions.ContextMain)
            
            ContextMain:New({
                RobPlayerLength = 0.1,
                FixWallLength = 0.1,
                CrackSafeLength = 0.1,
                RobSafeLength = 0.1,
                RobRegisterLength = 0.1,
                PickCellLength = 0.1,
                SkinAnimalLength = 0.1
            }, 200, {
                "Get out of my shop! Outlaws are not welcome here!",
                "Hey, scoundrel! Get out before I call the sheriff!",
                "You're an outlaw! We don't serve your type here!"
            }, {
                "This here's a bandit camp! Get out!",
                "Get lost, cowboy!",
                "Are you an outlaw? Didn't think so! Scram!"
            })
        end
        WindUI:Notify({
            Title = "无CD状态",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "zap",
            Duration = 3
        })
    end
})

local deathPosition = nil
local deathOrientation = nil

local function setupDeathTracking()
    local player = game.Players.LocalPlayer
    
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        
        humanoid.Died:Connect(function()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                deathPosition = rootPart.Position
                deathOrientation = rootPart.CFrame - rootPart.Position
            end
        end)
    end)
    
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    deathPosition = rootPart.Position
                    deathOrientation = rootPart.CFrame - rootPart.Position
                end
            end)
        end
    end
end

setupDeathTracking()

Tab16Section:Button({
    Title = "原地重生",
    Icon = "rotate-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        if not deathPosition then
            WindUI:Notify({
                Title = "原地重生",
                Content = "❌ 未找到死亡位置",
                Icon = "rotate-cw",
                Duration = 3
            })
            return
        end
        
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                WindUI:Notify({
                    Title = "原地重生",
                    Content = "❌ 角色仍然存活",
                    Icon = "rotate-cw",
                    Duration = 3
                })
                return
            end
        end
        
        local connection
        connection = player.CharacterAdded:Connect(function(newCharacter)
            local newRootPart = newCharacter:WaitForChild("HumanoidRootPart", 5)
            local newHumanoid = newCharacter:WaitForChild("Humanoid", 5)
            
            if newRootPart and newHumanoid then
                task.wait(0.5)
                newRootPart.CFrame = CFrame.new(deathPosition) * deathOrientation
                deathPosition = nil
                deathOrientation = nil
                
                if connection then
                    connection:Disconnect()
                end
                
                WindUI:Notify({
                    Title = "原地重生",
                    Content = "✅ 已在死亡位置重生",
                    Icon = "rotate-cw",
                    Duration = 3
                })
            end
        end)
        
        if not character then
            local currentTeam = player.Team
            player.Team = nil
            task.wait(0.1)
            player.Team = currentTeam
        else
            player:LoadCharacter()
        end
    end
})

local Tab16Section = Tab16:Section({
    Title = "自瞄设置",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local autoAimEnabled = false
local fovVisible = false
local ignoreCover = false
local aimTarget = "敌对"
local aimPosition = "Head"
local fov = 50
local maxDistance = 50

Tab16Section:Toggle({
    Title = "玩家自瞄",
    Desc = "启用自动瞄准",
    Default = false,
    Callback = function(isEnabled)
        autoAimEnabled = isEnabled
        WindUI:Notify({
            Title = "玩家自瞄",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "crosshair",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "显示范围",
    Desc = "显示自瞄范围",
    Default = false,
    Callback = function(isEnabled)
        fovVisible = isEnabled
        WindUI:Notify({
            Title = "显示范围",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "circle",
            Duration = 3
        })
    end
})

Tab16Section:Toggle({
    Title = "掩体不瞄",
    Desc = "忽略掩体后目标",
    Default = false,
    Callback = function(isEnabled)
        ignoreCover = isEnabled
        WindUI:Notify({
            Title = "掩体不瞄",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "eye-off",
            Duration = 3
        })
    end
})

Tab16Section:Slider({
    Title = "自瞄范围",
    Desc = "设置自瞄视野范围",
    Step = 1,
    Value = {
        Min = 1,
        Max = 200,
        Default = 50
    },
    Callback = function(value)
        fov = tonumber(value)
        WindUI:Notify({
            Title = "自瞄范围",
            Content = "范围设置为: " .. value,
            Icon = "maximize",
            Duration = 3
        })
    end
})

Tab16Section:Slider({
    Title = "自瞄距离",
    Desc = "设置最大瞄准距离",
    Step = 1,
    Value = {
        Min = 1,
        Max = 1200,
        Default = 50
    },
    Callback = function(value)
        maxDistance = tonumber(value)
        WindUI:Notify({
            Title = "自瞄距离",
            Content = "距离设置为: " .. value .. "米",
            Icon = "ruler",
            Duration = 3
        })
    end
})

Tab16Section:Dropdown({
    Title = "选择自瞄目标",
    Values = {"敌对", "全部"},
    Value = "敌对",
    Callback = function(selected)
        aimTarget = selected
        WindUI:Notify({
            Title = "自瞄目标",
            Content = "目标设置为: " .. selected,
            Icon = "target",
            Duration = 3
        })
    end
})

Tab16Section:Dropdown({
    Title = "选择自瞄位置",
    Values = {"头部", "躯干"},
    Value = "头部",
    Callback = function(selected)
        if selected == "头部" then
            aimPosition = "Head"
        elseif selected == "躯干" then
            aimPosition = "Torso"
        end
        WindUI:Notify({
            Title = "自瞄位置",
            Content = "位置设置为: " .. selected,
            Icon = "user",
            Duration = 3
        })
    end
})

local Tab16 = MainWindow:Tab({
    Title = "战争大亨［攻击功能］",
    Icon = "sword"
})

local Tab16Section = Tab16:Section({
    Title = "攻击设置",
    TextSize = 18,
    FontWeight = Enum.FontWeight.SemiBold
})

local C_NPlayers = {}

Tab16Section:Dropdown({
    Title = "不攻击的玩家(多选)",
    Values = {},
    Multi = true,
    Default = {},
    Callback = function(selected)
        C_NPlayers = selected
    end
})

Tab16Section:Button({
    Title = "刷新玩家列表",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local PlayerList = {}
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                table.insert(PlayerList, player.Name)
            end
        end
        WindUI:Notify({
            Title = "刷新列表",
            Content = "玩家列表已刷新",
            Icon = "refresh-cw",
            Duration = 3
        })
    end
})

Tab16Section:Button({
    Title = "获取RPG",
    Icon = "rocket",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        local TycoonsFolder = workspace.Tycoon.Tycoons
        local savedPosition
        
        local function findNearestTeleportPosition()
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local playerPosition = humanoidRootPart.Position
            local closestDistance = math.huge
            local closestCFrame = nil
            
            for _, tycoonModel in ipairs(TycoonsFolder:GetChildren()) do
                if tycoonModel:IsA("Model") then
                    local purchasedObjects = tycoonModel:FindFirstChild("PurchasedObjects")
                    if purchasedObjects then
                        local rpgGiver = purchasedObjects:FindFirstChild("RPG Giver")
                        if rpgGiver then
                            local prompt = rpgGiver:FindFirstChild("Prompt")
                            if prompt and prompt:IsA("BasePart") then
                                local distance = (playerPosition - prompt.Position).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestCFrame = prompt.CFrame
                                end
                            end
                        end
                    end
                end
            end
            
            return closestCFrame
        end
        
        local function teleportPlayer()
            local character = localPlayer.Character
            if not character then
                return
            end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                savedPosition = humanoidRootPart.CFrame
            end
            
            local targetCFrame = findNearestTeleportPosition()
            if targetCFrame then
                humanoidRootPart.CFrame = targetCFrame
                
                spawn(function()
                    while task.wait(0.5) do
                        if not character.Parent then
                            break
                        end
                        
                        local backpack = localPlayer:FindFirstChild("Backpack")
                        if backpack and backpack:FindFirstChild("RPG") then
                            humanoidRootPart.CFrame = savedPosition
                            WindUI:Notify({
                                Title = "获取RPG",
                                Content = "✅ RPG获取成功",
                                Icon = "rocket"
                            })
                            break
                        end
                    end
                end)
            else
                WindUI:Notify({
                    Title = "获取RPG",
                    Content = "❌ 未能找到附近的RPG",
                    Icon = "rocket",
                    Duration = 3
                })
            end
        end
        
        teleportPlayer()
    end
})

local loopActive = false
local rpgAttackThread = nil

Tab16Section:Toggle({
    Title = "RPG轰炸",
    Desc = "自动RPG攻击",
    Default = false,
    Callback = function(isEnabled)
        loopActive = isEnabled
        
        if isEnabled then
            if rpgAttackThread then
                coroutine.close(rpgAttackThread)
                rpgAttackThread = nil
            end
            
            rpgAttackThread = coroutine.create(function()
                -- RPG攻击逻辑
            end)
            
            coroutine.resume(rpgAttackThread)
            WindUI:Notify({
                Title = "RPG轰炸",
                Content = "✅ 已开启",
                Icon = "bomb",
                Duration = 3
            })
        else
            if rpgAttackThread then
                coroutine.close(rpgAttackThread)
                rpgAttackThread = nil
            end
            WindUI:Notify({
                Title = "RPG轰炸",
                Content = "❌ 已关闭",
                Icon = "bomb",
                Duration = 3
            })
        end
    end
})

local shieldAttackActive = false
local shieldAttackThread = nil

Tab16Section:Toggle({
    Title = "护盾攻击",
    Desc = "攻击敌方护盾",
    Default = false,
    Callback = function(isEnabled)
        shieldAttackActive = isEnabled
        
        if isEnabled then
            if shieldAttackThread then
                coroutine.close(shieldAttackThread)
                shieldAttackThread = nil
            end
            
            shieldAttackThread = coroutine.create(function()
                -- 护盾攻击逻辑
            end)
            
            coroutine.resume(shieldAttackThread)
            WindUI:Notify({
                Title = "护盾攻击",
                Content = "✅ 已开启",
                Icon = "shield",
                Duration = 3
            })
        else
            if shieldAttackThread then
                coroutine.close(shieldAttackThread)
                shieldAttackThread = nil
            end
            WindUI:Notify({
                Title = "护盾攻击",
                Content = "❌ 已关闭",
                Icon = "shield",
                Duration = 3
            })
        end
    end
})

MainWindow:SetToggleKey(Enum.KeyCode.LeftControl)
