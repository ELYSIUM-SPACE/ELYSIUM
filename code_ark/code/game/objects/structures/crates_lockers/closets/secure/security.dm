/obj/structure/closet/secure_closet/security/ark
	name = "solfed security locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/sfp

/obj/structure/closet/secure_closet/security/ark/WillContain()
	return list(
		/obj/item/clothing/under/rank/security/ark,
		/obj/item/clothing/suit/storage/toggle/suit/sfp,
		/obj/item/clothing/gloves/sfp,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/clothing/head/helmet,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/loaded,
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/taser,
		/obj/item/device/holowarrant,
		/obj/item/clothing/shoes/jackboots/sfp,
		/obj/item/clothing/head/soft/sfp/white,
		/obj/item/clothing/head/soft/sfp/blue,
		/obj/item/clothing/accessory/armor/helmcover/sfp
	)

/obj/structure/closet/secure_closet/detective/ark
	name = "investigator's cabinet"
	req_access = list(access_forensics_lockers)
	closet_appearance = /decl/closet_appearance/secure_closet/sfp/forensics

/obj/structure/closet/secure_closet/detective/ark/WillContain()
	return list(
		/obj/item/storage/belt/holster/forensic,
		/obj/item/storage/box/evidence,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/clothing/suit/armor/vest/detective,
		/obj/item/taperoll/police,
		/obj/item/gun/projectile/pistol/sec/detective,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/reagent_containers/food/drinks/flask/detflask,
		/obj/item/storage/briefcase/crimekit,
		/obj/item/device/holowarrant,
		/obj/item/clothing/shoes/jackboots/sfp,
		/obj/item/clothing/under/rank/security/ark,
		/obj/item/clothing/suit/storage/toggle/suit/sfp,
		/obj/item/clothing/gloves/sfp,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/taser,
		/obj/item/clothing/head/soft/sfp/white,
		/obj/item/clothing/head/soft/sfp/blue,
		/obj/item/clothing/accessory/armor/helmcover/sfp
	)

/obj/structure/closet/secure_closet/warden/ark
	name = "curator's locker"
	req_access = list(access_armory)
	closet_appearance = /decl/closet_appearance/secure_closet/sfp/chief

/obj/structure/closet/secure_closet/warden/ark/WillContain()
	return list(
		/obj/item/clothing/suit/armor/vest/warden,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/clothing/glasses/sunglasses/sechud,
		/obj/item/taperoll/police,
		/obj/item/storage/box/flashbangs,
		/obj/item/storage/box/teargas,
		/obj/item/storage/belt/holster/security,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/melee/baton/loaded,
		/obj/item/gun/energy/gun,
		/obj/item/storage/box/holobadge,
		/obj/item/device/holowarrant,
		/obj/item/clothing/shoes/jackboots/sfp,
		/obj/item/clothing/under/rank/security/ark,
		/obj/item/clothing/suit/storage/toggle/suit/sfp,
		/obj/item/clothing/gloves/sfp,
		/obj/item/clothing/suit/armor/vest,
		/obj/item/clothing/head/helmet,
		/obj/item/melee/telebaton,
		/obj/item/clothing/head/soft/sfp/white,
		/obj/item/clothing/head/soft/sfp/blue,
		/obj/item/clothing/accessory/armor/helmcover/sfp
	)
