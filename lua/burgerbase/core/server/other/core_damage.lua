
function BURGERBASE_HOOK_ScalePlayerDamage(ply, hitgroup, dmginfo)

	local DamageScale,DamageOverride = BURGERBASE_FUNC_GetDamageScale(ply,hitgroup,dmginfo)
	
	if not DamageScale then
		dmginfo:SetDamage(DamageOverride)
	else
		dmginfo:ScaleDamage(DamageScale)
	end

end

function BURGERBASE_FUNC_GetDamageScale(ply,hitgroup,dmginfo)

	local Inflictor = dmginfo:GetInflictor()
	
	local DamageScale = 1
	local Damage = nil
	
	if Inflictor ~= NULL and Inflictor ~= nil then
		if Inflictor:IsPlayer() then
			Weapon = Inflictor:GetActiveWeapon()
		end
	end

	if Weapon ~= NULL and Weapon ~= nil then
		if Weapon.FatalHeadshot and hitgroup == HITGROUP_HEAD then
			local Damage = math.max(dmginfo:GetDamage(),ply:Health())
			return nil,Damage
		end
	end

	if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_enable",false):GetBool() then
	
		if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_sandboxfix",false):GetBool() then
			if ( hitgroup == HITGROUP_HEAD ) then
				DamageScale = DamageScale*0.5
			elseif ( hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM || hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG || hitgroup == HITGROUP_GEAR ) then
				DamageScale = DamageScale*4
			end
		end
		
		if hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG then
			DamageScale = DamageScale * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_legscale",false):GetFloat()
		elseif hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM then
			DamageScale = DamageScale * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_armscale",false):GetFloat()
		elseif hitgroup == HITGROUP_HEAD then
			DamageScale = DamageScale * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_headscale",false):GetFloat()
		else
			DamageScale = DamageScale * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damage_bodyscale",false):GetFloat()
		end
		
	end
	
	return DamageScale,Damage

end

hook.Add("ScalePlayerDamage","BURGERBASE_HOOK_ScalePlayerDamage",BURGERBASE_HOOK_ScalePlayerDamage)
hook.Add("ScaleNPCDamage","BURGERBASE_HOOK_ScalePlayerDamage",BURGERBASE_HOOK_ScalePlayerDamage)

if not BURGERBASE_StoredWeaponKills then
	BURGERBASE_StoredWeaponKills = {}
end


function BURGERBASE_HOOK_PlayerDeath_Tracker(victim,inflictor,attacker )

	if inflictor == attacker and attacker:IsPlayer() and attacker:GetActiveWeapon() and attacker:GetActiveWeapon():IsValid() then
		inflictor = attacker:GetActiveWeapon()
	end

	--print(victim,inflictor,attacker)

	if victim:IsValid() and victim:IsPlayer() and attacker:IsValid() and attacker:IsPlayer() and inflictor:IsValid() and inflictor.BurgerBase == true then
	
		if not BURGERBASE_StoredWeaponKills[inflictor:GetClass()] then
			BURGERBASE_StoredWeaponKills[inflictor:GetClass()] = 1
		else
			BURGERBASE_StoredWeaponKills[inflictor:GetClass()] = BURGERBASE_StoredWeaponKills[inflictor:GetClass()] + 1
		end
	
		--print(inflictor:GetClass(),BURGERBASE_StoredWeaponKills[inflictor:GetClass()])
	
	end

end

hook.Add("PlayerDeath","BURGERBASE_HOOK_PlayerDeath_Tracker",BURGERBASE_HOOK_PlayerDeath_Tracker)

concommand.Add("nerfme2", function( ply, cmd, args, argStr)

	local Keys = table.GetKeys( BURGERBASE_StoredWeaponKills )

	table.sort( Keys, function( a, b )
		return BURGERBASE_StoredWeaponKills[a] < BURGERBASE_StoredWeaponKills[b]
	end)

	for i=1, #Keys do
		local k = Keys[i]
		local v = BURGERBASE_StoredWeaponKills[k]
	
		print("-------------------------")
		print("Weapon: ",k)
		print("Kills: ",v)
	end
	
	print("-------------------------")

end)


concommand.Add( "nerfme", function( ply,cmd,args,argStr )

	local PlayerHealth = 100

	local AllWeapons = weapons.GetList()
	
	local MyWeapons = {}
	
	for k,SWEP in pairs(AllWeapons) do
		if SWEP.Base == "weapon_burger_core_base" and (SWEP.WeaponType == "Primary" or SWEP.WeaponType == "Secondary") and SWEP.Spawnable then
		
			local ReturnTable = BURGERBASE_CalculateWeaponStats(ply,SWEP,true)
			
			local ID = SWEP.PrintName
			
			MyWeapons[ID] = {}
			MyWeapons[ID].Damage = ReturnTable.damage * ReturnTable.shots
			--MyWeapons[ID].Delay = ReturnTable.delay
			MyWeapons[ID].DPS = ReturnTable.dps
			MyWeapons[ID].KillTime = ReturnTable.killtime
			
			
			
			
			
			--
			
		
			--[[
			local PrintName = SWEP.PrintName
			
			local Damage = SWEP.Primary.NumShots * SWEP.Primary.Damage
			local Delay = math.Clamp(SWEP.Primary.Delay,FrameTime(),60)
			
			if !SWEP.Primary.Automatic and Delay < 0.1 then
				Delay = 0.1
			end
			
			if SWEP.HasHL2Pump then
				Delay = Delay + 1
			end
			
			local ClipSize = SWEP.Primary.ClipSize
		
			if ClipSize == -1 then
				ClipSize = 250
			end
		
			local ClipDamage = Damage * ClipSize

			local DPS = math.min(ClipDamage,math.floor(( 1 / Delay) * Damage ))
			local KillTime = math.Round((math.ceil(PlayerHealth/Damage) - 1) * (Delay),2)
			
			MyWeapons[PrintName] = {}
			MyWeapons[PrintName].DPS = DPS
			MyWeapons[PrintName].KillTime = KillTime
			--]]

		end
	end
	
	local Keys = table.GetKeys( MyWeapons )

	if argStr == "time" then
		table.sort( Keys, function( a, b )
			if MyWeapons[a].KillTime == MyWeapons[b].KillTime then
				return a < b
			else
				return MyWeapons[a].KillTime > MyWeapons[b].KillTime
			end
		end )
	else
		table.sort( Keys, function( a, b )
			if MyWeapons[a].DPS == MyWeapons[b].DPS then
				return a < b
			else
				return MyWeapons[a].DPS < MyWeapons[b].DPS
			end
		end )
	end

	for i=1, #Keys do
		local k = Keys[i]
		local v = MyWeapons[k]
		print("-------------------------")
		print("Weapon:   ",k)
		print("Damage:   ",v.Damage)
		print("DPS:      ",v.DPS)
		print("KillTime: ",v.KillTime)
	end

end )

