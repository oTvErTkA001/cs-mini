ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "C4 EXPLOSIVE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 

AddCSLuaFile()

function ENT:Initialize()

	if SERVER then
	
		self:SetModel("models/weapons/w_c4_planted.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

		self:SetUseType(CONTINUOUS_USE)
	
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			--phys:EnableMotion(false)
			--phys:EnableCollisions(false)
		end
	
		self.Delay = CurTime() + BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_time_explosion",false):GetInt()
		self.DefuseTime = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_time_defuse"):GetInt()
		self:SetNWBool("stopboom",false)
		self.First = true
		self.NextBeep = 0
		self.BeepLatch = 0
		self.DebugDelay = 0
		self.NextTick = 0
		self.Progress = 0
		self.SendMessage = true
		self.LastUse = 0

		if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_notifyplayers"):GetInt() == 1 then
			for n,p in pairs(player.GetAll()) do
				p:PrintMessage(HUD_PRINTCENTER,"Bomb has been planted")
				p:SendLua("LocalPlayer():EmitSound(\"radio/bombpl.wav\")")
			end
		end

	else
		self.Code = math.random(1,9) .. math.random(0,9) .. math.random(0,9) .. math.random(0,9) .. math.random(0,9) .. math.random(0,9)
	end

end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then
		self:SetMoveType(MOVETYPE_NONE)
	end
end

function ENT:Use(activator,caller,useType,value)
 
	if self:GetNWBool("defusing",false) == false then
		self:EmitSound("items/ammopickup.wav",100,100)
		self:SetNWBool("defusing",true)
	end
	
	if ( activator:IsPlayer() ) then
		if self.NextTick <= CurTime() then
			self.LastUse = CurTime()
			self.Progress = self.Progress + 0.05
			self.NextTick = CurTime() + 0.05
			self.Using = true
		end

		self:SetNWInt("defusecount",self.Progress)	
		
	end
 
end


function ENT:Think()
			
	if SERVER then

		if self.Progress >= self.DefuseTime  then
		
			if self.SendMessage == true then
				if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_notifyplayers"):GetInt() == 1 then
					for n,p in pairs(player.GetAll()) do
				
						p:PrintMessage(HUD_PRINTCENTER,"Bomb has been defused")
						p:SendLua("LocalPlayer():EmitSound(\"radio/bombdef.wav\")")
				
				
						timer.Simple(2, function()
							-- p:PrintMessage(HUD_PRINTCENTER,"Counter-Terrorists Win")
							--p:SendLua("LocalPlayer():EmitSound(\"radio/ctwin.wav\")")
							GAMEMODE:CT_WIN();
						end)
				
					end
				end
				self.SendMessage = false
			end
			
			SafeRemoveEntityDelayed(self,5)
			self:SetNWBool("stopboom",true)
		else
		
			if self.LastUse + 0.1 <= CurTime() then
				self.Progress = 0
				self:SetNWInt("defusecount",self.Progress)
				self:SetNWBool("defusing",false)				
			end
			
		end
		

	
		if CurTime() > self.Delay then 
			if self:GetNWBool("stopboom",false) == false then
				self:Detonate(self,self:GetPos())
			end
		end
	
		local BeepMod = self.Delay - CurTime()
	
		if self:GetNWBool("stopboom",false) == false then
			if self.NextBeep <= CurTime() then
				self:EmitSound("hl1/fvox/beep.wav")
				self:SetNWBool("beep",true)
				self.NextBeep = BeepMod/15 + CurTime()
				self.BeepLatch = BeepMod/30 + CurTime()
			end
		
			if self.BeepLatch <= CurTime() then
				self:SetNWBool("beep",false)
			end
		end
	end
end

function ENT:Detonate(self,pos)
	if SERVER then
	
		local c4damage = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_damage"):GetInt() or 1
		local c4radius = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_radius"):GetInt() or 1
	
	
	
		if not self:IsValid() then return end
		local effectdata = EffectData()
			effectdata:SetStart( pos + Vector(0,0,100)) // not sure if we need a start and origin (endpoint) for this effect, but whatever
			effectdata:SetOrigin( pos )
			effectdata:SetScale( c4radius/1000 )
			effectdata:SetRadius( c4radius )
		util.Effect( "HelicopterMegaBomb", effectdata )	

		self:EmitSound("weapons/c4/c4_explode1.wav",100,100)
		
		
		util.BlastDamage(self,self:GetNWEntity("owner",self),self:GetPos(),c4radius,c4damage)
		
		--[[
		if table.Count(ents.FindInSphere(self:GetPos(),c4radius)) > 0 then
			for k,v in pairs(ents.FindInSphere(self:GetPos(),c4radius)) do
		
				local distance = v:GetPos():Distance( self:GetPos() )
				
				local calc =  1 - (distance/c4radius)
		
				local dmginfo = DamageInfo()
					dmginfo:SetDamage( c4damage * calc  )
					dmginfo:SetDamageType( DMG_BLAST )
					dmginfo:SetAttacker( self:GetNWEntity("owner",self) )
					
					local DDD_Distance = (self:GetPos() - v:GetPos()):GetNormalized( )
					local DDD_Radius = Vector(c4radius,c4radius,c4radius)
					
					v:TakeDamageInfo(dmginfo)
		
			end

		end
		--]]

		if SERVER then
			if BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_notifyplayers"):GetInt() == 1 then
				for n,p in pairs(player.GetAll()) do
					-- p:PrintMessage(HUD_PRINTCENTER,"Terrorists Win")
					-- p:SendLua("LocalPlayer():EmitSound(\"radio/terwin.wav\")")
					GAMEMODE:T_WIN();
				end
			end
		end
		
		self:Remove()
	end
end

local mat = Material("sprites/redglow1")

function ENT:Draw()
	if CLIENT then
		self:DrawModel()
		
		local Size = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_c4_time_defuse"):GetInt()
		local Var = Size - self:GetNWInt("defusecount",0)
		
		
		--cam.Start3D2D( self:GetPos() + self:GetUp()*9 + self:GetForward()*3 + self:GetRight()*4.5, self:GetAngles() + Angle(0,-90,0), 1/20 ) -- for progressbar
		cam.Start3D2D( self:GetPos() + self:GetUp()*9 + self:GetForward()*3.5 + self:GetRight()*2, self:GetAngles() + Angle(0,-90,0), 0.125 )	
			
			
			--[[

		
		
			
		
			--				box	x			y			width	height	color
			draw.RoundedBox( 0, -Size/2 - 0, -Size/20 - 0, Size + 2, Size/10 + 2, Color(255,255,255) ) -- border
			
			draw.RoundedBox( 0, -Size/2 + 1, -Size/20 + 1, Var, Size/10, Color(255,0,0) ) -- actual
			]]--
			
			rand1 = math.random(0,9)
			rand2 = math.random(0,9)
			rand3 = math.random(0,9)
			rand4 = math.random(0,9)
			rand5 = math.random(0,9)
			rand6 = math.random(0,9)
	
			local CodeExplode = string.Explode("",self.Code)
			
			Code1 = CodeExplode[1]
			Code2 = CodeExplode[2]
			Code3 = CodeExplode[3]
			Code4 = CodeExplode[4]
			Code5 = CodeExplode[5]
			Code6 = CodeExplode[6]
			
			if Var >= (Size/6)*5 then
				text = rand1 .. rand2.. rand3 .. rand4 .. rand5 .. rand6
			elseif Var >= (Size/6)*4 then
				text = Code1 .. rand2.. rand3 .. rand4 .. rand5 .. rand6
			elseif Var >= (Size/6)*3 then
				text = Code1 .. Code2 .. rand3 .. rand4 .. rand5 .. rand6
			elseif Var >= (Size/6)*2 then
				text = Code1 .. Code2 .. Code3 .. rand4 .. rand5 .. rand6
			elseif Var >= (Size/6)*1 then
				text = Code1 .. Code2 .. Code3 .. Code4 .. rand5 .. rand6
			elseif Var >= 0 then
				text = Code1 .. Code2 .. Code3 .. Code4 .. Code5 .. rand6
			else
				text = Code1 .. Code2 .. Code3 .. Code4 .. Code5 .. Code6
			end
			
			if self:GetNWBool("defusing",false) == true then
				draw.SimpleText( text, "DebugFixed", 0, 0, Color(255,0,0,255), 0, 0 )
			end
			
		cam.End3D2D()
		
	
		if self:GetNWBool("beep",false) == true then

			cam.Start3D(EyePos(),EyeAngles())
				render.SetMaterial( mat )
				render.DrawSprite( self:GetPos() + self:GetUp()*10, 32, 32, Color(255,0,0,255))
			cam.End3D()

		end
	end
end