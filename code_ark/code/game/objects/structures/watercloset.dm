// SHOWER SOUND

/obj/structure/hygiene/shower
	var/sound_id
	var/datum/sound_token/sound_token

/obj/structure/hygiene/shower/Initialize()
	. = ..()
	sound_id = "[type]_[sequential_id(type)]"

/obj/structure/hygiene/shower/Destroy()
	QDEL_NULL(sound_token)
	return ..()

/obj/structure/hygiene/shower/attack_hand(var/mob/M)
	on = !on
	update_icon()
	if(on)
		QDEL_NULL(sound_token)
		playsound(src.loc, 'code_ark/sound/machines/shower_start.ogg', 40)
		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, 'code_ark/sound/machines/shower_mid3.ogg', volume = 20, range = 7, falloff = 4, prefer_mute = TRUE)
		if (M.loc == loc)
			wash(M)
			process_heat(M)
		for (var/atom/movable/G in src.loc)
			G.clean_blood()
	else
		QDEL_NULL(sound_token)
		playsound(src.loc, 'code_ark/sound/machines/shower_end.ogg', 40)