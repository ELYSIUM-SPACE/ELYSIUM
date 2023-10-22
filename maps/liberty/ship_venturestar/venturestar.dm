// NECCESSARY INCLUDES

	#include "venturestar_access.dm"
	#include "venturestar_areas.dm"
	#include "venturestar_shuttles.dm"

	#include "machinery/eng_equip.dm"

	#include "datums/venturestar_jobs.dm"
	#include "datums/venturestar_outfits.dm"

	#include "obj/items/weapons/cards_ids.dm"

// TEMPLATE

/datum/map_template/ruin/away_site/venturestarship
	name = "IMV VentureStar"
	id = "awaysite_venturestar"
	description = "Independent Mining Vessel VentureStar."
	suffixes = list("../liberty/ship_venturestar/venturestar.dmm")
	player_cost = 0
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/venturestar)
	area_usage_test_exempted_root_areas = list(/area/venturestar)
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/obj/effect/overmap/visitable/sector/venturestarspace
	name = "Empty Sector"
	icon_state = "dust"
	in_space = 1
	hide_from_reports = TRUE

// SUBMAP DATA

/obj/effect/submap_landmark/joinable_submap/venturestar
	name = "IMV VentureStar"
	archetype = /decl/submap_archetype/venturestar

/decl/submap_archetype/venturestar
	descriptor = "IMV VentureStar"
	map = "IMV VentureStar"
	crew_jobs = list(/datum/job/submap/venturestar/vstar_miner, /datum/job/submap/venturestar/vstar_leader) // ADD JOBS
//	call_webhook = WEBHOOK_SUBMAP_LOADED_LUCIUS
