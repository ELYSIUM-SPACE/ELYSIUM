/obj/item/device/flashlight/lamp/modern
	name = "modern lamp"
	icon = 'code_ark/icons/obj/furniture.dmi'
	icon_state = "lamp"
	light_color = "#ffd48f"
	flashlight_max_bright = 0.7
	flashlight_inner_range = 1
	flashlight_outer_range = 2
	randpixel = 0
	force = 5
	var/datum/proximity_trigger/proximity_icon_trigger
	var/obstacles = list()
	var/hide_overlay = 0

/obj/item/device/flashlight/lamp/modern/floor
	name = "modern floor lamp"
	icon_state = "floor_lamp"
	flashlight_max_bright = 1
	flashlight_inner_range = 1
	flashlight_outer_range = 3
	randpixel = 0
	force = 20

/*/obj/item/device/flashlight/lamp/modern/set_flashlight()
	if (on && !proximity_icon_trigger)
		proximity_icon_trigger = new /datum/proximity_trigger/square (src, /obj/item/device/flashlight/lamp/modern/proc/AddMonitoredObstacle, /obj/item/device/flashlight/proc/set_flashlight, 1, proc_owner = src)
	if	(!on && proximity_icon_trigger)
		QDEL_NULL(proximity_icon_trigger)
	..()

/obj/item/device/flashlight/lamp/modern/Destroy()
	if(proximity_icon_trigger)
		QDEL_NULL(proximity_icon_trigger)
	for(var/atom/O in obstacles)
		RemoveObstacle(O)
	..()

/obj/item/device/flashlight/lamp/modern/proc/AddMonitoredObstacle(var/atom/obstacle)
	if(!istype(obstacle, /mob))
		return
	obstacles += obstacle
	GLOB.moved_event.register(obstacle, src, /obj/item/device/flashlight/lamp/modern/proc/CheckObstacle)
	GLOB.destroyed_event.register(obstacle, src, /obj/item/device/flashlight/lamp/modern/proc/RemoveObstacle)
	hide_overlay = 1
	update_icon()

/obj/item/device/flashlight/lamp/modern/proc/CheckObstacle(var/atom/obstacle)
	if(obstacle.loc != src.loc)
		RemoveObstacle(obstacle)

/obj/item/device/flashlight/lamp/modern/proc/RemoveObstacle(var/atom/obstacle)
	GLOB.moved_event.unregister(obstacle, src, /obj/item/device/flashlight/lamp/modern/proc/CheckObstacle)
	GLOB.destroyed_event.unregister(obstacle, src, /obj/item/device/flashlight/lamp/modern/proc/RemoveObstacle)
	obstacles -= obstacle
	if(!length(obstacles))
		hide_overlay = 0
		update_icon()*/

/obj/item/device/flashlight/lamp/modern/on_update_icon()
	overlays.Cut()
	var/image/I
	if(on && !hide_overlay)
		I = image(icon, "[icon_state]_overlay")
		I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		I.layer = ABOVE_LIGHTING_LAYER
		overlays |= I
	..()
