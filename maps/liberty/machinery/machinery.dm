/obj/machinery/photocopier/faxmachine/sol
	send_access = list(list(access_sol_command, access_sol_sfp_command, access_sol_diplomacy))

//Shouldn't be a lot in here, only torch versions of existing machines that need a different access req or something along those lines.

// Suit cyclers and storage
/obj/machinery/suit_cycler/exploration
	name = "Exploration suit cycler"
	model_text = "Exploration"
	req_access = list(access_sol_exp)
	available_modifications = list(/decl/item_modifier/space_suit/explorer)
	species = list(SPECIES_HUMAN, SPECIES_SKRELL,SPECIES_UNATHI, SPECIES_RESOMI, SPECIES_TAJARA)

/obj/machinery/suit_storage_unit/explorer
	name = "Exploration Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/exploration
	helmet = /obj/item/clothing/head/helmet/space/void/exploration
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_sol_eng)
	islocked = 1

/obj/machinery/suit_storage_unit/pilot
	name = "Pilot Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/pilot
	helmet = /obj/item/clothing/head/helmet/space/void/pilot
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_sol_pilot)
	islocked = 1

/obj/machinery/suit_storage_unit/command
	name = "Command Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/command
	helmet = /obj/item/clothing/head/helmet/space/void/command
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_sol_command)
	islocked = 1

// Vending machines & dispensers
/obj/machinery/vending/security // REVIEW CONTENTS
	products = list(
		/obj/item/handcuffs = 14,
		/obj/item/grenade/flashbang = 4,
		/obj/item/grenade/chem_grenade/teargas = 4,
		/obj/item/device/flash = 7,
		/obj/item/reagent_containers/spray/pepper = 4,
		/obj/item/device/holowarrant = 4,
		/obj/item/reagent_containers/food/snacks/donut/normal = 12,
		/obj/item/storage/box/evidence = 8,
		/obj/item/clothing/accessory/badge/solgov/security = 6)
