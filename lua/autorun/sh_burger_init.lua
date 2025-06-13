BURGERBASE = {}

function BURGERBASE:INIT_Initialize()
	print("[BURGERBASE] Initializing BURGERBASE....")
	BURGERBASE:INIT_MassInclude("burgerbase/core/","shared",false)
	BURGERBASE:INIT_MassInclude("burgerbase/modules/","shared",true,1)
end


function BURGERBASE:INIT_MassInclude(folder,realm,includesub,times)

	if not times then 
		times = 1
	end

	local Files, Folders = file.Find(folder .. "*","LUA")

	local num,filename
	for num,filename in pairs(Files) do
		if realm == "shared" or realm == "client" then
			if CLIENT then
				print("[BURGERBASE] Attempting to include file:",folder .. filename)
			end
			include(folder .. filename)
			AddCSLuaFile(folder .. filename)
		end
		if realm == "shared" or realm == "server" then
			if SERVER then
				print("[BURGERBASE] Attempting to include file:",folder .. filename)
				include(folder .. filename)
			end
		end
	end

	if includesub and times >= 1 then
		times = times - 1
		local num,filename
		for num,foldername in pairs(Folders) do
			BURGERBASE:INIT_MassInclude(folder .. foldername .. "/",realm,includesub,times)
		end
	end

end

BURGERBASE.AmmoTypes = {}

function BURGERBASE:AddAmmoType(realname,ammodata)
	local CallName = ammodata.name
	game.AddAmmoType(ammodata)
	BURGERBASE.AmmoTypes[CallName] = realname
	print("Adding ammo type " .. CallName)
	if CLIENT then
		language.Add(CallName .. "_ammo",realname)
	end
end

function BURGERBASE:GetStoredAmmoType(callname)
	return BURGERBASE.AmmoTypes[callname]
end

BURGERBASE:INIT_Initialize()