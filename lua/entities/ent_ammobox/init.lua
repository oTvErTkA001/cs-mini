AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    
    self:SetModel("models/Items/BoxMRounds.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then

    	phys:Wake()

    end

end

function ENT:Use(a , ply)
	ply:GiveAmmo( 45, "smg1", true )
	ply:GiveAmmo( 1, "SMG1_Grenade", true )
	ply:GiveAmmo( 30, "AR2", true )
	ply:GiveAmmo( 1, "AR2AltFire", true )
	ply:GiveAmmo( 4, "XBowBolt", true )
	ply:GiveAmmo( 1, "Grenade", true )
	ply:GiveAmmo( 5, "SniperRound", true )
	ply:GiveAmmo( 20, "Buckshot", true )
	ply:GiveAmmo( 6, "357", true )
	ply:GiveAmmo( 20, "pistol", true )
	ply:PrintMessage(HUD_PRINTTALK, "Вы подобрали боеприпасы")
    self:Remove()
    sound.Play("items/ammopickup.wav", Vector(ply:GetPos()))
end