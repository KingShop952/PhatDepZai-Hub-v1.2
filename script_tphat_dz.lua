-- Delta X Client UI Framework (giả định)

local ui = require("ui")  -- Giả định có module UI trong Delta X Client

-- Tạo logo đen để bật tắt
local logoButton = ui.Button({id = "logoButton", label = "Logo", backgroundColor = "black", textColor = "white"})
local notification = ui.Label({id = "notification", text = "Thông báo: bin béo", visible = false})

-- Mục chính (Main)
local mainPanel = ui.Panel({id = "mainPanel", title = "Main"})
local autoFarmButton = ui.Button({id = "autoFarm", label = "Auto Farm LV"})
local autoBoneButton = ui.Button({id = "autoBone", label = "Auto Bone"})
local autoKataButton = ui.Button({id = "autoKata", label = "Auto Kata"})

-- Mục phụ (Subfarm)
local subPanel = ui.Panel({id = "subPanel", title = "Subfarm"})
local autoGetCDKButton = ui.Button({id = "autoGetCDK", label = "Auto Get CDK"})
local autoFinishYamaButton = ui.Button({id = "autoFinishYama", label = "Auto Finish Yama"})
local autoFinishTushitaButton = ui.Button({id = "autoFinishTushita", label = "Auto Finish Tushita"})
local autoSoulGuitarButton = ui.Button({id = "autoSoulGuitar", label = "Auto SoulGuitar"})
local autoSpawnCakePrinceButton = ui.Button({id = "autoSpawnCakePrince", label = "Auto Spawn Cake Prince"})

-- Cấu hình các chức năng Auto
autoFarmButton:onClick(function()
    ui.alert("Auto Farm LV đang hoạt động...")
    -- Thêm mã code tự động farm LV ở đây
end)

autoBoneButton:onClick(function()
    ui.alert("Auto Bone đang hoạt động...")
    -- Thêm mã code tự động làm bone ở đây
end)

autoKataButton:onClick(function()
    ui.alert("Auto Kata đang hoạt động...")
    -- Thêm mã code tự động kata ở đây
end)

-- Các chức năng Subfarm
autoGetCDKButton:onClick(function()
    ui.alert("Auto Get CDK đang hoạt động...")
    -- Thêm mã code tự động lấy CDK ở đây
end)

autoFinishYamaButton:onClick(function()
    ui.alert("Auto Finish Yama đang hoạt động...")
    -- Thêm mã code tự động finish Yama ở đây
end)

autoFinishTushitaButton:onClick(function()
    ui.alert("Auto Finish Tushita đang hoạt động...")
    -- Thêm mã code tự động finish Tushita ở đây
end)

autoSoulGuitarButton:onClick(function()
    ui.alert("Auto Soul Guitar đang hoạt động...")
    -- Thêm mã code tự động Soul Guitar ở đây
end)

autoSpawnCakePrinceButton:onClick(function()
    ui.alert("Auto Spawn Cake Prince đang hoạt động...")
    -- Thêm mã code tự động Spawn Cake Prince ở đây
end)

-- Bật tắt logo và thông báo bin béo
logoButton:onClick(function()
    if notification.visible then
        notification.visible = false
        ui.alert("Logo tắt")
    else
        notification.visible = true
        ui.alert("Logo bật")
    end
end)

-- Hiển thị UI
ui.show({
    logoButton,
    notification,
    mainPanel,
    subPanel
})
