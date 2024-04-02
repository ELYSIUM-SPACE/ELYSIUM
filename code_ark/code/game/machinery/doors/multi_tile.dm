/obj/machinery/door/airlock/multi_tile/SetBounds()
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

//We have to find these again since these doors are used on shuttles a lot so the turfs changes
/obj/machinery/door/airlock/multi_tile/proc/update_filler_turfs()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) T.set_opacity(opacity)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) T.set_opacity(opacity)


/obj/machinery/door/airlock/multi_tile/proc/get_filler_turfs()
	var/list/filler_turfs = list()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) filler_turfs += T
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) filler_turfs += T
	return filler_turfs

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

/obj/machinery/door/airlock/multi_tile/open()
	. = ..()
	update_filler_turfs()

/obj/machinery/door/airlock/multi_tile/close()
	. = ..()
	update_filler_turfs()

/obj/machinery/door/airlock/multi_tile/glass
	opacity = 0

//hotel penthause multitile airlock
/obj/machinery/door/airlock/multi_tile/civilian/hotel
	name = "\improper Penthouse Hotel Room"
	desc = "A gate to a luxurious heaven. It opens and closes."

	id_tag = "room_penthouse_airlock"

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
