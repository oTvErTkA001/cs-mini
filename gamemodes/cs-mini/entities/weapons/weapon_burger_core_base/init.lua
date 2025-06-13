AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function SWEP:EquipAmmo(ply) -- server
	if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_ammo_givespare"):GetFloat() == 1 or self.WeaponType == "Equipment" then
		ply:GiveAmmo(self.Primary.SpareClip,self:GetPrimaryAmmo(),false)
		ply:GiveAmmo(self.Secondary.SpareClip,self:GetSecondaryAmmo(),false)
		--print(self.Secondary.SpareClip,self:GetSecondaryAmmo())
	elseif self.WeaponType == "Throwable" then
		ply:GiveAmmo(1,self:GetPrimaryAmmo(),false)
	end
	self:SpecialGiveAmmo()	
end

function SWEP:SpecialGiveAmmo() -- server


end

function SWEP:ShootPhysicalObject(Source,Cone,Direction) -- Server

	local EyeTrace = self.Owner:GetEyeTrace()
	local TheEyePos = self.Owner:EyePos()
	
	local HitPos = EyeTrace.HitPos
	
	Source = Source + self.Owner:GetForward()*self.SourceOverride.y + self.Owner:GetRight()*self.SourceOverride.x + self.Owner:GetUp()*self.SourceOverride.z
	
	local Dir = (Source - HitPos)
	local Dir = Direction
	Dir:Normalize()
	
	local FinalAngles = Dir:Angle() + self.BulletAngOffset + Angle(self:BulletRandomSeed(-Cone,Cone),self:BulletRandomSeed(-Cone,Cone),0)*45
	FinalAngles:Normalize()

	local Bullet = ents.Create(self.BulletEnt)	
	if Bullet:IsValid() then
		Bullet:SetPos(Source)
		Bullet:SetAngles( FinalAngles )
		Bullet:SetOwner(self.Owner)
		Bullet:Spawn()
		Bullet:Activate()
	else
		SafeRemoveEntity(Bullet)
	end

	if IsFirstTimePredicted() then
		self:TracerCreation(Source + Dir*100,Source,Dir,self.Owner)
	end

end