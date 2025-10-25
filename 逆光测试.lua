-- 逆光脚本 - Roblox平台专用（优化版）
-- 核心：UI交互+游戏脚本自动匹配+稳定性增强
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")

-- ===================== 1. 全局配置与工具函数 =====================
-- 1.1 全局状态与默认资源（避免空值报错）
getgenv().ScriptConfig = {
    ScriptEnabled = true,       -- 脚本总开关（控制执行/暂停）
    ScriptConnections = {},     -- 存储脚本事件连接（用于清理）
    DefaultImages = {           -- 默认图片资源（避免空白UI）
        RobloxLogo = "rbxassetid://1082855711",
        VipIcon = "rbxassetid://4483345998",
        RobuxIcon = "rbxassetid://134087988",
        BackGround = "rbxassetid://123456789"
    }
}

-- 1.2 UI拖拽工具（支持鼠标/触摸）
local function MakeDraggable(dragTrigger, targetObject)
    local Dragging = false
    local DragStartPos = nil
    local TargetStartPos = nil

    local function UpdateDrag(input)
        if not Dragging or not DragStartPos or not TargetStartPos then return end
        local Delta = input.Position - DragStartPos
        targetObject.Position = UDim2.new(
            TargetStartPos.X.Scale,
            TargetStartPos.X.Offset + Delta.X,
            TargetStartPos.Y.Scale,
            TargetStartPos.Y.Offset + Delta.Y
        )
    end

    -- 开始拖拽（鼠标左键/触摸）
    dragTrigger.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStartPos = input.Position
            TargetStartPos = targetObject.Position
            -- 监听拖拽结束
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    -- 拖拽中更新位置
    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and Dragging then
            UpdateDrag(input)
        end
    end)
end

-- 1.3 游戏内通知工具（统一样式）
local function ShowNotification(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5,
            Icon = getgenv().ScriptConfig.DefaultImages.VipIcon
        })
    end)
end

-- 1.4 安全获取本地玩家/角色（避免未加载报错）
local function GetLocalPlayer()
    return Players.LocalPlayer or Players.PlayerAdded:Wait()
end

local function GetLocalCharacter()
    local localPlayer = GetLocalPlayer()
    return localPlayer.Character or localPlayer.CharacterAdded:Wait()
end

-- 1.5 彩虹文本效果（优化性能：固定刷新间隔）
local function RainbowText(textObject)
    spawn(function()
        local colorStep = 10  -- 颜色步进值
        local currentValue = 1
        -- 循环刷新颜色（红→黄→绿→蓝→紫→红）
        while textObject and textObject.Parent and getgenv().ScriptConfig.ScriptEnabled do
            if currentValue <= 255 then
                textObject.TextColor3 = Color3.new(currentValue/255, 0, 0)
            elseif currentValue <= 510 then
                textObject.TextColor3 = Color3.new(255/255, (currentValue-255)/255, 0)
            elseif currentValue <= 765 then
                textObject.TextColor3 = Color3.new((765-currentValue)/255, 255/255, 0)
            elseif currentValue <= 1020 then
                textObject.TextColor3 = Color3.new(0, 255/255, (currentValue-765)/255)
            elseif currentValue <= 1275 then
                textObject.TextColor3 = Color3.new(0, (1275-currentValue)/255, 255/255)
            elseif currentValue <= 1530 then
                textObject.TextColor3 = Color3.new((currentValue-1275)/255, 0, 255/255)
            else
                currentValue = 1  -- 重置循环
            end
            currentValue = currentValue + colorStep
            task.wait(0.05)  -- 平衡流畅度与性能
        end
    end)
end

-- 1.6 全局清理函数（避免内存泄漏）
local function CleanupScript()
    -- 1. 断开所有事件连接
    for _, conn in pairs(getgenv().ScriptConfig.ScriptConnections) do
        if conn and typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    -- 2. 清空全局变量
    getgenv().ScriptConfig = nil
    _G.HoHoLoaded = nil
    -- 3. 提示清理完成
    ShowNotification("脚本已关闭", "所有资源已清理，可安全退出", 3)
end

-- 注册玩家退出时的清理（避免残留）
table.insert(getgenv().ScriptConfig.ScriptConnections, Players.PlayerRemoving:Connect(function(plr)
    if plr == GetLocalPlayer() then
        CleanupScript()
    end
end))


-- ===================== 2. 核心UI界面模块 =====================
-- 2.1 逆光脚本启动弹窗（YtPr）
function YtPr()
    local YoutubeGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local IconFrame = Instance.new("ImageLabel")
    local TitleLabel = Instance.new("TextLabel")
    local ConfirmButton = Instance.new("TextButton")
    local CloseAllBtn = Instance.new("TextButton")  -- 新增：关闭所有脚本按钮

    -- 基础UI设置
    YoutubeGui.Name = "YoutubeGui"
    YoutubeGui.Parent = game.CoreGui
    YoutubeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- 主窗口
    MainFrame.Parent = YoutubeGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.Position = UDim2.new(0.0937950909, 0, 0.497589529, 0)
    MainFrame.Size = UDim2.new(0.259740233, 0, 0.172176316, 0)
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = MainFrame
    MakeDraggable(MainFrame, MainFrame)  -- 支持拖拽窗口

    -- 图标（带红色边框）
    IconFrame.Parent = MainFrame
    IconFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconFrame.Position = UDim2.new(0.057500001, 0, 0.0700000003, 0)
    IconFrame.Size = UDim2.new(0.295138925, 0, 0.850000024, 0)
    IconFrame.Image = getgenv().ScriptConfig.DefaultImages.VipIcon
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 60)
    IconCorner.Parent = IconFrame
    local IconStroke = Instance.new("UIStroke", IconFrame)
    IconStroke.Color = Color3.fromRGB(255, 0, 0)
    IconStroke.Thickness = 3

    -- 标题
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.401250005, 0, 0.169999987, 0)
    TitleLabel.Size = UDim2.new(0.534722269, 0, 0.310000002, 0)
    TitleLabel.Font = Enum.Font.Highway
    TitleLabel.Text = "逆光脚本"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleLabel.TextScaled = true
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- 确认按钮（复制文本+关闭窗口）
    ConfirmButton.Parent = MainFrame
    ConfirmButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ConfirmButton.Position = UDim2.new(0.401250005, 0, 0.479999989, 0)
    ConfirmButton.Size = UDim2.new(0.534722269, 0, 0.349999994, 0)
    ConfirmButton.Font = Enum.Font.SourceSans
    ConfirmButton.Text = "逆光nb"
    ConfirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfirmButton.TextScaled = true
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.Parent = ConfirmButton

    -- 新增：关闭所有脚本按钮
    CloseAllBtn.Parent = MainFrame
    CloseAllBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    CloseAllBtn.Position = UDim2.new(0.02, 0, 0.9, 0)
    CloseAllBtn.Size = UDim2.new(0.2, 0, 0.08, 0)
    CloseAllBtn.Font = Enum.Font.Highway
    CloseAllBtn.Text = "关闭脚本"
    CloseAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseAllBtn.TextScaled = true
    local CloseBtnCorner = Instance.new("UICorner")
    CloseBtnCorner.Parent = CloseAllBtn

    -- 交互逻辑
    ConfirmButton.MouseButton1Click:Connect(function()
        game.Debris:AddItem(YoutubeGui, 0)
        setclipboard("逆光nb")
        ShowNotification("复制成功", "已复制「逆光nb」到剪贴板", 3)
    end)

    CloseAllBtn.MouseButton1Click:Connect(function()
        getgenv().ScriptConfig.ScriptEnabled = false
        CleanupScript()
        game.Debris:AddItem(YoutubeGui, 0)
    end)

    -- 30秒自动销毁
    game.Debris:AddItem(YoutubeGui, 30)
end

-- 2.2 精简版商店窗口（MakePrGui）
function MakePrGui()
    local PrEz = Instance.new("ScreenGui")
    local BackPanel = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")

    -- 基础设置
    PrEz.Name = "PrEz"
    PrEz.Parent = GetLocalPlayer():WaitForChild("PlayerGui")
    PrEz.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- 背景面板（带默认图）
    BackPanel.Name = "BackPanel"
    BackPanel.Parent = PrEz
    BackPanel.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    BackPanel.Size = UDim2.new(0.627615035, 0, 1, 0)
    BackPanel.Image = getgenv().ScriptConfig.DefaultImages.BackGround
    BackPanel.ImageTransparency = 0.3

    -- 关闭按钮（带倒计时）
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = PrEz
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.BackgroundTransparency = 0.5
    CloseButton.Position = UDim2.new(0.441004187, 0, 0, 0)
    CloseButton.Size = UDim2.new(0.185774058, 0, 0.100682594, 0)
    CloseButton.Font = Enum.Font.Cartoon
    CloseButton.Text = "[Close]"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true

    -- 倒计时与自动销毁
    local remainTime = 30
    game.Debris:AddItem(PrEz, remainTime)
    table.insert(getgenv().ScriptConfig.ScriptConnections, RunService.Heartbeat:Connect(function()
        if not PrEz then return end
        remainTime = remainTime - task.wait()
        CloseButton.Text = "[Close " .. math.ceil(remainTime) .. "s ]"
    end))

    -- 关闭逻辑
    CloseButton.MouseButton1Click:Connect(function()
        game.Debris:AddItem(PrEz, 0)
    end)
end

-- 2.3 彩虹文本列表窗口（CreateSupportList）
function CreateSupportList(gameList)
    local SupportUi = Instance.new("ScreenGui")
    local MainWindow = Instance.new("ImageLabel")
    local DarkOverlay = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local ScrollFrame = Instance.new("ScrollingFrame")
    local ListLayout = Instance.new("UIListLayout")
    local CloseButton = Instance.new("TextButton")

    -- 滚动列表核心配置（接 local ScrollFrame = Instance.new("ScrollingFrame") 后）
ScrollFrame.Parent = DarkOverlay
ScrollFrame.Active = true
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0.024, 0, 0.104, 0)
ScrollFrame.Size = UDim2.new(0, 366, 0, 329)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)  -- 自动适应列表内容高度
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)  -- 滚动条颜色（红色）
ScrollFrame.ScrollBarImageTransparency = 0.2  -- 滚动条透明度
ScrollFrame.ScrollBarImage = ""  -- 滚动条默认样式（可留空用系统默认）
ScrollFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None  -- 滚动条无内边距
ScrollFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None

-- 列表布局控制器（控制列表项排列）
local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollFrame
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder  -- 按布局顺序排列
ListLayout.Padding = UDim.new(0, 5)  -- 列表项之间垂直间距（5像素）
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left  -- 列表项左对齐
ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top  -- 列表项顶部对齐

-- 绑定布局变化，自动更新滚动区域高度
table.insert(getgenv().ScriptConfig.ScriptConnections, ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
end))

-- 关闭按钮（彩虹文本效果）
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = DarkOverlay
CloseButton.BackgroundTransparency = 1  -- 透明背景
CloseButton.Position = UDim2.new(0.896, 0, 0, 0)  -- 右上角定位
CloseButton.Size = UDim2.new(0, 39, 0, 39)  -- 按钮大小（正方形）
CloseButton.Font = Enum.Font.FredokaOne  -- 圆润字体
CloseButton.Text = "X"  -- 关闭符号
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- 白色文字
CloseButton.TextScaled = true  -- 文字自动适配按钮大小
RainbowText(CloseButton)  -- 应用彩虹文本动画

-- 向滚动列表添加游戏项（循环生成列表内容）
for _, gameName in pairs(gameList) do
    local GameLabel = Instance.new("TextLabel")
    GameLabel.Parent = ScrollFrame
    GameLabel.BackgroundTransparency = 1  -- 透明背景
    GameLabel.Size = UDim2.new(0, 353, 0, 24)  -- 列表项大小（宽353，高24）
    GameLabel.Font = Enum.Font.Highway  -- 标题类字体
    GameLabel.Text = "	• " .. gameName  -- 列表项文本（带项目符号）
    GameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- 白色文字
    GameLabel.TextScaled = true  -- 文字自动适配大小
    GameLabel.TextTransparency = 0.5  -- 文字半透明（弱化效果）
    GameLabel.TextXAlignment = Enum.TextXAlignment.Left  -- 文字左对齐
    RainbowText(GameLabel)  -- 应用彩虹文本动画
end

-- 关闭按钮点击逻辑（销毁列表窗口）
CloseButton.MouseButton1Click:Connect(function()
    game.Debris:AddItem(SupportUi, 0)  -- 立即销毁窗口
end)

local list = {
	--自然灾害
	[189707] = "loadstring(game:HttpGet("https://github.com/lool8/jiaoben/blob/main/%E9%80%86%E5%85%89%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))()",

}

local name = {
		[189707] = "自然灾害",
																																				
}

YtPr()
CreateSupportList({"自然灾害"

})
_G.HoHoLoaded = true
if getgenv().Key and listPre[game.GameId] ~= nil then
	getgenv().messagebox = function()end
	loadstring(listPre[tonumber(game.GameId)])()
elseif not getgenv().Key and list[game.GameId] ~= nil then
    game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "当前游戏:"..name[game.GameId].."";
                Text ="检测到你当前游玩的游戏为:"..name[game.GameId].."\n已自动为你执行此游戏脚本";
                Duration = 3;
            })
	loadstring(list[tonumber(game.GameId)])()
else
	game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "没有此游戏脚本";
                Text ="复制东西的名字";
                Duration = 5;
            })
	setclipboard("复制信息")
end