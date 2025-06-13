if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end
///////////////////////////////////////////////////////////
///														///
///				Project Start: 11/11/13					///
///														///
///////////////////////////////////////////////////////////
/*---------------------------------------------------------
	Client Variables
---------------------------------------------------------*/
if ( CLIENT ) then

	SWEP.PrintName			= "SWEPNAME"			
	SWEP.Author				= "Fonix"
	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "" --Text Font
	SWEP.IconLetterCSS		= "" --For Css Font
	SWEP.DrawCrosshair		= true
	SWEP.DrawAmmo			= true
	SWEP.CSMuzzleFlashes	= true
	
	killicon.AddFont( "weapon_cs_ak47_gb", "TextKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	surface.CreateFont("TextKillIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(13),antialiasing=true,additive=true })
	surface.CreateFont("TextSelectIcons", { font="Roboto-Medium", weight="500", size=ScreenScale(20),antialiasing=true,additive=true })
	surface.CreateFont("CSKillIcons", { font="csd", weight="500", size=ScreenScale(30),antialiasing=true,additive=true })
	surface.CreateFont("CSSelectIcons", { font="csd", weight="500", size=ScreenScale(60),antialiasing=true,additive=true })

end
/*---------------------------------------------------------
	The Layout...
---------------------------------------------------------*/
SWEP.Category			= "Hello"
SWEP.ViewModelFlip		= true

SWEP.Spawnable			= false 	-- Delete this comment and change these to true
SWEP.AdminSpawnable		= false		-- If you don't you can't spawn the swep :(

SWEP.Base				= "br_weapon_base"
SWEP.ViewModel			= "models/weapons/v_rif_ak47.mdl"
SWEP.WorldModel			= "models/weapons/w_rif_ak47.mdl"
SWEP.ViewModelFOV		= 65

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= true
SWEP.BounceWeaponIcon	= false

SWEP.Primary.Sound			= Sound( "" )
SWEP.SilencedSound			= Sound( "" ) --This is for silencers. Dont bite me, I know its really called a suppressor.
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 34
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.08
SWEP.Primary.DefaultClip	= 300
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 		= Vector( 3.4, -3, 1.2 )
SWEP.IronSightsAng 		= Vector( 0.5, 0.0, 0 )

--Extras
SWEP.MuzzleEffect			= "lee_muzzle_rifle"	-- Muzzle attachments should not be messed with
SWEP.MuzzleAttachment			= "1"			-- There's only one anyways
SWEP.MuzzleAttachmentTrue		= true		-- Keep it true
SWEP.TracerShot				= 3		-- On what shot should there be a tracer?
SWEP.TakeAmmoOnShot			= 1     -- How many rounds should we take per shot? Typically leave this at one.
SWEP.BulletForce			= 10	-- The force a bullet has on a prop
SWEP.Silenceable			= false		-- If the model supports a silencer
SWEP.SilenceHolster			= 0		-- The timing for silencer animation
SWEP.ZoomFOV				= 65	-- Fov for when we're aiming
SWEP.CSSZoom				= false	-- This is for using Zoom Delays. Example the AUG zoom in CSS
SWEP.MPrecoil				= 1		-- Changes the amount of view punch in multiplayer
SWEP.ReloadHolster			= 1		-- How long should we wait before allowing think when reloading
SWEP.ReloadSound			= false	-- This has only been found to be used on HL2 weapons

-- Accuracy
SWEP.CrouchCone				= 0.01 -- Accuracy when we're crouching
SWEP.CrouchWalkCone			= 0.02 -- Accuracy when we're crouching and walking
SWEP.WalkCone				= 0.025 -- Accuracy when we're walking
SWEP.AirCone				= 0.1 -- Accuracy when we're in air
SWEP.StandCone				= 0.015 -- Accuracy when we're standing still
SWEP.IronSightsCone			= 0.006 -- Accuracy when we're aiming
SWEP.Delay				= 0.08	-- Delay For Not Zoom
SWEP.Recoil				= 1	-- Recoil For not Aimed
SWEP.RecoilZoom				= 0.3	-- Recoil For Zoom