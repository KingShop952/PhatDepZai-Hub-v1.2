repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Hiển thị thông báo khi chạy script
game.StarterGui:SetCore("SendNotification", {
    Title = "PhatDepZai Hub";
    Text = "Bin Béo !";
    Duration = 5; -- Thời gian hiển thị (giây)
})

-- Tải thư viện giao diện (giả sử bạn đã upload thư viện UI của mình lên GitHub)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/yourrepo/main/UI-Library.lua"))()

-- Tạo giao diện Hub
local window = library:CreateWindow("PhatDepZai Hub", Color3.fromRGB(0, 0, 0)) -- Logo màu đen
local mainTab = window:CreateTab("Main") -- Tab chính
local subTab = window:CreateTab("Sub") -- Tab phụ

-- Biến kiểm soát vòng lặp
local isFarming = false

-- Các chức năng trong Main
mainTab:CreateButton("Auto Farm LV", function()
    isFarming = true
    print("Auto Farm LV Started")
    while isFarming and wait(1) do
        -- Thực hiện Auto Farm LV
        print("Đang Auto Farm LV")
    end
end)

mainTab:CreateButton("Dừng Auto Farm LV", function()
    isFarming = false
    print("Đã Dừng Auto Farm LV")
end)

mainTab:CreateButton("Auto Bone", function()
    print("Auto Bone Started")
    -- Thêm code Auto Bone
end)

mainTab:CreateButton("Auto Kata", function()
    print("Auto Kata Started")
    -- Thêm code Auto Kata
end)

-- Các chức năng trong Sub
subTab:CreateButton("Auto Finish Yama Quest", function()
    print("Auto Finish Yama Quest Started")
    -- Thêm code hoàn thành Yama quest
end)

subTab:CreateButton("Auto Finish Tushita Quest", function()
    print("Auto Finish Tushita Quest Started")
    -- Thêm code hoàn thành Tushita quest
end)

subTab:CreateButton("Auto Soulguitar", function()
    print("Auto Soulguitar Started")
    -- Thêm code Auto Soulguitar
end)

subTab:CreateButton("Auto Find Đảo Núi Lửa", function()
    print("Auto Find Đảo Núi Lửa Started")
    -- Thêm code Auto Find Đảo Núi Lửa
end)

-- Thêm logo màu đen để bật/tắt menu
local UIS = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.RightShift -- Phím để bật/tắt menu
local gui = window.Gui -- Giả sử GUI của bạn được lưu trong biến này

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == toggleKey then
        gui.Enabled = not gui.Enabled -- Ẩn/hiện giao diện
    end
end)
