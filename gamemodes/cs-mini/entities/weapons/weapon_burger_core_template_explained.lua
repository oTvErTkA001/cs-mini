if CLIENT then
	killicon.AddFont( "weapon_burger_cs_ak47", "csd", "b", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/ak47")
end

SWEP.Category				= "Counter-Strike" 							-- The Weapon Category this weapon spawns in.							
SWEP.PrintName				= "Example Weapon" 							-- The name of the weapon.			
SWEP.Base					= "weapon_burger_core_base" 						-- The base the weapon uses. Should always be "weapon_burger_base" unless you know exactly what you're doing.
SWEP.BurgerBase				= true 										-- Confirmation that this uses Burger's Base. Should always be true unless you know exactly what you're doing.
SWEP.WeaponType				= "Primary"									-- The weapon type of the weapon. Valid Values: Primary, Secondary, Free, Melee.

SWEP.Cost					= 2500										-- The Cost of the weapon. Doesn't do anything, but it's good for other developers to check the cost of the weapon (Like DarkRP)
SWEP.CSSMoveSpeed			= 221										-- The base movespeed of the weapon, in units per second. This movement value is scaled based on the player's actual movespeed.

SWEP.Spawnable				= false										-- Should be spawnable by the Q menu, if the gamemode has one.
SWEP.AdminOnly				= false										-- Only admins can spawn this weapon, if the gamemode has a q menu.

SWEP.Slot					= 3											-- Slot for the weapon. Subtract 1 from the initial slot value. (Example: If you want a weapon to be in slot 4, then set the slot to 3. Don't ask my why this is a thing, blame garry.
SWEP.SlotPos				= 1											-- Position of the slot in vertical form. Not really that useful, and it should be at 1.
SWEP.Weight					= 0											-- Priority of the weapon in terms of automatic weapon switching. Not the actual physical weight itself.
SWEP.AutoSwitchTo			= false										-- Set to true if you want players to switch to this weapon if they get it, if the weapon's weight is higher than the previous weapon's weight.
SWEP.AutoSwitchFrom			= false										-- Set to true if you want players to switch from this weapon if they get it, if the next weapon's weight is higher than the weapon's weight.

SWEP.UseHands				= true										-- Set to true if you want players to use c_model (player specific) hands. Only works with some weapons that support this.
SWEP.ViewModel 				= "models/weapons/cstrike/c_rif_ak47.mdl"	-- The viewmodel of the weapon.
SWEP.WorldModel				= "models/weapons/w_rif_ak47.mdl"
SWEP.DisplayWorldModel		= nil
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 36
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("Weapon_AK47.Single")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "bb_762mm"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.MoveConeMul				= 1.5
SWEP.HeatMul				= 1.5
SWEP.CoolMul				= 0.6




SWEP.HasScope 				= false
SWEP.HasCrosshair 			= true

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasIronSights 			= true

SWEP.HasIronCrosshair		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-3, 20, 0)
SWEP.IronSightsAng 			= Vector(1.25, 1, 0)
SWEP.ZoomAmount 			= 1

SWEP.DamageFalloff			= 3000

SWEP.AddFOV					= -10