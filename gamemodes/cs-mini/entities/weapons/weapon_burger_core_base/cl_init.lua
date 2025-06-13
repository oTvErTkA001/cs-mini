include("shared.lua")


function SWEP:TranslateFOV(fov) -- Client

	local ZoomAmount = self.ZoomAmount

	if (self.HasBurstFire or self.AlwaysBurst) and self:GetIsBurst() then
		ZoomAmount = ZoomAmount*self.BurstZoomMul
	end

	ZoomAmount = self:SpecialZoom(ZoomAmount)

	local ZoomMag = 1

	if self.Owner.BURGERBASE_ZoomMul and self.Owner.BURGERBASE_ZoomMul[self:GetClass()] then
		ZoomMag = 1 + ( self:GetZoomMod() * ZoomAmount * math.Clamp(self.Owner.BURGERBASE_ZoomMul[self:GetClass()],0,1) )
	end

	return fov / ZoomMag

end

function SWEP:AdjustMouseSensitivity() -- Client
	return (self.Owner:GetFOV() / self.DesiredFOV)
end

function SWEP:DrawHUDBackground() -- Client

	local x = ScrW()
	local y = ScrH()

	--self:DrawContextMenu(x,y)

	if LocalPlayer():ShouldDrawLocalPlayer() then

		local HitPos = LocalPlayer():GetEyeTrace().HitPos
		local Screen = HitPos:ToScreen()

		x = Screen.x * 2
		y = Screen.y * 2

	end

	local length = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_length",true):GetFloat()
	local width = 1

	local fovbonus = self.DesiredFOV / self.Owner:GetFOV()

	local r = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_color_r",true):GetFloat()
	local g = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_color_g",true):GetFloat()
	local b = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_color_b",true):GetFloat()
	local a = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_color_a",true):GetFloat()

	local VelCone = self.Owner:GetVelocity():Length()*0.0001

	local LeftCone = 0
	local RightCone = 0

	--[[
	if BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_dynamic",true):GetFloat() == 0 then
		LeftCone = math.Clamp(self.Primary.Cone*900,0,x/2)
		RightCone = math.Clamp(self.Primary.Cone*900,0,x/2)
	else
		LeftCone = math.Clamp(self:HandleCone(self.Primary.Cone,true,true)*900,0,x/2)*fovbonus
		RightCone = math.Clamp(self:HandleCone(self.Primary.Cone,true,false)*900,0,x/2)*fovbonus
	end
	--]]

	--LeftCone = self:HandleCone(self.Primary.Cone,true,true) * fovbonus

	--RightCone = ( *ScrW()*0.5 ) * (90/self.Owner:GetFOV())

	local ConeAngle = (self:HandleCone(self.Primary.Cone,true,false)*360) -- THE IS THE CONE, IN AN ANGLE. 360 MEANS IT SHOOTS ALL AROUND
	local LeftConeAngle = (self:HandleCone(self.Primary.Cone,true,true)*360) -- THE IS THE CONE, IN AN ANGLE. 360 MEANS IT SHOOTS ALL AROUND



	local FOV = self.Owner:GetFOV() -- THIS IS THE FOV. 360 MEANS IT SHOWS ALL AROUND
	-- OK SO A FOV OF 360 AND A CONEANGLE OF 360 MEANS THAT THE CONE GAP SHOULD BE 1 * ScrW()
	-- OK SO A FOV OF 90 AND A CONEANGLE OF 90 MEANS THAT THE CONE GAP SHOULD BE 1 * ScrW()
	-- OK SO A FOV OF 90 AND A CONEANGLE OF 45 MEANS THAT THE CONE GAP SHOULD BE 0.5 * ScrW()

	--print(ConeAngle)

	RightCone = (ConeAngle/FOV) * ScrH() * 0.25
	LeftCone = (LeftConeAngle/FOV) * ScrH() * 0.25

	--[[
	if not IsSingleplayer then
		if BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_smoothing",true):GetFloat() == 1 then

			if not self.StoredCrosshair then
				self.StoredCrosshair = Cone
			end

			local SmoothingMul = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_smoothing_mul",true):GetFloat() * 0.015 * fovbonus

			if Cone > self.StoredCrosshair then
				self.StoredCrosshair = math.min(Cone,self.StoredCrosshair + 500 * SmoothingMul )
			elseif Cone < self.StoredCrosshair then
				self.StoredCrosshair = math.max(Cone,self.StoredCrosshair - 300 * SmoothingMul )
			end

			ConeToSend = self.StoredCrosshair

		end
	end
	--]]

	if self.HasScope then

		if self:GetZoomed() then
			if self.ZoomDelay <= 0 or self:GetZoomOverlayDelay() <= CurTime() then

				if LocalPlayer():ShouldDrawLocalPlayer() then
					self:DrawCustomCrosshair(x,y,RightCone,length,width,r,g,b,a)
				else
					self:DrawCustomScope(x,y,RightCone,r,g,b,a)
				end

				if not self.IgnoreScopeHide then
					self.Owner:DrawViewModel(false)
				end

			else
				self.Owner:DrawViewModel(true)
			end
		else
			self.Owner:DrawViewModel(true)
		end
	end

	if (self.HasCrosshair or (self.Owner:IsPlayer() and self.Owner:IsBot())) and not self.Owner:InVehicle() then

		if self.HasDual then

			local LeftAlpha = a
			local RightAlpha = a

			if !self:GetIsLeftFire() then
				RightAlpha = RightAlpha * 0.5
			else
				LeftAlpha = LeftAlpha * 0.5
			end

			self:DrawCustomCrosshair(x,y,LeftCone,length,width,r,g,b,LeftAlpha)
			self:DrawCustomCrosshair(x,y,RightCone,length,width,r,g,b,RightAlpha)

		else
			self:DrawCustomCrosshair(x,y,RightCone,length,width,r,g,b,a)
		end
	end

	self:DrawSpecial(RightCone)

end

-- function SWEP:DrawContextMenu(x,y) -- Client

-- 	if BurgerBase_ContextMenuIsOpen == true then

-- 		local x = ScrW()
-- 		local y = ScrH()
-- 		local BasePosX = 192
-- 		local BasePosY = 108
-- 		local Font = "DermaLarge"
-- 		local FontSize = 36

-- 		local EyeTrace = self.Owner:GetEyeTrace()
-- 		local EyePos = EyeTrace.StartPos
-- 		local HitPos = EyeTrace.HitPos


-- 		local WeaponStats = BURGERBASE_CalculateWeaponStats(self.Owner,self)



-- 		draw.RoundedBox( 8, ScrW()*0.1 - FontSize , ScrH()*0.1 - FontSize, BasePosX*3 + FontSize*2, FontSize*15, Color(0,0,0,200 ) )

-- 		local TextColor = Color(239,184,55,255)
-- 		local PrimaryColor = Color(239,184,55,100)
-- 		local SecondaryColor = TextColor

-- 		surface.SetFont( "DermaLarge" )
-- 		surface.SetTextColor( TextColor )
-- 		surface.SetDrawColor( PrimaryColor )
-- 		draw.NoTexture()

-- 		-- Title
-- 		local PosNumber = 0
-- 		surface.SetTextPos( BasePosX,BasePosY  )
-- 		surface.DrawText( WeaponStats.ammo .. " " .. WeaponStats.name )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize, BasePosX*3, 2 )

-- 		-- Damage
-- 		local FullDamage = WeaponStats.damage * WeaponStats.shots
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * math.Clamp((FullDamage/100),0,1), FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber  )

-- 		local DamageText = " Damage: " .. math.Round(FullDamage,0)

-- 		if WeaponStats.shots > 1 then
-- 			DamageText = DamageText .. " (" .. WeaponStats.damage .. " x " .. WeaponStats.shots .. ")"
-- 		end

-- 		surface.DrawText( DamageText )

-- 		-- Firerate
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * math.Clamp((WeaponStats.rpm/600),0,1), FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber  )
-- 		surface.DrawText( " RPM: " .. math.Round(WeaponStats.rpm,0))

-- 		-- Damage Per Second
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * math.Clamp(WeaponStats.dps/600,0,1), FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber  )
-- 		surface.DrawText( " DPS: " .. math.Round(WeaponStats.dps,2))

-- 		-- Kill Time
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )

-- 		surface.SetDrawColor( SecondaryColor )
-- 		surface.SetTextColor( SecondaryColor )
-- 		surface.SetFont( "DermaDefault" )

-- 		local TimeOffset = 0

-- 		for i=0, self:Clip1() - 1 do

-- 			local Spacing = WeaponStats.delay

-- 			if self:GetIsBurst() then
-- 				Spacing = self:GetBurstMath()

-- 				if (i+1) % self.BurstOverride == 0 then
-- 					Spacing = Spacing + WeaponStats.delay
-- 				end
-- 			end

-- 			local XPos = BasePosX + TimeOffset*BasePosX*3
-- 			local YOffset = (-(i % 2) * FontSize) - ((i % 2)*25)

-- 			if TimeOffset <= 1 then
-- 				surface.DrawRect( XPos, BasePosY + FontSize*PosNumber, 2, FontSize )
-- 				draw.SimpleText( math.Round(TimeOffset,2), "DermaDefault", XPos,BasePosY + FontSize*PosNumber + FontSize + YOffset,TextColor,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
-- 				draw.SimpleText( "(" .. (i+1)*math.Round(FullDamage,0) .. ")", "DermaDefault", XPos,BasePosY + FontSize*PosNumber + FontSize + 10 + YOffset,TextColor,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
-- 				TimeOffset = TimeOffset + Spacing
-- 			end


-- 		end

-- 		surface.SetFont( "DermaLarge" )
-- 		surface.SetTextColor( TextColor )
-- 		surface.SetDrawColor( PrimaryColor )

-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * math.Clamp(WeaponStats.killtime/1,0,1), FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber  )
-- 		surface.DrawText( " Kill Time: " .. math.Round(WeaponStats.killtime,2) .. " seconds")


-- 		-- Accuracy
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * WeaponStats.accuracy, FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber )
-- 		surface.DrawText( " Accuracy: " .. math.Round(WeaponStats.accuracy*100,2) .. "%")

-- 		--[[
-- 		--Bullet Penetration
-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * 0.5, FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber )

-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber )
-- 		surface.DrawText( " Penetration: " .. BulletPenetration .. " units")
-- 		--]]

-- 		-- Range
-- 		local BaseRange = WeaponStats.range*2
-- 		local ViewDistance = HitPos:Distance(EyePos)
-- 		local MatterScale = BURGERBASE:CONVARS_GetStoredConvar("sv_burgerbase_damagefalloffscale"):GetFloat()


-- 		PosNumber = PosNumber + 2
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3, FontSize )
-- 		surface.DrawRect( BasePosX, BasePosY + FontSize*PosNumber, BasePosX*3 * 0.5, FontSize )
-- 		surface.SetTextPos( BasePosX,BasePosY + FontSize*PosNumber )

-- 		surface.DrawText( " Range: " .. math.Round(WeaponStats.range/(64/1.22),2) .. " meters")
-- 		local PolyBaseX = BasePosX + (BasePosX*3 * 0.5)
-- 		local PolyBaseY = BasePosY + FontSize*PosNumber
-- 		local TriAngle = {
-- 			{x = PolyBaseX,y = PolyBaseY},
-- 			{x = PolyBaseX + BasePosX*3*0.5*(1-MatterScale),y = PolyBaseY + FontSize*(1-MatterScale)},
-- 			{x = PolyBaseX,y = PolyBaseY + FontSize*(1-MatterScale)},
-- 		}
-- 		surface.DrawPoly( TriAngle )
-- 		surface.DrawRect( PolyBaseX, PolyBaseY + FontSize * ( 1 - MatterScale), BasePosX*1.5 , FontSize*MatterScale )
-- 		surface.SetDrawColor( SecondaryColor )
-- 		surface.DrawRect( BasePosX + BasePosX*3*math.Clamp(ViewDistance/(BaseRange),0,1), BasePosY + FontSize*PosNumber, 2, FontSize )
-- 		local DamageScale = math.min( (2) - (ViewDistance/WeaponStats.range),1)

-- 		draw.SimpleText(math.Round(math.Clamp(DamageScale * FullDamage,FullDamage * MatterScale,FullDamage),2) .. " Damage", "DermaDefault", BasePosX + BasePosX*3*math.Clamp(ViewDistance/(BaseRange),0,1),BasePosY + FontSize*PosNumber + FontSize,TextColor,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)

-- 		surface.SetDrawColor( PrimaryColor )

-- 	end


-- end

function SWEP:DrawCustomCrosshair(x,y,Cone,length,width,r,g,b,a) -- Client

	local XRound = math.floor(x/2)
	local YRound = math.floor(y/2)
	local WRound = math.floor(width/2)
	local LRound = math.floor(length/2)

	if BurgerBase_ContextMenuIsOpen then
		XRound, YRound = self:ClientCursorClamp()
	end

	if self.CrosshairOverrideMat then
		surface.SetDrawColor(Color(255,255,255,255))
		surface.SetMaterial(self.CrosshairOverrideMat)
		surface.DrawTexturedRectRotated(XRound,YRound,self.CrosshairOverrideSize,self.CrosshairOverrideSize,0)
	else

		local SizeOffset = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_offset",true):GetFloat()
		local FinalCone = math.floor( math.Max(Cone,WRound*2,LRound/2) + SizeOffset )

		local CrosshairShadow = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_shadow",true):GetFloat()
		local CrosshairStyle = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_style",true):GetFloat()
		local CrosshairDot = BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_dot",true):GetFloat()

		if !self:GetZoomed() or self.EnableIronCross or ( BURGERBASE:CONVARS_GetStoredConvar("cl_burgerbase_crosshair_neversights",true):GetFloat() == 1 and not self.HasScope) then

			if  WRound == 0 then

				if CrosshairStyle >= 2 and CrosshairStyle <= 5 then

					local Offset = 0

					if CrosshairStyle == 4 then
						Offset = LRound*2
					elseif CrosshairStyle == 3 then
						Offset = LRound
					else
						Offset = 0
					end

					if CrosshairShadow >= 1 then
						surface.DrawCircle(x/2,y/2, FinalCone + Offset - 1, Color(0,0,0,a))
						surface.DrawCircle(x/2,y/2, FinalCone + Offset + 1, Color(0,0,0,a))
					end

				end

				if CrosshairStyle >= 1 and CrosshairStyle <= 4 then

					if CrosshairShadow >= 1 then

						local RealLength = LRound*2

						-- Start of Shadow Stuff
						local x1 = XRound + FinalCone + RealLength
						local x2 = XRound - FinalCone - RealLength
						local y3 = YRound + FinalCone + RealLength
						local y4 = YRound - FinalCone - RealLength

						local Offset = 1

						surface.SetDrawColor(Color(0,0,0,a))

						--Right
						surface.DrawLine(x1 - RealLength,YRound - Offset,x1 + Offset*2,YRound - Offset)
						surface.DrawLine(x1 - RealLength,YRound + Offset,x1 + Offset*2,YRound + Offset)

						--Left
						surface.DrawLine(x2 + RealLength,YRound - Offset,x2 - Offset*2,YRound - Offset)
						surface.DrawLine(x2 + RealLength,YRound + Offset,x2 - Offset*2,YRound + Offset)

						--Bottom
						surface.DrawLine(XRound - Offset,y3 - RealLength,XRound - Offset,y3 + Offset*2)
						surface.DrawLine(XRound + Offset,y3 - RealLength,XRound + Offset,y3 + Offset*2)

						--Top
						surface.DrawLine(XRound - Offset,y4 + RealLength,XRound - Offset,y4 - Offset*2)
						surface.DrawLine(XRound + Offset,y4 + RealLength,XRound + Offset,y4 - Offset*2)


						-- End of Shadow Stuff
					end

					-- Start of Normal Stuff
					if width > 1 then

						local x1 = XRound - WRound
						local x2 = XRound - WRound
						local y3 = YRound - WRound
						local y4 = YRound - WRound

						local y1 = YRound + math.max(FinalCone,0)
						local y2 = YRound - (LRound*2) - math.max(FinalCone,0)
						local x3 = XRound + math.max(FinalCone,0)
						local x4 = XRound - (LRound*2) - math.max(FinalCone,0)

						surface.SetDrawColor(r,g,b,a)
						surface.DrawRect( x1, y1, WRound*2, LRound*2 )
						surface.DrawRect( x2, y2, WRound*2, LRound*2 )
						surface.DrawRect( x3, y3, LRound*2, WRound*2 )
						surface.DrawRect( x4, y4, LRound*2, WRound*2 )

					else

						local x1 = XRound + FinalCone + LRound*2
						local x2 = XRound - FinalCone - LRound*2
						local y3 = YRound + FinalCone + LRound*2
						local y4 = YRound - FinalCone - LRound*2

						surface.SetDrawColor(r,g,b,a)
						surface.DrawLine( x1, YRound, XRound+FinalCone, YRound )
						surface.DrawLine( x2, YRound, XRound-FinalCone, YRound )
						surface.DrawLine( XRound, y3, XRound, YRound+FinalCone )
						surface.DrawLine( XRound, y4, XRound, YRound-FinalCone )

					end
					-- End of Normal Stuff

				end

				if CrosshairDot >= 1 then

					local Max = math.max(1,width)

					if CrosshairShadow >= 1 then

						if width <= 1 then
							surface.SetDrawColor(Color(0,0,0,a))
							surface.DrawRect( XRound - WRound - 1, YRound - WRound - 1 , Max + 2, Max + 2 )
						end
					end

					-- Start of Normal Stuff
					surface.SetDrawColor(r,g,b,a)
					surface.DrawRect( XRound - WRound, YRound - WRound , Max, Max )


				end

				if CrosshairStyle >= 2 and CrosshairStyle <= 5 then

					local Offset = 0

					if CrosshairStyle == 4 then
						Offset = LRound*2
					elseif CrosshairStyle == 3 then
						Offset = LRound
					else
						Offset = 0
					end

					-- Start of Normal Stuff
					surface.DrawCircle(XRound,YRound, FinalCone + Offset, Color(r,g,b,a))
					-- End of Normal Stuff

				end

			end

		end

	end

end

function SWEP:DrawSpecial(Cone) -- Client


end

function SWEP:DrawCustomScope(x,y,Cone,r,g,b,a) -- Client

	local space = 1

	local PositionOffsetX = 0
	local PositionOffsetY = 0

	if BurgerBase_ContextMenuIsOpen then
		PositionOffsetX, PositionOffsetY = self:ClientCursorClamp()
		PositionOffsetX = PositionOffsetX - x/2
		PositionOffsetY = PositionOffsetY - y/2
	end

	--[[
	local XSub = 100*FrameTime()
	local YSub = 100*FrameTime()

	if self.DynamicScopeDesiredOffsetX > 0 and self.DynamicScopeDesiredOffsetX - XSub > 0 then
		self.DynamicScopeDesiredOffsetX = self.DynamicScopeDesiredOffsetX - XSub
	elseif self.DynamicScopeDesiredOffsetX < 0 and self.DynamicScopeDesiredOffsetX - XSub < 0 then
		self.DynamicScopeDesiredOffsetX = self.DynamicScopeDesiredOffsetX + XSub
	else
		self.DynamicScopeDesiredOffsetX = 0
	end

	if self.DynamicScopeDesiredOffsetY > 0 and self.DynamicScopeDesiredOffsetY - YSub > 0 then
		self.DynamicScopeDesiredOffsetY = self.DynamicScopeDesiredOffsetY - YSub
	elseif self.DynamicScopeDesiredOffsetY < 0 and self.DynamicScopeDesiredOffsetY - YSub < 0 then
		self.DynamicScopeDesiredOffsetY = self.DynamicScopeDesiredOffsetY + YSub
	else
		self.DynamicScopeDesiredOffsetY = 0
	end

	self.DynamicScopeOffsetX = self.DynamicScopeOffsetX - (self.DynamicScopeOffsetX - self.DynamicScopeDesiredOffsetX)*FrameTime()
	self.DynamicScopeOffsetY = self.DynamicScopeOffsetY - (self.DynamicScopeOffsetY - self.DynamicScopeDesiredOffsetY)*FrameTime()


	PositionOffsetX = PositionOffsetX + self.DynamicScopeOffsetX
	PositionOffsetY = PositionOffsetY + self.DynamicScopeOffsetY
	--]]

	--[[
	local MoveVel = self:GetMovementVelocity()


	if MoveVel ~= 0 then
		self.ScopeMoveTime = self.ScopeMoveTime + 1*math.pi*FrameTime()
		self.ScopeMoveTimeStored = math.sin(self.ScopeMoveTime)*50
	else
		if self.ScopeMoveTimeStored > 0 then
			self.ScopeMoveTimeStored = math.Clamp(self.ScopeMoveTimeStored - FrameTime(),0,1)
		elseif self.ScopeMoveTimeStored < 0 then
			self.ScopeMoveTimeStored = math.Clamp(self.ScopeMoveTimeStored + FrameTime(),-1,0)
		else
			self.ScopeMoveTimeStored = 0
		end
	end

	PositionOffsetX = PositionOffsetX + self.ScopeMoveTimeStored
	--]]

	--[[
	local Size = math.Clamp(Cone,3,x/2*0.33)/2

	local OffsetX = math.sin(CurTime())*Size
	local OffsetY = math.cos(CurTime())*Size

	self.DynamicScopeOffsetX = self.DynamicScopeOffsetX - (self.DynamicScopeOffsetX - OffsetX)*FrameTime()*10
	self.DynamicScopeOffsetY = self.DynamicScopeOffsetY - (self.DynamicScopeOffsetY - OffsetY)*FrameTime()*10

	PositionOffsetX = PositionOffsetX + self.DynamicScopeOffsetX
	PositionOffsetY = PositionOffsetY + self.DynamicScopeOffsetY
	--]]

	if self.ColorOverlay.a > 0 then
		surface.SetDrawColor(self.ColorOverlay)
		surface.DrawRect(0-x/2 + PositionOffsetX, 0-y/2 + PositionOffsetY, x*2, y*2 )
	end

	if self.CustomScope == nil then

		if self.EnableDefaultScope then
			surface.SetDrawColor(Color(0,0,0))
			surface.SetMaterial(Material("gui/sniper_corner"))

			--[[
			surface.DrawTexturedRectRotated(x/2 - y/4 + PositionOffsetX,y/2 - y/4 + PositionOffsetY,y/2 + space,y/2 + space,0-180-180)
			surface.DrawTexturedRectRotated(x/2 - y/4 + PositionOffsetX,y/2 + y/4 + PositionOffsetY,y/2 + space,y/2 + space,90-180-180)
			surface.DrawTexturedRectRotated(x/2 + y/4 + PositionOffsetX,y/2 + y/4 + PositionOffsetY,y/2 + space,y/2 + space,180-180-180)
			surface.DrawTexturedRectRotated(x/2 + y/4 + PositionOffsetX,y/2 - y/4 + PositionOffsetY,y/2 + space,y/2 + space,270-180-180)
			--]]

			local CenterX = x/2
			local ScopeSize = y
			local ScopeSegmentSize = ScopeSize/2


			surface.DrawTexturedRectRotated(CenterX - ScopeSegmentSize/2 + PositionOffsetX,ScopeSegmentSize - ScopeSegmentSize/2 + PositionOffsetY,ScopeSegmentSize + space,ScopeSegmentSize + space,0-180-180)
			surface.DrawTexturedRectRotated(CenterX - ScopeSegmentSize/2 + PositionOffsetX,ScopeSegmentSize + ScopeSegmentSize/2 + PositionOffsetY,ScopeSegmentSize + space,ScopeSegmentSize + space,90-180-180)
			surface.DrawTexturedRectRotated(CenterX + ScopeSegmentSize/2 + PositionOffsetX,ScopeSegmentSize + ScopeSegmentSize/2 + PositionOffsetY,ScopeSegmentSize + space,ScopeSegmentSize + space,180-180-180)
			surface.DrawTexturedRectRotated(CenterX + ScopeSegmentSize/2 + PositionOffsetX,ScopeSegmentSize - ScopeSegmentSize/2 + PositionOffsetY,ScopeSegmentSize + space,ScopeSegmentSize + space,270-180-180)



		end

		if self.ZoomAmount > 6 then
			surface.SetDrawColor(Color(0,0,0))
			surface.DrawLine(x/2 + PositionOffsetX,0 + PositionOffsetY,x/2 + PositionOffsetX,y + PositionOffsetY)
			surface.DrawLine(0 + PositionOffsetX,y/2 + PositionOffsetY,x + PositionOffsetX,y/2 + PositionOffsetY)
		else
			if !self.EnableIronCross then
				surface.DrawCircle( x/2 + PositionOffsetX, y/2 + PositionOffsetY, 1 , Color(r,g,b,a) )
			end
		end

	else

		local Size = y

		if self.CustomScopeSOverride then
			Size = self.CustomScopeSOverride
		end

		surface.SetDrawColor(self.CustomScopeCOverride)
		surface.SetMaterial(self.CustomScope)
		surface.DrawTexturedRectRotated(x/2 + PositionOffsetX,y/2 + PositionOffsetY,Size*self.CustomScopeSizeMul,Size*self.CustomScopeSizeMul,0)

		if self.EnableDefaultScope then
			surface.SetDrawColor(Color(0,0,0,255))
			surface.SetMaterial(Material("vgui/scope_lens"))
			surface.DrawTexturedRectRotated(x/2 + PositionOffsetX,y/2 + PositionOffsetY,y,y,0)
		end

	end

	if !self.EnableIronCross then
		local Size = math.Clamp(Cone,3,x/2*0.33)

		if Size > 6 then
			surface.DrawCircle( x/2 + PositionOffsetX, y/2 + PositionOffsetY, Size , Color(r,g,b,a) )
		end
	end

	if self.EnableDefaultScope then
		surface.SetDrawColor(Color(0,0,0))

		local CenterX = x/2
		local ScopeSize = y
		local ScopeSegmentSize = ScopeSize/2

		surface.DrawRect( 0 + PositionOffsetX, 0 + PositionOffsetY, CenterX - ScopeSegmentSize, ScopeSize ) -- Left
		surface.DrawRect( CenterX + ScopeSegmentSize + PositionOffsetX, 0 + PositionOffsetY, CenterX - ScopeSegmentSize, ScopeSize ) -- Right

	end

	surface.SetDrawColor(Color(0,0,0))

	surface.DrawRect( x + PositionOffsetX, 0 + PositionOffsetY, x, y) -- Right
	surface.DrawRect(-x + PositionOffsetX, 0 + PositionOffsetY, x, y) -- Left
	surface.DrawRect( -x + PositionOffsetX, y + PositionOffsetY, x*3, y) -- Bottom
	surface.DrawRect( -x + PositionOffsetX, -y + PositionOffsetY, x*3, y) -- Top

end

function SWEP:ClientCursorClamp() -- Client
	local x,y = input.GetCursorPos()
	x = math.Clamp(x,0,ScrW())
	y = math.Clamp(y,0,ScrH())
	return x,y
end

function SWEP:HUDShouldDraw( element ) -- Client

	if self:GetZoomed() and element == "CHudWeaponSelection" then
		return false
	end

	return true

end

function SWEP:PrintWeaponInfo( x, y, alpha ) -- Client

end

function SWEP:DrawWorldModel() -- Client
	self:SCK_DrawWorldModel()
end

function SWEP:ViewModelDrawn() -- Client
	self:SCK_ViewModelDrawn()
end

function SWEP:SCK_Initialize() -- Client
	// other initialize code goes here
	if CLIENT then

		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
		self:SCK_CreateModels(self.VElements) // create viewmodels
		self:SCK_CreateModels(self.WElements) // create worldmodels

		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:SCK_ResetBonePositions(vm)

				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")
				end
			end
		end

	end
end

function SWEP:SCK_Holster() -- Client

	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:SCK_ResetBonePositions(vm)
		end
	end

end

SWEP.vRenderOrder = nil

function SWEP:SCK_ViewModelDrawn() -- Client

	local vm = self.Owner:GetViewModel()
	if !IsValid(vm) then return end

	if (!self.VElements) then return end

	self:SCK_UpdateBonePositions(vm)
	if (!self.vRenderOrder) then

		// we build a render order because sprites need to be drawn after models
		self.vRenderOrder = {}
		for k, v in pairs( self.VElements ) do
			if (v.type == "Model") then
				table.insert(self.vRenderOrder, 1, k)
			elseif (v.type == "Sprite" or v.type == "Quad") then
				table.insert(self.vRenderOrder, k)
			end
		end

	end
	for k, name in ipairs( self.vRenderOrder ) do

		local v = self.VElements[name]
		if (!v) then self.vRenderOrder = nil break end
		if (v.hide) then continue end

		local model = v.modelEnt
		local sprite = v.spriteMaterial

		if (!v.bone) then continue end

		local pos, ang = self:SCK_GetBoneOrientation( self.VElements, v, vm )

		if (!pos) then continue end

		if (v.type == "Model" and IsValid(model)) then
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			model:SetAngles(ang)
			//model:SetModelScale(v.size)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix( "RenderMultiply", matrix )

			if (v.material == "") then
				model:SetMaterial("")
			elseif (model:GetMaterial() != v.material) then
				model:SetMaterial( v.material )
			end

			if (v.skin and v.skin != model:GetSkin()) then
				model:SetSkin(v.skin)
			end

			if (v.bodygroup) then
				for k, v in pairs( v.bodygroup ) do
					if (model:GetBodygroup(k) != v) then
						model:SetBodygroup(k, v)
					end
				end
			end

			if (v.surpresslightning) then
				render.SuppressEngineLighting(true)
			end

			render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
			render.SetBlend(v.color.a/255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)

			if (v.surpresslightning) then
				render.SuppressEngineLighting(false)
			end

		elseif (v.type == "Sprite" and sprite) then

			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			render.SetMaterial(sprite)
			render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

		elseif (v.type == "Quad" and v.draw_func) then

			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

			cam.Start3D2D(drawpos, ang, v.size)
				v.draw_func( self )
			cam.End3D2D()
		end

	end

end

function SWEP:SCK_OnRemove() -- Client
	self:SCK_Holster()
end

SWEP.wRenderOrder = nil

function SWEP:SCK_DrawWorldModel()

	if (self.ShowWorldModel == nil or self.ShowWorldModel) then
		self:DrawModel()
	end

	if (!self.WElements) then return end

	if (!self.wRenderOrder) then
		self.wRenderOrder = {}
		for k, v in pairs( self.WElements ) do
			if (v.type == "Model") then
				table.insert(self.wRenderOrder, 1, k)
			elseif (v.type == "Sprite" or v.type == "Quad") then
				table.insert(self.wRenderOrder, k)
			end
		end
	end

	if (IsValid(self.Owner)) then
		bone_ent = self.Owner
	else
		// when the weapon is dropped
		bone_ent = self
	end

	for k, name in pairs( self.wRenderOrder ) do

		local v = self.WElements[name]
		if (!v) then self.wRenderOrder = nil break end
		if (v.hide) then continue end

		local pos, ang

		if (v.bone) then
			pos, ang = self:SCK_GetBoneOrientation( self.WElements, v, bone_ent )
		else
			pos, ang = self:SCK_GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
		end

		if (!pos) then continue end

		local model = v.modelEnt
		local sprite = v.spriteMaterial

		if (v.type == "Model" and IsValid(model)) then
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			model:SetAngles(ang)
			//model:SetModelScale(v.size)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix( "RenderMultiply", matrix )

			if (v.material == "") then
				model:SetMaterial("")
			elseif (model:GetMaterial() != v.material) then
				model:SetMaterial( v.material )
			end

			if (v.skin and v.skin != model:GetSkin()) then
				model:SetSkin(v.skin)
			end

			if (v.bodygroup) then
				for k, v in pairs( v.bodygroup ) do
					if (model:GetBodygroup(k) != v) then
						model:SetBodygroup(k, v)
					end
				end
			end

			if (v.surpresslightning) then
				render.SuppressEngineLighting(true)
			end

			render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
			render.SetBlend(v.color.a/255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)

			if (v.surpresslightning) then
				render.SuppressEngineLighting(false)
			end

		elseif (v.type == "Sprite" and sprite) then

			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			render.SetMaterial(sprite)
			render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)

		elseif (v.type == "Quad" and v.draw_func) then

			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)

			cam.Start3D2D(drawpos, ang, v.size)
				v.draw_func( self )
			cam.End3D2D()
		end

	end

end
function SWEP:SCK_GetBoneOrientation( basetab, tab, ent, bone_override )

	local bone, pos, ang
	if (tab.rel and tab.rel != "") then

		local v = basetab[tab.rel]

		if (!v) then return end

		// Technically, if there exists an element with the same name as a bone
		// you can get in an infinite loop. Let's just hope nobody's that stupid.
		pos, ang = self:SCK_GetBoneOrientation( basetab, v, ent )

		if (!pos) then return end

		pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
		ang:RotateAroundAxis(ang:Up(), v.angle.y)
		ang:RotateAroundAxis(ang:Right(), v.angle.p)
		ang:RotateAroundAxis(ang:Forward(), v.angle.r)

	else

		bone = ent:LookupBone(bone_override or tab.bone)
		if (!bone) then return end

		pos, ang = Vector(0,0,0), Angle(0,0,0)
		local m = ent:GetBoneMatrix(bone)
		if (m) then
			pos, ang = m:GetTranslation(), m:GetAngles()
		end

		if (IsValid(self.Owner) and self.Owner:IsPlayer() and
			ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
			ang.r = -ang.r // Fixes mirrored models
		end

	end

	return pos, ang
end
function SWEP:SCK_CreateModels( tab )
	if (!tab) then return end
	// Create the clientside models here because Garry says we can't do it in the render hook
	for k, v in pairs( tab ) do
		if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and
				string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then

			v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
			if (IsValid(v.modelEnt)) then
				v.modelEnt:SetPos(self:GetPos())
				v.modelEnt:SetAngles(self:GetAngles())
				v.modelEnt:SetParent(self)
				v.modelEnt:SetNoDraw(true)
				v.createdModel = v.model
			else
				v.modelEnt = nil
			end

		elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite)
			and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then

			local name = v.sprite.."-"
			local params = { ["$basetexture"] = v.sprite }
			// make sure we create a unique name based on the selected options
			local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
			for i, j in pairs( tocheck ) do
				if (v[j]) then
					params["$"..j] = 1
					name = name.."1"
				else
					name = name.."0"
				end
			end

			v.createdSprite = v.sprite
			v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)

		end
	end

end

local allbones
local hasGarryFixedBoneScalingYet = false

function SWEP:SCK_UpdateBonePositions(vm)

	if self.ViewModelBoneMods then

		if (!vm:GetBoneCount()) then return end

		// !! WORKAROUND !! //
		// We need to check all model names :/
		local loopthrough = self.ViewModelBoneMods
		if (!hasGarryFixedBoneScalingYet) then
			allbones = {}
			for i=0, vm:GetBoneCount() do
				local bonename = vm:GetBoneName(i)
				if (self.ViewModelBoneMods[bonename]) then
					allbones[bonename] = self.ViewModelBoneMods[bonename]
				else
					allbones[bonename] = {
						scale = Vector(1,1,1),
						pos = Vector(0,0,0),
						angle = Angle(0,0,0)
					}
				end
			end

			loopthrough = allbones
		end
		// !! ----------- !! //

		for k, v in pairs( loopthrough ) do
			local bone = vm:LookupBone(k)
			if (!bone) then continue end

			// !! WORKAROUND !! //
			local s = Vector(v.scale.x,v.scale.y,v.scale.z)
			local p = Vector(v.pos.x,v.pos.y,v.pos.z)
			local ms = Vector(1,1,1)
			if (!hasGarryFixedBoneScalingYet) then
				local cur = vm:GetBoneParent(bone)
				while(cur >= 0) do
					local pscale = loopthrough[vm:GetBoneName(cur)].scale
					ms = ms * pscale
					cur = vm:GetBoneParent(cur)
				end
			end

			s = s * ms
			// !! ----------- !! //

			if vm:GetManipulateBoneScale(bone) != s then
				vm:ManipulateBoneScale( bone, s )
			end
			if vm:GetManipulateBoneAngles(bone) != v.angle then
				vm:ManipulateBoneAngles( bone, v.angle )
			end
			if vm:GetManipulateBonePosition(bone) != p then
				vm:ManipulateBonePosition( bone, p )
			end
		end
	else
		self:SCK_ResetBonePositions(vm)
	end

end

function SWEP:SCK_ResetBonePositions(vm)

	if (!vm:GetBoneCount()) then return end
	for i=0, vm:GetBoneCount() do
		vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
		vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
		vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
	end

end

/**************************
	Global utility code
**************************/

// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
// Does not copy entities of course, only copies their reference.
// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
function table.FullCopy( tab )
	if (!tab) then return nil end

	local res = {}
	for k, v in pairs( tab ) do
		if (type(v) == "table") then
			res[k] = table.FullCopy(v) // recursion ho!
		elseif (type(v) == "Vector") then
			res[k] = Vector(v.x, v.y, v.z)
		elseif (type(v) == "Angle") then
			res[k] = Angle(v.p, v.y, v.r)
		else
			res[k] = v
		end
	end

	return res

end