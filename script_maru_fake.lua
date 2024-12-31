-- PhatDepZai Hub Script
-- Giao diện giống Maru Hub, với các chức năng Main và Subfarm
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/FsJak6AT"))() -- Thư viện giao diện

-- Tạo giao diện chính
local Window = Library:CreateWindow("PhatDepZai Hub") -- Tên giao diện
local MainTab = Window:CreateTab("Main") -- Tab chính
local SubTab = Window:CreateTab("Subfarm") -- Tab phụ

-- Chức năng trong Main Tab
MainTab:CreateButton("Auto Farm LV", function()
    print("Đang kích hoạt Auto Farm LV...")
    -- Thêm logic Auto Farm LV tại đây
end)

MainTab:CreateButton("Auto Bone", function()
    print("Đang kích hoạt Auto Bone...")
    -- Thêm logic Auto Bone tại đây
end)

MainTab:CreateButton("Auto Kata", function()
    print("Đang kích hoạt Auto Kata...")
    -- Thêm logic Auto Kata tại đây
end)

-- Chức năng trong Subfarm Tab
SubTab:CreateButton("Auto Get CDK", function()
    print("Đang kích hoạt Auto Get CDK...")
    -- Thêm logic Auto Get CDK tại đây
end)

SubTab:CreateButton("Auto Finish Yama", function()
    print("Đang kích hoạt Auto Finish Yama...")
    -- Thêm logic Auto Finish Yama tại đây
end)

SubTab:CreateButton("Auto Finish Tushita", function()
    print("Đang kích hoạt Auto Finish Tushita...")
    -- Thêm logic Auto Finish Tushita tại đây
end)

SubTab:CreateButton("Auto Soul Guitar", function()
    print("Đang kích hoạt Auto Soul Guitar...")
    -- Thêm logic Auto Soul Guitar tại đây
end)

SubTab:CreateButton("Auto Spawn Cake Prince", function()
    print("Đang kích hoạt Auto Spawn Cake Prince...")
    -- Thêm logic Auto Spawn Cake Prince tại đây
end)

-- Thêm logo bật tắt giao diện
Library:SetWatermark("PhatDepZai Hub") -- Hiển thị watermark
Library:Notify("Bin béo", "Giao diện đã sẵn sàng!") -- Thông báo
