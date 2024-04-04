/decl/emote/audible
	var/list/emote_sound = null
	// three-dimensional array
	// first is the species, associated to a list of genders, associated to a list of the sound effects to use
/*
/decl/emote/audible/do_emote(var/atom/user, var/extra_params)
	if(ismob(user))
		var/mob/living/M = user
		if (M.emoteCooldownCheck())
			..()
			if(emote_sound) do_extra(user)
*/

/decl/emote/audible/do_extra(var/atom/user)
	var/mob/living/carbon/human/H = user
	if(H.stat) return // No dead or unconcious people screaming pls.

	if(istype(H) && emote_sound)
		if(islist(emote_sound))
			if(emote_sound[H.gender])
				return playsound(user.loc, pick(emote_sound[H.gender]), 50, 0)
		return playsound(user.loc, pick(emote_sound), 50, 0)
