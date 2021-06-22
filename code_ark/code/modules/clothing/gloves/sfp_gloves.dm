/obj/item/clothing/gloves/sfp
	name = "sol federal police gloves"
	desc = "A pair of stylish black gloves. These are typically used by Law Enforcement personnel to keep the evidence clean. In addition, they provide basic protection for hands."
	icon = 'code_ark/icons/obj/clothing/obj_hands.dmi'
	item_icons = list(slot_gloves_str = 'code_ark/icons/mob/onmob/onmob_hands.dmi')
	icon_state = "sfp_gloves"
	item_state = "sfp_gloves"
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		energy = ARMOR_ENERGY_MINOR
		)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE