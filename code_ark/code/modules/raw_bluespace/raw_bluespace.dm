//Raw/Native bluespace

var/global/bluespace_level
var/global/area/space/blue/bluespace_area

/proc/generate_bluespace() //self-explanatory
	world.maxz++
	global.bluespace_level = world.maxz
	global.bluespace_area  = new
	GLOB.using_map.player_levels += global.bluespace_level //not in adminlevels since can_teleport() checks ``destination.z > max_default_z_level()``
	GLOB.using_map.sealed_levels += global.bluespace_level

	for(var/sx = 1, sx <= world.maxx, sx++)
		for(var/sy = 1, sy <= world.maxy, sy++)
			var/turf/T = locate(sx,sy,global.bluespace_level)
			T.ChangeTurf(/turf/unsimulated/floor/bluespace/raw)
			ChangeArea(T, global.bluespace_area)

/proc/in_bluespace(var/atom/A)
	return A.z == global.bluespace_level

/world/New() //It is, in fact, very-very bad. Seems this way..
	..()
	generate_bluespace()

//BS area

/area/space/blue
	name             = "Bluespace"
	dynamic_lighting = 0
	has_gravity      = 1

/area/space/blue/Entered(atom/movable/A,atom/oldloc)
	..()
	if(istype(A,/mob/living))
		var/mob/living/L = A
		L.playsound_local(A.loc, sound('code_ark/sound/ambience/bluespace.ogg', repeat = 1, wait = 0, volume = 400, channel = GLOB.ambience_sound_channel))
		L.overlay_fullscreen("bluespace", /obj/screen/fullscreen/bluespace_overlay)
	A.alpha = 100
	A.color = "#0000ff"

/area/space/blue/Exited(atom/movable/A, atom/newloc)
	..()
	if(istype(A,/mob/living))
		var/mob/living/L = A
		sound_to(L, sound(null, channel = GLOB.ambience_sound_channel))
		L.clear_fullscreen("bluespace")
	A.alpha = initial(A.alpha)
	A.color = initial(A.color)

//BS turf

/turf/unsimulated/floor/bluespace/raw
	name        = "bluespace"
	desc        = "Raw bluespace. Insanely, bizzarely, but it feels rather.. soft. <font color=\"#293fe3\">Strange.</font>"
	initial_gas = list()
	color       = "#999999"
	alpha       = 100

/turf/unsimulated/floor/bluespace/raw/Initialize()
	. = ..()
	alpha = rand(60,120)

//BS effects

/mob/living/var/bs_defense_until = 0

/turf/unsimulated/floor/bluespace/raw/Entered(var/atom/movable/O, var/atom/oldloc)
	. = ..()
	if(isliving(O))
		var/mob/living/L = O
		if(!defense_check(L))
			L.dust() //sorry pal :(
			return
		var/lastalpha = alpha
		alpha = 255
		animate(src,alpha = lastalpha,time = pick(5,10))

/turf/unsimulated/floor/bluespace/raw/proc/defense_check(var/atom/movable/O)
	. = 0
	if(isliving(O))
		var/mob/living/L = O
		var/mob/living/carbon/human/H
		if(ishuman(L)) H = L
		if(istype(H?.belt, /obj/item/storage/belt/bluespace)) . = H.belt
		if(world.time < L.bs_defense_until)                          . = 1
		if(issilicon(L))                                             . = 1

/* Everything you teleport (through the teleport/sparks one, which is default) goes through raw bluespace (you can even intercept something!)
 since spawn()'s are used the whole process takes the speed var (deciseconds), which is 200 ms by default
 it is not recommended to use long delay (player can get confused and can leave transition turf, then die, or suffocate)
 also, do_teleport is used only in few places: legacy teleporter & portals, still enough */

/decl/teleport/sparks/teleport_target(var/atom/movable/target, var/atom/destination, var/precision, var/speed = 2)
	if(isliving(target))
		var/mob/living/L = target
		L.bs_defense_until = world.time + speed + 1

	target.filters += filter(type="outline", color = COLOR_DEEP_SKY_BLUE, size = 2)
	target.filters += filter(type="blur",    size = 4)

	var/turf/S = get_turf(target)

	var/turf/temp1  = locate(S.x,S.y,                     global.bluespace_level)
	var/turf/temp2  = locate(destination.x,destination.y, global.bluespace_level)

	target.forceMove(temp1) //move them to bluespace

	spawn(speed/2)
		if(target.loc == temp1 && !(locate(/obj/effect/bs_catcher) in range(temp1,10))) target.forceMove(temp2) //so if nobody touched it, continue

	spawn(speed)
		if(target.loc == temp2 && !(locate(/obj/effect/bs_catcher) in range(temp2,10))) ..() //teleport them to their destination

	spawn(speed + 1)
		target.filters = list()

//grabs and pulls

/decl/teleport/teleport_target(var/atom/movable/target, var/atom/destination, var/precision)
	..()
	var/mob/living/carbon/human/H = target
	if(!istype(H)) return

	for(var/obj/item/grab/G in H.contents)
		if(can_teleport(G.affecting,destination))        teleport_target(G.affecting,destination,precision)

	if(H.pulling && can_teleport(H.pulling,destination)) teleport_target(H.pulling,  destination,precision)
