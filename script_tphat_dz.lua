repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Hiển thị thông báo chờ 10 giây
if not _G.NotificationShown then
    game.StarterGui:SetCore("SendNotification", {
        Title = "PhatDepZai Hub";  -- Tên Hub
        Text = "Waiting 10 seconds, Bin Béo!";  -- Thông báo
        Duration = 5;  -- Thời gian hiển thị (giây)
    })
    _G.NotificationShown = true  -- Đánh dấu rằng thông báo đã được hiển thị
end

-- Tạm dừng 10 giây trước khi tiếp tục
wait(10)

-- Hiển thị thông báo Bin Béo sau khi chờ 10 giây
game.StarterGui:SetCore("SendNotification", {
    Title = "PhatDepZai Hub";  -- Tên Hub
    Text = "Bin Béo !";  -- Thông báo
    Duration = 5;  -- Thời gian hiển thị (giây)
})

-- Kiểm tra URL và tải script từ GitHub
local url = "https://raw.githubusercontent.com/KingShop952/PhatDepZai-Hub-v1.2/refs/heads/main/script_tphat_dz.lua"
local success, result = pcall(function()
    return game:HttpGet(url)
end)

-- Nếu URL không tải được hoặc có lỗi, hiển thị lỗi
if not success then
    print("Lỗi khi tải script từ GitHub: " .. result)
    return
end

-- Nếu tải script thành công, chạy nó
loadstring(result)()

-- Tải thư viện giao diện UI từ GitHub
local uiLibraryUrl = "https://raw.githubusercontent.com/KingShop952/PhatDepZai-Hub-v1.2/refs/heads/main/UI-Library.lua"
local uiSuccess, uiResult = pcall(function()
    return game:HttpGet(uiLibraryUrl)
end)

-- Nếu không tải được thư viện UI, thông báo lỗi
if not uiSuccess then
    print("Lỗi khi tải thư viện UI: " .. uiResult)
    return
end

-- Nếu thư viện UI tải thành công, chạy nó
loadstring(uiResult)()

-- Tạo cửa sổ giao diện
local window = library:CreateWindow("PhatDepZai Hub", Color3.fromRGB(0, 0, 0)) -- Tên Hub là "PhatDepZai Hub" với logo màu đen
local mainTab = window:CreateTab("Main") -- Tab chính

-- Hiển thị menu ngay lập tức khi chạy script
window.Gui.Enabled = true

-- Các chức năng trong Main
mainTab:CreateLabel("Status: Đang cày") -- Hiển thị status
mainTab:CreateLabel("Chức năng: Auto Rejoin") -- Hiển thị chức năng

mainTab:CreateButton("Auto Rejoin", function()
    print("Auto Rejoin Started")
    -- Thêm code Auto Rejoin
    while wait(10) do
        -- Code để auto rejoin
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) -- Ví dụ sử dụng teleport để tham gia lại
    end
end)

mainTab:CreateButton("Auto Farm Max Level (2550)", function()
    print("Auto Farm Max Level Started")
    -- Cài đặt Auto Farm Max Level
    local levelMax = 2550 -- Level tối đa là 2550
    local currentLevel = game.Players.LocalPlayer.Data.Level.Value
    local godHuman = game.Players.LocalPlayer.Data:FindFirstChild("GodHuman") -- Kiểm tra xem người chơi đã có God Human chưa

    if godHuman then
        print("Bạn đã có God Human, không cần farm nữa!")
        return -- Nếu đã có God Human, dừng lại và không làm gì nữa
    end

    while wait(1) do
        currentLevel = game.Players.LocalPlayer.Data.Level.Value

        -- Kiểm tra nếu đã đạt level tối đa
        if currentLevel >= levelMax then
            print("Đã đạt level tối đa: " .. levelMax)
            break
        end

        print("Đang farm để đạt level tối đa: " .. currentLevel)
        -- Thêm mã farm cho level, ví dụ: sử dụng các kỹ năng, farm boss, hoặc thu thập XP.
        -- farmXP() -- Bạn cần thêm mã farm XP hoặc boss tùy vào yêu cầu game
    end
end)

mainTab:CreateButton("Get God Human", function()
    print("Getting God Human...")
    -- Cài đặt code để lấy God Human
    local godHuman = game.Players.LocalPlayer.Data:FindFirstChild("GodHuman")
    
    if godHuman then
        print("Bạn đã có God Human!")
    else
        -- Tiến hành thực hiện các hành động để lấy God Human
        print("Đang lấy God Human...")
        -- Code để đạt God Human, ví dụ: Hoàn thành quest, farm điểm, hoặc trang bị
        -- giả sử script sử dụng hàm "farmGodHuman()"
        -- farmGodHuman()  
    end
end)

-- Logo màu đen và phím tắt menu
local UIS = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.RightShift -- Phím để bật/tắt menu
local gui = window.Gui -- Lưu GUI của bạn trong biến này

-- Thêm logo ở bên trái và bật/tắt menu
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 50, 0, 50)
logo.Position = UDim2.new(0, 0, 0, 50)
logo.Image = "https://i.imgur.com/MWmltGP.jpeg"  -- Thay đổi URL logo ở đây
logo.Parent = game.CoreGui

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == toggleKey then
        gui.Enabled = not gui.Enabled -- Ẩn/hiện giao diện
        logo.Visible = gui.Enabled -- Ẩn/hiện logo khi menu bật/tắt
    end
end)
