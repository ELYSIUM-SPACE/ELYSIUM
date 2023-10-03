/decl/hierarchy/outfit/job/sev
	hierarchy_type = /decl/hierarchy/outfit/job/sev

/decl/hierarchy/outfit/job/sev/captain
	name = OUTFIT_JOB_NAME("Captain")
	id_types = list(/obj/item/card/id/sev/captain)

/decl/hierarchy/outfit/job/sev/pilot
	name = OUTFIT_JOB_NAME("EXO Pilot")
	id_types = list(/obj/item/card/id/sev/pilot)

/decl/hierarchy/outfit/job/sev/tech
	name = OUTFIT_JOB_NAME("Deck Technician")
	id_types = list(/obj/item/card/id/sev/deck)

/decl/hierarchy/outfit/job/sev/medic
	name = OUTFIT_JOB_NAME("Field Medic")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	id_types = list(/obj/item/card/id/sev/medic)
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sev/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	id_types = list(/obj/item/card/id/sev/scientist)

/decl/hierarchy/outfit/job/sev
	name = OUTFIT_JOB_NAME("Expeditor")
	id_types = list(/obj/item/card/id/sev)
