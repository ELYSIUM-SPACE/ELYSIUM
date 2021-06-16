/area/lucius
	icon = 'icons/areas.dmi'

//Second Deck (Z-1)
/area/lucius/storage
	name = "Lucius - Primary Storage"
	icon_state = "primarystorage"
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/hallway/second
	name = "Lucius - Second Deck Fore Hallway"
	icon_state = "hallF"
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/hangar
	name = "Lucius - Hangar"
	icon_state = "hangar"
	req_access = list("ACCESS_SOL_GENERAL")
	sound_env = LARGE_ENCLOSED

/area/lucius/maintenance/second
	name = "Lucius - Second Deck Aft Maintenance"
	icon_state = "maintA"
	req_access = list("ACCESS_SOL_MAINT")

/area/lucius/engineering
	name = "Lucius - Engineering"
	icon_state = "eng"
	req_access = list("ACCESS_SOL_ENG")
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/fuel
	name = "Lucius - Fuel Bay"
	icon_state = "fuel"
	req_access = list("ACCESS_SOL_ENG")
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/thrust
	name = "Lucius - Engines Bay"
	icon_state = "thrust"
	req_access = list("ACCESS_SOL_ENG")
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

//First Deck (Z-2)
/area/lucius/bridge
	name = "Lucius - Bridge"
	icon_state = "bridge"
	req_access = list("ACCESS_SOL_COMMAND")

/area/lucius/captain
	name = "Lucius - Captain's Office"
	icon_state = "captain"
	req_access = list("ACCESS_SOL_HIGH_COMMAND")
	sound_env = SMALL_ENCLOSED

/area/lucius/hallway/first/fore
	name = "Lucius - First Deck Fore Hallway"
	icon_state = "hallF"
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/hallway/first/aft
	name = "Lucius - First Deck Aft Hallway"
	icon_state = "hallA"
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/maintenance/first/port
	name = "Lucius - First Deck Port Maintenance"
	icon_state = "maintP"
	req_access = list("ACCESS_SOL_MAINT")

/area/lucius/maintenance/first/starboard
	name = "Lucius - First Deck Starboard Maintenance"
	icon_state = "maintS"
	req_access = list("ACCESS_SOL_MAINT")

/area/lucius/med
	name = "Lucius - Medbay"
	icon_state = "medbay"
	req_access = list("ACCESS_SOL_MED")

/area/lucius/crew_quarters
	name = "Lucius - Crew Quarters"
	icon_state = "crew"
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/cryo
	name = "Lucius - Cryo Bay"
	icon_state = "cryo"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list("ACCESS_SOL_GENERAL")

/area/lucius/telecomms
	name = "Lucius - Telecommunications"
	icon_state = "tcomms"
	req_access = list("ACCESS_SOL_ENG")
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

/area/lucius/atmos
	name = "Lucius - Atmospherics"
	icon_state = "atmos"
	req_access = list("ACCESS_SOL_ENG")
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/lucius/xeno
	name = "Lucius - Xenolife Bay"
	icon_state = "xeno"
	req_access = list("ACCESS_SOL_SCI")

/area/lucius/ano
	name = "Lucius - Anomalous Materials Bay"
	icon_state = "ano"
	req_access = list("ACCESS_SOL_SCI")

//SHUTTLE

/area/lucius/lazarev
	name = "Lazarev - Main Compartment"
	icon_state = "lazarev"
	req_access = list("ACCESS_SOL_GENERAL")