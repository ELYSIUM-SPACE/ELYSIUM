//Overrides for legacy teleportation

/*	Multiple problems with current bay teleporter code, commented out during rebase.

/obj/machinery/computer/teleporter
	var/bs_override = FALSE

/obj/machinery/computer/teleporter/attackby(var/obj/item/I,var/mob/user)
	if(isMultitool(I) && user.skill_check(SKILL_SCIENCE, SKILL_EXPERT))
		bs_override = !bs_override
		to_chat(user,SPAN_NOTICE("You toggle the override setting of \the [src]. [bs_override ? "It is now locked to raw bluespace." : "It is now in normal mode."]"))

/obj/machinery/computer/teleporter/examine(mob/user)
	. = ..()
	if(bs_override) to_chat(user, SPAN_DANGER("Override setting is on. It is locked onto raw bluespace."))

/obj/machinery/teleport/hub/teleport(atom/movable/M as mob|obj)
	if(com.bs_override)
		var/turf/exit = locate(x,y,global.bluespace_level)
		do_teleport(M, exit,0,/decl/teleport)
		return
	..()

/obj/machinery/teleport/station/engage()
	if(!(stat & (BROKEN|NOPOWER)) && com?.bs_override)
		if(hub)
			hub.icon_state = "tele1"
			use_power_oneoff(5000)
			update_use_power(POWER_USE_ACTIVE)
			hub.update_use_power(POWER_USE_ACTIVE)
			audible_message("<span class='notice'>Teleporter engaged!</span>")
		src.engaged = 1
		return
	..()
*/
