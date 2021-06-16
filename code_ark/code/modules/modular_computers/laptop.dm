/obj/item/modular_computer/laptop
	icon = 'code_ark/icons/obj/modular_laptop.dmi'

/obj/item/modular_computer/laptop/verb/rotatelaptop()
	set name = "Rotate laptop"
	set category = "Object"
	set src in view(1)

	if(usr.stat == DEAD)
		if(!round_is_spooky())
			to_chat(src, "<span class='warning'>The veil is not thin enough for you to do that.</span>")
			return

	src.set_dir(turn(src.dir, -90))

/obj/item/modular_computer/laptop/update_verbs()
	..()
	verbs |= /obj/item/modular_computer/laptop/verb/rotatelaptop