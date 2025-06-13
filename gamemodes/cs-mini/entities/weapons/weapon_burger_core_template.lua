if CLIENT then
	killicon.AddFont( "weapon_burger_cs_ak47", "csd", "b", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/ak47")
end

-- Weapon Information
SWEP.Category				= "Other" 												
SWEP.PrintName				= "Example Weapon" 							
SWEP.Base					= "weapon_burger_core_base" 						
SWEP.BurgerBase				= true 									
SWEP.WeaponType				= "Primary"									
SWEP.Cost					= 2500										
SWEP.CSSMoveSpeed			= 221										

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
SWEP.ViewModel 				= "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.ViewModelFlip 			= false
SWEP.UseHands				= true
SWEP.IgnoreScopeHide		= false
SWEP.AddFOV					= 0

-- Bullet Information
SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_AK47.Single")
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
SWEP.MoveConeMul			= 1
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1
SWEP.PenetrationLossMul		= 1
SWEP.SideRecoilBasedOnDual	= false
SWEP.FatalHeadshot			= false
SWEP.TracerType				= 1
SWEP.DamageFalloff			= 3000
SWEP.ReloadTimeAdd			= 0

SWEP.ShootOffsetStrength	= Angle(0,0,0) -- Recoil for OP Snipers

-- Sounds
SWEP.ZoomInSound			= Sound("weapons/zoom.wav")
SWEP.ZoomOutSound			= Sound("weapons/zoom.wav")
SWEP.ReloadSound 			= nil
SWEP.BurstSound				= nil
SWEP.LastBulletSound		= nil
SWEP.PumpSound				= nil
SWEP.MeleeSoundMiss			= nil
SWEP.MeleeSoundWallHit		= nil
SWEP.MeleeSoundFleshSmall	= nil
SWEP.MeleeSoundFleshLarge	= nil

-- Features
SWEP.HasIronSights 			= true
SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasSpecialFire			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasBuildUp				= false -- Uses Minigun Buildup
SWEP.UsesBuildUp			= false -- Uses Buildup for Custom Reasons
SWEP.BuildUpAmount			= 10
SWEP.BuildUpCoolAmount 		= 50

SWEP.HasIdle				= false
SWEP.IdleOffset 			= 0

SWEP.DisableReloadUntilEmpty = false
SWEP.IgnoreDrawDelay		= false
SWEP.EnableDropping 		= true

-- Melee
SWEP.EnableBlocking			= false
SWEP.MeleeDelay				= 0.05
SWEP.MeleeDamageType		= DMG_SLASH

-- Zooming
SWEP.HasIronCrosshair		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-3, 20, 0)
SWEP.IronSightsAng 			= Vector(1.25, 1, 0)
SWEP.ZoomAmount 			= 1
SWEP.ZoomDelay				= 0

-- Scope
SWEP.HasScope 				= false
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

-- Magazine Mod
SWEP.MagDelayMod			= 0.75
SWEP.MagMoveMod 			= Vector(0,0,0)
SWEP.MagAngMod				= Angle(0,0,0)

-- PLEASE TEST
SWEP.DelayOverride			= false