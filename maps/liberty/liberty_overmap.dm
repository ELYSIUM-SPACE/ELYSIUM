/obj/effect/overmap/visitable/sector/liberty
	name = "TTH Liberty"
	desc = "Liberty is a major spaceport serving as a passenger and logistics hub for the whole sector."
	icon = 'maps/liberty/icons/overmap.dmi'
	icon_state = "liberty"
	in_space = 1
	hide_from_reports = TRUE
	initial_restricted_waypoints = list(
		"SEV Lucius" = list("nav_hangar_lucius"),
		"GUP Kenobi" = list("nav_hangar_kenobi")
	)

// GUP Kenobi
/obj/machinery/computer/shuttle_control/explore/kenobi
	name = "\improper GUP Kenobi control console"
	shuttle_tag = "GUP Kenobi"
	req_access = list(keno)

/obj/effect/overmap/visitable/ship/landable/kenobi
	name = "Kenobi"
	desc = "An EM-16 modular transport, broadcasting station codes and the callsign \"GUP Kenobi\"."
	shuttle = "GUP Kenobi"
	vessel_mass = 10000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/datum/shuttle/autodock/overmap/kenobi
	name = "\improper GUP Kenobi"
	move_time = 6 SECONDS
	warmup_time = 0.5 SECONDS
	shuttle_area = list(
		/area/liberty/kenobi,
		/area/liberty/kenobi/airlock,
		/area/liberty/kenobi/cockpit,
		/area/liberty/kenobi/passenger
	)
	current_location = "nav_hangar_kenobi"
	logging_home_tag = "nav_hangar_kenobi"
	logging_access = keno
	defer_initialisation = TRUE
	skill_needed = SKILL_NONE

/obj/effect/shuttle_landmark/kenobi
	name = "Kenobi Hangar"
	landmark_tag = "nav_hangar_kenobi"
	docking_controller = "kenobi_shuttle_dock_airlock"
	base_turf = /turf/simulated/floor/plating
	base_area = /area/liberty/hangar
