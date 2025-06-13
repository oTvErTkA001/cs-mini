
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Phoenix Connexion" --"Phoenix Connexion"
CLASS.Description       = "Having established a reputation for killing anyone that \ngets in their way, the Phoenix Faction is one of \nthe most feared terrorist groups in Eastern Europe. \nFormed shortly after the breakup of the USSR."
CLASS.PlayerModel		= {"models/player/phoenix.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_glock" )
pl:Give( "weapon_knife" )
-- pl:GiveAmmo( 60, "smg1", true )
-- pl:GiveAmmo( 60, "ar2", true )
-- pl:GiveAmmo( 7, "357", true )
-- pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.3,.4,.8));
end

player_class.Register( "t_terror", CLASS )

-------------------------------------------

local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Elite Crew" --"Elite Crew "
CLASS.Description       = "Middle Eastern fundamentalist group bent on world \ndomination and various other evil deeds."
CLASS.PlayerModel		= {"models/player/leet.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_glock" )
pl:Give( "weapon_knife" )
-- pl:GiveAmmo( 60, "smg1", true )
-- pl:GiveAmmo( 60, "ar2", true )
-- pl:GiveAmmo( 7, "357", true )
-- pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.3,.6,.3));
end

player_class.Register( "t_leet", CLASS )

-------------------------------------------

local CLASS = {}


CLASS.Base 				= "player"
CLASS.DisplayName		= "Arctic Avengers" --"Arctic Avengers"
CLASS.Description       = "Swedish terrorist faction founded in 1977. Famous for \ntheir bombing of the Canadian embassy in 1990."
CLASS.PlayerModel		= {"models/player/arctic.mdl"}
function CLASS:Loadout( pl )

pl:Give( "weapon_glock" )
pl:Give( "weapon_knife" )
-- pl:GiveAmmo( 60, "smg1", true )
-- pl:GiveAmmo( 60, "ar2", true )
-- pl:GiveAmmo( 7, "357", true )
-- pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "t_arctic", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "Guerilla Warfare" --"Guerilla Warfare "
CLASS.Description       = "A terrorist faction founded in the Middle East, this \ngroup has a reputation for ruthlessness. Their \ndisgust for the American lifestyle was demonstrated in \ntheir 1982 bombing of a school bus full of Rock and Roll \nmusicians."
CLASS.PlayerModel		= {"models/player/guerilla.mdl"}

function CLASS:Loadout( pl )

pl:Give( "weapon_glock" )
pl:Give( "weapon_knife" )
-- pl:GiveAmmo( 60, "smg1", true )
-- pl:GiveAmmo( 60, "ar2", true )
-- pl:GiveAmmo( 7, "357", true )
-- pl:GiveAmmo( 10, "Buckshot", true )

end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
	pl:SetPlayerColor(Vector(.7,.3,.3));
end

player_class.Register( "t_guerilla", CLASS )