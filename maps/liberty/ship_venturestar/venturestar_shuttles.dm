/obj/machinery/computer/shuttle_control/explore/venturestar
	name = "IMV VentureStar control console"
	req_access = list(access_venturestar)
	shuttle_tag = "IMV VentureStar"

/obj/effect/overmap/visitable/ship/landable/venturestar
	name = "IMV VentureStar"
	shuttle = "IMV VentureStar"
	icon_state = "ship"
	moving_state = "ship_moving"
	fore_dir = WEST
	color = "#cfac61"
	vessel_mass = 1300
	vessel_size = SHIP_SIZE_SMALL

/datum/shuttle/autodock/overmap/venturestar
	name = "IMV VentureStar"
	warmup_time = 5
	range = 1
	current_location = "nav_venturestar_start"
	current_dock_target = "venturestar_dock"
	shuttle_area = list(
		/area/venturestar/primarystorage, /area/venturestar/primaryairlock, /area/venturestar/crew_quarters, /area/venturestar/engineering
		)
	defer_initialisation = TRUE
	knockdown = FALSE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/reinforced/airless

/obj/effect/shuttle_landmark/venturestar/start
	name = "VentureStar Docking Port"
	landmark_tag = "nav_venturestar_start"
	docking_controller = "venturestar_dock"

/obj/effect/shuttle_landmark/venturestar/aux
	name = "VentureStar Auxillary Docking Port"
	landmark_tag = "nav_venturestar_aux_dock"
	docking_controller = "venturestar_aux_dock"


