if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName 		= "AWM"

	SWEP.ViewModelFOV		= 75
	SWEP.Slot 			= 3
	SWEP.SlotPos 		= 1
	SWEP.IconLetter 		= ""
	SWEP.IconLetterCSS		= ""

	killicon.AddFont( "weapon_cs_ak47_gb", "TextKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	surface.CreateFont("TextKillIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(13),antialiasing=true,additive=true })
	surface.CreateFont("TextSelectIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(20),antialiasing=true,additive=true })
	surface.CreateFont("CSKillIcons", { font="csd", weight="500", size=ScreenScale(30),antialiasing=true,additive=true })
	surface.CreateFont("CSSelectIcons", { font="csd", weight="500", size=ScreenScale(60),antialiasing=true,additive=true })
end

SWEP.Category			= "Css GameBanana"

SWEP.Base				= "br_weapon_base"

SWEP.HoldType 		= "ar2"

SWEP.Spawnable 			= false
SWEP.AdminSpawnable 	= false

SWEP.ViewModel 			= "models/weapons/v_snip_awp.mdl"
SWEP.WorldModel 			= "models/weapons/w_snip_awp.mdl"
SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.Primary.Sound 		= Sound("sound")
SWEP.Primary.Damage 		= 135
SWEP.Primary.Recoil 		= 6
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Cone 		= 0.0001
SWEP.Primary.ClipSize 		= 10
SWEP.Primary.Delay 		= 2
SWEP.Primary.DefaultClip 	= 20
SWEP.Primary.Automatic 		= false
SWEP.Primary.Ammo 		= "smg1"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.CrosshairScale = 1
SWEP.MPrecoil				= 1

-- Weapon Variations
SWEP.UseScope				= true -- Use a scope instead of iron sights.
SWEP.ScopeScale 			= 0.55 -- The scale of the scope's reticle in relation to the player's screen size.
SWEP.ScopeZoom				= 6
SWEP.IronsightTime 			= 0.35
SWEP.StockIronSightAnim 	= true
SWEP.CrossHair				= false


--FireModes
SWEP.FiringMode			= false --Can we switch the firing modes? Auto, Semi, and Burst?
SWEP.Burstable 			= false --Can we burst with firing modes?
SWEP.BurstShots 		= 3 	--How many rounds should we shoot on burst? If you use more than 5 you are retarded beyond hell.
SWEP.PistolBurstOnly	= false --This might be confusing like the rest of my base. Only use this for pistols that only "burst" and "Semi" fire.

--Only Select one... Only one.
SWEP.ScopeReddot		= false
SWEP.ScopeNormal		= false
SWEP.ScopeMs			= false
SWEP.ScopeNight			= false
SWEP.BoltAction			= true --Self Explanatory

-- Accuracy
SWEP.CrouchCone				= 0.00001 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.00001 -- Accuracy when we're standing still


/*---------------------------------------------------------
	ResetVars
---------------------------------------------------------*/
function SWEP:ResetVars()

	self.NextSecondaryAttack = 0

	self.bLastIron = false
	self.Weapon:SetNetworkedBool("Ironsights", false)

	if self.UseScope then
		self.CurScopeZoom = 1
		self.fLastScopeZoom = 1
		self.bLastScope = false
		self.Weapon:SetNetworkedBool("Scope", false)
	end

	if self.Owner then
		self.OwnerIsNPC = self.Owner:IsNPC() -- This ought to be better than getting it every time we fire
	end

end

-- We need to call ResetVars() on these functions so we don't whip out a weapon with scope mode or insane recoil right of the bat or whatnot
function SWEP:Holster(wep) 		self:ResetVars() return true end
function SWEP:Equip(NewOwner) 	self:ResetVars() return true end
function SWEP:OnRemove() 		self:ResetVars() return true end
function SWEP:OnDrop() 			self:ResetVars() return true end
function SWEP:OwnerChanged() 	self:ResetVars() return true end
function SWEP:OnRestore() 		self:ResetVars() return true end

/*---------------------------------------------------------
	Initialize
---------------------------------------------------------*/
local sndZoomIn = Sound("Weapon_AR2.Special1")
local sndZoomOut = Sound("Weapon_AR2.Special2")
local sndCycleZoom = Sound("Default.Zoom")

function SWEP:Initialize()

	self:SetHoldType(self.HoldType)
	self.Weapon:SetNetworkedBool("pap", false)
	self.Weapon:SetNetworkedBool("Burst",false)


	if not file.Exists( self.WorldModel, "GAME" ) then
			self.WorldModel			= "models/weapons/w_pistol.mdl"
		end

	if CLIENT then

		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()

		-- The following code is only slightly riped off from Night Eagle
		-- These tables are used to draw things like scopes and crosshairs to the HUD.
		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1

		self.ParaScopeTable = {}
		self.ParaScopeTable.x = 0.5*iScreenWidth - self.ScopeTable.l
		self.ParaScopeTable.y = 0.5*iScreenHeight - self.ScopeTable.l
		self.ParaScopeTable.w = 2*self.ScopeTable.l
		self.ParaScopeTable.h = 2*self.ScopeTable.l

		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.

		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = 2.5+self.QuadTable.w3
		self.LensTable.y = 1+self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l

		self.CrossHairTable = {}
		self.CrossHairTable.x11 = 0
		self.CrossHairTable.y11 = 0.5*iScreenHeight
		self.CrossHairTable.x12 = iScreenWidth
		self.CrossHairTable.y12 = self.CrossHairTable.y11
		self.CrossHairTable.x21 = 0.5*iScreenWidth
		self.CrossHairTable.y21 = 0
		self.CrossHairTable.x22 = 0.5*iScreenWidth
		self.CrossHairTable.y22 = iScreenHeight

	end

	self.ScopeZooms 		= self.ScopeZooms or {5}
	if self.UseScope then
		self.CurScopeZoom	= 1 -- Another index, this time for ScopeZooms
	end

	self:ResetVars()
	self.Weapon:SetNetworkedBool("Ironsights", false)
	self.Reloadaftershoot = 0

	self.OGVMFLIP = self.ViewModelFlip
	self.oldVMFOV = self.ViewModelFOV

	//Spread Change
	self:SetNWInt("crouchcone", self.CrouchCone)
	self:SetNWInt("crouchwalkcone", self.CrouchWalkCone)
	self:SetNWInt("walkcone", self.WalkCone)
	self:SetNWInt("aircone", self.AirCone)
	self:SetNWInt("standcone", self.StandCone)
	self:SetNWInt("ironsightscone", self.IronsightsCone)
	//Recoil change
	self:SetNWInt("recoil", self.Recoil)
	self:SetNWInt("recoilzoom", self.RecoilZoom)
	//Delay change
	self:SetNWInt("delay", self.Delay)
	self:SetNWInt("delayzoom", self.DelayZoom)
	//ThinkSkip
	self:SetNWInt("thinkskip", self.ThinkSkip)
	self:SetNWInt("ironsighttoggle", false)
end
SWEP.SetNextFireMode2 = CurTime()
/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()
	if self.Owner:KeyDown(IN_USE) then return end
	local DisableDashing = false

		if GetConVar("sv_ptp_dashing_disable") == nil then
		DisableDashing = false
		else
		DisableDashing = GetConVar("sv_ptp_dashing_disable"):GetBool()
		end

	--if self.Owner:KeyDown(IN_SPEED) and not DisableDashing then return end -- срельба при беге

	if ( !self:CanPrimaryAttack() ) then return end

	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

	self.SetNextFireMode2 = CurTime() + (self.Primary.Delay * 0.5)
	// Play shoot sound
	self.Weapon:EmitSound( self.Primary.Sound )

	if ( self.Weapon:Clip1() < self:GetNWInt("LastClip") - 2) and (self:GetNWFloat("SprayAdditive") != 15) then
		self:SetNWFloat("SprayAdditive",self:GetNWFloat("SprayAdditive") + 0.5 )
	end

	if self.Weapon:GetNetworkedBool("Silenced") == true then
		self.Weapon:EmitSound( self.SilencedSound )
		self:CSShootBullet( self.Primary.Damage * 0.8, self.Recoil * 0.75, self.Primary.NumShots, self.Primary.Cone, self.MuzzleEffect )
	end
	if self.Weapon:GetNetworkedBool("pap") == true then
		self.Weapon:EmitSound( self.PackAPunchSound )
		--self.Weapon:EmitSound( self.Primary.Sound )
		self:CSShootBullet( self.Primary.Damage * 2, self.Recoil * 0.4, self.Primary.NumShots, self.Primary.Cone, "lee_muzzle_rifle_pap" )
	end
	if ((self.Weapon:GetNetworkedBool("pap") ==  false) and (self.Weapon:GetNetworkedBool("Silenced") == false)) then
		self.Weapon:EmitSound( self.Primary.Sound )
		self:CSShootBullet( self.Primary.Damage , self.Recoil , self.Primary.NumShots, self.Primary.Cone, self.MuzzleEffect )
	end
	//If Swep Data is Silenced Play Silenced else Unsilenced

	// Remove 1 bullet from our clip
	self:TakePrimaryAmmo( 1 )

	if self.Weapon:GetNetworkedBool("Burst", true) then
		self.BurstTimer = CurTime()
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )
		self.BurstCounter = self.BurstShots - 1
	end

	if (self.BoltAction) then
	self:SetIronsights(false)
		if (game.SinglePlayer()) then
			self:SetNWInt("skipthink", true)
				timer.Create("BoltTimer", self.Primary.Delay, 1,
				function()
					if self.Weapon == nil then return end
				self:SetNWInt("skipthink", false)
			end)

	else
			self:SetNWInt("skipthink", true)
				timer.Simple(self.Primary.Delay,
				function()
					if self.Weapon == nil then return end
				self:SetNWInt("skipthink", false)
			end)
	end
end
	if ( self.Owner:IsNPC() ) then return end

	// Punch the player's view
	self.Owner:ViewPunch( Angle( math.Rand(-0.2,-0.2) * 0.5, math.Rand(-0.1,0.1) * 0.5, 0 ) )

	// In singleplayer this function doesn't get called on the client, so we use a networked float
	// to send the last shoot time. In multiplayer this is predicted clientside so we don't need to
	// send the float.
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
	end

end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()

	if CLIENT and self.Weapon:GetNetworkedBool("Scope") then
		self.MouseSensitivity = self.Owner:GetFOV() / 80 -- scale sensitivity
	else
		self.MouseSensitivity = 1
	end

	if not file.Exists( self.WorldModel, "GAME" ) then
			self.WorldModel			= "models/weapons/w_pistol.mdl"
		end

	if not CLIENT and self.Weapon:GetNetworkedBool("Scope") and self.Owner:KeyDown(IN_ATTACK2) then

		self.Owner:DrawViewModel(true)
	elseif not CLIENT then

		self.Owner:DrawViewModel(true)
	end

	--self:IronSight()

--	self:FlipTheViewModel()
		//When the convar says so, flip it.

	self:SpreadSystem()

--	self:DashingPos()

	self:LuaAnimation()

	self:ToggleScope()

--	self:FireModes()
	//Fire modes

--	self:Burst()
	//Burst


end

SWEP.SetNextFireMode		= 0
SWEP.CycleScope				= 1
/*---------------------------------------------------------
ScopeModes
---------------------------------------------------------*/
function SWEP:ToggleScope()

	if !self.TogglableScope or self.Weapon:GetNetworkedBool( "Ironsights" , true ) then return end

	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyDown(IN_ATTACK2) and self.SetNextFireMode < CurTime() then

		if self.CycleScope == 1 and self.SetNextFireMode < CurTime() then
			self.Owner:PrintMessage( HUD_PRINTCENTER, "IronSights Selected" )
			self.Weapon:EmitSound("weapons/universal/firemode.wav")
			self.SetNextFireMode = CurTime() + 0.5
			self.UseScope = false
			self.CycleScope	= 2
		end
		if self.CycleScope == 2 and self.SetNextFireMode < CurTime() then
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Scope Selected" )
			self.Weapon:EmitSound("weapons/universal/firemode.wav")
			self.SetNextFireMode = CurTime() + 0.5
			self.UseScope = true
			self.CycleScope = 1
		end
	end
end

SWEP.RecoilMax = 0.5
SWEP.RecoilReturn = 0.5
SWEP.IronAjust = 0
SWEP.IronAjustMin = 0
/*---------------------------------------------------------
LuaAnimation
---------------------------------------------------------*/
function SWEP:LuaAnimation()
	if (self.UseScope == false) then
		if  self.SetNextFireMode2 >= CurTime() then
				if self.IronAjust == self.IronAjustMin then
					self.IronAjust = self.IronAjust + self.RecoilReturn
				end
		end
		if  self.SetNextFireMode2 < CurTime() then
				if self.IronAjust >= self.RecoilMax then
					self.IronAjust = self.IronAjust - self.RecoilReturn
				end
		end

		local OriginalOrigin = self.IronSightsPos
		self.VMLoc	= OriginalOrigin - Vector(0	,self.IronAjust,0)
	else
		self.VMLoc = self.IronSightsPos
	end
end

/*---------------------------------------------------------
DashingPos
---------------------------------------------------------*/
function SWEP:DashingPos()

		local DisableDashing = false

		if GetConVar("sv_ptp_dashing_disable") == nil then
		DisableDashing = false
		else
		DisableDashing = GetConVar("sv_ptp_dashing_disable"):GetBool()
		end

	if DisableDashing then return end

	if self.Owner:KeyPressed(IN_USE) then return end

		if self.Owner:KeyDown(IN_SPEED) then
			self.IronSightsPos	= self.DashArmPos
			self.IronSightsAng	= self.DashArmAng
			self.Weapon:SetNetworkedBool("Ironsights", true)
			self.SwayScale 	= 1.0
			self.BobScale 	= 2.2
			self.IronsightTime = 0.2
		end

		if self.Owner:KeyReleased(IN_SPEED) then
			self.Weapon:SetNextPrimaryFire( CurTime() + 0.3 )
			self.Weapon:SetNetworkedBool("Ironsights", false)
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end

		 if self.Owner:KeyPressed(IN_ATTACK2) then
self.IronSightsPos = self.AimSightsPos
self.IronSightsAng = self.AimSightsAng
end


end

local IRONSIGHT_TIME = 0.17
/*---------------------------------------------------------
   Name: GetViewModelPosition
   Desc: Allows you to re-position the view model
---------------------------------------------------------*/
function SWEP:GetViewModelPosition( pos, ang )

	if ( !self.IronSightsPos ) then return pos, ang end

	local bIron = self.Weapon:GetNetworkedBool( "Ironsights" )

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

		if (bIron) then
			self.SwayScale 	= 0.3
			self.BobScale 	= 0.01
		else
--			self.SwayScale 	= ptp_viewmodel_sway:GetInt()
--			self.BobScale 	= ptp_viewmodel_bob:GetInt()
		end

	end

	local fIronTime = self.fIronTime or 0

	if (!bIron && fIronTime < CurTime() - IRONSIGHT_TIME) then
		return pos, ang
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if (!bIron) then Mul = 1 - Mul end
	end


	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 	self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 	self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	-- pos = pos + self.VMLoc.x * Right * Mul
	-- pos = pos + self.VMLoc.y * Forward * Mul  --503 ошибка
	-- pos = pos + self.VMLoc.z * Up * Mul

	return pos, ang
end
SWEP.NextSecondaryAttack = 0

/*---------------------------------------------------------
SpreadSystem
---------------------------------------------------------*/
function SWEP:SpreadSystem()

	if self.Owner:OnGround() and (self.Owner:KeyDown(IN_FORWARD) or self.Owner:KeyDown(IN_BACK) or self.Owner:KeyDown(IN_MOVERIGHT) or self.Owner:KeyDown(IN_MOVELEFT)) then
		if self.Owner:KeyDown(IN_DUCK) then
			self.Primary.Cone = self.CrouchWalkCone
		elseif self.Owner:KeyDown(IN_SPEED) then
		self.Primary.Cone = self.AirCone
		else
			self.Primary.Cone = self.WalkCone
		end
	elseif self.Owner:OnGround() and self.Owner:KeyDown(IN_DUCK) then
		self.Primary.Cone = self.CrouchCone
	elseif not self.Owner:OnGround() then
		self.Primary.Cone = self.AirCone
	else
			self.Primary.Cone = self.StandCone
	end

	-- if self.Owner:KeyPressed(IN_SPEED) or self.Owner:KeyPressed(IN_JUMP) then
	-- self.Weapon:SetNetworkedBool("Ironsights", false)
	-- self.Weapon:SetNetworkedBool("Scope", false)
	-- self.Owner:SetFOV(0, 0.15)
	-- self.Primary.Recoil = self.Recoil
	-- end
	//Shift or Jump. Either will return the player to normal FOV, recoil and no ironsights.

	if self.Owner:KeyPressed(IN_ATTACK) then
		self:SetNWInt("LastClip", self.Weapon:Clip1())
	end
	if self.Owner:KeyReleased(IN_ATTACK) then
		self:SetNWFloat("SprayAdditive", 0)
	end


	if (game.SinglePlayer() ) then
		self:SetNWInt("sprecoil", 1.8)
		self:SetNWInt("mprecoil", 1)
	else
		self:SetNWInt("mprecoil", 1)
		self:SetNWInt("sprecoil", 1)
	end
end
/*---------------------------------------------------------
Sensibility
---------------------------------------------------------*/
local LastViewAng = false

local function SimilarizeAngles (ang1, ang2) --this function makes angle-play a little easier on the mind, damn the overhead I say

	ang1.y = math.fmod (ang1.y, 360)
	ang2.y = math.fmod (ang2.y, 360)

	if math.abs (ang1.y - ang2.y) > 180 then
		if ang1.y - ang2.y < 0 then
			ang1.y = ang1.y + 360
		else
			ang1.y = ang1.y - 360
		end
	end
end

local function ReduceScopeSensitivity (uCmd)

	if LocalPlayer():GetActiveWeapon() and LocalPlayer():GetActiveWeapon():IsValid() then
		local newAng = uCmd:GetViewAngles()
			if LastViewAng then
				SimilarizeAngles (LastViewAng, newAng)

				local diff = newAng - LastViewAng

				diff = diff * (LocalPlayer():GetActiveWeapon().MouseSensitivity or 1)
				uCmd:SetViewAngles (LastViewAng + diff)
			end
	end
	LastViewAng = uCmd:GetViewAngles()
end

hook.Add ("CreateMove", "RSS", ReduceScopeSensitivity)


/*---------------------------------------------------------
	SetIronsights
---------------------------------------------------------*/
function SWEP:SetIronsights( b )

	self.Weapon:SetNetworkedBool( "Ironsights", b )
--	if self.Owner:KeyDown(IN_USE) then return end  -- прыжок ч2
	if (self.UseScope == true) then
		if self.Weapon:GetNetworkedBool( "Ironsights", true ) then
			self.Weapon:SetNetworkedBool("Scope", true)
			self.Owner:SetFOV(80/self.ScopeZoom, 0.35)
			if (self.OnlyIron == false) then
			self.Weapon:EmitSound("weapons/universal/zoom.wav")
			else
			self.Weapon:EmitSound("weapons/universal/iron_in.wav")
			end
		else
			self.Owner:SetFOV(0, 0.2)
			self.Weapon:SetNetworkedBool("Scope", false)
			if !self.Owner:KeyDown(IN_ATTACK) then
				if (self.OnlyIron == false) then
					self.Weapon:EmitSound("weapons/universal/zoom.wav")
				else
					self.Weapon:EmitSound("weapons/universal/iron_out.wav")
				end
			end
		end
	else
		if self.Weapon:GetNetworkedBool( "Ironsights", true ) then
			self.Owner:SetFOV(70, 0.15)
			self.BobScale = 0.1
			self.Weapon:EmitSound("weapons/universal/iron_in.wav")
		else
			self.Owner:SetFOV(0, 0.15)
			if !self.Owner:KeyDown(IN_ATTACK) then
				self.Weapon:EmitSound("weapons/universal/iron_out.wav")
			end
		end
	end
end

SWEP.NextSecondaryAttack = 0

/*---------------------------------------------------------
Reload
---------------------------------------------------------*/
function SWEP:Reload()

	if self.Owner:KeyDown(IN_ATTACK) then return end

	if( self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 || self.Weapon:Clip1() >= self.Primary.ClipSize)	then return end
	//Why go through the function is dis nigga got no reserve, aswell a full clip?

	timer.Simple(self.ReloadHolster + .2,
		function()
		if self.Weapon == nil then return end
		self:SetNWInt("skipthink", false)
	end)
	//Just waiting for the reload to finish before we can think again

	if ( self.Reloadaftershoot > CurTime() ) then return end
	//If you're firing, you can't reload


	if self.Weapon:GetNetworkedBool("Silenced") == true then
			self.Weapon:DefaultReload( ACT_VM_RELOAD_SILENCED );
		else
			self.Weapon:DefaultReload( ACT_VM_RELOAD );
		end
	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then

		self.Weapon:SetNetworkedBool("Ironsights", false)
		//Set the ironsight to false

		self:SetScope(false, self.Owner)
		//Set Scope to false

		self:SetWeaponHoldType( self.HoldType )
		//Make sure that holdtypes dont get mixed and masshshed and stuff

		if CLIENT or SERVER then
		self.Owner:SetFOV( 0, 0.15 )
		end
		//Set the Fov back to normal if zoomed

		self.MouseSensitivity = 1
		//Set MouseSens Back to one

				if (game.SinglePlayer()) then
			self:SetNWInt("skipthink", true)
				timer.Create("ReloadTimer", self.ReloadHolster + .2, 1,
				function()
					if self.Weapon == nil then return end
				self:SetNWInt("skipthink", false)
			end)
		end
		//Skip the entire Think Function in Single player. This is not needed in Multiplayer.

		if timer.Exists("BoltTimer") then
			timer.Destroy("BoltTimer")
		end

		if not CLIENT then
			self.Owner:DrawViewModel(true)
		end
	end
	return true
end

/*---------------------------------------------------------
Deploy
---------------------------------------------------------*/
function SWEP:Deploy()

	if self.Weapon:GetNetworkedBool("Silenced") == true then
			self.Weapon:SendWeaponAnim( ACT_VM_DRAW_SILENCED );
		else
			self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	end

	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self:SetScope(false, self.Owner)
	self.Reloadaftershoot = CurTime() + 1

	if timer.Exists("ReloadTimer") then
		timer.Destroy("ReloadTimer")
	end
	//Destroy the faggot timer on deploy if its running.

	self:SetNWInt("skipthink", false)

	return true
end

/*---------------------------------------------------------
   Name: SWEP:CSShootBullet( )
---------------------------------------------------------*/
function SWEP:CSShootBullet( dmg, recoil, numbul, cone, flash )

	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01

	local ang = self.Owner:GetAimVector()
		  ang = Vector(ang.x, ang.y, ang.z + (math.abs(self:GetNWFloat("SprayAdditive"))* .001 * 5))

	local bullet = {}
	bullet.Num 		= numbul
	bullet.Src 		= self.Owner:GetShootPos()					// Source
	bullet.Dir 		= ang										// Dir of bullet
	bullet.Spread 	= Vector( cone, cone, 0 )					// Aim Cone
	bullet.Tracer	= self.TracerShot							// Show a tracer on every x bullets
	bullet.Force	= self.BulletForce/25						// Amount of force to give to phys objects
	bullet.Damage	= dmg

	self.Owner:FireBullets( bullet )
	self.Owner:MuzzleFlash()							// Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 ) 					//3rd Person Animation

	if ((self.Weapon:GetNetworkedBool("Ironsights") == true) && (self.StockIronSightAnim == true)) then
		if self.Weapon:GetNetworkedBool("Silenced") == false then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		end
	end
	if (self.Weapon:GetNetworkedBool("Ironsights") == false)then
		if self.Weapon:GetNetworkedBool("Silenced") == false then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		end
	end
	if ((self.Weapon:GetNetworkedBool("Ironsights") == true) && (self.StockIronSightAnim == false)) then
	end

	if (self.Weapon:GetNetworkedBool("pap", true) and self.BoltAction) then
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		self.Owner:GetViewModel():SetPlaybackRate(1.7)
		local waitdammit = (self.Owner:GetViewModel():SequenceDuration())
		self.Delay = self.Delay / 1.7
		self.Weapon:SetNextPrimaryFire( CurTime() + (waitdammit / 1.7) - 0.15 )

		if (SERVER) then
			local eyetrace = self.Owner:GetEyeTrace();
			local explo = ents.Create( "env_explosion" )
			explo:SetPos( eyetrace.HitPos )
			explo:SetOwner( self.Owner )
			explo:SetKeyValue( "iMagnitude", "40" )
			explo:SetKeyValue( "iRadiusOverride", 250 )
			explo:Spawn()
			explo:Activate()
			explo:Fire( "Explode", "", 0 )
		end
	end


	local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)

		util.Effect(flash,fx)


	// CUSTOM RECOIL !
	if ( (game.SinglePlayer() && SERVER) || ( !game.SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then

		local eyeang = self.Owner:EyeAngles()
		eyeang.pitch = eyeang.pitch - (recoil/2) //Dont mess with this.
		self.Owner:SetEyeAngles( eyeang )

	end

end

--/*---------------------------------------------------------
--IronSight
---------------------------------------------------------*/
--function SWEP:IronSight()

	--if !self.Owner:OnGround() then return end

	--if self.Owner:KeyDown(IN_USE) then return end

	--if self.Owner:KeyDown(IN_SPEED) then return end

	--if !self.Owner:KeyDown(IN_USE) then
	-- If the key E (Use Key) is not pressed, then

		--if self:GetNWInt("ironsighttoggle", true) then return end
		--if self.Owner:KeyDown(IN_ATTACK2) and not self.Weapon:GetNetworkedBool("Scope", true )then
		-- When the right click is pressed, then

			--self:SetIronsights(true, self.Owner)
			--self:SetNWInt("ironsighttoggle", true) // This sets the ironsighttoggle, which is above, to skip the function until the timer below resets to not skip.
			//Set the ironsight true				--// Basicly if you tap, its toggle. If you hold its hold. This is being held off for now.

			--timer.Simple(0.1,
		--function()
		--if self.Weapon == nil then return end
		--self:SetNWInt("ironsighttoggle", false)
		--end)
			--if CLIENT then return end
 		--end
	--end

	--if self.Owner:KeyReleased(IN_ATTACK2) then
	-- If the right click is released, then
		--self:SetIronsights(false, self.Owner)

		--if CLIENT then return end
	--end
--end

/*---------------------------------------------------------
	SecondaryAttack
-----------------------------------------------------------*/
function SWEP:SecondaryAttack()

	if self.Owner:KeyDown(IN_USE) and  (self.Silenceable) then

		self:SetNWInt("skipthink", true)
		timer.Simple(self.SilenceHolster,
			function()
				if self.Weapon == nil then return end
				self:SetNWInt("skipthink", false)
			end)
			//Skip the entire Think Function

		self.Weapon:SetNetworkedBool( "Ironsights", false)
		//Set the ironsight to false
		if CLIENT or SERVER then
		self.Owner:SetFOV(0, 0.35)
		end
		self:Silence()
	end

	-- if not self.Owner:OnGround() then return end
	-- if self.Owner:KeyDown(IN_SPEED) then return end --- прыжок прицел
	-- if self.Owner:KeyDown(IN_USE) then return end

	if ( self.NextSecondaryAttack > CurTime() ) then return end

	bIronsights = !self.Weapon:GetNetworkedBool( "Ironsights", false )

	self:SetIronsights( bIronsights )

	self.IronSightsPos	= self.AimSightsPos
	self.IronSightsAng	= self.AimSightsAng

	self.NextSecondaryAttack = CurTime() + 0.3
end


SWEP.OnlyIron = false
/*---------------------------------------------------------
SetScope
---------------------------------------------------------*/
function SWEP:SetScope(b, player)
if CLIENT then return end

	local PlaySound = b ~= self.Weapon:GetNetworkedBool("Scope", not b) -- Only play zoom sounds when chaning in/out of scope mode
	self.CurScopeZoom = 1 -- Just in case...


	if self.Weapon:GetNetworkedBool("Scope") then
		if (self.OnlyIron == false) then
				self.Owner:DrawViewModel(false)
		end
	else
	self.Owner:DrawViewModel(true)
	end
	self.Weapon:SetNetworkedBool("Scope", b)
end