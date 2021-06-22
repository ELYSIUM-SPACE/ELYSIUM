/******
Closets
******/

/obj/structure/closet/secure_closet/explo_gun
	name = "gun locker"
	desc = "Wall locker holding the boomstick."
	req_access = list(access_sol_exp)
	closet_appearance = /decl/closet_appearance/wall/explo_gun
	density = 0
	anchored = 1
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS

/obj/structure/closet/secure_closet/explo_gun/WillContain()
	return list(
		/obj/item/storage/box/ammo/explo_shells = 3,
		/obj/item/gun/projectile/shotgun/pump/exploration
	)

/decl/closet_appearance/wall/explo_gun
	color = COLOR_GRAY20
	decals = null
	can_lock = 1
	extra_decals = list(
		"stripe_outer" = COLOR_PURPLE
	)
