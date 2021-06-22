/obj/machinery/light_master_switch
	name = "master light switch"
	desc = "It turns lights on and off. It can be connected to several light switches in various areas to control the lights in a centralized manner."
	icon = 'code_ark/icons/obj/power.dmi'
	icon_state = "light"
	anchored = 1
	idle_power_usage = 20
	power_channel = EQUIP
	var/on = 1
	var/list/switches
	var/image/overlay
	var/brightness = 1

/obj/machinery/light_switch/slave
	name = "remote light switch"
	desc = "It turns lights on and off. However, there's no way you can toggle this switch since it's remotely connected to a master."
	icon = 'code_ark/icons/obj/power.dmi'
	icon_state = "light-remote"
	var/obj/machinery/light_master_switch/master

/obj/machinery/light_switch/slave/Initialize()
	. = ..()
	SetName("remote light switch ([connected_area.name])")

/obj/machinery/light_switch/slave/interface_interact(mob/user)
	if (istype(user, /mob/observer/ghost))
		return
	if(CanInteract(user, DefaultTopicState()))
		to_chat(user, SPAN_WARNING("There's no way you can flip a remote light switch. Try to find the linked master switch."))

/obj/machinery/light_master_switch/Initialize()
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/light_master_switch/LateInitialize()
	. = ..()
	switches = list()
	for (var/obj/machinery/light_switch/slave/S in world)
		if(S.id_tag == id_tag)
			switches += S
			S.master = src
			S.on = on
			S.connected_area.set_lightswitch(on)
			S.update_icon()
	update_icon()

/obj/machinery/light_master_switch/interface_interact(mob/user)
	if(CanInteract(user, DefaultTopicState()))
		if(stat & (BROKEN|NOPOWER))
			to_chat(user, SPAN_WARNING("The master light switch is inoperative!"))
			return
		if(alert("Would you like to flip the master switch or to change the brightness?",,"Master","Brightness") == "Master")
			if(!user.Adjacent(src))
				return
			on = !on
			playsound(src, "switch", 30)
			for (var/obj/machinery/light_switch/slave/S in switches)
				S.set_state(on)
			to_chat(user, SPAN_NOTICE("You flip the master switch."))
		else
			brightness = input("Input the brightness in % (20-100)...") as null|num
			if(brightness)
				brightness = Clamp(brightness, 20, 100)/100
			else
				brightness = 1
			if(!user.Adjacent(src))
				return
			for (var/obj/machinery/light_switch/slave/S in switches)
				for (var/obj/machinery/light/L in S.connected_area)
					if(!L.lightbulb)
						continue
					if(L.lightbulb.status != LIGHT_OK)
						continue
					if(L.lightbulb.can_change_color)
						continue
					L.lightbulb.b_max_bright = initial(L.lightbulb.b_max_bright)*brightness
					L.update_icon()
			to_chat(user, SPAN_NOTICE("The brightness is now set to [brightness*100]%."))
		update_icon()

/obj/machinery/light_master_switch/examine(mob/user, distance)
	. = ..()
	if(distance)
		to_chat(user, "It is [on? "on" : "off"]. The brightness is set to [brightness*100]%.")

/obj/machinery/light_master_switch/on_update_icon()
	if(!overlay)
		overlay = image(icon, "[icon_state]1-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
	else
		overlay.icon_state = "[icon_state][on]-overlay"
		overlays += overlay
		set_light(0.1, 0.1, 1, 2, on ? "#82ff4c" : "#f86060")

/obj/machinery/light_switch/slave/on_update_icon()
	if(!overlay)
		overlay = image(icon, "light1-overlay")
		overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		overlay.layer = ABOVE_LIGHTING_LAYER
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
	else
		overlay.icon_state = "light[on]-overlay"
		overlays += overlay
		set_light(0.1, 0.1, 1, 2, on ? "#82ff4c" : "#f86060")

/obj/machinery/light/remove_bulb() // Making sure that brightness adjustments will have only a temporary effect for a lightbulb.
	. = lightbulb
	lightbulb.b_max_bright = initial(lightbulb.b_max_bright)
	lightbulb.dropInto(loc)
	lightbulb.update_icon()
	lightbulb = null
	update_icon()

// An addition for the stage
/obj/machinery/light_master_switch/large
	name = "light control panel"
	icon_state = "large-light"
