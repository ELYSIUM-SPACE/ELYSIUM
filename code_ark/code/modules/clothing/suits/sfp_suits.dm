/obj/item/clothing/suit/storage/toggle/suit/sfp
	name = "sol federal police jacket"
	desc = "A relatively warm navy-blue jacket with golden SFP markings. It's made of quite a robust material and provides some protection."
	icon = 'code_ark/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'code_ark/icons/mob/onmob/onmob_suit.dmi')
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		energy = ARMOR_ENERGY_MINOR
		)
	icon_state = "sfp_jacket"
	icon_open = "sfp_jacket"
	icon_closed = "sfp_jacket_unbuttoned"