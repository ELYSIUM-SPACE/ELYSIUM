/obj/item/frame/light_switch/color_switch
	name = "light color switch frame"
	desc = "Used for building a light switch."
	icon = 'icons/obj/power.dmi'
	icon_state = "light-p"
	obj_flags = OBJ_FLAG_CONDUCTIBLE

/obj/item/frame/light_switch/color_switch/attackby(obj/item/tool, mob/user)
	if(isWrench(tool))
		new /obj/item/stack/material/steel( get_turf(src.loc), 1 )
		qdel(src)
	else if(istype(tool, /obj/item/screwdriver) && isturf(user.loc))
		var/obj/machinery/light_color_switch/S = new(user.loc)
		if(position_with_direction(S, user))
			to_chat(user, "You fasten \the [S] with your [tool].")
			qdel(src)
		else
			qdel(S)
	else ..()
