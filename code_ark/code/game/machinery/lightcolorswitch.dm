/obj/machinery/light_color_switch
	name = "light color switch"
	desc = "Paint it, Black."
	icon = 'icons/obj/power.dmi'
	icon_state = "light-p"
	anchored = TRUE
	idle_power_usage = 20
	var/broken = FALSE
	var/area_light_color = "#fffee0"
	var/area/connected_area = null

/obj/machinery/light_color_switch/Initialize()
	. = ..()
	connected_area = get_area(src)
	if(name == initial(name))
		SetName("light color switch ([connected_area.name])")

	for(var/obj/machinery/light/L in connected_area)
		if(!L.lightbulb)
			continue

		area_light_color = L.lightbulb.b_colour
		break

	update_icon()

/obj/machinery/light_color_switch/on_update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
	else
		var/image/I = image('code_ark/icons/obj/power.dmi', "light-overlay-blank")
		I.color = area_light_color
		overlays += I
		set_light(0.1, 0.1, 1, 2, area_light_color)

/obj/machinery/light_color_switch/examine(mob/user, distance)
	. = ..()
	if(distance && area_light_color != initial(area_light_color))
		to_chat(user, SPAN_NOTICE("It has <font color='[area_light_color]'><b>this color set</b></font>."))

/obj/machinery/light_color_switch/interface_interact(mob/user)
	if(stat & (NOPOWER|BROKEN))
		return FALSE
	if(CanInteract(user, DefaultTopicState()))
		if(broken)
			to_chat(user, SPAN_WARNING("\The [src] is broken, crap!"))
			return
		switch_color(user, input("Input a color for this room.",, area_light_color) as null|color)
		return TRUE

/obj/machinery/light_color_switch/proc/switch_color(mob/user, color)
	if(!color)
		return
	if(color == area_light_color)
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(!user.Adjacent(src))
		return
	if(broken)
		to_chat(user, SPAN_WARNING("\The [src] is broken, crap!"))
		return

	for(var/obj/machinery/light/L in connected_area)
		if(!L.lightbulb)
			continue
		if(L.lightbulb.status != LIGHT_OK)
			continue
		if(!L.lightbulb.can_change_color)
			continue

		L.lightbulb.b_colour = color
		L.update_icon()

	area_light_color = color
	update_icon()
	playsound(src, "switch", 30)
	to_chat(user, SPAN_NOTICE("You have changed the area light color to a <font color='[color]'><b>new one</b></font>."))

/obj/machinery/light_color_switch/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		return

	do_epilepsy_show(severity)

/obj/machinery/light_color_switch/emag_act(remaining_charges, mob/user)
	if(stat & (BROKEN|NOPOWER))
		return FALSE

	to_chat(user, SPAN_NOTICE("You have activated the epilepsy mode. We hope you are satisfied with yourself."))
	do_epilepsy_show(rand(1,3))
	return TRUE

/obj/machinery/light_color_switch/proc/do_epilepsy_show(severity)
	var/number_of_switchings = min(5 * severity, 15)
	var/delay = max(5, 45 - 15 * severity)
	broken = TRUE

	while(number_of_switchings)
		if(stat & (BROKEN|NOPOWER))
			break

		for(var/obj/machinery/light/L in connected_area)
			if(!L.lightbulb)
				continue
			if(L.lightbulb.status != LIGHT_OK)
				continue
			if(!L.lightbulb.can_change_color)
				continue

			L.lightbulb.b_colour = RANDOM_RGB
			L.update_icon()

		number_of_switchings--

		sleep(delay)

	broken = FALSE
