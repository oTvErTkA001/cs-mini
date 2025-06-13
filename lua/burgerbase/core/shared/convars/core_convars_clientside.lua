local ClientFCVar = FCVAR_ARCHIVE + FCVAR_USERINFO

BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_language","english",ClientFCVar,"Language",true)

BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_togglezoom", 1, ClientFCVar, "Enables hold to zoom",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_customslots", 0, ClientFCVar, "Enables or disables the game forcing primary weapons into slot 3",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_viewmodel_fov", 20, ClientFCVar, "Viewmodel FOV to add to the weapon viewmodel.",true )

BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_style", 1, ClientFCVar, "Style of the crosshair.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_length", 10, ClientFCVar, "Length in pixels of the crosshair.",true )

BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_color_r", 255, ClientFCVar, "Red value of the crosshair.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_color_g", 255, ClientFCVar, "Green value of the crosshair.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_color_b", 255, ClientFCVar, "Blue value of the crosshiar.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_color_a", 255, ClientFCVar, "Alpha value of the crosshair.",true )

BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_dynamic", 1, ClientFCVar, "Enables or disables crosshairs based on accuracy.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_dot", 0, ClientFCVar, "Enables or disables center dot crosshair.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_shadow", 1, ClientFCVar, "Enables or disables black outline around crosshairs.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_smoothing", 1, ClientFCVar, "Enables or disables crosshair smoothing.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_smoothing_mul",1, ClientFCVar, "Crosshair smoothing multiplier.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_neversights", 0, ClientFCVar, "Enables or disables real ironsighs.",true )
BURGERBASE:CONVARS_CreateStoredConvar("cl_burgerbase_crosshair_offset", 0, ClientFCVar, "Crosshair offset in pixels.",true )
