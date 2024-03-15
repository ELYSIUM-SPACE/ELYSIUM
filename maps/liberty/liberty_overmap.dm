/obj/effect/overmap/visitable/sector/liberty
	name = "TTH Liberty"
	desc = "Liberty is a major spaceport serving as a passenger and logistics hub for the whole sector."
	icon = 'maps/liberty/icons/overmap.dmi'
	icon_state = "liberty"
	in_space = 1
	hide_from_reports = TRUE
	initial_restricted_waypoints = list(
		"SEV Lucius" = list("nav_hangar_lucius"),
		"GUP Kenobi" = list("nav_hangar_kenobi"),
		"ISV Bebop" = list("nav_bebop_dock"),
		"FGS Konigstiger" = list("nav_konigstiger_dock")
	)

// GUP Kenobi
/obj/machinery/computer/shuttle_control/explore/kenobi
	name = "\improper GUP Kenobi control console"
	shuttle_tag = "GUP Kenobi"
	req_access = list(keno)

/obj/effect/overmap/visitable/ship/landable/kenobi
	name = "\improper GUP Kenobi"
	desc = "An EM-16 modular transport, broadcasting station codes and the callsign \"GUP Kenobi\"."
	shuttle = "GUP Kenobi"
	vessel_mass = 10000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/datum/shuttle/autodock/overmap/kenobi
	name = "GUP Kenobi"
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
	skill_needed = SKILL_NONE

/obj/effect/shuttle_landmark/kenobi
	name = "Kenobi Hangar"
	landmark_tag = "nav_hangar_kenobi"
	base_turf = /turf/simulated/floor/plating
	base_area = /area/liberty/hangar

// ISV Bebop
/obj/machinery/computer/shuttle_control/explore/bebop
	name = "\improper ISV Bebop control console"
	shuttle_tag = "ISV Bebop"
	req_access = list(bebo)

/obj/effect/overmap/visitable/ship/landable/bebop
	name = "\improper ISV Bebop"
	desc = "An EK-12 transport vehicle, broadcasting station codes and the callsign \"ISV Bebop\"."
	shuttle = "ISV Bebop"
	vessel_mass = 10000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/datum/shuttle/autodock/overmap/bebop
	name = "ISV Bebop"
	move_time = 6 SECONDS
	warmup_time = 0.5 SECONDS
	shuttle_area = list(
		/area/liberty/bebop,
		/area/liberty/bebop/cockpit,
		/area/liberty/bebop/main,
		/area/liberty/bebop/service
	)
	current_location = "nav_bebop_dock"
	logging_home_tag = "nav_bebop_dock"
	logging_access = bebo

/obj/effect/shuttle_landmark/bebop
	name = "Bebop Dock"
	landmark_tag = "nav_bebop_dock"

// FGS Konigstiger
/obj/machinery/computer/shuttle_control/explore/konigstiger
	name = "\improper FGS Konigstiger control console"
	shuttle_tag = "FGS Konigstiger"
	req_access = list(koni)

/obj/effect/overmap/visitable/ship/landable/konigstiger
	name = "\improper FGS Konigstiger"
	desc = "A SK-32 security transport, broadcasting station codes and the callsign \"FGS Konigstiger\"."
	shuttle = "FGS Konigstiger"
	vessel_mass = 10000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/datum/shuttle/autodock/overmap/konigstiger
	name = "FGS Konigstiger"
	move_time = 4 SECONDS
	warmup_time = 0.5 SECONDS
	shuttle_area = list(
		/area/liberty/konigstiger,
		/area/liberty/konigstiger/airlock,
		/area/liberty/konigstiger/cockpit,
		/area/liberty/konigstiger/passenger
	)
	current_location = "nav_konigstiger_dock"
	logging_home_tag = "nav_konigstiger_dock"
	logging_access = koni
	skill_needed = SKILL_NONE

/obj/effect/shuttle_landmark/koni
	name = "Konigstiger Dock"
	landmark_tag = "nav_konigstiger_dock"
