
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "SEAL TEAM 6" --"SEAL TEAM 6"
CLASS.Description       = "ST-6 (to be known later as DEVGRU) was founded in 1980 \nunder the command of Lieutenant-Commander Richard \nMarcincko. ST-6 was placed on permanent alert to respond \nto terrorist attacks against American targets worldwide."
CLASS.PlayerModel		= {"models/player/urban.mdl"}

function CLASS:Loadout( pl )

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

<<<<<<< HEAD
=======
=======
pl:Give( "weapon_knife" )
pl:Give( "weapon_usp" )
pl:GiveAmmo( 100 , "Pistol", true )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
end

function CLASS:OnSpawn( pl )
	pl:SetSkin(0)
	pl:SetupHands()
end

player_class.Register( "ct_urban", CLASS )

-------------------------------------------

local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "GSG-9" --"GSG-9 "
CLASS.Description       = "GSG-9 was born out of the tragic events that led to the \ndeath of several Israeli athletes during the \n1972 Olympic games in Munich, Germany."
CLASS.PlayerModel		= {"models/player/riot.mdl"}
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
function CLASS:Loadout( pl )

pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

<<<<<<< HEAD
=======
=======

function CLASS:Loadout( pl )

pl:Give( "weapon_knife" )
pl:Give( "weapon_usp" )
pl:GiveAmmo( 100 , "Pistol", true )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_gsg9", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "SAS" --"SAS "
CLASS.Description       = "The world-renowned British SAS was founded in the Second \nWorld War by a man named David Stirling. Their \nrole during WW2 involved gathering intelligence behind \nenemy lines and executing sabotage strikes and \nassassinations against key targets."
CLASS.PlayerModel		= {"models/player/gasmask.mdl"}

function CLASS:Loadout( pl )

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

<<<<<<< HEAD
=======
=======
pl:Give( "weapon_knife" )
pl:Give( "weapon_usp" )
pl:GiveAmmo( 100 , "Pistol", true )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_sas", CLASS )

-------------------------------------------
local CLASS = {}

CLASS.Base 				= "player"
CLASS.DisplayName		= "GIGN" --"GIGN "
CLASS.Description       = "France's elite Counter-Terrorist unit, the GIGN, was \ndesigned to be a fast response force that could \ndecisively react to any large-scale terrorist incident. \nConsisting of no more than 100 men, the GIGN has earned \nits reputation through a history of successful ops."
CLASS.PlayerModel		= {"models/player/swat.mdl"}

function CLASS:Loadout( pl )

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
pl:Give( "weapon_usp" )
pl:Give( "weapon_knife" )
pl:GiveAmmo( 60, "smg1", true )
pl:GiveAmmo( 60, "ar2", true )
pl:GiveAmmo( 7, "357", true )
pl:GiveAmmo( 10, "Buckshot", true )

<<<<<<< HEAD
=======
=======
pl:Give( "weapon_knife" )
pl:Give( "weapon_usp" )
pl:GiveAmmo( 100 , "Pistol", true )
>>>>>>> 4dc87c9a9a8c616cfb4ce3af35ef0301978d6c65
>>>>>>> 3c457eae2159f7c5271b231c00c69ed5a06c083d
end

function CLASS:OnSpawn( pl )
	pl:SetupHands()
end

player_class.Register( "ct_gign", CLASS )