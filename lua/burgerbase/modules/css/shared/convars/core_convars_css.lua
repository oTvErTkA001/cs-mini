local ServerFCVar = FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_SERVER_CAN_EXECUTE

-- Counter-Strike: Equipment
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_flashbang_dur",3,ServerFCVar,"Damage falloff scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_smoke_dur",10,ServerFCVar,"Damage falloff scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_he_damage",98,ServerFCVar,"Damage falloff scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_he_radius",400,ServerFCVar,"Damage falloff scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_nonadmin", 1, ServerFCVar , "1 enables non-admins to use c4, all other values disables it.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_time_explosion", 45, ServerFCVar , "This is the value in seconds that the C4 detonates when planted. Default is 45.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_time_defuse", 10, ServerFCVar , "This is the value in seconds that the C4 is defused. Default is 10.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_damage", 500, ServerFCVar , "This is the value in points that determines maximum damage. Default is 500.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_radius", 3000, ServerFCVar , "This is the value in units that determines the maximum blast radius. Default is 1500.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_notifyplayers", 1, ServerFCVar , "1 enables players to receive cosmetic round winning notifications and sounds, all other values disables it.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_c4_timelimit", 0, ServerFCVar , "Global delay in minutes in which you can plant C4. 0 disables.",false )
