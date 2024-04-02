/decl/hierarchy/outfit/job/medical
	hierarchy_type = /decl/hierarchy/outfit/job/medical
	uniform = /obj/item/clothing/under/rank/medical/ark
	l_ear = /obj/item/device/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/chief_medical_officer/ark
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/storage/firstaid/adv
	r_pocket = /obj/item/device/flashlight/pen
	id_types = list(/obj/item/card/id/medical/head)
	pda_type = /obj/item/modular_computer/pda/heads/cmo

/decl/hierarchy/outfit/job/medical/doctor
	name = OUTFIT_JOB_NAME("Medical Doctor")
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_hand = /obj/item/storage/firstaid/adv
	r_pocket = /obj/item/device/flashlight/pen
	id_types = list(/obj/item/card/id/medical)

/decl/hierarchy/outfit/job/medical/pharmacist
	name = OUTFIT_JOB_NAME("Pharmacist")
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/chemist
	id_types = list(/obj/item/card/id/medical/pharmacist)
	pda_type = /obj/item/modular_computer/pda/chemistry

/decl/hierarchy/outfit/job/medical/pharmacist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY
