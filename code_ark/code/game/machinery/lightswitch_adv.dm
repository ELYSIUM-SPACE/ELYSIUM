/obj/machinery/light_switch/advanced
	desc = "It turns lights on and off. There's also a slider for brightness adjustments."
	var/brightness = 1

/obj/machinery/light_switch/advanced/examine(mob/user, distance)
	. = ..()
	if(distance)
		to_chat(user, "It is [on? "on" : "off"]. The brightness is set to [brightness*100]%.")

/obj/machinery/light_switch/advanced/interface_interact(mob/user)
	if(CanInteract(user, DefaultTopicState()))
		if(stat & (BROKEN|NOPOWER))
			to_chat(user, SPAN_WARNING("The light switch is inoperative!"))
			return
		if(alert("Would you like to toggle the switch or to change the brightness?",,"Toggle","Brightness") == "Toggle")
			if(!user.Adjacent(src))
				return
			playsound(src, "switch", 30)
			set_state(!on)
			to_chat(user, SPAN_NOTICE("You flip the light switch."))
		else
			brightness = input("Input the brightness in % (20-100)...") as null|num
			if(brightness)
				brightness = Clamp(brightness, 20, 100)/100
			else
				brightness = 1
			if(!user.Adjacent(src))
				return
			for (var/obj/machinery/light/L in connected_area)
				if(!L.lightbulb)
					continue
				if(L.lightbulb.status != LIGHT_OK)
					continue
				if(L.lightbulb.can_change_color)
					continue
				L.lightbulb.b_max_bright = initial(L.lightbulb.b_max_bright)*brightness // Brightness reset on light bulb removal is set n lightmasterswitch.dm
				L.update_icon()
			to_chat(user, SPAN_NOTICE("The brightness is now set to [brightness*100]%."))
		update_icon()