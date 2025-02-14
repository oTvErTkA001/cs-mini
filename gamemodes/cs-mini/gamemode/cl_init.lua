include("shared.lua")
include( 'holster.lua' )
include("cl_shop.lua")


if SERVER then
    include("sv_shop.lua")
end

--had to hard code to disable noclip
function DisableNoclip( pl )
	return true
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)

-----------------------------------------------------------------------

hook.Add("CalcView", "StrafeCam", function(ply, origin, angle, fov, wep, vm, oPos, oAng, pos, ang)
    local vel = ply:GetVelocity()
	local ang = ply:EyeAngles()
	local ply = LocalPlayer()
	local VelSmooth = 1
	local WalkTimer = 0.5

	VelSmooth = VelSmooth * 0.9 + vel:Length() * 0.1

	WalkTimer = WalkTimer + VelSmooth * FrameTime() * 0.05

	// Roll on strafe
	angle.roll = angle.roll + ang:Right():DotProduct( vel ) * 0.005 ---


	// Roll on steps
	if ( ply:GetGroundEntity() != NULL ) then

		angle.roll = angle.roll + math.sin( WalkTimer ) * VelSmooth * 0.001
		angle.pitch = angle.pitch + math.sin( WalkTimer * 0.5 ) * VelSmooth * 0.001

	end

	angle = angle + ply:EyeAngles()
end)

hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function()
	return false
end )

----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------

local disable = {
    ['CHudHealth'] =true,
    ['CHudBattery'] =true,
    ['CHudSuitPower'] =true,
    ['CHudAmmo'] =true,
    ['CHudSecondaryAmmo'] =true,
    ['CHudCrosshair'] =false,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
  if disable[name] then
  return false
end
end)

local hudScreen = nil
local Alive = false
local Team = 0
local WaitingToRespawn = false
local InRound = false
local RoundResult = 0
local IsObserver = false
local ObserveMode = 0
local ObserveTarget = NULL
local InVote = false

function GM:AddHUDItem( item, pos, parent )
	hudScreen:AddItem( item, parent, pos )
end

function GM:HUDNeedsUpdate()

	if ( !IsValid( LocalPlayer() ) ) then return false end

	if ( Alive != LocalPlayer():Alive() ) then return true end
	if ( Team != LocalPlayer():Team() ) then return true end
	if ( WaitingToRespawn != ( (LocalPlayer():GetNWFloat( "RespawnTime", 0 ) > CurTime()) && LocalPlayer():Team() != TEAM_SPECTATOR && !LocalPlayer():Alive()) ) then return true end
	if ( InRound != GetGlobalBool( "InRound", false ) ) then return true end
	if ( RoundResult != GetGlobalInt( "RoundResult", 0 ) ) then return true end
	if ( IsObserver != LocalPlayer():IsObserver() ) then return true end
	if ( ObserveMode != LocalPlayer():GetObserverMode() ) then return true end
	if ( ObserveTarget != LocalPlayer():GetObserverTarget() ) then return true end
	if ( InVote != GAMEMODE:InGamemodeVote() ) then return true end

	return false
end

function GM:OnHUDUpdated()
	Alive = LocalPlayer():Alive()
	Team = LocalPlayer():Team()
	WaitingToRespawn = (LocalPlayer():GetNWFloat( "RespawnTime", 0 ) > CurTime()) && LocalPlayer():Team() != TEAM_SPECTATOR && !Alive
	InRound = GetGlobalBool( "InRound", false )
	RoundResult = GetGlobalInt( "RoundResult", 0 )
	IsObserver = LocalPlayer():IsObserver()
	ObserveMode = LocalPlayer():GetObserverMode()
	ObserveTarget = LocalPlayer():GetObserverTarget()
	InVote = GAMEMODE:InGamemodeVote()
end

function GM:OnHUDPaint()

	if LocalPlayer():Team() == TEAM_ALIVE and LocalPlayer():Alive() then

		draw.SimpleTextOutlined( LocalPlayer():Frags().."  bones" , "FragsText", ScrW() * 0.50, ScrH() * 0.03,
			Color( 255, 50, 50, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color( 10, 10, 10, 255 ) )

	elseif LocalPlayer():Team() == TEAM_DEAD and LocalPlayer():Alive() and LocalPlayer():GetNWBool( "FirstZombie", false ) then

		local amt = 2 - math.Clamp( LocalPlayer():GetNWInt( "Brains", 0 ), 0, 2 )
		local glow = 50 + TimedSin( 0.5 + amt / 10, 0, 100, 0 )
		local str = amt.."  kill needed"

		if amt == 2 then
			str = amt.."  kills needed"
		end

		draw.SimpleTextOutlined( str , "RedeemText", ScrW() * 0.50, ScrH() * 0.03,
			Color( 255, glow, glow, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, Color( 10, 10, 10, 255 ) )

	end

end

function GM:RefreshHUD()

	if ( !GAMEMODE:HUDNeedsUpdate() ) then return end
	GAMEMODE:OnHUDUpdated()

	if ( IsValid( hudScreen ) ) then hudScreen:Remove() end
	hudScreen = vgui.Create( "DHudLayout" )

	if ( InVote ) then return end

	if ( RoundResult != 0 ) then
		GAMEMODE:UpdateHUD_RoundResult( RoundResult, Alive )
	elseif ( IsObserver ) then
		GAMEMODE:UpdateHUD_Observer( WaitingToRespawn, InRound, ObserveMode, ObserveTarget )
	elseif ( !Alive ) then
		GAMEMODE:UpdateHUD_Dead( WaitingToRespawn, InRound )
	else
		GAMEMODE:UpdateHUD_Alive( InRound )
	end

end

function GM:HUDPaint()

	self.BaseClass:HUDPaint()

	GAMEMODE:OnHUDPaint()
	GAMEMODE:RefreshHUD()

end

function GM:UpdateHUD_RoundResult( RoundResult, Alive )

	local txt = GetGlobalString( "RRText" )

	if ( type( RoundResult ) == "number" ) && ( team.GetAllTeams()[ RoundResult ] && txt == "" ) then
		local TeamName = team.GetName( RoundResult )
		if ( TeamName ) then txt = TeamName .. " Wins!" end
	elseif ( type( RoundResult ) == "Player" && IsValid( RoundResult ) && txt == "" ) then
		txt = RoundResult:Name() .. " Wins!"
	end

	local RespawnText = vgui.Create( "DHudElement" );
		RespawnText:SizeToContents()
		RespawnText:SetText( txt )
	GAMEMODE:AddHUDItem( RespawnText, 8 )

end

function GM:UpdateHUD_Observer( bWaitingToSpawn, InRound, ObserveMode, ObserveTarget )

	local lbl = nil
	local txt = nil

	if ( IsValid( ObserveTarget ) && ObserveTarget:IsPlayer() && ObserveTarget != LocalPlayer() && ObserveMode != OBS_MODE_ROAMING ) then
		lbl = "SPECTATING"
		txt = ObserveTarget:Nick()
	end

	if ( ObserveMode == OBS_MODE_DEATHCAM || ObserveMode == OBS_MODE_FREEZECAM ) then
		txt = "You Died!" // were killed by?
	end

	if ( txt ) then
		local txtLabel = vgui.Create( "DHudElement" );
		txtLabel:SetText( txt )
		if ( lbl ) then txtLabel:SetLabel( lbl ) end
		GAMEMODE:AddHUDItem( txtLabel, 2 )
	end


	GAMEMODE:UpdateHUD_Dead( bWaitingToSpawn, InRound )

end

function GM:UpdateHUD_Dead( bWaitingToSpawn, InRound )

	if ( !InRound && GAMEMODE.RoundBased ) then

		local RespawnText = vgui.Create( "DHudElement" );
			RespawnText:SizeToContents()
			RespawnText:SetText( "Waiting for game start..." )
		GAMEMODE:AddHUDItem( RespawnText, 8 )
		return

	end

	if ( bWaitingToSpawn ) then

		local RespawnTimer = vgui.Create( "DHudCountdown" );
			RespawnTimer:SizeToContents()
			RespawnTimer:SetValueFunction( function() return LocalPlayer():GetNWFloat( "RespawnTime", 0 ) end )
			RespawnTimer:SetLabel( "SPAWN IN" )
		GAMEMODE:AddHUDItem( RespawnTimer, 8 )
		return

	end

	if ( InRound ) then

		local RoundTimer = vgui.Create( "DHudCountdown" );
			RoundTimer:SizeToContents()
			RoundTimer:SetValueFunction( function()
											if ( GetGlobalFloat( "RoundStartTime", 0 ) > CurTime() ) then return GetGlobalFloat( "RoundStartTime", 0 )  end
											return GetGlobalFloat( "RoundEndTime" ) end )
			RoundTimer:SetLabel( "TIME" )
		GAMEMODE:AddHUDItem( RoundTimer, 8 )
		return

	end

	if ( Team != TEAM_SPECTATOR && !Alive ) then

		local RespawnText = vgui.Create( "DHudElement" );
			RespawnText:SizeToContents()
			RespawnText:SetText( "Click to Spawn" )
		GAMEMODE:AddHUDItem( RespawnText, 8 )

	end

end

function GM:UpdateHUD_Alive( InRound )

	GAMEMODE:PaintAmmo()
	GAMEMODE:PaintHealth()

	if ( GAMEMODE.RoundBased || GAMEMODE.TeamBased ) then

		local Bar = vgui.Create( "DHudBar" )
		GAMEMODE:AddHUDItem( Bar, 2 )

		if ( GAMEMODE.TeamBased ) then

			local TeamIndicator = vgui.Create( "DHudUpdater" );
				TeamIndicator:SizeToContents()
				TeamIndicator:SetValueFunction( function()
													return team.GetName( LocalPlayer():Team() )
												end )
				TeamIndicator:SetColorFunction( function()
													return team.GetColor( LocalPlayer():Team() )
												end )
				TeamIndicator:SetFont( "HudSelectionText" )
			Bar:AddItem( TeamIndicator )

		end

		local RoundTimer = vgui.Create( "DHudCountdown" );
			RoundTimer:SizeToContents()
			RoundTimer:SetValueFunction( function()
											if ( GetGlobalFloat( "RoundStartTime", 0 ) > CurTime() ) then return GetGlobalFloat( "RoundStartTime", 0 )  end
											return GetGlobalFloat( "RoundEndTime" ) end )
			RoundTimer:SetLabel( "TIME" )
		Bar:AddItem( RoundTimer )

	end

end

function GM:PaintAmmo()

	if LocalPlayer():Team() == TEAM_DEAD then return end

	local Bar = vgui.Create( "DHudBar" )
		GAMEMODE:AddHUDItem( Bar, 3 )


	local AmmoIndicator = vgui.Create( "DHudUpdater" )
		AmmoIndicator:SizeToContents()
		AmmoIndicator:SetValueFunction( function()
											local wep = LocalPlayer():GetActiveWeapon()
											if IsValid( wep ) and wep:GetMaxClip1() > 0 then
												return wep:Clip1()
											end
											return "-"
										end )
		AmmoIndicator:SetLabel( "AMMO" )
		AmmoIndicator:SetFont( "FHUDElement" )

	local AmountIndicator = vgui.Create( "DHudUpdater" )
		AmountIndicator:SizeToContents()
		AmountIndicator:SetValueFunction( function()
											local wep = LocalPlayer():GetActiveWeapon()
											if IsValid( wep ) and wep:GetMaxClip1() > 0 then
												return LocalPlayer():GetAmmoCount( wep:GetPrimaryAmmoType() )
											end
											return "-"
										end )
		AmountIndicator:SetLabel( "TOTAL" )
		AmountIndicator:SetFont( "FHUDElement" )


	Bar:AddItem( AmmoIndicator )
	Bar:AddItem( AmountIndicator )


end

function GM:PaintHealth()

	local Bar = vgui.Create( "DHudBar" )
		GAMEMODE:AddHUDItem( Bar, 1 )

	if ( GAMEMODE.SelectClass ) then

		local ClassIndicator = vgui.Create( "DHudUpdater" )
			ClassIndicator:SizeToContents()

			local ply = LocalPlayer()


			ClassIndicator:SetValueFunction( function()
												local classes

												local t = ply:Team()
												if t == 2 then
													classes = PLAYER_CLASSES
												elseif t == 1 then
													classes = PLAYER_CLASSES2
												end
												local name = ""
												if classes and classes[ply:GetNWInt("classIndex")] then
													name = classes[ply:GetNWInt("classIndex")].name
												end
												return name
											end )
			ClassIndicator:SetColorFunction( function()
												return team.GetColor( ply:Team() )
											end )
			ClassIndicator:SetFont( "HudSelectionText" )

	--	Bar:AddItem( ClassIndicator )

	end

	local HealthIndicator = vgui.Create( "DHudUpdater" )
		HealthIndicator:SizeToContents()
		HealthIndicator:SetValueFunction( function() return math.max(LocalPlayer():Health(), 0) end )
		HealthIndicator:SetColorFunction( function()
											if LocalPlayer():Health() <= 25 then
												return Color( 255, 100 + math.sin( RealTime() * 3 ) * 100, 100 + math.sin( RealTime() * 3 ) * 100, 255 )
											end
											return Color( 255, 255, 255, 255 )
										end )
		HealthIndicator:SetLabel( "HEALTH" )
		HealthIndicator:SetFont( "FHUDElement" )

	-- local ArmorIndicator = vgui.Create( "DHudUpdater" )  --броня
	-- 	ArmorIndicator:SizeToContents()
	-- 	ArmorIndicator:SetValueFunction( function()
	-- 										local armor = LocalPlayer():Armor()
	-- 										return armor
	-- 									end )
	-- 	ArmorIndicator:SetLabel( "ARMOR" )
	-- 	ArmorIndicator:SetFont( "FHUDElement" )	

	Bar:AddItem( HealthIndicator )
	--Bar:AddItem( ArmorIndicator ) --броня
end
