/obj/item/storage/mirror
	randpixel = 0

/obj/item/storage/mirror/advanced
	name = "smart mirror"
	desc = "An iMirror(TM) smart reflecting device by SalonPro Nano-Mirror(TM) creators! The leading brand utilizes nano-machinery to style your hair just right. You can see the local time displayed on the screen along with some other information."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "mirror"
	var/on
	var/range = 1
	var/area/power_area
	var/power_state
//	var/last_code = "code green"

	startswith = list(
		/obj/item/haircomb/random,
		/obj/item/haircomb/brush,
		/obj/random/medical/lite,
		/obj/item/lipstick/random,
		/obj/random/soap,
		/obj/item/reagent_containers/spray/cleaner/deodorant,
		/obj/item/towel/random,
		/obj/item/tooth_gel,
		/obj/item/shampoo
		)

/obj/item/storage/mirror/advanced/on_update_icon()
	overlays.Cut()
	// Putting the base icon
	var/image/I
	if(!shattered && power_area)
		if(power_state)
			I = image(icon, on? "mirror_over" : "mirror_over_time")
			I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
			I.layer = ABOVE_LIGHTING_LAYER
			overlays |= I
			var/color = "#ffffff"
			/* var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
			if (security_state.current_security_level.name == "code blue")
				color = "#9db8ff"
				I = image(icon, "mirror_over_blue")
			if (security_state.current_security_level.name == "code red")
				color = "#ff7070"
				I = image(icon, "mirror_over_red")
			if (security_state.current_security_level.name == "code delta")
				color = "#ff7070"
				I = image(icon, "mirror_over_delta")
			I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
			I.layer = ABOVE_LIGHTING_LAYER
			overlays |= I */
			set_light(on? 1 : 0.1, 0.1, 1.5, 2, color)
		else
			set_light(0)
	else
		set_light(0)

/obj/item/storage/mirror/advanced/MouseDrop(obj/over_object as obj)
	overlays.Cut()
	..()
	update_icon()

/obj/item/storage/mirror/advanced/attackby(obj/item/W as obj, mob/user as mob)
	overlays.Cut()
	..()
	update_icon()

/obj/item/storage/mirror/advanced/shatter()
	..()
	update_icon()
	desc = "On ho, seven years of bad luck! The iMirror(TM) is totally shattered and no longer usable!"

/obj/item/storage/mirror/advanced/examine(mob/user, distance)
	if(..() && !shattered)
		to_chat(user, "The local vessel time is [stationtime2text()].")
		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
		to_chat(user, "The current alert level is [security_state.current_security_level.name].")

/obj/item/storage/mirror/advanced/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/storage/mirror/advanced/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/storage/mirror/advanced/HasProximity(atom/movable/AM as mob|obj)
	if(!istype(AM))
		log_debug("DEBUG: HasProximity called with [AM] on [src] ([usr]).")
		return
	if (istype(AM, /obj/effect/beam))	return
	if (AM.move_speed < 12)	sense()
	return

/obj/item/storage/mirror/advanced/Initialize()
	. = ..()
	power_area = get_area(src)
	update_icon()

/obj/item/storage/mirror/advanced/Process()
	..()
	sense()
	/*var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(last_code != security_state.current_security_level.name) // Ensuring updating the lights and overlays with respect to the current security code
		update_icon()
		last_code = security_state.current_security_level.name*/
	return

/obj/item/storage/mirror/advanced/proc/sense()
	if(shattered) return
	var/last_state = on
	var/last_power = power_state
	on = 0
	if(!power_area)
		return
	else
		power_state = power_area.power_equip
		if(power_state)
			var/turf/mainloc = get_turf(src)
			for(var/mob/living/A in range(range,mainloc))
				if (A.move_speed < 12 )
					on = 1
					break
	if((last_state != on) || (last_power != power_state))
		update_icon()
	return

// JUST A WIDE MIRROR
/obj/item/storage/mirror/wide
	name = "wide mirror"
	desc = "A rectangular SalonPro Nano-Mirror(TM) mirror! Now in a much more ergonomic shape! The leading brand utilizes nano-machinery to style your hair just right."
	icon = 'code_ark/icons/obj/furniture.dmi'
