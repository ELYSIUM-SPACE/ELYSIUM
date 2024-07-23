/obj/item/card/id/hotel_key
	name = "hotel keycard"
	desc = "This Vertex Hotel keycard enables access to the given room. A magnetic strip on either side enables it to be worn on the wrist as a bracelet for convenience."
	icon = 'code_ark/icons/obj/hotel.dmi'
	icon_state = "vertex_keycard_animated"
	item_state = "vertex_keycard"

	slot_flags = SLOT_GLOVES | SLOT_ID
	item_icons = list(slot_gloves_str = 'code_ark/icons/mob/onmob/items/gloves.dmi')

	var/list/temp_access = list() //to prevent agent cards stealing access
	var/expiration_time = 0
	var/expired = FALSE
	var/room_number = ""

/obj/item/card/id/hotel_key/dat()
	var/list/dat = list("<table><tr><td>")
	dat += text("Name: []</A><BR>", "[registered_name]")
	dat += text("Room: []</A><BR>", "[room_number]")
	dat += text("Reservation End Time: []</A><BR>", "[expiration_time]")
	dat += "</tr></table>"
	return jointext(dat,null)

/obj/item/card/id/hotel_key/examine(mob/user)
	. = ..()
	to_chat(user, SPAN_NOTICE("The room is [room_number]."))
	if (expired)
		to_chat(user, SPAN_NOTICE("This keycard indicates that the room's reservation period has ended. Better to return it to hotel staff."))
		//Must be restored once hotel controllers get proper interface and functions
		//to_chat(user, SPAN_NOTICE("This keycard appears to have either expired or been invalidated."))

/obj/item/card/id/hotel_key/read()
	to_chat(usr, SPAN_NOTICE("This keycard was issued to [registered_name]."))
	to_chat(usr, SPAN_NOTICE("The room is [room_number]."))
	if (expired)
		to_chat(user, SPAN_NOTICE("This keycard indicates that the room's reservation period has ended. Better to return it to hotel staff."))
		//Must be restored once hotel controllers get proper interface and functions
		//to_chat(usr, SPAN_NOTICE("This keycard appears to have either expired or been invalidated."))

/obj/item/card/id/hotel_key/attack_self(mob/user as mob)
	user.visible_message("\The [user] shows you: [icon2html(src, viewers(get_turf(src)))] [src.name]. The room on the card: [src.room_number]",\
		"You flash your ID card: [icon2html(src, viewers(get_turf(src)))] [src.name]. The assignment on the card: [src.room_number]")

	src.add_fingerprint(user)
	return

/obj/item/card/id/hotel_key/GetAccess()
	return temp_access

/obj/item/card/id/hotel_key/proc/expire()
	//temp_access = initial(temp_access) temporarily disabled until room controller gets proper interface and fucntions
	icon_state = "vertex_keycard"
	expired = TRUE
