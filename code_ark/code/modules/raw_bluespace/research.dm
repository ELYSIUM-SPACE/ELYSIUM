//RnD, research allows exploration of raw/native bluespace (lol, that's the whole point of this)

/datum/design/item/bluespace/belt
	name        = "shielding device"
	id          = "bluespace_belt"
	req_tech    = list(TECH_BLUESPACE = 2, TECH_ENGINEERING = 2)
	materials   = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 2000)
	build_path  = /obj/item/storage/belt/bluespace
	sort_string = "VAFAC"

/datum/design/item/bluespace/recaller
	name        = "recall device"
	id          = "bluespace_recaller"
	req_tech    = list(TECH_BLUESPACE = 2, TECH_ENGINEERING = 2)
	materials   = list(MATERIAL_STEEL = 4000, MATERIAL_GLASS = 6000)
	build_path  = /obj/item/recaller
	sort_string = "VAFAD"

/datum/design/item/bluespace/analyzer
	name        = "analyzer"
	id          = "bluespace_analyzer"
	req_tech    = list(TECH_BLUESPACE = 3)
	materials   = list(MATERIAL_STEEL = 1000, MATERIAL_GLASS = 2000)
	build_path  = /obj/item/bluespace_monitor
	sort_string = "VAFAE"

/datum/design/item/bluespace/rifter
	name        = "rifter module"
	id          = "bluespace_rifter"
	req_tech    = list(TECH_BLUESPACE = 6)
	materials   = list(MATERIAL_STEEL = 8000, MATERIAL_GLASS = 4000)
	build_path  = /obj/item/bluespace_rifter
	sort_string = "VAFAF"

/datum/design/item/bluespace/rifter_control
	name        = "rifter module controller"
	id          = "bluespace_rifter_control"
	req_tech    = list(TECH_BLUESPACE = 6)
	materials   = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 500)
	build_path  = /obj/item/rifter_control
	sort_string = "VAFAG"
