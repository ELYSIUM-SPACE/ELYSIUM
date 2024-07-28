#define ROOT_MENU		0
#define REQUESTS_MENU	1

GLOBAL_LIST_EMPTY(hotel_room_controllers)

/obj/machinery/hotel_room_controller
	name = "hotel room controller"
	desc = "It's a small wall screen with various functions to improve the guests' experience."
	icon = 'code_ark/icons/obj/machinery.dmi'
	icon_state = "room_controller"
	anchored = TRUE
	power_channel = EQUIP
	idle_power_usage = 50

	var/datum/hotel_room/hotel_room

	var/menu = ROOT_MENU	//current menu

// Basic object procs

/obj/machinery/hotel_room_controller/Initialize()
	. = ..()
	update_icon()
	GLOB.hotel_room_controllers += src

/obj/machinery/hotel_room_controller/Destroy()
	if(hotel_room)
		hotel_room.room_controller = null
		hotel_room.room_test_n_update()
	GLOB.hotel_room_controllers -= src
	. = ..()

/obj/machinery/hotel_room_controller/power_change()
	. = ..()
	update_icon()

/obj/machinery/hotel_room_controller/on_update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
		return
	var/image/I = image(icon, "room_controller_menu")
	I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	I.layer = ABOVE_LIGHTING_LAYER
	overlays += I
	set_light(0.2, 0.5, 1, 2, "#cba561")

/obj/machinery/hotel_room_controller/proc/flick_screen(var/screen_icon_state = "room_controller_screensaver")
	if(stat & (NOPOWER|BROKEN))
		return
	overlays.Cut()
	var/image/I = image(icon, screen_icon_state)
	I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	I.layer = ABOVE_LIGHTING_LAYER
	overlays += I
	spawn(10)
		update_icon()

// Interaction

/obj/machinery/hotel_room_controller/interface_interact(var/mob/user)
	flick_screen("room_controller_screensaver")
	ui_interact(user)
	return TRUE

/obj/machinery/hotel_room_controller/CanUseTopic(user, state)
	if(stat & (NOPOWER|BROKEN))
		to_chat(user, "<span class='warning'>\The [src] is not working!</span>")
		return STATUS_CLOSE
	return ..()

/obj/machinery/hotel_room_controller/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)

	var/ui_title = null
	var/list/data = new

	if(hotel_room)
		if(hotel_room.room_number == "Penthouse")
			ui_title = "Penthouse"
		else
			ui_title = "Room #[hotel_room.room_number]"

		data["menu"] = menu

		if(hotel_room.room_status == ROOM_STATUS_BROKEN)
			data["room_broken"] = TRUE
		else
			data["room_broken"] = FALSE
		data["room_status"] = hotel_room.room_status
		data["room_request"] = hotel_room.room_request
		data["room_reservation_start"] = hotel_room.room_reservation_start_time
		data["room_reservation_end"] = hotel_room.room_reservation_end_time
		if(!istype(hotel_room.room_airlock))
			data["airlock_bolts_status"] = FALSE
			hotel_room.room_test_n_update()
		else
			data["airlock_bolts_status"] = hotel_room.room_airlock.locked


	else
		ui_title = "#ERROR. ROOM NOT FOUND."
		data["room_status"] = "#ERROR"
		data["room_request"] = "#ERROR"
		data["room_reservation_start"] = "#ERROR"
		data["room_reservation_end"] = "#ERROR"
		data["airlock_bolts_status"] = FALSE

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "hotel_room_controller.tmpl", "[ui_title] Controller", 410, 500)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

//returns text meaning of a status define
/obj/machinery/hotel_room_controller/proc/get_text_status(var/status)
	if(!isnum(status))	//sanity check
		return "#ERROR. Received not a defined status."

	switch(status)
		if(ROOM_STATUS_BROKEN)
			return "#ERROR. ROOM DIAGNOSTICS REVEALED CRITICAL ERRORS."
		if(ROOM_STATUS_AVAILABLE)
			return "Available."
		if(ROOM_STATUS_RESERVATION_IN_PROGRESS)
			return "Reservation in progress."
		if(ROOM_STATUS_OCCUPIED)
			return "Occupied."
		if(ROOM_STATUS_BLOCKED)
			return "Blocked. Please contact hotel staff for further info."
		else
			return "#ERROR. Unknown status received."

//returns text meaning of a request define
/obj/machinery/hotel_room_controller/proc/get_text_request(var/request)
	if(!isnum(request))	//sanity check
		return "#ERROR. Received not a defined request."

	switch(request)
		if(ROOM_REQUEST_NONE)
			return "None"
		if(ROOM_REQUEST_NOT_DISTURB)
			return "Do not disturb"
		if(ROOM_REQUEST_CLEANUP)
			return "Cleanup"
		if(ROOM_REQUEST_TURNOVER)
			return "Turnover"
		else
			return "#ERROR. Unknown request received."

/obj/machinery/hotel_room_controller/OnTopic(var/mob/user, var/list/href_list, state)

	if (href_list["return"])
		menu = ROOT_MENU
		flick_screen("room_controller_menu")
		return TOPIC_REFRESH

	if (href_list["requests_menu"])
		menu = REQUESTS_MENU
		flick_screen("room_controller_menu")
		return TOPIC_REFRESH

	if (href_list["room_diagnostics"])
		hotel_room.room_test_n_update()
		to_chat(user, "<span class='notice'>\The [src] is performing a system check.</span>")
		return TOPIC_REFRESH

	if (href_list["request_change"])
		//value of requests in NanoUI template are increased by 1 to make href_list here work properly, so we subtract 1 here
		var/new_request = text2num(href_list["request_change"]) - 1

		if(alert("Do you want to [new_request ? "put in \the \"[get_text_request(new_request)]\" request" : "clear the request"]?",,"Yes","No") == "No")
			return TOPIC_REFRESH

		if(get_dist(user, src) > 1)
			to_chat(user, "<span class='warning'>You are too far!</span>")
			return

		hotel_room.room_change_request(new_request)
		menu = ROOT_MENU
		flick_screen("room_controller_menu")
		return TOPIC_REFRESH

	if (href_list["open_airlock"])
		if(!hotel_room.open_airlock())
			to_chat(user, "<span class='warning'>The airlock bolts are down!</span>")
		return TOPIC_REFRESH

	if (href_list["toggle_airlock_bolts"])
		hotel_room.toggle_airlock_bolts()
		return TOPIC_REFRESH


#undef ROOT_MENU
#undef REQUESTS_MENU
