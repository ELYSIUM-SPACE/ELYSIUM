// SOFA

/obj/structure/bed/sofa
	name = "leather sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of steel and covered with synthetic leather."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "sofa_right"
	buckle_dir = 0
	buckle_lying = 0

/obj/structure/bed/sofa/left
	icon_state = "sofa_left"

/obj/structure/bed/sofa/New(var/newloc)
	base_icon = icon_state
	..(newloc,MATERIAL_LEATHER_GENERIC)

/obj/structure/bed/sofa/post_buckle_mob()
	update_icon()
	return ..()

/obj/structure/bed/sofa/on_update_icon()
	overlays.Cut()
	var/image/I = image('code_ark/icons/obj/furniture.dmi', "[base_icon]_over")
	I.plane = DEFAULT_PLANE
	I.layer = ABOVE_HUMAN_LAYER
	overlays |= I
	if(buckled_mob)
		var/image/D = image('code_ark/icons/obj/furniture.dmi', "[base_icon]_armrest")
		D.plane = DEFAULT_PLANE
		D.layer = ABOVE_HUMAN_LAYER
		overlays |= D

/obj/structure/bed/sofa/black
	icon_state = "couchblack_middle"

/obj/structure/bed/sofa/black/left
	icon_state = "couchblack_left"

/obj/structure/bed/sofa/black/right
	icon_state = "couchblack_right"

/obj/structure/bed/sofa/beige
	icon_state = "couchbeige_middle"

/obj/structure/bed/sofa/beige/left
	icon_state = "couchbeige_left"

/obj/structure/bed/sofa/beige/right
	icon_state = "couchbeige_right"

/obj/structure/bed/sofa/brown
	icon_state = "couchbrown_middle"

/obj/structure/bed/sofa/brown/left
	icon_state = "couchbrown_left"

/obj/structure/bed/sofa/brown/right
	icon_state = "couchbrown_right"

/obj/structure/bed/sofa/teal
	icon_state = "couchteal_middle"

/obj/structure/bed/sofa/teal/left
	icon_state = "couchteal_left"

/obj/structure/bed/sofa/teal/right
	icon_state = "couchteal_right"

// FANCY SOFA

/obj/structure/bed/chair/sofa
	name = "fancy sofa"
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "sofamiddle"
	anchored = 1
	buckle_lying = 0
	buckle_dir = SOUTH
	plane = UNDER_MOB_PLANE
	applies_material_colour = 1
	var/sofa_material = "carpet"

/obj/structure/bed/chair/sofa/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/New()
	..()
	if(dir == 1)
		buckle_dir = NORTH
		plane = -15
	if(dir == 2)
		buckle_dir = SOUTH
	if(dir == 4)
		buckle_dir = EAST
	if(dir == 8)
		buckle_dir = WEST

	update_icon()

/obj/structure/bed/chair/sofa/update_icon()
	if(applies_material_colour && sofa_material)
		material = get_material_by_name(sofa_material)
		color = material.icon_colour

		if(sofa_material == "carpet")
			name = "red [initial(name)]"
		else
			name = "[sofa_material] [initial(name)]"

//color variations

/obj/structure/bed/chair/sofa
	sofa_material = "carpet"

/obj/structure/bed/chair/sofa/brown
	sofa_material = "leather"

/obj/structure/bed/chair/sofa/teal
	sofa_material = "teal"

/obj/structure/bed/chair/sofa/black
	sofa_material = "black"

/obj/structure/bed/chair/sofa/green
	sofa_material = "green"

/obj/structure/bed/chair/sofa/purp
	sofa_material = "purple"

/obj/structure/bed/chair/sofa/blue
	sofa_material = "blue"

/obj/structure/bed/chair/sofa/beige
	sofa_material = "beige"

/obj/structure/bed/chair/sofa/lime
	sofa_material = "lime"

/obj/structure/bed/chair/sofa/yellow
	sofa_material = "yellow"

//sofa directions

/obj/structure/bed/chair/sofa/corner/New()
	..()
	buckle_dir = SOUTH
	plane = UNDER_MOB_PLANE

/obj/structure/bed/chair/sofa/left
	icon_state = "sofaend_left"


/obj/structure/bed/chair/sofa/right
	icon_state = "sofaend_right"


/obj/structure/bed/chair/sofa/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/brown/left
	icon_state = "sofaend_left"


/obj/structure/bed/chair/sofa/brown/right
	icon_state = "sofaend_right"


/obj/structure/bed/chair/sofa/brown/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/teal/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/teal/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/teal/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/black/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/black/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/black/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/green/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/green/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/green/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/purp/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/purp/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/purp/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/blue/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/blue/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/blue/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/beige/left
	icon_state = "sofaend_left"


/obj/structure/bed/chair/sofa/beige/right
	icon_state = "sofaend_right"


/obj/structure/bed/chair/sofa/beige/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/lime/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/lime/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/lime/corner
	icon_state = "sofacorner"

/obj/structure/bed/chair/sofa/yellow/left
	icon_state = "sofaend_left"

/obj/structure/bed/chair/sofa/yellow/right
	icon_state = "sofaend_right"

/obj/structure/bed/chair/sofa/yellow/corner
	icon_state = "sofacorner"


// PEW SPRITE

/obj/structure/bed/chair/pew
	icon = 'code_ark/icons/obj/furniture.dmi'

/obj/structure/bed/chair/pew/middle
	icon_state = "pew_middle"
	base_icon = "pew_middle"

/obj/structure/bed/chair/pew/middle/mahogany
	color = WOOD_COLOR_RICH
	pew_material = MATERIAL_MAHOGANY

// BENCHES

/obj/structure/bed/chair/bench
	name = "bench"
	desc = "You sit in this, either by will or force. In either case, it's a nice thing to spend some time waiting on."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "bench_right_preview"
	base_icon = "bench_right"
	obj_flags = 0
	buckle_movable = FALSE

/obj/structure/bed/chair/bench/right

/obj/structure/bed/chair/bench/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/red/right

/obj/structure/bed/chair/bench/red/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/red/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/red/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, MATERIAL_CARPET)

/obj/structure/bed/chair/bench/brown/right

/obj/structure/bed/chair/bench/brown/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/brown/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/brown/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, MATERIAL_LEATHER_GENERIC)

/obj/structure/bed/chair/bench/red/right

/obj/structure/bed/chair/bench/teal/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/teal/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/teal/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "teal")

/obj/structure/bed/chair/bench/black/right

/obj/structure/bed/chair/bench/black/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/black/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/black/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "black")

/obj/structure/bed/chair/bench/green/right

/obj/structure/bed/chair/bench/green/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/green/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/green/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "green")

/obj/structure/bed/chair/bench/purple/right

/obj/structure/bed/chair/bench/purple/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/purple/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/purple/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "purple")

/obj/structure/bed/chair/bench/blue/right

/obj/structure/bed/chair/bench/blue/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/blue/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/blue/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "blue")

/obj/structure/bed/chair/bench/beige/right

/obj/structure/bed/chair/bench/beige/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/beige/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/beige/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "beige")

/obj/structure/bed/chair/bench/lime/right

/obj/structure/bed/chair/bench/lime/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/lime/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/lime/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "lime")

/obj/structure/bed/chair/bench/yellow/right

/obj/structure/bed/chair/bench/yellow/center
	icon_state = "bench_center_preview"
	base_icon = "bench_center"

/obj/structure/bed/chair/bench/yellow/left
	icon_state = "bench_left_preview"
	base_icon = "bench_left"

/obj/structure/bed/chair/bench/yellow/New(newloc, newmaterial = DEFAULT_FURNITURE_MATERIAL)
	..(newloc, newmaterial, "yellow")

/obj/structure/bed/chair/bench/wood
	name = "wooden bench"
	desc = "It's wooden bench, apparently, used for seating, although it's a bit too hard."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "bench_wood_right_preview"
	base_icon = "bench_wood_right"
	color = WOOD_COLOR_GENERIC
	var/bench_material = MATERIAL_WOOD

/obj/structure/bed/chair/bench/wood/New(var/newloc)
	..(newloc, bench_material)

/obj/structure/bed/chair/bench/wood/right

/obj/structure/bed/chair/bench/wood/center
	icon_state = "bench_wood_center_preview"
	base_icon = "bench_wood_center"

/obj/structure/bed/chair/bench/wood/left
	icon_state = "bench_wood_left_preview"
	base_icon = "bench_wood_left"

/obj/structure/bed/chair/bench/wood/walnut
	color = WOOD_COLOR_CHOCOLATE
	bench_material = MATERIAL_WALNUT

/obj/structure/bed/chair/bench/wood/walnut/right

/obj/structure/bed/chair/bench/wood/walnut/center
	icon_state = "bench_wood_center_preview"
	base_icon = "bench_wood_center"

/obj/structure/bed/chair/bench/wood/walnut/left
	icon_state = "bench_wood_left_preview"
	base_icon = "bench_wood_left"

// BATHTUB

/obj/structure/bed/chair/bathtub
	name = "bathtub"
	desc = "This walnut-ornamented bathtub belongs to the upper price segment and offers an unprecedented level of comfort. It's probably the best place to spend some time in after a long day. Its sophisticated electronics can automatically adjust the water temperature to be ideal, however, you can find a manual override valve under the wooden panel."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "bathtub"
	base_icon = "bathtub"
	buckling_sound = null
	buckle_dir = 8
	buckle_pixel_shift = "x=8;y=0;z=0"

	var/on = 0
	var/watertemp = "normal"	//freezing, normal, or boiling
	var/is_washing = 0
	var/list/temperature_settings = list("normal" = 310, "boiling" = T0C+100, "freezing" = T0C)

/obj/structure/bed/chair/bathtub/verb/toggle()
	set name = "Toggle Bathtub"
	set category = "Object"
	set src in view(1)
	if(!CanPhysicallyInteract(usr))
		return 0
	on = !on
	update_icon()
	if(on)
		playsound(src, 'code_ark/sound/effects/bath_filling.ogg', 20)
		to_chat(usr, "<span class='notice'>You've filled the [name] with water!</span>")
		START_PROCESSING(SSobj, src)
		if (usr.loc == loc)
			wash(usr)
			process_heat(usr)
		for (var/atom/movable/G in src.loc)
			G.clean_blood()
	else
		to_chat(usr, "<span class='notice'>You've drained the [name]!</span>")
		STOP_PROCESSING(SSobj, src)
		playsound(src, 'code_ark/sound/effects/drain.ogg', 20)

/obj/structure/bed/chair/bathtub/AltClick(var/mob/M)
	toggle(M)

/obj/structure/bed/chair/bathtub/CtrlClick(var/mob/M)
	toggle(M)

/obj/structure/bed/chair/bathtub/attackby(obj/item/I as obj, var/mob/user)
	if(istype(I, /obj/item/device/scanner/gas))
		to_chat(user, "<span class='notice'>The water temperature seems to be [watertemp].</span>")
		return

	if(isWrench(I))
		var/newtemp = input(user, "What setting would you like to set the temperature valve to?", "Water Temperature Valve") in temperature_settings
		to_chat(user,"<span class='notice'>You begin to adjust the temperature valve with \the [I].</span>")
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 50, src))
			watertemp = newtemp
			user.visible_message("<span class='notice'>\The [user] adjusts \the [src] with \the [I].</span>", "<span class='notice'>You adjust the [name] with \the [I].</span>")
			add_fingerprint(user)
			return

/obj/structure/bed/chair/bathtub/proc/wash(var/atom/movable/washing)
	if(on)
		wash_mob(washing)
		if(isturf(loc))
			var/turf/tile = loc
			for(var/obj/effect/E in tile)
				if(istype(E,/obj/effect/decal/cleanable) || istype(E,/obj/effect/overlay))
					qdel(E)

/obj/structure/bed/chair/bathtub/Process()
	..()
	for(var/thing in loc)
		var/atom/movable/AM = thing
		var/mob/living/L
		if(buckled_mob)
			L = thing
		if(istype(AM) && AM.simulated)
			wash(AM)
			if(istype(L))
				process_heat(L)

/obj/structure/bed/chair/bathtub/proc/process_heat(mob/living/M)
	if(!on || !istype(M)) return

	var/water_temperature = temperature_settings[watertemp]
	var/temp_adj = between(BODYTEMP_COOLING_MAX, water_temperature - M.bodytemperature, BODYTEMP_HEATING_MAX)
	M.bodytemperature += temp_adj

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(water_temperature >= H.species.heat_level_1)
			to_chat(H, "<span class='danger'>The water is searing hot!</span>")
		else if(water_temperature <= H.species.cold_level_1)
			to_chat(H, "<span class='warning'>The water is freezing cold!</span>")

/obj/structure/bed/chair/bathtub/buckle_mob()
	. = ..()
	if(. && on)
		playsound(src, 'code_ark/sound/effects/bathtub_splash.ogg', 20)

/obj/structure/bed/chair/bathtub/unbuckle_mob()
	. = ..()
	if(. && on)
		playsound(src, 'code_ark/sound/effects/bathtub_splash.ogg', 20)

/obj/structure/bed/chair/bathtub/on_update_icon()
	overlays.Cut()
	var/image/I
	// Checking if water has to be added
	if(on)
		I = image(icon, "[base_icon]_water")
		I.layer = ABOVE_OBJ_LAYER
		overlays |= I
		I = image(icon, "[base_icon]_water_over")
		if(buckled_mob)
			I.layer = ABOVE_HUMAN_LAYER
		else
			I.layer = ABOVE_OBJ_LAYER
		overlays |= I
	// Deciding whether to put the bathtub edge or water over the mob or not
	I =  image(icon, "[base_icon]_over")
	if(buckled_mob)
		I.layer = ABOVE_HUMAN_LAYER
	else
		I.layer = ABOVE_OBJ_LAYER
	overlays |= I

/obj/structure/bed/chair/bathtub/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()
