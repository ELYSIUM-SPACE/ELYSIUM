/decl/hierarchy/outfit/job/vstar
	hierarchy_type = /decl/hierarchy/outfit/job/vstar

/decl/hierarchy/outfit/job/vstar/miner
	name = OUTFIT_JOB_NAME("Miner")
	uniform = /obj/item/clothing/under/rank/miner
	id_types = list(/obj/item/card/id/vstar)
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/storage/ore = 1)
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/vstar/miner/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/vstar/miner/void
	name = OUTFIT_JOB_NAME("Miner - Voidsuit")
	head = /obj/item/clothing/head/helmet/space/void/mining
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining

/decl/hierarchy/outfit/job/vstar/leader
	name = OUTFIT_JOB_NAME("Excavation Leader")
	uniform = /obj/item/clothing/under/rank/miner
	id_types = list(/obj/item/card/id/vstar/leader)
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/storage/ore = 1)
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/vstar/leader/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/vstar/leader/void
	name = OUTFIT_JOB_NAME("Excavation Leader - Voidsuit")
	head = /obj/item/clothing/head/helmet/space/void/mining
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining
