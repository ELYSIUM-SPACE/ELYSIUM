/obj/machinery/door/airlock/on_update_icon(state=0, override=0)
	if(connections in list(NORTH, SOUTH, NORTH|SOUTH, NORTH|WEST|SOUTH, NORTH|EAST|SOUTH))
		if(connections in list(WEST, EAST, EAST|WEST))
			set_dir(SOUTH)
		else
			set_dir(EAST)
	else
		set_dir(SOUTH)

	switch(state)
		if(0)
			if(density)
				icon_state = "closed"
				state = AIRLOCK_CLOSED
			else
				icon_state = "open"
				state = AIRLOCK_OPEN
		if(AIRLOCK_OPEN)
			icon_state = "open"
		if(AIRLOCK_CLOSED)
			icon_state = "closed"
		if(AIRLOCK_OPENING, AIRLOCK_CLOSING, AIRLOCK_EMAG, AIRLOCK_DENY)
			icon_state = ""

	set_airlock_overlays(state)

/obj/machinery/door/airlock/lift/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/door/airlock/external/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/door/airlock/lift/LateInitialize()
	..()
	update_connections()
	update_icon()
	return

/obj/machinery/door/airlock/external/LateInitialize()
	..()
	update_connections()
	update_icon()
	return

/obj/machinery/door/airlock/lift
	blend_objects = list(/obj/structure/wall_frame, /obj/structure/window, /obj/structure/grille, /obj/machinery/door/airlock/lift)

/obj/machinery/door/airlock/external
	blend_objects = list(/obj/structure/wall_frame, /obj/structure/window, /obj/structure/grille, /obj/machinery/door/airlock/external)

//MEDBAY

/obj/machinery/door/airlock/medical/liberty
	stripe_color = COLOR_GREEN_GRAY

/obj/machinery/door/airlock/medical/liberty_inverted
	door_color = COLOR_GREEN_GRAY
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/glass/medical/liberty
	stripe_color = COLOR_GREEN_GRAY

/obj/machinery/door/airlock/glass/medical/liberty_inverted
	door_color = COLOR_GREEN_GRAY
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/multi_tile/medical/liberty
	stripe_color = COLOR_GREEN_GRAY

/obj/machinery/door/airlock/multi_tile/medical/liberty_inverted
	door_color = COLOR_GREEN_GRAY
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/multi_tile/glass/medical/liberty
	stripe_color = COLOR_GREEN_GRAY

/obj/machinery/door/airlock/multi_tile/glass/medical/liberty_inverted
	door_color = COLOR_GREEN_GRAY
	stripe_color = COLOR_WHITE

//BRIG

/obj/machinery/door/airlock/sfp
	door_color = COLOR_SFP_BLUE
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/glass/sfp
	door_color = COLOR_SFP_BLUE
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/multi_tile/sfp
	door_color = COLOR_SFP_BLUE
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/multi_tile/glass/sfp
	door_color = COLOR_SFP_BLUE
	stripe_color = COLOR_WHITE

// PORT SERVICES

/obj/machinery/door/airlock/port
	door_color = COLOR_DARK_BROWN
	stripe_color = COLOR_SILVER

/obj/machinery/door/airlock/glass/port
	door_color = COLOR_DARK_BROWN
	stripe_color = COLOR_SILVER

// ESCAPE PODS

/obj/machinery/door/airlock/external/escapepod/white
	door_color = "#ffffff"