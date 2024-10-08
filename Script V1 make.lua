OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Orion%20Hub%20Ui",true))()

Window = OrionLib:MakeWindow({
    Name = "Verbal Hub Sigma Advance Ftap",
    HidePremium = false,
    SaveConfig = true,
    IntroEnabled = true,
    IntroText = "Welcome To Verbal Sigma Hub Ftap",
    IntroIcon = "rbxassetid://121559441445555",
    ConfigFolder = "Verbal Config"
})

idk = Window:MakeTab({
    Name = "Control Players/Toys",
    Icon = "rbxassetid://18844946427",
    PremiumOnly = false
})

function main()
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local SoundService = game:GetService("SoundService")
    local Camera = game.Workspace.CurrentCamera
    local player = game.Players.LocalPlayer
    local tiger = game.Workspace["Large Animals"].Tiger
    local controlEnabled = true
    local moveDirection = Vector3.new()
    local speed = 10
    local cameraOffset = Vector3.new(0, 5, -10)
    local cursorSensitivity = 0.1
    local isToggleActive = false
    local selectedOption = "Control Huge Tiger"
    local originalCameraType = Camera.CameraType
    local originalCameraSubject = Camera.CameraSubject
    local touchStartPosition = nil

    local toggleOnSoundId = "rbxassetid://1840422063"
    local toggleOffSoundId = "rbxassetid://858508159"

    local function createWarpEffect(duration)
        local warpGui = Instance.new("ScreenGui")
        warpGui.IgnoreGuiInset = true
        warpGui.ResetOnSpawn = false
        warpGui.Parent = player:WaitForChild("PlayerGui")

        local warpFrame = Instance.new("Frame")
        warpFrame.Size = UDim2.new(1.5, 0, 1.5, 0)
        warpFrame.Position = UDim2.new(-0.25, 0, -0.25, 0)
        warpFrame.BackgroundTransparency = 0.5
        warpFrame.Parent = warpGui

        local purpleFrame = Instance.new("Frame")
        purpleFrame.Size = UDim2.new(0.5, 0, 1, 0)
        purpleFrame.Position = UDim2.new(0, 0, 0, 0)
        purpleFrame.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        purpleFrame.BackgroundTransparency = 0.5
        purpleFrame.Parent = warpFrame

        local blackFrame = Instance.new("Frame")
        blackFrame.Size = UDim2.new(0.5, 0, 1, 0)
        blackFrame.Position = UDim2.new(0.5, 0, 0, 0)
        blackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        blackFrame.BackgroundTransparency = 0.5
        blackFrame.Parent = warpFrame

        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
        })
        gradient.Parent = warpFrame

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local tweenRotation = TweenService:Create(warpFrame, tweenInfo, {Rotation = 360})
        tweenRotation:Play()

        delay(duration, function()
            warpGui:Destroy()
        end)
    end

    function playSound(soundId, duration)
        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Volume = 1
        sound.Looped = false
        sound.Parent = SoundService

        sound:Play()
        delay(duration, function()
            sound:Stop()
            sound:Destroy()
        end)
    end

    local function updateMovement()
        if controlEnabled and isToggleActive and selectedOption == "Control Huge Tiger" then
            local newVelocity = moveDirection * speed
            tiger.PrimaryPart.Velocity = Vector3.new(newVelocity.x, tiger.PrimaryPart.Velocity.y, newVelocity.z)
            tiger.PrimaryPart.CFrame = tiger.PrimaryPart.CFrame + (moveDirection * speed * RunService.RenderStepped:Wait())
        end
    end

    local function updateCamera()
        if controlEnabled and isToggleActive and selectedOption == "Control Huge Tiger" then
            local mouse = player:GetMouse()
            local cursorPosition = mouse.Hit.p
            local directionToCursor = (cursorPosition - Camera.CFrame.Position).Unit
            local offset = directionToCursor * cursorSensitivity
            local targetPosition = tiger.PrimaryPart.Position + cameraOffset + offset
            Camera.CFrame = CFrame.new(
                Camera.CFrame.Position:Lerp(targetPosition, 0.1),
                tiger.PrimaryPart.Position
            )
        end
    end

    local function onInputBegan(input, isProcessed)
        if isProcessed or not (isToggleActive and selectedOption == "Control Huge Tiger") then return end
        if controlEnabled then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                moveDirection = moveDirection + Vector3.new(0, 0, -1)
            elseif input.KeyCode == Enum.KeyCode.W then
                moveDirection = moveDirection + Vector3.new(0, 0, -1)
            elseif input.KeyCode == Enum.KeyCode.A then
                moveDirection = moveDirection + Vector3.new(-1, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.S then
                moveDirection = moveDirection + Vector3.new(0, 0, 1)
            elseif input.KeyCode == Enum.KeyCode.D then
                moveDirection = moveDirection + Vector3.new(1, 0, 0)
            end
        end
    end

    local function onInputEnded(input, isProcessed)
        if isProcessed or not (isToggleActive and selectedOption == "Control Huge Tiger") then return end
        if controlEnabled then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                moveDirection = moveDirection - Vector3.new(0, 0, -1)
            elseif input.KeyCode == Enum.KeyCode.W then
                moveDirection = moveDirection - Vector3.new(0, 0, -1)
            elseif input.KeyCode == Enum.KeyCode.A then
                moveDirection = moveDirection - Vector3.new(-1, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.S then
                moveDirection = moveDirection - Vector3.new(0, 0, 1)
            elseif input.KeyCode == Enum.KeyCode.D then
                moveDirection = moveDirection - Vector3.new(1, 0, 0)
            end
        end
    end

    local function onTouchStart(touch)
        if not (isToggleActive and selectedOption == "Control Huge Tiger") then return end
        touchStartPosition = touch.Position
    end

    local function onTouchMove(touch)
        if not (isToggleActive and selectedOption == "Control Huge Tiger") then return end
        if touchStartPosition then
            local touchDelta = touch.Position - touchStartPosition
            moveDirection = Vector3.new(touchDelta.X, 0, touchDelta.Y).Unit
        end
    end

    local function onTouchEnd(touch)
        if touchStartPosition then
            moveDirection = Vector3.new()
            touchStartPosition = nil
        end
    end

    UserInputService.InputBegan:Connect(onInputBegan)
    UserInputService.InputEnded:Connect(onInputEnded)
    UserInputService.TouchStarted:Connect(onTouchStart)
    UserInputService.TouchMoved:Connect(onTouchMove)
    UserInputService.TouchEnded:Connect(onTouchEnd)
    RunService.RenderStepped:Connect(updateMovement)
    RunService.RenderStepped:Connect(updateCamera)

    if not tiger.PrimaryPart then
        tiger.PrimaryPart = tiger:FindFirstChildWhichIsA("BasePart")
    end

    local function toggleControl(state)
        if state then
            originalCameraType = Camera.CameraType
            originalCameraSubject = Camera.CameraSubject
            Camera.CameraType = Enum.CameraType.Scriptable
            Camera.CameraSubject = tiger.PrimaryPart
            controlEnabled = true
            isToggleActive = true
            playSound(toggleOnSoundId, 1)
            createWarpEffect(3)
        else
            controlEnabled = false
            isToggleActive = false
            Camera.CameraType = originalCameraType
            Camera.CameraSubject = originalCameraSubject
            playSound(toggleOffSoundId, 1)
        end
    end

    idk:AddDropdown({
        Name = "Select Control Option",
        Options = {"Control Huge Tiger", "Other Option 1", "Other Option 2"},
        Default = "Control Huge Tiger",
        Callback = function(option)
            selectedOption = option
        end,
    })

    idk:AddToggle({
        Name = "Control Tiger(setowner first grab the tiger first huge tiger)",
        Default = false,
        Callback = function(value)
            toggleControl(value)
        end
    })
end

main()
