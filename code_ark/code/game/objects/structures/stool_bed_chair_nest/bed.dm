/obj/structure/bed/double
	name = "bed"
	desc = "This is used to lie in, sleep in or strap on."
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "bed_double"
	base_icon = "bed_double"
	anchored = TRUE
	can_buckle = 1
	buckle_dir = SOUTH
	buckle_lying = 1
	buckle_pixel_shift = "x=0;y=0;z=12"

/obj/structure/bed/double/wood
	icon_state = "bed_double_wood"
	base_icon = "bed_double_wood"

/obj/structure/bed/double/wood/walnut/New(var/newloc)
	..(newloc,MATERIAL_WALNUT, MATERIAL_CLOTH)


/obj/structure/bed/double/wood/maple/New(var/newloc)
	..(newloc,MATERIAL_MAPLE, MATERIAL_CLOTH)

/obj/structure/bed/double/wood/generic/New(var/newloc)
	..(newloc,MATERIAL_WOOD, MATERIAL_CLOTH)

/obj/structure/bed/double/wood/mahogany/New(var/newloc)
	..(newloc,MATERIAL_MAHOGANY, MATERIAL_CLOTH)

/obj/structure/bed/double/nightlight
	icon_state = "bed_double_nightlight"
	base_icon = "bed_double_nightlight"
	desc = "This is used to lie in, sleep in or strap on. It has a stylish nightlight strip."

/obj/structure/bed/double/nightlight/New(var/newloc)
	..(newloc,MATERIAL_ALUMINIUM,MATERIAL_CLOTH)
	set_light(0.2, 0.5, 2, 2, "#00e7dc")
