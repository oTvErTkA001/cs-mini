-- if CLIENT then
-- 	killicon.AddFont( "weapon_burger_cs_c4", "csd", "O", Color( 255, 80, 0, 255 ) ) ; killicon.AddFont( "ent_burger_cs_c4", "csd", "O", Color( 255, 80, 0, 255 ) )
-- end

SWEP.Category				= "Defuseable C4"
SWEP.PrintName				= "C4"
SWEP.Base					= "weapon_burger_core_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 0
SWEP.CSSMoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= true

SWEP.Slot					= 4
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel				= "models/weapons/w_c4.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "slam"

SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Sound			= Sound("weapons/ak47/ak47-1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= -1
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= true
SWEP.HasSideRecoil			= false

SWEP.IsThrowing 			= false
SWEP.HasAnimated			= false
SWEP.HasThrown				= false
SWEP.CanHolster				= true

function SWEP:Deploy()

end

function SWEP:Holster()
	return self.CanHolster
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	
	
	if GetGlobalFloat("CSSC4NextFire",0) == 0 then
		SetGlobalFloat("CSSC4NextFire", CurTime() - 1)
	end
	
end




function SWEP:PrimaryAttack()
	local owner = self.Owner
	if owner.CanPlantBomb then

	if self:IsUsing() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay + 2)

	self.HasThrown = false
	self.HasAnimated = false

	
	
	--self.Owner:Freeze(true)
	--self:TakePrimaryAmmo(1)
	
	if SERVER then
		if not self:AllowedToPlant(true) then
			self.Owner:ChatPrint("You need to wait " .. string.NiceTime( GetGlobalFloat("CSSC4NextFire",0) - CurTime() ) .. " before using this weapon.")
			return
		end
	end
	
	
	self.CanHolster = false
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	
	self.DefaultWalkSpeed = self.Owner:GetWalkSpeed()
	self.DefaultRunSpeed = self.Owner:GetRunSpeed()
	
	self.Owner:SetRunSpeed(0.01)
	self.Owner:SetWalkSpeed(0.01)
	
	self.IsThrowing = true
	
	self.ThrowAnimation = CurTime() + 3
	self.Throw = CurTime() + 3.1
	--self.ThrowRemove = CurTime() + 3.5
end
end

function SWEP:SecondaryAttack()

	if SERVER then
		if not self:AllowedToPlant(false) then
			self.Owner:ChatPrint("You need to wait " .. string.NiceTime( GetGlobalFloat("CSSC4NextFire",0) - CurTime() ) .. " before using this weapon.")
		else
		--	self.Owner:ChatPrint("You're allowed to plant this bomb.")
		end
	end
	
	self:SetNextSecondaryFire(CurTime() + 1)

end


function SWEP:EquipThink()
	if self.IsThrowing == true then
	
		if self.ThrowAnimation < CurTime() then
			if self.HasAnimated == false then
				self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
				self.Owner:SetAnimation(PLAYER_ATTACK1) 
				self.HasAnimated = true
			end
		end
		
		if self.Throw < CurTime() then
			if self.HasThrown == false then
				self:PlantC4()
				self.HasThrown = true
				
				self.IsThrowing = false
				self.HasAnimated = false
				self.CanHolster	= true
				
				if CLIENT then return end
			
				local foundp = false
				local founds = false
				
				for k,v in pairs(self.Owner:GetWeapons()) do
					if v:IsScripted() then
						if foundp == false then
							if weapons.GetStored(v:GetClass()).WeaponType == "Primary" then
								self.Owner:SelectWeapon(self.Owner:GetWeapons()[k]:GetClass() )
								foundp = true
							end
						end
					end
				end
				
				if foundp == false then
					for k,v in pairs(self.Owner:GetWeapons()) do
						if v:IsScripted() then
							if founds == false then
								if weapons.GetStored(v:GetClass()).WeaponType == "Secondary" then
									self.Owner:SelectWeapon(self.Owner:GetWeapons()[k]:GetClass() )
									founds = true
								end
							end
						end
					end
				end

				if founds == false and foundp == false then
					self.Owner:SelectWeapon(self.Owner:GetWeapons()[1]:GetClass() )
				end

			end
		end
	
	end
end

function SWEP:Reload()
	--PrintTable(GetActivities(self))
end

function SWEP:PlantC4()
	if CLIENT then return end
	local EA =  Angle(0,self.Owner:GetAngles().y,0)
	local pos = self.Owner:GetPos()

	self.Owner:SetRunSpeed(self.DefaultRunSpeed)
	self.Owner:SetWalkSpeed(self.DefaultWalkSpeed)
	
	
	
	local ent = ents.Create("ent_burger_cs_c4")		
		ent:SetPos(pos)
		ent:SetAngles(EA)
		ent:Spawn()
		ent:Activate()
		ent:SetNWEntity("owner",self.Owner)
		--ent:SetOwner(self.Owner)
		
	ent:EmitSound("weapons/c4/c4_plant.wav")
	
	--self.Owner:Freeze(false)
	timer.Stop("RoundEndTimer")
	self:Remove()

	
end

function SWEP:AllowedToPlant(reset)

	if GetGlobalFloat("CSSC4NextFire",0) <= CurTime() then
	
		if reset == true then
			SetGlobalFloat("CSSC4NextFire",CurTime() + BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_timelimit"):GetFloat()*60 )
		end
		
		return true
	else
		return false
	end

end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
    y = y + 10
	x = x + 10
	wide = wide - 20

	draw.SimpleText("I", "CSKillIcons", x + wide * 0.5, y + tall * 0.5, Color(200, 200, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
end