repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Hiển thị thông báo khi chạy script và bật menu
game.StarterGui:SetCore("SendNotification", {
    Title = "PhatDepZai Hub";  -- Tên Hub
    Text = "Bin Béo !";  -- Thông báo
    Duration = 5;  -- Thời gian hiển thị (giây)
})

-- Sử dụng pcall để đảm bảo loadstring hoạt động mà không gây lỗi
local success, message = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KingShop952/PhatDepZai-Hub-v1.2/refs/heads/main/script_tphat_dz.lua"))()
end)

-- Nếu có lỗi xảy ra, thông báo lỗi sẽ được in ra
if not success then
    print("Lỗi khi tải script: " .. message)
end

-- Tải thư viện giao diện UI
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingShop952/PhatDepZai-Hub-v1.2/refs/heads/main/UI-Library.lua"))()

-- Tạo cửa sổ giao diện
local window = library:CreateWindow("PhatDepZai Hub", Color3.fromRGB(0, 0, 0)) -- Tên Hub là "PhatDepZai Hub" với logo màu đen
local mainTab = window:CreateTab("Main") -- Tab chính
local subTab = window:CreateTab("Sub") -- Tab phụ

-- Hiển thị menu ngay lập tức khi chạy script
window.Gui.Enabled = true

-- Các chức năng trong Main
mainTab:CreateButton("Auto Farm LV", function()
    print("Auto Farm LV Started")
    -- Thêm code Auto Farm LV
    while wait(1) do
        print("Đang Auto Farm LV")
    end
end)

mainTab:CreateButton("Auto Bone", function()
    print("Auto Bone Started")
    -- Thêm code Auto Bone
    while wait(1) do
        print("Đang Auto Bone")
    end
end)

mainTab:CreateButton("Auto Kata", function()
    print("Auto Kata Started")
    -- Thêm code Auto Kata
    while wait(1) do
        print("Đang Auto Kata")
    end
end)

-- Các chức năng trong Sub
subTab:CreateButton("Auto Finish Yama Quest", function()
    print("Auto Finish Yama Quest Started")
    -- Thêm code Auto Finish Yama Quest
end)

subTab:CreateButton("Auto Finish Tushita Quest", function()
    print("Auto Finish Tushita Quest Started")
    -- Thêm code Auto Finish Tushita Quest
end)

subTab:CreateButton("Auto Soulguitar", function()
    print("Auto Soulguitar Started")
    -- Thêm code Auto Soulguitar
end)

subTab:CreateButton("Auto Find Đảo Núi Lửa", function()
    print("Auto Find Đảo Núi Lửa Started")
    -- Thêm code Auto Find Đảo Núi Lửa
end)

-- Logo màu đen và phím tắt menu
local UIS = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.RightShift -- Phím để bật/tắt menu
local gui = window.Gui -- Lưu GUI của bạn trong biến này

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == toggleKey then
        gui.Enabled = not gui.Enabled -- Ẩn/hiện giao diện
    end
end)
