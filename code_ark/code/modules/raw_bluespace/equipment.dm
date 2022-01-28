//BS protection belt

/obj/item/storage/belt/bluespace
	name        = "bluespace shield belt"
	desc        = "An advnaced device - bluespace protection system. Also can hold small items. <b>Maybe, it is not wise to take it off..</b>"
	icon_state  = "soulstonebelt"
	item_state  = "soulstonebelt"
	origin_tech = list(TECH_BLUESPACE = 2, TECH_ENGINEERING = 2)

//BS recaller

/obj/item/recaller
	name        = "bluespace recall device"
	desc        = "Used in means of safe return from bluespace. Can bring exactly one person back, reusable."
	icon        = 'icons/obj/terminals.dmi'
	icon_state  = "fax0"
	origin_tech = list(TECH_BLUESPACE = 2, TECH_ENGINEERING = 2)
	var/lastz //the z level to place mob after "recall" process

/obj/item/recaller/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	lastz = T.z

/obj/item/recaller/attack_self(var/mob/user)
	if(!user.skill_check(SKILL_SCIENCE, SKILL_EXPERT))
		to_chat(user,SPAN_DANGER("You don't know how to operate \the [src]!"))
		return
	if(!in_bluespace(user))
		to_chat(user,SPAN_WARNING("You update \the [src] recall interdimension."))
		var/turf/T = get_turf(user)
		lastz = T.z
		return
	if(!do_after(user, 20, src)) return
	var/turf/T    = get_turf(user)
	var/turf/exit = locate(T.x,T.y,lastz)
	if(exit) do_teleport(user,exit,0,/decl/teleport)

//BS analyzer

/obj/item/bluespace_monitor
	name        = "bluespace analyzer"
	desc        = "Monitors background levels of bluespace, thus allowing to detect any unusual tubrulence or interference."
	icon        = 'icons/obj/terminals.dmi'
	icon_state  = "production_console_old"
	origin_tech = list(TECH_BLUESPACE = 3)

/obj/item/bluespace_monitor/examine(var/mob/user)
	. = ..()
	if(user.skill_check(SKILL_SCIENCE, SKILL_EXPERT))
		var/turf/T    = get_turf(user)
		var/turf/bs   = locate(T.x,T.y,global.bluespace_level)
		var/atomcount = 0
		for(var/atom/movable/L in range(bs,10))
			atomcount += 1
		to_chat(user,SPAN_NOTICE("Its screen says <br> A/A BLUESPACE TURBULENCE AMOUNT: [atomcount ? "[atomcount] BLS" : "NOT PRESENT"]"))
	else
		to_chat(user,SPAN_WARNING("You can see a lot of numbers and graphs, unable understand what this mean.."))

//BS rifter (highly advanced and dangerous thing)
//this is, allows just, you know, jump to bluespace in/out whenever you wish

/obj/effect/rifter
	mouse_opacity = 0
	icon          = 'icons/effects/static.dmi'

/obj/effect/rifter/Initialize()
	. = ..()
	icon_state = "[rand(1,9)] heavy"
	animate(src,alpha = 0,time = 5)
	spawn(5) qdel(src)

/obj/item/bluespace_rifter
	name        = "bluespace rifter module"
	desc        = "Huge thing designed to be weared on one's back. There is a huge label on it: <b>SECURE EQUIPMENT.</b>"
	icon        = 'icons/obj/objects.dmi'
	icon_state  = "oldshieldoff"
	w_class     = ITEM_SIZE_HUGE
	slot_flags  = SLOT_BACK
	origin_tech = list(TECH_BLUESPACE = 6)
	var/lastz   = 0

/obj/item/bluespace_rifter/proc/transfer(var/mob/user)
	var/turf/exit
	var/turf/T = get_turf(user)
	if(!in_bluespace(user))
		new/obj/effect/rifter(T)
		exit  = locate(T.x,T.y,global.bluespace_level)
		lastz = T.z
	else
		exit = locate(T.x,T.y,lastz)
		new/obj/effect/rifter(exit)
	do_teleport(user,exit,0,/decl/teleport)
	flick("oldshieldon",src)

/obj/item/bluespace_rifter/attackby(var/obj/item/I,var/mob/user)
	. = ..()
	if(istype(I,/obj/item/rifter_control))
		var/obj/item/rifter_control/rifter_control = I
		rifter_control.module = (rifter_control.module == src ? null : src)
		to_chat(user,SPAN_NOTICE(rifter_control.module == src ? "You link [I] to \the [src]." : "You unlink [I] from \the [src]."))

/obj/item/rifter_control
	name        = "bluespace rifter controller"
	desc        = "Device utilized in bluespace rifter module control."
	icon        = 'icons/obj/device.dmi'
	icon_state  = "shield1"
	origin_tech = list(TECH_BLUESPACE = 6)
	var/obj/item/bluespace_rifter/module

/obj/item/rifter_control/attack_self(var/mob/user)
	if(!user.skill_check(SKILL_SCIENCE, SKILL_PROF))
		to_chat(user,SPAN_DANGER("You don't know how to operate \the [src]!"))
		return
	if(!module || user.back != module)
		to_chat(user,SPAN_WARNING("NO MODULE DETECTED"))
		return
	module.transfer(user)

//BS catcher

//Antag thing, interception/interference device
//creates a interference field in BS that blocks teleportation in range of 10 meters (see raw_bluespace.dm and do_teleport override)
//pretty lethal, though, most likely that human will die if no protection present

/obj/effect/bs_catcher
	name       = "bluespace interference"
	desc       = "Swirling cloud of unknown matter."
	icon       = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "emfield_s1"
	anchored   = TRUE

/obj/effect/bs_catcher/Initialize()
	. = ..()
	transform = matrix() * 2

/obj/item/catcher
	name        = "bluespace interference generator"
	desc        = "Allows interception of bluespace-channeled teleportation via interference field generation. Can project ten by ten meters interference field for exactly two minutes."
	icon        = 'icons/obj/weapons.dmi'
	icon_state  = "eshield0"
	origin_tech = list(TECH_BLUESPACE = 8)
	var/obj/effect/bs_catcher/field
	var/lastfield

/obj/item/catcher/Destroy()
	qdel(field)
	. = ..()

/obj/item/catcher/examine(var/mob/user)
	. = ..()
	to_chat(user,SPAN_NOTICE(field ? "It is on. Field will disperse in [((lastfield + 120 SECONDS) - world.time)/10] seconds." : "It is off."))

/obj/item/catcher/attack_self(var/mob/user)

	if(field)
		to_chat(user,SPAN_DANGER("You turn off \the [src]"))
		qdel(field)
		field = null
		return

	if(!do_after(user, 20, src)) return
	var/turf/T = get_turf(user)
	field = new(locate(T.x,T.y,global.bluespace_level)) //you can create interference while not in bluespace
	lastfield = world.time
	spawn(120 SECONDS)
		qdel(field)
		field = null

/datum/uplink_item/item/tools/bs_catcher
	name = "Bluespace Interception Device"
	desc = "Device capable of generating interference fields for bluespace-channeled teleportation interception. <b>Will work only in bluespace.</b>"
	item_cost = 20
	path = /obj/item/catcher
