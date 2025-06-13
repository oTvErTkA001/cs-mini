include("shared.lua")
if SERVER then
    include("sv_shop.lua")
end
if CLIENT then
---------------------------------------------
local money = 800

net.Receive( "Update money HUD", function( len, ply )
    money = net.ReadFloat()
end )

surface.CreateFont( "MoneyFont", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 26,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

hook.Add( "HUDPaint", "HUDPaint_DrawMoney", function()
	draw.RoundedBox( 4, 50, 50, 130, 40, Color( 0, 0, 0, 75 ) )
	draw.SimpleText( money.."$", "MoneyFont", 50, 57, Color( 255, 255, 0, 255 ))
end )

-- hook.Add( "HUDPaint", "HUDPaint_DrawMoney", function()
-- 	draw.RoundedBox( 4, 50, 650, 130, 40, Color( 0, 0, 0, 75 ) )
-- 	draw.SimpleText( money.."$", "MoneyFont", 50, 657, Color( 255, 255, 0, 255 ))
-- end )

---------------------------------------------
surface.CreateFont("TheDefaultSettings", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 15,
	weight = 500,
})

--главная менюшка
function OpenShop()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local Shop = vgui.Create("DFrame");
	Shop:Center();
	Shop:SetVisible(true);
	Shop:MakePopup();
	Shop.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapon Shop", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", Shop, weapon1)
	scroll:Dock(FILL)

	local isAnimating = true
	Shop:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimating = false
	end)


	local Button = Shop:Add("DButton", Shop, weapon1);
	Button:SetText("");
	Button:Dock(TOP);
	Button:SetWide(100);
	Button:SetSize(150, 30)
    Button.Paint = function (me, w, h)
        draw.SimpleText("Pistols", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
	Button.DoClick = function()
		Shop:Close()
		local team = LocalPlayer():Team()

		if team == TEAM_T then
			OpenT()
		elseif team == TEAM_CT then
			Open2CT()
		end
	end

	local Button2 = Shop:Add("DButton", Shop, weapon1);
    Button2:SetText("");
	Button2:Dock(TOP);
	Button2:SetWide(100);
	Button2:SetSize(150, 30)
    Button2.Paint = function (me, w, h)
        draw.SimpleText("Heavy", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
	Button2.DoClick = function()
		Shop:Close()
			Open3T()
	end

	Shop.Think = function(me)
		if isAnimating then
			me:Center()
		end
	end
	local Button3 = Shop:Add("DButton", Shop, weapon1);
    Button3:SetText("");
	Button3:Dock(TOP);
	Button3:SetWide(100);
	Button3:SetSize(150, 30)
    Button3.Paint = function (me, w, h)
        draw.SimpleText("Submachine Guns", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
	Button3.DoClick = function()
		Shop:Close()
		local team = LocalPlayer():Team()

		if team == TEAM_T then
			OpenT4()
		elseif team == TEAM_CT then
			Open5CT()
		end
	end
	local Button4 = Shop:Add("DButton", Shop, weapon1);
    Button4:SetText("");
	Button4:Dock(TOP);
	Button4:SetWide(100);
	Button4:SetSize(150, 30)
    Button4.Paint = function (me, w, h)
        draw.SimpleText("Rifles", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
	Button4.DoClick = function()
		Shop:Close()
		local team = LocalPlayer():Team()

		if team == TEAM_T then
			Open6T()
		elseif team == TEAM_CT then
			Open7CT()
		end
	end
	local Button5 = Shop:Add("DButton", Shop, weapon1);
    Button5:SetText("");
	Button5:Dock(TOP);
	Button5:SetWide(100);
	Button5:SetSize(150, 30)
    Button5.Paint = function (me, w, h)
        draw.SimpleText("Equipment", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
	Button5.DoClick = function()
		Shop:Close()
		Open8()
	end

	Shop.Think = function(me)
		if isAnimating then
			me:Center()
		end
	end
end


concommand.Add("cs_shopopen", function ()
	OpenShop()
end)


-- Менюшки внутри первой бля

function OpenT()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon1 = vgui.Create("DFrame");
	weapon1:Center();
	weapon1:SetVisible(true);
	weapon1:MakePopup();
	weapon1.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Pistols", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon1)
	scroll:Dock(FILL)


	local yspace = weapon1:GetTall() * .05
	for _, item in ipairs(Shop.Items) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon1:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * .4, h * .40, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon1:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.Items) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 35 + spacing
	end

	local isAnimat = true
	weapon1:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon1.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

function Open2CT()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon2 = vgui.Create("DFrame");
	weapon2:Center();
	weapon2:SetVisible(true);
	weapon2:MakePopup();
	weapon2.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Pistols", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon2)
	scroll:Dock(FILL)


	local yspace = weapon2:GetTall() * .05
	for _, item in ipairs(Shop.ItemsCT) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon2:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * .4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton2")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon2:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.ItemsCT) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 35 + spacing
	end

	local isAnimat = true
	weapon2:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon2.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

--ТЕРРОР ДРОБОВИКИ

function Open3T()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon3 = vgui.Create("DFrame");
	weapon3:Center();
	weapon3:SetVisible(true);
	weapon3:MakePopup();
	weapon3.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Heavy", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon3)
	scroll:Dock(FILL)


	local yspace = weapon3:GetTall() * .05
	for _, item in ipairs(Shop.Items2) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon3:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton3")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon3:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.Items2) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon3:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon3.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

--ПИСТОЛЕТЫПУЛЯМБОЩШЦОУА

function OpenT4()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon1 = vgui.Create("DFrame");
	weapon1:Center();
	weapon1:SetVisible(true);
	weapon1:MakePopup();
	weapon1.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Submachine Guns", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon1)
	scroll:Dock(FILL)


	local yspace = weapon1:GetTall() * .05
	for _, item in ipairs(Shop.Items3) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon1:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button4 = vgui.Create("DButton", itemPanel);
    	Button4:SetText("");
		Button4:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button4.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button4.DoClick = function()
			net.Start("ShopButton4")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon1:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.Items3) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon1:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon1.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

function Open5CT()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon2 = vgui.Create("DFrame");
	weapon2:Center();
	weapon2:SetVisible(true);
	weapon2:MakePopup();
	weapon2.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Submachine Guns", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon2)
	scroll:Dock(FILL)


	local yspace = weapon2:GetTall() * .05
	for _, item in ipairs(Shop.ItemsCT3) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon2:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton5")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon2:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.ItemsCT3) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon2:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon2.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

function Open6T()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon2 = vgui.Create("DFrame");
	weapon2:Center();
	weapon2:SetVisible(true);
	weapon2:MakePopup();
	weapon2.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Rifles", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon2)
	scroll:Dock(FILL)


	local yspace = weapon2:GetTall() * .05
	for _, item in ipairs(Shop.Items4) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon2:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton6")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon2:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.Items4) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon2:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon2.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

function Open7CT()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon2 = vgui.Create("DFrame");
	weapon2:Center();
	weapon2:SetVisible(true);
	weapon2:MakePopup();
	weapon2.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Weapons: Rifles", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon2)
	scroll:Dock(FILL)


	local yspace = weapon2:GetTall() * .05
	for _, item in ipairs(Shop.ItemsCT4) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon2:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.5, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton7")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon2:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.ItemsCT4) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon2:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon2.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

function Open8()
	local frameW, frameH, animTime, animDelay, animEase = ScrW() * .5, ScrH() * .5, 1.8, 0, .1
	local weapon2 = vgui.Create("DFrame");
	weapon2:Center();
	weapon2:SetVisible(true);
	weapon2:MakePopup();
	weapon2.Paint = function (me,w,h)
		surface.SetDrawColor(0, 0, 0, 170)
		surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(255, 165, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText("Equipment", "TheDefaultSettings", w / 2, h * .03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", weapon2)
	scroll:Dock(FILL)


	local yspace = weapon2:GetTall() * .05
	for _, item in ipairs(Shop.Items5) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall( weapon2:GetTall() * 1.5 )
		itemPanel.Paint = function(me, w, h)
		    surface.SetDrawColor(0, 0, 0, 170)
		    surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255, 165, 0, 255)
            surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(item.name, "TheDefaultSettings", w * .2, h * .37, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(item.description, "TheDefaultSettings", w * .2, h * .72, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText("$" ..  item.price, "TheDefaultSettings", w * 0.4, h * .35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		local Button3 = vgui.Create("DButton", itemPanel);
    	Button3:SetText("");
		Button3:Dock(LEFT);
		-- Button3:SetWide(100);
		-- Button3:SetSize(150, 30)
    	Button3.Paint = function (me, w, h)
        	draw.SimpleText("BUY", "TheDefaultSettings", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        	surface.SetDrawColor(0, 0, 0, 170)
			surface.DrawRect(0, 0, w, h)
        	surface.SetDrawColor(255, 165, 0, 255)
        	surface.DrawOutlinedRect(0, 0, w, h)
		end
		Button3.DoClick = function()
			net.Start("ShopButton8")
			net.WriteInt(_, 32)
			net.SendToServer()
    		weapon2:Close()
		end
	end

	local x = 350
	local y = -150
	local spacing = .1

	for _, model in ipairs(Shop.Items5) do
		local modelPanel = vgui.Create( "DModelPanel", scroll )
		modelPanel:SetPos(x, y)
		modelPanel:SetSize( 200, 200 )
		modelPanel:SetModel( model.Wmodel )
		y = y + 40 + spacing
	end

	local isAnimat = true
	weapon2:SizeTo(frameW, frameH, animTime, animDelay, animEase, function ()
		isAnimat = false
	end)
	weapon2.Think = function(me)
		if isAnimat then
			me:Center()
		end
	end
end

end