-- locallocal IsSingleplayer = false
local ToggleZoom = true

-- Weapon Information
SWEP.Category				= "Other" 												
SWEP.PrintName				= "Burger's Base" 							
SWEP.Base					= "weapon_base" 						
SWEP.BurgerBase				= true 									
SWEP.WeaponType				= "Primary"									
SWEP.Cost					= 2500										
SWEP.CSSMoveSpeed			= 221	
SWEP.CSSZoomSpeed			= -1	

			

-- Spawning
SWEP.Spawnable				= false										
SWEP.AdminOnly				= false										

-- Slots
SWEP.Slot					= 3											
SWEP.SlotPos				= 1											
SWEP.Weight					= 0											
SWEP.AutoSwitchTo			= false										
SWEP.AutoSwitchFrom			= false										

-- Worldmodel
SWEP.WorldModel				= "models/weapons/w_rif_ak47.mdl"	
SWEP.DisplayModel			= nil				
SWEP.HoldType				= "ar2"

-- Viewmodel
SWEP.SwayScale 				= 0
SWEP.BobScale 				= 0
SWEP.ViewModel 				= "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.ViewModelFlip 			= false
SWEP.UseHands				= true
SWEP.IgnoreScopeHide		= false
SWEP.AddFOV					= 0

-- Bullet Information
SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= nil
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.BulletEnt				= nil -- Bullet Entity that is Spawned
SWEP.SourceOverride 		= Vector(0,0,0) -- Projectile Spawn Offset
SWEP.BulletAngOffset		= Angle(0,0,0) -- Rotate the Projectile by this amount

-- General Weapon Statistics
SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.SideRecoilBasedOnDual	= false
SWEP.RecoilSpeedMul			= 1
SWEP.MoveConeMul			= 1
SWEP.HeatMul				= 1
SWEP.MaxHeat 				= 10
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1


SWEP.SideRecoilBasedOnDual	= false

SWEP.PenetrationLossMul		= 1
SWEP.FatalHeadshot			= false
SWEP.TracerType				= 1
SWEP.DamageFalloff			= 3000
SWEP.ReloadTimeAdd			= 0


SWEP.RandomSeed				= 0

SWEP.ShootOffsetStrength	= Angle(0,0,0) -- Recoil for OP Snipers

-- Sounds
SWEP.ZoomInSound			= Sound("weapons/zoom.wav")
SWEP.ZoomOutSound			= Sound("weapons/zoom.wav")
SWEP.ReloadSound 			= nil
SWEP.BurstSound				= nil
SWEP.LastBulletSound		= nil
SWEP.PumpSound				= nil
SWEP.MeleeSoundMiss			= Sound("weapons/foot/foot_fire.wav")
SWEP.MeleeSoundWallHit		= Sound("weapons/foot/foot_kickwall.wav")
SWEP.MeleeSoundFleshSmall	= Sound("weapons/foot/foot_kickbody.wav")
SWEP.MeleeSoundFleshLarge	= Sound("weapons/foot/foot_kickbody.wav")

-- Features
SWEP.HasIronSights 			= true
SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasSpecialFire			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasSideRecoil			= false
SWEP.HasDownRecoil			= false
SWEP.HasFirstShotAccurate	= false
SWEP.CanShootWhileSprinting	= true

SWEP.HasBuildUp				= false -- Uses Minigun Buildup
SWEP.UsesBuildUp			= false -- Uses Buildup for Custom Reasons
SWEP.BuildUpAmount			= 10
SWEP.BuildUpCoolAmount 		= 50

SWEP.HasIdle				= false
SWEP.IdleOffset 			= 0

SWEP.DisableReloadUntilEmpty = false
SWEP.IgnoreDrawDelay		= false
SWEP.EnableDropping 		= true

-- Burst Settings
SWEP.BurstSpeedOverride 	= 1
SWEP.BurstConeMul			= 1
SWEP.BurstHeatMul			= 1
SWEP.BurstZoomMul			= 1
SWEP.BurstRecoilMul			= 1
SWEP.BurstOverride			= 3
SWEP.BurstCoolMul			= 1
SWEP.BurstSpeedAbs			= nil
SWEP.BurstAnimationOverride = nil
SWEP.BurstAnimationOnce		= false

-- Grenade
SWEP.HasPreThrow			= true

-- Melee
SWEP.MeleeDamage			= 50
SWEP.EnableBlocking			= false
SWEP.MeleeDelay				= 0.1
SWEP.MeleeDamageType		= DMG_CLUB

-- Zooming
SWEP.HasIronCrosshair		= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-3, 20, 0)
SWEP.IronSightsAng 			= Vector(1.25, 1, 0)
SWEP.ZoomAmount 			= 1
SWEP.ZoomDelay				= 0
SWEP.ZoomTime				= 0.5

-- Scope
SWEP.HasScope 				= false
SWEP.EnableDefaultScope		= true
SWEP.CustomScope 			= nil
SWEP.CustomScopeSOverride	= nil
SWEP.CustomScopeCOverride	= Color(0,0,0,255)
SWEP.ColorOverlay			= Color(0,0,0,0) -- Color Overlay when Zoomed

-- Crosshair
SWEP.HasCrosshair 			= true
SWEP.CrosshairOverrideMat	= nil
SWEP.CrosshairOverrideSize	= nil

-- Tracers
SWEP.EnableCustomTracer		= true
SWEP.CustomShootEffectsTable = nil
SWEP.DamageType				= 1

-- Magazine Mod
SWEP.MagDelayMod			= 0.75
SWEP.MagMoveMod 			= Vector(0,0,0)
SWEP.MagAngMod				= Angle(0,0,0)

-- PLEASE TEST
SWEP.DelayOverride			= false

-- Not really used anymore but w/e
SWEP.Author					= "Burger"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""
SWEP.CSMuzzleFlashes 		= true
SWEP.CSMuzzleX				= false

-- Base Exclusive Stuff
SWEP.Primary.DefaultClip	= 0 -- Unused
SWEP.Secondary.Ammo 		= "none"
SWEP.Secondary.SpareClip	= 0
SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic	= false
SWEP.DrawAmmo				= true
SWEP.DrawCrosshair			= false

SWEP.CustomScopeSizeMul		= 1


SWEP.RichochetSound = {}
SWEP.RichochetSound[1] = Sound("weapons/fx/rics/ric1.wav")
SWEP.RichochetSound[2] = Sound("weapons/fx/rics/ric2.wav")
SWEP.RichochetSound[3] = Sound("weapons/fx/rics/ric3.wav")
SWEP.RichochetSound[4] = Sound("weapons/fx/rics/ric4.wav")
SWEP.RichochetSound[5] = Sound("weapons/fx/rics/ric5.wav")

util.PrecacheSound("weapons/fx/rics/ric1.wav")
util.PrecacheSound("weapons/fx/rics/ric2.wav")
util.PrecacheSound("weapons/fx/rics/ric3.wav")
util.PrecacheSound("weapons/fx/rics/ric4.wav")
util.PrecacheSound("weapons/fx/rics/ric5.wav")


if (CLIENT or game.SinglePlayer()) then
	SWEP.IsZoomed 			= false -- Data, Client
	SWEP.PunchAngleUp 		= Angle(0,0,0) -- Data, Client
	SWEP.PunchAngleDown 	= Angle(0,0,0) -- Data, Client
	SWEP.ClientCoolDown 	= 0	-- Data, Client
	SWEP.ClientCoolTime 	= 0 -- Data, Client
	SWEP.ClientCoolDownLeft = 0	-- Data, Client
	SWEP.ClientCoolTimeLeft = 0 -- Data, Client
	SWEP.StoredCrosshair 	= nil -- Data, Client
	SWEP.BoltDelay 			= 0 -- Data, Client
	SWEP.DesiredFOV			= GetConVar("fov_desired"):GetFloat() or 70 -- Data, Client
	SWEP.ZoomOverlayDelay 	= 0 -- Data, Client
	SWEP.ZoomMod 			= 0 -- Data, Client
end

if SERVER then
	SWEP.AlreadyGiven			= false -- Data, Server
	SWEP.HasMagIn				= true -- Data, Server
	SWEP.DesiredFOV				= 70
end

SWEP.MeleeModel = Model("models/weapons/c_arms_cstrike.mdl")


SWEP.IronDualSpacing 	= 1

SWEP.IronSightPosCurrent = Vector(0,0,0)
SWEP.IronSightAngCurrent = Angle(0,0,0)

SWEP.IronRunPos				= Vector(0,-5,-20)
SWEP.IronRunAng				= Vector(45,10,0)

SWEP.IronMeleePos			= Vector(0,0,0)
SWEP.IronMeleeAng			= Vector(0,0,0)

SWEP.IronShootPos			= Vector(0,0,0)
SWEP.IronShootAng			= Vector(0,0,0)



SWEP.VelAdd					= 0

SWEP.BulletDelay = 0


SWEP.DryFireSound = Sound("weapons/clipempty_pistol.wav")

SWEP.PumpAnimation = ACT_SHOTGUN_PUMP

if CLIENT or game.SinglePlayer() then
	SWEP.DynamicScopeDesiredOffsetX = 0
	SWEP.DynamicScopeDesiredOffsetY = 0
	SWEP.DynamicScopeOffsetX = 0
	SWEP.DynamicScopeOffsetY = 0
	
	SWEP.ScopeMoveTime = 0
	SWEP.ScopeMoveTimeStored = 0
end

SWEP.CanCook = false
SWEP.FuseTime = 5
SWEP.HasDurability = false
SWEP.DurabilityPerHit = -10

function SWEP:SetupDataTables() -- Shared

	self:NetworkVar("Float",0,"CoolDown")
	self:SetCoolDown(0)
	self:NetworkVar("Float",1,"CoolTime")
	self:SetCoolTime(0)
	self:NetworkVar("Float",2,"NextShell")
	self:SetNextShell(0)
	self:NetworkVar("Float",3,"ReloadFinish")
	self:SetReloadFinish(0)
	self:NetworkVar("Float",4,"AttachDelay")
	self:SetAttachDelay(0)
	self:NetworkVar("Float",5,"NextFireDelay")
	self:SetNextFireDelay(0)
	self:NetworkVar("Float",6,"BuildUp")
	self:SetBuildUp(0)
	self:NetworkVar("Float",7,"NextHL2Pump")
	self:SetNextHL2Pump(0)
	self:NetworkVar("Float",8,"ThrowDelay")
	self:SetThrowDelay(0)
	self:NetworkVar("Float",9,"ThrowRemoveTime")
	self:SetThrowRemoveTime(0)
	self:NetworkVar("Float",10,"ThrowTime")
	self:SetThrowTime(0)
	self:NetworkVar("Float",11,"NextHolster")
	self:SetNextHolster(-1)
	self:NetworkVar("Float",12,"NextIdle")
	self:SetNextIdle(0)
	self:NetworkVar("Float",13,"NextMelee")
	self:SetNextMelee(0)
	self:NetworkVar("Float",14,"NextMeleeDamage")
	self:SetNextMeleeDamage(0)
	self:NetworkVar("Float",15,"BulletsPerSecond")
	self:SetBulletsPerSecond(0)
	self:NetworkVar("Float",16,"ClashTime")
	self:SetClashTime(0)
	self:NetworkVar("Float",17,"ScopeOffsetX")
	self:SetScopeOffsetX(0)
	self:NetworkVar("Float",18,"ScopeOffsetY")
	self:SetScopeOffsetY(0)
	self:NetworkVar("Float",19,"SharedZoomOverlayDelay")
	self:SetSharedZoomOverlayDelay(0)
	self:NetworkVar("Float",20,"SharedZoomMod")
	self:SetSharedZoomMod(0)
	self:NetworkVar("Float",21,"SharedBoltDelay")
	self:SetSharedBoltDelay(0)
	self:NetworkVar("Float",22,"GrenadeExplosion")
	self:SetGrenadeExplosion(0)
	self:NetworkVar("Float",23,"CoolDownLeft")
	self:SetCoolDownLeft(0)
	self:NetworkVar("Float",24,"CoolTimeLeft")
	self:SetCoolTimeLeft(0)
	self:NetworkVar("Float",25,"BulletQueue")
	self:SetBulletQueue(0)
	self:NetworkVar("Float",26,"BulletQueueDelay")
	self:SetBulletQueueDelay(0)

	self:NetworkVar("Float",31,"SpecialFloat") -- For Special Stuff
	self:SetSpecialFloat(0)

	self:NetworkVar("Int",0,"FireQueue")
	self:SetFireQueue(0)	
	self:NetworkVar("Int",1,"PrimaryAmmo")
	self:SetPrimaryAmmo( game.GetAmmoID(self.Primary.Ammo) )
	self:NetworkVar("Int",2,"SecondaryAmmo")
	self:SetSecondaryAmmo( game.GetAmmoID(self.Secondary.Ammo) )
	
	self:NetworkVar("Int",31,"SpecialInt")
	self:SetSpecialInt(0)

	self:NetworkVar("Bool",0,"IsReloading")
	self:SetIsReloading( false )
	self:NetworkVar( "Bool",1,"IsBurst" )
	if self.AlwaysBurst then 
		self:SetIsBurst( true )
	else
		self:SetIsBurst( false )
	end
	self:NetworkVar("Bool",2,"IsShotgunReload")
	self:SetIsShotgunReload( false )
	self:NetworkVar("Bool",3,"IsSilenced")
	self:SetIsSilenced( false )
	self:NetworkVar("Bool",4,"IsNormalReload")
	self:SetIsNormalReload( false )
	self:NetworkVar("Bool",5,"IsLeftFire")
	self:SetIsLeftFire( false )
	self:NetworkVar("Bool",6,"IsBlocking") -- For Special Stuff
	self:SetIsBlocking( false )
	self:NetworkVar("Bool",7,"NeedsHL2Pump")
	self:SetNeedsHL2Pump( false )
	self:NetworkVar("Bool",8,"CanHolster")
	self:SetCanHolster( true )
	self:NetworkVar("Bool",9,"IsThrowing")
	self:SetIsThrowing( false )
	self:NetworkVar("Bool",10,"QueueHolster")
	self:SetQueueHolster( false )
	self:NetworkVar("Bool",11,"ForceHolster")
	self:SetForceHolster( false )
	self:NetworkVar("Bool",12,"SharedZoom")
	self:SetSharedZoom( false )
	self:NetworkVar("Bool",13,"ShouldMelee")
	self:SetShouldMelee( false )
	self:NetworkVar("Bool",14,"IsAttacking")
	self:SetIsAttacking( false )
	
	self:NetworkVar("Bool",31,"SpecialBool")
	self:SetSpecialBool( false )
	
	self:NetworkVar("Entity",1,"NextHolsterWeapon")
	self:SetNextHolsterWeapon( nil )
	self:NetworkVar("Entity",2,"NextMeleeEnt")
	self:SetNextMeleeEnt( nil )
	

	self:NetworkVar("Angle",1,"SharedTrueAimAng")
	self:SetSharedTrueAimAng( Angle(0,0,0) )	

end

function SWEP:Initialize() -- shared

	if game.SinglePlayer() then
		IsSingleplayer = true
	end

	if CLIENT then
	
		if not self.Owner.BURGERBASE_ZoomMul then
			self.Owner.BURGERBASE_ZoomMul = {}
		end
		
		if not self.Owner.BURGERBASE_ZoomMul[self:GetClass()] then
			self.Owner.BURGERBASE_ZoomMul[self:GetClass()] = 1
		end
		
	end	

	if CLIENT or IsSingleplayer then
		if BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_customslots",true):GetFloat() == 1 then
			if self.WeaponType == "Primary" then
				self.Slot = 2
			elseif self.WeaponType == "Secondary" then
				self.Slot = 1
			end
		end
	end
	
	if SERVER then

		if not self.GetMagModel then
			self.GetMagModel = string.Replace( self.WorldModel,"/w_" , "/unloaded/" )
			self.GetMagModel = string.Replace( self.GetMagModel , ".mdl" , "_mag.mdl")
		end

		if file.Exists(self.GetMagModel,"GAME") then
			self.GetMagModel = Model(self.GetMagModel)
		else
			self.GetMagModel = nil
		end
		
	end

	self:SpecialInitialize()
	
	if SERVER and self.Owner:IsNPC() then
		self:NPCInit()
	end
	
	if self.Owner:IsPlayer() then
		self:SCK_Initialize()
	end
	
end

function SWEP:NPCInit() -- shared
	self.Owner:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
end

function SWEP:GetCapabilities() -- shared
	return bit.bor( CAP_WEAPON_RANGE_ATTACK1, CAP_INNATE_RANGE_ATTACK1 )
end

function SWEP:SpecialInitialize() -- shared

end

function SWEP:OwnerChanged() -- shared
	if SERVER then
		timer.Simple(FrameTime(), function()
			if not self.AlreadyGiven then
				if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_ammo_loaded"):GetFloat() == 1 then
					-- self:SetClip1(self.Primary.ClipSize)
				end
				-- self:EquipAmmo(self.Owner)
				-- self.AlreadyGiven = true
			end		
		end)	
	end
end

function SWEP:SendWeaponAnimation(act,vm_index,rate) -- Thanks to the wiki for the idea -- Shared

	if not vm_index then
		vm_index = 0
	end
	
	if not rate then
		rate = 1
	end
	
	--print(self.AnimationRateTable[act] or 1)
	
	rate = rate * (self.AnimationRateTable[act] or 1)

	local ViewModel = self.Owner:GetViewModel( vm_index )

	if !IsValid(ViewModel) then
		return
	end

	local Sequence = ViewModel:SelectWeightedSequence( act )

	if ( Sequence == -1 ) then
		return
	end

	ViewModel:SendViewModelMatchingSequence( Sequence )
	ViewModel:SetPlaybackRate( rate )
	self:SetNextIdle(CurTime() + self:GetTrueSequenceDuration())

end

function SWEP:SendSequence(anim,vm_index,rate) -- Shared

	if not vm_index then
		vm_index = 0
	end
	
	if not rate then
		rate = 1
	end

	local ViewModel = self.Owner:GetViewModel( vm_index )

	if !IsValid(ViewModel) then
		return
	end
	
	ViewModel:SendViewModelMatchingSequence( ViewModel:LookupSequence( anim ) )
	ViewModel:SetPlaybackRate( rate )
	self:SetNextIdle(CurTime() + self:GetTrueSequenceDuration())
	
end

function SWEP:SendSequencePlayer(anim) -- Shared
	local Seq = self.Owner:LookupSequence(anim)
	local SeqDur = self.Owner:SequenceDuration(Seq)
	self.Owner:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, Seq, 0, true )
	return SeqDur
end

function SWEP:DrawAnimation() -- Shared
	if not self.IgnoreDrawDelay then
		if self.HasSilencer then
			if self:GetIsSilenced() then
				self:SendWeaponAnimation(ACT_VM_DRAW_SILENCED)
				self.WorldModel = self.WorldModel2
			else
				self:SendWeaponAnimation(ACT_VM_DRAW)
				self.WorldModel = self.WorldModel1
			end
		else
			--[[
			if self.HasDryFire and self:Clip1() == 0 then
				print("HI")
				self:SendWeaponAnimation(ACT_VM_DRAW_EMPTY)
			else
			--]]
				self:SendWeaponAnimation(ACT_VM_DRAW)
			--end
		end	
	else
		self:SendWeaponAnimation(ACT_VM_RELOAD)
		self:EmitGunSound(self.ReloadSound)
	end
end


function SWEP:Deploy() -- Shared

	if IsSingleplayer then
		if not self.Owner.BURGERBASE_ZoomMul then
			self.Owner.BURGERBASE_ZoomMul = {}
		end
		if not self.Owner.BURGERBASE_ZoomMul[self:GetClass()] then
			self.Owner.BURGERBASE_ZoomMul[self:GetClass()] = 1
		end
	end	

	self:SetZoomed(false)
	self:CheckInventory()

	if IsValid(self.Owner:GetHands()) then
		self.Owner:GetHands():SetMaterial("")
	end
	
	self.Owner:DrawViewModel(true)
	self:DrawAnimation()

	if self.WeaponType ~= "Throwable" then
		self:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration() )
	end
	
	self:SpecialDeploy()
	
	return true
	
end

function SWEP:SpecialDeploy() -- Shared

end

function SWEP:CheckInventory() -- Shared
	if SERVER then
		if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_limit_equipped"):GetFloat() == 1 then
			for k,v in pairs (self.Owner:GetWeapons()) do
				if v.BurgerBase ~= nil then
					if v ~= self then
						if self.WeaponType == v.WeaponType and not (v.WeaponType == "Free" or v.WeaponType == "Throwable" or v.WeaponType == "Melee") then
							BURGERBASE_FUNC_DropWeapon(self.Owner,v)
						end
					end
				end
			end
		elseif BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_limit_equipped"):GetFloat() == 2 then
			for k,v in pairs (self.Owner:GetWeapons()) do
				if v.BurgerBase ~= nil then
					if v ~= self then
						if self.Slot == v.Slot and not (v.WeaponType == "Free" or v.WeaponType == "Throwable" or v.WeaponType == "Melee") then
							BURGERBASE_FUNC_DropWeapon(self.Owner,v)
						end
					end
				end
			end
		end
	end
end

function SWEP:SpecialHolster() -- Shared

end

function SWEP:Holster(nextweapon) -- Shared

	if not self:GetCanHolster() then return false end
	
	self:CancelReload()
	self:SetZoomed(false)
	self:SpecialHolster()

	if self.HasHolster then
	
		if self:GetForceHolster() then
		
			self:SCK_Holster()
			self:SetForceHolster(false)
			
			return true
			
		elseif self:GetQueueHolster() then
		
			self:SCK_Holster()
			
			local NextWeapon = self:GetNextHolsterWeapon()
			self:SetNextHolsterWeapon( nil )
			self:SetQueueHolster( false )
			self:SetNextHolster( -1 )
			self:SetForceHolster(true)
			
			if SERVER then
				if self.Owner and self.Owner ~= NULL and NextWeapon and NextWeapon ~= NULL then
					self.Owner:SelectWeapon( NextWeapon:GetClass() )
				end
			end
			
			return false
			
		else
		
			self:SetQueueHolster( true )
			self:SendWeaponAnimation( ACT_VM_HOLSTER )
			
			if self.Owner and self.Owner ~= NULL and self.Owner:GetViewModel() and self.Owner:GetViewModel() ~= NULL then
				local ViewDur = self:GetTrueSequenceDuration()
				self:SetNextHolster( CurTime() + ViewDur )
				self:SetNextPrimaryFire(CurTime() + ViewDur )
			end
			
			if SERVER then
				self:SetNextHolsterWeapon(nextweapon)
			end	
			
			return false
			
		end
	end

	if CLIENT then
		self:SCK_Holster()
	end
	
	return true
	
end

function SWEP:HolsterThink() -- Shared
	if SERVER then
		if self.HasHolster and self:GetQueueHolster() then
			if self:GetNextHolster() <= CurTime() then
				self:Holster(  self:GetNextHolsterWeapon() )
			end
		end
	end
end

function SWEP:SetZoomed(shouldzoom) -- Shared
	self:SetSharedZoom(shouldzoom)
	self.IsZoomed = shouldzoom
end

function SWEP:GetZoomed() -- Shared
	if IsSingleplayer or SERVER then
		return self:GetSharedZoom()
	else
		return self.IsZoomed
	end
end

function SWEP:SetZoomOverlayDelay(num) -- Shared
	self:SetSharedZoomOverlayDelay(num)
	self.ZoomOverlayDelay = num
end

function SWEP:GetZoomOverlayDelay() -- Shared
	if IsSingleplayer or SERVER then
		return self:GetSharedZoomOverlayDelay()
	else
		return self.ZoomOverlayDelay
	end
end

function SWEP:GetZoomMod() -- Shared
	if IsSingleplayer or SERVER then
		return self:GetSharedZoomMod()
	else
		return self.ZoomMod
	end
end

function SWEP:SetZoomMod(num) -- Shared
	self:SetSharedZoomMod(num)
	self.ZoomMod = num
end

function SWEP:SetBoltDelay(num) -- Shared
	self.BoltDelay = num
	self:SetSharedBoltDelay(num)
end

function SWEP:GetBoltDelay() -- Shared
	if IsSingleplayer or SERVER then
		return self:GetSharedBoltDelay()
	else
		return self.BoltDelay
	end
end

SWEP.FireAlwaysAnimate = false

function SWEP:CanQuickThrow() -- Shared
	return true
end

function SWEP:QuickThrowOverride() -- Shared

end

function SWEP:PrimaryAttack() -- Shared

	if not self:CanShoot() then return end
	if self:IsUsing() then
		if not self:CanQuickThrow() then
			self:QuickThrowOverride()
		end
		return 
	end
	if not self:HasPrimaryAmmoToFire() then
		if self.FireAlwaysAnimate then
			self:HandleShootAnimations()
		end
	end
	if not self:CanPrimaryAttack() then	return end

	self:WeaponDelay() -- don't predict, has delay
	self:HandleBurstDelay() -- don't predict		
	self:AfterPump() -- don't predict, has animations

	if self.BulletDelay > 0 then
		if self.BulletDelaySound then
			self:EmitGunSound(self.BulletDelaySound)
		end
		self:SetNextFireDelay(CurTime() + self.BulletDelay )
		self:SetFireQueue(1)
	else
		self:ShootGun() -- don't predict, has firebullets
	end
	
end

function SWEP:ShootGun(ammototake) -- Shared

	if not ammototake then
		ammototake = 1
	end

	--[[
	if !self.HasBurst or !self:GetIsBurst() or !self.BurstAnimationOnce then
		self:HandleShootAnimations() -- don't predict, has animations
	end
	--]]
	
	if !(self.HasBurstFire and self:GetIsBurst() and self.BurstAnimationOnce) then
		--print(self.HasBurstFire, self:GetIsBurst(), self.BurstAnimationOnce)
		self:HandleShootAnimations()
	end
	
	
	self:TakePrimaryAmmo(ammototake)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Owner:MuzzleFlash()
	
	local Damage = self:SpecialDamage(self.Primary.Damage)
	local Shots = self:SpecialShots( self.Primary.NumShots )
	local Cone = 0
	if IsFirstTimePredicted() then
		Cone = self:HandleCone(self.Primary.Cone,false, (self.HasDual and self:GetIsLeftFire()) )
	end
	
	self:SetBulletsPerSecond( self:GetBulletsPerSecond() + 1 )
	self:PreShootBullet(Damage,Shots,Cone) -- don't predict

	if IsFirstTimePredicted() or IsSingleplayer then
		if self.HasBuildUp or self.UsesBuildUp then
			self:SetBuildUp( math.Clamp(self:GetBuildUp() + self.BuildUpAmount - (self:GetBuildUp()/10) ,0,100 ) )
		end
		self:AfterZoom() -- Predict, Client Only
		self:AddRecoil() -- Predict
		self:WeaponSound() -- Predict
		self:AddHeat(Damage,Shots)
	end

	self:PostPrimaryFire()

end

function SWEP:HandleShootAnimations() -- Shared

	if self.BurstAnimationOverride and self:GetIsBurst() then
		self:WeaponAnimation(self:Clip1(),self.BurstAnimationOverride)
	elseif self.HasDual then
		if self:GetIsLeftFire() then
			self:WeaponAnimation(self:Clip1(),ACT_VM_SECONDARYATTACK)
			self:SetIsLeftFire(false)
		else
			self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
			self:SetIsLeftFire(true)
		end
	else
		self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	end
	
end

function SWEP:CanShoot() -- Shared
	if self:IsBusy() then return false end
	if not self.CanShootWhileSprinting and self:IsSprinting() then return false end
	if self.WeaponType == "Throwable" then 
		self:PreThrowObject() 
		return false 
	end
	return true
end

function SWEP:AfterPump() -- Shared

	if self.HasPumpAction and self.HasHL2Pump then
		self:SetNextPrimaryFire(CurTime() + 10)
		self:SetNeedsHL2Pump(true)
		self:SetNextHL2Pump(CurTime() + self.Primary.Delay)
	end

	if self:GetIsShotgunReload() then
		self:SetIsShotgunReload(false)
		self:SetIsReloading(false)
		self:SendWeaponAnimation( ACT_SHOTGUN_RELOAD_FINISH )
		self:SetNextPrimaryFire(CurTime() + self:GetTrueSequenceDuration())	
	end
	
end

function SWEP:HandleBurstDelay() -- Shared
	if self.HasBurstFire or self.AlwaysBurst then
		if self:GetIsBurst() then
			if self:GetFireQueue() == 0 then
				local NumBullets = self.BurstOverride - 1
				if self.BurstAnimationOnce then
					self:HandleShootAnimations()
				end
				self:SetNextFireDelay(CurTime() + self:GetBurstMath() )
				self:SetFireQueue(NumBullets)
			end			
		end
	end
end

function SWEP:GetBurstMath() -- Shared
	return self.BurstPerBulletDelay or (self.BurstSpeedOverride * self.Primary.Delay) / self.BurstOverride
end

function SWEP:SpecialDelay(delay) -- Shared
	return delay
end

function SWEP:GetDelay() -- Shared

	local Delay = self.Primary.Delay
	
	if self.HasBuildUp then
		Delay = Delay + ( (self.Primary.Delay*5) * (100 - self:GetBuildUp()) * 0.01 )
	end

	if self.HasBurstFire or self.AlwaysBurst then
		if self:GetIsBurst() then
			if self.BurstPerVolleyDelay then
				Delay = self.BurstPerVolleyDelay
			elseif self.BurstSpeedAbs then
				Delay = self.BurstSpeedAbs
			else
				Delay = Delay * (self.BurstOverride*2)
			end
		end
	end
	
	if self.Owner:IsBot() and !self.Primary.Automatic then
		Delay = math.Clamp(Delay,1/8,100)
	end
	
	return self:SpecialDelay(Delay)

end

function SWEP:ModBoltDelay() -- Shared
	return self:SpecialDelay(self.Primary.Delay)
end

function SWEP:WeaponDelay() -- Shared

	if self.HasBoltAction then
		self:SetBoltDelay( CurTime() + self:ModBoltDelay() )
		self:SetZoomOverlayDelay( CurTime() + self:ModBoltDelay() )
	end

	self:SetNextPrimaryFire( CurTime() + self:GetDelay() )
	
end

function SWEP:AfterZoom() -- Shared
	--[[
	if self.HasScope then
		if self.HasBoltAction then
			if self:GetZoomed() then
				--self:SetZoomOverlayDelay( CurTime() + self.Owner:GetViewModel():SequenceDuration() )	
				--self:SetBoltDelay( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
			end
		end
	end
	--]]
end

function SWEP:GetScopeSway(Cone) -- Unknown
	local x = math.sin(CurTime()*0.5)*Cone*0.5*0.5
	local y = math.cos(CurTime())*Cone*0.5
	return x,y
end

SWEP.BulletQueueShots = 0
SWEP.BulletQueueDelay = 0.01

function SWEP:HandleBulletQueue() -- Shared
	if self.BulletQueueShots > 0 and self:GetBulletQueue() > 0 and self:GetBulletQueueDelay() <= CurTime() then
		local Damage = self:SpecialDamage(self.Primary.Damage)
		local Shots = math.min(self.BulletQueueShots,self:GetBulletQueue(),self:SpecialShots(self.Primary.NumShots))
		local Cone = 0
		if IsFirstTimePredicted() then
			Cone = self:HandleCone(self.Primary.Cone,false, (self.HasDual and self:GetIsLeftFire()) )
		end
		self:PreShootBullet(Damage,Shots,Cone)
		self:SetBulletQueue( math.max(0,self:GetBulletQueue() - Shots))
		self:SetBulletQueueDelay(CurTime() + self.BulletQueueDelay)
	end
end

function SWEP:BulletMethod01(Damage,Shots,Cone,WithPunchAngles) -- Shared

	local ConeMinusPrimary = Cone
	
	if Shots > 1 then
		ConeMinusPrimary = math.max(self.Primary.Cone,Cone - self.Primary.Cone)
	end
	
	local FireMul = 1
	if self.HasDual and self:GetIsLeftFire() then
		FireMul = -1
	end

	local PitchMulti = self:BulletRandomSeed(-100,100,0) / 100
	local YawMulti = self:BulletRandomSeed(-100,100,0 + 100) / 100
	local AngleToAdd = Angle(ConeMinusPrimary*PitchMulti*45,ConeMinusPrimary*YawMulti*45*FireMul,0)
	AngleToAdd:Normalize()
	local NewVector, NewAngle = LocalToWorld(Vector(0,0,0),AngleToAdd,Vector(0,0,0),WithPunchAngles)
	
	NewAngle:Normalize()
	
	if Shots == 1 then
		self:ShootBullet(Damage,Shots,0,self.Owner:GetShootPos(),NewAngle:Forward(),self.Owner)
	else
		for i=1, Shots do 
			local NewPitchMulti = self:BulletRandomSeed(-100,100,i + Shots + self:GetFireQueue()) / 100
			local NewYawMulti = self:BulletRandomSeed(-100,100,i + Shots + 100 + self:GetFireQueue()) / 100
			local NewAngleToAdd = Angle(self.Primary.Cone*NewPitchMulti*45,self.Primary.Cone*NewYawMulti*45,0)
			NewAngleToAdd:Normalize()
			local NewNewVector, NewNewAngle =  LocalToWorld(Vector(0,0,0),NewAngleToAdd,Vector(0,0,0),NewAngle)
			--NewNewAngle = NewAngle + NewAngleToAdd
			
			if Cone < self.Primary.Cone then
				NewNewAngle = NewAngle
			end
			
			NewNewAngle:Normalize()

			if self.Owner and self.Owner:IsValid() then
				self:ShootBullet(Damage,Shots,0,self.Owner:GetShootPos(),NewNewAngle:Forward(),self.Owner)
			end
		end
	end


end

function SWEP:BulletMethod02(Damage,Shots,WithPunchAngles) -- Shared

	local IsLeftFire = self:GetIsLeftFire()

	local RandomCone = 0
	RandomCone = self:PreSeededCone(RandomCone,false,IsLeftFire)
	RandomCone = self:HandleConeMovement(RandomCone,false,IsLeftFire)
	local SeededCone = self.Primary.Cone
	SeededCone = self:HandleConeBase(SeededCone,false,IsLeftFire)
	SeededCone = self:SpecialConePre(SeededCone,false,IsLeftFire)
	SeededCone = self:HandleConeEquipment(SeededCone,false,IsLeftFire)
	SeededCone = self:HandleConeCooldown(SeededCone,false,IsLeftFire)
	SeededCone = self:SpecialConePost(SeededCone,false,IsLeftFire)

	local FireMul = 1
	if self.HasDual and IsLeftFire then
		FireMul = -1
	end

	for i=1, Shots do
	
		local PitchMulti = self:BulletRandomSeed(-100,100,0 + Shots+i) / 100
		local YawMulti = self:BulletRandomSeed(-100,100,0 + 100 + Shots+i) / 100
		local AngleToAdd = Angle(SeededCone*PitchMulti*45,SeededCone*YawMulti*45*FireMul,0)
		AngleToAdd:Normalize()
		local NewVector, NewAngle = LocalToWorld(Vector(0,0,0),AngleToAdd,Vector(0,0,0),WithPunchAngles)
		local ShootPos = self:GetPos()
		
		if self.Owner and self.Owner ~= NULL and self.Owner:IsPlayer() or self.Owner:IsNPC() then
			ShootPos = self.Owner:GetShootPos()
		end

		self:ShootBullet(Damage,Shots,RandomCone,ShootPos,NewAngle:Forward(),self.Owner)
		
	end

end


function SWEP:PreShootBullet(Damage,Shots,Cone) -- Don't predict -- Shared
	local WithPunchAngles = self:GetTrueShootAngles()
	--self:BulletMethod01(Damage,Shots,Cone,WithPunchAngles)
	self:BulletMethod02(Damage,Shots,WithPunchAngles)
end

function SWEP:PostPrimaryFire() -- Shared

end

SWEP.AnimationRateTable = {}

function SWEP:WeaponAnimation(clip,animation) -- Shared

	if self:GetIsSilenced() then
		if clip == 1 and self.HasDryFire then
			animation = ACT_VM_DRYFIRE_SILENCED
		else
			animation = ACT_VM_PRIMARYATTACK_SILENCED
		end
	elseif self.HasDryFire and self.HasDual then
		if clip == 0 then
			animation = nil
		elseif clip <= 2 then
			if !self:GetIsLeftFire() then
				animation = ACT_VM_DRYFIRE_LEFT
			else
				animation = ACT_VM_DRYFIRE
			end
		end
	elseif clip == 1 and self.HasDryFire then
		animation = ACT_VM_DRYFIRE
	end
	
	if animation then
		self:SendWeaponAnimation(animation,0,1)
	end

end

function SWEP:WeaponSound() -- Shared

	local GunSound = self.Primary.Sound
	local SoundMul = 1
	
	if self.LastBulletSound and self:Clip1() == 0 then
		GunSound = self.LastBulletSound
	end

	if self.HasSilencer then
		if self:GetIsSilenced() then
			GunSound = self.Secondary.Sound
			SoundMul = 0.1
		end
	end

	if self.HasBurstFire or self.AlwaysBurst then
		if self.BurstSound != nil then
			if self:GetIsBurst() then
				GunSound = self.BurstSound
			end
		end
	end
	
	if GunSound ~= nil then
		self:EmitGunSound(GunSound, ((50 + self:SpecialDamage(self.Primary.Damage) )/100)*SoundMul  )
	end

end

function SWEP:SpecialConePre(Cone,IsCrosshair,IsLeftFire) -- Shared
	return Cone
end

function SWEP:SpecialConePost(Cone,IsCrosshair,IsLeftFire) -- Shared
	return Cone
end

function SWEP:HandleConeEquipment(Cone,IsCrosshair,IsLeftFire) -- Shared

	if (self.HasBurstFire or self.AlwaysBurst) then
		if self:GetIsBurst() then
			Cone = Cone * self.BurstConeMul
		end
	elseif self.HasSilencer then
		if self:GetIsSilenced() then
			Cone = Cone*0.9
		end
	end

	return Cone
	
end

function SWEP:HandleConeCooldown(Cone,IsCrosshair,IsLeftFire) -- Shared

	if self.HasFirstShotAccurate and ((self:GetCoolDown() == 0 and !IsLeftFire) or (IsLeftFire and  self:GetCoolDownLeft() == 0)) and IsCrosshair == false then
		Cone = 0
	else
		if IsLeftFire then
			Cone = Cone + (self:GetCoolDownLeft()*self.HeatMul*0.01)
		else
			Cone = Cone + (self:GetCoolDown()*self.HeatMul*0.01)
		end
	end

	return Cone

end

function SWEP:HandleConeBase(Cone,IsCrosshair,IsLeftFire) -- Shared

	if self.Owner:IsPlayer() and !self.Owner:Crouching() then
		Cone = Cone * 1.25
	end
	
	Cone = Cone * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_baseconescale",false):GetFloat()
	
	return Cone
	
end

function SWEP:HandleConeMovement(Cone,IsCrosshair,IsLeftFire) -- Shared
	return Cone + self:GetMovementIntensity()
end

function SWEP:PreSeededCone(Cone,IsCrosshair,IsLeftFire) -- Shared
	return Cone
end

function SWEP:HandleCone(Cone,IsCrosshair,IsLeftFire) -- Shared

	Cone = self:HandleConeBase(Cone,IsCrosshair,IsLeftFire)
	Cone = self:SpecialConePre(Cone,IsCrosshair,IsLeftFire)
	Cone = self:HandleConeEquipment(Cone,IsCrosshair,IsLeftFire)
	Cone = self:HandleConeCooldown(Cone,IsCrosshair,IsLeftFire)
	Cone = self:SpecialConePost(Cone,IsCrosshair,IsLeftFire)
	Cone = self:PreSeededCone(Cone,IsCrosshair,IsLeftFire)
	Cone = self:HandleConeMovement(Cone,IsCrosshair,IsLeftFire)
	
	return Cone
	
end

function SWEP:GetMovementVelocity() -- Shared
	local Velocity = self.Owner:GetVelocity():Length() 
	if (!self.Owner:IsOnGround() and !(self.Owner:WaterLevel() > 0)) then
		Velocity = math.max(Velocity*1.25,400)
	end
	return Velocity
end

function SWEP:GetMovementIntensity() -- Shared
	return math.Clamp( ( (self:GetMovementVelocity() * self.MoveConeMul * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_movementconescale"):GetFloat()) ^ 1.75 ) * 0.000001, 0, 0.1)
end

function SWEP:SpecialFire() -- Shared
	self:Melee()
end

function SWEP:SecondaryAttack() -- Shared

	local ToggleZoomEnabled = ToggleZoom
	--BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_togglezoom",true):GetFloat() == 1
	
	if IsFirstTimePredicted() then
		self:HandleCancelZoom()
	end

	
	if self:IsBusy() then return end

	if self:IsUsing() then
		if self.HasSpecialFire then
			self:SpecialFire()
		end
	elseif (IsFirstTimePredicted() or IsSingleplayer) then
		if self:CanZoom() and ToggleZoomEnabled and not self:IsSprinting() then
			self:HandleZoom(1)
		end
	end

end

function SWEP:HandleSprintCancelZoom() -- Shared
	if self:IsSprinting() and self:GetZoomed() then
		self:ZoomOut()
	end
end

function SWEP:HandleCancelZoom() -- Shared
	
	local ToggleZoomEnabled = ToggleZoom == true

	if ToggleZoomEnabled and self.HasBoltAction and self:GetZoomOverlayDelay() >= CurTime() and (self.HasScope or self.HasIronsights) then
		if self:GetZoomed() then
			self:ZoomOut()
		end
	end
	
end

function SWEP:HandleHoldToZoom() -- Shared

	--if (IsFirstTimePredicted() or IsSingleplayer) and not self:IsBusy() and not self:IsUsing() and BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_togglezoom",true):GetFloat() == 0 then
	if (IsFirstTimePredicted() or IsSingleplayer) and not self:IsBusy() and not self:IsUsing() and ToggleZoom == false then
		if self:GetZoomed() and (!self.Owner:KeyDown(IN_ATTACK2) or !self:CanZoom()) then
			self:ZoomOut()
		elseif self.Owner:KeyDown(IN_ATTACK2) and !self:GetZoomed() and self:CanZoom() then
			self:ZoomIn()
		end
	end
	
end

function SWEP:CanZoom() -- Shared
	return (self:CanBoltZoom() and (self.HasIronSights or self.HasScope))
end

function SWEP:Melee() -- Shared
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	self:SetNextPrimaryFire(CurTime() + 1)
	self.Owner:DoAnimationEvent( ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND )
	self:StartSwing(self.MeleeDamage)
end

function SWEP:SwitchFireMode() -- Shared

	if not (IsFirstTimePredicted() or IsSingleplayer) then return end
	if not (self:GetNextPrimaryFire() <= CurTime()) then return end
	
	local Message = "Semi-Automatic"

	if self.Primary.Automatic then
		Message = "Automatic"
	end

	if self:GetIsBurst() then
		self:SetIsBurst(false)
		if (CLIENT or IsSingleplayer) then
			self:EmitGunSound("weapons/smg1/switch_single.wav",0.01)
		end
		self.Owner:PrintMessage( HUD_PRINTCENTER, "Switched to "..Message )
	else
		self:SetIsBurst(true)
		if (CLIENT or IsSingleplayer) then
			self:EmitGunSound("weapons/smg1/switch_burst.wav",0.01)
		end
		self.Owner:PrintMessage( HUD_PRINTCENTER, "Switched to Burst Fire Mode" )
	end
	
	self:SetNextPrimaryFire(CurTime() + 0.25)

end

function SWEP:Silencer() -- Shared

	if self:IsBusy() then return end
		
	if self:GetIsSilenced() then
		self:SendWeaponAnimation(ACT_VM_DETACH_SILENCER)
		if not (IsFirstTimePredicted() or IsSingleplayer) then return end
		self.WorldModel = self.WorldModel1
		self:SetIsSilenced(false)
	else
		self:SendWeaponAnimation(ACT_VM_ATTACH_SILENCER)
		if not (IsFirstTimePredicted() or IsSingleplayer) then return end
		self.WorldModel = self.WorldModel2
		self:SetIsSilenced(true)
	end
	
	self:SetAttachDelay(CurTime() + self:GetTrueSequenceDuration())
	
end

function SWEP:HandleZoom(delay) -- Shared

	if not (IsFirstTimePredicted()) then return end
	if not self:CanBoltZoom() then return end
	
	--if self:IsBusy() then return end

	if self:GetZoomed() then
		self:ZoomOut()
	else
		self:ZoomIn()
	end
	
end

function SWEP:ZoomIn() -- Shared
	if self.HasScope then
		if self.ZoomInSound then
			if CLIENT or IsSingleplayer then
				self.Owner:EmitSound(self.ZoomInSound,0.01)
			end
		end
		if self.ZoomDelay > 0 then
			self:SetZoomOverlayDelay(CurTime() + self.ZoomDelay)
		end
	end
	self:SetZoomed(true)
end

function SWEP:ZoomOut() -- Shared
	self:SetZoomed(false)		
	if self.HasScope then
		if self.ZoomOutSound then
			if CLIENT then
				self.Owner:EmitSound(self.ZoomOutSound,0.01)
			end
		end
		if self.ZoomDelay > 0 then
			self:SetZoomOverlayDelay(0)
		end
	end
end


function SWEP:CanBoltZoom() -- Shared
	return !self.HasBoltAction or self:GetBoltDelay() <= CurTime()
end

function SWEP:SpecialZoom(fov) -- Shared
	return fov
end

function SWEP:CanPrimaryAttack() -- Shared
	if self:GetNextPrimaryFire() > CurTime() then return false end
	return true
end

function SWEP:CanSecondaryAttack() -- Shared
	if self:GetNextSecondaryFire() > CurTime() then return false end
	return true
end

function SWEP:SpecialDamage(damage) -- Shared
	return damage
end

function SWEP:SpecialShots(shots) -- Shared
	return shots
end

function SWEP:GetRecoilMath() -- Client?
	return self:SpecialDamage(self.Primary.Damage)*self:SpecialShots(self.Primary.NumShots)*self.RecoilMul*self.Primary.Delay*1.875
end

function SWEP:SpecialRecoil(recoil) -- Client?
	return recoil
end

function SWEP:GetRecoilFinal() -- Client?

	local UpPunch = -self:GetRecoilMath()
	local SidePunch = 0
	
	if (self.HasBurstFire or self.AlwaysBurst) and self:GetIsBurst() then
		UpPunch = UpPunch*self.BurstRecoilMul
	end
	
	local AvgBulletsShot = 0
	
	if self.Primary.Automatic == true then
	
		local HeatMath = self:GetHeatMath( self:SpecialDamage(self.Primary.Damage) , self:SpecialShots(self.Primary.NumShots) )
		
		if self.HasDual and self:GetIsLeftFire() then
			if SERVER or IsSingleplayer then
				AvgBulletsShot = (self:GetCoolDownLeft() / math.max(0.001,HeatMath) )
			else
				AvgBulletsShot = (self.ClientCoolDownLeft / math.max(0.001,HeatMath) )
			end
		else
			if SERVER or IsSingleplayer then
				AvgBulletsShot = (self:GetCoolDown() / math.max(0.001,HeatMath) )
			else
				AvgBulletsShot = (self.ClientCoolDown / math.max(0.001,HeatMath) )
			end
		end
		
	end
	
	UpPunch = UpPunch * ( 1 + AvgBulletsShot/ (1/self.Primary.Delay) )
	
	local PredictedUpPunch = -UpPunch
	
	if CLIENT then
		PredictedUpPunch = -UpPunch + -self.PunchAngleUp.p
	end
	
	local DelayMul = 1
	
	if self.Primary.Delay >= 0.5 and not self.DelayOverride then
		DelayMul = 0
	end
	
	if self.HasSideRecoil then
		if self.SideRecoilBasedOnDual then
			if self:GetIsLeftFire() then
				SidePunch = UpPunch*1*self.SideRecoilMul
			else
				SidePunch = UpPunch*-1*self.SideRecoilMul
			end
		elseif DelayMul == 1 then
			if AvgBulletsShot > 2*DelayMul then
				SidePunch = UpPunch*self:BulletRandomSeedInt(-1,1)*self.SideRecoilMul
			end
		else
			SidePunch = UpPunch*self.SideRecoilMul
		end
	end
	
	if self.HasDownRecoil then
		if AvgBulletsShot > 3*DelayMul then
			UpPunch = UpPunch*self:BulletRandomSeedInt(-1,2)*self.SideRecoilMul
		end
	end
	
	if self.HasScope and self.ZoomAmount > 4 and self:GetZoomed() then
		UpPunch = UpPunch*0.5
		SidePunch = SidePunch*0.5
	end
	
	UpPunch = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_recoilscale"):GetFloat() * UpPunch
	SidePunch = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_recoilscale"):GetFloat() * SidePunch

	return self:SpecialRecoil(UpPunch), self:SpecialRecoil(SidePunch)

end

function SWEP:AddRecoil() -- Client?
	if CLIENT or IsSingleplayer then
		local UpPunch, SidePunch = self:GetRecoilFinal()
		self.PunchAngleUp = self.PunchAngleUp + Angle(UpPunch,SidePunch,0) + Angle(self.ShootOffsetStrength.p*self:BulletRandomSeed(-0.5,0.5,1),self.ShootOffsetStrength.y*self:BulletRandomSeed(-0.5,0.5,10),0)
		self.PunchAngleDown = self.PunchAngleDown + Angle(UpPunch,SidePunch,0) + Angle(self.ShootOffsetStrength.p*self:BulletRandomSeed(-0.5,0.5,100),self.ShootOffsetStrength.y*self:BulletRandomSeed(-0.5,0.5,1000),0)
	end

end

function SWEP:SpecialHeatMath(CoolDown) -- Shared


	return CoolDown
end

function SWEP:GetHeatMath(Damage,Shots) -- Shared

	local DamageMod = Damage*Shots*0.01
	local ConeMod = (math.max(0.001,self.Primary.Cone)^-0.1)
	local WeightMod = math.Clamp(self.CSSMoveSpeed / 250,0.1,2)
	local BurstMod = 1

	if (self.HasBurstFire or self.AlwaysBurst) and self:GetIsBurst() then
		BurstMod = self.BurstHeatMul
	end
	
	local CoolDown = DamageMod*ConeMod*WeightMod*BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_heatconescale"):GetFloat()*BurstMod
	return self:SpecialHeatMath(CoolDown)
	
end

function SWEP:AddHeat(Damage,Shots) -- Shared

	local CoolDown = self:GetHeatMath(Damage,Shots)
	local CoolTime = (self.Primary.Delay + 0.1)*self.CoolMul
	
	if self.HasBurstFire and self:GetIsBurst() then
		CoolTime = CoolTime * self.BurstCoolMul
	end
	
	if self.HasDual and self:GetIsLeftFire() then
		self:SetCoolDownLeft( math.Clamp(self:GetCoolDownLeft() + CoolDown,0,self.MaxHeat) )
		self:SetCoolTimeLeft( CurTime() + CoolTime )

		if CLIENT and self.Owner == LocalPlayer() then
			self.ClientCoolDownLeft = (math.Clamp(self.ClientCoolDownLeft + CoolDown,0,self.MaxHeat) + self:GetCoolDownLeft())/2
			self.ClientCoolTimeLeft = CurTime() + CoolTime
		end
	else
		self:SetCoolDown( math.Clamp(self:GetCoolDown() + CoolDown,0,self.MaxHeat) )
		self:SetCoolTime( CurTime() + CoolTime )
		
		if CLIENT and self.Owner == LocalPlayer() then
			self.ClientCoolDown = (math.Clamp(self.ClientCoolDown + CoolDown,0,self.MaxHeat) + self:GetCoolDown())/2
			self.ClientCoolTime = CurTime() + CoolTime
		end
	end
	
end

SWEP.UseSpecialProjectile	= false
SWEP.UseMuzzle				= true

function SWEP:ModProjectileTable(datatable) -- Shared

	local FalloffMod = math.Clamp(self.DamageFalloff,1,4000)
	local FalloffModDif = self.DamageFalloff - FalloffMod

	datatable.direction = datatable.direction*FalloffMod*4
	datatable.hullsize = 2
	datatable.usehull = true
	datatable.resistance = (datatable.direction*0.05) + Vector(0,0,math.Clamp(100 - FalloffModDif/4000,0,100))
	datatable.dietime = CurTime() + 50
	datatable.id = "css_bullet"

	return datatable
	
end

function SWEP:ShootProjectile(Damage, Shots, Cone, Source, Direction,AimCorrection) -- Client
	BURGERBASE_FUNC_ShootProjectile(self.Owner,self,Damage,Shots,Cone,Source,Direction,nil,true)
end

function SWEP:ShootBullet(Damage, Shots, Cone, Source, Direction,LastEntity) -- Shared

	if self then
		if self.UseSpecialProjectile then
			if CLIENT then
				self:ShootProjectile(Damage, Shots, Cone, Source, Direction,true)
			end
		elseif self.BulletEnt then
			if SERVER then
				self:ShootPhysicalObject(Source,Cone,Direction)
			end
		else
			local bullet = {}
			bullet.Damage	= Damage * BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damagescale"):GetFloat()
			bullet.Num		= 1
			bullet.Spread	= Vector(Cone, Cone, 0)
			bullet.Src		= Source
			bullet.Dir		= Direction
			bullet.AmmoType = self:GetPrimaryAmmo()
			bullet.HullSize = 0
			bullet.Tracer 	= 0
			bullet.Force	= nil
			bullet.Callback = function(attacker,tr,dmginfo)
				self:BulletCallback(Damage,Direction,LastEntity,attacker,tr,dmginfo)
			end
			self.Owner:FireBullets(bullet)
		end
	end
end

function SWEP:BulletCallback(Damage,Direction,PreviousHitEntity,attacker,tr,dmginfo) -- Shared

	local CurrentHitEntity = tr.Entity
		
	if IsFirstTimePredicted() then
		self:TracerCreation(tr.HitPos,tr.StartPos,Direction,PreviousHitEntity)
	end

	if attacker:IsPlayer() then
	
		local Weapon = attacker:GetActiveWeapon()

		if Weapon and Weapon.DamageFalloff and Weapon:SpecialFalloff(Weapon.DamageFalloff) then
			if Weapon:SpecialFalloff(Weapon.DamageFalloff) > 0 then
			
				local MatterScale = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damagefalloffscale"):GetFloat()
			
				local Falloff = Weapon:SpecialFalloff(Weapon.DamageFalloff)
				local Distance = tr.StartPos:Distance(tr.HitPos)
				local DamageScale = math.Clamp(math.min( (2) - (Distance/Falloff),1),0,1)
				local FinalValue = math.Clamp(DamageScale,MatterScale,1)

				dmginfo:ScaleDamage(FinalValue)

			end
		end
		
		if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_enable_penetration"):GetFloat() == 1 then
			self:WorldBulletSolution(tr.HitPos,tr,Direction,Damage,CurrentHitEntity)
		end

		--[[
		if SERVER then
			if tr.Entity:GetClass() == "prop_vehicle_prisoner_pod" or CurrentHitEntity:IsVehicle() then
				if CurrentHitEntity:GetDriver() ~= NULL then
					CurrentHitEntity:GetDriver():TakeDamageInfo(dmginfo)
				end
			end
		end
		--]]
		
	end

end

function SWEP:StartShortTrace(Pos,Direction,Distance,shouldcomp) -- Shared

	local data = {}

	data.start = Pos + Direction
	data.endpos = Pos + Direction*Distance
	data.mask = MASK_SHOT
	
	if shouldcomp and self.Owner:IsPlayer() then
		self.Owner:LagCompensation( true )
	end
	
	local Trace = util.TraceLine(data)
	
	if shouldcomp and self.Owner:IsPlayer() then
		self.Owner:LagCompensation( false )
	end
	
	return Trace

end

function SWEP:CalculateMaterialPenetration(mat) -- Shared

	local MatMul = 1

	if mat == MAT_GLASS then
		MatMul = 0.5
	elseif mat == MAT_SAND or mat == MAT_SNOW or mat == MAT_DIRT then
		MatMul = 2
	elseif mat == MAT_ANTLION or mat == MAT_ALIENFLESH or mat == MAT_FLESH then
		MatMul = 0.75
	elseif mat == MAT_CONCRETE then
		MatMul = 5
	elseif mat == MAT_METAL then
		MatMul = 10
	end
	
	return MatMul

end

function SWEP:BulletRandomGetSeed(seed) -- Shared

	seed = math.floor(seed) + self.RandomSeed + string.len(self.PrintName)
	
	local Precision = 1
	
	if !self.Primary.Automatic then
		Precision = 0
	end
	
	if self.HeatMul == 0 or self.DontSeedFire then
		return math.randomseed( CurTime() + seed )
	elseif self.HasDual and self:GetIsLeftFire() then
		if self:GetCoolDownLeft() == self.MaxHeat then
			return math.randomseed( CurTime() + seed )
		else
			return math.randomseed( math.Round(self:GetCoolDownLeft(),1) + seed)
		end
	else
		if self:GetCoolDown() == self.MaxHeat then
			return math.randomseed( CurTime() + seed )
		else
			return math.randomseed( math.Round(self:GetCoolDown(),1) + seed)
		end
	end
	
end

function SWEP:BulletRandomSeedInt(min,max,seed) -- Shared
	if not seed then seed = 0 end
	
	self:BulletRandomGetSeed(seed)
	return math.random(min,max)
	
end


function SWEP:BulletRandomSeed(min,max,seed) -- Shared
	if not seed then seed = 0 end

	self:BulletRandomGetSeed(seed)
	return math.Rand(min,max)
	
end

function SWEP:WorldBulletSolution(Pos,OldTrace,Direction,Damage,PreviousHitEntity) -- Shared

	local Distance = 3
	local Randomness = 0.05
	
	--local NewDirection = (OldTrace.HitPos - OldTrace.StartPos):GetNormalized()

	local RangeMod = self:SpecialFalloff(self.DamageFalloff)/5000
	local BulletAngleMod =  math.Clamp(math.Clamp(RangeMod,0.25,0.5) * math.Rand(1 - (Randomness/2),1 + (Randomness/2)),0,0.5)
	local DirectionForRichochet = -2 * Direction:Dot(OldTrace.HitNormal) * OldTrace.HitNormal + Direction
	local OldDirectionForRichochet = DirectionForRichochet
	DirectionForRichochet:Normalize()
	local AngleOfAttack = math.deg( math.acos(DirectionForRichochet:Dot( Direction ) )) / 2
	DirectionForRichochet = LerpVector(BulletAngleMod,DirectionForRichochet,Direction)
	DirectionForRichochet:Normalize()

	local LocalVec, LocalAng = WorldToLocal( Vector(0,0,0), Direction:Angle(), Vector(0,0,0), DirectionForRichochet:Angle() )
	local mat = OldTrace.MatType
	local ShouldRichochet = AngleOfAttack < 30 and mat == MAT_METAL
	local CurrentHitEntity = OldTrace.Entity
	local ShouldPenetrate = AngleOfAttack < 1 or AngleOfAttack >= 30
	local DamageMath = 0

	if ShouldPenetrate then
		if IsValid(PreviousHitEntity) and (PreviousHitEntity:IsPlayer() or PreviousHitEntity:IsNPC()) then
			local Before = Direction*PreviousHitEntity:OBBMaxs()
			Distance = (Before):Length()
		end
		local MatMul = self:CalculateMaterialPenetration(mat)
		local DamageLoss = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_penetration_scale"):GetFloat() * MatMul * math.max(0.1,self.PenetrationLossMul) * Distance
		DamageMath = math.Round(Damage - DamageLoss,2)
	elseif ShouldRichochet then
		DamageMath = math.Round((Damage * 0.9) - 1)
		Distance = 0
		Direction = DirectionForRichochet
		if IsFirstTimePredicted() then
			--EmitSound(self.RichochetSound[math.random(1,#self.RichochetSound)],Pos, self:EntIndex(), CHAN_AUTO, 0.5, SNDLVL_NORM, SND_NOFLAGS, 100 )
		end
	end
	
	local ShouldEmit = ( ShouldPenetrate or ShouldRichochet ) and DamageMath > 1
	local trace = self:StartShortTrace(Pos,Direction,Distance,false)
	
	if ShouldEmit then
		if trace.StartSolid then
			if IsFirstTimePredicted() then
				self:WorldBulletSolution(Pos + Direction*Distance,trace,Direction,DamageMath,CurrentHitEntity)
			end
		else
			if IsFirstTimePredicted() then
				self:ShootBullet(DamageMath, 1, 0, Pos + Direction*Distance,Direction,CurrentHitEntity)
			end
			local BackTraceData = {}
			BackTraceData.start = Pos + Direction
			BackTraceData.endpos = Pos - Direction*Distance	
			local BackTrace = util.TraceLine(BackTraceData)
			if IsFirstTimePredicted() then
				self:BulletEffect(BackTrace.HitPos,BackTrace.StartPos,BackTrace.Entity,BackTrace.SurfaceProps)
			end
		end
	end

end

function SWEP:TracerCreation(origin,start,direction,HitEntity) -- Shared

	if self.EnableCustomTracer then
		local TracerData = self:GenerateEffectData(origin,start,HitEntity,true)
		util.Effect( "effect_burger_core_bullet", TracerData )
	end

	if self.CustomShootEffectsTable then
		local TracerData = self:GenerateEffectData(origin,start,HitEntity,false)
		for num,effectname in pairs(self.CustomShootEffectsTable) do
			util.Effect( effectname, TracerData )
		end
	end

end

function SWEP:GenerateEffectData(origin,start,HitEntity,IsCSSTracer) -- Shared

	local Data = EffectData()
	Data:SetOrigin( origin )
	Data:SetStart( start )
	if HitEntity == self.Owner then
	
		if self.HasDual and self:GetIsLeftFire() then
			Data:SetAttachment( 2 )
		else
			Data:SetAttachment( 1 )
		end
	

		Data:SetEntity( self.Weapon )
	else
		Data:SetAttachment( 0 )
		Data:SetEntity( NULL )
	end	
	
	if IsCSSTracer then
		Data:SetMagnitude( self:SpecialDamage(self.Primary.Damage) )
		Data:SetRadius(self:SpecialFalloff(self.DamageFalloff))
		Data:SetDamageType(self.DamageType)
	end

	return Data

end



if SERVER then
	util.AddNetworkString("CSS_GunSounds")
end

function SWEP:EmitGunSound(GunSound,Level) -- Shared
	
	if GunSound and GunSound ~= NULL then
	
		--if CLIENT or IsSingleplayer then
			--print("HI?")
			self.Weapon:EmitSound(GunSound)	
		--end
	

	
		--[[
		if SERVER then
		
			local Position = self.Owner:GetPos()
		
			if sound.GetProperties(GunSound) then
		
				if IsFirstTimePredicted() then
					net.Start("CSS_GunSounds")
						net.WriteFloat(self.Weapon:EntIndex())
					net.Broadcast()
				end
				
			end

		end
		--]]
		
	end
		
end

if CLIENT then -- Client
	net.Receive("CSS_GunSounds", function(len)
	
		local ply = LocalPlayer()
		local ID = net.ReadFloat()	
		local Gun = Entity(ID)
		
		if not Gun or Gun == NULL or not Gun.Owner or Gun.Owner == NULL or Gun.Owner == ply then return end
		
		local GunSound = Gun.Primary.Sound
		local RealSoundTable = sound.GetProperties(GunSound)
		
		local Distance = math.floor(ply:GetPos():Distance(Gun:GetPos()))
		local FakePos = ply:EyePos() + (- Gun.Owner:GetShootPos() + ply:EyePos() ):GetNormalized()*50
		local Power = ( Gun:SpecialDamage(Gun.Primary.Damage) * Gun:SpecialShots(Gun.Primary.NumShots) )
		local Falloff = 1024
		local Range = 20000
		local Calc = math.Clamp(1 - ( (Distance - (Falloff*(Power/100)) ) / Range ),0,1 )


	
	
		local SoundToPlay = RealSoundTable.sound
		if type(SoundToPlay) == "table" then
			SoundToPlay = SoundToPlay[math.random(1,#SoundToPlay)]
		end
		
		--print(Calc)
		EmitSound(SoundToPlay,FakePos,ID,CHAN_WEAPON,Calc,140,0,math.Clamp(100*Calc*1.25,0,100))

	end)



end

function SWEP:BulletEffect(HitPos,StartPos,HitEntity,SurfaceProp,DamageType) -- Shared

	if not DamageType then
		DamageType = DMG_BULLET
	end
	
	if HitEntity:IsPlayer() then return end
	
	local effect = EffectData()
	effect:SetOrigin(HitPos)
	effect:SetStart(StartPos)
	effect:SetSurfaceProp(SurfaceProp)
	effect:SetDamageType(DamageType)
	
	if (CLIENT or IsSingleplayer) then
		effect:SetEntity(HitEntity)
	else
		effect:SetEntIndex(HitEntity:EntIndex())
	end

	util.Effect("Impact", effect)
	
end

function SWEP:IsSprinting() -- Shared
	local SideVelocity = self.Owner:GetVelocity()
	SideVelocity = SideVelocity - Vector(0,0,SideVelocity.z)
	SideVelocity = SideVelocity:Length()
	return SideVelocity > 1 and self.Owner:IsOnGround() and self.Owner:KeyDown(IN_SPEED)
end

function SWEP:IsBusy() -- Shared

	if not self:GetCanHolster() then
		return true
	elseif self:GetIsReloading() then
		return true
	elseif self.HasSilencer and self:GetAttachDelay() > CurTime() then
		return true
	end
	
	return false

end

function SWEP:IsUsing() -- Shared
	if self.Owner:IsPlayer() and self.Owner:KeyDown(IN_USE) then return true end
end

function SWEP:ReloadSpecial() -- Shared

	if self.HasBurstFire then
		self:SwitchFireMode()
	elseif self.HasSilencer then
		self:Silencer()
	elseif self.SpecialAmmo then

		local OldAmmo = self:GetPrimaryAmmo()
		
		local ShouldSwitch = false
		
		
		if self.DisableReloadUntilEmpty and self:Clip1() > 0 then

		elseif self:GetPrimaryAmmo() == game.GetAmmoID(self.SpecialAmmo[1]) and self.Owner:GetAmmoCount(self.SpecialAmmo[2]) > 0 then
			self:SetPrimaryAmmo(game.GetAmmoID(self.SpecialAmmo[2]))
			if (CLIENT or IsSingleplayer) and IsFirstTimePredicted() then
				self.Owner:PrintMessage( HUD_PRINTTALK, "Switched to " .. language.GetPhrase("#" .. self.SpecialAmmo[2] .. "_ammo") .. " (Secondary)" )
			end
			ShouldSwitch = true
		elseif self:GetPrimaryAmmo() == game.GetAmmoID(self.SpecialAmmo[2]) and self.Owner:GetAmmoCount(self.SpecialAmmo[1]) > 0 then
			self:SetPrimaryAmmo(game.GetAmmoID(self.SpecialAmmo[1]))
			if (CLIENT or IsSingleplayer) and IsFirstTimePredicted() then
				self.Owner:PrintMessage( HUD_PRINTTALK, "Switched to " ..  language.GetPhrase("#" .. self.SpecialAmmo[1] .. "_ammo") .. " (Primary)" )
			end
			ShouldSwitch = true
		end

		if ShouldSwitch then
			if SERVER then
				self.Owner:GiveAmmo(self:Clip1(),OldAmmo,true)
			end
			self:SetClip1(0)
			self:DoReload()
		end

	end

end

SWEP.SequenceDurationAdd = {}

function SWEP:GetTrueSequenceDuration() -- Shared
	local ViewModel = self.Owner:GetViewModel()
	return ( ViewModel:SequenceDuration() * (1/ViewModel:GetPlaybackRate()) ) + (self.SequenceDurationAdd[ViewModel:GetSequenceActivity(ViewModel:GetSequence())] or 0)
end


function SWEP:DoReload() -- Shared
	
	if self:GetZoomed() then
		self:SetZoomed(false)
	end

	if SERVER then
		if self.HasPumpAction == false then
			if self:Clip1() > 0 then
				self.Owner:GiveAmmo(self:Clip1(),self:GetPrimaryAmmo(),true)
				self:SetClip1(0)
			end
		end
	end
	
	if self.HasSilencer then
		if self:GetIsSilenced() then
			self:SendWeaponAnimation(ACT_VM_RELOAD_SILENCED)
		else
			self:SendWeaponAnimation(ACT_VM_RELOAD)
		end
	else
		self:SendWeaponAnimation(ACT_VM_RELOAD)
	end
	
	if (CLIENT or IsSingleplayer) then
		if self.ReloadSound then
			if not self.HasPumpAction then
				self:EmitGunSound(self.ReloadSound)
			end
		end
	end

	if self.HasPumpAction then
		self:SendWeaponAnimation(ACT_SHOTGUN_RELOAD_START)
		self:SetNextShell(CurTime() + self:GetTrueSequenceDuration())
		self:SetIsShotgunReload(true)
	else
		self:SetReloadFinish(CurTime() + self:GetTrueSequenceDuration() )
		self:SetIsNormalReload(true)
	end
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
	
	if SERVER then
		if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_enable_mags"):GetFloat() == 1 then
			timer.Simple(self.MagDelayMod, function()
				if self.GetMagModel and self.HasMagIn then
				
					self.HasMagIn = false

					local EyeAngle = self.Owner:EyeAngles()
					
					local mag = ents.Create("ent_burger_core_debris")
					mag:SetPos(self.Owner:GetShootPos() + self.Owner:GetUp()*-12 + self.Owner:GetRight()*3)
					mag:SetModel(self.GetMagModel)
					mag:SetAngles(EyeAngle + self.MagAngMod)			
					mag:Spawn()
					mag:Activate()
					if not self.HasDual then	
						local Phys = mag:GetPhysicsObject()
						if Phys ~= nil and Phys ~= NULL  then
							Phys:SetVelocity(self.MagMoveMod.x*EyeAngle:Right() + self.MagMoveMod.y*EyeAngle:Forward() + self.MagMoveMod.z*EyeAngle:Up())
						end
					end
					SafeRemoveEntityDelayed(mag,30)
					
					if self.HasDual then
						local mag = ents.Create("ent_burger_core_debris")
						mag:SetPos(self.Owner:GetShootPos() + self.Owner:GetUp()*-12 + self.Owner:GetRight()*-3)
						mag:SetModel(self.GetMagModel)
						mag:SetAngles(EyeAngle + Angle(1,1,1) + self.MagAngMod )
						mag:Spawn()
						mag:Activate()
						SafeRemoveEntityDelayed(mag,30)
					end

				end
			end)
		end
	end
	
	self:SetIsReloading(true)

end

function SWEP:Reload() -- Shared
	
	if self:IsBusy() then return end
	
	if self.Owner:KeyDown(IN_USE) then
		self:ReloadSpecial()
	return end
	
	if self:Clip1() >= self.Primary.ClipSize then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	if self.WeaponType == "Throwable" then return end
	if (self:Clip1() > 0 and self.DisableReloadUntilEmpty) then return end
	if self.Owner:GetAmmoCount(self:GetPrimaryAmmo()) == 0 	then
		if self.Owner:IsBot() then
			self.Owner:GiveAmmo(self.Primary.ClipSize,self:GetPrimaryAmmo(),true)
		end
	return end
	
	self:DoReload()

end


SWEP.IronBoltPos = Vector(0,0,-2)
SWEP.IronBoltAng = Vector(0,0,0)

SWEP.IronIdlePos = Vector(0,0,0)
SWEP.IronIdleAng = Vector(0,0,0)

SWEP.IronReloadPos = Vector(0,0,0)
SWEP.IronReloadAng = Vector(0,0,0)

SWEP.HoldTypeBlocking = "melee2"

function SWEP:HandleHoldType() -- shared
	if !self.CanShootWhileSprinting and self:IsSprinting() then
		self:SetHoldType("passive")
	elseif self.HoldTypeBlocking and self:GetIsBlocking() then
		self:SetHoldType(self.HoldTypeBlocking)
	elseif self:GetHoldType() ~= self.HoldType then
		self:SetHoldType(self.HoldType)
	end
end

function SWEP:HandleShotgunReloadCancel() -- Shared
	if self.Owner:KeyDown(IN_ATTACK) and self:GetIsShotgunReload() and self:GetIsReloading() and not self.Owner:IsBot() then
		self:FinishShotgunReload()
	end
end

SWEP.ClientTrueAimAng = Angle(0,0,0)


function SWEP:GetTrueAimAng(prediction)
	if CLIENT and !prediction then
		return self.ClientTrueAimAng
	else
		return self:GetSharedTrueAimAng()
	end
end

function SWEP:SetTrueAimAng(var)
	self:SetSharedTrueAimAng(var)
	if CLIENT then
		self.ClientTrueAimAng = var
	end
end

function SWEP:GetTrueShootAngles(IgnorePrediction) -- Shared
	local ShootDir = self.Owner:GetAimVector()
	if self.Owner:IsPlayer() then
		ShootDir = self.Owner:GetEyeTrace().Normal
	end
	
	local WithPunchAngles = self.Owner:GetPunchAngle() + ShootDir:Angle()
	--local WithPunchAngles = (self.Owner:GetPunchAngle() + self:GetTrueAimAng() )
	WithPunchAngles:Normalize()
	return WithPunchAngles
end

function BURGERBASE_SpecialGetBest(tab,dolarge)
	local Winner = tab[1]
	for k,v in pairs(tab) do
		if dolarge then
			if math.abs(Winner) < math.abs(v) then
				Winner = v
			end
		else
			if math.abs(Winner) > math.abs(v) then
				Winner = v
			end
		end
	
	end
	return Winner

end

function SWEP:CalculateAngleMovement(angle,movement)

	local MoveAngle = Angle(0,0,0)
	local Largest = math.abs(BURGERBASE_SpecialGetBest({angle.p,angle.y,angle.r},true))

	if Largest ~= 0 then
		if angle.p ~= 0 then
			MoveAngle = MoveAngle + Angle(BURGERBASE_SpecialGetBest({angle.p,movement*(angle.p/Largest)},false),0,0)
		end
		if angle.y ~= 0 then
			MoveAngle = MoveAngle + Angle(0,BURGERBASE_SpecialGetBest({angle.y,movement*(angle.y/Largest)},false),0)
		end	
		if angle.r ~= 0 then
			MoveAngle = MoveAngle + Angle(0,0,BURGERBASE_SpecialGetBest({angle.r,movement*(angle.r/Largest)},false))
		end	
	end
	
	return MoveAngle
	
end


function SWEP:HandleAimAngles() -- Shared
	
	local ShootAng = self.Owner:GetAimVector():Angle()
	
	-- Start Angle
	local DesiredAngOffset = Angle(0,0,0)
	if self.IronMeleeAng and IsMelee then
		DesiredAngOffset = DesiredAngOffset + Angle(self.IronMeleeAng.x,self.IronMeleeAng.y,self.IronMeleeAng.z)
	elseif self.IronReloadAng and self:GetIsReloading() then
		DesiredAngOffset = DesiredAngOffset + Angle(self.IronReloadAng.x,self.IronReloadAng.y,self.IronReloadAng.z)
	elseif self.IronRunAng and !self.CanShootWhileSprinting and self:IsSprinting() then
		DesiredAngOffset = DesiredAngOffset + Angle(self.IronRunAng.x,self.IronRunAng.y,self.IronRunAng.z)
	elseif self.IronBoltAng and self:GetBoltDelay() - self.ZoomDelay >= CurTime() then
		DesiredAngOffset = DesiredAngOffset + Angle(self.IronBoltAng.x,self.IronBoltAng.y,self.IronBoltAng.z)
	end
	ShootAng:RotateAroundAxis(ShootAng:Right(), 	DesiredAngOffset.x)
	ShootAng:RotateAroundAxis(ShootAng:Up(), 	DesiredAngOffset.y)
	ShootAng:RotateAroundAxis(ShootAng:Forward(), DesiredAngOffset.z)
	-- End Angle
	
	if self:GetZoomed() then
		self:SetTrueAimAng(ShootAng)
		return
	end

	local TrueAng = self:GetTrueAimAng()
	local AngDif = (ShootAng - TrueAng)
	AngDif:Normalize()
	local MoveMul = FrameTime()*4*(1/self.IronSightTime)
	local FinalMove = self:GetTrueAimAng(true) + self:CalculateAngleMovement(AngDif,MoveMul)
	
	self:SetTrueAimAng(FinalMove)

end

SWEP.ClientIronsightAng = nil

-- function SWEP:GetViewModelPosition( pos, ang )

-- 	local OldPos = pos
-- 	local OldAng = ang

-- 	local DesiredPosOffset = Vector(0,0,0)
-- 	local DesiredAngOffset = Angle(0,0,0)
-- 	local ShouldSight = self:GetZoomed() or (self.EnableBlocking and self:GetIsBlocking() )
-- 	local EyeTrace = self.Owner:GetEyeTrace()
-- 	local Adjust = 30
-- 	local DesiredDistanceMod = Adjust - math.min(Adjust,EyeTrace.HitPos:Distance(EyeTrace.StartPos))
-- 	local OwnerVelocity = self.Owner:GetVelocity():Length()
-- 	local ZoomSpeed = 1
-- 	local TickRate = FrameTime()
-- 	local TimeRate = self.IronSightTime
-- 	local IsMelee = self:GetNextMelee() + self.MeleeDelay >= CurTime()
-- 	local MeleeDif = math.Clamp( (self:GetNextMelee() - CurTime())/0.15 , 0 , 1)
	
-- 	if self.IronSightAngSnap and self.IronSightPosSnap then
-- 		TimeRate = 0.1
-- 	end
	
-- 	if IsMelee then
-- 		TimeRate = self.MeleeDelay
-- 	end
	
-- 	if ShouldSight then
-- 		self.SwayScale 				= 0
-- 		self.BobScale 				= 0
-- 	else
-- 		self.SwayScale 				= 1
-- 		self.BobScale 				= 1
-- 	end

-- 	-- Start Position
-- 	if self.IronSightsPos and ShouldSight then	
-- 		local BasePosOffset = self.IronSightsPos
-- 		if BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_neversights",true):GetFloat() == 1 and self.HasScope == false then
-- 			BasePosOffset = BasePosOffset - Vector(BasePosOffset.x/2,0,BasePosOffset.z/2)
-- 		end
		
-- 		if CLIENT then
-- 			BasePosOffset = BasePosOffset * Vector(1,self.Owner.BURGERBASE_ZoomMul[self:GetClass()],1)
-- 		end
		
-- 		DesiredPosOffset = DesiredPosOffset + BasePosOffset
		
-- 		if self.IronDualSpacing and self.HasDual then
-- 			if self:GetIsLeftFire() then
-- 				DesiredPosOffset = DesiredPosOffset - Vector(self.IronDualSpacing,0,0)
-- 			else
-- 				DesiredPosOffset = DesiredPosOffset + Vector(self.IronDualSpacing,0,0)
-- 			end
-- 		end
		
-- 	elseif self.IronMeleePos and IsMelee then
-- 		local Rad = math.rad(MeleeDif*180)
-- 		DesiredPosOffset = DesiredPosOffset + Vector(math.sin(Rad)*self.IronMeleePos.x,math.cos(Rad)*self.IronMeleePos.y,self.IronMeleePos.z)
-- 	elseif self.IronReloadPos and self:GetIsReloading() then
-- 		DesiredPosOffset = DesiredPosOffset + self.IronReloadPos	
-- 	elseif self.IronRunPos and !self.CanShootWhileSprinting and self:IsSprinting() then	
-- 		DesiredPosOffset = DesiredPosOffset + self.IronRunPos
-- 	elseif self.IronShootPos and self:GetCoolDown() > 0 then
-- 		DesiredPosOffset = DesiredPosOffset + self.IronShootPos
-- 	elseif self.IronBoltPos and self:GetBoltDelay() - self.ZoomDelay >= CurTime() then
-- 		DesiredPosOffset = DesiredPosOffset + self.IronBoltPos
-- 	elseif self.IronIdlePos then
-- 		DesiredPosOffset = DesiredPosOffset + self.IronIdlePos
-- 	end

-- 	if not ShouldSight then 
-- 		DesiredPosOffset = DesiredPosOffset + Vector(math.sin(CurTime()*0.75),0,math.sin(CurTime()*0.75)) * 0.125
		
-- 		if self.Owner:Crouching() then
-- 			DesiredPosOffset = DesiredPosOffset + Vector(0,0,2)
-- 		end
		
-- 		if not self.DistanceMod then
-- 			self.DistanceMod = DesiredDistanceMod
-- 		else
-- 			self.DistanceMod = self.DistanceMod - (self.DistanceMod - DesiredDistanceMod)*TickRate
-- 		end
		
-- 		DesiredPosOffset = DesiredPosOffset - Vector(0,self.DistanceMod,0)

-- 	end
-- 	-- End Postion
	
-- 	-- Start Angle
-- 	if self.IronSightsAng and ShouldSight then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronSightsAng.x,self.IronSightsAng.y,self.IronSightsAng.z)
-- 	elseif self.IronMeleeAng and IsMelee then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronMeleeAng.x,self.IronMeleeAng.y,self.IronMeleeAng.z)
-- 	elseif self.IronReloadAng and self:GetIsReloading() then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronReloadAng.x,self.IronReloadAng.y,self.IronReloadAng.z)
-- 	elseif self.IronRunAng and !self.CanShootWhileSprinting and self:IsSprinting() then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronRunAng.x,self.IronRunAng.y,self.IronRunAng.z)
-- 	elseif self.IronShootAng and self:GetCoolDown() > 0 then 
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronShootAng.x,self.IronShootAng.y,self.IronShootAng.z)
-- 	elseif self.IronBoltAng and self:GetBoltDelay() - self.ZoomDelay >= CurTime() then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronBoltAng.x,self.IronBoltAng.y,self.IronBoltAng.z)
-- 	elseif self.IronIdleAng then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(self.IronIdleAng.x,self.IronIdleAng.y,self.IronIdleAng.z)
-- 	end

-- 	if not ShouldSight then
-- 		DesiredAngOffset = DesiredAngOffset + Angle(-DesiredDistanceMod,0,0)
-- 		DesiredPosOffset = Vector(DesiredPosOffset.x,DesiredPosOffset.y,DesiredPosOffset.z)
-- 		DesiredAngOffset = Angle(DesiredAngOffset.p,DesiredAngOffset.y,DesiredAngOffset.r)
-- 	end
-- 	-- End Angle
	
-- 	-- Start Final Calculation
-- 	self.IronSightPosCurrent = self.IronSightPosCurrent - (self.IronSightPosCurrent-DesiredPosOffset)*TickRate*(1/math.Clamp(TimeRate,TickRate,3))
-- 	self.IronSightAngCurrent = self.IronSightAngCurrent - (self.IronSightAngCurrent-DesiredAngOffset)*TickRate*(1/math.Clamp(TimeRate,TickRate,3))
-- 	self.IronSightAngCurrent:Normalize()
	
-- 	ang:RotateAroundAxis(ang:Right(), 	self.IronSightAngCurrent.x)
-- 	ang:RotateAroundAxis(ang:Up(), 	self.IronSightAngCurrent.y)
-- 	ang:RotateAroundAxis(ang:Forward(), self.IronSightAngCurrent.z)

-- 	pos = pos + self.IronSightPosCurrent.x * ang:Right()
-- 	pos = pos + self.IronSightPosCurrent.y * ang:Forward()
-- 	pos = pos + self.IronSightPosCurrent.z * ang:Up()

-- 	if ShouldSight then	
-- 		local PosDistance = DesiredPosOffset:Distance(self.IronSightPosCurrent)
-- 		local AngDistance = Vector(DesiredAngOffset.x,DesiredAngOffset.y,DesiredAngOffset.z):Distance(Vector(self.IronSightAngCurrent.x,self.IronSightAngCurrent.y,self.IronSightAngCurrent.z))

-- 		if PosDistance < 0.25 then
-- 			self.IronSightPosSnap = true
-- 		end
		
-- 		if AngDistance < 0.25 then
-- 			self.IronSightAngSnap = true
-- 		end
-- 	else
-- 		self.IronSightAngSnap = false
-- 		self.IronSightPosSnap = false
-- 	end
-- 	-- End Final Calculation

-- 	return pos, ang
-- end

function SWEP:Think() --Shared

	if CLIENT then -- not singleplayer
		if self.Owner.BURGERBASE_ZoomMul and self.Owner.BURGERBASE_ZoomMul[self:GetClass()] then
			if input.WasMousePressed( MOUSE_WHEEL_UP ) then
				self.Owner.BURGERBASE_ZoomMul[self:GetClass()] = math.Clamp(self.Owner.BURGERBASE_ZoomMul[self:GetClass()] + 0.1,0.1,1)
			elseif input.WasMousePressed( MOUSE_WHEEL_DOWN ) or input.WasMouseDoublePressed( MOUSE_WHEEL_DOWN ) then
				self.Owner.BURGERBASE_ZoomMul[self:GetClass()] = math.Clamp(self.Owner.BURGERBASE_ZoomMul[self:GetClass()] - 0.1,0.1,1)
			end
		end
	end
	
	--self:HandleAimAngles()
	self:HandleShotgunReloadCancel()
	self:HandleBulletQueue()
	self:HandleHoldType()
	self:HandleSprintCancelZoom()
	--self:HandleHoldToZoom()
	self:HandleCoolDown() -- don't predict
	self:HandleBuildUp()
	self:HandleHL2Pump()
	self:HandleShotgunReloadThinkAnimations() -- don't predict
	self:EquipThink() -- don't predict, ever
	self:HandleBurstFireShoot() -- don't predict, ever
	self:HandleReloadThink() -- don't predict, ever
	self:SpareThink()
	self:SwingThink()
	self:HolsterThink()
	self:IdleThink()
	self:HandleBulletsPerSecond()
	self:HandleZoomDelay()
	self:HandleBlocking()
	
	if (CLIENT or IsSingleplayer) then
		
		local FOVMOD = (45 + BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_viewmodel_fov",true):GetFloat() + self.AddFOV) * 0.75
		
		if self.HasScope and self:GetZoomed() and not self.IgnoreScopeHide then
			if self.ZoomDelay <= 0 or self:GetZoomOverlayDelay() == -1 then
				FOVMOD = 120
			end
		end

		self.ViewModelFOV = FOVMOD
	
		self:HandleZoomMod()

		if IsFirstTimePredicted() then 
			self:RemoveRecoil()
		end
	
	end
	
	if CLIENT then -- Don't Singleplayer
		self:SetNextClientThink( CurTime() + FrameTime() )
	end

	self:NextThink( CurTime() + FrameTime() )
	
	return true

end

function SWEP:HandleBlocking() -- Shared

	if self.EnableBlocking then
	
		if self.Owner:KeyDown(IN_ATTACK2) then
			self:SetNextPrimaryFire(CurTime() + self.IronSightTime)			
		end

		if SERVER then
			if self.Owner:KeyDown(IN_ATTACK2) and self:GetNextSecondaryFire() <= CurTime() then
				self:SetIsBlocking( true )
				self:SetHoldType("melee2")
			else
				self:SetHoldType(self.HoldType)
				self:SetIsBlocking( false )
			end
		end
		
	end
	
end

function SWEP:HandleAmmoSwitch() -- Shared


end

function SWEP:HandleZoomDelay() -- Shared
	if CLIENT or IsSingleplayer then
		if self:GetZoomOverlayDelay() > 0 and self:GetZoomOverlayDelay() <= CurTime()  then
			self:SetZoomOverlayDelay(-1)
		end
	end
end

function SWEP:HandleBulletsPerSecond() -- Shared
	--if self:GetCoolTime() <= CurTime() then
		self:SetBulletsPerSecond( math.Clamp(self:GetBulletsPerSecond() - FrameTime(),0,100) )
	--end
end

function SWEP:IdleAnimation() -- Shared
	self:SendWeaponAnimation(ACT_VM_IDLE)
end


function SWEP:IdleThink() -- Shared
	if self.HasIdle and self:GetNextIdle() <= CurTime() and not self:IsBusy() then
		self:IdleAnimation()
	end
end

function SWEP:SpareThink() -- Shared


end

function SWEP:HandleBuildUp() -- Shared
	if self.HasBuildUp or self.UsesBuildUp then
		if self:GetCoolTime() <= CurTime() then
			self:SetBuildUp( math.Clamp(self:GetBuildUp() - 0.015*self.BuildUpCoolAmount,0,100) )
		end
	end
end



function SWEP:EmitDryFireSound() -- Shared
	if SERVER then
		self.Owner:EmitSound(self.DryFireSound)
	end
	self:SetNextPrimaryFire( math.max(self:GetNextPrimaryFire(),CurTime() + 0.25) )
end

function SWEP:HasPrimaryAmmoToFire() -- Shared

	if self:Clip1() == -1 then
		if self.Primary.SpareClip ~= -1 and self.Owner:GetAmmoCount(self:GetPrimaryAmmo()) < 1 then 
			self:EmitDryFireSound()
			return false 
		else
			return true
		end
	elseif self:Clip1() <= 0 then
		self:EmitDryFireSound()
		return false
	end

	return true
	
end

function SWEP:HasSecondaryAmmoToFire() -- Shared

	if self:Clip2() == -1 then
		if self.Secondary.SpareClip ~= -1 and self.Owner:GetAmmoCount(self:GetSecondaryAmmo()) < 1 then 
			self:EmitDryFireSound()
			return false 
		else
			return true
		end
	elseif self:Clip2() <= 0 then
		self:EmitDryFireSound()
		return false
	end

	return true
	
end




function SWEP:HandleBurstFireShoot() -- Shared
	if self.HasBurstFire or self.AlwaysBurst or self.BulletDelay > 0 then
		if self:GetNextFireDelay() <= CurTime() and self:GetFireQueue() > 0 then
		
			self:SetNextFireDelay(CurTime() + self:GetBurstMath())
			self:SetFireQueue(self:GetFireQueue() - 1)
			
			--if not self:CanPrimaryAttack() then	return end
			if not self:CanShoot() then return end
			
			self:ShootGun()

		end
	end
end

function SWEP:HandleReloadThink() -- Shared

	if self:GetIsNormalReload() then
	
		--self:SetIsReloading(true)

		if self:GetReloadFinish() <= CurTime() and self:GetIsReloading() then

			if self.Owner:GetAmmoCount( self:GetPrimaryAmmo() ) >= self.Primary.ClipSize then
				self:SetClip1(self.Primary.ClipSize)
				self.Owner:RemoveAmmo(self.Primary.ClipSize,self:GetPrimaryAmmo())
				self.HasMagIn = true
			else
				self:SetClip1(self.Owner:GetAmmoCount(self:GetPrimaryAmmo()))
				self.Owner:RemoveAmmo(self.Owner:GetAmmoCount(self:GetPrimaryAmmo()),self:GetPrimaryAmmo())
				self.HasMagIn = true
			end

			self:SetIsNormalReload(false)
			self:SetIsReloading(false)
			
		end
		
	elseif self:GetIsShotgunReload() then
	
		self:SetIsReloading(true)
	
		if self:GetNextShell() <= CurTime() then
			if self.Owner:GetAmmoCount( self:GetPrimaryAmmo() ) > 0 and self:Clip1() < self.Primary.ClipSize then 
				self:SendWeaponAnimation(ACT_VM_RELOAD)
				self:SetClip1( self:Clip1() + 1 )
				self.Owner:RemoveAmmo(1,self:GetPrimaryAmmo())
				self:SetNextShell( CurTime() + self:GetTrueSequenceDuration() )

				if (CLIENT or IsSingleplayer) then
					if self.ReloadSound then
						self:EmitGunSound(self.ReloadSound)
					end
				end
				
			else
				self:FinishShotgunReload()
			end
		end
		
	end
end

function SWEP:FinishShotgunReload() -- Shared
	self:SendWeaponAnimation( ACT_SHOTGUN_RELOAD_FINISH )
	self:SetNextPrimaryFire(CurTime() + self:GetTrueSequenceDuration())
	self:SetIsShotgunReload(false)
	self:SetIsReloading(false)
end

function SWEP:CancelReload() -- Shared
	self:SetNextPrimaryFire(CurTime() + 0.1)
	self:SetIsReloading(false)
end

function SWEP:DoHL2Pump() -- Shared
	self:SendWeaponAnimation( self.PumpAnimation )
	self:SetNextPrimaryFire(CurTime() + self:GetTrueSequenceDuration())
	if (CLIENT or IsSingleplayer) and IsFirstTimePredicted() then
		if self.PumpSound then
			self.Owner:EmitSound(self.PumpSound)
		end
	end
end

function SWEP:HandleHL2Pump() -- Shared
	if self.HasPumpAction and self.HasHL2Pump and self:GetNeedsHL2Pump() and self:GetNextHL2Pump() ~= 0 and self:GetNextHL2Pump() <= CurTime() and not (self:GetZoomed() and self.HasScope) then
		if not (self:Clip1() == 0 or ( self:Ammo1() == 0 and self:Clip1() == -1) ) then
			self:DoHL2Pump()
			self:SetNeedsHL2Pump(false)
		else
			self:SetNextPrimaryFire(CurTime() + 0.1)
			self:SetNeedsHL2Pump(true)
		end
		self:SetNextHL2Pump(0)
	end
end

--[[
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}

	self.AmmoDisplay.Draw = true //draw the display?

	if self.Primary.ClipSize > 0 then
		self.AmmoDisplay.PrimaryClip = self:Clip1() //amount in clip
		self.AmmoDisplay.PrimaryAmmo = self:Ammo1() //amount in reserve
	end
	if self.Secondary.ClipSize > 0 then
		self.AmmoDisplay.SecondaryClip = self:Clip2()
		self.AmmoDisplay.SecondaryAmmo = self:Ammo2()
	end

	return self.AmmoDisplay //return the table
end
--]]

function SWEP:HandleShotgunReloadThinkAnimations() -- Shared
	if self:GetNextPrimaryFire() <= CurTime() then
		if self:GetIsShotgunReload() then
			if self:GetNextShell() <= CurTime() then
				if self.Owner:GetAmmoCount( self:GetPrimaryAmmo() ) > 0 and self:Clip1() < self.Primary.ClipSize then 
					self:SendWeaponAnimation(ACT_VM_RELOAD)
					self:SetNextPrimaryFire( CurTime() + self:GetTrueSequenceDuration() )

					if (CLIENT or IsSingleplayer) then
						if self.ReloadSound then
							self:EmitGunSound(self.ReloadSound)
						end
					end
				end

			end
		elseif self:GetNeedsHL2Pump() and self:GetNextHL2Pump() == 0 and self:Clip1() > 0 then
			--print("HI")
			self:DoHL2Pump()
			self:SetNeedsHL2Pump(false)
		end
	end
end

function SWEP:HandleCoolDown() -- Shared

	local CoolMul = FrameTime()*self.CoolSpeedMul*4
	
	if self:GetCoolTime() <= CurTime() then
		if self:GetCoolDown() ~= 0 then
			self:SetCoolDown(math.Clamp(self:GetCoolDown() - CoolMul,0,self.MaxHeat))
		end
	end
	
	if self.HasDual and self:GetCoolTimeLeft() <= CurTime() then
		if self:GetCoolDownLeft() ~= 0 then
			self:SetCoolDownLeft(math.Clamp(self:GetCoolDownLeft() - CoolMul,0,self.MaxHeat))
		end
	end

	if CLIENT and self.Owner == LocalPlayer() then
		if self.ClientCoolDown ~= 0 and self.ClientCoolTime <= CurTime() then 
			self.ClientCoolDown = math.Clamp(self.ClientCoolDown - CoolMul,0,self.MaxHeat)
		end
		
		if self.ClientCoolDownLeft ~= 0 and self.ClientCoolTimeLeft <= CurTime() then 
			self.ClientCoolDownLeft = math.Clamp(self.ClientCoolDownLeft - CoolMul,0,self.MaxHeat)
		end
	end

end

function SWEP:HandleZoomMod() -- Shared
	if self:GetZoomed() and self:GetZoomOverlayDelay() <= CurTime() then
		if self.ZoomDelay <= 0 or self:GetZoomOverlayDelay() == -1 then
			if self.HasIronSights then
				self:SetZoomMod( math.min(self:GetZoomMod() + FrameTime()*(1/self.ZoomTime),1) )
			else
				self:SetZoomMod( 1 )
			end
		end
	else
		if self.HasIronSights then
			self:SetZoomMod(math.max(self:GetZoomMod() - FrameTime()*(1/self.ZoomTime),0))
		else
			self:SetZoomMod(0)
		end
	end
end

function SWEP:RemoveRecoil() -- Client

	local pUp = self:HandleLimits(self.PunchAngleUp.p)
	local yUp = self:HandleLimits(self.PunchAngleUp.y)
	local rUp = self:HandleLimits(self.PunchAngleUp.r)

	local pDown = self:HandleLimits(self.PunchAngleDown.p)
	local yDown = self:HandleLimits(self.PunchAngleDown.y)
	local rDown = self:HandleLimits(self.PunchAngleDown.r)

	local FrameMul = 0.015*15*self.RecoilSpeedMul
	local UpMul = 1 * FrameMul
	local DownMul = 0.75 * FrameMul
	
	local ModAngle = Angle(0,0,0)
	
	if self.PunchAngleUp ~= Angle(0,0,0) then
		local CurrentMod = Angle( (pUp*UpMul),(yUp*UpMul),(rUp*UpMul))
		ModAngle = ModAngle + CurrentMod
		self.PunchAngleUp = self.PunchAngleUp - CurrentMod
	end
	
	if self.PunchAngleDown ~= Angle(0,0,0)  then
		local CurrentMod = Angle( (pDown*DownMul),(yDown*DownMul),(rDown*DownMul))
		ModAngle = ModAngle - CurrentMod
		self.PunchAngleDown = self.PunchAngleDown - CurrentMod
	end
	
	if ModAngle ~= Angle(0,0,0) then
		self.Owner:SetEyeAngles(self.Owner:EyeAngles() + ModAngle)
	end
	
end

function SWEP:HandleLimits(value) -- Unknown

	local Limit = 0.001

	if value < Limit and value > -Limit then
		value = 0
	end

	return value
	
end

function SWEP:SpecialFalloff(falloff) -- Shared

	return falloff
end

if CLIENT then -- Cleint

	BurgerBase_ContextMenuIsOpen = false

	function BurgerBase_ContextMenuOpen()
		BurgerBase_ContextMenuIsOpen = true
	end

	hook.Add("OnContextMenuOpen","BurgerBase_ContextMenuOpen",BurgerBase_ContextMenuOpen)

	function BurgerBase_ContextMenuClose()
		BurgerBase_ContextMenuIsOpen = false
	end

	hook.Add("OnContextMenuClose","BurgerBase_ContextMenuClose",BurgerBase_ContextMenuClose)

end


function SWEP:GetFakeDelay() -- Shared
	return -1
end

function BURGERBASE_CalculateWeaponStats(owner,weapon,avoidfunctions) -- Shared

	local ReturnTable = {}
		
	if not (weapon and weapon ~= NULL and weapon.Base == "weapon_burger_core_base") then return ReturnTable end

	local EyeTrace = owner:GetEyeTrace()
	local EyePos = EyeTrace.StartPos
	local HitPos = EyeTrace.HitPos
	local MatType = EyeTrace.MatType
	
	-- Start Data
	local Damage = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damagescale"):GetFloat()
	local Shots = 1
	local Delay = 1
	local ClipSize = weapon.Primary.ClipSize		
	local Name = weapon.PrintName .. " | " .. weapon.Category
	local AmmoType = "none"
	
	if avoidfunctions then
		Damage = Damage * weapon.Primary.Damage
		Shots = weapon.Primary.NumShots
		Delay = weapon.Primary.Delay
		if CLIENT then
			AmmoType = language.GetPhrase(weapon.Primary.Ammo .. "_ammo")
		end
	else
		Damage = Damage * weapon:SpecialDamage(weapon.Primary.Damage)
		Shots = weapon:SpecialShots(weapon.Primary.NumShots)
		if weapon:GetPrimaryAmmo() and weapon:GetPrimaryAmmo() ~= -1 then
			if CLIENT then
				AmmoType = language.GetPhrase(game.GetAmmoName(weapon:GetPrimaryAmmo()) .. "_ammo")
			end
		end
		if weapon:GetFakeDelay() ~= -1 then
			Delay = weapon:GetFakeDelay()
		else
			Delay = weapon:GetDelay()
		end
	end

	Damage = math.Round(Damage, 2 )

	local FullDamage = Damage * Shots
	local BulletsFired = 1
	local SecondsPassed = 0
	local TestKillTime = -1

	local ClipSizeMath = math.Clamp(ClipSize-1,0,20)
	
	if ClipSizeMath < 1 then
		ClipSizeMath = 20
	end
	
	for i=1, ClipSizeMath do
	
		if TestKillTime == -1 then
			if BulletsFired*FullDamage >= 100 then
				TestKillTime = SecondsPassed
			end
		end
		
		if !avoidfunctions and weapon:GetIsBurst() then
			SecondsPassed = SecondsPassed + weapon:GetBurstMath()
			if i % weapon.BurstOverride == 0 then
				SecondsPassed = SecondsPassed + Delay
			end
		else
			SecondsPassed = SecondsPassed + Delay
		end
		
		BulletsFired = BulletsFired + 1
		
	end
	
	if TestKillTime == -1 then
		TestKillTime = 0
	end

	local AverageDelay = SecondsPassed/(BulletsFired-1)	
	local RPM = (1/AverageDelay)*60
	local DPS = ((BulletsFired-1)*FullDamage)/(SecondsPassed)
	local KillTime = TestKillTime

	if !(ClipSize == -1) then
		DPS = math.Clamp(DPS,0,ClipSize*FullDamage)
	end

	-- Accuracy
	local Cone = weapon.Primary.Cone
	if not avoidfunctions then
		Cone = weapon:HandleCone(Cone,false,(weapon.HasDual and weapon:GetIsLeftFire()))
	end
	if not Cone then
		Cone = 0
	end
	
	local BaseAccuracy = 0.1
	local Accuracy = (BaseAccuracy - math.Clamp(Cone,0,BaseAccuracy)) / BaseAccuracy
	Accuracy = math.Round(Accuracy, 2 )	
	
	-- Range
	local FullRange = weapon.DamageFalloff
	if not avoidfunctions then 
		FullRange = weapon:SpecialFalloff(weapon.DamageFalloff)
	end
	
	-- Bullet Penetration
	
	local MatCalc = 1
	if not avoidfunctions then
		MatCalc = weapon:CalculateMaterialPenetration(MatType)
	end
	
	local PenetrationLossPerUnit = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_penetration_scale"):GetFloat() * MatCalc * math.max(0.1,weapon.PenetrationLossMul or 1) * 1
	local BulletPenetration = Damage / math.max(3,PenetrationLossPerUnit)
	
	ReturnTable.name = Name or ""
	ReturnTable.ammo = AmmoType or "none"
	ReturnTable.clip = ClipSize or -1
	ReturnTable.damage = Damage or 0
	ReturnTable.shots = Shots or 1
	ReturnTable.delay = Delay or 1
	ReturnTable.rpm = RPM or 0
	ReturnTable.dps = DPS or 0
	ReturnTable.killtime = KillTime or 1
	ReturnTable.accuracy = Accuracy or 1
	ReturnTable.range = FullRange or 100
	ReturnTable.penetration = BulletPenetration or 1
	
	return ReturnTable

end

function SWEP:EquipThink() -- Shared

	if self.WeaponType ~= "Throwable" then return end

	if self:GetIsThrowing() then
	
		local ShouldExplode = self:GetGrenadeExplosion() ~= 0 and self:GetGrenadeExplosion() <= CurTime()
	
		if self.CanCook and ShouldExplode then
			self:ThrowObject(self.Object,0)
			if self:Ammo1() > 0 then
				self:TakePrimaryAmmo(1)
			end
			self:SetGrenadeExplosion(0)
			self:RemoveGrenade()
			return
		end
	
		if !self.Owner:KeyDown(IN_ATTACK) and self:GetThrowDelay() ~= 0 and self:GetThrowDelay() <= CurTime() then
		
			self:SendWeaponAnimation(ACT_VM_THROW)
			self.Owner:SetAnimation(PLAYER_ATTACK1) 

			self:SetThrowTime(CurTime() + self:GetTrueSequenceDuration()*0.33)
			self:SetThrowRemoveTime(CurTime() + self:GetTrueSequenceDuration())
			self:SetThrowDelay(0)
			
		end
		
		if not ShouldExplode and self:GetThrowTime() ~= 0 and self:GetThrowTime() <= CurTime() then
			self:ThrowObject(self.Object,1000)
			if self:Ammo1() > 0 then
				self:TakePrimaryAmmo(1)
			end
			self:SetThrowTime(0)
			self:SetGrenadeExplosion(0)
		end
		
		if self:GetThrowRemoveTime() ~= 0 and self:GetThrowRemoveTime() <= CurTime() then
			self:RemoveGrenade()
		end

	end
	
end

function SWEP:RemoveGrenade() -- Shared

	self:SetCanHolster( true )
	self:SetIsThrowing( false )
	
	if self:Ammo1() > 0 then
		self:SendWeaponAnimation(ACT_VM_DRAW)
	else
		self:SwitchToPrimary()
		if SERVER then
			self:Remove(self.Weapon)
		end
	end
	
	self:SetThrowRemoveTime(0)
	
end


function SWEP:SwitchToPrimary() -- Shared

	
	if self.Owner and self.Owner ~= NULL then
		if self.Owner:IsBot() then
			if SERVER then
				local Weapons = self.Owner:GetWeapons()
				
				local WeaponFound = false
				
				for k,v in pairs(Weapons) do
					if not WeaponFound and self.Owner:HasWeapon(v:GetClass()) and v.Category == "Counter-Strike" then
						self.Owner:SetActiveWeapon(v)
						self.Owner:DrawWorldModel( true )
						WeaponFound = true
					end
				end
				
			end
		elseif SERVER or (CLIENT and self.Owner == LocalPlayer()) then
			self.Owner:ConCommand("lastinv")
		end
	end
	
	
end

function SWEP:QuickThrow() -- Shared
	self:PreThrowObject(true)
end

function SWEP:PreThrowObject(override) -- Shared

	if self:IsUsing() and not override then return end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	
	local ThrowDelay = 0.15
	
	if self.HasPreThrow then
		self:SendWeaponAnimation( ACT_VM_PULLPIN )
		ThrowDelay = self:GetTrueSequenceDuration()
	end
	
	self:SetThrowDelay(CurTime() + ThrowDelay)
	self:SetGrenadeExplosion(CurTime() + self.FuseTime)
	
	self:SetCanHolster( false )
	self:SetIsThrowing( true )
	
end

function SWEP:ThrowObject(object,force) -- Shared

	if (CLIENT) then return end
	local EA =  self.Owner:EyeAngles()
	local pos = self.Owner:GetShootPos() + EA:Right() * 5 - EA:Up() * 4 + EA:Forward() * 8	

	local ent = ents.Create(object)		
	ent:SetPos(pos)
	ent:SetAngles(EA)
	ent:Spawn()
	ent:Activate()
	ent:SetOwner(self.Owner)
	ent.ExplodeTime = self:GetGrenadeExplosion()
	
	if ent:GetPhysicsObject():IsValid() then
		if object == "ent_hl2_gasparticle" then
			ent:GetPhysicsObject():SetVelocity( EA:Forward()*force + EA:Right()*math.random(-20,20) + EA:Up()*math.random(-20,20) + Vector(0,0,-10) )
		else
			ent:GetPhysicsObject():SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force + EA:Up()*50)
		end
	else
		ent:SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force)
	end

end

function SWEP:QuickKnife() -- Shared

end

SWEP.MeleeCanParry = true

function SWEP:StartSwing(damage,delay,entoverride,delayoverride) -- Shared

	if self.MeleeCanParry and self.MeleeDelay > 0 then
		self:SetClashTime(CurTime() + self.MeleeDelay*2)
	end

	if self.MeleeDelay > 0 then
		self:SetShouldMelee(true)
		self:SetNextMeleeDamage(damage)
		if delayoverride then
			self:SetNextMelee(CurTime() + delayoverride)
		else
			self:SetNextMelee(CurTime() + self.MeleeDelay)
		end
		self:SetNextMeleeEnt(entoverride)
		self:EmitGunSound(self.MeleeSoundMiss)
	else
		local Returner = self:MidSwing(damage,entoverride)
		if not (Returner and Returner ~= NULL) then
			self:EmitGunSound(self.MeleeSoundMiss)
		end
		self:FinishSwing(Returner,damage)
		return Returner
	end
	
end



function SWEP:AddDurability(amount) -- Shared

	self:SetClip1( math.Clamp(self:Clip1() + amount,0,100) )

	if self:Clip1() <= 0 then
		self.Owner:EmitSound("physics/metal/sawblade_stick1.wav")
		if self and SERVER then
			self.Owner:StripWeapon(self:GetClass())
		end
	end
	
end

function SWEP:SwingThink() -- Shared

	if self:GetShouldMelee() and self:GetNextMelee() <= CurTime() then
		local HitEntity = self:GetNextMeleeEnt()
		local Damage = self:GetNextMeleeDamage()
		HitEntity = self:MidSwing(Damage,HitEntity)	
		self:SetShouldMelee(false)
		self:SetNextMeleeDamage(0)
		self:SetNextMeleeEnt(nil)
		self:FinishSwing(HitEntity,Damage)
	end

end

function SWEP:MeleeRange() -- Shared
	return 40
end

function SWEP:MeleeSize() -- Shared
	return 40
end

function SWEP:MidSwing(damage,entoverride) -- Shared

	if entoverride and entoverride ~= NULL then
		self:SendMeleeDamage(entoverride,damage,nil)
		return entoverride
	else

		local StartPos = self.Owner:GetShootPos()
		local EndPos = self.Owner:GetShootPos() + self.Owner:GetAimVector()*self:MeleeRange()
		local LineFilterFunction = self.Owner
		local HullFilterFunction = 	function(ent) 
										return !(ent == self.Owner) and (ent:IsPlayer() or ent:IsNPC())
									end
		local Bounds = Vector(self:MeleeSize(),self:MeleeSize(),self:MeleeSize())
		local TraceResult = self:DoDoubleTrace(StartPos,EndPos,MASK_SHOT,Bounds,LineFilterFunction,HullFilterFunction)
		
		local Victim = TraceResult.Entity
		
		--if Victim and Victim ~= NULL then
			self:SendMeleeDamage(TraceResult.Entity,damage,TraceResult)
		--end
		
		return Victim

	end

end

function SWEP:FinishSwing(HitEntity,Damage) -- Shared

end

function SWEP:DoDoubleTrace(startpos,endpos,mask,bounds,linefilterfunction,hullfilterfunction) -- Shared

	local LineTraceData = {}
	LineTraceData.start = startpos
	LineTraceData.endpos = endpos
	LineTraceData.filter = linefilterfunction
	LineTraceData.mask = MASK_SHOT

	if self.Owner:IsPlayer() then
		self.Owner:LagCompensation( true )
	end
	
	local LineTraceResult = util.TraceLine(LineTraceData)

	if self.Owner:IsPlayer() then
		self.Owner:LagCompensation( false )
	end
	
	if LineTraceResult.Entity and LineTraceResult.Entity ~= NULL and LineTraceResult.Entity:Health() > 0 then
		return LineTraceResult
	else
	
		local HullTraceData = {}
		HullTraceData.start = startpos
		HullTraceData.endpos = endpos
		HullTraceData.filter = hullfilterfunction
		HullTraceData.mask = MASK_SHOT_HULL
		HullTraceData.mins = -bounds
		HullTraceData.maxs = bounds
		HullTraceData.ignoreworld = true
	
		if self.Owner:IsPlayer() then
			self.Owner:LagCompensation( true )
		end
		
		local HullTraceResult = util.TraceHull(HullTraceData)
	
		if self.Owner:IsPlayer() then
			self.Owner:LagCompensation( false )
		end

		if HullTraceResult.Entity and HullTraceResult.Entity ~= NULL and HullTraceResult.Entity:Health() > 0 then
			return HullTraceResult
		else
			return LineTraceResult
		end

	end

end

SWEP.MeleeBackStabMul = 2
SWEP.MeleeBlockRange = 90 + 45
SWEP.MeleeBlockReduction = 0.1

function SWEP:SendMeleeDamage(victim,damage,TraceResult) -- Shared

	if (victim and victim ~= NULL) and (victim:IsPlayer() or victim:IsNPC()) then
				
		local VictimAngles = victim:EyeAngles()
		local AttackerAngles = self.Owner:EyeAngles()
		VictimAngles:Normalize()
		AttackerAngles:Normalize()
		local NewAngles = VictimAngles - AttackerAngles
		NewAngles:Normalize()
		
		local Yaw = math.abs(NewAngles.y)
		
		if Yaw < 45 then
			damage = damage * self.MeleeBackStabMul
		end

		VictimWeapon = victim:GetActiveWeapon()

		if (VictimWeapon and VictimWeapon ~= NULL) and ((VictimWeapon.EnableBlocking and ((VictimWeapon:GetIsBlocking() and VictimWeapon:GetNextSecondaryFire() <= CurTime()) or ( VictimWeapon:GetClashTime() >= CurTime() and math.abs(VictimWeapon:GetClashTime() - self:GetClashTime()) > self.MeleeDelay ))) and (Yaw > 180 - self.MeleeBlockRange/2 and Yaw < 180 + self.MeleeBlockRange/2)) then
			damage = damage * self.MeleeBlockReduction
			self:DoMeleeDamage(damage, victim, TraceResult)
			VictimWeapon:BlockDamage(damage,self.Owner,self)
			self:SetShouldMelee(false)
			VictimWeapon:SetShouldMelee(false)
		else
			self:DoMeleeDamage(damage, victim, TraceResult)
		end
	else
		self:DoMeleeDamage(damage, victim, TraceResult)
	end

end

function SWEP:BlockDamage(damage,attacker,attackerweapon) -- Shared
	attacker:ViewPunch(Angle(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1)))
	self.Owner:ViewPunch(Angle(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1)))
	self.Owner:DoAnimationEvent( ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND )
	self:SetNextPrimaryFire(CurTime() + attackerweapon.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + attackerweapon.Primary.Delay)
	self:EmitSound(self.MeleeSoundWallHit)
	attackerweapon:SetNextPrimaryFire(CurTime() + 1.5)
	attackerweapon:SetNextSecondaryFire(CurTime() + 1.5)
	attackerweapon:EmitSound(self.MeleeSoundWallHit)
end

function SWEP:DoMeleeDamage(damage, victim, traceresult) -- Shared

	if victim and victim ~= NULL then
	
		if (victim:IsPlayer() or victim:IsNPC()) then
			if damage <= self:SpecialDamage(self.Primary.Damage) then
				self:EmitGunSound(self.MeleeSoundFleshSmall)
			else
				self:EmitGunSound(self.MeleeSoundFleshLarge)
				self:MeleeFleshEffect(victim)
			end
		else
			self:EmitGunSound(self.MeleeSoundWallHit)
		end

		local dmginfo = DamageInfo()
		dmginfo:SetDamage( damage )
		dmginfo:SetDamageType( self.MeleeDamageType )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self )
		dmginfo:SetDamageForce( self.Owner:GetForward() )
		if traceresult then
			victim:DispatchTraceAttack( dmginfo, traceresult )
		elseif SERVER then
			victim:TakeDamageInfo(dmginfo)
		end
		
		if traceresult and IsFirstTimePredicted() then
			self:BulletEffect(traceresult.HitPos,traceresult.StartPos,victim,traceresult.SurfaceProps,self.MeleeDamageType)
		end

	end

end

function SWEP:MeleeFleshEffect(victim,traceresult) -- Shared

	local StartPos = self.Owner:EyePos()
	local HitPos = victim:GetPos() + victim:OBBCenter()
	local NormalShit = (StartPos - HitPos):GetNormalized()
	
	local effect = EffectData()
	effect:SetOrigin(HitPos)
	effect:SetStart(StartPos)
	effect:SetNormal(NormalShit)
	effect:SetFlags(3)
	effect:SetScale(6)
	effect:SetColor(0)
	effect:SetDamageType(self.MeleeDamageType)
		
	if CLIENT or IsSingleplayer then
		effect:SetEntity(victim)
	else
		effect:SetEntIndex(victim:EntIndex())
	end
	
	util.Effect("bloodspray", effect)
	util.Effect("BloodImpact", effect)

	util.Decal( "Blood", StartPos, StartPos + NormalShit*100)
	util.Decal( "Blood", victim:GetPos(), victim:GetPos())	
	
end

function SWEP:GetActivities() -- Shared

	if CLIENT then

		local ent = self

		local k, v, t

		t = { }

		for k, v in ipairs( ent:GetSequenceList( ) ) do
			table.insert( t, { id = k, act = ent:GetSequenceActivity( k ), actname = ent:GetSequenceActivityName( k ) } )
		end

		PrintTable(t)
		print("--------------------")
		PrintTable(self:GetSequenceList())
		
	end
  
end

function SWEP:OnRemove() -- Shared
	if CLIENT then
		self:SCK_OnRemove()
	end
end

--------------------------------
--SWEP CONTSTRUCTION KIT STUFF--
--------------------------------

local datatable = {}

local BulletMaterial = Material( "effects/spark" )
local SpriteMaterial = Material( "sprites/light_glow02_add" )

datatable.drawfunction = function(datatable)

	local Forward = datatable.direction:GetNormalized()
	local BulletLength = datatable.direction:Length()*0.01
	local BulletWidth = datatable.damage*(16/100)

	render.SetMaterial( BulletMaterial )
	render.DrawBeam( datatable.pos , datatable.pos + Forward*BulletLength, BulletWidth ,0, 1, Color(255,255,255,255) )
	
	render.SetMaterial( SpriteMaterial )
	render.DrawSprite( datatable.pos + Forward*BulletLength, BulletWidth*0.5, BulletWidth*0.5, Color(255,255,255,255) )

end


datatable.diefunction = function(datatable)

end

datatable.hitfunction = function(datatable,traceresult)

	local Victim = traceresult.Entity
	local Attacker = datatable.owner
	local Inflictor = datatable.weapon
	
	if not IsValid(Attacker) then
		Attacker = Victim
	end
	
	if not IsValid(Inflictor) then
		Inflictor = Attacker
	end
	
	if IsValid(Attacker) and IsValid(Victim) and IsValid(Inflictor) and (not datatable.previoushit or datatable.previoushit ~= Victim) then
		local DmgInfo = DamageInfo()
		DmgInfo:SetDamage( datatable.damage )
		DmgInfo:SetAttacker( Attacker )
		DmgInfo:SetInflictor( Inflictor )
		DmgInfo:SetDamageForce( datatable.direction:GetNormalized() )
		DmgInfo:SetDamagePosition( datatable.pos )
		DmgInfo:SetDamageType( DMG_BULLET )
		datatable.previoushit = Victim
		traceresult.Entity:DispatchTraceAttack( DmgInfo, traceresult )	
	end

	if not traceresult.StartSolid then
		if SERVER and IsFirstTimePredicted() and !Victim:IsPlayer() then
		
			local effect = EffectData()
			effect:SetOrigin(traceresult.HitPos)
			effect:SetStart(traceresult.StartPos)
			effect:SetSurfaceProp(traceresult.SurfaceProps)
			effect:SetDamageType(DMG_BULLET)
			
			if (CLIENT or IsSingleplayer) then
				effect:SetEntity(Victim)
			else
				effect:SetEntIndex(Victim:EntIndex())
			end

			util.Effect("Impact", effect)
		
		end
	end
	
	if datatable.damage >= 1 then
		return true
	else
		datatable.damage = datatable.damage - (traceresult.Fraction*datatable.direction:Length())
	end

end

BURGERBASE_RegisterProjectile("css_bullet",datatable)

local datatable = {}

local NadeModel = Model("models/weapons/ar2_grenade.mdl")

datatable.drawfunction = function(datatable)
	if datatable.special and datatable.special ~= NULL then
		datatable.special:SetPos(datatable.pos)
		datatable.special:SetAngles( datatable.direction:GetNormalized():Angle() )
		datatable.special:DrawModel()
	else
		datatable.special = ClientsideModel(NadeModel, RENDERGROUP_OPAQUE )
	end
end

datatable.hitfunction = function(datatable,traceresult)
	
	local Victim = traceresult.Entity
	local Attacker = datatable.owner
	local Inflictor = datatable.weapon
	
	if not IsValid(Attacker) then
		Attacker = Victim
	end
	
	if not IsValid(Inflictor) then
		Inflictor = Attacker
	end
	
	if IsValid(Attacker) and IsValid(Inflictor) then
	
		local DmgInfo = DamageInfo()
		DmgInfo:SetDamage( datatable.damage )
		DmgInfo:SetAttacker( Attacker )
		DmgInfo:SetInflictor( Inflictor )
		DmgInfo:SetDamageForce( datatable.direction:GetNormalized() )
		DmgInfo:SetDamagePosition( traceresult.HitPos )
		DmgInfo:SetDamageType( DMG_SHOCK )
		util.BlastDamageInfo( DmgInfo, traceresult.HitPos, 512 )
		
		if IsFirstTimePredicted() then
			local effectdata = EffectData()
			effectdata:SetStart( traceresult.HitPos + datatable.direction:GetNormalized()*100)
			effectdata:SetOrigin( traceresult.HitPos)
			effectdata:SetScale( 1 )
			effectdata:SetRadius( 1 )
			util.Effect( "Explosion", effectdata)
		end
		
	
	end
	
end

datatable.diefunction = function(datatable)
	if CLIENT then
		if datatable.special and datatable.special ~= NULL then
			datatable.special:Remove()
		end
	end
end

BURGERBASE_RegisterProjectile("launched_grenade",datatable)