/decl/hierarchy/outfit/job/sev
	hierarchy_type = /decl/hierarchy/outfit/job/sev
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/ark
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/exp
	shoes = /obj/item/clothing/shoes/jackboots
	head = 	/obj/item/clothing/head/beret/solgov/expedition

	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/sev/captain
	name = OUTFIT_JOB_NAME("Captain")
	id_types = list(/obj/item/card/id/sev/captain)
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/cmd
	head = 	/obj/item/clothing/head/beret/solgov/expedition/command

/decl/hierarchy/outfit/job/sev/pilot
	name = OUTFIT_JOB_NAME("EXO Pilot")
	id_types = list(/obj/item/card/id/sev/pilot)

/decl/hierarchy/outfit/job/sev/tech
	name = OUTFIT_JOB_NAME("Deck Technician")
	id_types = list(/obj/item/card/id/sev/deck)
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/eng
	head = 	/obj/item/clothing/head/beret/solgov/expedition/engineering

/decl/hierarchy/outfit/job/sev/medic
	name = OUTFIT_JOB_NAME("Field Medic")
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/med
	l_hand = /obj/item/storage/firstaid/adv
	belt = /obj/item/storage/belt/medical/emt
	id_types = list(/obj/item/card/id/sev/medic)
	head = 	/obj/item/clothing/head/beret/solgov/expedition/medical

/decl/hierarchy/outfit/job/sev/scientist
	name = OUTFIT_JOB_NAME("EC Researcher")
	id_types = list(/obj/item/card/id/sev/scientist)
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science/ec

/decl/hierarchy/outfit/job/sev/sev_expeditor
	name = OUTFIT_JOB_NAME("Expeditor")
	id_types = list(/obj/item/card/id/sev)
	head = 	/obj/item/clothing/head/beret/solgov/expedition/exploration
