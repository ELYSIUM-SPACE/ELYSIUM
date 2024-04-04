GLOBAL_LIST_EMPTY(hotel_room_signs)

/obj/machinery/hotel_room_sign
	name = "room sign"
	desc = "This sign indicates the room number. Yellow color indicates that room cleaning is required, while red stands for 'do not disturb'."
	icon = 'code_ark/icons/obj/machinery.dmi'
	icon_state = "101"

	density = 0
	power_channel = EQUIP
	idle_power_usage = 10

	var/datum/hotel_room/hotel_room

/obj/machinery/hotel_room_sign/Initialize()
	. = ..()
	GLOB.hotel_room_signs += src
	update_icon()

/obj/machinery/hotel_room_sign/Destroy()
	if(hotel_room)
		hotel_room.room_sign = null
		hotel_room.room_test_n_update()
	GLOB.hotel_room_signs -= src
	. = ..()

/obj/machinery/hotel_room_sign/on_update_icon()
	overlays.Cut()
	var/image/I = image(icon, icon_state)
	if((stat & NOPOWER) || !hotel_room || hotel_room.room_status == 0)
		I.color = "#999999"
		set_light(0)
		overlays += I
		return
	else
		I.color = (hotel_room.room_requests > 1) ? "#f5ea84" : hotel_room.room_requests == 1 ? "#f58484" : "#ffffff"
	set_light(0.3, 0.1, 1, 2, I.color)
	I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	I.layer = ABOVE_LIGHTING_LAYER
	overlays += I

/obj/machinery/hotel_room_sign/power_change()
	. = ..()
	update_icon()

/obj/machinery/hotel_room_sign/one_zero_one
	icon_state = "101"
	id_tag = "room_101_sign"

/obj/machinery/hotel_room_sign/one_zero_two
	icon_state = "102"
	id_tag = "room_102_sign"

/obj/machinery/hotel_room_sign/one_zero_three
	icon_state = "103"
	id_tag = "room_103_sign"

/obj/machinery/hotel_room_sign/one_zero_four
	icon_state = "104"
	id_tag = "room_104_sign"

/obj/machinery/hotel_room_sign/two_zero_one
	icon_state = "201"
	id_tag = "room_201_sign"

/obj/machinery/hotel_room_sign/two_zero_two
	icon_state = "202"
	id_tag = "room_202_sign"

/obj/machinery/hotel_room_sign/three_zero_one
	icon_state = "301"
	id_tag = "room_301_sign"

/obj/machinery/hotel_room_sign/three_zero_two
	icon_state = "302"
	id_tag = "room_302_sign"

/obj/machinery/hotel_room_sign/three_zero_three
	icon_state = "303"
	id_tag = "room_303_sign"

/obj/machinery/hotel_room_sign/penthouse
	icon_state = "penthouse"
	id_tag = "room_Penthouse_sign"
