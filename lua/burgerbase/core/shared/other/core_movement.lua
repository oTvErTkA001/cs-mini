function BURGERBASE_HOOK_Move(ply,mv)

	if BURGERBASE and BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_speedmod",false):GetBool() then
		
		local ActiveWeapon = ply:GetActiveWeapon()
		
		local BaseSpeed = 250
		local WeaponSpeed = 250
		
		if ActiveWeapon and ActiveWeapon ~= NULL and ActiveWeapon.CSSMoveSpeed then
			WeaponSpeed = ActiveWeapon.CSSMoveSpeed
			
			if ActiveWeapon.CSSZoomSpeed and ActiveWeapon.CSSZoomSpeed ~= -1 and ActiveWeapon:GetSharedZoom() then
				WeaponSpeed = ActiveWeapon.CSSZoomSpeed
			end
			
		end

		if WeaponSpeed ~= -1 then
			local PreviousLimit = mv:GetMaxClientSpeed()

			local SpeedMod = (WeaponSpeed / BaseSpeed)
			local NewLimit = PreviousLimit * SpeedMod
			
			if ply:Crouching() then
				NewLimit = NewLimit * ply:GetCrouchedWalkSpeed()
			end
			
			if SERVER then
				--print(math.Round(CurTime(),2),"CSS:",PreviousLimit,NewLimit)
			end
			
			mv:SetMaxSpeed( NewLimit )
			mv:SetMaxClientSpeed( NewLimit )
		end

	end

end

hook.Add("Move","BURGERBASE_HOOK_Move",BURGERBASE_HOOK_Move)