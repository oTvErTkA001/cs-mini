SWEP.PrintName = "Smoke Grenade"

SWEP.Category = "Counter-Strike Mini"

SWEP.BounceWeaponIcon = false
SWEP.DrawWeaponInfoBox = false

if CLIENT then
surface.CreateFont( "CSSelectIcons",
{
font = "csd",
size = 96,
weight = 0
})
end

SWEP.Spawnable= true
SWEP.AdminSpawnable= true
SWEP.AdminOnly = false

SWEP.ViewModelFOV = 50
SWEP.ViewModel = "models/weapons/cstrike/c_eq_smokegrenade.mdl"
SWEP.WorldModel = "models/weapons/w_eq_smokegrenade.mdl"
SWEP.ViewModelFlip = false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 2

SWEP.Slot = 3
SWEP.SlotPos = 3

SWEP.UseHands = true

SWEP.HoldType = "grenade"

SWEP.FiresUnderwater = false

SWEP.DrawCrosshair = false

SWEP.DrawAmmo = true

SWEP.Base = "weapon_base"

SWEP.CSMuzzleFlashes = true

SWEP.Throw = 0

SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
draw.SimpleText( "Q", "CSSelectIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
end

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
end

function SWEP:Deploy()
self:SetNextPrimaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self:SetNextSecondaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self.Throw = 0
end

function SWEP:Holster()
self.Throw = 0
if self.Throw == 2 then
self.Owner:DropWeapon( self )
self.Remove()
end
return true
end

function SWEP:PrimaryAttack()
if self.Throw == 0 then
self.Weapon:SendWeaponAnim( ACT_VM_PULLPIN )
self.Throw = 1
timer.Simple( 1, function()
if self.Throw == 1 then

self.Owner:SetAnimation( PLAYER_ATTACK1 )
self.Weapon:SendWeaponAnim( ACT_VM_THROW )

if !SERVER then return end

local ent = ents.Create( "ent_eq_smokegrenade" )
ent:SetOwner( self.Owner )

local Forward = self.Owner:EyeAngles():Forward()

if ( IsValid( ent ) ) then

ent:SetPos( self.Owner:GetShootPos() )
ent:SetAngles( self.Owner:EyeAngles() )
ent:Spawn()
local phys = ent:GetPhysicsObject()
phys:SetVelocity( self.Owner:GetAimVector() * 1500 )
phys:AddAngleVelocity( Vector( math.random( -500, 500 ), math.random( -500, 500 ), math.random( -500, 500 ) ) )
ent:SetCollisionGroup( COLLISION_GROUP_WEAPON )
self.Throw = 2
end
if self.Throw == 2 then
-- self.Owner:SetWalkSpeed( 200 )
-- self.Owner:SetRunSpeed( 400 )
self.Owner:DropWeapon( self )
self:Remove()
end
end
end)
end
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end