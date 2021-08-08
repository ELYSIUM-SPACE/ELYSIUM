//MOST IS DISABLED DURING REBASE BECAUSE CURRENT BAY USES DIFFERENT MUSIC SYSTEM, THIS ONE NEEDS TO BE ADAPTED

/obj/machinery/media/mixing_console
	name = "mixing console"
	desc = "It's an advanced accoustic system control panel. It's connected to loudspeakers to cover a larger area. Along with some default tracks stored, it has access to a global music database."
	icon = 'code_ark/icons/obj/machinery.dmi'
	icon_state = "mixer"
	anchored = TRUE
	density = TRUE
	power_channel = EQUIP
	idle_power_usage = 10
	active_power_usage = 100
	clicksound = 'sound/machines/buttonbeep.ogg'

	var/playing = 0
	var/volume = 20

	var/sound_id
	var/datum/sound_token/sound_token

	var/datum/track/current_track
	var/list/track/tracks

	var/music_track/custom_track/custom_track

	var/list/obj/machinery/media/speaker/slaves = list()

/obj/machinery/media/speaker
	name = "loudspeaker"
	desc = "It's a relatively powerful loudspeaker connected to a mixing console to provide the joy of music."
	icon = 'code_ark/icons/obj/machinery.dmi'
	icon_state = "speaker"
	idle_power_usage = 10
	active_power_usage = 200
	level = 1	//underfloor
	layer = BELOW_OBJ_LAYER

	var/playing = 0

/////////////////////// INITIALIZATION ///////////////////////

/obj/machinery/media/mixing_console/Initialize()
	. = ..()
	sound_id = "[type]_[sequential_id(type)]"
	//tracks = setup_music_tracks(tracks)
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/media/mixing_console/LateInitialize()
	. = ..()
	for (var/obj/machinery/media/speaker/i in world)
		if(i.id_tag == id_tag)
			slaves += i

/obj/machinery/media/speaker/Initialize()
	. = ..()
	var/turf/T = loc
	if(istype(T) && !T.is_plating())
		hide(1)
	update_icon()

/obj/machinery/media/speaker/hide(var/intact)
	set_invisibility(intact ? 101 : 0)

/obj/machinery/media/speaker/hides_under_flooring()
	return 1

//////////////////////// DESTRUCTION ////////////////////////

/obj/machinery/media/mixing_console/Destroy()
	StopPlaying()
//	QDEL_NULL_LIST(tracks)
//	current_track = null
	. = ..()

/obj/machinery/media/speaker/Destroy()
	StopPlaying()
	. = ..()

/////////////////////////// POWER ///////////////////////////

/obj/machinery/media/mixing_console/power_change()
	. = ..()
	if(stat & (NOPOWER|BROKEN) && playing)
		StopPlaying()
		for (var/obj/machinery/media/speaker/S in slaves)
			S.StopPlaying()
	update_icon()

/obj/machinery/media/speaker/power_change()
	. = ..()
	if(stat & (NOPOWER|BROKEN) && playing)
		StopPlaying()
	update_icon()

///////////////////////// PLAYING /////////////////////////

/obj/machinery/media/mixing_console/proc/StopPlaying()
	playing = 0
	update_use_power(POWER_USE_IDLE)
	update_icon()
	for(var/obj/machinery/media/speaker/i in slaves)
		i.StopPlaying()
	QDEL_NULL(sound_token)

/obj/machinery/media/speaker/proc/StopPlaying()
	playing = 0
	update_use_power(POWER_USE_IDLE)
	update_icon()
/*

/obj/machinery/media/mixing_console/proc/StartPlaying()
	if(emagged)
		emag_play()
	else
		StopPlaying()
		if(!current_track && !custom_track)
			return

		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, (custom_track != null ? custom_track.song : current_track.GetTrack()), volume = volume, range = 2, falloff = 1, prefer_mute = TRUE)

		playing = 1

		for(var/obj/machinery/media/speaker/i in slaves)
			i.StartPlaying()

		update_use_power(POWER_USE_ACTIVE)
		update_icon()

/obj/machinery/media/speaker/proc/StartPlaying()
	playing = 1
	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/media/mixing_console/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, 50)
	if(sound_token)
		sound_token.SetVolume(volume)

///////////////////////// EASTER EGGS /////////////////////////

/obj/machinery/media/mixing_console/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = TRUE
		StopPlaying()
		visible_message("<span class='danger'>\The [src] makes a fizzling sound.</span>")
		return 1

/obj/machinery/media/mixing_console/proc/emag_play()
	playsound(loc, 'sound/items/AirHorn.ogg', 100, 1)
	for(var/mob/living/carbon/M in ohearers(6, src))
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(H.get_sound_volume_multiplier() < 0.2)
				continue
		M.sleeping = 0
		M.stuttering += 20
		M.ear_deaf += 30
		M.Weaken(3)
		if(prob(30))
			M.Stun(10)
			M.Paralyse(4)
		else
			M.make_jittery(400)
	for(var/obj/machinery/media/speaker/i in slaves)
		i.emag_play()
	spawn(15)
		explode()

obj/machinery/media/speaker/proc/emag_play()
	playsound(loc, 'sound/items/AirHorn.ogg', 100, 1)
	for(var/mob/living/carbon/M in ohearers(6, src))
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(H.get_sound_volume_multiplier() < 0.2)
				continue
		M.sleeping = 0
		M.stuttering += 20
		M.ear_deaf += 30
		M.Weaken(3)
		if(prob(30))
			M.Stun(10)
			M.Paralyse(4)
		else
			M.make_jittery(400)
	spawn(15)
		explode()

/obj/machinery/media/mixing_console/proc/explode()
	walk_to(src,0)
	src.visible_message("<span class='danger'>\the [src] blows apart!</span>", 1)
	explosion(src.loc, 0, 0, 1, rand(1,2), 1)
	Destroy()

/obj/machinery/media/speaker/proc/explode()
	walk_to(src,0)
	src.visible_message("<span class='danger'>\the [src] blows apart!</span>", 1)
	explosion(src.loc, 0, 0, 1, rand(1,2), 1)
	Destroy()

///////////////////////// ICON /////////////////////////

/obj/machinery/media/mixing_console/on_update_icon()
	overlays.Cut()
	if(stat & (NOPOWER|BROKEN))
		set_light(0)
	else
		var/image/I = image('code_ark/icons/obj/machinery.dmi',(playing == 1 ? "mixer_playing" : (emagged == 1 ? "mixer_emagged" : "mixer_calm")))
		I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		I.layer = ABOVE_LIGHTING_LAYER
		overlays += I
		set_light(0.1, 0.1, 1, 2, COLOR_WHITE)

/obj/machinery/media/speaker/on_update_icon()
	overlays.Cut()
	if(!stat & (NOPOWER|BROKEN))
		var/image/I = image('code_ark/icons/obj/machinery.dmi',(playing == 1 ? "speaker_playing" : "speaker_powered"))
		overlays += I

///////////////////////// UI /////////////////////////

/obj/machinery/media/mixing_console/interface_interact(var/mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/media/mixing_console/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/list/mixer_tracks = new
	for(var/datum/track/T in tracks)
		mixer_tracks.Add(list(list("track"=T.title)))

	var/list/data = list(
		"current_track" = custom_track != null ? custom_track.title : (current_track != null ? current_track.title : "Track not set"),
		"playing" = playing,
		"tracks" = mixer_tracks,
		"volume" = volume
		)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "mixing_console.tmpl", "Mixing Console", 340, 440)
		ui.set_initial_data(data)
		ui.open()

/music_track/custom_track
	title = "Unknown track"
	song = 'sound/misc/null.ogg'
	license = /decl/license/grandfathered

/obj/machinery/media/mixing_console/OnTopic(var/mob/user, var/list/href_list, state)
	if (href_list["title"])
		for(var/datum/track/T in tracks)
			if(T.title == href_list["title"])
				current_track = T
				custom_track = null
				StartPlaying()
				break
		return TOPIC_REFRESH

	if (href_list["stop"])
		StopPlaying()
		return TOPIC_REFRESH

	if (href_list["play"])
		if(!current_track && !custom_track)
			to_chat(usr, "No track selected.")
		else
			StartPlaying()
		return TOPIC_REFRESH

	if (href_list["open_track"])
		custom_track = new
		custom_track.title = input("Input the Song Name...") as null|text
		custom_track.song = input(usr, "Choose a Song File to Load","Upload Song File") as null|file
		if(!custom_track.song || (custom_track.song == 'sound/misc/null.ogg'))
			return TOPIC_REFRESH
		StartPlaying()
		return TOPIC_REFRESH

	if (href_list["volume"])
		AdjustVolume(text2num(href_list["volume"]))
		return TOPIC_REFRESH
*/
