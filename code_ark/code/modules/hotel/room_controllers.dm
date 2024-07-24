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
	to_chat(user, "<span class='warning'>\The [src] is temporarily unavailable. Software update pending. For requests please contact hotel staff directly.</span>")
	//ui_interact(user)
	return TRUE

/obj/machinery/hotel_room_controller/CanUseTopic(user, state)
	if(stat & (NOPOWER|BROKEN))
		to_chat(user, "<span class='warning'>\The [src] is not working!</span>")
		return STATUS_CLOSE
	return ..()

/obj/machinery/hotel_room_controller/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)

	/*
	var/list/data = new

	data["room_status"] = hotel_room.room_status
	data["room_requests"] = hotel_room.room_requests
	data["room_reservation_start"] = hotel_room.room_reservation_start_time
	data["room_reservation_end"] = hotel_room.room_reservation_end_time

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "hotel__room_controller.tmpl", "Room [hotel_room.room_number] Controller", 390, 500)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)
	*/
