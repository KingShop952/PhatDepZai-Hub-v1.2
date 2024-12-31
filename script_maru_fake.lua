local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "PhatDepZai Hub - Blox Fruits",
    LoadingTitle = "PhatDepZai Hub Loading...",
    LoadingSubtitle = "Blox Fruits Script",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "PhatDepZaiHub",
        FileName = "Config"
    },
    Discord = {
        Enabled = true,
        Invite = "YOUR_DISCORD_INVITE", -- Thay bằng link Discord của bạn
        RememberJoins = true
    },
    KeySystem = true, -- Bật hệ thống key nếu muốn bảo mật script
    KeySettings = {
        Title = "PhatDepZai Hub Key System",
        Subtitle = "Nhập Key Để Tiếp Tục",
        Note = "Key có thể được tìm thấy tại Discord",
        FileName = "PhatKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"123456"} -- Thay bằng key của bạn
    }
})

local MainTab = Window:CreateTab("Chức Năng Chính", 4483362458) -- Tab chính
