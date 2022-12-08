/obj/item/card/id/hotel_key
	name = "hotel keycard"
	//desc = "This Vertex Hotel keycard enables access to room [room_number]. It belongs to [registered_name] and is due to expire at [expiration_time]."
	icon = 'code_ark/icons/obj/hotel.dmi'
	icon_state = "vertex_keycard_animated"

	var/list/temp_access = list() //to prevent agent cards stealing access
	var/expiration_time = 0
	var/expired = FALSE
	var/room_number

/obj/item/card/id/hotel_key/GetAccess()
	return temp_access

/obj/item/card/id/hotel_key/proc/expire()