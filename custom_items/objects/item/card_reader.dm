/obj/item/weapon/cardreader
	name = "card reader"
	desc = "A card reader that can change access on swiped id card."
	icon = 'custom_items/icons/obj/cardreader.dmi'
	icon_state = "cardreader"
	var/used = 0
	var/access

obj/item/weapon/cardreader/attackby(var/obj/item/W, var/mob/user)
	if (!( W.type in typesof(/obj/item/weapon/card/id)))
		to_chat(user, "<span class='notice'>You can't swipe [W.name]!</span>")
		return
	if (!used)
		to_chat(user, "<span class='notice'>You swiped [W.name]!</span>")
		var/obj/item/weapon/card/id/card = W
		card.access += access
		used = 1
	else
		to_chat(user, "<span class='notice'>[src] was already used!</span>")
