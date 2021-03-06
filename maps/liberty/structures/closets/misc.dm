/decl/closet_appearance/secure_closet/sol
	color = COLOR_BABY_BLUE
	extra_decals = list(
		"stripe_vertical_mid_full" =  COLOR_OFF_WHITE
	)

/decl/closet_appearance/secure_closet/sol/rep
	color = COLOR_BABY_BLUE
	extra_decals = list(
		"stripe_vertical_left_full" =  COLOR_OFF_WHITE,
		"stripe_vertical_right_full" =  COLOR_OFF_WHITE
	)

/decl/closet_appearance/secure_closet/sol/corporate
	color = COLOR_BOTTLE_GREEN
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_OFF_WHITE
	)

/*/decl/closet_appearance/secure_closet/torch/corporate/liaison
	extra_decals = list(
		"stripe_vertical_left_full" =  COLOR_OFF_WHITE,
		"stripe_vertical_right_full" = COLOR_OFF_WHITE,
		"command" = COLOR_OFF_WHITE
	)

/obj/structure/closet/secure_closet/liaison
	name = "\improper corporate liaison's locker"
	req_access = list(access_liaison)
	closet_appearance = /decl/closet_appearance/secure_closet/torch/corporate/liaison

/obj/structure/closet/secure_closet/liaison/WillContain()
	return list(
		/obj/item/device/flash,
		/obj/item/weapon/material/clipboard,
		/obj/item/weapon/folder,
		/obj/item/device/tape/random = 3,
		/obj/item/weapon/storage/secure/briefcase,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/under/rank/internalaffairs/plain/nt,
		/obj/item/clothing/suit/storage/toggle/suit/black,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/weapon/storage/belt/general,
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack, /obj/item/weapon/storage/backpack/satchel)),
		new /datum/atom_creator/simple(/obj/item/weapon/storage/backpack/messenger, 50),
		/obj/item/weapon/storage/fakebook,
		/obj/item/device/radio/headset/heads/torchntcommand,
		/obj/item/device/radio/headset/heads/torchntcommand/alt
	)

/decl/closet_appearance/secure_closet/torch/corporate/bodyguard
	extra_decals = list(
		"stripe_vertical_left_full" =  COLOR_OFF_WHITE,
		"stripe_vertical_right_full" = COLOR_OFF_WHITE,
		"security" = COLOR_OFF_WHITE
	)

/obj/structure/closet/secure_closet/bodyguard
	name = "\improper corporate protection locker"
	req_access = list(access_sec_guard)
	closet_appearance = /decl/closet_appearance/secure_closet/torch/corporate/bodyguard

/obj/structure/closet/secure_closet/bodyguard/WillContain()
	return list(
		/obj/item/device/flash,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/weapon/gun/energy/gun/secure/corporate,
		/obj/item/weapon/storage/secure/briefcase,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/under/rank/internalaffairs/plain/nt,
		/obj/item/clothing/suit/storage/toggle/suit/black,
		/obj/item/clothing/gloves/color/black,
		/obj/item/clothing/head/helmet/nt/guard,
		/obj/item/clothing/suit/armor/pcarrier/medium/nt,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/clothing/accessory/badge/nanotrasen,
		/obj/item/device/radio/headset/heads/torchcorp,
		/obj/item/device/radio/headset/heads/torchcorp/alt,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/weapon/storage/belt/holster/general,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/radio,
		/obj/item/weapon/crowbar/prybar
	)*/

/obj/structure/closet/secure_closet/sol_representative
	name = "\improper Sol Central Government representative's locker"
	req_access = list(access_sol_diplomacy)
	closet_appearance = /decl/closet_appearance/secure_closet/sol/rep

/obj/structure/closet/secure_closet/sol_representative/WillContain()
	return list(
		/obj/item/device/flash,
		/obj/item/device/camera_film = 2,
		/obj/item/material/clipboard,
		/obj/item/folder,
		/obj/item/device/tape/random = 3,
		/obj/item/storage/secure/briefcase,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/under/rank/internalaffairs/plain/solgov,
		/obj/item/clothing/suit/storage/toggle/suit/black,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/storage/belt/general,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel)),
		new /datum/atom_creator/simple(/obj/item/storage/backpack/messenger, 50)
	)

//equipment closets that everyone on the crew or in research can access, for storing things securely

/obj/structure/closet/secure_closet/sol_crew
	name = "crew equipment locker"
	req_access = list(access_sol_general)
	closet_appearance = /decl/closet_appearance/secure_closet/sol

/obj/structure/closet/secure_closet/sol_crew/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/crowbar,
		/obj/item/device/flashlight,
		/obj/item/storage/box
	)

/*/obj/structure/closet/secure_closet/crew/research // UNUSED
	name = "research equipment locker"
	req_access = list(access_nanotrasen)
	closet_appearance = /decl/closet_appearance/secure_closet/sol/corporate*/


/obj/structure/closet/secure_closet/guncabinet/sol_sidearm
	name = "sidearm cabinet"
	req_access = list(list(access_sol_command, access_sol_sec)) //VERIFY

/obj/structure/closet/secure_closet/guncabinet/sol_sidearm/WillContain()
	return list(
			/obj/item/clothing/accessory/storage/holster/thigh = 2,
			/obj/item/gun/energy/gun/secure = 3,
	)

/obj/structure/closet/secure_closet/guncabinet/sol_sidearm/small
	name = "personal sidearm cabinet"

/obj/structure/closet/secure_closet/guncabinet/sidearm/small/WillContain()
	return list(/obj/item/gun/energy/gun/small/secure = 4)

/obj/structure/closet/secure_closet/guncabinet/sol_sidearm/combined
	name = "combined sidearm cabinet"

/obj/structure/closet/secure_closet/guncabinet/sol_sidearm/combined/WillContain()
	return list(
		/obj/item/storage/belt/holster/general = 3,
		/obj/item/gun/energy/gun/secure = 3,
		/obj/item/gun/energy/gun/small/secure = 1,
	)

/obj/structure/closet/secure_closet/guncabinet/sol_PPE //VERIFY
	name = "Bridge PPE cabinet"
	req_access = list(access_sol_command)

/obj/structure/closet/secure_closet/guncabinet/sol_PPE/WillContain()
	return list(
		/obj/item/gun/energy/gun/small/secure = 3,
		/obj/item/clothing/suit/armor/pcarrier/medium/command = 3,
		/obj/item/clothing/head/helmet/solgov/command = 3
	)
