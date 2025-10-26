local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 创建主屏幕GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TopFloatingUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- 创建顶部悬浮条
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(0.3, 0, 0, 40)  -- 宽度为屏幕30%，高度40像素
topBar.Position = UDim2.new(0.35, 0, 0, 10)  -- 水平居中，距离顶部10像素
topBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
topBar.BorderSizePixel = 0
topBar.ZIndex = 10
topBar.Parent = screenGui

-- 顶部悬浮条圆角
local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 8)
topBarCorner.Parent = topBar

-- 添加阴影效果
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"  -- 阴影贴图
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = 9
shadow.Parent = topBar

-- 添加拖拽区域
local dragArea = Instance.new("TextButton")
dragArea.Name = "DragArea"
dragArea.Size = UDim2.new(1, -50, 1, 0)  -- 留出右侧空间给按钮
dragArea.Position = UDim2.new(0, 0, 0, 0)
dragArea.BackgroundTransparency = 1
dragArea.Text = ""
dragArea.ZIndex = 11
dragArea.Parent = topBar

-- 添加标题
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "控制面板"
title.TextSize = 14
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 11
title.Parent = topBar

-- 添加切换按钮
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 40, 1, 0)
toggleButton.Position = UDim2.new(1, -40, 0, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "≡"
toggleButton.TextSize = 16
toggleButton.ZIndex = 11
toggleButton.Parent = topBar

-- 切换按钮圆角
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

-- 创建主UI容器
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.3, 0, 0, 300)  -- 与顶部条同宽
mainFrame.Position = UDim2.new(0.35, 0, 0, 50)  -- 在顶部条下方
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- 主UI圆角
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

-- 主UI阴影
local mainShadow = Instance.new("ImageLabel")
mainShadow.Name = "MainShadow"
mainShadow.Size = UDim2.new(1, 10, 1, 10)
mainShadow.Position = UDim2.new(0, -5, 0, -5)
mainShadow.BackgroundTransparency = 1
mainShadow.Image = "rbxassetid://1316045217"
mainShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
mainShadow.ImageTransparency = 0.8
mainShadow.ScaleType = Enum.ScaleType.Slice
mainShadow.SliceCenter = Rect.new(10, 10, 118, 118)
mainShadow.ZIndex = 9
mainShadow.Parent = mainFrame

-- 添加内容区域
local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Size = UDim2.new(1, -20, 1, -20)
content.Position = UDim2.new(0, 10, 0, 10)
content.BackgroundTransparency = 1
content.ScrollBarThickness = 5
content.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
content.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Parent = content
layout.Padding = UDim.new(0, 10)

-- 添加一些示例内容
for i = 1, 12 do
    local item = Instance.new("Frame")
    item.Size = UDim2.new(1, 0, 0, 50)
    item.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    item.Parent = content
    
    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 6)
    itemCorner.Parent = item
    
    local itemTitle = Instance.new("TextLabel")
    itemTitle.Size = UDim2.new(1, -20, 0, 20)
    itemTitle.Position = UDim2.new(0, 10, 0, 5)
    itemTitle.BackgroundTransparency = 1
    itemTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    itemTitle.Text = "项目 " .. i
    itemTitle.TextSize = 14
    itemTitle.Font = Enum.Font.SourceSansBold
    itemTitle.TextXAlignment = Enum.TextXAlignment.Left
    itemTitle.Parent = item
    
    local itemDesc = Instance.new("TextLabel")
    itemDesc.Size = UDim2.new(1, -20, 0, 20)
    itemDesc.Position = UDim2.new(0, 10, 0, 25)
    itemDesc.BackgroundTransparency = 1
    itemDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
    itemDesc.Text = "这是项目 " .. i .. " 的描述"
    itemDesc.TextSize = 12
    itemDesc.Font = Enum.Font.SourceSans
    itemDesc.TextXAlignment = Enum.TextXAlignment.Left
    itemDesc.Parent = item
end

-- 状态变量
local isUIVisible = true
local isAnimating = false
local isDragging = false
local dragStartPos, frameStartPos

-- 切换UI显示状态的函数
local function toggleUI()
    if isAnimating then return end
    isAnimating = true
    
    local targetSize, targetPosition
    
    if isUIVisible then
        -- 隐藏UI
        targetSize = UDim2.new(0.3, 0, 0, 0)
        targetPosition = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, 0, 50)
        toggleButton.Text = "≡"
    else
        -- 显示UI
        targetSize = UDim2.new(0.3, 0, 0, 300)
        targetPosition = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, 0, 50)
        toggleButton.Text = "×"
    end
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = targetSize})
    local posTween = TweenService:Create(mainFrame, tweenInfo, {Position = targetPosition})
    
    sizeTween.Completed:Connect(function()
        isAnimating = false
    end)
    
    sizeTween:Play()
    posTween:Play()
    isUIVisible = not isUIVisible
end

-- 绑定切换按钮点击事件
toggleButton.MouseButton1Click:Connect(toggleUI)

-- 拖拽功能
local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStartPos = Vector2.new(input.Position.X, input.Position.Y)
        frameStartPos = topBar.Position
        
        -- 拖动时改变外观
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end

local function updateDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local dragDelta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPos
        
        -- 限制在屏幕范围内
        local newX = math.clamp(frameStartPos.X.Offset + dragDelta.X, 0, screenGui.AbsoluteSize.X - topBar.AbsoluteSize.X)
        local newY = math.clamp(frameStartPos.Y.Offset + dragDelta.Y, 0, screenGui.AbsoluteSize.Y - topBar.AbsoluteSize.Y)
        
        topBar.Position = UDim2.new(0, newX, 0, newY)
        
        -- 同时移动主UI
        if isUIVisible then
            mainFrame.Position = UDim2.new(0, newX, 0, newY + topBar.AbsoluteSize.Y)
        end
    end
end

local function endDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    end
end

-- 绑定拖拽事件
dragArea.InputBegan:Connect(startDrag)
dragArea.InputChanged:Connect(updateDrag)
UserInputService.InputEnded:Connect(endDrag)

-- 双击快速隐藏/显示
local lastClickTime = 0
dragArea.MouseButton1Click:Connect(function()
    local currentTime = tick()
    if currentTime - lastClickTime < 0.3 then
        -- 双击事件
        toggleUI()
    end
    lastClickTime = currentTime
end)

--- 创建一个简单的UI隐藏/显示切换系统
local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- 假设你的UI位于ScreenGui中
local screenGui = PlayerGui:WaitForChild("YourScreenGuiName") -- 替换为你的ScreenGui名称

-- 初始隐藏UI
screenGui.Enabled = false

-- 切换UI显示状态的函数
function toggleUI()
    screenGui.Enabled = not screenGui.Enabled
end

-- 绑定按键来切换UI（例如按F1键）
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        toggleUI()
    end
end)
