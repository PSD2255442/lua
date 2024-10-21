local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local startButton = Instance.new("TextButton")
local stopButton = Instance.new("TextButton")
local waitTimeInput = Instance.new("TextBox")
local isRunning = false
local waitTime = 1  -- デフォルトの待機時間

-- GUIの設定
screenGui.Parent = player.PlayerGui
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Parent = screenGui

-- 待機時間入力ボックスの設定
waitTimeInput.Size = UDim2.new(0, 100, 0, 50)
waitTimeInput.Position = UDim2.new(0.5, -50, 0, 20)
waitTimeInput.PlaceholderText = "待機時間"
waitTimeInput.Parent = mainFrame

-- スタートボタンの設定
startButton.Size = UDim2.new(0, 100, 0, 50)
startButton.Position = UDim2.new(0.5, -50, 0, 80)
startButton.Text = "開始"
startButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
startButton.Parent = mainFrame

-- ストップボタンの設定
stopButton.Size = UDim2.new(0, 100, 0, 50)
stopButton.Position = UDim2.new(0.5, -50, 0, 140)
stopButton.Text = "停止"
stopButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
stopButton.Parent = mainFrame

-- スタートボタンのクリックイベント
startButton.MouseButton1Click:Connect(function()
    if not isRunning then
        isRunning = true
        waitTime = tonumber(waitTimeInput.Text) or 1  -- ユーザー入力から待機時間を取得
        
        while isRunning do
            wait(waitTime)  -- ループ内での待機時間
            local players = game:GetService("Players"):GetPlayers()  -- すべてのプレイヤーを取得
            
            for _, player in pairs(players) do  -- 各プレイヤーに対して処理を実行
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then  -- キャラクターとHumanoidRootPartが存在するかチェック
                    local args = {
                        [1] = workspace.smzms123SpawnedInToys.CreatureBlobman.LeftDetector,
                        [2] = player.Character.HumanoidRootPart,  -- 各プレイヤーのHumanoidRootPartを使用
                        [3] = workspace.smzms123SpawnedInToys.CreatureBlobman.LeftDetector.LeftWeld
                    }
                    
                    workspace.smzms123SpawnedInToys.CreatureBlobman.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(unpack(args))
                end
            end
        end
    end
end)

-- ストップボタンのクリックイベント
stopButton.MouseButton1Click:Connect(function()
    isRunning = false  -- ループを停止
end)