local RimusLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Duc18-code/scriptducv3/refs/heads/main/UInew.lua"))()
local Notify = RimusLib:MakeNotify({
    Title = "Notification",
    Content = "Anh Phát Bỏ Con",
    Image = "rbxassetid://100756646036568",
    Time = 1,
    Delay = 5
})

local RimusHub = RimusLib:MakeGui({
    NameHub = "PhatDepZai Hub",
    NameGam = "     [Chat]",
    Icon = "rbxassetid://100756646036568"
})

local Tab1 = RimusHub:CreateTab({
    Name = "Tab Chat",
    Icon = "rbxassetid://100756646036568"
})

-- Mục Spam Chat Đã Được Tao Bố Trí Thêm
local spamText = "" -- Lưu trữ câu chat ở đây
local isSpamming = false -- Biến kiểm tra xem có đang spam không 
local delayTime = 0 -- Mặc định là 0, tức là không có thời gian chờ (spam liên tục)

-- Khung nhập văn bản
local Input = Tab1:AddInput({
    Title = "Nhập câu chat",
    Icon = "rbxassetid://100756646036568",
    Callback = function(Value)
        spamText = Value -- Lưu trữ câu chat khi người dùng nhập
        print("Câu chat đã nhập: " .. spamText)
    end
})

-- Mục lựa chọn để chỉnh thời gian chờ chúng mày có thể thêm vào
local Dropdown = Tab1:AddDropdown({
    Title = "Chọn thời gian chờ",
    Multi = false,
    Options = {"1 phút", "5 phút", "Spam liên tục"},
    Default = "Spam liên tục", -- Mặc định là không có thời gian chờ
    Callback = function(Value)
        if Value == "1 phút" then
            delayTime = 60 -- 1 phút = 60 giây
        elseif Value == "5 phút" then
            delayTime = 300 -- 5 phút = 300 giây
        else
            delayTime = 0 -- Spam liên tục ( mặc định khi mày không chọn gì )
        end
        print("Thời gian chờ được thiết lập: " .. (delayTime == 0 and "Spam liên tục" or delayTime .. " giây"))
    end
})

-- Đây Là Nút Start để bắt đầu spam
local Button = Tab1:AddButton({
    Title = "Start Spam Chat",
    Content = "Bắt đầu spam",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        if spamText ~= "" then
            isSpamming = true
            print("Bắt đầu spam: " .. spamText)
            
            -- Sử dụng coroutine để tạo vòng lặp không chặn luồng chính
            coroutine.wrap(function()
                while isSpamming do
                    -- Gửi câu chat
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(spamText, "All")
                    
                    if delayTime > 0 then
                        wait(delayTime) -- Sử dụng thời gian chờ đã thiết lập
                    else
                        wait(0) -- Spam liên tục (không chờ)
                    end
                end
            end)()
        else
            Notify.Content = "Vui lòng nhập câu chat"
            Notify.Time = 2
            Notify.Delay = 5
            Notify:Send()
        end
    end
})

-- Nút Stop để dừng spam
local StopButton = Tab1:AddButton({
    Title = "Stop Spam Chat",
    Content = "Dừng spam",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        isSpamming = false
        print("Đã dừng spam")
    end
})

-- Đây là tab FPS đã được tao tối ưu mượt mà 
local TabFPS = RimusHub:CreateTab({
    Name = "Tab Giảm Lag",
    Icon = "rbxassetid://100756646036568"
})

-- Mục Giảm FPS nek
local ReduceFPSButton = TabFPS:AddButton({
    Title = "Giảm FPS",
    Content = "Tối ưu hóa FPS bằng cách xóa hoạt ảnh và làm mờ màu",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        -- Xóa hoạt ảnh và làm mờ màu trong game hạn chế bị kick
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic -- Chuyển tất cả vật liệu thành SmoothPlastic
                v.Color = Color3.new(0.5, 0.5, 0.5) -- Làm mờ màu bằng cách đổi tất cả màu về xám
                v.CastShadow = false -- Tắt bóng đổ
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v:Destroy() -- Xóa các hoạt ảnh như Particle, Trail, Beam
            end
        end
        -- Tắt hiệu ứng ánh sáng không cần thiết
        if game.Lighting:FindFirstChild("ColorCorrection") then
            game.Lighting.ColorCorrection:Destroy()
        end
        if game.Lighting:FindFirstChild("Bloom") then
            game.Lighting.Bloom:Destroy()
        end
        print("FPS đã được tối ưu")
    end
})

-- Mục Server Hop để tìm server có ít người chơi hơn ( premium )
local ServerHopButton = TabFPS:AddButton({
    Title = "Server Hop",
    Content = "Chuyển sang server khác có ít người chơi và FPS ổn định",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        -- Hàm để tìm và tham gia server có ít người chơi hơn
        local HttpService = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local currentPlaceId = game.PlaceId
        local serversAPI = "https://games.roblox.com/v1/games/"..currentPlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        
        -- Lấy danh sách server
        local function GetServerList()
            local response = HttpService:JSONDecode(game:HttpGet(serversAPI))
            return response.data
        end

        -- Tìm server có ít người
        local function HopToServer()
            local serverList = GetServerList()
            for _, server in ipairs(serverList) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    -- Tham gia server
                    TPS:TeleportToPlaceInstance(currentPlaceId, server.id, game.Players.LocalPlayer)
                    return
                end
            end
            print("Không tìm thấy server phù hợp.")
        end

        -- Gọi hàm Server Hop
        HopToServer()
    end
})

-- Mục Vô Lại Server ( rejoin server )
local ReturnToCurrentServerButton = TabFPS:AddButton({
    Title = "Vô Lại Server",
    Content = "Quay lại server hiện tại",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        -- Sử dụng TeleportService để vào lại chính server hiện tại
        local TPS = game:GetService("TeleportService")
        local currentPlaceId = game.PlaceId
        local currentServerId = game.JobId
        
        -- Tham gia lại server hiện tại
        TPS:TeleportToPlaceInstance(currentPlaceId, currentServerId, game.Players.LocalPlayer)
        print("Đang quay lại server hiện tại...")
    end
})
  
-- Đây là tab Farming đã được thêm vào
local TabFarming = RimusHub:CreateTab({
    Name = "Tab Farming",
    Icon = "rbxassetid://100756646036568"
})

-- Mục Auto Bone
local AutoBoneButton = TabFarming:AddButton({
    Title = "Auto Bone",
    Content = "Tự động thu thập Bone",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        print("Bắt đầu Auto Bone")
        -- Đoạn script thu thập Bone
        coroutine.wrap(function()
            while true do
                wait(1) -- Điều chỉnh thời gian lặp tùy theo yêu cầu
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Bone" and v:IsA("BasePart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(0.5)
                    end
                end
            end
        end)()
    end
})

-- Mục Auto Get Cdk
local AutoCdkButton = TabFarming:AddButton({
    Title = "Auto Get Cdk",
    Content = "Tự động lấy Cdk",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        print("Bắt đầu Auto Get Cdk")
        -- Đoạn script lấy Cdk
        coroutine.wrap(function()
            while true do
                wait(1) -- Thời gian lặp tùy chỉnh
                game.ReplicatedStorage.GetCdkEvent:FireServer() -- Thay sự kiện này bằng sự kiện thật
            end
        end)()
    end
})

-- Mục Auto Sgt
local AutoSgtButton = TabFarming:AddButton({
    Title = "Auto Sgt",
    Content = "Tự động thu thập Sgt",
    Icon = "rbxassetid://100756646036568",
    Callback = function()
        print("Bắt đầu Auto Sgt")
        -- Đoạn script thu thập Sgt
        coroutine.wrap(function()
            while true do
                wait(1) -- Thời gian lặp tùy chỉnh
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Sgt" and v:IsA("BasePart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(0.5)
                    end
                end
            end
        end)()
    end
})

-- Thêm Tab Farm Level
local TabFarm = RimusHub:CreateTab({
    Name = "Tab Farm Level",
    Icon = "rbxassetid://100756646036568"
})

local isFarming = false -- Biến kiểm tra trạng thái farm

-- Danh sách các bãi quái với cấp độ tương ứng
local farmingAreas = {
    {level = 1, name = "Bandit", position = Vector3.new(1059, 16, 1532)},    -- Bandit
    {level = 15, name = "Monkey", position = Vector3.new(-1335, 6, 2323)},  -- Monkey
    {level = 30, name = "Gorilla", position = Vector3.new(-1167, 6, 2146)}, -- Gorilla
    {level = 50, name = "Pirate", position = Vector3.new(-1159, 43, 3829)}, -- Pirate
    {level = 120, name = "Marine", position = Vector3.new(-4864, 6, 4285)}, -- Marine
    {level = 220, name = "Yeti", position = Vector3.new(1407, 112, -1224)}, -- Yeti
    {level = 300, name = "Sky Bandit", position = Vector3.new(-4958, 369, -2791)}, -- Sky Bandit
    {level = 625, name = "Fishman", position = Vector3.new(6113, 6, -1642)}, -- Fishman
    {level = 700, name = "Raider", position = Vector3.new(-5382, 6, 8416)}, -- Raider
    {level = 850, name = "Mercenary", position = Vector3.new(-5405, 6, 9046)}, -- Mercenary
    {level = 1250, name = "Ship Deckhand", position = Vector3.new(1218, 125, 4357)}, -- Ship Deckhand
    {level = 1500, name = "Ship Officer", position = Vector3.new(1218, 125, 4857)}, -- Ship Officer
    {level = 1750, name = "Zombie", position = Vector3.new(-5453, 5, -7717)}, -- Zombie
    {level = 2000, name = "Cyborg", position = Vector3.new(3840, 47, -6075)}, -- Cyborg
    {level = 2500, name = "Sea Beast", position = Vector3.new(-5023, 4, 5902)} -- Sea Beast
}

local function teleportTo(position)
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    wait(1) -- Đợi 1 giây sau khi dịch chuyển
end

local function findClosestEnemy()
    local player = game.Players.LocalPlayer
    local closestEnemy
    local shortestDistance = math.huge

    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local distance = (enemy.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestEnemy = enemy
                shortestDistance = distance
            end
        end
    end

    return closestEnemy
end

local function attackEnemy(enemy)
    if enemy and enemy:FindFirstChild("Humanoid") then
        game.ReplicatedStorage.Events.Combat:FireServer("Attack", enemy)
        print("Đang tấn công quái vật: " .. enemy.Name)
    end
end

local function getCurrentArea(level)
    for i = #farmingAreas, 1, -1 do
        if level >= farmingAreas[i].level then
            return farmingAreas[i]
        end
    end
    return farmingAreas[1]
end

local ToggleFarm = TabFarm:AddToggle({
    Title = "Bật/Tắt Farm Level",
    Default = false, -- Mặc định là tắt
    Callback = function(Value)
        isFarming = Value
        print("Farm Level: " .. (isFarming and "Bật" or "Tắt"))

        if isFarming then
            coroutine.wrap(function()
                while isFarming do
                    local player = game.Players.LocalPlayer
                    local level = player:FindFirstChild("Level") -- Thay "Level" thành đúng thuộc tính cấp độ trong game
                    
                    if level then
                        local currentLevel = level.Value
                        local currentArea = getCurrentArea(currentLevel)

                        -- Di chuyển đến khu vực phù hợp
                        if (player.Character.HumanoidRootPart.Position - currentArea.position).Magnitude > 10 then
                            print("Di chuyển đến: " .. currentArea.name)
                            teleportTo(currentArea.position)
                        end

                        -- Tìm và tấn công quái vật
                        local enemy = findClosestEnemy()
                        if enemy then
                            attackEnemy(enemy)
                        else
                            print("Không tìm thấy quái vật để farm.")
                        end
                    else
                        print("Không tìm thấy thông tin level của bạn.")
                        break
                    end

                    wait(1) -- Chờ 1 giây giữa các vòng lặp
                end
            end)()
        end
    end
})
