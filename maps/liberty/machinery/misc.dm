// DRONE FABRICATORS

/obj/machinery/drone_fabricator/liberty
	fabricator_tag = "TTH Liberty Maintenance"

/obj/machinery/drone_fabricator/liberty/adv
	name = "advanced drone fabricator"
	fabricator_tag = "TTH Liberty Maintenance"
	drone_type = /mob/living/silicon/robot/drone/construction

// VENDORS

/obj/machinery/vending/medical/liberty
	req_access = list() // ADD ACCESS

// FAX

/obj/machinery/photocopier/faxmachine
  send_access = list() // ADD ACCESS

// ENGINERRING MACHINERY

/obj/machinery/atmospherics/unary/heater
	connect_types = CONNECT_TYPE_REGULAR|CONNECT_TYPE_FUEL

// BRIG CELLS FIX
/obj/machinery/door_timer
	layer = ABOVE_WINDOW_LAYER