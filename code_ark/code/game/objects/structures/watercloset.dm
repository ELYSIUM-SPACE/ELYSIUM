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

/obj/structure/hygiene/sink/modern
	name = "modern sink"
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "sink_modern"
	desc = "A modern-looking sink used for washing one's hands and face."

/obj/structure/hygiene/sink/modern/attack_hand(var/mob/user)
	if (ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/external/temp = H.organs_by_name[BP_R_HAND]
		if (user.hand)
			temp = H.organs_by_name[BP_L_HAND]
		if(temp && !temp.is_usable())
			to_chat(user,"<span class='notice'>You try to move your [temp.name], but cannot!</span>")
			return

	if(isrobot(user) || isAI(user))
		return

	if(!Adjacent(user))
		return

	if(busy)
		to_chat(user, "<span class='warning'>Someone's already washing here.</span>")
		return

	to_chat(usr, "<span class='notice'>You start washing your hands.</span>")
	playsound(loc, 'sound/effects/sink_long.ogg', 75, 1)

	busy = 1
	flick("[icon_state]_busy",src)
	if(!do_after(user, 40, src))
		busy = 0
		return TRUE
	busy = 0

	user.clean_blood()
	user.visible_message( \
		"<span class='notice'>[user] washes their hands using \the [src].</span>", \
		"<span class='notice'>You wash your hands using \the [src].</span>")


/obj/structure/hygiene/sink/modern/attackby(obj/item/O as obj, var/mob/living/user)

	if(isPlunger(O) && clogged > 0)
		return ..()

	if(busy)
		to_chat(user, "<span class='warning'>Someone's already washing here.</span>")
		return

	var/obj/item/reagent_containers/RG = O
	if (istype(RG) && RG.is_open_container() && RG.reagents)
		RG.reagents.add_reagent(/datum/reagent/water, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		user.visible_message("<span class='notice'>[user] fills \the [RG] using \the [src].</span>","<span class='notice'>You fill \the [RG] using \the [src].</span>")
		playsound(loc, 'sound/effects/sink.ogg', 75, 1)
		return 1

	else if (istype(O, /obj/item/melee/baton))
		var/obj/item/melee/baton/B = O
		if(B.bcell)
			if(B.bcell.charge > 0 && B.status == 1)
				flick("baton_active", src)
				user.Stun(10)
				user.stuttering = 10
				user.Weaken(10)
				if(isrobot(user))
					var/mob/living/silicon/robot/R = user
					R.cell.charge -= 20
				else
					B.deductcharge(B.hitcost)
				user.visible_message( \
					"<span class='danger'>[user] was stunned by \his wet [O]!</span>", \
					"<span class='userdanger'>[user] was stunned by \his wet [O]!</span>")
				return 1
	else if(istype(O, /obj/item/mop))
		O.reagents.add_reagent(/datum/reagent/water, 5)
		to_chat(user, "<span class='notice'>You wet \the [O] in \the [src].</span>")
		playsound(loc, 'sound/effects/slosh.ogg', 25, 1)
		return

	var/turf/location = user.loc
	if(!isturf(location)) return

	var/obj/item/I = O
	if(!I || !istype(I,/obj/item)) return

	to_chat(usr, "<span class='notice'>You start washing \the [I].</span>")
	playsound(loc, 'sound/effects/sink_long.ogg', 75, 1)

	busy = 1
	flick("[icon_state]_busy",src)
	if(!do_after(user, 40, src))
		busy = 0
		return TRUE
	busy = 0

	if(istype(O, /obj/item/extinguisher/)) return TRUE // We're washing, not filling.

	O.clean_blood()
	user.visible_message( \
		"<span class='notice'>[user] washes \a [I] using \the [src].</span>", \
		"<span class='notice'>You wash \a [I] using \the [src].</span>")
