// Objects' visuals and basics
#define PROGRAM_MODE_ERROR				0
#define PROGRAM_MODE_ROOM_SELECTION		1
#define PROGRAM_MODE_RESERVATION		2
#define PROGRAM_MODE_GUEST				3	//adding guests via ID scans
#define PROGRAM_MODE_PAYMENT			4	//processing payment


/obj/machinery/computer/modular/preset/hotel
	default_software = list(
		/datum/computer_file/program/hotel_reservations,
		/datum/computer_file/program/wordprocessor
	)
	autorun_program = /datum/computer_file/program/hotel_reservations

/obj/machinery/hotel_terminal
	name = "hotel reservations systems terminal"
	desc = "It can be used for self-service reservations when set to automatic mode, as an ID scanner and payment terminal when operating in connection with a console and for recycling expired hotel keycards by hotel staff. "
	icon = 'code_ark/icons/obj/machinery.dmi'
	icon_state = "hotel_terminal"
	density = TRUE
	anchored = TRUE
	power_channel = EQUIP
	idle_power_usage = 50

	var/auto_mode = TRUE		// FALSE - manual
	var/program_mode = PROGRAM_MODE_ROOM_SELECTION
	var/keycard_recycle_required_access = "ACCESS_LIBERTY_HOTEL"

	var/reservation_duration = 1
	var/payment_complete = FALSE

	var/datum/nano_module/hotel_reservations/master_program
	var/datum/hotel_room/selected_room

	var/timeout_timer_id

/*/obj/item/stock_parts/circuitboard/hotel_terminal
	name = T_BOARD("hotel reservations system serivce terminal")
	build_path = /obj/machinery/hotel_terminal*/

/obj/machinery/hotel_terminal/Initialize()
	. = ..()
	update_icon()

/obj/machinery/hotel_terminal/Destroy()
	if(master_program)
		master_program.connected_terminal = null
	. = ..()

/obj/machinery/hotel_terminal/attackby(obj/item/W, mob/user)
	var/obj/item/card/id/I = W.GetIdCard()

	if(istype(W, /obj/item/card/id/hotel_key))
		if(keycard_recycle_required_access in I.access)
			flick_screen("hotel_terminal_loading")
			if(alert(user, "Are you sure you want to recycle \the [W]?", "Confirmation", "Confirm", "Cancel") == "Confirm")
				if(user in range(src, 1) && user.get_active_hand() == W)	//sanity checks
					qdel(W)
		else
			to_chat(user, "<span class='notice'>\The [src] flashes a \"Recycling of a keycard requires a staff member.\" warning.</span>")
			return

	if(I || istype(W, /obj/item/spacecash/ewallet))

		visible_message("<span class='info'>\The [usr] swipes \the [I == W || W == null ? I : W] through \the [src].</span>")

		if(program_mode == PROGRAM_MODE_GUEST) // in case of guest scanning
			if(!I)
				to_chat(user, "<span class='warning'>ID error. Check your ID.</span>")
				return
			var/datum/hotel_room/room_to_add_to
			if(!auto_mode && master_program)
				if(master_program.selected_room && master_program.reservation_status == 0)
					room_to_add_to = master_program.selected_room
			if(auto_mode && selected_room)
				room_to_add_to = selected_room
			if(room_to_add_to && I.registered_name != "unknown")
				if(room_to_add_to.add_guest(I.registered_name))
					to_chat(user, "<span class='info'>Guest successfully added.</span>")
					if(auto_mode)
						program_mode = PROGRAM_MODE_RESERVATION
						flick_screen(screen_icon_state = "hotel_terminal_loading")
					else
						if(LAZYLEN(room_to_add_to.room_guests) == room_to_add_to.guest_count)
							program_mode = PROGRAM_MODE_ROOM_SELECTION
							flick_screen(screen_icon_state = "hotel_terminal_loading")
				else
					to_chat(user, "<span class='warning'>Unable to add the guest to the room. Please, check your ID.</span>")
			else
				to_chat(user, "<span class='warning'>Unable to add the guest to the room. Please, check your ID.</span>")
			return

		if(program_mode == PROGRAM_MODE_PAYMENT) // in case of payment

			var/paid = 0
			var/transaction_amount

			if(auto_mode)
				transaction_amount = reservation_duration * selected_room.hourly_price * (reservation_duration >= 24 ? 0.75 : 1)
				if(selected_room.room_status != ROOM_STATUS_RESERVATION_IN_PROGRESS) // one last check for the room before charging someone
					give_error()
					return
			else
				transaction_amount = master_program.reservation_duration * master_program.selected_room.hourly_price * (master_program.reservation_duration >= 24 ? 0.75 : 1)
				if(master_program.selected_room.room_status != ROOM_STATUS_RESERVATION_IN_PROGRESS) // one last check for the room before charging someone
					give_error()
					return


			if(department_accounts["Service"].suspended) // In case department account is not available
				to_chat(user, "<span class='warning'>Payment gateway is currently unable to process the transaction.</span>")
				program_mode = PROGRAM_MODE_GUEST
				return

			if(I) // Payment with an ID card
				var/attempt_pin = ""
				var/datum/money_account/D = get_account(I.associated_account_number)
				if(D && D.security_level)
					attempt_pin = input("Enter pin code", "Hotel transaction") as num
					D = null
					D = attempt_account_access(I.associated_account_number, attempt_pin, 2)
				if(D)
					if(D.transfer(department_accounts["Service"], transaction_amount, "Hotel reservation"))
						paid = 1
					else
						to_chat(user, "<span class='warning'>Transaction failed. Please, try again.</span>")
				else
					to_chat(user, "<span class='warning'>Please, check your card and PIN-code.</span>")

			if(istype(W, /obj/item/spacecash/ewallet)) // Payment with chargecard
				var/obj/item/spacecash/ewallet/chargecard = W
				if(transaction_amount > chargecard.worth)
					to_chat(user, "<span class='warning'>Payment error. Insufficient funds on chargecard.</span>")
				else
					chargecard.worth -= transaction_amount
					department_accounts["Service"].deposit(transaction_amount, "Hotel room reservation", "[chargecard.owner_name] (chargecard)")
					paid = 1

			if(paid)
				playsound(src, 'sound/machines/chime.ogg', 50, 1)
				src.visible_message("[icon2html(src, viewers(get_turf(src)))] \The [src] chimes and initiates keycard printing.")
				to_chat(user, "<span class='info'>Payment processed successfully.</span>")
				payment_complete = TRUE

				if(auto_mode)
					program_mode = PROGRAM_MODE_RESERVATION
					selected_room.complete_reservation()
					print_keycards(selected_room)
				else
					program_mode = PROGRAM_MODE_ROOM_SELECTION
					master_program.reservation_status = 2
					master_program.selected_room.complete_reservation()
					print_keycards(master_program.selected_room)

				flick_screen(screen_icon_state = "hotel_terminal_loading")

/obj/machinery/hotel_terminal/power_change()
	. = ..()
	update_icon()
	if(stat & (NOPOWER))
		give_error()

/obj/machinery/hotel_terminal/on_update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
		return
	var/screen_icon_state
	switch(program_mode)
		if(0)
			screen_icon_state = "hotel_terminal_error"
		if(1)
			if(auto_mode)
				screen_icon_state = "hotel_terminal_room_list"
			else
				screen_icon_state = "hotel_terminal_blocked"
		if(2)
			screen_icon_state = "hotel_terminal_room_reserve"
		if(3)
			screen_icon_state = "hotel_terminal_id_scan"
		if(4)
			screen_icon_state = "hotel_terminal_payment"
	var/image/I = image(icon, screen_icon_state)
	I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	I.layer = ABOVE_LIGHTING_LAYER
	overlays += I
	set_light(0.2, 0.5, 1, 2, "#cba561")

/obj/machinery/hotel_terminal/proc/flick_screen(var/screen_icon_state = "hotel_terminal_screensaver")
	if(stat & (NOPOWER|BROKEN))
		return
	overlays.Cut()
	var/image/I = image(icon, screen_icon_state)
	I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	I.layer = ABOVE_LIGHTING_LAYER
	overlays += I
	spawn(10)
		update_icon()


/obj/machinery/hotel_terminal/interface_interact(var/mob/user)
	flick_screen("hotel_terminal_screensaver")
	// setup_hotel_rooms() - disabled since it was added in the initialization
	ui_interact(user)
	return TRUE

/obj/machinery/hotel_terminal/CanUseTopic(user, state)
	if(stat & (NOPOWER|BROKEN))
		to_chat(user, "<span class='warning'>\The [src] is not working!</span>")
		return STATUS_CLOSE
	return ..()

/obj/machinery/hotel_terminal/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)

	var/list/data = new

	var/list/hotel_selected_room

	var/single_room_available = 0
	var/double_room_single_bed_available = 0
	var/double_room_two_beds_available = 0
	var/special_room_available = 0

	for(var/datum/hotel_room/R in GLOB.hotel_rooms)

		if (R == selected_room)
			if (R.room_status == ROOM_STATUS_BROKEN || R.room_status == ROOM_STATUS_BLOCKED)
				give_error()
			else
				hotel_selected_room = list(
					"number" = R.room_number,
					"status" = R.room_status,
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

		//101-103
		if (R.guest_count == 1 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE && !single_room_available)
			single_room_available = R.hourly_price

		//201-202
		if (R.guest_count == 2 && R.bed_count == 2 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE && !double_room_two_beds_available)
			double_room_two_beds_available = R.hourly_price

		//301-303
		if (R.guest_count == 2 && R.bed_count == 1 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE && !double_room_single_bed_available)
			double_room_single_bed_available = R.hourly_price

		//penthouse
		if(R.special_room == 1 && R.room_status == ROOM_STATUS_AVAILABLE)
			special_room_available = 1

	data["mode"] = program_mode
	data["auto"] = auto_mode
	data["single_room"] = single_room_available
	data["double_double_room"] = double_room_two_beds_available
	data["double_single_room"] = double_room_single_bed_available
	data["special_room"] = special_room_available
	data["selected_room"] = hotel_selected_room
	data["duration"] = reservation_duration

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "hotel_terminal.tmpl", "Hotel Reservations Terminal", 390, 500)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/hotel_terminal/OnTopic(var/mob/user, var/list/href_list, state)

	if (href_list["return_to_main"])
		if(program_mode > 1 && !payment_complete)
			if(alert("This will erase the reservation. Are you sure?",,"Yes","No")=="No")
				return TOPIC_REFRESH
			deltimer(timeout_timer_id)
			if(selected_room)
				selected_room.clear_reservation(terminal_clear = 1)
		program_mode = PROGRAM_MODE_ROOM_SELECTION
		selected_room = null
		flick_screen(screen_icon_state = "hotel_terminal_loading")
		payment_complete = FALSE
		return TOPIC_REFRESH

	if (href_list["return_to_room"])
		if(selected_room && auto_mode)
			program_mode = PROGRAM_MODE_RESERVATION
			flick_screen(screen_icon_state = "hotel_terminal_loading")
		return TOPIC_REFRESH

	if (href_list["room_reserve"])
		for(var/datum/hotel_room/R in GLOB.hotel_rooms)

			switch(text2num(href_list["room_reserve"]))
				if(1)
					if(R.guest_count == 1 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE)
						selected_room = R
						break
				if(2)
					if(R.guest_count == 2 && R.bed_count == 2 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE)
						selected_room = R
						break
				if(3)
					if(R.guest_count == 2 && R.bed_count == 1 && !R.special_room && R.room_status == ROOM_STATUS_AVAILABLE)
						selected_room = R
						break

		if(selected_room)
			reservation_duration = 1
			selected_room.room_status = ROOM_STATUS_RESERVATION_IN_PROGRESS
			selected_room.room_reservation_start_time = station_time_in_ticks
			selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
			selected_room.room_log.Add("\[[stationtime2text()]\] Room reservation process was initiated in a guest terminal. Room not available.")
			timeout_timer_id = addtimer(CALLBACK(src, TYPE_PROC_REF(/obj/machinery/hotel_terminal, give_error)), 5 MINUTES, TIMER_UNIQUE|TIMER_STOPPABLE)
			program_mode = PROGRAM_MODE_RESERVATION
			flick_screen(screen_icon_state = "hotel_terminal_loading")
		return TOPIC_REFRESH

	if(href_list["set_duration"])
		reservation_duration = text2num(href_list["set_duration"])
		if(program_mode == PROGRAM_MODE_RESERVATION && selected_room)
			selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
		return TOPIC_REFRESH

	if(href_list["room_cancel"])
		if(!selected_room)
			return TOPIC_REFRESH
		selected_room.clear_reservation(just_reset = 1)
		reservation_duration = 1
		selected_room.room_reservation_start_time = station_time_in_ticks
		selected_room.room_reservation_end_time = selected_room.room_reservation_start_time + reservation_duration HOURS
		return TOPIC_REFRESH

	if(href_list["remove_guest"])
		if(selected_room && program_mode == PROGRAM_MODE_RESERVATION)
			selected_room.remove_guest(href_list["remove_guest"])
		return TOPIC_REFRESH

	if(href_list["add_guest"])
		if(selected_room && program_mode == PROGRAM_MODE_RESERVATION)
			program_mode = PROGRAM_MODE_GUEST
			flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

	if(href_list["room_pay"])
		if(department_accounts["Service"].suspended)
			to_chat(user, "<span class='warning'>Payment gateway currently is unable to process the transaction. Please, contact hotel bank account administration.</span>")
			return TOPIC_REFRESH
		if(selected_room && program_mode == PROGRAM_MODE_RESERVATION)
			program_mode = PROGRAM_MODE_PAYMENT
			flick_screen("hotel_terminal_loading")
		return TOPIC_REFRESH

/obj/machinery/hotel_terminal/proc/give_error(var/terminal_reset = 0)
	if(!auto_mode) // If it's the console setting the rules, let it get the error pop up
		master_program.give_error()
		return

	if(selected_room)
		if(selected_room.room_status == ROOM_STATUS_OCCUPIED)
			program_mode = PROGRAM_MODE_ROOM_SELECTION
			selected_room = null
		else
			selected_room.clear_reservation(auto_clear = 1, terminal_clear = terminal_reset)
			selected_room = null
			program_mode = PROGRAM_MODE_ERROR
	if(timeout_timer_id)
		deltimer(timeout_timer_id)
		timeout_timer_id = null
	flick_screen(screen_icon_state = "hotel_terminal_loading")

/obj/machinery/hotel_terminal/proc/print_keycards(var/datum/hotel_room/room_for_cards)
	if(room_for_cards)
		for (var/guest in room_for_cards.room_guests)
			var/obj/item/card/id/hotel_key/key_created = new(src.loc)
			key_created.room_number = room_for_cards.room_number
			key_created.temp_access = list("ACCESS_LIBERTY_ROOM_[room_for_cards.room_number]")
			key_created.registered_name = guest
			key_created.expiration_time = room_for_cards.room_end_time2text()
			room_for_cards.room_keys += key_created

			key_created.pixel_x = 10


#undef PROGRAM_MODE_ERROR
#undef PROGRAM_MODE_ROOM_SELECTION
#undef PROGRAM_MODE_RESERVATION
#undef PROGRAM_MODE_GUEST
#undef PROGRAM_MODE_PAYMENT
