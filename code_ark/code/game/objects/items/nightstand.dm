/obj/item/storage/nightstand
	name = "nightstand"
	desc = "It's a small cabinet designed to stand beside a bed. This one is made of walnut."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "nightstand"
	max_w_class = ITEM_SIZE_HUGE
	w_class = ITEM_SIZE_HUGE
	max_storage_space = 20
	force = 8
	throwforce = 10
	randpixel = 0
	anchored = 1
	density = 0

/obj/item/storage/nightstand/attackby(obj/item/W as obj, mob/user as mob)
	if(isWrench(W))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
		anchored = !anchored
		user.visible_message("[user.name] [anchored ? "secures" : "unsecures"] the bolts holding [src.name] to the floor.", \
					"You [anchored ? "secure" : "unsecure"] the bolts holding [src] to the floor.", \
					"You hear a ratchet.")
	else
		..()
