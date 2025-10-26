-- 核心UI容器（适配高版本Roblox，优化层级管理）
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlienX_Wind_UI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true -- 忽略屏幕边缘内边距，适配全尺寸

-- 顶部触发按钮（极简风，贴合参考UI的隐蔽式设计）
local TriggerBtn = Instance.new("TextButton")
TriggerBtn.Name = "WindTrigger"
TriggerBtn.Size = UDim2.new(0.12, 0, 0.025, 0)
TriggerBtn.Position = UDim2.new(0.44, 0, 0.005, 0) -- 灵动岛顶端正中间（贴顶）
TriggerBtn.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
TriggerBtn.BackgroundTransparency = 0.4
TriggerBtn.BorderSizePixel = 0
TriggerBtn.CornerRadius = UDim.new(0, 8) -- 圆角优化
TriggerBtn.Text = "Wind"
TriggerBtn.TextColor3 = Color3.fromRGB(180, 220, 255)
TriggerBtn.TextSize = 11
TriggerBtn.Font = Enum.Font.GothamBold -- 粗体字体，贴合参考风格
TriggerBtn.Parent = ScreenGui

-- 触发按钮hover动画（参考UI的交互反馈）
local TweenService = game:GetService("TweenService")
local hoverTweenIn = TweenService:Create(TriggerBtn, TweenInfo.new(0.2), {
    BackgroundTransparency = 0.2,
    TextColor3 = Color3.fromRGB(255, 255, 255)
})
local hoverTweenOut = TweenService:Create(TriggerBtn, TweenInfo.new(0.2), {
    BackgroundTransparency = 0.4,
    TextColor3 = Color3.fromRGB(180, 220, 255)
})

TriggerBtn.MouseEnter:Connect(function() hoverTweenIn:Play() end)
TriggerBtn.MouseLeave:Connect(function() hoverTweenOut:Play() end)

-- 半透明主界面（渐变+阴影，还原参考UI视觉）
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainUI"
MainFrame.Size = UDim2.new(0.75, 0, 0.65, 0)
MainFrame.Position = UDim2.new(0.125, 0, 0.175, 0) -- 居中偏上，更紧凑
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 30)
MainFrame.BackgroundTransparency = 0.7 -- 更细腻的半透明
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(60, 140, 255)
MainFrame.CornerRadius = UDim.new(0, 12) -- 大圆角，贴合参考风格
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- 主界面渐变叠加层（参考UI的渐变背景效果）
local Gradient = Instance.new("UIGradient")
Gradient.Name = "BgGradient"
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 40, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 20, 40))
})
Gradient.Rotation = 45
Gradient.Parent = MainFrame

-- 主界面阴影（增强层次感，参考UI的立体效果）
local Shadow = Instance.new("UIStroke")
Shadow.Name = "FrameShadow"
Shadow.Thickness = 3
Shadow.Color3 = Color3.fromRGB(0, 20, 80)
Shadow.Transparency = 0.7
Shadow.Parent = MainFrame

-- 标题栏（参考UI顶部标题设计，带关闭按钮）
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

-- 标题文字
local TitleText = Instance.new("TextLabel")
TitleText.Name = "Title"
TitleText.Text = "AlienX Wind"
TitleText.Size = UDim2.new(0.8, 0, 1, 0)
TitleText.Position = UDim2.new(0.1, 0, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.TextColor3 = Color3.fromRGB(180, 220, 255)
TitleText.TextSize = 16
TitleText.Font = Enum.Font.GothamBold
TitleText.Parent = TitleBar

-- 关闭按钮（参考UI的极简关闭键）
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseUI"
CloseBtn.Size = UDim2.new(0.05, 0, 0.8, 0)
CloseBtn.Position = UDim2.new(0.95, 0, 0.1, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 100, 100)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.Parent = TitleBar

-- 功能/分类扩展容器（完全预留，直接加内容即可）
local ContentHolder = Instance.new("Frame")
ContentHolder.Name = "ContentContainer"
ContentHolder.Size = UDim2.new(0.96, 0, 0.85, 0)
ContentHolder.Position = UDim2.new(0.02, 0, 0.12, 0)
ContentHolder.BackgroundTransparency = 1
ContentHolder.Parent = MainFrame

-- 动画控制（流畅显示/隐藏，参考UI的过渡效果）
local isUIOpen = false
local function toggleUI()
    isUIOpen = not isUIOpen
    local targetTransparency = isUIOpen and 0 or 0.7
    local targetScale = isUIOpen and UDim2.new(0.75, 0, 0.65, 0) or UDim2.new(0.7, 0, 0.6, 0)
    
    -- 主界面动画
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        BackgroundTransparency = targetTransparency,
        Size = targetScale
    }):Play()
    
    MainFrame.Visible = true
    -- 隐藏时延迟消失，保证动画完整
    if not isUIOpen then
        task.wait(0.3)
        MainFrame.Visible = false
    end
end

-- 触发按钮点击事件
TriggerBtn.MouseButton1Click:Connect(toggleUI)

-- 关闭按钮事件
CloseBtn.MouseButton1Click:Connect(function()
    if isUIOpen then toggleUI() end
end)

-- 点击主界面外部关闭（优化交互）
local CloseOverlay = Instance.new("TextButton")
CloseOverlay.Name = "CloseOverlay"
CloseOverlay.Size = UDim2.new(1, 0, 1, 0)
CloseOverlay.BackgroundTransparency = 1
CloseOverlay.Text = ""
CloseOverlay.Visible = false
CloseOverlay.Parent = ScreenGui

CloseOverlay.MouseButton1Click:Connect(function()
    if isUIOpen then toggleUI() end
    CloseOverlay.Visible = false
end)

-- 同步遮罩显示/隐藏
TriggerBtn.MouseButton1Click:Connect(function()
    CloseOverlay.Visible = isUIOpen
end)
