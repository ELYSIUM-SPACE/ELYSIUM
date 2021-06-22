/obj/item/holder/lizard
	slot_flags = SLOT_HOLSTER // | SLOT_HEAD Currently we don't have on head icons for lizards :(
	w_class = ITEM_SIZE_TINY

/mob/living/proc/get_scooped_self()

	if(!holder_type || buckled || pinned.len)
		return

	var/obj/item/holder/H = new holder_type(get_turf(src))

	src.forceMove(H)

	H.sync(src)
	return H

/obj/item/holder/afterattack(var/turf/T, var/mob/user, var/adjacent)
	if(adjacent && T && (istype(T, /turf/simulated/floor) || istype(T, /turf/unsimulated/floor)))
		user.drop_from_inventory(src, T)
		src.Destroy()
		return
	..()

//ported from old ark
/obj/item/holder/human
	icon = 'code_ark/icons/mob/holder_complex.dmi'
	var/list/generate_for_slots = list(slot_l_hand_str, slot_r_hand_str, slot_back_str)
	slot_flags = SLOT_BACK

/obj/item/holder/human/sync(var/mob/living/M)
	// Generate appropriate on-mob icons.
	var/mob/living/carbon/human/owner = M
	if(istype(owner) && owner.species)

		var/skin_colour = rgb(owner.r_skin, owner.g_skin, owner.b_skin)
		var/hair_colour = rgb(owner.r_hair, owner.g_hair, owner.b_hair)
		var/eye_colour =  rgb(owner.r_eyes, owner.g_eyes, owner.b_eyes)
		var/species_name = lowertext(owner.species.get_bodytype(owner))

		for(var/cache_entry in generate_for_slots)
			var/cache_key = "[owner.species]-[cache_entry]-[skin_colour]-[hair_colour]"
			if(!holder_mob_icon_cache[cache_key])

				// Generate individual icons.
				var/icon/mob_icon = icon(icon, "[species_name]_holder_[cache_entry]_base")
				mob_icon.Blend(skin_colour, ICON_ADD)
				var/icon/hair_icon = icon(icon, "[species_name]_holder_[cache_entry]_hair")
				hair_icon.Blend(hair_colour, ICON_ADD)
				var/icon/eyes_icon = icon(icon, "[species_name]_holder_[cache_entry]_eyes")
				eyes_icon.Blend(eye_colour, ICON_ADD)

				// Blend them together.
				mob_icon.Blend(eyes_icon, ICON_OVERLAY)
				mob_icon.Blend(hair_icon, ICON_OVERLAY)

				// Add to the cache.
				holder_mob_icon_cache[cache_key] = mob_icon
			item_icons[cache_entry] = holder_mob_icon_cache[cache_key]

	// Handle the rest of sync().
	..(M)
