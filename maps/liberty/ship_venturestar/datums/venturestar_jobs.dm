/datum/job/submap/vstar_leader
	title = "Excavation Leader"
	department = "Supply"
	department_flag = SUP

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = "#734926"
	latejoin_at_spawnpoints = TRUE

	info = "You are a part of a crew onboard of Independent Mining Vessel VentureStar."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 5
	access = list(access_venturestar)
	minimal_access = list(access_venturestar)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/vstar/leader

//--------------------------------------------

/datum/job/submap/vstar_miner
	title = "Miner"
	department = "Supply"
	department_flag = SUP

	total_positions = 3
	spawn_positions = 3
	supervisors = "the excavation leader"
	selection_color = "#966031"
	latejoin_at_spawnpoints = TRUE

	info = "You are a part of a crew onboard of Independent Mining Vessel VentureStar. Follow the commands of your Excavation Leader."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 5
	access = list(access_venturestar)
	minimal_access = list(access_venturestar)
	//alt_titles = list("Drill Technician","Prospector")
	outfit_type = /decl/hierarchy/outfit/job/vstar/miner
