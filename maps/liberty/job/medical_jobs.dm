/datum/job/senior_doctor
	title = "Главврач"
	department = "Medical"
	department_flag = MED
	minimal_player_age = 15
	minimum_character_age = list(SPECIES_HUMAN = 29)
	ideal_character_age = 35
	total_positions = 1
	spawn_positions = 1
	supervisors = "Администрации"
	selection_color = "#013d3b"
	economic_power = 10

	outfit_type =

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
						SKILL_FINANCE	  = SKILL_ADEPT
	                    SKILL_MEDICAL     = SKILL_TRAINED,
	                    SKILL_ANATOMY     = SKILL_TRAINED,
	                    SKILL_CHEMISTRY   = SKILL_ADEPT,
						SKILL_DEVICES     = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_BUREACRACY  = SKILL_MAX,
	                    SKILL_FINANCE	  = SKILL_MAX)
	skill_points = 30

	access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/junior_doctor
	title = "Медсестра"
	department = "Medical"
	department_flag = MED
	minimal_player_age = 2
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 25
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главврач и врачи"
	selection_color = "#013d3b"
	economic_power = 3
	outfit_type =
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 16

	access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/doctor
	title = "Врач"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главврачу"
	economic_power = 5
	minimum_character_age = list(SPECIES_HUMAN = 23)
	ideal_character_age = 30
	minimal_player_age = 5
	alt_titles = list(
		"Парамедик",
		"Фельдшер")
	outfit_type =

	min_skill = list(   SKILL_EVA      	 = SKILL_BASIC,
	                    SKILL_MEDICAL 	 = SKILL_ADEPT,
	                    SKILL_ANATOMY 	 = SKILL_ADEPT,
	                    SKILL_BUREACRACY = SKILL_ADEPT,
	                    SKILL_CHEMISTRY  = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 20


/datum/job/chemist
	title = "Фармацевт"
	department = "Medical"
	department_flag = MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главврач"
	selection_color = "#013d3b"
	economic_power = 4
	minimum_character_age = list(SPECIES_HUMAN = 21)
	ideal_character_age = 30
	minimal_player_age = 7
	outfit_type =
	min_skill = list(   SKILL_MEDICAL    = SKILL_BASIC,
						SKILL_ANATOMY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY  = SKILL_TRAINED,
	                    SKILL_BUREACRACY = SKILL_BASIC)

	max_skill = list(SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 16

	access = list()
	minimal_access = list()
