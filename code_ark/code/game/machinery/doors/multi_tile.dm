/obj/machinery/door/airlock/multi_tile
	var/multi_filler = list()

/obj/machinery/door/airlock/multi_tile/New()
	..()
	SetBounds()

/obj/machinery/door/airlock/multi_tile/Move()
	. = ..()
	SetBounds()

/obj/machinery/door/airlock/multi_tile/Destroy()
	. = ..()
	set_opacity(0)
	update_filler_turfs()
	density = FALSE

/obj/machinery/door/airlock/multi_tile/proc/SetBounds()
	if(!(width > 1)) return //Bubblewrap

	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			T.set_opacity(opacity)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			T.set_opacity(opacity)

	if(dir in list(NORTH, SOUTH))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size

/obj/machinery/door/airlock/multi_tile/proc/handle_multidoor()
	if(!(width > 1)) return //Bubblewrap

	update_filler_turfs()
	if(dir in list(NORTH, SOUTH))
		bound_height = world.icon_size * width
		bound_width = world.icon_size
	else if(dir in list(EAST, WEST))
		bound_width = world.icon_size * width
		bound_height = world.icon_size

//We have to find these again since these doors are used on shuttles a lot so the turfs changes
/obj/machinery/door/airlock/multi_tile/proc/update_filler_turfs(var/closing = FALSE)
	for(var/turf/T in multi_filler)
		T.set_opacity(FALSE)

	multi_filler = list()
	for(var/turf/T in get_filler_turfs())
		T.set_opacity(closing)
		multi_filler += list(T)

/obj/machinery/door/airlock/multi_tile/proc/get_filler_turfs()
	. = list()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T)
				. += list(T)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T)
				. += list(T)


/obj/machinery/door/airlock/multi_tile/open()
	. = ..()
	if(!glass)
		update_filler_turfs()

/obj/machinery/door/airlock/multi_tile/close()
	. = ..()
	if(!glass)
		update_filler_turfs(TRUE)

/* /obj/machinery/door/airlock/multi_tile/deconstruct()
	. = ..()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) T.set_opacity(0)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) T.set_opacity(0)

/obj/machinery/door/airlock/multi_tile/Destroy()
	. = ..()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) T.set_opacity(0)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) T.set_opacity(0) */ // WE NEEDA FIX THIS SHIT SOMEHOW

/obj/machinery/door/airlock/multi_tile/glass
	opacity = 0

//hotel penthause multitile airlock
/obj/machinery/door/airlock/multi_tile/civilian/hotel
	name = "\improper Penthouse Hotel Room"
	desc = "A gate to a luxurious heaven. It opens and closes."

	id_tag = "room_Penthouse_airlock"

/obj/machinery/door/airlock/multi_tile/civilian/Initialize()
	. = ..()
	GLOB.hotel_room_airlocks += src

/obj/machinery/door/airlock/multi_tile/civilian/Destroy()
	for(var/datum/hotel_room/HR in GLOB.hotel_rooms)
		if(HR.room_airlock == src)
			HR.room_airlock = null
			HR.room_test_n_update()

	GLOB.hotel_room_airlocks -= src
	. = ..()
