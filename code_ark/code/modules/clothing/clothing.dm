//��� ������, �� ��������!1! - ���
/obj/item/clothing/glasses/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_eyes_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_eyes_resomi.dmi')

/obj/item/clothing/under/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_under_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_under_resomi.dmi')

/obj/item/clothing/gloves/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_hands_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_hands_resomi.dmi')

/obj/item/clothing/head/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_head_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_head_resomi.dmi')

/obj/item/clothing/mask/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_mask_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_mask_resomi.dmi')

/obj/item/clothing/shoes/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_feet_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_feet_resomi.dmi')

/obj/item/clothing/suit/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_suit_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_suit_resomi.dmi')

/obj/item/clothing/belt/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_belt_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_belt_resomi.dmi')

/obj/item/storage/backpack/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_back_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_back_resomi.dmi')

/obj/item/clothing/suit/armor/pcarrier/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_modular_armor_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_modular_armor_resomi.dmi')

/obj/item/clothing/accessory/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_accessories_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_accessories_resomi.dmi')

/obj/item/device/radio/headset/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_ears_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_ears_resomi.dmi')

/obj/item/paper/New()
	..()
	sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_head_resomi.dmi')

/obj/item/rig/New()
	..()
	if(icon('code_ark/icons/mob/species/resomi/onmob_rig_back_resomi.dmi', icon_state) && !sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_rig_back_resomi.dmi')

/obj/item/card/New()
	..()
	if(!sprite_sheets[SPECIES_RESOMI])
		sprite_sheets += list(SPECIES_RESOMI = 'code_ark/icons/mob/species/resomi/onmob_id_resomi.dmi')
