/decl/hierarchy/outfit/job/liberty/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/liberty/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

decl/hierarchy/outfit/job/liberty/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

decl/hierarchy/outfit/job/liberty/security/warden
	name = OUTFIT_JOB_NAME("Супервайзер SFP")
	uniform = /obj/item/clothing/under/sfp/uniform
	shoes = /obj/item/clothing/shoes/sfp
	id_types = list(/obj/item/card/id/security/head)
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/liberty/security/forensic_tech
	name = OUTFIT_JOB_NAME("Следователь SFP")
	uniform = /obj/item/clothing/under/sfp/uniform
	suit = /obj/item/clothing/suit/storage/toggle/suit/sfp
	shoes = /obj/item/clothing/shoes/sfp
	gloves = /obj/item/clothing/gloves/sfp
	id_types = list(/obj/item/card/id/security/sfp_investigator)

/decl/hierarchy/outfit/job/liberty/security/agent
	name = OUTFIT_JOB_NAME("Полевой агент SFP")
	uniform = /obj/item/clothing/under/sfp/uniform
	shoes = /obj/item/clothing/shoes/sfp
	id_types = list(/obj/item/card/id/security)
	pda_type = /obj/item/modular_computer/pda/security