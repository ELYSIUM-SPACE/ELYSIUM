/datum/gear/suit/robe
	display_name = "comfy robes"
	path = /obj/item/clothing/suit/storage/toggle/no_pockets/robe/

/datum/gear/suit/robe/New()
	..()
	var/robes = list()
	robes += /obj/item/clothing/suit/storage/toggle/no_pockets/robe/bathrobe
	robes += /obj/item/clothing/suit/storage/toggle/no_pockets/robe/silk
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(robes)

/datum/gear/suit/female_suit_jacket
	display_name = "formal female jacket"
	path = /obj/item/clothing/suit/storage/toggle/suit/female