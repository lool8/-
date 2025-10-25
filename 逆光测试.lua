local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

-- 1. 核心配置：服务器ID与对应专属脚本链接（按需修改）
local ServerScriptConfig = {
--自然灾害
    ["189707"] = "loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/jiaoben/refs/heads/main/%E9%80%86%E5%85%89%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))()", 
    ["987654321"] = "https://pastebin.com/raw/专属脚本2链接", 
    ["555555555"] = "https://pastebin.com/raw/专属脚本3链接"  
}
-- 通用脚本链接（无匹配服务器ID时执行）
local UniversalScriptUrl = "https://pastebin.com/raw/通用脚本链接"

-- 2. 工具函数：显示游戏内通知
local function ShowNotification(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

-- 3. 工具函数：执行远程脚本（带错误捕获）
local function ExecuteScript(scriptUrl, scriptType)
    local success, result = pcall(function()
        -- 加载并执行远程脚本
        local scriptFunc = loadstring(game:HttpGet(scriptUrl, true))
        if scriptFunc then
            scriptFunc()
        end
    end)
    if success then
        ShowNotification("脚本加载成功", "已为您切换到" .. scriptType .. "脚本", 6)
    else
        ShowNotification("脚本加载失败", "将自动尝试通用脚本：" .. tostring(result), 6)
        -- 加载失败时降级为通用脚本
        if scriptType ~= "通用" then
            ExecuteScript(UniversalScriptUrl, "通用")
        end
    end
end

-- 4. 主逻辑：检测服务器ID并执行对应脚本
local function Main()
    -- 获取当前服务器ID（GameId为游戏全局ID，JobId为单服务器实例ID，按需选择）
    local CurrentServerId = tostring(game.GameId) -- 若需匹配单服务器实例，替换为 game.JobId
    ShowNotification("检测中", "当前服务器ID：" .. CurrentServerId, 4)

    -- 匹配服务器ID：优先执行专属脚本
    local TargetScriptUrl = ServerScriptConfig[CurrentServerId]
    if TargetScriptUrl then
        ExecuteScript(TargetScriptUrl, "专属")
    else
        -- 无匹配时执行通用脚本
        ShowNotification("无专属脚本", "将为您加载通用脚本", 4)
        ExecuteScript(UniversalScriptUrl, "通用")
    end

    -- 5. 关闭主脚本：断开所有连接并清理变量
    local Connections = getgenv().MainConnections or {}
    for _, conn in pairs(Connections) do
        if conn and typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
    end
    getgenv().MainConnections = nil -- 清空连接缓存
    ShowNotification("主脚本已关闭", "后续操作由专属/通用脚本接管", 4)
end

-- 6. 初始化：等待本地玩家加载完成后执行主逻辑
local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    -- 等待玩家角色加载（避免早期执行导致功能异常）
    LocalPlayer.CharacterAdded:Wait()
    -- 存储主脚本连接（用于后续关闭）
    getgenv().MainConnections = {
        RunService.Heartbeat:Connect(function() end) -- 示例空连接，实际可添加主脚本的事件连接
    }
    -- 启动主逻辑
    Main()
else
    ShowNotification("错误", "未检测到本地玩家，脚本终止", 5)
end
