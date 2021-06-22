/obj/item/light
	var/can_change_color = FALSE

/obj/item/light/attack_self(mob/user)
	if(!can_change_color)
		return ..()

	var/new_color = input("Input a color.",, b_colour) as null|color
	if(new_color == b_colour)
		return
	if(loc != user)
		return

	b_colour = new_color
	update_icon()
	to_chat(user, SPAN_NOTICE("You have changed \the [src] color to a <font color='[new_color]'><b>new one</b></font>."))

/obj/item/light/bulb/colorable
	name = "colorable light bulb"
	matter = list(MATERIAL_GLASS = 120)
	can_change_color = TRUE

/obj/item/light/tube/colorable
	name = "colorable light tube"
	matter = list(MATERIAL_GLASS = 140, MATERIAL_ALUMINIUM = 30)
	can_change_color = TRUE

/obj/item/light/tube/large/colorable
	name = "colorable large light tube"
	matter = list(MATERIAL_GLASS = 160, MATERIAL_ALUMINIUM = 50)
	can_change_color = TRUE

/obj/machinery/light/small/colorable
	light_type = /obj/item/light/bulb/colorable

/obj/machinery/light/colorable
	light_type = /obj/item/light/tube/colorable

/obj/machinery/light/spot/colorable
	light_type = /obj/item/light/tube/large/colorable
