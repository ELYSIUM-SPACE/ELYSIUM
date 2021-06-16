/obj/item/reagent_containers/food/drinks/verb/gulp_down()
	set name = "Gulp down"
	set category = "Object"
	set src in usr

	if(!(usr.get_active_hand() == src) && !(usr.get_inactive_hand() == src))
		return

	if(cannot_interact(usr))
		return

	if(!is_open_container())
		open()

	while(reagents && reagents.total_volume)
		if(do_after(usr, 10, src) && reagents && reagents.total_volume)
			standard_feed_mob(usr, usr)
		else
			return
		if(cannot_interact(usr))
			return
