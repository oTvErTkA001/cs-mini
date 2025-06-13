GM.Name 	= "Counter-Strike Mini"
GM.Author 	= "Lenurdo"
GM.Email 	= ""
GM.Website 	= "https://steamcommunity.com/profiles/76561198375778469"
GM.Help		= ""

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_shop.lua")
if SERVER then
    include("sv_shop.lua")
end

GM.Data = {}

DeriveGamemode( "fretta14.3" )


IncludePlayerClasses()					-- Automatically includes files in "gamemode/player_class"

GM.TeamBased = true					-- Team based game or a Free For All game?
GM.AllowAutoTeam = true
GM.AllowSpectating = true
GM.SelectClass = true
GM.SecondsBetweenTeamSwitches = 30
GM.GameLength = 200
GM.RoundLimit = 200					-- Maximum amount of rounds to be played in round based games
GM.VotingDelay = 200					-- Delay between end of game, and vote. if you want to display any extra screens before the vote pops up

GM.NoPlayerSuicide = false
GM.NoPlayerDamage = false
GM.NoPlayerSelfDamage = false		-- Set to true to prevent players from taking damage from themselves (ie. grenades).
GM.NoPlayerTeamDamage = true		-- Set to true to prevent team damage.
GM.NoPlayerPlayerDamage = false 	-- Set to true to prevent player vs. player damage.
GM.NoNonPlayerPlayerDamage = false 	-- Set to true to prevent players from taking damage from non-players.
GM.NoPlayerFootsteps = false		-- When true, all players have silent footsteps
GM.PlayerCanNoClip = false			-- When true, players can use noclip without sv_cheats
GM.TakeFragOnSuicide = true			-- -1 frag on suicide

GM.MaximumDeathLength = 360			-- Player will respawn if death length > this (can be 0 to disable)
GM.MinimumDeathLength = 360			-- Player has to be dead for at least this long
GM.AutomaticTeamBalance = false      -- Teams will be periodically balanced
GM.ForceJoinBalancedTeams = false	-- Players won't be allowed to join a team if it has more players than another team
GM.RealisticFallDamage = true		-- Set to true to use realistic fall damage instead of the fixed 10 damage.
GM.AddFragsToTeamScore = false		-- Adds player's individual kills to team score (must be team based)

GM.NoAutomaticSpawning = false		-- Players don't spawn automatically when they die, some other system spawns them
GM.RoundBased = true				-- Round based, like CS
GM.RoundLength = 301				-- Round length, in seconds
GM.RoundPreStartTime = 3			-- Preperation time before a round starts
GM.RoundPostLength = 5				-- Seconds to show the 'x team won!' screen at the end of a round
GM.RoundEndsWhenOneTeamAlive = false	-- CS Style rules

GM.EnableFreezeCam = false			-- TF2 Style Freezecam
GM.DeathLingerTime = 3				-- The time between you dying and it going into spectator mode, 0 disables

GM.SelectModel = false               -- Can players use the playermodel picker in the F1 menu?
GM.SelectColor = false				-- Can players modify the colour of their name? (ie.. no teams)

GM.PlayerRingSize = 48              -- How big are the colored rings under the player's feet (if they are enabled) ?
GM.HudSkin = "SimpleSkin"

GM.SuicideString = "die"

GM.ValidSpectatorModes = { OBS_MODE_CHASE, OBS_MODE_IN_EYE }
GM.ValidSpectatorEntities = { "player" }	-- Entities we can spectate
GM.CanOnlySpectateOwnTeam = true -- you can only spectate players on your own team

TEAM_CT = 1
TEAM_T = 2

function GM:CreateTeams()

	if ( !GAMEMODE.TeamBased ) then return end

	team.SetUp( TEAM_CT, "Counter-Terrorists", Color( 0, 0, 210 ), true )
	team.SetSpawnPoint( TEAM_CT, { "info_player_counterterrorist" } )
	team.SetClass( TEAM_CT, { "ct_urban", "ct_gsg9", "ct_sas", "ct_gign" } )

	team.SetUp( TEAM_T, "Terrorists", Color( 210, 0, 0 ), true )
	team.SetSpawnPoint( TEAM_T, { "info_player_terrorist" } )
	team.SetClass( TEAM_T, { "t_terror", "t_leet", "t_arctic", "t_guerilla" } )

	team.SetUp( TEAM_SPECTATOR, "Spectator", Color( 0, 210, 0), true )
	team.SetSpawnPoint( TEAM_SPECTATOR, { "info_player_start", "info_player_terrorist", "info_player_counterterrorist", "info_player_combine", "info_player_rebel" } )

end

--had to hard code to make a silent step :D
function GM:PlayerFootstep(ply, pos, foot, sound, volume, filter )
	if(ply:GetVelocity():Length() < 110) then
		return true
	end
end

hook.Add("PlayerCanPickupWeapon", "RestrictWeaponPickup", function(ply, weapon)
    local pickupSlot = weapon:GetSlot()
    if pickupSlot == 0 or pickupSlot == 1 or pickupSlot == 2  then
        for _, plyWeapon in ipairs(ply:GetWeapons()) do
            local plyWeaponSlot = plyWeapon:GetSlot()
            if plyWeaponSlot == pickupSlot then
                if ply:KeyPressed(IN_USE) then
                    ply:DropWeapon(plyWeapon)
                else
                    return false
                end
            end
        end
    end
	if weapon:GetClass() == "weapon_cs_c4" and ply:Team() == 1 then
        return false
    end
end)


--buymenu

Shop = {}

Shop.Items = {
	{
		name = "Glock 18",
		classname = "weapon_glock",
		Wmodel = "models/weapons/w_pist_glock18.mdl",
		price = 400,
		description = "",
	},
	{
		name = "USP Tactical",
		classname = "weapon_usp",
		Wmodel = "models/weapons/w_pist_usp.mdl",
		price = 500,
		description = "",
	},
	{
		name = "P228",
		classname = "weapon_p228",
		Wmodel = "models/weapons/w_pist_p228.mdl",
		price = 600,
		description = "",
	},
	{
		name = "Desert Eagle",
		classname = "weapon_deagle",
		Wmodel = "models/weapons/w_pist_deagle.mdl",
		price = 650,
		description = "",
	},
	{
		name = ".40 Dual Elites",
		classname = "weapon_elite",
		Wmodel = "models/weapons/w_pist_elite.mdl",
		price = 800,
		description = "",
	},
}

Shop.ItemsCT = {
	{
		name = "Glock 18",
		classname = "weapon_glock",
		Wmodel = "models/weapons/w_pist_glock18.mdl",
		price = 400,
		description = "",
	},
	{
		name = "USP Tactical",
		classname = "weapon_usp",
		Wmodel = "models/weapons/w_pist_usp.mdl",
		price = 500,
		description = "",
	},
	{
		name = "P228",
		classname = "weapon_p228",
		Wmodel = "models/weapons/w_pist_p228.mdl",
		price = 600,
		description = "",
	},
	{
		name = "Desert Eagle",
		classname = "weapon_deagle",
		Wmodel = "models/weapons/w_pist_deagle.mdl",
		price = 650,
		description = "",
	},
	{
		name = "ES Five-seven",
		classname = "weapon_fiveseven",
		Wmodel = "models/weapons/w_pist_fiveseven.mdl",
		price = 750,
		description = "",
	},
}

--Heavy
Shop.Items2 = {
	{
		name = "Leone 12 Gauge Super",
		classname = "weapon_m3",
		Wmodel = "models/weapons/w_shot_m3super90.mdl",
		price = 1700,
		description = "",
	},
	{
		name = "LEONE YG1265 Auto",
		classname = "weapon_xm1014",
		Wmodel = "models/weapons/w_shot_xm1014.mdl",
		price = 3000,
		description = "",
	},
	{
		name = "M249",
		classname = "weapon_m249",
		Wmodel = "models/weapons/w_mach_m249para.mdl",
		price = 5200,
		description = "",
	},
}

--T SMG

Shop.Items3 = {
	{
		name = "Ingram Mac-10",
		classname = "weapon_mac10",
		Wmodel = "models/weapons/w_smg_mac10.mdl",
		price = 1400,
		description = "",
	},
	{
		name = "K&M Sub-Machine Gun",
		classname = "weapon_mp5navy",
		Wmodel = "models/weapons/w_smg_mp5.mdl",
		price = 1500,
		description = "",
	},
		{
		name = "UMP 45",
		classname = "weapon_ump45",
		Wmodel = "models/weapons/w_smg_ump45.mdl",
		price = 1700,
		description = "",
	},
	{
		name = "P90",
		classname = "weapon_p90",
		Wmodel = "models/weapons/w_smg_p90.mdl",
		price = 2350,
		description = "",
	},
}

--CT SMG

Shop.ItemsCT3 = {
	{
		name = "Schmidt Machine Pistol",
		classname = "weapon_tmp",
		Wmodel = "models/weapons/w_smg_tmp.mdl",
		price = 1250,
		description = "",
	},
	{
		name = "K&M Sub-Machine Gun",
		classname = "weapon_mp5navy",
		Wmodel = "models/weapons/w_smg_mp5.mdl",
		price = 1500,
		description = "",
	},
		{
		name = "UMP 45",
		classname = "weapon_ump45",
		Wmodel = "models/weapons/w_smg_ump45.mdl",
		price = 1700,
		description = "",
	},
	{
		name = "P90",
		classname = "weapon_p90",
		Wmodel = "models/weapons/w_smg_p90.mdl",
		price = 2350,
		description = "",
	},
}

--Т RIFLE

Shop.Items4 = {
	{
		name = "IDF Defender",
		classname = "weapon_galil",
		Wmodel = "models/weapons/w_rif_galil.mdl",
		price = 2000,
		description = "",
	},
	{
		name = "CV-47",
		classname = "weapon_ak47",
		Wmodel = "models/weapons/w_rif_ak47.mdl",
		price = 2500,
		description = "",
	},
	{
		name = "Schmidt Scout",
		classname = "weapon_scout",
		Wmodel = "models/weapons/w_snip_scout.mdl",
		price = 2750,
		description = "",
	},
	{
		name = "Krieg 552",
		classname = "weapon_sg552",
		Wmodel = "models/weapons/w_rif_sg552.mdl",
		price = 3500,
		description = "",
	},
	{
		name = "Magnum Sniper Rifle",
		classname = "weapon_awp",
		Wmodel = "models/weapons/w_snip_awp.mdl",
		price = 4750,
		description = "",
	},
	{
		name = "D3/AU-1",
		classname = "weapon_g3sg1",
		Wmodel = "models/weapons/w_snip_g3sg1.mdl",
		price = 5000,
		description = "",
	},
}

--CT RIFLLE

Shop.ItemsCT4 = {
	{
		name = "Clarion 5.56",
		classname = "weapon_famas",
		Wmodel = "models/weapons/w_rif_famas.mdl",
		price = 2050,
		description = "",
	},
	{
		name = "Schmidt Scout",
		classname = "weapon_scout",
		Wmodel = "models/weapons/w_snip_scout.mdl",
		price = 2750,
		description = "",
	},
	{
		name = "Maverick Colt M4A1 Carbine",
		classname = "weapon_m4a1",
		Wmodel = "models/weapons/w_rif_m4a1.mdl",
		price = 3100,
		description = "",
	},
	{
		name = "Bullpup",
		classname = "weapon_aug",
		Wmodel = "models/weapons/w_rif_aug.mdl",
		price = 3500,
		description = "",
	},
	{
		name = "Krieg 550 Commando",
		classname = "weapon_sg550",
		Wmodel = "models/weapons/w_snip_sg550.mdl",
		price = 4200,
		description = "",
	},
	{
		name = "Magnum Sniper Rifle",
		classname = "weapon_awp",
		Wmodel = "models/weapons/w_snip_awp.mdl",
		price = 4750,
		description = "",
	},
}

Shop.Items5 = {
	{
		name = "Flashbang",
		classname = "weapon_flashbang",
		Wmodel = "models/weapons/w_eq_flashbang.mdl",
		price = 200,
		description = "Flashes the enemy creating a loud sound.",
	},
	{
		name = "H.E.",
		classname = "weapon_hegrenade",
		Wmodel = "models/weapons/w_eq_fraggrenade.mdl",
		price = 400,
		description = "Powerful explosive grenade.",
	},
	{
		name = "Smoke Grenade",
		classname = "weapon_smokegrenade",
		Wmodel = "models/weapons/w_eq_smokegrenade.mdl",
		price = 300,
		description = "Grenade used to confuse the enemy.",
	},
}

