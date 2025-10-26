-- 1. 基础服务定义（核心依赖）
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- 2. 清理旧UI（防止重复加载冲突）
if PlayerGui:FindFirstChild("AlienXWind30") then
    PlayerGui.AlienXWind30:Destroy()
end

-- 3. 创建核心UI容器
local UI = Instance.new("ScreenGui")
UI.Name = "Reset UI"
UI.Parent = PlayerGui
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.IgnoreGuiInset = true -- 忽略屏幕边缘 inset

-- 4. 主窗口框架（原始视觉风格：深色半透明+渐变边框）
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, 650, 0, 480)
MainWindow.Position = UDim2.new(0.5, -325, 0.5, -240)
MainWindow.BackgroundColor3 = Color3.fromRGB(15, 18, 30) -- 主背景色
MainWindow.BackgroundTransparency = 0.15
MainWindow.BorderSizePixel = 2
MainWindow.BorderColor3 = Color3.fromRGB(80, 140, 255) -- 边框色
MainWindow.CornerRadius = UDim.new(0, 10) -- 圆角
MainWindow.Parent = UI

-- 5. 标题栏（带渐变背景+拖动功能）
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
TitleBar.CornerRadius = UDim.new(0, 8)
TitleBar.Parent = MainWindow

-- 标题栏渐变效果（原始UI视觉细节）
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Name = "TitleGradient"
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 140, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 80, 200))
})
TitleGradient.Parent = TitleBar

-- 标题文本
local TitleText = Instance.new("TextLabel")
TitleText.Text = "Reset | Premium UI"
TitleText.Size = UDim2.new(1, -80, 1, 0)
TitleText.Position = UDim2.new(0, 20, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.TextColor3 = Color3.fromRGB(220, 240, 255)
TitleText.Font = Enum.Font.UbuntuBold
TitleText.TextSize = 22
TitleText.Parent = TitleBar

-- 6. 控制按钮组（关闭+最小化）
-- 关闭按钮
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.White
CloseBtn.Font = Enum.Font.Ubuntu
CloseBtn.TextSize = 20
CloseBtn.CornerRadius = UDim.new(0, 6)
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function()
    UI:Destroy() -- 点击关闭UI
end)

-- 最小化按钮（隐藏主窗口，保留标题栏）
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -85, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(220, 160, 60)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.White
MinimizeBtn.Font = Enum.Font.Ubuntu
MinimizeBtn.TextSize = 24
MinimizeBtn.CornerRadius = UDim.new(0, 6)
MinimizeBtn.Parent = TitleBar

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MainWindow.Size = UDim2.new(0, 650, 0, 45) -- 缩小到仅标题栏
    else
        MainWindow.Size = UDim2.new(0, 650, 0, 480) -- 恢复原大小
    end
end)

-- 7. 功能标签页（原始UI分栏逻辑：移动/视觉/设置）
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 180, 1, -45)
TabContainer.Position = UDim2.new(0, 0, 0, 45)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 23, 38)
TabContainer.BackgroundTransparency = 0.2
TabContainer.Parent = MainWindow

-- 标签页按钮（3个核心分类）
local function createTab(name, posY, iconText)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = name .. "Tab"
    TabBtn.Size = UDim2.new(1, -20, 0, 50)
    TabBtn.Position = UDim2.new(0, 10, 0, posY)
    TabBtn.BackgroundColor3 = Color3.fromRGB(30, 35, 60)
    TabBtn.Text = iconText .. "  " .. name
    TabBtn.TextColor3 = Color3.fromRGB(200, 220, 255)
    TabBtn.Font = Enum.Font.Ubuntu
    TabBtn.TextSize = 18
    TabBtn.CornerRadius = UDim.new(0, 6)
    TabBtn.Parent = TabContainer
    return TabBtn
end

-- 创建3个标签页（移动/视觉/设置）
local MoveTab = createTab("Movement", 20, "🏃")
local VisualTab = createTab("Visuals", 80, "👁️")
local SettingsTab = createTab("Settings", 140, "⚙️")

-- 8. 功能内容区域（对应标签页切换）
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -180, 1, -45)
ContentContainer.Position = UDim2.new(0, 180, 0, 45)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainWindow

-- 功能内容页（初始隐藏，切换标签显示）
local function createContentPage(name)
    local Page = Instance.new("Frame")
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Parent = ContentContainer
    Page.Visible = false -- 默认隐藏
    return Page
end

local MovePage = createContentPage("Movement")
local VisualPage = createContentPage("Visuals")
local SettingsPage = createContentPage("Settings")

-- 标签页切换逻辑
local function switchTab(activeTab, activePage)
    -- 重置所有标签样式
    MoveTab.BackgroundColor3 = Color3.fromRGB(30, 35, 60)
    VisualTab.BackgroundColor3 = Color3.fromRGB(30, 35, 60)
    SettingsTab.BackgroundColor3 = Color3.fromRGB(30, 35, 60)
    -- 隐藏所有内容页
    MovePage.Visible = false
    VisualPage.Visible = false
    SettingsPage.Visible = false
    -- 激活当前标签和页面
    activeTab.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
    activePage.Visible = true
end

-- 绑定标签点击事件
MoveTab.MouseButton1Click:Connect(function() switchTab(MoveTab, MovePage) end)
VisualTab.MouseButton1Click:Connect(function() switchTab(VisualTab, VisualPage) end)
SettingsTab.MouseButton1Click:Connect(function() switchTab(SettingsTab, SettingsPage) end)
switchTab(MoveTab, MovePage) -- 默认激活「移动」标签

-- 9. 填充各页面功能（原始UI核心功能）
-- ==================== 【移动页面功能】 ====================
local function addMovementButton(name, posY, callback)
    local Btn = Instance.new("TextButton")
    Btn.Name = name .. "Btn"
    Btn.Size = UDim2.new(0.45, -10, 0, 50)
    Btn.Position = UDim2.new(0, 10, 0, posY)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 40, 70)
    Btn.Text = name
    Btn.TextColor3 = Color3.White
    Btn.Font = Enum.Font.Ubuntu
    Btn.TextSize = 16
    Btn.CornerRadius = UDim.new(0, 6)
    Btn.Parent = MovePage
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

-- 速度提升按钮（250速）
addMovementButton("Speed Boost (250)", 20, function()
    if Humanoid then Humanoid.WalkSpeed = 250 end
end)

-- 跳跃提升按钮（100跳）
addMovementButton("Jump Boost (100)", 80, function()
    if Humanoid then Humanoid.JumpPower = 100 end
end)

-- 无限跳跃按钮
local InfiniteJump = false
addMovementButton("Infinite Jump", 140, function()
    InfiniteJump = not InfiniteJump
end)

-- 重置移动属性按钮
addMovementButton("Reset Movement", 200, function()
    if Humanoid then
        Humanoid.WalkSpeed = 16
        Humanoid.JumpPower = 50
        InfiniteJump = false
    end
end)

-- 无限跳跃逻辑（循环检测）
UIS.InputBegan:Connect(function(input)
    if InfiniteJump and input.UserInputType == Enum.UserInputType.MouseButton1 then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- ==================== 【视觉页面功能】 ====================
local function addVisualToggle(name, posY, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Name = name .. "Toggle"
    Toggle.Size = UDim2.new(0.45, -10, 0, 50)
    Toggle.Position = UDim2.new(0, 10, 0, posY)
    Toggle.BackgroundColor3 = Color3.fromRGB(35, 40, 70)
    Toggle.Text = "❌ " .. name
    Toggle.TextColor3 = Color3.White
    Toggle.Font = Enum.Font.Ubuntu
    Toggle.TextSize = 16
    Toggle.CornerRadius = UDim.new(0, 6)
    Toggle.Parent = VisualPage
    local isActive = false
    Toggle.MouseButton1Click:Connect(function()
        isActive = not isActive
        Toggle.Text = (isActive and "✅ " or "❌ ") .. name
        callback(isActive)
    end)
    return Toggle
end

-- 玩家高亮（ESP基础功能，简化版）
addVisualToggle("Player Highlight", 20, function(active)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local Highlight = plr.Character:FindFirstChild("ESP_Highlight")
            if active then
                if not Highlight then
                    Highlight = Instance.new("Highlight")
                    Highlight.Name = "ESP_Highlight"
                    Highlight.Adornee = plr.Character
                    Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    Highlight.FillTransparency = 0.7
                    Highlight.OutlineColor = Color3.White
                    Highlight.OutlineTransparency = 0
                    Highlight.Parent = plr.Character
                end
            else
                if Highlight then Highlight:Destroy() end
            end
        end
    end
end)

-- 全屏亮度提升
addVisualToggle("Brightness Boost", 80, function(active)
    if active then
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(150, 150, 150)
    else
        game:GetService("Lighting").Brightness = 0
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(50, 50, 50)
    end
end)

-- ==================== 【设置页面功能】 ====================
-- UI透明度调节滑块
local TransparencySlider = Instance.new("Slider")
TransparencySlider.Name = "TransparencySlider"
TransparencySlider.Size = UDim2.new(0.8, 0, 0, 30)
TransparencySlider.Position = UDim2.new(0, 20, 0, 20)
TransparencySlider.MinValue = 0
TransparencySlider.MaxValue = 0.5
TransparencySlider.Value = 0.15 -- 初始透明度
TransparencySlider.Parent = SettingsPage

local TransparencyLabel = Instance.new("TextLabel")
TransparencyLabel.Text = "UI Transparency: " .. tostring(math.round(TransparencySlider.Value * 100)) .. "%"
TransparencyLabel.Size = UDim2.new(0.8, 0, 0, 20)
TransparencyLabel.Position = UDim2.new(0, 20, 0, 50)
TransparencyLabel.BackgroundTransparency = 1
TransparencyLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
TransparencyLabel.Font = Enum.Font.Ubuntu
TransparencyLabel.TextSize = 14
TransparencyLabel.Parent = SettingsPage

-- 滑块联动UI透明度
TransparencySlider.Changed:Connect(function()
    local value = TransparencySlider.Value
    MainWindow.BackgroundTransparency = value
    TitleBar.BackgroundTransparency = value - 0.05
    TransparencyLabel.Text = "UI Transparency: " .. tostring(math.round(value * 100)) .. "%"
end)

-- 重置UI按钮
local ResetUIBtn = Instance.new("TextButton")
ResetUIBtn.Name = "ResetUIBtn"
ResetUIBtn.Size = UDim2.new(0.45, -10, 0, 50)
ResetUIBtn.Position = UDim2.new(0, 10, 0, 100)
ResetUIBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 70)
ResetUIBtn.Text = "Reset UI Position"
ResetUIBtn.TextColor3 = Color3.White
ResetUIBtn.Font = Enum.Font.Ubuntu
ResetUIBtn.TextSize = 16
ResetUIBtn.CornerRadius = UDim.new(0, 6)
ResetUIBtn.Parent = SettingsPage
ResetUIBtn.MouseButton1Click:Connect(function()
    MainWindow.Position = UDim2.new(0.5, -325, 0.5, -240) -- 恢复中心位置
end)

-- 10. 主窗口拖动功能（原始逻辑）
local dragging = false
local dragStart = Vector2.new()
local dragPos = Vector2.new()

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        dragPos = MainWindow.Position
        UIS.MouseIcon = "rbxassetid://1218509409" -- 拖动光标
    end
end)

-- 鼠标移动时更新窗口位置
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainWindow.Position = UDim2.new(
            dragPos.X.Scale, dragPos.X.Offset + delta.X,
            dragPos.Y.Scale, dragPos.Y.Offset + delta.Y
        )
    end
end)

-- 结束拖动时重置状态
TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        UIS.MouseIcon = "rbxassetid://1218509410" -- 恢复默认光标
    end
end)

-- 额外修复：角色重生后重新绑定Humanoid（避免功能失效）
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    InfiniteJump = false -- 重生后重置无限跳跃状态
end)

print("Reset UI Loaded Successfully!") -- 加载成功提示
