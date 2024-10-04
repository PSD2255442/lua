--[[ EXTREMELY OBFUSCATED CODE ]]

local a, b, c, d = string.char, math.random, game, Instance.new
local e = table.concat

local function f()
    local g = d(e({a(83), a(99), a(114), a(101), a(101), a(110), a(71), a(117), a(105)}))
    g.Name = e({a(67), a(117), a(115), a(116), a(111), a(109), a(71), a(85), a(73)}) .. b(1000, 9999)
    g.Parent = c.Players.LocalPlayer:WaitForChild(e({a(80), a(108), a(97), a(121), a(101), a(114), a(71), a(117), a(105)}))
    
    local h = d(e({a(70), a(114), a(97), a(109), a(101)}))
    h.Size = UDim2.new(0.5, 0, 0.7, 0)
    h.Position = UDim2.new(0.25, 0, 0.15, 0)
    h.BackgroundColor3 = Color3.fromRGB(b(50, 100), b(50, 100), b(50, 100))
    h.Parent = g
    
    local i = d(e({a(84), a(101), a(120), a(116), a(76), a(97), a(98), a(101), a(108)}))
    i.Size = UDim2.new(1, 0, 0.2, 0)
    i.Text = e({a(240), a(159), a(152), a(136), a(32), a(228), a(184), a(137), a(228), a(184), a(162), a(228), a(184), a(185), a(32), a(71), a(79), a(75), a(85), a(82), a(65), a(75), a(85), a(32), a(228), a(187), a(138), a(32), a(240), a(159), a(152), a(136)})
    i.TextColor3 = Color3.fromRGB(255, 255, 255)
    i.BackgroundTransparency = 1
    i.Parent = h

    local j, k, l, m = false, nil, nil, nil
    
    local function n(o)
        j = true
        k = o.Position
        l = h.Position
        o.Changed:Connect(function()
            if o.UserInputState == Enum.UserInputState.End then
                j = false
            end
        end)
    end
    
    local function p(o)
        if j then
            local q = o.Position - k
            h.Position = UDim2.new(l.X.Scale, l.X.Offset + q.X, l.Y.Scale, l.Y.Offset + q.Y)
        end
    end

    h.InputBegan:Connect(function(o)
        if o.UserInputType == Enum.UserInputType.MouseButton1 then
            n(o)
        end
    end)
    
    h.InputChanged:Connect(function(o)
        if o.UserInputType == Enum.UserInputType.MouseMovement then
            p(o)
        end
    end)

    
    local r = d(e({a(84), a(101), a(120), a(116), a(66), a(117), a(116), a(116), a(111), a(110)}))
    r.Size = UDim2.new(0.8, 0, 0.1, 0)
    r.Position = UDim2.new(0.1, 0, 0.25, 0)
    r.Text = e({a(12371), a(12385), a(19990), a(30028), a(12434), a(12459), a(12521), a(12523), a(12501), a(12522)})
    r.Parent = h
    r.MouseButton1Click:Connect(function()
        for _, s in pairs(workspace:GetDescendants()) do
            if s:IsA("BasePart") then
                s.Color = Color3.fromRGB(b(0, 255), b(0, 255), b(0, 255))
            end
        end
    end)

    
    local t = d(e({a(84), a(101), a(120), a(116), a(66), a(117), a(116), a(116), a(111), a(110)}))
    t.Size = UDim2.new(0.8, 0, 0.1, 0)
    t.Position = UDim2.new(0.1, 0, 0.375, 0)
    t.Text = e({a(20511), a(12369), a(12428)})
    t.Parent = h
    t.MouseButton1Click:Connect(function()
        if c.Players.LocalPlayer.Character then
            c.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
        end
    end)

    
    local u = d(e({a(84), a(101), a(120), a(116), a(66), a(117), a(116), a(116), a(111), a(110)}))
    u.Size = UDim2.new(0.8, 0, 0.1, 0)
    u.Position = UDim2.new(0.1, 0, 0.625, 0)
    u.Text = e({a(23433), a(31354), a(31435)})
    u.Parent = h
    u.MouseButton1Click:Connect(function()
        if c.Players.LocalPlayer.Character then
            c.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b(800, 1200), b(800, 1200), b(800, 1200))
        end
    end)
end

f()
