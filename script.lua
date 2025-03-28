local targetPlaceId = 87039211657390 -- Place ID ที่ต้องการ
 
local args1 = {
    [1] = {
        [1] = {
            ["Type"] = "Gems",
            ["Event"] = "DungeonAction",
            ["Action"] = "BuyTicket"
        },
        [2] = "\n"
    }
}

local args2 = {
    [1] = {
        [1] = {
            ["Type"] = "Gems",
            ["Event"] = "DungeonAction",
            ["Action"] = "BuyTicket"
        },
        [2] = "\t"
    }
}

local function tryBuyTicket(args)
    local success = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    end)
    return success
end
 
-- เช็คว่าอยู่ใน Place ID ที่กำหนดหรือไม่
if game.PlaceId == targetPlaceId then
    -- รอให้เกมโหลดเสร็จ
    game.Loaded:Wait()
    print("เกมโหลดเสร็จแล้ว!")  

    -- รอ 3 วินาที ก่อนทำการซื้อบัตร
    wait(3)
 
    if _G.AutoBuy then
        if tryBuyTicket(args1) then
            print("ซื้อบัตรลงดัน (ชุดที่ 1) สำเร็จ!")
        end
        if tryBuyTicket(args2) then
            print("ซื้อบัตรลงดัน (ชุดที่ 2) สำเร็จ!")
        end
    else
        print("AutoBuy ปิดอยู่ ปิดใช้งานสคริปต์.")
    end
else
    print("ไม่อยู่ในแมพที่ต้องการ... ไม่ทำการซื้อบัตร.")
end
