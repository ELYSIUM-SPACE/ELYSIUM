//--------------------------------------------

/datum/job/submap/sev_captain
	title = "Captain"
	head_position = 1
	department = "Exploration"
	department_flag = EXP

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#323252"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "hudcaptain"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/captain

//--------------------------------------------

/datum/job/submap/sev_pilot
	title = "EXO Pilot"

	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#424879"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "hudexopilot"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_pilot, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/pilot

//--------------------------------------------

/datum/job/submap/sev_tech
	title = "Deck Technician"

	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#424879"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "huddecktechnician"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/tech

//--------------------------------------------

/datum/job/submap/sev_medic
	title = "Field Medic"

	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#424879"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "hudfieldmedic"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/medic

//--------------------------------------------

/datum/job/submap/sev_scientist
	title = "EC Researcher"

	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#424879"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "hudecresearcher"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/scientist

//--------------------------------------------

/datum/job/submap/sev_expeditor
	title = "Expeditor"

	total_positions = 2
	spawn_positions = 2
	supervisors = "the captain"
	selection_color = "#424879"
	selection_text_color = "#f88a22"
	latejoin_at_spawnpoints = TRUE

	hud_icon = "hudexpeditor"

	info = "You are a part of a crew onboard of Sol Exploration Vessel Lucius. Follow the commands of your captain."

	//potentially need to be changed
	announced = TRUE
	create_record = TRUE
	available_by_default = TRUE

	min_skill = list()
	max_skill = list()
	skill_points = 16

	economic_power = 1
	access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	minimal_access = list(access_sol_high_command, access_sol_command, access_sol_general, access_sol_maint, access_sol_eng, access_sol_med, access_sol_sci, scgdocks)
	outfit_type = /decl/hierarchy/outfit/job/sev/sev_expeditor
