util.AddNetworkString("Update money HUD")

local playerMoney = {}

local function PlayerKilled(victim, attacker)
    if attacker:IsPlayer() and victim:IsPlayer() and attacker ~= victim then
        if not playerMoney[attacker] then
            playerMoney[attacker] = 0
        end
        playerMoney[attacker] = playerMoney[attacker] + 3000
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[attacker])
        net.Send(attacker)
--        attacker:ChatPrint("Ваши деньги: " .. playerMoney[attacker])
    end
end
hook.Add("PlayerDeath", "IncreasePlayerMoney", PlayerKilled)

local function PlayerDie(victim, attacker)
    if attacker:IsPlayer() and victim:IsPlayer() then
        if not playerMoney[victim] then
            playerMoney[victim] = 0
        end
        playerMoney[victim] = playerMoney[victim] + 1000
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[victim])
        net.Send(victim)
--        victim:ChatPrint("Ваши деньги: " .. playerMoney[victim])
    end
end
hook.Add("PlayerDeath", "IncreasePlayerMoneey", PlayerDie)


local function PlayerSpawn(ply)
    playerMoney[ply] = 800
    --ply:ChatPrint("Ваши деньги: " .. playerMoney[ply])
end

hook.Add("PlayerInitialSpawn", "SetPlayerMoney", PlayerSpawn)


util.AddNetworkString("ShopButton")

net.Receive("ShopButton", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.Items[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 1 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton2")

net.Receive("ShopButton2", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.ItemsCT[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 1 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton3")

net.Receive("ShopButton3", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.Items2[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 2 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton4")

net.Receive("ShopButton4", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.Items3[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 2 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton5")

net.Receive("ShopButton5", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.ItemsCT3[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 2 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton6")

net.Receive("ShopButton6", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.Items4[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 2 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton7")

net.Receive("ShopButton7", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.ItemsCT4[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        for _, weapon in ipairs(ply:GetWeapons()) do
            local slot = weapon:GetSlot()
            if slot == 2 then
                ply:DropWeapon(weapon)
                break
            end
        end
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

util.AddNetworkString("ShopButton8")

net.Receive("ShopButton8", function(len, ply)
    local id = net.ReadInt(32)
    local item = Shop.Items5[id]
    if not item then return end
   --draw.GetFontHeight( string font )("Попытка купить " .. item.name .. " за " .. item.price .. " долларов")
    if playerMoney[ply] and playerMoney[ply] >= item.price then
        ply:Give(item.classname)
        playerMoney[ply] = playerMoney[ply] - item.price
       --draw.GetFontHeight( string font )("Успешная покупка! Остаток денег: " .. playerMoney[ply])
        net.Start("Update money HUD")
        net.WriteFloat(playerMoney[ply])
        net.Send(ply)
    else
        ply:ChatPrint("You're too poor for this")
    end
end)

hook.Add("PlayerButtonDown", "OpenMenuOnBPress", function(ply, button)
    if button == KEY_B then
        ply:ConCommand("cs_shopopen")
    end
end)

hook.Add("PlayerButtonDown", "OpenMenuOnGPress", function(ply, button)
    if button == KEY_G then
        ply:DropWeapon(plyWeapon)
    end
end)

local ENT = FindMetaTable( "Entity" )

function ENT:SetMoney(ply)
	playerMoney[ply] = math.max(playerMoney[ply] - 500,0)
	net.Start("Update money HUD")
	net.WriteFloat(playerMoney[ply])
	net.Send(ply)
end