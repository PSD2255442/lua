-- GUIを作成するための関数
local function createGUI()
    -- GUIのインスタンスを作成
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CustomGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- フレームを作成
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0.5, 0, 0.7, 0) -- GUIのサイズ
    Frame.Position = UDim2.new(0.25, 0, 0.15, 0) -- 中央に配置
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Parent = ScreenGui

    -- タイトルラベルを作成
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    TitleLabel.Text = "😈荒らし世界荒らしGOKURAKUへようこそ😈"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = Frame

    -- フレームをドラッグ可能にするための変数
    local dragToggle = false
    local dragStart = nil
    local startPos = nil

    -- ドラッグnasnznns開始sbbanajajajsnsn関数
    local function startDragging(input)
        dragToggle = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end

    -- ドラッグ中jJzjsの関数
    local function onDrag(input)
        if dragToggle then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    -- マウス入力によるドラNAJAッグ
    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            startDragging(input)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            onDrag(input)
        end
    end)

    -- タッチ入
    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            startDragging(input)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            onDrag(input)
        end
    end)

    -- Click TPツールを作成するボタン
    local ClickTPButton = Instance.new("TextButton")
    ClickTPButton.Size = UDim2.new(0.8, 0, 0.1, 0) -- ボタンのサイズ
    ClickTPButton.Position = UDim2.new(0.1, 0, 0.25, 0) -- 位置を設定
    ClickTPButton.Text = "Click TP"
    ClickTPButton.Parent = Frame
    ClickTPButton.MouseButton1Click:Connect(function()
        -- ツールの作成
        local tool = Instance.new("Tool")
        tool.Name = "ClickTP"
        tool.RequiresHandle = false

        -- ツールをbsnレポート
        tool.Activated:Connect(function()
            local player = game.Players.LocalPlayer
            local mouse = player:GetMouse()
            if player.Character then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p)
            end
        end)

        -- ツールをバックパックに追加
        tool.Parent = game.Players.LocalPlayer.Backpack
    end)

    -- チャットにメッセージを表示
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "😈荒らし世界荒らしGOKURAKU V4.5😈";
        Color = Color3.fromRGB(255, 0, 0);
        Font = Enum.Font.SourceSansBold;
        FontSize = Enum.FontSize.Size96;
    })
end

-- GUIを作成する関数を呼び出す
createGUI()
