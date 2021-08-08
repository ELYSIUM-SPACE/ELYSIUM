/obj/turbolift_map_holder/liberty/hotel
	name = "Liberty hotel turbolift map placeholder"
	dir = EAST
	depth = 4
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_2x2.dmi'
	floor_type = /turf/simulated/floor/carpet/red
	door_floor_type = /turf/simulated/floor/tiled/techfloor/grid

	areas_to_use = list(
	/area/turbolift/liberty/hotel/ground,
	/area/turbolift/liberty/hotel/one,
	/area/turbolift/liberty/hotel/two,
	/area/turbolift/liberty/hotel/top
		)

	ext_panel_y_adj = -3
	int_panel_y_adj = 1

/obj/turbolift_map_holder/liberty/medbay
	name = "Liberty medbay turbolift map placeholder"
	dir = WEST
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_2x2.dmi'
	door_floor_type = /turf/simulated/floor/tiled/white/monotile
	floor_type = /turf/simulated/floor/tiled/white

	areas_to_use = list(
	/area/turbolift/liberty/medbay/ground,
	/area/turbolift/liberty/medbay/top
		)

/obj/turbolift_map_holder/liberty/east
	name = "Liberty east main turbolift map placeholder"
	dir = WEST
	depth = 4
	lift_size_x = 4
	lift_size_y = 4
	door_floor_type = /turf/simulated/floor/tiled/monotile
	floor_type = /turf/simulated/floor/tiled/techmaint

	areas_to_use = list(
	/area/turbolift/liberty/east/ground,
	/area/turbolift/liberty/east/one,
	/area/turbolift/liberty/east/two,
	/area/turbolift/liberty/east/three,
	/area/turbolift/liberty/east/top
		)

/obj/turbolift_map_holder/liberty/north
	name = "Liberty north main turbolift map placeholder"
	dir = SOUTH
	depth = 4
	lift_size_x = 4
	lift_size_y = 4
	door_floor_type = /turf/simulated/floor/tiled/monotile
	floor_type = /turf/simulated/floor/tiled/techmaint

	areas_to_use = list(
	/area/turbolift/liberty/north/ground,
	/area/turbolift/liberty/north/one,
	/area/turbolift/liberty/north/two,
	/area/turbolift/liberty/north/top
		)

/obj/machinery/computer/shuttle_control/lift/cargo
	name = "cargo lift controls"
	shuttle_tag = "Primary Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE
