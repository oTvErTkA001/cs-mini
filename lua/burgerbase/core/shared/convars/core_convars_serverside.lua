local ServerFCVar = FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_SERVER_CAN_EXECUTE

-- BurgerBase: Core

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_speedmod",1,ServerFCVar,"Enables or disables CSS Weapon Speed Modification.",false)

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damagescale",1,ServerFCVar,"Damage scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_recoilscale",1,ServerFCVar,"Recoil scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_baseconescale",1,ServerFCVar,"Base inaccuracy scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_movementconescale",1,ServerFCVar,"Movement inaccuracy scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_heatconescale",1,ServerFCVar,"Heat inaccuracy scale for all weapons using this base.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damagefalloffscale",0.5,ServerFCVar,"Damage falloff scale for all weapons using this base.",false)

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_enable", 0, ServerFCVar , "Enables or disables custom damage.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_sandboxfix", 0, ServerFCVar , "Enables or disables counteracting the default sandbox damage multiplier so damage scale settings below are accurate.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_bodyscale", 1, ServerFCVar , "Damage scale for bodyshot damage.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_legscale", 0.75, ServerFCVar , "Damage scale for leg damage.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_armscale", 1, ServerFCVar , "Damage scale for arm damage.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_damage_headscale", 4, ServerFCVar , "Damage scale for head damage.",false )

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_enable_penetration",1,ServerFCVar,"Enables or disables bullet penetration.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_penetration_scale",1,ServerFCVar,"Base damage loss per unit penetrated. NOT RECOMMENDED TO SET TO 0.",false)

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_ammo_loaded",1,ServerFCVar,"Enables or disables giving loaded weapons when the player gets the weapon. Disabling is good for Roleplay.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_ammo_givespare",1,ServerFCVar,"Enables or disables giving spare ammo when the player gets the weapon. Disabling is good for Roleplay.",false)
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_limit_equipped",0,ServerFCVar,"Inventory limitation setting. 0 = no limits. 1 = limit one primary, one secondary. 2 = limit based on slots (one in each slot)",false)

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_drops_enable", 1, ServerFCVar , "Enables or disables weapon drops on death, as well as dropping weapons on command.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_drops_timed", 1, ServerFCVar , "Enables or disables automatic remove of dropped weapons.",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_drops_timer", 300, ServerFCVar , "Value in seconds when dropped weapons are removed, if timed drops are enabled.",false )

BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_quick", 0, ServerFCVar , "Enables or disables the ability to perform a quick grenade throw (ATTACK1 + E).",false )
BURGERBASE:CONVARS_CreateStoredConvar("sv_burgerbase_enable_mags", 0, ServerFCVar , "Enables or disables magazine dropping on reload. Requires additional addon (See workshop description for more info).",false )
