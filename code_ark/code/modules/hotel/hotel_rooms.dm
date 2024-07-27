// Hotel room defines in /code_ark/code/datums/__defines/hotel.dm

// Hotel room presets

/hotel_room_preset
	var/room_number
	var/bed_count
	var/guest_count // Do not set if corresponds to the number of beds
	var/hourly_price
	var/special_room = 0 // It indicates if the room can be reserved only through an employee

/hotel_room_preset/one_zero_one
	room_number = "101"
	bed_count = 1
	hourly_price = 123

/hotel_room_preset/one_zero_two
	room_number = "102"
	bed_count = 1
	hourly_price = 123

/hotel_room_preset/one_zero_three
	room_number = "103"
	bed_count = 1
	hourly_price = 123

/hotel_room_preset/one_zero_four
	room_number = "104"
	bed_count = 1
	hourly_price = 123

/hotel_room_preset/two_zero_one
	room_number = "201"
	bed_count = 2
	hourly_price = 223

/hotel_room_preset/two_zero_two
	room_number = "202"
	bed_count = 2
	hourly_price = 223

/hotel_room_preset/three_zero_one
	room_number = "301"
	bed_count = 1
	guest_count = 2
	hourly_price = 323

/hotel_room_preset/three_zero_two
	room_number = "302"
	bed_count = 1
	guest_count = 2
	hourly_price = 323

/hotel_room_preset/three_zero_three
	room_number = "303"
	bed_count = 1
	guest_count = 2
	hourly_price = 323

/hotel_room_preset/penthouse
	room_number = "Penthouse"
	bed_count = 1
	guest_count = 2
	hourly_price = 423
	special_room = 1

GLOBAL_LIST_INIT(hotel_room_presets, list(			// Make sure any rooms you've created above are added to this list and vice versa,
	"101" = /hotel_room_preset/one_zero_one,
	"102" = /hotel_room_preset/one_zero_two,
	"103" = /hotel_room_preset/one_zero_three,
	"104" = /hotel_room_preset/one_zero_four,
	"201" = /hotel_room_preset/two_zero_one,
	"202" = /hotel_room_preset/two_zero_two,
	"301" = /hotel_room_preset/three_zero_one,
	"302" = /hotel_room_preset/three_zero_two,
	"303" = /hotel_room_preset/three_zero_three,
	"Penthouse" = /hotel_room_preset/penthouse
))

GLOBAL_LIST_EMPTY(hotel_rooms)

// Defining room datums

/datum/hotel_room
	var/room_number
	var/bed_count
	var/guest_count
	var/hourly_price
	var/special_room

	var/room_status = ROOM_STATUS_BROKEN
	var/room_request = ROOM_REQUEST_NONE
	var/list/room_keys = list()
	var/list/room_guests = list()
	var/room_reservation_start_time
	var/room_reservation_end_time

	var/list/room_log = list()

	var/obj/machinery/hotel_room_sign/room_sign
	var/obj/machinery/hotel_room_controller/room_controller
	var/obj/machinery/door/airlock/room_airlock

/datum/hotel_room/New(var/new_room_number, var/hotel_room_preset_path)
	room_number = new_room_number
	if(ispath(hotel_room_preset_path, /hotel_room_preset))
		var/hotel_room_preset/hotel_room_preset = decls_repository.get_decl(hotel_room_preset_path)
		bed_count = hotel_room_preset.bed_count
		if(hotel_room_preset.guest_count)
			guest_count = hotel_room_preset.guest_count
		else
			guest_count = hotel_room_preset.bed_count
		hourly_price = hotel_room_preset.hourly_price
		special_room = hotel_room_preset.special_room

		for(var/obj/machinery/hotel_room_sign/S in GLOB.hotel_room_signs)
			if (S.id_tag == "room_[room_number]_sign")
				room_sign = S
				break
		if(!room_sign)
			crash_with("Hotel room ([room_number]) is unable to find its sign!")

		for(var/obj/machinery/hotel_room_controller/C in GLOB.hotel_room_controllers)
			if (C.id_tag == "room_[room_number]_controller")
				room_controller = C
				room_controller.hotel_room = src
				break
		if(!room_controller)
			crash_with("Hotel room ([room_number]) is unable to find its controller!")
		for(var/obj/machinery/door/airlock/A in GLOB.hotel_room_airlocks)
			if (A.id_tag == "room_[room_number]_airlock")
				room_airlock = A
				break
		if(!room_airlock)
			crash_with("Hotel room ([room_number]) is unable to find its door!")

	else
		crash_with("Hotel room preset ([room_number]) is incorrect!")

	room_airlock.autoset_access = 0
	room_airlock.req_access = list(list("ACCESS_LIBERTY_HOTEL", "ACCESS_LIBERTY_ROOM_[room_number]"))
	room_controller.hotel_room = src
	room_sign.hotel_room = src

	room_status = ROOM_STATUS_AVAILABLE

	room_test_n_update()

/datum/hotel_room/Destroy()
	if(room_controller)
		room_controller.hotel_room = null
		room_controller = null
	if(room_sign)
		room_sign.hotel_room = null
		room_sign = null
	room_airlock = null

	. = ..()

// SUPPORT PROCS

/datum/hotel_room/proc/room_test_n_update()
	var/room_is_broken = FALSE

	if (!istype(room_sign))
		room_sign = null
		room_is_broken = TRUE
	else
		room_sign.update_icon()

	if (!istype(room_controller))
		room_controller = null
		room_is_broken = TRUE
	else
		room_controller.update_icon()

	if (!istype(room_airlock))
		room_airlock = null
		room_is_broken = TRUE

	if (room_is_broken && room_status)
		room_status = ROOM_STATUS_BROKEN
		room_request = ROOM_REQUEST_NONE
		clear_reservation()

	if (room_status == ROOM_STATUS_BROKEN)
		return FALSE
	else
		return TRUE

/datum/hotel_room/proc/room_guests2text()
	var/room_guest_list = ""
	if(room_status == ROOM_STATUS_RESERVATION_IN_PROGRESS || room_status == ROOM_STATUS_OCCUPIED)
		var/N = 0
		if(room_guests.len)
			for(var/guest_name in room_guests)
				room_guest_list += "[guest_name]"
				N += 1
				if (N < room_guests.len)
					room_guest_list += ", "
		else
			room_guest_list = "none"
	return room_guest_list

/datum/hotel_room/proc/get_user_id_name()				// Used for logging
	if(istype(usr, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = usr
		return H.get_id_name("unknown")
	else
		return "unknown"

/datum/hotel_room/proc/room_end_time2text()
	var/extra_days
	if(!room_reservation_end_time)
		return
	. = time2text(room_reservation_end_time, "hh:mm")
	if(room_reservation_end_time > next_station_date_change)
		extra_days = 1 + round((room_reservation_end_time - next_station_date_change) / (1 DAY))
		. += " +[extra_days]"
	return .

//called by hotel subsystem
/datum/hotel_room/proc/reservation_time_check()

	if(room_status == ROOM_STATUS_OCCUPIED && world.time >= room_reservation_end_time)
		end_reservation()

// OPERATIONS WITH ROOMS

/datum/hotel_room/proc/room_block()
	if(room_status != ROOM_STATUS_AVAILABLE)
		return
	room_status = ROOM_STATUS_BLOCKED
	var/log_entry = "\[[stationtime2text()]\] The room was blocked by [get_user_id_name()]."

	room_log.Add(log_entry)
	room_test_n_update()

/datum/hotel_room/proc/room_unblock()
	if(room_status != ROOM_STATUS_BLOCKED)
		return
	if(room_request != ROOM_REQUEST_TURNOVER)
		room_status = ROOM_STATUS_AVAILABLE
		var/log_entry = "\[[stationtime2text()]\] The room was unblocked by [get_user_id_name()]."
		room_log.Add(log_entry)

	room_test_n_update()

/datum/hotel_room/proc/room_reset()
	var/log_entry
	if(room_request > 1)
		log_entry = "\[[stationtime2text()]\] The room was reset by [get_user_id_name()]. "
		room_request = ROOM_REQUEST_NONE
		if(room_status == ROOM_STATUS_BLOCKED)
			log_entry += "Room turnover was marked as complete. Reservation possible."
			room_status = ROOM_STATUS_AVAILABLE
		else
			log_entry += "Make up request was marked as fulfilled."

	room_log.Add(log_entry)
	room_test_n_update()

/datum/hotel_room/proc/remove_guest(var/guest_name)
	for(var/guest in room_guests)
		if(guest == guest_name)
			room_guests -= guest_name

/datum/hotel_room/proc/add_guest(var/guest_name)
	if(LAZYLEN(room_guests) < guest_count && !(guest_name in room_guests) && room_status == ROOM_STATUS_RESERVATION_IN_PROGRESS)
		room_guests += guest_name
		return 1
	return 0

/datum/hotel_room/proc/complete_reservation()
	var/log_entry = "\[[stationtime2text()]\] The room reservation was created. Guest list: [room_guests2text()]. Reservation start / end times: [time2text(room_reservation_start_time, "hh:mm")] / [room_end_time2text()]."
	room_log.Add(log_entry)
	room_status = ROOM_STATUS_OCCUPIED

/datum/hotel_room/proc/end_reservation()
	clear_reservation(auto_clear = TRUE)

/datum/hotel_room/proc/clear_reservation(var/auto_clear = FALSE, var/terminal_clear = FALSE, var/just_reset = FALSE)

	// If the room has no reservation or hasn't been broken there's nothing to cancel
	if(room_status != ROOM_STATUS_RESERVATION_IN_PROGRESS && room_status != ROOM_STATUS_OCCUPIED && room_status != ROOM_STATUS_BROKEN)
		return

	var/log_entry
	if(room_status == ROOM_STATUS_OCCUPIED)
		if(auto_clear)
			log_entry = "\[[stationtime2text()]\] An active room reservation ended. Keycards of the following guests were rendered expired automatically: [room_guests2text()]. Room turnover required."
		else
			log_entry = "\[[stationtime2text()]\] An active room reservation was canceled by [get_user_id_name()]. Keycards of the following guests were rendered invalid: [room_guests2text()]. Room turnover required."
		room_status = ROOM_STATUS_BLOCKED
		room_request = ROOM_REQUEST_TURNOVER
	else
		if (room_reservation_end_time && room_status == ROOM_STATUS_BROKEN) // A broken room with end time set indicates an existing reservation
			log_entry = "\[[stationtime2text()]\] An active room reservation was automatically cancelled due to a fatal error! Keycards of the following guests were rendered invalid: [room_guests2text()]. Room unusable."
		else
			if(auto_clear)
				log_entry = "\[[stationtime2text()]\] Room reservation process was automatically terminated due to a"
				if(room_status)
					if(terminal_clear)
						log_entry += " a terminal error (terminal reset). Room reset."
					else
						log_entry += " timeout. Room reset."
					room_status = ROOM_STATUS_AVAILABLE
				else
					log_entry += " fatal room error."
			else
				if(!just_reset)
					log_entry = "\[[stationtime2text()]\] Room reservation process was terminated [terminal_clear ? "in a guest terminal" : "by " + get_user_id_name()]. Room reset."
					room_status = ROOM_STATUS_AVAILABLE
	if(log_entry)
		room_log.Add(log_entry)

	room_reservation_start_time = null
	room_reservation_end_time = null
	for(var/obj/item/card/id/hotel_key/K in room_keys)
		K.expire()
	room_keys = list()
	room_guests = list()

	if(room_controller)
		room_controller.flick_screen("room_controller_screensaver")
		room_controller.visible_message("<span class='notice'>[room_controller] screen flickers and it beeps, indicating the end of room reservation period.</span>")
		playsound(room_controller, 'sound/machines/ping.ogg', 10)

	room_test_n_update()

/datum/hotel_room/proc/room_change_request(var/new_request = ROOM_REQUEST_NONE)
	if(!istype(room_sign))
		room_test_n_update()
		return

	room_request = new_request
	room_sign.update_icon()

/datum/hotel_room/proc/open_airlock()
	if(!istype(room_airlock))
		room_test_n_update()
		return TRUE

	if(room_airlock.locked)
		return FALSE

	room_airlock.open()
	return TRUE

/datum/hotel_room/proc/toggle_airlock_bolts()
	if(!istype(room_airlock))
		room_test_n_update()
		return

	if(room_airlock.density)
		room_airlock.toggle_lock()
	else
		room_airlock.close()
		addtimer(CALLBACK(room_airlock, TYPE_PROC_REF(/obj/machinery/door/airlock, toggle_lock)), 2 SECONDS, TIMER_UNIQUE)
