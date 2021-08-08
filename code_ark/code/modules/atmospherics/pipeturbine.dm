/obj/machinery/atmospherics/pipeturbine
	icon = 'code_ark/icons/obj/pipeturbine.dmi' //Fixes the overlay direction
	layer = STRUCTURE_LAYER // Fixes pipeturbine display
	connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_FUEL // Fixes fuel pipe connection

/obj/machinery/atmospherics/pipeturbine/on_update_icon()
	overlays.Cut()
	if (dP > 10)
		overlays += image(icon, "moto-turb")
	if (kin_energy > 100000)
		overlays += image(icon, "low-turb")
	if (kin_energy > 500000)
		overlays += image(icon, "med-turb")
	if (kin_energy > 1000000)
		overlays += image(icon, "hi-turb")

/obj/machinery/atmospherics/pipeturbine/Initialize() // Making sure to properly set up the pipeturbine on start
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/atmospherics/pipeturbine/LateInitialize() // Making sure to properly set up the pipeturbine on start
	..()
	if(anchored)
		if(dir & (NORTH|SOUTH))
			initialize_directions = EAST|WEST
		else if(dir & (EAST|WEST))
			initialize_directions = NORTH|SOUTH

		atmos_init()
		build_network()
		if (node1)
			node1.atmos_init()
			node1.build_network()
		if (node2)
			node2.atmos_init()
			node2.build_network()
	return

/obj/machinery/power/turbinemotor/Initialize() // Making sure to properly set up the generator on start
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/power/turbinemotor/LateInitialize() // Making sure to properly set up the generator on start
	..()
	updateConnection()
	return
