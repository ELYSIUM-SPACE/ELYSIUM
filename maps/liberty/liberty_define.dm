/datum/map/liberty
	name = "Liberty"
	full_name = "TTH Liberty"
	path = "liberty"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
//	config_path = "config/liberty_config.txt"

	// Did you know, that posibrains have laws? No? Me too!
	default_law_type = /datum/ai_laws/robocop
	base_floor_type = /turf/simulated/floor/reinforced/airless

	admin_levels = list()
	empty_levels = list(6)
	station_levels = list(1,2,3,4)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1,"5"=1,"6"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("liberty.sfp.scg", "freemail.net")

	allowed_spawns = list("Arrivals Shuttle")
	default_spawn = "Arrivals Shuttle"

	station_name  = "TTH Liberty"
	station_short = "Liberty"
	dock_name     = "TBD"
	boss_name     = "Expeditionary Command"
	boss_short    = "Command"
	company_name  = "Frontier Transport&Logistics"
	company_short = "FroTraLog"

	map_admin_faxes = list("Corporate Central Office")

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	use_overmap = 1
	num_exoplanets = 1

	away_site_budget = 3
	id_hud_icons = 'maps/liberty/icons/assignment_hud.dmi'

	lobby_screens = list('code_ark/icons/elysium_lobby.png')