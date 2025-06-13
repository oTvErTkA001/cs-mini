BURGERBASE.StoredServerConVars = {}
BURGERBASE.StoredClientConVars = {}

function BURGERBASE:CONVARS_CreateStoredConvar(name,default,flags,description,clientside)

	if not flags then
		flags = FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_SERVER_CAN_EXECUTE
	end
	
	if not default then
		default = 0
	end

	if not description then
		description = "No description"
	end

	if not clientside then
		clientside = false
	end

	if clientside then
		BURGERBASE.StoredClientConVars[name] = CreateConVar(name,tostring(default), flags , description )
		if CLIENT then
			print("Creating Client ConVar: " .. name)
		end
	else
		BURGERBASE.StoredServerConVars[name] = CreateConVar(name,tostring(default), flags , description )
		if SERVER then
			print("Creating Server ConVar: " .. name)
		end
	end
	
end

function BURGERBASE:CONVARS_GetStoredConvar(name,clientside)
	if clientside then
		return BURGERBASE.StoredClientConVars[name]
	else
		return BURGERBASE.StoredServerConVars[name]
	end
end

BURGERBASE:INIT_MassInclude("burgerbase/core/shared/convars/","shared",false)
