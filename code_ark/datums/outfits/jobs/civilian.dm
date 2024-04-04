/decl/hierarchy/outfit/job/visitor
	name = OUTFIT_JOB_NAME("Visitor")

	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	suit = /obj/item/clothing/suit/storage/toggle/bomber
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/brown

	id_types = list(/obj/item/card/id/civilian)

/decl/hierarchy/outfit/job/trader
	name = OUTFIT_JOB_NAME("Trader")
	id_types = list(/obj/item/card/id/civilian/trader)

/decl/hierarchy/outfit/job/chaplain
	name = OUTFIT_JOB_NAME("Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/storage/bible
	id_types = list(/obj/item/card/id/civilian/chaplain)
	pda_type = /obj/item/modular_computer/pda/medical

/decl/hierarchy/outfit/job/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	id_types = list(/obj/item/card/id/civilian/janitor)
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/device/radio/headset/headset_service

/decl/hierarchy/outfit/job/psychologist
	name = OUTFIT_JOB_NAME("Psychologist")
	uniform = /obj/item/clothing/under/rank/psych
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	id_types = list(/obj/item/card/id/civilian/psychologist)

/decl/hierarchy/outfit/job/pvt_eye
	name = OUTFIT_JOB_NAME("Private Eye")
	id_types = list(/obj/item/card/id/civilian/pvt_eye)

/decl/hierarchy/outfit/job/freelancer
	name = OUTFIT_JOB_NAME("Freelancer")
	id_types = list(/obj/item/card/id/civilian/freelancer)

/decl/hierarchy/outfit/job/freelancer_pilot
	name = OUTFIT_JOB_NAME("Freelancer Pilot")
	id_types = list(/obj/item/card/id/civilian/freelancer_pilot)

/decl/hierarchy/outfit/job/farmer
	name = OUTFIT_JOB_NAME("Farmer")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/thick/botany
	r_pocket = /obj/item/device/scanner/plant
	id_types = list(/obj/item/card/id/civilian/farmer)
	pda_type = /obj/item/modular_computer/pda
	l_ear = /obj/item/device/radio/headset/headset_service

/decl/hierarchy/outfit/job/farmer/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/hydroponics
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/hyd
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/hyd
