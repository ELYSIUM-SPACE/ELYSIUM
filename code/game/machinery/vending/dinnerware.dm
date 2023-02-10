/obj/machinery/vending/dinnerware
	name = "\improper Dinnerware"
	desc = "A kitchen and restaurant equipment vendor."
	icon_state = "dinnerware"
	icon_vend = "dinnerware-vend"
	icon_deny = "dinnerware-deny"
	base_type = /obj/machinery/vending/dinnerware
	product_ads = {"\
		Mm, food stuffs!;\
		Food and food accessories.;\
		Get your plates!;\
		You like forks?;\
		I like forks.;\
		Woo, utensils.;\
		You don't really need these...\
	"}
	products = list(
		/obj/item/reagent_containers/glass/beaker/bowl =2,
		/obj/item/tray = 8,
		/obj/item/material/knife/kitchen = 3,
		/obj/item/material/kitchen/rollingpin = 2,
		/obj/item/serving_bowl = 20,
		/obj/item/reagent_containers/food/drinks/pitcher = 2,
		/obj/item/reagent_containers/food/drinks/flask/vacuumflask = 4,
		/obj/item/reagent_containers/food/drinks/glass2/coffeecup = 8,
		/obj/item/reagent_containers/food/drinks/glass2/coffeecup/teacup = 8,
		/obj/item/reagent_containers/food/drinks/glass2/carafe = 2,
		/obj/item/reagent_containers/food/drinks/glass2/square = 8,
		/obj/item/clothing/suit/chef/classic = 2,
		/obj/item/storage/lunchbox = 3,
		/obj/item/storage/lunchbox/heart = 3,
		/obj/item/storage/lunchbox/cat = 3,
		/obj/item/storage/lunchbox/nt = 3,
		/obj/item/storage/lunchbox/mars = 3,
		/obj/item/storage/lunchbox/cti = 3,
		/obj/item/storage/lunchbox/nymph = 3,
		/obj/item/storage/lunchbox/syndicate = 3,
		/obj/item/storage/lunchbox/dais = 3,
		/obj/item/storage/lunchbox/picnic = 3,
		/obj/item/material/knife/kitchen/cleaver = 1
	)
	contraband = list(
		/obj/item/material/knife/kitchen/cleaver/bronze = 1
	)
