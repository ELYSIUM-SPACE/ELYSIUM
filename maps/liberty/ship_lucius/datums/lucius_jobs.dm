//base lucius job, not actually used
/datum/job/submap/lucius
	department = "Exploration"
	department_flag = EXP

	supervisors = "the captain"
	selection_color = COLOR_NAVY_BLUE
	latejoin_at_spawnpoints = TRUE

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

//--------------------------------------------

/datum/job/submap/lucius/sev_captain
	title = "Captain"

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/captain

//--------------------------------------------

/datum/job/submap/lucius/sev_pilot
	title = "EXO Pilot"

	total_positions = 1
	spawn_positions = 1
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/pilot

//--------------------------------------------

/datum/job/submap/lucius/sev_tech
	title = "Deck Technician"

	total_positions = 1
	spawn_positions = 1
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/tech

//--------------------------------------------

/datum/job/submap/lucius/sev_medic
	title = "Field Medic"

	total_positions = 1
	spawn_positions = 1
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/medic

//--------------------------------------------

/datum/job/submap/lucius/sev_scientist
	title = "EC Researcher"

	total_positions = 1
	spawn_positions = 1
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/scientist

//--------------------------------------------

/datum/job/submap/lucius/sev_expeditor
	title = "Expeditor"

	total_positions = 2
	spawn_positions = 2
	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/sev_expeditor
