AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

self.Entity:SetModel("models/weapons/w_eq_fraggrenade_thrown.mdl")
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

self.timer = CurTime() + 1.2

end

function ENT:Think()
if self.timer < CurTime() then
local explode = ents.Create( "env_explosion" )
explode:SetOwner( self.Owner )
explode:SetPos(self:GetPos())
explode:Spawn()
explode:SetKeyValue( "iradiusoverride", 256 )
explode:SetKeyValue( "imagnitude", "130" ) --урон гранаты
explode:Fire( "Explode", 0, 0 )
explode:EmitSound( "BaseGrenade.Explode" )
self.Entity:Remove()
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