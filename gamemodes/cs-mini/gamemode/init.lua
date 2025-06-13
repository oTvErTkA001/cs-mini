AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "holster.lua" )
AddCSLuaFile( "cl_shop.lua" )
AddCSLuaFile( "deathsounds.lua" )

include( 'shared.lua' )
include("cl_shop.lua")
include("deathsounds.lua")



-- Serverside only stuff goes here

--Makes a pre round, also doesnt draw the game every time im testing it
function GM:StartRoundBasedGame()

	GAMEMODE:PreRoundStart( 1 )

--	StripWorld()

end

--tells the game what to do every
function GM:OnRoundStart( num )

	if team.NumPlayers( TEAM_T ) > 0  then
		local terrorTeam = team.GetPlayers( TEAM_T ); // get all the  terror team
		local bomb = table.Random( terrorTeam ); // get our bomb
		bomb:Give( "weapon_cs_c4" )
	end

	UTIL_UnFreezeAllPlayers()

end



function GM:OnRoundResult( t )

	if t == 1 then
		BroadcastLua([[sound.Play("radio/ctwin.wav",LocalPlayer():GetPos())]]) -- COUNTER TERRORISTS WIN
	elseif t == 2 then
		BroadcastLua([[sound.Play("radio/terwin.wav",LocalPlayer():GetPos())]]) -- TERRORISTS WIN
	else
		BroadcastLua([[sound.Play("radio/rounddraw.wav",LocalPlayer():GetPos())]]) --ROUND DRAW
	end

	team.AddScore( t, 1 )

	-- if team.GetScore( t ) >= 3 then
	-- 	timer.Simple( 5, function() GAMEMODE:EndOfGame( false ) end )
	-- end

end

function GM:RoundTimerEnd()

	GAMEMODE:RoundEndWithResult( TEAM_CT, "Time Up. Counter-Terrorists win!" )

end

function GM:T_WIN()

	self:RoundEndWithResult( TEAM_T, "The bomb exploded. Terrorists win!" );

end

function GM:CT_WIN( )

	self:RoundEndWithResult( TEAM_CT, "Bomb defused. Counter-Terrorists win!" );

end


function GM:CheckRoundEnd()

	if ( !GAMEMODE:InRound() ) then return end

	isbomb = true;

	for k, v in ipairs( ents.FindByClass( "ent_burger_cs_c4" ) ) do
		-- print( v:GetPos() )
		isbomb = false;
	end

	local tCount = 0
	local ctCount = 0

	for _, pl in player.Iterator() do
		if pl:Alive() then
			if pl:Team() == 2 then
				tCount = tCount + 1
			elseif pl:Team() == 1 then
				ctCount = ctCount + 1
			end
		end
	end

	if( tCount == 0 and team.NumPlayers( TEAM_T ) > 0  and isbomb ) then
		GAMEMODE:RoundEndWithResult( TEAM_CT, "Counter-Terrorists win!" );
	end

	if( ctCount == 0 and team.NumPlayers( TEAM_CT ) > 0  ) then
		GAMEMODE:RoundEndWithResult( TEAM_T, " Terrorists win!" );
	end

	timer.Create( "CheckRoundEnd", 1, 0, function() GAMEMODE:CheckRoundEnd() end )

end

function StripWorld()
    -- Remove all weapons from the world.
	for k,v in pairs(ents.FindByClass("weapon_*")) do
        v:Remove()
    end
	-- Remove all items from the world.
	for k,v in pairs(ents.FindByClass("item_*")) do
        v:Remove()
    end
end


-------------------------------------------------------------------

hook.Add("StartCommand", "Dynamic Height + Hull Fix FIX", function()
	hook.Remove("StartCommand", "Dynamic Height + Hull Fix FIX")

	if DynamicCameraUpdateTrueModel then
		local ECPlayerTickRate = 0.5

		hook.Add("PlayerTick", "DynamicCamera:PlayerTick", function(ply)
			if (ply.ECPlayerTickTime or 0) > CurTime() then return end
			ply.ECPlayerTickTime = CurTime() + ECPlayerTickRate
			
			DynamicCameraUpdateTrueModel(ply)
		end)
	end
end)

-------------------------------------------------------------------

local function DoDropWeapon( victim, inflictor, attacker )
	for i=1 , table.Count( victim:GetWeapons() ) do
		if IsValid( victim:GetWeapons()[i]) then
			local ent = ents.Create( victim:GetWeapons()[i]:GetClass() )
			ent:SetPos( victim:GetPos() )
			ent:SetParent( victim.Entity )
			ent:Spawn()
		end
	end
end

hook.Add("PlayerDeath","DROPWEAPON",DoDropWeapon)

-------------------------------------------------------------------
hook.Add( "PlayerSwitchFlashlight", "BlockFlashLight", function( ply, enabled )
	return true
end )

hook.Add( "AllowPlayerPickup", "AllowpickUp", function( ply, ent )
    return false
end )
