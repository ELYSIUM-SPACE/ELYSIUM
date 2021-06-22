// CABINETS

/decl/closet_appearance/cabinet/walnut
	base_icon =  'code_ark/icons/obj/closets/cabinet.dmi'
	decal_icon = 'code_ark/icons/obj/closets/cabinet_decals.dmi'
	extra_decals = list(
		"handles" = COLOR_SILVER,
		"colored_interior" = WOOD_COLOR_CHOCOLATE
	)
	color = WOOD_COLOR_CHOCOLATE

/obj/structure/closet/cabinet/walnut
	closet_appearance = /decl/closet_appearance/cabinet/walnut

// CHESTDRAWERS

/obj/structure/filingcabinet/chestdrawer/walnut
		desc = "A large cabinet with drawers. This one is made out of walnut."
		icon = 'code_ark/icons/obj/furniture.dmi'
		icon_state = "chestdrawer_walnut"

// UNDERWEAR WARDROBES

/obj/structure/undies_wardrobe/chestdrawer/attack_hand(var/mob/user)
	flick("[initial(icon_state)]-open",src)
	if(!human_who_can_use_underwear(user))
		to_chat(user, "<span class='warning'>Sadly there's nothing in here for you to wear.</span>")
		return
	interact(user)

/obj/structure/undies_wardrobe/chestdrawer
		icon = 'code_ark/icons/obj/furniture.dmi'

/obj/structure/undies_wardrobe/chestdrawer/walnut
		icon_state = "undies_walnut"

// COATRACKS

/obj/structure/coatrack/walnut
	icon = 'code_ark/icons/obj/furniture.dmi'
