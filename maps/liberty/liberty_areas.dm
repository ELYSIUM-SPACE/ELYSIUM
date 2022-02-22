/* sound_env options:
	STANDARD_STATION
	LARGE_ENCLOSED
	SMALL_ENCLOSED
	TUNNEL_ENCLOSED
	LARGE_SOFTFLOOR
	MEDIUM_SOFTFLOOR
	SMALL_SOFTFLOOR
	ASTEROID
	SPACE
	I have totally no idea what most of them sound like.
	Alternatively, sound ambience can be set directly in the "ambience" or "forced_ambience" variable. */

////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// TECHNICAL /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

/area/liberty
	icon = 'maps/liberty/icons/area.dmi'

// Actual panels area. Not controls
/area/liberty/solar
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space
	req_access = list(engmain)

// MAINTENANCE

/area/liberty/maintenance
	sound_env = SMALL_ENCLOSED
	req_access = list(maint)

/area/liberty/maintenance/construction	// NO_APC for unit_test

/area/liberty/maintenance/lounge
	name = "\improper Level Zero - Maint Lounge"
	
	

// BRIG

/area/liberty/sfp
	req_access = list(sfpmain)

// ENGINEERING

/area/liberty/engineering
	req_access = list(engmain)

/area/liberty/engineering/substation
	sound_env = SMALL_ENCLOSED

// CARGO

/area/liberty/cargo_bay
	req_access = list(cargonia)

// MEDBAY

/area/liberty/medbay
	req_access = list(doctor)

/area/liberty/medbay/ward
	sound_env = SMALL_SOFTFLOOR

// PSYCHOLOGIST

/area/liberty/psychologist
	sound_env = MEDIUM_SOFTFLOOR

// HOTEL

/area/liberty/hotel/room
	sound_env = SMALL_SOFTFLOOR

/area/liberty/hotel/hallway
	sound_env = MEDIUM_SOFTFLOOR

// CHAPEL

/area/liberty/chapel
	ambience = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg','sound/music/traitor.ogg')

// DIRECTOR

/area/liberty/director
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(bigboss)

////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// LEVEL ZERO ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

// SOLAR

/area/liberty/solar/zero
	name = "\improper Level Zero - Solar Array"
	icon_state = "eng_solar_00_array"

// MAINTENANCE

/area/liberty/maintenance/zero
	name = "\improper Level Zero - Emergency Storage"
	icon_state = "emergency_storage_00"


/area/liberty/maintenance/zero/hangar
	name = "\improper Maintenance - Level Zero - Hangar"
	icon_state = "maintance_zero_hangar"

/area/liberty/maintenance/zero/engineering
	name = "\improper Maintenance - Level Zero - Engineering"
	icon_state = "maintance_zero_engineering"

/area/liberty/maintenance/zero/port
	name = "\improper Maintenance - Level Zero - Port"
	icon_state = "maintance_zero_port"

/area/liberty/maintenance/zero/monitoring
	name = "\improper Aux Station Monitoring"
	icon_state = "abandoned_aux_station_monitoring"

/area/liberty/maintenance/zero/casino
	name = "\improper Maintenance - Level Zero - Casino"
	icon_state = "maintance_zero_casino"
/area/liberty/maintenance/zero/aft
	name = "\improper Maintenance - Level Zero - Port"
	icon_state = "maintance_zero_aft"

/area/liberty/maintenance/zero/laundry
	name = "\improper Level Zero - Abandoned Laundry"
	icon_state = "abandoned_laundry"

/area/liberty/maintenance/zero/solitary
	name = "\improper SFP Field Office - Solitary"
	icon_state = "abandoned_solitary"

/area/liberty/maintenance/zero/brig
	name = "\improper Maintenance - Level Zero - SFP"
	icon_state = "maintance_zero_sfp_office"

/area/liberty/maintenance/zero/fore_port
	name = "\improper Maintenance - Level Zero - Fore Port"
	icon_state = "maintance_zero_fore_port"

/area/liberty/maintenance/construction/zero/chapel
	name = "\improper Level Zero - Abandoned Chapel"
	icon_state = "abandoned_chapel_zero"

/area/liberty/maintenance/construction/zero/shop
	name = "\improper Level Zero - Abandoned Shop"
	icon_state = "abandoned_shop"

// HALLWAYS

/area/liberty/hallway/zero
	name = "\improper Level Zero - Central Hallway"
	icon_state = "lvl_0_hall_center"

/area/liberty/hallway/zero/starboard
	name = "\improper Level Zero - Starboard Hallway"
	icon_state = "lvl_0_hall_starboard"

/area/liberty/hallway/zero/fore
	name = "\improper Level Zero - Fore Hallway"
	icon_state = "lvl_0_hall_fore"

/area/liberty/hallway/zero/port_docks
	name = "\improper Level Zero - Port Docks"
	icon_state = "lvl_0_port_docks"

// HANGAR

/area/liberty/hangar
	name = "\improper Hangar Bay"
	icon_state = "hangar"
	req_access = list(hangar)

/area/liberty/hangar/canister_storage
	name = "\improper Aux Fuel Storage"
	icon_state = "hangar_canister_storage"

// CARGO

/area/liberty/cargo_bay/zero
	name = "\improper Cargo - Warehouse"

/area/liberty/cargo_bay/zero/mailroom
	name = "\improper Cargo - Mailroom"
	icon_state = "cargo_mailroom"

/area/liberty/cargo_bay/zero/fuel_bay
	name = "\improper Cargo - Fuel Bay"
	icon_state = "cargo_fuel_bay"

/area/liberty/cargo_bay/zero/train
	name = "\improper Cargo - Cargotrain Garage"
	icon_state = "cargo_train_storage"

/area/liberty/cargo_bay/zero/public_storage
	name = "\improper Cargo - Public Warehouse"
	icon_state = "cargo_primary_public_warehouse"
	//req_access = list() uncomment for free access

/area/liberty/cargo_bay/zero/public_storage/second
	name = "\improper Cargo - Secondary Public Warehouse"
	icon_state = "cargo_secondary_public_warehouse"

// HOTEL

/area/liberty/hotel/casino
	name = "\improper Hotel - Casino"
	icon_state = "hotel_casino"
	sound_env = LARGE_SOFTFLOOR

/area/liberty/hotel/pool
	name = "\improper Hotel - Swiming Pool"
	icon_state = "hotel_pool"
	sound_env = LARGE_ENCLOSED

/area/liberty/hotel/hallway/lower
	name = "\improper Hotel - Lower Hallway"
	icon_state = "hotel_lower_hall"

/area/liberty/hotel/sauna
	name = "\improper Hotel - Sauna"
	icon_state = "hotel_sauna"
	sound_env = SMALL_SOFTFLOOR

/area/liberty/hotel/gym
	name = "\improper Hotel - Gym"
	icon_state = "hotel_gym"

/area/liberty/hotel/locker_room_m
	name = "\improper Hotel - Locker Room (Male)"
	icon_state = "hotel_lock_m"

/area/liberty/hotel/locker_room_f
	name = "\improper Hotel - Locker Room (Female)"
	icon_state = "hotel_lock_f"

// BRIG

/area/liberty/sfp/hallway/zero
	name = "\improper SFP Field Office - Level Zero Hallway"
	icon_state = "department_lvl0"

/area/liberty/sfp/cells
	name = "\improper SFP Field Office - Holding Cells"
	icon_state = "department_cell"

/area/liberty/sfp/prison
	name = "\improper SFP Field Office - Long Term Cell"
	icon_state = "department_prison"

/area/liberty/sfp/laboratory
	name = "\improper SFP Field Office - Forensic Laboratory"
	icon_state = "department_laboratory"
	req_access = list(sfplaba)

/area/liberty/sfp/morgue
	name = "\improper SFP Field Office - Morgue"
	icon_state = "department_morgue"
	sound_env = LARGE_ENCLOSED

/area/liberty/sfp/archive
	name = "\improper SFP Field Office - Archive"
	icon_state = "department_archive"

// ENGINEERING

/area/liberty/engineering/atmos
	name = "\improper Engineering - Atmospherics"
	icon_state = "eng_atmos"
	req_access = list(engatmos)

/area/liberty/engineering/canister_storage
	name = "\improper Engineering - Canister Storage"
	icon_state = "eng_canister_storage"

/area/liberty/engineering/engine_monitoring_room
	name = "\improper Engineering - Engine Monitoring Room"
	icon_state = "eng_engine_monitoring_room"
	req_access = list(engpower)

/area/liberty/engineering/engine_room
	name = "\improper Engineering - Supermatter Chamber"
	icon_state = "eng_engine_room"
	requires_power = FALSE
	req_access = list(engpower)

/area/liberty/engineering/hallway/engineering_hall_level_zero
	name = "\improper Engineering - Hallway Level Zero"
	icon_state = "eng_hall_00"

/area/liberty/engineering/engineering_prep_room
	name = "\improper Engineering - Prep Room"
	icon_state = "eng_prep_room"

/area/liberty/engineering/substation/substation_level_zero
	name = "\improper Engineering - Substation Level Zero"
	icon_state = "eng_substation_00"

/area/liberty/engineering/restroom
	name = "\improper Engineering - Restroom"
	icon_state = "eng_restroom"

/area/liberty/engineering/shower
	name = "\improper Engineering - Shower"
	icon_state = "eng_shower"

/area/liberty/engineering/primary_storage // склад, что находится над атмосом
	name = "\improper Engineering - Primary Storage"
	icon_state = "eng_primary_storage"

/area/liberty/engineering/solar/engineering_solar_level_zero
	name = "\improper Engineering - Solar Level Zero"
	icon_state = "eng_solar_00"

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// LEVEL ONE ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// MAINTENANCE

/area/liberty/maintenance/one
	name = "\improper Maintenance - Level One - Central"
	icon_state = "maintance_one_central"

/area/liberty/maintenance/one/aft
	name = "\improper Maintenance - Level One - Aft"
	icon_state = "maintance_one_aft"

/area/liberty/maintenance/one/fore_port
	name = "\improper Maintenance - Level One - Fore Port"
	icon_state = "maintance_one_fore_port"

/area/liberty/maintenance/one/aft_port
	name = "\improper Maintenance - Level One - Aft Port"
	icon_state = "maintance_one_aft_port"

/area/liberty/maintenance/one/chapel
	name = "\improper Level One - Abandoned Chapel"
	icon_state = "abandoned_chapel_one"

/area/liberty/maintenance/one/shower
	name = "\improper Level One - Abandoned Bathroom"
	icon_state = "abandoned_bathroom"

/area/liberty/maintenance/one/mechbay
	name = "\improper Level One - Abandoned Mech Bay"
	icon_state = "abandoned_mechbay"

/area/liberty/maintenance/one/fore_starboard
	name = "\improper Maintenance - Level One - Fore Starboard"
	icon_state = "maintance_one_fore_starboard"

/area/liberty/maintenance/one/aft_starboard
	name = "\improper Maintenance - Level One - Aft Starboard"
	icon_state = "maintance_one_aft_starboard"

/area/liberty/maintenance/construction/zero/medbay
	name = "\improper Level Zero - Abandoned Medbay"
	icon_state = "abandoned_medbay"

// SHOPPING HALL

/area/liberty/shopping
	name = "\improper Shopping Hall"
	icon_state = "shop_hall"

/area/liberty/shopping/keeper
	name = "\improper Shop Keeper"
	icon_state = "shop_keeper"
	req_access = list(shop)

/area/liberty/shopping/backroom
	name = "\improper Shop Backroom"
	icon_state = "shop_backroom"
	req_access = list(shop)

// RESEARCH

/area/liberty/rnd
	name = "\improper RnD - Shop"
	icon_state = "rnd_shop"

/area/liberty/rnd/equip
	name = "\improper RnD - Equipment Storage"
	icon_state = "rnd_equipment_storage"
	req_access = list(rndshop)

/area/liberty/rnd/hallway
	name = "\improper RnD - Hallway"
	icon_state = "rnd_hallway"
	req_access = list(rndshop)

/area/liberty/rnd/robotics
	name = "\improper RnD - Robotics Lower"
	icon_state = "rnd_robotics_lower"
	req_access = list(rndbot)

/area/liberty/rnd/rnd
	name = "\improper RnD - Development Lab"
	icon_state = "rnd_devlab"
	req_access = list(rndshop)

/area/liberty/rnd/operating
	name = "\improper RnD - Robotics Operating Room"
	icon_state = "rnd_robotics_operating_room"
	req_access = list(rndbot)

/area/liberty/rnd/professor_office
	name = "\improper RnD - Professor's Office"
	icon_state = "rnd_professor"
	req_access = list(rndboss)

/area/liberty/rnd/breakroom
	name = "\improper RnD - Breakroom"
	icon_state = "rnd_breakroom"


// HANGAR

/area/liberty/hangar/tower
	name = "\improper Traffic Tower"
	icon_state = "hangar_tower"

// CARGO

/area/liberty/cargo_bay/one
	name = "\improper Cargo - Elevator"
	icon_state = "cargo_elevator"

/area/liberty/cargo_bay/one/office
	name = "\improper Cargo - Office"
	icon_state = "cargo_office"

/area/liberty/cargo_bay/one/quartermaster
	name = "\improper Cargo - Quartermaster"
	icon_state = "cargo_quartermaster"
	req_access = list(cargoboss)

/area/liberty/cargo_bay/one/waiting_room
	name = "\improper Cargo - Waiting Room"
	icon_state = "cargo_waiting_room"

/area/liberty/cargo_bay/one/breakroom
	name = "\improper Cargo - Breakroom"
	icon_state = "cargo_breakroom"

// MEDBAY

/area/liberty/medbay/reception
	name = "\improper Medbay - Reception"
	icon_state = "medbay_reception"

/area/liberty/medbay/chemistry
	name = "\improper Medbay - Chemistry Lab"
	icon_state = "medbay_chemistry"
	req_access = list(farma)

/area/liberty/medbay/exam
	name = "\improper Medbay - Examination Room"
	icon_state = "medbay_exam"

/area/liberty/medbay/emergency
	name = "\improper Medbay - Emergency Treatment Center"
	icon_state = "medbay_emergency"

/area/liberty/medbay/preop_ward
	name = "\improper Medbay - Preoperating Ward"
	icon_state = "medbay_preop_ward"

/area/liberty/medbay/operating
	name = "\improper Medbay - Operating Room"
	icon_state = "medbay_operating"

/area/liberty/medbay/operating_storage
	name = "\improper Medbay - Operating Room Storage"
	icon_state = "medbay_operating_storage"
	sound_env = SMALL_ENCLOSED

/area/liberty/medbay/hallway/one
	name = "\improper Medbay - Level One Hallway"
	icon_state = "medbay_lvl1"

// HOTEL

/area/liberty/hotel/restaurant
	sound_env = LARGE_SOFTFLOOR

/area/liberty/hotel/restaurant/main
	name = "\improper Hotel - Restraurant Main Level"
	icon_state = "hotel_restaurant"

/area/liberty/hotel/toilet
	name = "\improper Hotel - Restroom"
	icon_state = "hotel_toilets"

/area/liberty/hotel/kitchen
	name = "\improper Hotel - Kitchen"
	icon_state = "hotel_kitchen"
	req_access = list(kitchen)

/area/liberty/hotel/freezer
	name = "\improper Hotel - Freezer"
	icon_state = "hotel_freezer"
	req_access = list(kitchen)

/area/liberty/hotel/administrator
	name = "\improper Hotel - Administrator's Office"
	icon_state = "hotel_administrator"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(hadmin)

/area/liberty/hotel/foyer
	name = "\improper Hotel - Foyer"
	icon_state = "hotel_foyer"
	sound_env = LARGE_SOFTFLOOR

/area/liberty/hotel/staff_room
	name = "\improper Hotel - Staff Room"
	icon_state = "hotel_staff_room"
	req_access = list(hstaff)

/area/liberty/hotel/hallway/staff
	name = "\improper Hotel - Service Hallway"
	icon_state = "hotel_staff_hall"
	req_access = list(hstaff)

// HYDROPONICS

/area/liberty/hydroponics
	name = "\improper Level One - Hydroponics"
	icon_state = "hydroponics"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_hydroponics)

// BRIG

/area/liberty/sfp/aft_checkpoint
	name = "\improper Level One - Aft Docks Checkpoint"
	icon_state = "aft_docks_checkpoint"

/area/liberty/sfp/lobby
	name = "\improper SFP Field Office - Lobby"
	icon_state = "department_lobby"

/area/liberty/sfp/office
	name = "\improper SFP Field Office - Office"
	icon_state = "department_working_space"

/area/liberty/sfp/interrogation
	name = "\improper SFP Field Office - Interrogation"
	icon_state = "department_interrogation"
	sound_env = SMALL_ENCLOSED

/area/liberty/sfp/recreation
	name = "\improper SFP Field Office - Break Room"
	icon_state = "department_recreation"
	sound_env = SMALL_SOFTFLOOR

/area/liberty/sfp/chief
	name = "\improper SFP Field Office - Supervisor Office"
	icon_state = "department_chief"
	req_access = list(sfphos)

/area/liberty/sfp/reception
	name = "\improper SFP Field Office - Reception"
	icon_state = "department_reception"

/area/liberty/sfp/armory
	name = "\improper SFP Field Office - Armory"
	icon_state = "department_armory"
	req_access = list(sfparmory)

/area/liberty/sfp/dorm
	name = "\improper SFP Field Office - Dormitory"
	icon_state = "department_dorm"

/area/liberty/sfp/hallway/one_north
	name = "\improper SFP Field Office - Level One North Hallway"
	icon_state = "department_lvl1n"

/area/liberty/sfp/hallway/one_south
	name = "\improper SFP Field Office - Level One South Hallway"
	icon_state = "department_lvl1s"

/area/liberty/sfp/server
	name = "\improper SFP Field Office - Server Room"
	icon_state = "department_server"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')

// SCG

/area/liberty/scg
	req_access = list(list("ACCESS_SOL_SFP", "ACCESS_SOL_GENERAL"))

/area/liberty/scg/docks
	name = "\improper SCG Secure Docks"
	icon_state = "sol_docks"
	req_access = list(scgdocks)

// HALLWAYS

/area/liberty/hallway/one
	name = "\improper Level One - Central Hallway"
	icon_state = "lvl_1_central_hall"
	sound_env = LARGE_ENCLOSED

/area/liberty/hallway/one/aft_port
	name = "\improper Level One - Aft Port Hallway"
	icon_state = "lvl_1_southwest_hall"

/area/liberty/hallway/one/fore_port
	name = "\improper Level One - Fore Port Hallway"
	icon_state = "lvl_1_northwest_hall"

/area/liberty/hallway/one/starboard
	name = "\improper Level One - Fore Port Hallway"
	icon_state = "lvl_1_east_hall"

/area/liberty/hallway/one/aft_terminal
	name = "\improper Level One - Aft Terminal"
	icon_state = "lvl_1_south_terminal"

/area/liberty/hallway/one/fore_terminal
	name = "\improper Level One - Fore Terminal"
	icon_state = "lvl_1_north_terminal"

/area/liberty/hallway/one/aft_docks
	name = "\improper Level One - Aft Docks"
	icon_state = "lvl_1_south_docks"

/area/liberty/hallway/one/fore_docks
	name = "\improper Level One - Fore Docks"
	icon_state = "lvl_1_north_docks"

// ENGINEERING

/area/liberty/engineering/substation/substation_level_one
	name = "\improper Engineering - Substation Level One"
	icon_state = "eng_substation_01"

/area/liberty/engineering/hard_storage
	name = "\improper Engineering - Hard Storage"
	icon_state = "eng_hard_storage"

/area/liberty/engineering/substation/substation_main
	name = "\improper Engineering - Substation Main"
	icon_state = "eng_substation_main"

/area/liberty/engineering/supermatter_tegs
	name = "\improper Engineering - Supermatter Tegs"
	icon_state = "eng_supermatter_tegs"
	req_access = list(engpower)

/area/liberty/engineering/technical_storage
	name = "\improper Engineering - Technical Storage"
	icon_state = "eng_technical_storage"

/area/liberty/engineering/hallway/engineering_hall_level_one
	name = "\improper Engineering - Hallway level one"
	icon_state = "eng_hall_01"

/area/liberty/engineering/breakroom
	name = "\improper Engineering - Breakroom"
	icon_state = "eng_break"

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// LEVEL TWO ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// HALLWAY

/area/liberty/hallway/two
	name = "\improper Level Two - Central Hallway"
	icon_state = "lvl_2_hall_central"

/area/liberty/hallway/two/fore
	name = "\improper Level Two - Fore Hallway"
	icon_state = "lvl_2_hall_fore"

/area/liberty/hallway/two/aft
	name = "\improper Level Two - Aft Hallway"
	icon_state = "lvl_2_hall_aft"

// RESEARCH

/area/liberty/rnd/robotics/upper
	name = "\improper RnD - Robotics Upper"
	icon_state = "rnd_robotics_upper"
	req_access = list(rndbot)

/area/liberty/rnd/toxins
	name = "\improper RnD - Toxins Lab"
	icon_state = "rnd_toxlab"
	req_access = list(rndshop)

/area/liberty/rnd/toxins/storage
	name = "\improper RnD - Toxins Storage"
	icon_state = "rnd_toxstorage"
	req_access = list(rndshop)

/area/liberty/rnd/toxins/misc
	name = "\improper RnD - Toxins Testing Facility"
	icon_state = "rnd_toxtest"
	req_access = list(rndshop)

// MEDBAY

/area/liberty/medbay/hallway/two
	name = "\improper Medbay - Level Two Hallway"
	icon_state = "medbay_lvl2"

/area/liberty/medbay/storage
	name = "\improper Medbay - Storage"
	icon_state = "medbay_storage"

/area/liberty/medbay/oncall_room
	name = "\improper Medbay - On-Call Room"
	icon_state = "medbay_oncall_room"

/area/liberty/medbay/locker_room
	name = "\improper Medbay - Locker Room"
	icon_state = "medbay_locker_room"

/area/liberty/medbay/cmo
	name = "\improper Medbay - Chief Medical Officer"
	icon_state = "medbay_cmo"
	req_access = list(chmo)

/area/liberty/medbay/ward/one
	name = "\improper Medbay - Ward One"
	icon_state = "medbay_ward1"

/area/liberty/medbay/ward/two
	name = "\improper Medbay - Ward Two"
	icon_state = "medbay_ward2"

/area/liberty/medbay/ward/three
	name = "\improper Medbay - Ward Three"
	icon_state = "medbay_ward3"

// HOTEL

/area/liberty/hotel/restaurant/upper
	name = "\improper Hotel - Restraurant Upper Level"
	icon_state = "hotel_restaurant_lvl2"

/area/liberty/hotel/room/one_zero_one
	name = "\improper Hotel - Room 101"
	icon_state = "hotel_room_101"

/area/liberty/hotel/room/one_zero_two
	name = "\improper Hotel - Room 102"
	icon_state = "hotel_room_102"

/area/liberty/hotel/room/one_zero_three
	name = "\improper Hotel - Room 103"
	icon_state = "hotel_room_103"

/area/liberty/hotel/room/one_zero_four
	name = "\improper Hotel - Room 104"
	icon_state = "hotel_room_104"

/area/liberty/hotel/room/two_zero_one
	name = "\improper Hotel - Room 201"
	icon_state = "hotel_room_201"

/area/liberty/hotel/room/two_zero_two
	name = "\improper Hotel - Room 202"
	icon_state = "hotel_room_202"

/area/liberty/hotel/room/three_zero_one
	name = "\improper Hotel - Room 301"
	icon_state = "hotel_room_301"

/area/liberty/hotel/room/three_zero_two
	name = "\improper Hotel - Room 302"
	icon_state = "hotel_room_302"

/area/liberty/hotel/room/three_zero_three
	name = "\improper Hotel - Room 303"
	icon_state = "hotel_room_303"

/area/liberty/hotel/hallway/west
	name = "\improper Hotel - West Hallway"
	icon_state = "hotel_west"

/area/liberty/hotel/hallway/east
	name = "\improper Hotel - East Hallway"
	icon_state = "hotel_east"

/area/liberty/hotel/dorm
	name = "\improper Hotel - Dormitory"
	icon_state = "hotel_dorm"
	sound_env = MEDIUM_SOFTFLOOR

/area/liberty/hotel/warehouse
	name = "\improper Hotel - Warehouse"
	icon_state = "hotel_warehouse"
	sound_env = SMALL_ENCLOSED
	req_access = list(hstaff)

/area/liberty/hotel/dressing_room
	name = "\improper Hotel - Dressing Room"
	icon_state = "hotel_dressing_room"
	sound_env = SMALL_SOFTFLOOR

/area/liberty/hotel/over_stage
	name = "\improper Hotel - Stage Equipment"
	icon_state = "hotel_stage"
	req_access = list(hstaff)

// CHAPEL

/area/liberty/chapel/lobby
	name = "\improper Chapel - Lobby"
	icon_state = "chapel_lobby"

/area/liberty/chapel/main
	name = "\improper Chapel - Main Hall"
	icon_state = "chapel_main_hall"
	sound_env = LARGE_ENCLOSED

/area/liberty/chapel/funeral_room
	name = "\improper Chapel - Funeral Room"
	icon_state = "chapel_funeral_room"

/area/liberty/chapel/office
	name = "\improper Chapel - Chaplain's Office"
	icon_state = "chapel_office"
	req_access = list(chapl)

// PRIVATE EYE

/area/liberty/private_eye
	name = "\improper Private Eye's Office"
	icon_state = "private_eye"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(priveye)

// PSYCHOLOGIST

/area/liberty/psychologist/waiting_room
	name = "\improper Psychologist - Waiting Room"
	icon_state = "psych_waiting_room"

/area/liberty/psychologist/therapy_room
	name = "\improper Psychologist - Therapy Room"
	icon_state = "psych_therapy_room"
	req_access = list(psycho)

// CONFERENCE HALL

/area/liberty/conference_room
	name = "\improper Level Two - Conference Room"
	icon_state = "conference_room"
	sound_env = LARGE_SOFTFLOOR
	req_access = list(conference)

// SCG

/area/liberty/scg/representative
	name = "\improper Level Two - SCG Representative's Office"
	icon_state = "councilor_office"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(scgoffice)

// CORPORATE
/area/liberty/corporate_office
	name = "\improper Level Two - Corporate Representative's Office"
	icon_state = "corporate_office"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(corpoffice)

// LIBRARY

/area/liberty/library
	name = "\improper Level Two - Library"
	icon_state = "library"
	sound_env = LARGE_SOFTFLOOR

// LAUNDRY

/area/liberty/laundry
	name = "\improper Level Two - Laundry"
	icon_state = "laundry"

// JANITOR

/area/liberty/janitor
	name = "\improper Level Two - Custodial Closet"
	icon_state = "janitor"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_janitor)

// MAINTENANCE

/area/liberty/maintenance/two
	name = "\improper Level Two - Central Maintenance"
	icon_state = "lvl_2_central_maintenance"

/area/liberty/maintenance/two/fore
	name = "\improper Level Two - Fore Maintenance"
	icon_state = "lvl_2_fore_maintenance"

/area/liberty/maintenance/two/starboard
	name = "\improper Level Two - Starboard Maintenance"
	icon_state = "lvl_2_starboard_maintenance"

/area/liberty/maintenance/two/port
	name = "\improper Level Two - Port Maintenance"
	icon_state = "lvl_2_port_maintenance"

/area/liberty/maintenance/two/room
	name = "\improper Level Two - Maintenance Room"

// ENGINEERING

/area/liberty/engineering/substation/substation_level_two
	name = "\improper Engineering - Substation Level Two"
	icon_state = "lvl_2_substation"

///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// LEVEL THREE ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// HOTEL

/area/liberty/hotel/room/penthouse
	name = "\improper Hotel - Penthouse Living Room"
	icon_state = "hotel_room_penthouse_living_room"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(penth)

/area/liberty/hotel/room/penthouse/bedroom
	name = "\improper Hotel - Penthouse Bedroom"
	icon_state = "hotel_room_penthouse_bedroom"
	req_access = list(penth)

/area/liberty/hotel/room/penthouse/bathroom
	name = "\improper Hotel - Penthouse Bathroom"
	icon_state = "hotel_room_penthouse_bathroom"
	req_access = list(penth)

// COMMAND

/area/liberty/command
	name = "\improper Command - Bridge"
	icon_state = "command_bridge"
	req_access = list(access_bridge)
	// icon = 'icons/turf/areas.dmi'	// WIP

// TELECOMMS

/area/liberty/telecomms
	name = "\improper Level Three - Telecommunications"
	icon_state = "telecomms"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	req_access = list(engtcom)


// DIRECTOR
/area/liberty/director/reception
	name = "\improper Director's Office - Reception"
	icon_state = "reception"

/area/liberty/director/office
	name = "\improper Director's Office - Working Area"
	icon_state = "director_office"

/area/liberty/director/apartment
	name = "\improper Director's Quarters - Apartment"
	icon_state = "director_apartment"

// HOLODECK

/area/liberty/holodeck
	name = "\improper Level Three - Holodeck"
	icon_state = "holodeck"

// HALLWAY

/area/liberty/hallway/three
	name = "\improper Level Three - Central Hallway"
	icon_state = "lvl_3_central_hall"

/area/liberty/hallway/three/starboard
	name = "\improper Level Three - Starboard Hallway"
	icon_state = "lvl_3_starboard_hall"

/area/liberty/hallway/emergency_terminal
	name = "\improper Emergency Terminal"

/area/liberty/hallway/three/starboard
	name = "\improper Level Three - Zadovsky's Hallway"

// MAINTENANCE

/area/liberty/maintenance/three/aft
	name = "\improper Level Three - Aft Maintenance"
	icon_state = "lvl_3_aft_maintenance"

/area/liberty/maintenance/three/fore
	name = "\improper Level Three - Fore Maintenance"
	icon_state = "lvl_3_fore_maintenance"

/area/liberty/maintenance/three/starboard
	name = "\improper Level Three - Starboard Maintenance"
	icon_state = "lvl_3_starboard_maintenance"

/area/liberty/maintenance/three/port
	name = "\improper Level Three - Port Maintenance"

/area/liberty/maintenance/three/directors_maint
	name = "\improper Level Three - Central Maintenhance"

// ENGINEERING

/area/liberty/engineering/substation/substation_level_three
	name = "\improper Engineering - Substation Level Three"
	icon_state = "lvl_3_substation"

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// TURBOLIFT ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

/area/turbolift/liberty
	name = "\improper Turbolift"
	icon = 'maps/liberty/icons/area.dmi'
	icon_state = "turbolift"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list() // SET ACCESS

// HOTEL

/area/turbolift/liberty/hotel/ground
	name = "hotel (level zero)"
	base_turf = /turf/simulated/floor/plating
	lift_floor_label = "0"
	lift_floor_name = "Hotel - Level Zero"
	lift_announce_str = "Нулевой уровень отеля: Казино. Бассейн. Спортзал. Сауна."

/area/turbolift/liberty/hotel/one
	name = "\improper hotel - level one"
	base_turf = /turf/simulated/open
	lift_floor_label = "1"
	lift_floor_name = "Hotel - Level One"
	lift_announce_str = "Первый уровень отеля: Ресепшн. Ресторан. Администрация."

/area/turbolift/liberty/hotel/two
	name = "\improper hotel - level two"
	base_turf = /turf/simulated/open
	lift_floor_label = "2"
	lift_floor_name = "Hotel - Level Two"
	lift_announce_str = "Второй уровень отеля: Номера 101-104, 201-202, 301-303."

/area/turbolift/liberty/hotel/top
	name = "\improper hotel - level three"
	base_turf = /turf/simulated/open
	lift_floor_label = "3"
	lift_floor_name = "Hotel - Level Three"
	lift_announce_str = "Третий уровень отеля: Номер 401."

// MEDBAY

/area/turbolift/liberty/medbay/ground
	name = "medbay (level one)"
	base_turf = /turf/simulated/floor/plating
	lift_floor_label = "1"
	lift_floor_name = "Medbay - Level One"
	lift_announce_str = "Первый уровень медбэя: Приёмная. Пункт оказания неотложной помощи. Аптека. Операционная."

/area/turbolift/liberty/medbay/top
	name = "medbay (level two)"
	base_turf = /turf/simulated/open
	lift_floor_label = "2"
	lift_floor_name = "Medbay - Level Two"
	lift_announce_str = "Второй уровень медбэя: Палаты. Ординаторская. Главный врач. Склад."

// EAST

/area/turbolift/liberty/east/ground
	name = "east (level zero)"
	base_turf = /turf/simulated/floor/plating
	lift_floor_label = "0"
	lift_floor_name = "Liberty - Level Zero"
	lift_announce_str = "Нулевой уровень Либерти: Инженерный отсек. Складские помещения."

/area/turbolift/liberty/east/one
	name = "east (level one)"
	base_turf = /turf/simulated/open
	lift_floor_label = "1"
	lift_floor_name = "Liberty - Level One"
	lift_announce_str = "Первый уровень Либерти: Пассажирские терминалы 1 и 2. Отель. Торговая зона. Медбэй. Отделение Федеральной полиции."

/area/turbolift/liberty/east/two
	name = "east (level two)"
	base_turf = /turf/simulated/open
	lift_floor_label = "2"
	lift_floor_name = "Liberty - Level Two"
	lift_announce_str = "Второй уровень Либерти: Часовня. Библиотека. Прачечная. Офисные помещения. Конференц-зал."

/area/turbolift/liberty/east/three
	name = "east (level three)"
	base_turf = /turf/simulated/open
	lift_floor_label = "3"
	lift_floor_name = "Liberty - Level Three"
	lift_announce_str = "Третий уровень Либерти: Администрация комлпекса. Голодек."

/area/turbolift/liberty/east/top
	name = "east (level four)"
	base_turf = /turf/simulated/open
	lift_floor_label = "4"
	lift_floor_name = "Liberty - Level Four"
	lift_announce_str = "Четвёртый уровень Либерти: Башня управления."

// NORTH

/area/turbolift/liberty/north/ground
	name = "north (level zero)"
	base_turf = /turf/simulated/floor/plating
	lift_floor_label = "0"
	lift_floor_name = "Liberty - Level Zero"
	lift_announce_str = "Нулевой уровень Либерти: Инженерный отсек. Складские помещения."

/area/turbolift/liberty/north/one
	name = "north (level one)"
	base_turf = /turf/simulated/open
	lift_floor_label = "1"
	lift_floor_name = "Liberty - Level One"
	lift_announce_str = "Первый уровень Либерти: Пассажирские терминалы 1 и 2. Отель. Торговая зона. Медбэй. Отделение Федеральной полиции."

/area/turbolift/liberty/north/two
	name = "north (level two)"
	base_turf = /turf/simulated/open
	lift_floor_label = "2"
	lift_floor_name = "Liberty - Level Two"
	lift_announce_str = "Второй уровень Либерти: Часовня. Библиотека. Прачечная. Офисные помещения. Конференц-зал."

/area/turbolift/liberty/north/top
	name = "north (level three)"
	base_turf = /turf/simulated/open
	lift_floor_label = "3"
	lift_floor_name = "Liberty - Level Three"
	lift_announce_str = "Третий уровень Либерти: Администрация комлпекса. Голодек."

///////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// SHUTTLES /////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

// KENOBI

/area/liberty/kenobi
	name = "\improper GUP Kenobi"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(keno)

/area/liberty/kenobi/cockpit
	name = "\improper GUP Kenobi - Cockpit"
	icon_state = "kenobi_cockpit"

/area/liberty/kenobi/airlock
	name = "\improper GUP Kenobi - Airlock Compartment"
	icon_state = "kenobi_airlock"

/area/liberty/kenobi/passenger
	name = "\improper GUP Kenobi - Passanger Compartment"
	icon_state = "kenobi_passenger"

// KONIGSTIGER

/area/liberty/konigstiger
	name = "\improper FGS Konigstiger"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(koni)

/area/liberty/konigstiger/cockpit
	name = "\improper FGS Konigstiger - Cockpit"
	icon_state = "konigstiger_cockpit"

/area/liberty/konigstiger/airlock
	name = "\improper FGS Konigstiger - Airlock Compartment"
	icon_state = "konigstiger_airlock"

/area/liberty/konigstiger/passenger
	name = "\improper FGS Konigstiger - Passenger Compartment"
	icon_state = "konigstiger_passenger"

// BEBOP

/area/liberty/bebop
	name = "\improper IFV Bebop"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(bebo)

/area/liberty/bebop/cockpit
	name = "\improper IFV Bebop - Cockpit"
	icon_state = "bebop_cockpit"

/area/liberty/bebop/main
	name = "\improper IFV Bebop - Main Compartment"
	icon_state = "bebop_main_compartment"

/area/liberty/bebop/service
	name = "\improper IFV Bebop - Service Compartment"
	icon_state = "bebop_service_compartment"
