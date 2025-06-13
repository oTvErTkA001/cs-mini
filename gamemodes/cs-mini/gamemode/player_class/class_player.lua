
local CLASS = {}

CLASS.Base 					= "default"
CLASS.DisplayName			= "player"

--overrides the default class
CLASS.WalkSpeed 			= 240
CLASS.CrouchedWalkSpeed 	= 0.29
CLASS.RunSpeed				= 100
CLASS.DuckSpeed				= 0.39
CLASS.JumpPower				= 200
CLASS.MaxHealth				= 100
CLASS.StartHealth			= 100
CLASS.StartArmor			= 0
CLASS.DropWeaponOnDie		= false

function CLASS:Loadout( pl )

end

player_class.Register( "player", CLASS )
