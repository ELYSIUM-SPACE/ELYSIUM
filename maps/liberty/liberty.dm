#if !defined(using_map_DATUM)
	#include "ship_lucius/lucius.dm"
	#include "ship_venturestar/venturestar.dm"

	#include "job/_sol_access_defs.dm"
	#include "job/sol_access.dm"
	#include "job/liberty_access.dm"

	#include "liberty_areas.dm"
	#include "liberty_elevators.dm"
	#include "liberty_overmap.dm"
	#include "liberty_presets.dm"
	#include "liberty_shuttles.dm"
	#include "liberty_turfs.dm"
	#include "liberty_unit_testing.dm"

	#include "items/items.dm"
	#include "items/rigs.dm"
	#include "machinery/doors.dm"
	#include "machinery/misc.dm"
	#include "objects/misc.dm"
	#include "structures/flooring_decals.dm"

// TORCH DEFINES (it's still Torch's stuff (manual revision recommended))

	#include "items/clothing/solgov-accessory.dm"
	#include "items/clothing/ec_skillbadges.dm"
	#include "items/clothing/solgov-armor.dm"
	#include "items/clothing/solgov-head.dm"
	#include "items/clothing/solgov-suit.dm"
	#include "items/clothing/solgov-under.dm"
	#include "items/explo_shotgun.dm"
	#include "items/solbanner.dm"

	#include "structures/closets.dm"
	#include "structures/closets/closet_appearances.dm"
	#include "structures/closets/command.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "structures/closets/services.dm"
	#include "structures/closets/supply.dm"
	#include "structures/closets/exploration.dm"

	#include "machinery/suit_storage.dm"
	#include "machinery/machinery.dm"

	#include "items/weapon/storage/wallets.dm"

//	#include "../torch/torch_ranks.dm" // FIX ME

//	#include "../torch/datums/uniforms.dm" // FIX ME
//	#include "../torch/datums/uniforms_expedition.dm" // FIX ME
//	#include "../torch/datums/uniforms_fleet.dm" // FIX ME

//	#include "../torch/items/cards_ids.dm"
//	#include "../torch/items/encryption_keys.dm"
//	#include "../torch/items/headsets.dm"
//	#include "../torch/items/items.dm"
//	#include "../torch/items/machinery.dm"
//	#include "../torch/items/manuals.dm"
//	#include "../torch/items/stamps.dm"
//	#include "../torch/items/uniform_vendor.dm" // FIX ME
//	#include "../torch/items/rigs.dm"
//	#include "../torch/items/solbanner.dm"
//	#include "../torch/items/explo_shotgun.dm"
//	#include "../torch/items/mecha.dm"

//	#include "../torch/items/clothing/ec_skillbadges.dm"
//	#include "../torch/items/clothing/solgov-accessory.dm"
//	#include "../torch/items/clothing/solgov-armor.dm"
//	#include "../torch/items/clothing/solgov-feet.dm"
//	#include "../torch/items/clothing/solgov-hands.dm"
//	#include "../torch/items/clothing/solgov-head.dm"
//	#include "../torch/items/clothing/solgov-suit.dm"
//	#include "../torch/items/clothing/solgov-under.dm"
//	#include "../torch/items/clothing/terran-accessory.dm"
//	#include "../torch/items/clothing/terran-feet.dm"
//	#include "../torch/items/clothing/terran-hands.dm"
//	#include "../torch/items/clothing/terran-head.dm"
//	#include "../torch/items/clothing/terran-suit.dm"
//	#include "../torch/items/clothing/terran-under.dm"

//	#include "../torch/items/weapon/storage/wallets.dm"

//	#include "../torch/structures/signs.dm"
//	#include "../torch/structures/closets.dm"
//	#include "../torch/structures/closets/closet_appearances.dm"
//	#include "../torch/structures/closets/command.dm"
//	#include "../torch/structures/closets/engineering.dm"
//	#include "../torch/structures/closets/medical.dm"
//	#include "../torch/structures/closets/misc.dm"
//	#include "../torch/structures/closets/research.dm"
//	#include "../torch/structures/closets/security.dm"
//	#include "../torch/structures/closets/services.dm"
//	#include "../torch/structures/closets/supply.dm"
//	#include "../torch/structures/closets/exploration.dm"

//	#include "../torch/machinery/suit_storage.dm"

//	#include "../torch/job/torch_access.dm" // REMOVE ME

// END OF TORCH DEFINES

	#include "liberty1_level0.dmm"
	#include "liberty2_level1.dmm"
	#include "liberty3_level2.dmm"
	#include "liberty4_level3.dmm"
//	#include "z1_admin.dmm"
//	#include "z2_transit.dmm"

	#include "../away/empty.dmm"
	//#include "../away/ascent/ascent.dm"	на время ребейза отключил
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	//#include "../away/icarus/icarus.dm"	на время ребейза отключил
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	//#include "../away/unishi/unishi.dm"	на время ребейза отключил
	#include "../away/voxship/voxship.dm"
	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/meatstation/meatstation.dm"

	#define using_map_DATUM /datum/map/liberty

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
