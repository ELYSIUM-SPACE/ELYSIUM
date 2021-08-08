/obj/machinery/media/ambience_generator
	name = "ambience generator"
	desc = "This DAIS Ambience-Enhancement System 3000 provides unmatched immersion into the selected environment. Its branded 1024K stereoscopic Retina display outperforms your eyes' resolution and literally makes you perceive the image as the reality. You'd probably have to work for 510 years to afford a replacement, so being cautious around it is a good idea."
	icon = 'code_ark/icons/obj/ambience_generator.dmi'
	icon_state = "off"
	power_channel = EQUIP
	idle_power_usage = 10
	active_power_usage = 500
	clicksound = 'sound/machines/buttonbeep.ogg'
	anchored = TRUE
	pixel_x = -28
	pixel_y = 38

	var/displaying = 0

	var/volume = 20
	var/sound_id
	var/datum/sound_token/sound_token
	var/list/ambiences
	var/datum/ambience/current_ambience

// Ambience presets

/ambience_preset
	var/ambience_name
	var/ambience_icon_state
	var/ambience_sound
	var/ambience_color

/ambience_preset/city_day
	ambience_name = "Urban Daytime"
	ambience_icon_state = "city_day"
	ambience_sound = 'code_ark/sound/effects/city_day.ogg'
	ambience_color = "#85a8c9"

/ambience_preset/city_night
	ambience_name = "Urban Nighttime"
	ambience_icon_state = "city_night"
	ambience_sound = 'code_ark/sound/effects/city_night.ogg'
	ambience_color = "#315e95"

/ambience_preset/beach
	ambience_name = "Tropical Beach"
	ambience_icon_state = "beach"
	ambience_sound = 'code_ark/sound/effects/beach.ogg'
	ambience_color = "#f8e09c"

/ambience_preset/aquarium
	ambience_name = "Exotic Aquarium"
	ambience_icon_state = "aquarium"
	ambience_sound = 'code_ark/sound/effects/aquarium.ogg'
	ambience_color = "#0197cc"

/ambience_preset/fireplace
	ambience_name = "Warming Fireplace"
	ambience_icon_state = "fireplace"
	ambience_sound = 'code_ark/sound/effects/fireplace.ogg'
	ambience_color = "#da790c"

/ambience_preset/winter
	ambience_name = "Winter Wonderland"
	ambience_icon_state = "winter"
	ambience_sound = 'code_ark/sound/effects/winter.ogg'
	ambience_color = "#ffffff"

/ambience_preset/rain
	ambience_name = "Gloomy Rainy Day"
	ambience_icon_state = "rain"
	ambience_sound = 'code_ark/sound/effects/rain.ogg'
	ambience_color = "#b1a893"

/ambience_preset/planets
	ambience_name = "Planetary Panorama"
	ambience_icon_state = "planets"
	ambience_sound = 'code_ark/sound/effects/planets.ogg'
	ambience_color = "#4a383a"

/ambience_preset/forest
	ambience_name = "Dreaming Forest"
	ambience_icon_state = "forest"
	ambience_sound = 'code_ark/sound/effects/forest.ogg'
	ambience_color = "#72745a"

/ambience_preset/mountains
	ambience_name = "Mighty Ridge"
	ambience_icon_state = "mountains"
	ambience_sound = 'code_ark/sound/effects/mountains.ogg'
	ambience_color = "#b5c9b9"

GLOBAL_LIST_INIT(ambience_presets, list(	// Make sure any ambiences you've created above are added to this list,
	"Urban Daytime" = /ambience_preset/city_day,
	"Urban Nighttime" = /ambience_preset/city_night,
	"Tropical Beach" = /ambience_preset/beach,
	"Exotic Aquarium" = /ambience_preset/aquarium,
	"Warming Fireplace" = /ambience_preset/fireplace,
	"Winter Wonderland" = /ambience_preset/winter,
	"Gloomy Rainy Day" = /ambience_preset/rain,
	"Planetary Panorama" = /ambience_preset/planets,
	"Dreaming Forest" = /ambience_preset/forest,
	"Mighty Ridge" = /ambience_preset/mountains
))

// The actual code making it work

/datum/ambience
	var/ambience_name
	var/ambience_path
	var/ambience_icon_state
	var/ambience_sound
	var/ambience_color

/datum/ambience/New(var/ambience_name, var/ambience_path)
	src.ambience_name = ambience_name
	src.ambience_path = ambience_path
	if(ispath(ambience_path, /ambience_preset))
		var/ambience_preset/ambience_preset = decls_repository.get_decl(ambience_path)
		ambience_icon_state = ambience_preset.ambience_icon_state
		ambience_sound = ambience_preset.ambience_sound
		ambience_color = ambience_preset.ambience_color
	else crash_with("An ambience preset ([ambience_name]) path is incorrectly set!")

/proc/setup_ambiences(var/list/ambience_list)
	. = list()
	ambience_list = GLOB.ambience_presets
	for(var/ambience_name in ambience_list)
		var/ambience_path = ambience_list[ambience_name]
		. += new/datum/ambience(ambience_name, ambience_path)

/obj/machinery/media/ambience_generator/New()
	..()
	sound_id = "[type]_[sequential_id(type)]"

/obj/machinery/media/ambience_generator/Initialize()
	. = ..()
	ambiences = setup_ambiences(ambiences)

/obj/machinery/media/ambience_generator/Destroy()
	StopDisplaying()
	QDEL_NULL_LIST(ambiences)
	current_ambience = null
	. = ..()

/obj/machinery/media/ambience_generator/power_change()
	. = ..()
	if(stat & (NOPOWER|BROKEN) && displaying)
		StopDisplaying()

/obj/machinery/media/ambience_generator/on_update_icon()
	overlays.Cut()
	var/image/I
	if(stat & NOPOWER)
		set_light(0)
		return
	if(stat & BROKEN)
		I = image(icon, "broken")
	if(displaying && current_ambience)
		I = image(icon = icon, icon_state = current_ambience.ambience_icon_state)
	if(I)
		I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		I.layer = ABOVE_LIGHTING_LAYER
		overlays += I
		set_light(0.5, 0.5, 3, 2, displaying ? current_ambience.ambience_color : "#082b78")
	else
		set_light(0)

// UI interactions

/obj/machinery/media/ambience_generator/CanUseTopic(user, state)
	if(stat & BROKEN)
		to_chat(user, "<span class='warning'>\The [src] is broken!</span>")
		return STATUS_CLOSE
	return ..()

/obj/machinery/media/ambience_generator/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/list/ambience_list = new
	for(var/datum/ambience/A in ambiences)
		ambience_list.Add(list(list("ambience"=A.ambience_name)))

	var/list/data = list(
		"current_ambience" = current_ambience != null ? current_ambience.ambience_name : "No ambience selected",
		"displaying" = displaying,
		"ambiences" = ambience_list,
		"volume" = volume
	)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "ambience_generator.tmpl", "DAIS AES 3000", 380, 440)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/media/ambience_generator/interface_interact(var/mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/media/ambience_generator/OnTopic(var/mob/user, var/list/href_list, state)
	if (href_list["ambience_selection"])
		for(var/datum/ambience/A in ambiences)
			if(A.ambience_name == href_list["ambience_selection"])
				StartDisplaying(A)
				break
		return TOPIC_REFRESH

	if (href_list["stop"])
		StopDisplaying()
		return TOPIC_REFRESH

	if (href_list["volume"])
		AdjustVolume(text2num(href_list["volume"]))
		return TOPIC_REFRESH

/obj/machinery/media/ambience_generator/proc/StopDisplaying()
	displaying = 0
	current_ambience = null
	update_use_power(POWER_USE_IDLE)
	update_icon()
	QDEL_NULL(sound_token)

/obj/machinery/media/ambience_generator/proc/StartDisplaying(var/datum/ambience/selected_ambience)
	StopDisplaying()
	current_ambience = selected_ambience
	if(!current_ambience)
		crash_with("Ambience generator ([src] - [src.loc]) has attempted booting without an ambience selected!")

	if(current_ambience.ambience_sound)
		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, current_ambience.ambience_sound, volume = volume, range = 5, falloff = 3, prefer_mute = TRUE)

	displaying = 1
	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/media/ambience_generator/proc/AdjustVolume(var/new_volume)
	volume = Clamp(new_volume, 0, 50)
	if(sound_token)
		sound_token.SetVolume(volume)

// Easter eggs

/obj/machinery/media/ambience_generator/proc/do_slideshow(var/severity)
	var/number_of_switchings = min(5 * severity, 15)
	var/delay = max(5, 45 - 15 * severity)

	while(number_of_switchings)
		if(stat & (BROKEN|NOPOWER))
			break

		volume = rand(100)
		StartDisplaying(pick(ambiences))
		number_of_switchings--
		sleep(delay)

	if(prob(30))
		set_broken(TRUE)

/obj/machinery/media/ambience_generator/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		return

	do_slideshow(severity)

/obj/machinery/media/ambience_generator/emag_act(remaining_charges, mob/user)
	if(stat & (BROKEN|NOPOWER))
		return FALSE

	do_slideshow(rand(1,3))
	return TRUE

/obj/machinery/media/ambience_generator/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(25))
				qdel(src)
				return
			if (prob(50))
				set_broken(TRUE)
			else
				do_slideshow(severity)
		if(3.0)
			if (prob(25))
				set_broken(TRUE)
			else
				do_slideshow(severity)

/obj/machinery/media/ambience_generator/bullet_act(var/obj/item/projectile/Proj)
	if(prob(Proj.get_structure_damage()))
		set_broken(TRUE)
	..()

/obj/machinery/media/ambience_generator/set_broken()
	..()
	StopDisplaying()
	update_icon()
