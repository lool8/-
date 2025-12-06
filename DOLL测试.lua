-- 1. 加载 WindUI 核心库
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/-/refs/heads/main/DOLLUI.lua"))()

-- 2. 创建主窗口
local MainWindow = WindUI:CreateWindow({
    Title = "DOLL※༒/通用", 
    Author = "༼DOLL༽ | ᐁQ群:1058549962ᐁ",
    Folder = "CharacterControl",
    Size = UDim2.fromOffset(400, 300),
    Theme = "Dark",  -- 使用预设的暗色主题
    SideBarWidth = 200,
    Acrylic = true,
    BlurRadius = 10,
    BackgroundImage = "rbxassetid://107548824953725",
    TitleBarGradient = {
        ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#4facfe")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#00f2fe"))
        }),
        Rotation = 135
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
Tab1Section:S1ider({
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

local speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

local nowe = false

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

-- 先定义玩家配置表（存储选择的玩家名称）
local PlayerConfig = {
playernamedied = "",
dropdown = {},
LoopTeleport = false
}
-- 刷新玩家列表函数
local function shuaxinlb(flag)
PlayerConfig.dropdown = {}
for _, player in pairs(game.Players:GetPlayers()) do
table.insert(PlayerConfig.dropdown, player.Name)
end
end
shuaxinlb(true)
 
-- 选择玩家名称（Dropdown）
Tab3Section:Dropdown({
Title = "选择玩家名称",
Values = PlayerConfig.dropdown,
Value = PlayerConfig.dropdown[1] or "",
Callback = function(selected)
PlayerConfig.playernamedied = selected
WindUI:Notify({
Title = "玩家选择",
Content = "已选中玩家："..selected,
Icon = "bolt",
Duration = 3
})
end
})
 
-- 刷新玩家名称（Button）
Tab3Section:Button({
Title = "刷新玩家名称",
Icon = "refresh-cw",
Color = Color3.fromHex("#000000"),
Callback = function()
shuaxinlb(true)
WindUI:Notify({
Title = "刷新成功",
Content = "玩家列表已更新",
Icon = "bolt"
})
end
})
 
-- 传送到玩家旁边（Button）
Tab3Section:Button({
Title = "传送到玩家旁边",
Icon = "refresh-cw",
Color = Color3.fromHex("#000000"),
Callback = function()
local localPlayer = game.Players.LocalPlayer
local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetRoot = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if localRoot and targetRoot then
localRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
WindUI:Notify({
Title = "传送成功",
Content = "已经传送到玩家身边",
Icon = "bolt"
})
else
WindUI:Notify({
Title = "传送失败",
Content = "无法传送 原因: 玩家已消失",
Icon = "bolt"
})
end
end
})
 
-- 循环锁定传送（Toggle）
local Tab3TogglePlarer = Tab3Section:Toggle({
Title = "循环锁定传送",
Desc = "持续跟随目标玩家传送",
Default = false,
Callback = function(isEnabled)
PlayerConfig.LoopTeleport = isEnabled
WindUI:Notify({
Title = "循环传送",
Content = isEnabled and "✅ 已开启循环传送" or "❌ 已关闭循环传送",
Icon = "bolt",
Duration = 3
})
task.spawn(function()
while PlayerConfig.LoopTeleport do
task.wait()
local localPlayer = game.Players.LocalPlayer
local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetRoot = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if localRoot and targetRoot then
localRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
end
end
end)
end
})
 
-- 把玩家传送过来（Button）
Tab3Section:Button({
Title = "把玩家传送过来",
Icon = "refresh-cw",
Color = Color3.fromHex("#000000"),
Callback = function()
local localPlayer = game.Players.LocalPlayer
local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetRoot = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if localRoot and targetRoot then
targetRoot.CFrame = localRoot.CFrame + Vector3.new(0, 3, 0)
WindUI:Notify({
Title = "传送成功",
Content = "已将玩家传送过来",
Icon = "bolt"
})
else
WindUI:Notify({
Title = "传送失败",
Content = "无法传送 原因: 玩家已消失",
Icon = "bolt"
})
end
end
})
 
-- 循环传送玩家过来（Toggle）
local Tab3Toggleplay = Tab3Section:Toggle({
Title = "循环传送玩家过来",
Desc = "持续将目标玩家传送到身边",
Default = false,
Callback = function(isEnabled)
PlayerConfig.LoopTeleport = isEnabled
WindUI:Notify({
Title = "循环传送",
Content = isEnabled and "✅ 已开启循环传送玩家过来" or "❌ 已关闭循环传送玩家过来",
Icon = "bolt",
Duration = 3
})
task.spawn(function()
while PlayerConfig.LoopTeleport do
task.wait()
local localPlayer = game.Players.LocalPlayer
local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetRoot = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if localRoot and targetRoot then
targetRoot.CFrame = localRoot.CFrame + Vector3.new(0, 3, 0)
end
end
end)
end
})
 
-- 吸全部玩家（Toggle）
local Tab3Togglewj = Tab3Section:Toggle({
Title = "吸全部玩家",
Desc = "将所有玩家吸附到身边",
Default = false,
Callback = function(isEnabled)
WindUI:Notify({
Title = "吸附玩家",
Content = isEnabled and "✅ 已开启吸全部玩家" or "❌ 已关闭吸全部玩家",
Icon = "bolt",
Duration = 3
})
task.spawn(function()
while isEnabled do
local localPlayer = game.Players.LocalPlayer
local localRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
if localRoot then
local localPos = localRoot.Position
local lookVec = localRoot.CFrame.lookVector
for _, player in pairs(game.Players:GetPlayers()) do
if player ~= localPlayer then
local targetRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
if targetRoot then
targetRoot.CFrame = CFrame.new(localPos + lookVec * 3, localPos + lookVec * 4)
task.wait(0.1)
end
end
end
end
task.wait()
end
end)
end
})
 
-- 查看玩家（Toggle）
local Tab3Togglewan = Tab3Section:Toggle({
Title = "查看玩家",
Desc = "切换视角到目标玩家",
Default = false,
Callback = function(isEnabled)
local localPlayer = game.Players.LocalPlayer
local localHumanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetHumanoid = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
local camera = workspace.CurrentCamera
if isEnabled and targetHumanoid then
camera.CameraSubject = targetHumanoid
WindUI:Notify({
Title = "视角切换",
Content = "✅ 已开启查看玩家",
Icon = "bolt",
Duration = 3
})
else
if localHumanoid then
camera.CameraSubject = localHumanoid
end
WindUI:Notify({
Title = "视角切换",
Content = "❌ 已关闭查看玩家",
Icon = "bolt",
Duration = 3
})
end
end
})
 
-- 甩飞一次（Button）
Tab3Section:Button({
Title = "甩飞一次",
Icon = "refresh-cw",
Color = Color3.fromHex("#000000"),
Callback = function()
if not PlayerConfig.playernamedied then
WindUI:Notify({
Title = "操作失败",
Content = "请先选择玩家",
Icon = "bolt",
Duration = 3
})
return
end
local targetNames = {PlayerConfig.playernamedied}
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local isAllOrOthers = false
 
local function FindPlayerByName(name)
name = name:lower()
if name == "all" or name == "others" then
isAllOrOthers = true
return
end
if name == "random" then
local allPlayers = Players:GetPlayers()
if table.find(allPlayers, localPlayer) then
table.remove(allPlayers, table.find(allPlayers, localPlayer))
end
return allPlayers[math.random(#allPlayers)]
end
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer then
if player.Name:lower():match("^" .. name) or player.DisplayName:lower():match("^" .. name) then
return player
end
end
end
return nil
end
 
local function SendNotification(title, text, duration)
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = title,
Text = text,
Duration = duration,
})
end
 
local function ThrowPlayer(targetPlayer)
local localCharacter = localPlayer.Character
local localHumanoid = localCharacter and localCharacter:FindFirstChildOfClass("Humanoid")
local localRootPart = localHumanoid and localHumanoid.RootPart
local targetCharacter = targetPlayer.Character
if not localCharacter or not localRootPart or not targetCharacter then
SendNotification("玩家消失", "已停止", 5)
return
end
local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
local targetRootPart = targetHumanoid and targetHumanoid.RootPart
local targetHead = targetCharacter:FindFirstChild("Head")
local targetAccessory = targetCharacter:FindFirstChildOfClass("Accessory")
local accessoryHandle = targetAccessory and targetAccessory:FindFirstChild("Handle")
 
if targetHumanoid and targetHumanoid.Sit and not isAllOrOthers then
SendNotification("玩家消失", "已停止", 5)
return
end
 
local function ApplyThrowForce(part, offset, rotation)
localRootPart.CFrame = CFrame.new(part.Position) * offset * rotation
localCharacter:SetPrimaryPartCFrame(CFrame.new(part.Position) * offset * rotation)
localRootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
localRootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
end
 
local function PerformThrowAnimation(part)
local timeoutDuration = 2
local startTime = tick()
local rotationAngle = 0
while localRootPart do
local velocityMagnitude = part.Velocity.Magnitude
if velocityMagnitude < 50 then
rotationAngle = rotationAngle + 100
ApplyThrowForce(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(2.25, 1.5, -2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(-2.25, -1.5, 2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
else
ApplyThrowForce(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, -targetHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, -targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, 1.5, targetRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
task.wait()
ApplyThrowForce(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
task.wait()
end
velocityMagnitude = part.Velocity.Magnitude
if velocityMagnitude <= 500 then
local partParent = part.Parent
if partParent == targetPlayer.Character then
partParent = targetPlayer.Parent
if partParent == Players then
local hasCharacter = not targetPlayer.Character
if hasCharacter ~= targetCharacter then
local isSitting = targetHumanoid.Sit
if not isSitting then
local health = localHumanoid.Health
if health > 0 then
local currentTime = tick()
if startTime + timeoutDuration < currentTime then
break
end
else
break
end
else
break
end
else
break
end
else
break
end
else
break
end
else
break
end
end
end
 
workspace.FallenPartsDestroyHeight = 0 / 0
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Name = "EpixVel"
bodyVelocity.Parent = localRootPart
bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
bodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
if targetRootPart and targetHead then
if (targetRootPart.CFrame.p - targetHead.CFrame.p).Magnitude > 5 then
PerformThrowAnimation(targetHead)
else
PerformThrowAnimation(targetRootPart)
end
elseif targetRootPart and not targetHead then
PerformThrowAnimation(targetRootPart)
elseif not targetRootPart and targetHead then
PerformThrowAnimation(targetHead)
elseif not targetRootPart and not targetHead and targetAccessory and accessoryHandle then
PerformThrowAnimation(accessoryHandle)
else
return SendNotification("DOOL脚本", "已开/关", 5)
end
bodyVelocity:Destroy()
localHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
workspace.CurrentCamera.CameraSubject = localHumanoid
repeat
localRootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
localCharacter:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
localHumanoid:ChangeState("GettingUp")
table.foreach(localCharacter:GetChildren(), function(_, child)
if child:IsA("BasePart") then
local zeroVector = Vector3.new()
child.RotVelocity = Vector3.new()
child.Velocity = zeroVector
end
end)
task.wait()
until (localRootPart.Position - getgenv().OldPos.p).Magnitude < 25
workspace.FallenPartsDestroyHeight = getgenv().FPDH
end
 
if targetNames[1] then
for _, name in next, targetNames, nil do
local foundPlayer = FindPlayerByName(name)
if foundPlayer then
ThrowPlayer(foundPlayer)
end
end
else
return
end
if isAllOrOthers then
for _, player in next, Players:GetPlayers() do
if player ~= localPlayer then
ThrowPlayer(player)
end
end
end
for _, name in next, targetNames, nil do
local foundPlayer = FindPlayerByName(name)
if foundPlayer and foundPlayer ~= localPlayer then
if foundPlayer.UserId ~= 1414978355 then
ThrowPlayer(foundPlayer)
else
SendNotification("检测到玩家消失", "已停止", 5)
end
elseif not FindPlayerByName(name) and not isAllOrOthers then
SendNotification("未获取到玩家或工具", "已停止", 5)
end
end
WindUI:Notify({
Title = "甩飞成功",
Content = "已甩飞目标玩家",
Icon = "bolt",
Duration = 3
})
end
})
 
-- 循环甩飞（Toggle）
local Tab3Togglejia = Tab3Section:Toggle({
Title = "循环甩飞",
Desc = "持续甩飞目标玩家",
Default = false,
Callback = function(isEnabled)
getgenv().autofling = isEnabled
WindUI:Notify({
Title = "循环甩飞",
Content = isEnabled and "✅ 已开启循环甩飞" or "❌ 已关闭循环甩飞",
Icon = "bolt",
Duration = 3
})
if not PlayerConfig.playernamedied then
if isEnabled then
WindUI:Notify({
Title = "操作失败",
Content = "请先选择玩家",
Icon = "bolt",
Duration = 3
})
end
return
end
task.spawn(function()
while getgenv().autofling do
task.wait(1)
pcall(function()
local targetNames = {PlayerConfig.playernamedied}
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local isAllOrOthers = false
 
local function FindPlayerByName(name)
name = name:lower()
if name == "all" or name == "others" then
isAllOrOthers = true
return
end
if name == "random" then
local allPlayers = Players:GetPlayers()
if table.find(allPlayers, localPlayer) then
table.remove(allPlayers, table.find(allPlayers, localPlayer))
end
return allPlayers[math.random(#allPlayers)]
end
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer then
if player.Name:lower():match("^" .. name) or player.DisplayName:lower():match("^" .. name) then
return player
end
end
end
return nil
end
 
local function SendNotification(title, text, duration)
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = title,
Text = text,
Duration = duration,
})
end
 
local function ThrowPlayer(targetPlayer)
local localCharacter = localPlayer.Character
local localHumanoid = localCharacter and localCharacter:FindFirstChildOfClass("Humanoid")
local localRootPart = localHumanoid and localHumanoid.RootPart
local targetCharacter = targetPlayer.Character
if not localCharacter or not localRootPart or not targetCharacter then return end
local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
local targetRootPart = targetHumanoid and targetHumanoid.RootPart
local targetHead = targetCharacter:FindFirstChild("Head")
local targetAccessory = targetCharacter:FindFirstChildOfClass("Accessory")
local accessoryHandle = targetAccessory and targetAccessory:FindFirstChild("Handle")
 
if targetHumanoid and targetHumanoid.Sit and not isAllOrOthers then return end
 
local function ApplyThrowForce(part, offset, rotation)
localRootPart.CFrame = CFrame.new(part.Position) * offset * rotation
localCharacter:SetPrimaryPartCFrame(CFrame.new(part.Position) * offset * rotation)
localRootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
localRootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
end
 
local function PerformThrowAnimation(part)
local timeoutDuration = 2
local startTime = tick()
local rotationAngle = 0
while localRootPart and tick() - startTime < timeoutDuration do
local velocityMagnitude = part.Velocity.Magnitude
if velocityMagnitude < 50 and targetHumanoid then
rotationAngle = rotationAngle + 100
ApplyThrowForce(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
task.wait()
else
ApplyThrowForce(part, CFrame.new(0, 1.5, targetHumanoid and targetHumanoid.WalkSpeed or 16), CFrame.Angles(math.rad(90), 0, 0))
task.wait()
end
if part.Velocity.Magnitude <= 500 then
local partParent = part.Parent
if partParent ~= targetPlayer.Character then break end
else
break
end
end
end
 
workspace.FallenPartsDestroyHeight = 0 / 0
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Name = "EpixVel"
bodyVelocity.Parent = localRootPart
bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
bodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
if targetHumanoid then
targetHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
end
 
if targetRootPart and targetHead then
PerformThrowAnimation((targetRootPart.CFrame.p - targetHead.CFrame.p).Magnitude > 5 and targetHead or targetRootPart)
elseif targetRootPart then
PerformThrowAnimation(targetRootPart)
end
 
bodyVelocity:Destroy()
if targetHumanoid then
targetHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
end
workspace.CurrentCamera.CameraSubject = localHumanoid
local OldPos = localRootPart.CFrame
repeat
localRootPart.CFrame = OldPos * CFrame.new(0, 0.5, 0)
localCharacter:SetPrimaryPartCFrame(OldPos * CFrame.new(0, 0.5, 0))
localHumanoid:ChangeState("GettingUp")
for _, child in pairs(localCharacter:GetChildren()) do
if child:IsA("BasePart") then
child.RotVelocity = Vector3.new()
child.Velocity = Vector3.new()
end
end
task.wait()
until (localRootPart.Position - OldPos.p).Magnitude < 25
workspace.FallenPartsDestroyHeight = getgenv().FPDH or 1000
end
 
if targetNames[1] then
for _, name in pairs(targetNames) do
local foundPlayer = FindPlayerByName(name)
if foundPlayer then
ThrowPlayer(foundPlayer)
end
end
end
if isAllOrOthers then
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer then
ThrowPlayer(player)
end
end
end
for _, name in pairs(targetNames) do
local foundPlayer = FindPlayerByName(name)
if foundPlayer and foundPlayer ~= localPlayer then
if foundPlayer.UserId ~= 1414978355 then
local target = foundPlayer
if target then
ThrowPlayer(target)
end
else
SendNotification("检测到玩家消失", "已停止", 5)
end
elseif not FindPlayerByName(name) and not isAllOrOthers then
SendNotification("未获取到玩家或工具", "已停止", 5)
end
end
end)
end
end)
end
})
 
-- 开启指定自瞄目标（Toggle）
local Tab3Togglesuo = Tab3Section:Toggle({
Title = "开启指定自瞄目标",
Desc = "锁定目标玩家自瞄",
Default = false,
Callback = function(isEnabled)
WindUI:Notify({
Title = "自瞄设置",
Content = isEnabled and "✅ 已开启指定自瞄目标" or "❌ 已关闭指定自瞄目标",
Icon = "bolt",
Duration = 3
})
task.spawn(function()
while isEnabled do
task.wait()
local camera = workspace.CurrentCamera
local targetPlayer = game.Players:FindFirstChild(PlayerConfig.playernamedied)
local targetRoot = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
if camera and targetRoot then
camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (targetRoot.Position - camera.CFrame.Position).unit)
else
break
end
end
end)
end
})

local Tab3Togglejian = Tab3Section:Toggle({
    Title = "七彩建筑",
    Desc = "建筑部件随机变色变材质",
    Default = false,
    Callback = function(enabled)
        WindUI:Notify({
            Title = "七彩建筑",
            Content = enabled and "✅ 已开启七彩建筑" or "❌ 已关闭七彩建筑",
            Icon = "bolt",
            Duration = 3
        })
        
        local baseParts = nil
        local Break = false
        local r1_665 = {}
        if enabled then
            Break = false
            r1_665 = {}
            local r2_665 = Enum.Material:GetEnumItems()
            for r6_665, r7_665 in pairs(game.Workspace:GetDescendants()) do
                if r7_665:IsA("BasePart") then
                    table.insert(r1_665, r7_665)
                end
            end
            game.Workspace.DescendantAdded:Connect(function(r0_666)
                if r0_666:IsA("BasePart") then
                    table.insert(r1_665, r0_666)
                end
            end)
            task.spawn(function()
                while not Break do
                    task.wait(0.025)
                    local r3_665 = pairs
                    local r4_665 = r1_665
                    for r6_665, r7_665 in r3_665(r4_665) do
                        if r7_665 and r7_665.Parent then
                            r7_665.Material = r2_665[math.random(1, #r2_665)]
                            r7_665.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                        end
                    end
                end
            end)
        else
            r1_665 = true
            Break = r1_665
        end
    end
})

local Tab3Togglekill = Tab3Section:Toggle({
    Title = "靠近自动攻击",
    Desc = "需要拿起武器，靠近目标自动攻击",
    Default = false,
    Callback = function(enabled)
        WindUI:Notify({
            Title = "自动攻击",
            Content = enabled and "✅ 已开启靠近自动攻击" or "❌ 已关闭靠近自动攻击",
            Icon = "bolt",
            Duration = 3
        })
        
        local Players = nil	
        local isRunning = nil	
        if enabled then
            local r1_585 = getgenv().configs and getgenv().configs.connections
            if r1_585 then
                local r2_585 = getgenv().configs.Disable
                r3_585 = pairs
                for r6_585, r7_585 in r3_585(r1_585) do
                    r7_585:Disconnect()
                end
                r2_585:Fire()
                r2_585:Destroy()
                table.clear(getgenv().configs)
            end
            local r2_585 = Instance.new("BindableEvent")
            r3_585 = getgenv()
            r3_585.configs = {
                connections = {},
                Disable = r2_585,
                Size = Vector3.new(10, 10, 10),
                DeathCheck = true,
            }
            r3_585 = game:GetService("Players")
            local r4_585 = game:GetService("RunService")
            local r5_585 = r3_585.LocalPlayer
            r6_585 = true
            local r7_585 = OverlapParams.new()
            r7_585.FilterType = Enum.RaycastFilterType.Include
            local function r8_585(r0_591)
                if not r0_591 then
                    r0_591 = r5_585
                end
                return r0_591.Character
            end
            local function r9_585(r0_590)
                if not r0_590 then
                    return nil
                end
                local candidate = r0_590
                if type(candidate) == "userdata" and candidate.IsA then
                    if candidate:IsA("Player") then
                        candidate = r8_585(candidate)
                    end
                    if candidate and type(candidate) == "userdata" and candidate.IsA then
                        if candidate:IsA("Model") then
                            return candidate:FindFirstChildWhichIsA("Humanoid") or candidate:FindFirstChild("Humanoid")
                        elseif candidate:IsA("Humanoid") then
                            return candidate
                        end
                    end
                end
                return nil
            end
            local function r10_585(r0_587)
                return r0_587 and 0 < r0_587.Health
            end
            local function r11_585(r0_588)
                return r0_588 and r0_588:FindFirstChildWhichIsA("TouchTransmitter", true)
            end
            local function r12_585(r0_589)
                local r1_589 = {}
                for r5_589, r6_589 in pairs(r3_585:GetPlayers()) do
                    table.insert(r1_589, r8_585(r6_589))
                end
                for r5_589, r6_589 in pairs(r1_589) do
                    if r6_589 == r0_589 then
                        table.remove(r1_589, r5_589)
                        break
                    end
                end
                return r1_589
            end
            local function r13_585(r0_592, r1_592, r2_592)
                if r0_592:IsDescendantOf(workspace) then
                    r0_592:Activate()
                    firetouchinterest(r1_592, r2_592, 1)
                    firetouchinterest(r1_592, r2_592, 0)
                end
            end
            table.insert(getgenv().configs.connections, r2_585.Event:Connect(function()
                r6_585 = false
            end))
            while r6_585 do
                local r14_585 = r8_585()
                if r10_585(r9_585(r14_585)) then
                    local r15_585 = r14_585 and r14_585:FindFirstChildWhichIsA("Tool")
                    local r16_585 = r15_585 and r11_585(r15_585)
                    if r16_585 then
                        local r17_585 = r16_585.Parent
                        local r18_585 = r12_585(r14_585)
                        r7_585.FilterDescendantsInstances = r18_585
                        for r23_585, r24_585 in pairs(workspace:GetPartBoundsInBox(r17_585.CFrame, r17_585.Size + getgenv().configs.Size, r7_585)) do
                            local r25_585 = r24_585:FindFirstAncestorWhichIsA("Model")
                            if table.find(r18_585, r25_585) then
                                if getgenv().configs.DeathCheck and r10_585(r9_585(r25_585)) then
                                    r13_585(r15_585, r17_585, r24_585)
                                elseif not getgenv().configs.DeathCheck then
                                    r13_585(r15_585, r17_585, r24_585)
                                end
                            end
                        end
                    end
                end
                r4_585.Heartbeat:Wait()
            end
        else
            local r1_585 = getgenv().configs.Disable
            if r1_585 then
                r1_585:Fire()
                r1_585:Destroy()
            end
            r3_585 = getgenv
            r3_585 = r3_585()
            r3_585 = r3_585.configs
            r3_585 = r3_585.connections
            for r5_585, r6_585 in pairs(r3_585) do
                r6_585:Disconnect()
            end
            r3_585 = getgenv
            r3_585 = r3_585()
            r3_585 = r3_585.configs
            r3_585 = r3_585.connections
            table.clear(r3_585)
            Run = false
        end
    end
})

Tab3Section:Button({
    Title = "快速互动",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
        WindUI:Notify({
            Title = "互动设置",
            Content = "已开启快速互动",
            Icon = "bolt"
        })
    end
})

local autoInteract = false
local Tab3Toggle = Tab3Section:Toggle({
    Title = "自动互动",
    Desc = "自动触发所有交互提示",
    Default = false,
    Callback = function(enabled)
        autoInteract = enabled
        WindUI:Notify({
            Title = "互动设置",
            Content = enabled and "✅ 已开启自动互动" or "❌ 已关闭自动互动",
            Icon = "bolt",
            Duration = 3
        })
        task.spawn(function()
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25)
            end
        end)
    end
})

Tab3Section:Button({
    Title = "删除所有道具",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
        WindUI:Notify({
            Title = "道具操作",
            Content = "已删除所有道具",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "删除道具",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
        WindUI:Notify({
            Title = "道具操作",
            Content = "已删除当前装备道具",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "装备全部道具",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
        WindUI:Notify({
            Title = "道具操作",
            Content = "已装备背包所有道具",
            Icon = "bolt"
        })
    end
})

Tab3Section:Button({
    Title = "获取当前道具",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
        WindUI:Notify({
            Title = "道具操作",
            Content = "已获取当前装备道具",
            Icon = "bolt"
        })
    end
})

local Tab3Togglebei = Tab3Section:Toggle({
    Title = "获取所有玩家背包",
    Desc = "自动获取其他玩家的工具",
    Default = false,
    Callback = function(enabled)
        WindUI:Notify({
            Title = "背包获取",
            Content = enabled and "✅ 已开启自动获取背包" or "❌ 已关闭自动获取背包",
            Icon = "bolt",
            Duration = 3
        })
        task.spawn(function()
            while enabled do
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        wait()
                        for _, tool in pairs(player.Backpack:GetChildren()) do
                            tool.Parent = game.Players.LocalPlayer.Backpack
                            wait()
                        end
                    end
                end
                wait(1)
            end
        end)
    end
})

local Tab3Toggleren = Tab3Section:Toggle({
    Title = "人物不可见状态(隐身)",
    Desc = "隐藏自身模型，无法被看见",
    Default = false,
    Callback = function(enabled)
        WindUI:Notify({
            Title = "隐身状态",
            Content = enabled and "✅ 已开启隐身" or "❌ 已关闭隐身",
            Icon = "bolt",
            Duration = 3
        })
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("BasePart") then
                child.Transparency = enabled and 1 or 0
                child.CanCollide = not enabled
            elseif child:IsA("Accessory") then
                local handle = child.Handle
                handle.Transparency = enabled and 1 or 0
            end
        end
    end
})

-- 先定义函数
local function Cam2()
    while Cam1 do
        wait(0.1)
        local localPlayer = game:GetService("Players").LocalPlayer
        localPlayer.CameraMaxZoomDistance = 9000000000
    end
end

-- 再使用函数
local Tab3Toggleesy = Tab3Section:Toggle({
    Title = "解锁最大视野",
    Callback = function(enabled)
        Cam1 = enabled
        if Cam1 then
            Cam2()
        end
    end
})

Tab3Section:Button({
    Title = "锁定视野",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#000000"),
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/nekmtvpA/raw"))()
        WindUI:Notify({
            Title = "视野操作",
            Content = "锁定视野已激活",
            Icon = "bolt"
        })
    end
})

Tab3Section:Dropdown({
    Title = "选择帧率FPS",
    Values = {"FPS 5", "FPS 15", "FPS 30", "FPS 45", "FPS 60", "FPS 90", "FPS 120", "FPS 240", "最大FPS"},
    Value = "FPS 60", -- 默认选中60帧
    Callback = function(selected)
        local fps = {
            ["FPS 5"] = 5,
            ["FPS 15"] = 15,
            ["FPS 30"] = 30,
            ["FPS 45"] = 45,
            ["FPS 60"] = 60,
            ["FPS 90"] = 90,
            ["FPS 120"] = 120,
            ["FPS 240"] = 240,
            ["最大FPS"] = 10000
        }
        setfpscap(fps[selected])
        WindUI:Notify({
            Title = "帧率设置",
            Content = "已设置为"..selected,
            Icon = "bolt",
            Duration = 3
        })
    end
})

local Tab3Togglekiller = Tab3Section:Toggle({
    Title = "开启杀戮光环",
    Desc = "自动攻击范围内目标",
    Default = false,
    Callback = function(isEnabled)
        WindUI:Notify({
            Title = "杀戮光环",
            Content = isEnabled and "✅ 已开启" or "❌ 已关闭",
            Icon = "bolt",
            Duration = 3
        })
        
        local Players = nil	
        local isRunning = nil	
        if isEnabled then
            local existingConnections = getgenv().configs and getgenv().configs.connections
            if existingConnections then
                local disableEvent = getgenv().configs.Disable
                for _, connection in pairs(existingConnections) do
                    connection:Disconnect()
                end
                disableEvent:Fire()
                disableEvent:Destroy()
                table.clear(getgenv().configs)
            end
            local disableEvent = Instance.new("BindableEvent")
            getgenv().configs = {
                connections = {},
                Disable = disableEvent,
                Size = Vector3.new(10, 10, 10),
                DeathCheck = true,
            }
            Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local localPlayer = Players.LocalPlayer
            isRunning = true
            local overlapParams = OverlapParams.new()
            overlapParams.FilterType = Enum.RaycastFilterType.Include
            local function GetCharacter(player)
                if not player then
                    player = localPlayer
                end
                return player.Character
            end
            local function GetHumanoid(model)
                if not model then
                    return nil
                end
                if type(model) == "userdata" and model.IsA then
                    if model:IsA("Player") then
                        model = GetCharacter(model)
                    end
                    if model and type(model) == "userdata" and model.IsA then
                        if model:IsA("Model") then
                            return model:FindFirstChildWhichIsA("Humanoid") or model:FindFirstChild("Humanoid")
                        elseif model:IsA("Humanoid") then
                            return model
                        end
                    end
                end
                return nil
            end
            local function IsAlive(humanoid)
                return humanoid and 0 < humanoid.Health
            end
            local function HasTouchTransmitter(tool)
                return tool and tool:FindFirstChildWhichIsA("TouchTransmitter", true)
            end
            local function GetOtherCharacters(excludeCharacter)
                local characters = {}
                for _, player in pairs(Players:GetPlayers()) do
                    table.insert(characters, GetCharacter(player))
                end
                for index, character in pairs(characters) do
                    if character == excludeCharacter then
                        table.remove(characters, index)
                        break
                    end
                end
                return characters
            end
            local function ActivateTool(tool, part, targetPart)
                if tool:IsDescendantOf(workspace) then
                    tool:Activate()
                    firetouchinterest(part, targetPart, 1)
                    firetouchinterest(part, targetPart, 0)
                end
            end
            table.insert(getgenv().configs.connections, disableEvent.Event:Connect(function()
                isRunning = false
            end))
            while isRunning do
                local localCharacter = GetCharacter()
                if IsAlive(GetHumanoid(localCharacter)) then
                    local tool = localCharacter and localCharacter:FindFirstChildWhichIsA("Tool")
                    local touchTransmitter = tool and HasTouchTransmitter(tool)
                    if touchTransmitter then
                        local toolPart = touchTransmitter.Parent
                        local otherCharacters = GetOtherCharacters(localCharacter)
                        overlapParams.FilterDescendantsInstances = otherCharacters
                        for _, part in pairs(workspace:GetPartBoundsInBox(toolPart.CFrame, toolPart.Size + getgenv().configs.Size, overlapParams)) do
                            local characterModel = part:FindFirstAncestorWhichIsA("Model")
                            if table.find(otherCharacters, characterModel) then
                                if getgenv().configs.DeathCheck and IsAlive(GetHumanoid(characterModel)) then
                                    ActivateTool(tool, toolPart, part)
                                elseif not getgenv().configs.DeathCheck then
                                    ActivateTool(tool, toolPart, part)
                                end
                            end
                        end
                    end
                end
                RunService.Heartbeat:Wait()
            end
        else
            local disableEvent = getgenv().configs.Disable
            if disableEvent then
                disableEvent:Fire()
                disableEvent:Destroy()
            end
            local configs = getgenv().configs
            local connections = configs.connections
            for _, connection in pairs(connections) do
                connection:Disconnect()
            end
            table.clear(connections)
            Run = false
        end
    end
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

local Tab3Togglehudong = Tab3Section:Toggle({
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

MainWindow:SetToggleKey(Enum.KeyCode.LeftControl)
