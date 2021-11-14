/datum/job/senior_engineer
	title = "Старший Инженер"
	department = "Engineering"
	department_flag = ENG
	total_positions = 1
	spawn_positions = 1
	supervisors = "Администрация"
	selection_color = "#5b4d20"
	economic_power = 6
	minimal_player_age = 3
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 40
	outfit_type =
	min_skill = list(   SKILL_COMPUTER     = SKILL_TRAINED,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_TRAINED,
	                    SKILL_BUREAUCRACY  = SKILL_TRAINED,
	                    SKILL_FINANCE      = SKILL_BASIC)

	max_skill = list(   SKILL_COMPUTER     = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_BUREAUCRACY  = SKILL_MAX,
	                    SKILL_FINANCE      = SKILL_MAX,
	                    SKILL_HAULING      = SKILL_MAX)
	skill_points = 24

	access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/senior_engineer/get_description_blurb()
	return "Вы Старший Инженер на станции. Являетесь сотрудником подрядной организации, которую нанял директор для обеспечения технического обслуживания станции. Ваши навыки превосходны, ваше оснащение безупречно, а ваша любимая фраза - Доверьтесь мне, я Инженер!"

/datum/job/engineer
	title = "Инженер"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Старший Инженер"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 21)
	ideal_character_age = 30
	alt_titles = list(
		"Оператор реакторной установки",
		"Электрик",
		"Атмостех",
		)
	outfit_type =

	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_ADEPT,
	                    SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_PILOT        = SKILL_BASIC,
	                    SKILL_HAULING	   = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_COMPUTER	   = SKILL_MAX,
	                    SKILL_HAULING	   = SKILL_MAX)
	skill_points = 18

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
