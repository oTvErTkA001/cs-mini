function BURGERBASE:SuperThrowCheck(ply,Weapon)
	if BURGERBASE:ThrowCheck(ply,Weapon,"weapon_burger_cs_he") then
		return true
	elseif BURGERBASE:ThrowCheck(ply,Weapon,"weapon_burger_ex_gas") then
		return true
	elseif BURGERBASE:ThrowCheck(ply,Weapon,"weapon_burger_cs_flash") then
		return true
	elseif BURGERBASE:ThrowCheck(ply,Weapon,"weapon_burger_cs_smoke") then
		return true
	else
		return false
	end
end

function BURGERBASE:ThrowCheck(ply,Weapon,class)
	if not ply:HasWeapon(class) then return false end
	if Weapon:GetClass() == class and not ply:IsBot() then return false end	
	ply:SelectWeapon(class)
	return true
end

function BURGERBASE_HOOK_KeyPress(ply,key)
	
	if ply:KeyDown(IN_USE) or ply:IsBot() then
		if key == IN_ATTACK or ply:IsBot() then
			if ply:InVehicle() then return end
		
			local Weapon = ply:GetActiveWeapon()
			
			if not IsValid(Weapon) then return end
			if not Weapon:IsScripted() then return end	
			if Weapon.Base ~= "weapon_burger_core_base" then return end	
			if Weapon:IsBusy() == true then return end
			if !Weapon:CanQuickThrow() then return end
			
			if CLIENT then return end
			
			if not BURGERBASE:SuperThrowCheck(ply,Weapon) then return false end
			
			if Weapon.HasHolster then
				local ThrowDelay = Weapon.Owner:GetViewModel():SequenceDuration()
				timer.Simple(ThrowDelay + FrameTime(), function()
					Weapon = ply:GetActiveWeapon()
					if Weapon and Weapon ~= NULL then
						Weapon:QuickThrow()
					end
				end)
			else
				Weapon = ply:GetActiveWeapon()
				Weapon:QuickThrow()
			end
			
		end
	end
end

hook.Add("KeyPress","BURGERBASE_HOOK_KeyPress",BURGERBASE_HOOK_KeyPress)
