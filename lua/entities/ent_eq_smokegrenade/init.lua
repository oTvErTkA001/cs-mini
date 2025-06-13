AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

self.Entity:SetModel("models/weapons/w_eq_smokegrenade_thrown.mdl")
self.Entity:PhysicsInit( SOLID_VPHYSICS )
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:DrawShadow( false )
self.Entity:SetOwner( self.Owner )

self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )

local phys = self.Entity:GetPhysicsObject()

if ( phys:IsValid() ) then
phys:Wake()
end

self.timer = CurTime() + 3

end

local exp
function ENT:Think()
if self.timer < CurTime() then

self.Entity:EmitSound( Sound( "BaseSmokeEffect.Sound" ) )

local pos = self.Entity:GetPos()

self.Entity:Fire( "kill", "", 15 )
self.timer = CurTime() + 20

exp = ents.Create( "env_smoketrail" )
exp:SetKeyValue( "startsize", "100000" )
exp:SetKeyValue( "endsize", "300" )
exp:SetKeyValue( "spawnradius", "128" )
exp:SetKeyValue( "opacity", "1" )
exp:SetKeyValue( "spawnrate", "15" )
exp:SetKeyValue( "lifetime", "20" )
exp:SetPos( pos )
exp:SetParent( self.Entity )

exp:Spawn()
exp:Fire( "kill", "", 20 )
end
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Use( activator, caller, type, value )
end

function ENT:StartTouch( entity )
end

function ENT:EndTouch( entity )
end

function ENT:Touch( entity )
end