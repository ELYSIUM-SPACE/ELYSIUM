/datum/gear/cosmetic_box
	display_name = "cosmetic box"
	sort_category = "Cosmetics"
	cost = 3
	path = /obj/item/storage/cosmetic_bag

/datum/gear/cosmetic_box/New()
	..()
	var/list/cosmetic_boxes = list(
		"male cosmetic bag" = /obj/item/storage/cosmetic_bag/male,
		"female cosmetic bag" = /obj/item/storage/cosmetic_bag/female
		)

	var/list/toothbrushes = list(
		"red toothbrush" = /obj/item/toothbrush/red,
		"pink toothbrush" = /obj/item/toothbrush/pink,
		"blue toothbrush" = /obj/item/toothbrush/blue,
		"green toothbrush" = /obj/item/toothbrush/green,
		"yellow toothbrush" = /obj/item/toothbrush/yellow
		)

	var/list/perfumes = list()
	for(var/perfume_type in typesof(/obj/item/reagent_containers/spray/perfume))
		var/obj/item/reagent_containers/spray/perfume/perfume = perfume_type
		perfumes[initial(perfume.name)] = perfume_type

	var/list/lipsticks = list()
	for(var/lipstick_type in typesof(/obj/item/lipstick/fashionable))
		var/obj/item/lipstick/fashionable/lipstick = lipstick_type
		lipsticks[initial(lipstick.name)] = lipstick_type

	gear_tweaks += new/datum/gear_tweak/path(cosmetic_boxes)
	gear_tweaks += new/datum/gear_tweak/contents(toothbrushes, perfumes, lipsticks)

/datum/gear/toothbrush
	display_name = "toothbrush selection"
	sort_category = "Cosmetics"
	cost = 1
	path = /obj/item/toothbrush

/datum/gear/toothbrush/New()
	gear_tweaks += new/datum/gear_tweak/path(list(
		"red toothbrush" = /obj/item/toothbrush/red,
		"pink toothbrush" = /obj/item/toothbrush/pink,
		"blue toothbrush" = /obj/item/toothbrush/blue,
		"green toothbrush" = /obj/item/toothbrush/green,
		"yellow toothbrush" = /obj/item/toothbrush/yellow
		))

/datum/gear/perfume
	display_name = "perfume selection"
	sort_category = "Cosmetics"
	cost = 1
	path = /obj/item/reagent_containers/spray/perfume
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/napkin_pack
	display_name = "napkin pack"
	cost = 1
	path = /obj/item/storage/napkin_pack
