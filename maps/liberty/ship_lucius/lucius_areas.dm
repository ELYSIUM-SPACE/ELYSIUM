/area/lucius
	icon = 'icons/areas.dmi'

//Second Deck (Z-1)
/area/lucius/storage
	name = "SEV Lucius - Primary Storage"
	icon_state = "primarystorage"
	req_access = list(access_sol_general)

/area/lucius/hallway/second
	name = "SEV Lucius - Second Deck Fore Hallway"
	icon_state = "hallF"
	req_access = list(access_sol_general)

/area/lucius/hangar
	name = "SEV Lucius - Hangar"
	icon_state = "hangar"
	req_access = list(access_sol_general)
	sound_env = LARGE_ENCLOSED
	base_turf = /turf/simulated/floor/plating

/area/lucius/maintenance/second
	name = "SEV Lucius - Second Deck Aft Maintenance"
	icon_state = "maintA"
	req_access = list(access_sol_maint)

/area/lucius/engineering
	name = "SEV Lucius - Engineering"
	icon_state = "eng"
	req_access = list(access_sol_eng)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/fuel
	name = "SEV Lucius - Fuel Bay"
	icon_state = "fuel"
	req_access = list(access_sol_eng)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/thrust
	name = "SEV Lucius - Engines Bay"
	icon_state = "thrust"
	req_access = list(access_sol_eng)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

//First Deck (Z-2)
/area/lucius/bridge
	name = "SEV Lucius - Bridge"
	icon_state = "bridge"
	req_access = list(access_sol_command)

/area/lucius/captain
	name = "SEV Lucius - Captain's Office"
	icon_state = "captain"
	req_access = list(access_sol_high_command)
	sound_env = SMALL_ENCLOSED

/area/lucius/hallway/first/fore
	name = "SEV Lucius - First Deck Fore Hallway"
	icon_state = "hallF"
	req_access = list(access_sol_general)

/area/lucius/hallway/first/aft
	name = "SEV Lucius - First Deck Aft Hallway"
	icon_state = "hallA"
	req_access = list(access_sol_general)

/area/lucius/maintenance/first/port
	name = "SEV Lucius - First Deck Port Maintenance"
	icon_state = "maintP"
	req_access = list(access_sol_maint)

/area/lucius/maintenance/first/starboard
	name = "SEV Lucius - First Deck Starboard Maintenance"
	icon_state = "maintS"
	req_access = list(access_sol_maint)

/area/lucius/med
	name = "SEV Lucius - Medbay"
	icon_state = "medbay"
	req_access = list(access_sol_med)

/area/lucius/crew_quarters
	name = "SEV Lucius - Crew Quarters"
	icon_state = "crew"
	req_access = list(access_sol_general)

/area/lucius/cryo
	name = "SEV Lucius - Cryo Bay"
	icon_state = "cryo"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_sol_general)

/area/lucius/telecomms
	name = "SEV Lucius - Telecommunications"
	icon_state = "tcomms"
	req_access = list(access_sol_eng)
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/lucius/atmos
	name = "SEV Lucius - Atmospherics"
	icon_state = "atmos"
	req_access = list(access_sol_eng)
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/xeno
	name = "SEV Lucius - Xenolife Bay"
	icon_state = "xeno"
	req_access = list(access_sol_sci)

/area/lucius/ano
	name = "SEV Lucius - Anomalous Materials Bay"
	icon_state = "ano"
	req_access = list(access_sol_sci)

//SHUTTLE

/area/lucius/lazarev
	name = "MRM Lazarev - Main Compartment"
	icon_state = "lazarev"
	req_access = list(access_sol_general)
