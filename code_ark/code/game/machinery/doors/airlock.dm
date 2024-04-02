GLOBAL_LIST_EMPTY(hotel_room_airlocks)

//hotel room airlock
/obj/machinery/door/airlock/civilian/hotel
	name = "\improper Room Unset"
	desc = "A promising sight of comfort for a weary space traveler. It opens and closes."

/obj/machinery/door/airlock/civilian/hotel/Initialize()
	. = ..()
	GLOB.hotel_room_airlocks += src

/obj/machinery/door/airlock/civilian/hotel/Destroy()
	for(var/datum/hotel_room/HR in GLOB.hotel_rooms)
		if(HR.room_airlock == src)
			HR.room_airlock = null
			HR.room_test_n_update()

	GLOB.hotel_room_airlocks -= src
	. = ..()
