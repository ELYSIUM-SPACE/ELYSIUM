/obj/item/card/id/hotel_key
	name = "hotel keycard"
	desc = "Allows temporary access to restricted areas."
	color = COLOR_PALE_GREEN_GRAY
	detail_color = COLOR_GREEN

	var/list/temp_access = list() //to prevent agent cards stealing access
	var/expiration_time = 0
	var/expired = FALSE

/obj/item/card/id/hotel_key/GetAccess()
	return temp_access

/obj/item/card/id/hotel_key/proc/expire()