```lua
local UI = {
    RainbowColorValue = 0,
    HueSelectionPosition = 0,
}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')
local Mouse = game:GetService('Players').LocalPlayer:GetMouse()
local MouseMovement = Enum.UserInputType.MouseMovement
local MouseButton1 = Enum.UserInputType.MouseButton1
local Touch = Enum.UserInputType.Touch

if _G.Load then
    game.CoreGui.UI:Destroy()
else
    _G.Load = true
end

local ScreenGui = Instance.new('ScreenGui')
ScreenGui.Name = 'UI'
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

coroutine.wrap(function()
    while wait() do
        UI.RainbowColorValue = UI.RainbowColorValue + 0.00392156862745098
        UI.HueSelectionPosition = UI.HueSelectionPosition + 1

        if UI.RainbowColorValue >= 1 then
            UI.RainbowColorValue = 0
        end
        if UI.HueSelectionPosition == 80 then
            UI.HueSelectionPosition = 0
        end
    end
end)()

local function MakeDraggable(dragFrame, targetFrame)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    local dragInput = nil

    local function updateDrag(input)
        local delta = input.Position - dragStart
        targetFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end

    dragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == MouseButton1 or input.UserInputType == Touch then
            dragging = true
            dragStart = input.Position
            startPos = targetFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragFrame.InputChanged:Connect(function(input)
        if input.UserInputType == MouseMovement or input.UserInputType == Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateDrag(input)
        end
    end)
end

function UI:Window(buttonText, windowTitle, presetColor, backgroundImage)
    CloseBind = Enum.KeyCode.RightControl
    PresetColor = presetColor or Color3.fromRGB(44, 120, 224)
    firstTab = false

    local SwitchButton = Instance.new('TextButton')
    local SwitchCorner = Instance.new('UICorner')
    local MainFrame = Instance.new('ImageLabel')
    local TabHolder = Instance.new('ScrollingFrame')
    local TabLayout = Instance.new('UIListLayout')
    local TitleLabel = Instance.new('TextLabel')
    local TabFolder = Instance.new('Folder')
    local DragFrame = Instance.new('Frame')
    
    SwitchButton.Name = 'Switch'
    SwitchButton.Parent = ScreenGui
    SwitchButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SwitchButton.BackgroundTransparency = 0.5
    SwitchButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0)
    SwitchButton.Size = UDim2.new(0, 50, 0, 50)
    SwitchButton.Draggable = true
    SwitchButton.Font = Enum.Font.SourceSansBold
    SwitchButton.Text = buttonText
    SwitchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwitchButton.TextSize = 30
    SwitchButton.TextWrapped = true
    
    SwitchCorner.CornerRadius = UDim.new(0.5, 0)
    SwitchCorner.Name = 'SwitchCorner'
    SwitchCorner.Parent = SwitchButton

    MainFrame.Name = 'Main'
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BackgroundTransparency = 0.5
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Image = backgroundImage
    MainFrame.ClipsDescendants = true
    MainFrame.Visible = true

    TabHolder.Name = 'TabHold'
    TabHolder.Parent = MainFrame
    TabHolder.Active = true
    TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHolder.BackgroundTransparency = 1
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0.0339285731, 0, 0.147335425, 0)
    TabHolder.Size = UDim2.new(0, 107, 0, 254)
    TabHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabHolder.ScrollBarThickness = 0
    TabHolder.ScrollingDirection = Enum.ScrollingDirection.Y

    TabLayout.Name = 'TabHoldLayout'
    TabLayout.Parent = TabHolder
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Padding = UDim.new(0, 11)

    TitleLabel.Name = 'Title'
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.0339285731, 0, 0.0564263314, 0)
    TitleLabel.Size = UDim2.new(0, 200, 0, 23)
    TitleLabel.Font = Enum.Font.GothamSemibold
    TitleLabel.Text = windowTitle
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    DragFrame.Name = 'DragFrame'
    DragFrame.Parent = MainFrame
    DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DragFrame.BackgroundTransparency = 1
    DragFrame.Size = UDim2.new(0, 560, 0, 41)

    MainFrame:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
    MakeDraggable(DragFrame, MainFrame)

    local UIVisible = false
    function ToggleUI()
        if UIVisible ~= false then
            MainFrame:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
            UIVisible = false
        else
            MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
            UIVisible = true
        end
    end

    SwitchButton.MouseButton1Click:Connect(ToggleUI)
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == CloseBind then
            ToggleUI()
        end
    end)

    TabFolder.Name = 'TabFolder'
    TabFolder.Parent = MainFrame

    function UI:ChangePresetColor(newColor)
        PresetColor = newColor
    end

    function UI:Notification(title, description, buttonText)
        local NotificationHold = Instance.new('TextButton')
        local NotificationFrame = Instance.new('Frame')
        local OkayBtn = Instance.new('TextButton')
        local OkayBtnCorner = Instance.new('UICorner')
        local OkayBtnTitle = Instance.new('TextLabel')
        local NotificationTitle = Instance.new('TextLabel')
        local NotificationDesc = Instance.new('TextLabel')

        NotificationHold.Name = 'NotificationHold'
        NotificationHold.Parent = MainFrame
        NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.BackgroundTransparency = 1
        NotificationHold.BorderSizePixel = 0
        NotificationHold.Size = UDim2.new(0, 560, 0, 319)
        NotificationHold.AutoButtonColor = false
        NotificationHold.Font = Enum.Font.SourceSans
        NotificationHold.Text = ''
        NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.TextSize = 15

        TweenService:Create(NotificationHold, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.7
        }):Play()
        wait(0.4)

        NotificationFrame.Name = 'NotificationFrame'
        NotificationFrame.Parent = NotificationHold
        NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.Position = UDim2.new(0.5, 0, 0.498432577, 0)

        NotificationFrame:TweenSize(UDim2.new(0, 164, 0, 193), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.6, true)

        OkayBtn.Name = 'OkayBtn'
        OkayBtn.Parent = NotificationFrame
        OkayBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        OkayBtn.Position = UDim2.new(0.0609756112, 0, 0.720207274, 0)
        OkayBtn.Size = UDim2.new(0, 144, 0, 42)
        OkayBtn.AutoButtonColor = false
        OkayBtn.Font = Enum.Font.SourceSans
        OkayBtn.Text = ''
        OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        OkayBtn.TextSize = 15
        
        OkayBtnCorner.CornerRadius = UDim.new(0, 5)
        OkayBtnCorner.Name = 'OkayBtnCorner'
        OkayBtnCorner.Parent = OkayBtn
        
        OkayBtnTitle.Name = 'OkayBtnTitle'
        OkayBtnTitle.Parent = OkayBtn
        OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.BackgroundTransparency = 1
        OkayBtnTitle.Position = UDim2.new(0.0763888881, 0, 0, 0)
        OkayBtnTitle.Size = UDim2.new(0, 181, 0, 42)
        OkayBtnTitle.Font = Enum.Font.Gotham
        OkayBtnTitle.Text = buttonText
        OkayBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.TextSize = 15
        OkayBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        NotificationTitle.Name = 'NotificationTitle'
        NotificationTitle.Parent = NotificationFrame
        NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.BackgroundTransparency = 1
        NotificationTitle.Position = UDim2.new(0.0670731738, 0, 0.0829015523, 0)
        NotificationTitle.Size = UDim2.new(0, 143, 0, 26)
        NotificationTitle.Font = Enum.Font.Gotham
        NotificationTitle.Text = title
        NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.TextSize = 18
        NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        NotificationDesc.Name = 'NotificationDesc'
        NotificationDesc.Parent = NotificationFrame
        NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.BackgroundTransparency = 1
        NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
        NotificationDesc.Size = UDim2.new(0, 143, 0, 91)
        NotificationDesc.Font = Enum.Font.Gotham
        NotificationDesc.Text = description
        NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.TextSize = 16
        NotificationDesc.TextWrapped = true
        NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

        OkayBtn.MouseEnter:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(37, 37, 37),
            }):Play()
        end)
        
        OkayBtn.MouseLeave:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(34, 34, 34),
            }):Play()
        end)
        
        OkayBtn.MouseButton1Click:Connect(function()
            NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.6, true)
            wait(0.4)
            TweenService:Create(NotificationHold, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            }):Play()
            wait(0.3)
            NotificationHold:Destroy()
        end)
    end

    return {
        Tab = function(_, tabName)
            local TabBtn = Instance.new('TextButton')
            local TabBtnIndicator = Instance.new('Frame')
            local TabBtnIndicatorCorner = Instance.new('UICorner')

            TabBtn.Name = 'TabBtn'
            TabBtn.Parent = TabHolder
            TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabBtn.BackgroundTransparency = 1
            TabBtn.Size = UDim2.new(0, 107, 0, 21)
            TabBtn.Font = Enum.Font.Gotham
            TabBtn.Text = tabName
            TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
            TabBtn.TextSize = 15
            TabBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            TabBtnIndicator.Name = 'TabBtnIndicator'
            TabBtnIndicator.Parent = TabBtn
            TabBtnIndicator.BackgroundColor3 = PresetColor
            TabBtnIndicator.BorderSizePixel = 0
            TabBtnIndicator.Position = UDim2.new(0, 0, 1, 0)
            TabBtnIndicator.Size = UDim2.new(0, 0, 0, 2)
            
            TabBtnIndicatorCorner.Name = 'TabBtnIndicatorCorner'
            TabBtnIndicatorCorner.Parent = TabBtnIndicator

            coroutine.wrap(function()
                while wait() do
                    TabBtnIndicator.BackgroundColor3 = PresetColor
                end
            end)()

            local TabContent = Instance.new('ScrollingFrame')
            local TabContentLayout = Instance.new('UIListLayout')

            TabContent.Name = 'Tab'
            TabContent.Parent = TabFolder
            TabContent.Active = true
            TabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabContent.BackgroundTransparency = 1
            TabContent.BorderSizePixel = 0
            TabContent.Position = UDim2.new(0.31400001, 0, 0.147, 0)
            TabContent.Size = UDim2.new(0, 373, 0, 254)
            TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
            TabContent.ScrollBarThickness = 3
            TabContent.ScrollingDirection = Enum.ScrollingDirection.Y
            TabContent.Visible = false
            
            TabContentLayout.Name = 'TabLayout'
            TabContentLayout.Parent = TabContent
            TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
            TabContentLayout.Padding = UDim.new(0, 6)

            if firstTab == false then
                firstTab = true
                TabBtnIndicator.Size = UDim2.new(0, 15, 0, 2)
                TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                TabContent.Visible = true
            end

            TabBtn.MouseButton1Click:Connect(function()
                for _, child in pairs(TabFolder:GetChildren()) do
                    if child.Name == 'Tab' then
                        child.Visible = false
                    end
                end

                TabContent.Visible = true

                for _, child in pairs(TabHolder:GetChildren()) do
                    if child.Name == 'TabBtn' then
                        child.TabBtnIndicator:TweenSize(UDim2.new(0, 0, 0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
                        TabBtnIndicator:TweenSize(UDim2.new(0, 15, 0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
                        
                        TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(150, 150, 150),
                        }):Play()
                        
                        TweenService:Create(TabBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                        }):Play()
                    end
                end
            end)

            TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            return {
                Button = function(_, buttonText, callback)
                    local Button = Instance.new('TextButton')
                    local ButtonCorner = Instance.new('UICorner')
                    local ButtonTitle = Instance.new('TextLabel')

                    Button.Name = 'Button'
                    Button.Parent = TabContent
                    Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    Button.BackgroundTransparency = 0.4
                    Button.Size = UDim2.new(0, 363, 0, 42)
                    Button.AutoButtonColor = false
                    Button.Font = Enum.Font.SourceSans
                    Button.Text = ''
                    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Button.TextSize = 15
                    
                    ButtonCorner.CornerRadius = UDim.new(0, 5)
                    ButtonCorner.Name = 'ButtonCorner'
                    ButtonCorner.Parent = Button
                    
                    ButtonTitle.Name = 'ButtonTitle'
                    ButtonTitle.Parent = Button
                    ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.BackgroundTransparency = 1
                    ButtonTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                    ButtonTitle.Size = UDim2.new(0, 187, 0, 42)
                    ButtonTitle.Font = Enum.Font.Gotham
                    ButtonTitle.Text = buttonText
                    ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.TextSize = 15
                    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

                    Button.MouseEnter:Connect(function()
                        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(37, 37, 37),
                        }):Play()
                    end)
                    
                    Button.MouseLeave:Connect(function()
                        TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(34, 34, 34),
                        }):Play()
                    end)
                    
                    Button.MouseButton1Click:Connect(function()
                        pcall(callback)
                    end)

                    TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentLayout.AbsoluteContentSize.Y)
                end,

                Toggle = function(_, toggleText, defaultState, callback)
                    local toggleState = false
                    
                    local Toggle = Instance.new('TextButton')
                    local ToggleCorner = Instance.new('UICorner')
                    local ToggleTitle = Instance.new('TextLabel')
                    
                    local FrameToggle1 = Instance.new('Frame')
                    local FrameToggle1Corner = Instance.new('UICorner')
                    
                    local FrameToggle2 = Instance.new('Frame')
                    local FrameToggle2Corner = Instance.new('UICorner')
                    
                    local FrameToggle3 = Instance.new('Frame')
                    local FrameToggle3Corner = Instance.new('UICorner')
                    
                    local FrameToggleCircle = Instance.new('Frame')
                    local FrameToggleCircleCorner = Instance.new('UICorner')

                    Toggle.Name = 'Toggle'
                    Toggle.Parent = TabContent
                    Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    Toggle.BackgroundTransparency = 0.4
                    Toggle.Position = UDim2.new(0.215625003, 0, 0.446271926, 0)
                    Toggle.Size = UDim2.new(0, 363, 0, 42)
                    Toggle.AutoButtonColor = false
                    Toggle.Font = Enum.Font.SourceSans
                    Toggle.Text = ''
                    Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Toggle.TextSize = 15
                    
                    ToggleCorner.CornerRadius = UDim.new(0, 5)
                    ToggleCorner.Name = 'ToggleCorner'
                    ToggleCorner.Parent = Toggle
                    
                    ToggleTitle.Name = 'ToggleTitle'
                    ToggleTitle.Parent = Toggle
                    ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.BackgroundTransparency = 1
                    ToggleTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                    ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
                    ToggleTitle.Font = Enum.Font.Gotham
                    ToggleTitle.Text = toggleText
                    ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.TextSize = 15
                    ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                    
                    FrameToggle1.Name = 'FrameToggle1'
                    FrameToggle1.Parent = Toggle
                    FrameToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    FrameToggle1.Position = UDim2.new(0.859504104, 0, 0.285714298, 0)
                    FrameToggle1.Size = UDim2.new(0, 37, 0, 18)
                    
                    FrameToggle1Corner.Name = 'FrameToggle1Corner'
                    FrameToggle1Corner.Parent = FrameToggle1
                    
                    FrameToggle2.Name = 'FrameToggle2'
                    FrameToggle2.Parent = FrameToggle1
                    FrameToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    FrameToggle2.Position = UDim2.new(0.0489999987, 0, 0.0930000022, 0)
                    FrameToggle2.Size = UDim2.new(0, 33, 0, 14)
                    
                    FrameToggle2Corner.Name = 'FrameToggle2Corner'
                    FrameToggle2Corner.Parent = FrameToggle2
                    
                    FrameToggle3.Name = 'FrameToggle3'
                    FrameToggle3.Parent = FrameToggle1
                    FrameToggle3.BackgroundColor3 = PresetColor
                    FrameToggle3.BackgroundTransparency = 1
                    FrameToggle3.Size = UDim2.new(0, 37, 0, 18)
                    
                    FrameToggle3Corner.Name = 'FrameToggle3Corner'
                    FrameToggle3Corner.Parent = FrameToggle3
                    
                    FrameToggleCircle.Name = 'FrameToggleCircle'
                    FrameToggleCircle.Parent = FrameToggle1
                    FrameToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    FrameToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
                    FrameToggleCircle.Size = UDim2.new(0, 10, 0, 10)
                    
                    FrameToggleCircleCorner.Name = 'FrameToggleCircleCorner'
                    FrameToggleCircleCorner.Parent = FrameToggleCircle

                    coroutine.wrap(function()
                        while wait() do
                            FrameToggle3.BackgroundColor3 = PresetColor
                        end
                    end)()

                    Toggle.MouseButton1Click:Connect(function()
                        if toggleState ~= false then
                            TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(34, 34, 34),
                            }):Play()
                            TweenService:Create(FrameToggle1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0
                            }):Play()
                            TweenService:Create(FrameToggle2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0
                            }):Play()
                            TweenService:Create(FrameToggle3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 1
                            }):Play()
                            TweenService:Create(FrameToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                            }):Play()
                            
                            FrameToggleCircle:TweenPosition(
                                UDim2.new(0.127000004, 0, 0.222000003, 0), 
                                Enum.EasingDirection.Out, 
                                Enum.EasingStyle.Quart, 
                                0.2, 
                                true
                            )
                        else
                            TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(37, 37, 37),
                            }):Play()
                            TweenService:Create(FrameToggle1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 1
                            }):Play()
                            TweenService:Create(FrameToggle2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 1
                            }):Play()
                            TweenService:Create(FrameToggle3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0
                            }):Play()
                            TweenService:Create(FrameToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            }):Play()
                            
                            FrameToggleCircle:TweenPosition(
                                UDim2.new(0.587, 0, 0.222000003, 0), 
                                Enum.EasingDirection.Out, 
                                Enum.EasingStyle.Quart, 
                                0.2, 
                                true
                            )
                        end

                        toggleState = not toggleState
                        pcall(callback, toggleState)
                    end)

                    if defaultState == true then
                        TweenService:Create(Toggle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(37, 37, 37),
                        }):Play()
                        TweenService:Create(FrameToggle1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 1
                        }):Play()
                        TweenService:Create(FrameToggle2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 1
                        }):Play()
                        TweenService:Create(FrameToggle3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0
                        }):Play()
                        TweenService:Create(FrameToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        }):Play()

                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0), 
                            Enum.EasingDirection.Out, 
                            Enum.EasingStyle.Quart, 
                            0.2, 
                            true
                        )

                        toggleState = not toggleState
                    end

                    TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContentLayout.AbsoluteContentSize.Y)
                end,

                Slider = function(_, sliderText, minValue, maxValue, defaultValue, callback)
                    local dragging = false
                    
                    local Slider = Instance.new('TextButton')
                    local SliderCorner = Instance.new('UICorner')
                    local SliderTitle = Instance.new('TextLabel')
                    local SliderValue = Instance.new('TextLabel')
                    local SlideFrame = Instance.new('Frame')
                    local CurrentValueFrame = Instance.new('Frame')
                    local SlideCircle = Instance.new('ImageButton')

                    Slider.Name = 'Slider'
                    Slider.Parent = TabContent
                    Slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                    Slider.BackgroundTransparency = 0.4
                    Slider.Position = UDim2.new(-0.48035714, 0, -0.570532918, 0)
                    Slider.Size = UDim2.new(0, 363, 0, 60)
                    Slider.AutoButtonColor = false
                    Slider.Font = Enum.Font.SourceSans
                    Slider.Text = ''
                    Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
                    Slider.TextSize = 15
                    
                    SliderCorner.CornerRadius = UDim.new(0, 5)
                    SliderCorner.Name = 'SliderCorner'
                    SliderCorner.Parent = Slider
                    
                    SliderTitle.Name = 'SliderTitle'
                    SliderTitle.Parent = Slider
                    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.BackgroundTransparency = 1
                    SliderTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
                    SliderTitle.Size = UDim2.new(0, 187, 0, 42)
                    SliderTitle.Font = Enum.Font.Gotham
                    SliderTitle.Text = sliderText
                    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.TextSize = 15
                    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                    
                    SliderValue.Name = 'SliderValue'
                    SliderValue.Parent = Slider
                    SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderValue.BackgroundTransparency = 1
                    SliderValue.Position = UDim2.new(0.0358126722, 0, 0, 0)
                    SliderValue.Size = UDim2.new(0, 335, 0, 42)
                    SliderValue.Font = Enum.Font.Gotham
                    SliderValue.Text = tostring(defaultValue and (math.floor(defaultValue / maxValue * (maxValue - minValue) + minValue) or 0) or 0)
                    SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderValue.TextSize = 15
                    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
                    
                    SlideFrame.Name = 'SlideFrame'
                    SlideFrame.Parent = Slider
                    SlideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    SlideFrame.BorderSizePixel = 0
                    SlideFrame.Position = UDim2.new(0.0342647657, 0, 0.686091602, 0)
                    SlideFrame.Size = UDim2.new(0, 335, 0, 3)
                    
                    CurrentValueFrame.Name = 'CurrentValueFrame'
                    CurrentValueFrame.Parent = SlideFrame
                    CurrentValueFrame.BackgroundColor3 = PresetColor
                    CurrentValueFrame.BorderSizePixel = 0
                    CurrentValueFrame.Size = UDim2.new((defaultValue or 0) / maxValue, 0, 0, 3)
                    
                    SlideCircle.Name = 'SlideCircle'
                    SlideCircle.Parent = SlideFrame
                    SlideCircle.BackgroundColor3 = PresetColor
                    SlideCircle.BackgroundTransparency = 1
                    SlideCircle.Position = UDim2.new((defaultValue or 0) / maxValue, -6, -1.30499995, 0)
                    SlideCircle.Size = UDim2.new(0, 11, 0, 11)
                    SlideCircle.Image = 'rbxassetid://3570695787'
                    SlideCircle.ImageColor3 = PresetColor

                    coroutine.wrap(function()
                        while wait() do
                            CurrentValueFrame.BackgroundColor3 = PresetColor
                            SlideCircle.ImageColor3 = PresetColor
                        end
                    end)()

                    pcall(callback, defaultValue and (math.floor(defaultValue