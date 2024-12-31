-- Giả sử có thư viện UI tương tự như Delta X hoặc W Azure Hub

local ui = require("ui")  -- Giả định có thư viện UI trong môi trường này

-- Tạo các yếu tố UI
local logoButton = ui.Button({id = "logoButton", label = "Logo", backgroundColor = "black", textColor = "white"})
local notificationLabel = ui.Label({id = "notification", text = "Thông báo: bin béo", visible = false})

-- Các bảng chính và phụ
local mainPanel = ui.Panel({id = "mainPanel", title = "Main"})
local subPanel = ui.Panel({id = "subPanel", title = "Subfarm"})

-- Các nút trong mục chính
local autoFarmButton = ui.Button({id = "autoFarm", label = "Auto Farm LV"})
local autoBoneButton = ui.Button({id = "autoBone", label = "Auto Bone"})
local autoKataButton = ui.Button({id = "autoKata", label = "Auto Kata"})

-- Các nút trong mục phụ
local autoGetCDKButton = ui.Button({id = "autoGetCDK", label = "Auto Get CDK"})
local autoFinishYamaButton = ui.Button({id = "autoFinishYama", label = "Auto Finish Yama"})
local autoFinishTushitaButton = ui.Button({id = "autoFinishTushita", label = "Auto Finish Tushita"})
local autoSoulGuitarButton = ui.Button({id = "autoSoulGuitar", label = "Auto Soul Guitar"})
local autoSpawnCakePrinceButton = ui.Button({id = "autoSpawnCakePrince", label = "Auto Spawn Cake Prince"})

-- Các chức năng tự động trong Main
autoFarmButton:onClick(function()
    ui.alert("Auto Farm LV đang hoạt động...")
    -- Code tự động farm LV
end)

autoBoneButton:onClick(function()
    ui.alert("Auto Bone đang hoạt động...")
    -- Code tự động làm bone
end)

autoKataButton:onClick(function()
    ui.alert("Auto Kata đang hoạt động...")
    -- Code tự động kata
end)

-- Các chức năng Subfarm
autoGetCDKButton:onClick(function()
    ui.alert("Auto Get CDK đang hoạt động...")
    -- Code tự động lấy CDK
end)

autoFinishYamaButton:onClick(function()
    ui.alert("Auto Finish Yama đang hoạt động...")
    -- Code tự động finish Yama
end)

autoFinishTushitaButton:onClick(function()
    ui.alert("Auto Finish Tushita đang hoạt động...")
    -- Code tự động finish Tushita
end)

autoSoulGuitarButton:onClick(function()
    ui.alert("Auto Soul Guitar đang hoạt động...")
    -- Code tự động Soul Guitar
end)

autoSpawnCakePrinceButton:onClick(function()
    ui.alert("Auto Spawn Cake Prince đang hoạt động...")
    -- Code tự động Spawn Cake Prince
end)

-- Bật/tắt logo và thông báo bin béo
logoButton:onClick(function()
    if notificationLabel.visible then
        notificationLabel.visible = false
        ui.alert("Logo đã tắt.")
    else
        notificationLabel.visible = true
        ui.alert("Logo đã bật.")
    end
end)

-- Hiển thị UI
ui.show({
    logoButton,
    notificationLabel,
    mainPanel,
    subPanel
})

-- Thêm các nút vào các bảng tương ứng
mainPanel:add(autoFarmButton)
mainPanel:add(autoBoneButton)
mainPanel:add(autoKataButton)

subPanel:add(autoGetCDKButton)
subPanel:add(autoFinishYamaButton)
subPanel:add(autoFinishTushitaButton)
subPanel:add(autoSoulGuitarButton)
subPanel:add(autoSpawnCakePrinceButton)

-- Hiển thị UI hoàn chỉnh
ui.show({
    logoButton,
    notificationLabel,
    mainPanel,
    subPanel
})

