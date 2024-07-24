SUBSYSTEM_DEF(hotel)
	name = "Hotel"
	wait = 1 MINUTE
	priority = SS_PRIORITY_DEFAULT
	init_order = SS_INIT_MISC_LATE				//Low order for initialization
	runlevels = RUNLEVEL_GAME|RUNLEVEL_POSTGAME


//path for hotel systems: code_ark/code/modules/hotel


/datum/controller/subsystem/hotel/Initialize()
	setup_hotel_rooms()
	. = ..()

/datum/controller/subsystem/hotel/fire()
	check_hotel_rooms_reservation_time()

/datum/controller/subsystem/hotel/proc/setup_hotel_rooms()
	if (!LAZYLEN(GLOB.hotel_rooms))
		var/rooms_list = GLOB.hotel_room_presets
		for(var/room_number in rooms_list)
			var/hotel_room_preset_path = rooms_list[room_number]
			var/datum/hotel_room/HR = new(room_number, hotel_room_preset_path)
			GLOB.hotel_rooms += HR

/datum/controller/subsystem/hotel/proc/check_hotel_rooms_reservation_time()
	for(var/datum/hotel_room/HL in GLOB.hotel_rooms)
		HL.reservation_time_check()
