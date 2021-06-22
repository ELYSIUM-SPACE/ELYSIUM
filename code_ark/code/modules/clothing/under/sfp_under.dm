/obj/item/clothing/under/sfp
	icon = 'code_ark/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'code_ark/icons/mob/onmob/onmob_under.dmi')
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		energy = ARMOR_ENERGY_MINOR
		)
	siemens_coefficient = 0.9
	gender_icons = 1

/obj/item/clothing/under/sfp/uniform
	name = "sol federal police officer's uniform"
	desc = "Whatcha gonna do when they come for you? This standard navy-blue SFP uniform is made of a slightly sturdier material than a typical outfit, to allow for robust protection. A silver SFP logo is printed on the back along with some stylish epauluettes attached on shoulders."
	icon_state = "sfp_uniform"
	worn_state = "sfp_uniform"

/obj/item/clothing/under/sfp/pants
	name = "sol federal police officer's pants"
	desc = "Bad boys ...and girls... These standard SFP pants are made of a slightly sturdier material than a typical pair of jeans, to allow for robust protection. An SFP logo is engraved on the silver buckle."
	icon = 'code_ark/icons/obj/clothing/obj_under_pants.dmi'
	item_icons = list(slot_w_uniform_str = 'code_ark/icons/mob/onmob/onmob_under_pants.dmi')
	icon_state = "sfp_pants"
	worn_state = "sfp_pants"
	gender = PLURAL
	body_parts_covered = LOWER_TORSO|LEGS
	gender_icons = 0