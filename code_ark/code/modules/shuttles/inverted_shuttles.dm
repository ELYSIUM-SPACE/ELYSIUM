/area/space // Fixing artifacts of shuttle movements
	base_turf = /turf/space

/obj/effect/overmap/visitable/ship/landable/find_z_levels()
	for(var/i = 0 to multiz)
		world.maxz++
		map_z += world.maxz

	var/turf/center_loc = locate(round(world.maxx/2), round(world.maxy/2), world.maxz - multiz) // It's done to base shuttle movement on a landmark at its lowest level (originally, bay presumes the top level to be used)
	landmark = new (center_loc, shuttle)
	add_landmark(landmark, shuttle)

	var/visitor_dir = fore_dir
	for(var/landmark_name in list("FORE", "PORT", "AFT", "STARBOARD"))
		var/turf/visitor_turf = get_ranged_target_turf(center_loc, visitor_dir, round(min(world.maxx/4, world.maxy/4)))
		var/obj/effect/shuttle_landmark/visiting_shuttle/visitor_landmark = new (visitor_turf, landmark, landmark_name)
		add_landmark(visitor_landmark)
		visitor_dir = turn(visitor_dir, 90)

	if(multiz)
		new /obj/effect/landmark/map_data(locate(round(world.maxx/2), round(world.maxy/2), world.maxz), (multiz + 1)) // map_data is still required to work from top to bottom

/obj/effect/shuttle_landmark/is_valid(var/datum/shuttle/shuttle)
	if(shuttle.current_location == src)
		return FALSE
	for(var/area/A in shuttle.shuttle_area)
		var/list/translation = get_turf_translation(get_turf(shuttle.current_location), get_turf(src), A.contents)
		if(check_collision(base_area, list_values(translation)))
			return FALSE
	var/conn = GetConnectedZlevels(z)
	for(var/w in z to (z + shuttle.multiz)) // Again, now we check from bottom to top
		if(!(w in conn))
			return FALSE
	return TRUE

datum/shuttle/shuttle_moved(var/obj/effect/shuttle_landmark/destination, var/list/turf_translation)

//	log_debug("move_shuttle() called for [shuttle_tag] leaving [origin] en route to [destination].")
//	log_degug("area_coming_from: [origin]")
//	log_debug("destination: [destination]")
	if((flags & SHUTTLE_FLAGS_ZERO_G))
		var/new_grav = 1
		if(destination.flags & SLANDMARK_FLAG_ZERO_G)
			var/area/new_area = get_area(destination)
			new_grav = new_area.has_gravity
		for(var/area/our_area in shuttle_area)
			if(our_area.has_gravity != new_grav)
				our_area.gravitychange(new_grav)

	for(var/turf/src_turf in turf_translation)
		var/turf/dst_turf = turf_translation[src_turf]
		if(src_turf.is_solid_structure()) //in case someone put a hole in the shuttle and you were lucky enough to be under it
			for(var/atom/movable/AM in dst_turf)
				if(AM.movable_flags & MOVABLE_FLAG_DEL_SHUTTLE)
					qdel(AM)
					continue
				if(!AM.simulated)
					continue
				if(isliving(AM))
					var/mob/living/bug = AM
					bug.gib()
				else
					qdel(AM) //it just gets atomized I guess? TODO throw it into space somewhere, prevents people from using shuttles as an atom-smasher
	var/list/powernets = list()
	for(var/area/A in shuttle_area)
		// if there was a zlevel above our origin, erase our ceiling now we're leaving
		if(HasAbove(current_location.z + multiz))
			for(var/turf/TO in A.contents)
				var/turf/TA = GetAbove(TO)
				if(istype(TA, ceiling_type))
					TA.ChangeTurf(get_base_turf_by_area(TA), 1, 1)
					continue 														// ARK
				if(istype(TA, /turf/simulated/open) && istype(get_area(TA), /area/space)) // ARK
					TA.ChangeTurf(/turf/space, 1, 1)								// ARK
		if(knockdown)
			for(var/mob/M in A)
				spawn(0)
					if(istype(M, /mob/living/carbon))
						if(M.buckled)
							to_chat(M, "<span class='warning'>Sudden acceleration presses you into your chair!</span>")
							shake_camera(M, 3, 1)
						else
							to_chat(M, "<span class='warning'>The floor lurches beneath you!</span>")
							shake_camera(M, 10, 1)
							M.visible_message("<span class='warning'>[M.name] is tossed around by the sudden acceleration!</span>")
							M.throw_at_random(FALSE, 4, 1)

		for(var/obj/structure/cable/C in A)
			powernets |= C.powernet
	if(logging_home_tag)
		var/datum/shuttle_log/s_log = SSshuttle.shuttle_logs[src]
		s_log.handle_move(current_location, destination)

	translate_turfs(turf_translation, current_location.base_area, current_location.base_turf)
	current_location = destination

	// if there's a zlevel above our destination, paint in a ceiling on it so we retain our air
	if(HasAbove(current_location.z + multiz)) // Since now our base coordinates are at the bottom, we have to adjust the whole process for the top part
		for(var/area/A in shuttle_area)
			for(var/turf/TD in A.contents)
				var/turf/TA = GetAbove(TD)
				if(istype(TA, get_base_turf_by_area(TA)) || istype(TA, /turf/simulated/open))
					if(get_area(TA) in shuttle_area)
						continue
					if(istype(TD, /turf/simulated/floor/shuttle_ceiling) && !istype(TA, /turf/simulated/open))	// ARK: We wanna avoid placing a ceiling over the parts that don't really require it
						TA.ChangeTurf(/turf/simulated/open, TRUE, TRUE, TRUE)									// ARK: yeah
					else
						TA.ChangeTurf(ceiling_type, TRUE, TRUE, TRUE)

	// Remove all powernets that were affected, and rebuild them.
	var/list/cables = list()
	for(var/datum/powernet/P in powernets)
		cables |= P.cables
		qdel(P)
	for(var/obj/structure/cable/C in cables)
		if(!C.powernet)
			var/datum/powernet/NewPN = new()
			NewPN.add_cable(C)
			propagate_network(C,C.powernet)

	if(mothershuttle)
		var/datum/shuttle/mothership = SSshuttle.shuttles[mothershuttle]
		if(mothership)
			if(current_location.landmark_tag == motherdock)
				mothership.shuttle_area |= shuttle_area
			else
				mothership.shuttle_area -= shuttle_area