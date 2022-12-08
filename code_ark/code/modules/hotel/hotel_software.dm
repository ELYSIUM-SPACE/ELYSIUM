/datum/computer_file/program/hotel_reservations
	filename = "hotelreservations"
	filedesc = "Hotel Reservations Management"
	nanomodule_path = /datum/nano_module/hotel_reservations
	ui_header = "alarm_green.gif"
	program_icon_state = "crew"
	program_key_state = "generic_key"
	program_menu_icon = "calendar"
	extended_desc = "This program connects to hotel reservations system and enables it to be managed."
	required_access = "ACCESS_LIBERTY_HOTEL"
	requires_ntnet = 1
	network_destination = "hotel reservations database"
	size = 11
	category = PROG_OFFICE

/datum/nano_module/hotel_reservations

	var/program_mode = 1 // 0 - error, 1 - room list, 2 - specific room info, 3 - room logs, 4 - new reservation, 5 - reservation extension
	var/reservation_status = 0 // 0 - adding guests, 1 - pending payment, 2 - reservation complete - the variable is used with modes 4 and 5
	var/reservation_duration = 1 // used with modes 4 and 5

	var/timeout_timer_id // used to prevent people blocking rooms with new reservations

	var/terminal_status = 0 // 0 - the device does not support terminal connection, 1 - the terminal is disconnected, 2 - the terminal is connected, but is in auto mode, 3 - the terminal is connected and is in manual mode

	var/datum/hotel_room/selected_room

	var/obj/machinery/hotel_terminal/connected_terminal

/datum/nano_module/hotel_reservations/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.default_state)

	var/list/hotel_single_room_list = new
	var/list/hotel_double_room_list = new
	var/list/hotel_special_room_list = new

	var/list/hotel_selected_room = new

	var/list/data = host.initial_data()

	for(var/datum/hotel_room/R in GLOB.hotel_rooms)

		if (R == selected_room)
			if (R.room_status == 0)
				give_error()
			else
				hotel_selected_room = list(
					"number" = R.room_number,
					"status" = R.room_status,
					"special" = R.special_room,
					"requests" = R.room_requests,
					"beds" = R.bed_count,
					"capacity" = R.guest_count,
					"price" = R.hourly_price,
					"guests" = R.room_guests2text(),
					"guests_as_list" = R.room_guests,
					"guest_count" = LAZYLEN(R.room_guests),
					"start" = time2text(R.room_reservation_start_time, "hh:mm"),
					"end" = R.room_end_time2text(),
					"room_logs" = R.room_log
					)
			continue

		if (R.special_room)
			hotel_special_room_list.Add(list(list("room" = list(
				"number" = R.room_number,
				"status" = R.room_status,
				"requests" = R.room_requests,
				"beds" = R.bed_count,
				"capacity" = R.guest_count,
				"price" = R.hourly_price,
				"end" = R.room_end_time2text()
			))))
			continue

		if (R.guest_count == 2)
			hotel_double_room_list.Add(list(list("room" = list(
				"number" = R.room_number,
				"status" = R.room_status,
				"requests" = R.room_requests,
				"beds" = R.bed_count,
				"capacity" = R.guest_count,
				"price" = R.hourly_price,
				"end" = R.room_end_time2text()
			))))
			continue

		if (R.guest_count == 1)
			hotel_single_room_list.Add(list(list("room" = list(
				"number" = R.room_number,
				"status" = R.room_status,
				"requests" = R.room_requests,
				"beds" = R.bed_count,
				"capacity" = R.guest_count,
				"price" = R.hourly_price,
				"end" = R.room_end_time2text()
			))))
			continue

	if (program_mode > 3)	// For modes 4 and 5, we gotta keep watch for that terminal
		locate_n_check_terminal()

	data["mode"] = program_mode
	data["reservation"] = reservation_status
	data["duration"] = reservation_duration
	data["single_rooms"] = hotel_single_room_list
	data["double_rooms"] = hotel_double_room_list
	data["special_rooms"] = hotel_special_room_list
	data["selected_room"] = hotel_selected_room
	data["terminal"] = terminal_status

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		locate_n_check_terminal() // We'll try to locate the terminal upon the first use of the program
		// setup_hotel_rooms() // disabled since terminal will initialize them
		ui = new(user, src, ui_key, "hotel.tmpl", "Hotel Reservations System", 390, 550, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/datum/nano_module/hotel_reservations/Topic(href, href_list)
	if (..())
		return TOPIC_REFRESH

	if (href_list["room_select"])
		locate_n_check_terminal()	// Room selection menu does depend on the terminal
		for (var/datum/hotel_room/R in GLOB.hotel_rooms)
			if (R.room_number == href_list["room_select"])
				program_mode = 2
				selected_room = R
		return TOPIC_REFRESH

	if (href_list["return_to_main"])
		program_mode = 1
		selected_room = null
		return TOPIC_REFRESH

	if (href_list["return_to_room"])
		if(!selected_room)
			return TOPIC_REFRESH
		if(program_mode == 4 && reservation_status != 2)
			if(alert("This will erase the reservation. Are you sure?",,"Yes","No")=="No")
				return TOPIC_REFRESH
			else
				if(locate_n_check_terminal() == 3)
					connected_terminal.program_mode = 1
					connected_terminal.flick_screen("hotel_terminal_loading")
				selected_room.clear_reservation()
		reservation_status = 0 // in case we'be been reserving we'd better reset the process
		if(timeout_timer_id)
			deltimer(timeout_timer_id)
			timeout_timer_id = null
		program_mode = 2
		return TOPIC_REFRESH

	if(href_list["locate_terminal"])
		locate_n_check_terminal()
		return TOPIC_REFRESH

	if(href_list["auto"])
		if(locate_n_check_terminal() > 1)
			if(!connected_terminal.auto_mode)
				connected_terminal.auto_mode = 1
				connected_terminal.flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

	if(href_list["noauto"])
		if(locate_n_check_terminal() > 1)
			if(connected_terminal.auto_mode)
				if(connected_terminal.program_mode > 1)
					if(alert("Someone is using the terminal to make a reservation. This will interrupt the process. Are you sure?",,"Yes","No")=="No")
						return TOPIC_REFRESH
					else
						connected_terminal.auto_mode = 0
						connected_terminal.give_error(terminal_reset = 1)
						return TOPIC_REFRESH
				connected_terminal.auto_mode = 0
				connected_terminal.flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

	if (href_list["room_block"])
		if(!selected_room)
			return TOPIC_REFRESH
		selected_room.room_block()
		return TOPIC_REFRESH

	if (href_list["room_unblock"])
		if(!selected_room)
			return TOPIC_REFRESH
		selected_room.room_unblock()
		return TOPIC_REFRESH

	if (href_list["room_reset"])
		if(!selected_room)
			return TOPIC_REFRESH
		selected_room.room_reset()
		return TOPIC_REFRESH

	if (href_list["room_logs"])
		if(!selected_room)
			return TOPIC_REFRESH
		program_mode = 3
		return TOPIC_REFRESH

	if (href_list["print_logs"])
		if(!selected_room)
			return TOPIC_REFRESH
		var/text_to_print = "<b>Room [selected_room.room_number] logs:</b><br><br>"
		for (var/log_entry in selected_room.room_log)
			text_to_print += "[log_entry]<br>"
		text_to_print += "<hr><i>Printed at [stationtime2text()]</i>"
		print_text(text_to_print, usr)
		return TOPIC_REFRESH

	if (href_list["room_reserve"])
		if(locate_n_check_terminal() != 3 || !selected_room)// Room shall not be reserved unless there's a properly functioning terminal
			return TOPIC_REFRESH
		if(selected_room.room_status != 1)
			return TOPIC_REFRESH

		selected_room.room_status = 2
		reservation_duration = 1
		program_mode = 4
		reservation_status = 0

		connected_terminal.program_mode = 3
		connected_terminal.flick_screen("hotel_terminal_loading")

		selected_room.room_reservation_start_time = station_time_in_ticks
		selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
		selected_room.room_log.Add("\[[stationtime2text()]\] Room reservation process was initiated by [selected_room.get_user_id_name()]. Room not available.")
		timeout_timer_id = addtimer(CALLBACK(src, /datum/nano_module/hotel_reservations/proc/give_error), 5 MINUTES, TIMER_UNIQUE|TIMER_STOPPABLE)
		return TOPIC_REFRESH

	if (href_list["room_cancel"])
		if(!selected_room)
			return TOPIC_REFRESH
		if(selected_room.room_status == 3)
			if(alert("This will immediately cancel the reservation, invalidating keycards of the guests. Are you sure?",,"Yes","No")=="No")
				return
		selected_room.clear_reservation(just_reset = text2num(href_list["room_cancel"]) == 2 ? 1 : 0)
		if (program_mode == 4)
			reservation_duration = 1
			program_mode = 4
			reservation_status = 0
			selected_room.room_reservation_start_time = station_time_in_ticks
			selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
		return TOPIC_REFRESH

	if(href_list["set_duration"])
		reservation_duration = text2num(href_list["set_duration"])
		if(program_mode == 4 && selected_room)
			selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
		return TOPIC_REFRESH

	if(href_list["remove_guest"])
		if(selected_room)
			selected_room.remove_guest(href_list["remove_guest"])
			if(LAZYLEN(selected_room.room_guests) != selected_room.guest_count && locate_n_check_terminal() == 3)
				connected_terminal.program_mode = 3
				connected_terminal.flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

	if(href_list["room_pay"])
		if(department_accounts["Service"].suspended)
			to_chat(usr, "<span class='warning'>Payment gateway currently is unable to process the transaction. Please, contact hotel bank account administration.</span>") // replace USR //////////////!!!
			return TOPIC_REFRESH
		if(locate_n_check_terminal() == 3)
			reservation_status = 1
			connected_terminal.program_mode = 4
			connected_terminal.flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

	if(href_list["payment_cancel"])
		reservation_status = 0
		connected_terminal.program_mode = LAZYLEN(selected_room.room_guests) >= selected_room.guest_count ? 1 : 3
		connected_terminal.flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

/datum/nano_module/hotel_reservations/proc/give_error()
	if(timeout_timer_id)
		deltimer(timeout_timer_id)
		timeout_timer_id = null

	if(reservation_status == 2)
		program_mode = 1
		selected_room = null
		reservation_status = 0
		return
	if(!selected_room)
		return
	selected_room.clear_reservation(auto_clear = 1)
	selected_room = null
	if(istype(connected_terminal))
		connected_terminal.program_mode = 1
		connected_terminal.flick_screen("hotel_terminal_loading")
	program_mode = 0

/datum/nano_module/hotel_reservations/proc/locate_n_check_terminal()
	var/obj/machinery/computer/modular/host_console
	if(istype(host, /obj/machinery/computer/modular))
		host_console = host
	else
		terminal_status = 0	// The device is not compatible with terminals
		return 0

	if(!istype(connected_terminal))
		connected_terminal = locate() in range(host_console, 2)

	if(!istype(connected_terminal))
		terminal_status = 1	// The device supports terminal connection, but no terminal has been found nearby
	else

		if(istype(connected_terminal.master_program) && connected_terminal.master_program != src)	// Check if we're overriding an existing terminal connection
			if(connected_terminal.master_program.locate_n_check_terminal() > 1 )
				terminal_status = 1
				if(program_mode > 3 && terminal_status != 3)
					give_error()
				return terminal_status

		if(get_dist_euclidian(connected_terminal, host_console) > 3 || connected_terminal.stat & (NOPOWER|BROKEN))
			connected_terminal = null
			terminal_status = 1		// The device supports terminals, but the terminal isn't usable
		else
			if(connected_terminal.master_program != src)
				connected_terminal.master_program = src
			if(connected_terminal.auto_mode)
				terminal_status = 2	// Terminal connection established, but the terminal is in auto-mode
			else
				terminal_status = 3	// Terminal connection established and the terminal is in manual mode

	if(program_mode > 3 && terminal_status != 3)
		give_error()

	return terminal_status

