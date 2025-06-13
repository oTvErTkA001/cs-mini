-- TETA_BONITA MADE THE SCOPE EFFECT (WHEN YOU ENTER IN YOUR SCOPE AND WHEN YOU LEAVE IT)

include("shared.lua")

-- We need to get these so we can scale everything to the player's current resolution.
local iScreenWidth = surface.ScreenWidth()
local iScreenHeight = surface.ScreenHeight()

local SCOPEFADE_TIME = 0.05
function SWEP:DrawHUD()

	if (self.UseScope == true) then

		local bScope = self.Weapon:GetNetworkedBool("Scope")
		if bScope ~= self.bLastScope then -- Are we turning the scope off/on?
	
			self.bLastScope = bScope
			self.fScopeTime = CurTime()
			
		elseif 	bScope then
		
			local fScopeZoom = self.Weapon:GetNetworkedFloat("ScopeZoom")
			if fScopeZoom ~= self.fLastScopeZoom then -- Are we changing the scope zoom level?
		
				self.fLastScopeZoom = fScopeZoom
				self.fScopeTime = CurTime()
			end
		end
			
		local fScopeTime = self.fScopeTime or 0

		
			local Mul = 1.0 -- This scales the alpha
			Mul = -2.5 + math.Clamp((CurTime() - fScopeTime)/SCOPEFADE_TIME, 0, 3.5)
			
			local Spray = 0--(self:GetNWFloat("SprayAdditive") * 15)
			
			if  self.Weapon:GetNetworkedBool("Scope") then
				if (self.OnlyIron == false) then
					self.Owner:DrawViewModel(false)
				end
			else
			self.Owner:DrawViewModel(true)
			end


		if (bScope) then 
		
		local pauseSec = CurTime() + 0.15
	
			// Draw the crosshair
			 if not (self.ScopeReddot or self.ScopeMs or self.ScopeSVD or self.LensReddot) then
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawLine(self.CrossHairTable.x11, self.CrossHairTable.y11, self.CrossHairTable.x12, self.CrossHairTable.y12)
				surface.DrawLine(self.CrossHairTable.x21, self.CrossHairTable.y21, self.CrossHairTable.x22, self.CrossHairTable.y22)
			end


			// Put the texture
			surface.SetDrawColor(0, 0, 0, 255)

			if (self.ScopeReddot) then
				surface.SetTexture(surface.GetTextureID("gmod/scope"))
			elseif (self.ScopeMs) then
				surface.SetTexture(surface.GetTextureID("gmod/scope"))
			elseif (self.ScopeNormal) then
				surface.SetTexture(surface.GetTextureID("gmod/scope"))
			elseif (self.ScopeSVD) then
				surface.SetTexture(surface.GetTextureID("gmod/scope"))
			elseif (self.LensReddot) then
			surface.SetDrawColor(0, 0, 0, (255*Mul)-Spray) -- Draw a black rect over everything and scale the alpha for a neat fadein effect
				surface.SetTexture(surface.GetTextureID("gmod/scope"))
			end
			
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			// Fill in everything else
			
			if (self.ScopeMs) then
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
			surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
			surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
			surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)
		    elseif (self.ScopeNormal or self.ScopeReddot or self.ScopeSVD) then
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
			surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
			surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
			surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)
			elseif(self.LensReddot)then
		    else
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
			surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
			surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
			surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)
		    
			end
		end
	end
		
	//Ripped from LeErOy NeWmAn, Don't tell him shhh
	
	if not self.CrossHair then return end
	
	
	if ptp_crosshair_t:GetInt()  == 0 then return end

	if ptp_crosshair_hl2:GetInt()  == 0 then
	
	self.DrawCrosshair = false
	// Make Sure this shit goes away
	
	local DisableDashing = false
	
		if GetConVar("sv_ptp_dashing_disable") == nil then
		DisableDashing = false
		else
		DisableDashing = GetConVar("sv_ptp_dashing_disable"):GetBool()
		end
		
	if self.Owner:KeyDown(IN_SPEED) and not DisableDashing then return end
	//Remove CrossHair on Sprint
	
	if self.Weapon:GetNetworkedBool( "Scope" , true) then return end
	if self.Weapon:GetNetworkedBool( "IronSights" , true) then return end
	//Remove on IronSights
	
		local x = ScrW() * 0.5
	local y = ScrH() * 0.5
	local scalebywidth = (ScrW() / 1024) * 5

	local scale = 2
	local canscale = true

	if ptp_crosshair_static:GetInt() == 0 then
	scale = scalebywidth * self.Primary.Cone + (self:GetNWFloat("SprayAdditive")*0.05)
	else
	scale = 0.05
	end
	surface.SetDrawColor(ptp_crosshair_r:GetInt(), ptp_crosshair_g:GetInt(), ptp_crosshair_b:GetInt(), ptp_crosshair_a:GetInt())

local LastShootTime = self.Weapon:GetNetworkedFloat( "LastShootTime", 0 )
	--scale = scale * (2 - math.Clamp( (CurTime() - LastShootTime) * 5, 0.0, 1.0 ))

	local dist = math.abs(self.CrosshairScale - scale)
	self.CrosshairScale = math.Approach(self.CrosshairScale, scale, FrameTime() * 2 + dist * 0.05)
	
	
	if (ptp_crosshair_thin:GetInt() == 1) then
		local gap = 30 * self.CrosshairScale
		local length = gap + 15 * self.CrosshairScale
		surface.DrawLine(x - (length + ptp_crosshair_l:GetInt()), y, x - (gap +ptp_crosshair_gap:GetInt()), y)
		surface.DrawLine(x + (length + ptp_crosshair_l:GetInt()), y, x + (gap +ptp_crosshair_gap:GetInt()), y)
		surface.DrawLine(x, y - (length + ptp_crosshair_l:GetInt()), x, y - (gap +ptp_crosshair_gap:GetInt()))
		surface.DrawLine(x, y + (length + ptp_crosshair_l:GetInt()), x, y + (gap +ptp_crosshair_gap:GetInt()))
	else
		local gap = 40 * self.CrosshairScale
		local length = gap + 6
		if ptp_crosshair_out:GetInt() == 1 then
		surface.SetDrawColor(0, 0, 0, ptp_crosshair_a:GetInt())
		surface.DrawRect( x -(gap + ptp_crosshair_gap:GetInt()) - ( ptp_crosshair_l:GetInt() + 12), y-3 - (ptp_crosshair_w:GetInt()), 2 + (ptp_crosshair_l:GetInt() + 12), 6 + (ptp_crosshair_w:GetInt() * 2) )
		surface.DrawRect( x-2+( gap +ptp_crosshair_gap:GetInt()), y-3- (ptp_crosshair_w:GetInt()), 2 + ( ptp_crosshair_l:GetInt() + 12), 6+ (ptp_crosshair_w:GetInt() * 2) )
		surface.DrawRect( x-3- (ptp_crosshair_w:GetInt()), y- 4 -( ptp_crosshair_gap:GetInt()) - (gap + ptp_crosshair_l:GetInt() + 8 ), 6 + (ptp_crosshair_w:GetInt() * 2), 14 + ( ptp_crosshair_l:GetInt() ))
		surface.DrawRect( x-3- (ptp_crosshair_w:GetInt()), y-2+ (gap + ptp_crosshair_gap:GetInt()), 6 + (ptp_crosshair_w:GetInt() * 2), 14 + ( ptp_crosshair_l:GetInt() ) )
		end
	
	surface.SetDrawColor(ptp_crosshair_r:GetInt(), ptp_crosshair_g:GetInt(), ptp_crosshair_b:GetInt(), ptp_crosshair_a:GetInt())

	surface.DrawRect( x - 2 -( gap + ptp_crosshair_gap:GetInt()) - ( ptp_crosshair_l:GetInt() + 8), y-1 - (ptp_crosshair_w:GetInt()), 2 + (ptp_crosshair_l:GetInt() + 8), 2 + (ptp_crosshair_w:GetInt() * 2) )
	surface.DrawRect( x+( gap + ptp_crosshair_gap:GetInt()), y-1- (ptp_crosshair_w:GetInt()), 2 + ( ptp_crosshair_l:GetInt() + 8), 2+ (ptp_crosshair_w:GetInt() * 2) )
	surface.DrawRect( x-1- (ptp_crosshair_w:GetInt()), y- 10 -( ptp_crosshair_gap:GetInt()) - (gap + ptp_crosshair_l:GetInt() ), 2 + (ptp_crosshair_w:GetInt() * 2), 10 + ( ptp_crosshair_l:GetInt() ))
	surface.DrawRect( x-1- (ptp_crosshair_w:GetInt()), y+ (gap + ptp_crosshair_gap:GetInt()), 2 + (ptp_crosshair_w:GetInt() * 2), 10 + ( ptp_crosshair_l:GetInt() ) )
	//surface.DrawLine(x-2, y, x+2, y)
	//surface.DrawLine(x, y-2, x, y+2)
	end
	else
	
	if self.Weapon:GetNetworkedBool( "Scope" , true) or self.Owner:KeyDown(IN_SPEED) and not DisableDashing then 
		self.DrawCrosshair = false
		else
		self.DrawCrosshair = true
	end
end
end

local IRONSIGHT_TIME = 0.15