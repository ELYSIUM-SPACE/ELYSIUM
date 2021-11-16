
/datum/job/exp_captain
	title = "Капитан Люция"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "ЦПСС"
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 9
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type =
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_TRAINED,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_TRAINED,
	                    SKILL_FINANCE	  = SKILL_BASIC,
	                    SKILL_MEDICAL	  = SKILL_BASIC)

	max_skill = list(	SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT,
	                    SKILL_PILOT       = SKILL_MAX)
	skill_points = 22

	access = list()

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder
	title = "Лидер экспедиционной группы"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = ""
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 9
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_TRAINED,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_COMBAT	  = SKILL_BASIC,
	                    SKILL_HAULING	  = SKILL_BASIC,
	                    SKILL_WEAPONS 	  = SKILL_BASIC,
	                    SKILL_MEDICAL	  = SKILL_BASIC)

	max_skill = list(	SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT)
	skill_points = 18

	access = list()

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "Вы мама-утка группы пионеров. Защищайте утят, смотрите чтобы никто не потерялся, забывайте их на планете за непослушание. Гордо поднимите флаг ЦПСС над очередным безжизненным каменным шариком."

/datum/job/exp_medic
	title = "Врач Люция"
	supervisors = "капитану Люция"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 10
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 25
	outfit_type = =
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1
	)

	access = list()
	min_skill = list(	SKILL_EVA   	= SKILL_BASIC,
						SKILL_MEDICAL   = SKILL_ADEPT,
						SKILL_ANATOMY   = SKILL_ADEPT,
						SKILL_CHEMISTRY = SKILL_BASIC,
						SKILL_HAULING	= SKILL_BASIC,
						SKILL_EVA		= SKILL_BASIC
						)

	max_skill = list(   SKILL_MEDICAL     = SKILL_EXPERT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    )
	skill_points = 20

	access = list()

/datum/job/exp_engineer
	title = "Инженер Люция"
	supervisors = "капитану Люция"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 10
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 25
	outfit_type = =
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/e5
	)

	access = list()
	min_skill = list(	SKILL_EVA   		= SKILL_BASIC,
						SKILL_ELECTRICAL    = SKILL_ADEPT,
						SKILL_ATMOS   		= SKILL_ADEPT,
						SKILL_ENGINE	 	= SKILL_TRAINED,
						SKILL_HAULING		= SKILL_BASIC,
						SKILL_EVA			= SKILL_BASIC,
						SKILL_CONSTRUCTION  = SKILL_ADEPT
						)

	max_skill = list(   SKILL_ENGINE    	 = SKILL_EXPERT,
	                    SKILL_ELECTRICAL     = SKILL_EXPERT,
	                    SKILL_CONSTRUCTION	 = SKILL_EXPERT,
	                    SKILL_ATMOS			 = SKILL_EXPERT
	                    )
	skill_points = 16

	access = list()

/datum/job/exp_scien
	title = "Ученый Люция"
	supervisors = "капитану Люция"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 10
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = =
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1
	)

	access = list()
	min_skill = list(	SKILL_SCIENCE     = SKILL_TRAINED,
						SKILL_DEVICES     = SKILL_TRAINED,
						SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_HAULING	  = SKILL_BASIC,
						SKILL_EVA		  = SKILL_BASIC,
						SKILL_BOTANY	  = SKILL_ADEPT
						)

	max_skill = list(   SKILL_SCIENCE   	= SKILL_MAX,
						SKILL_DEVICES    	= SKILL_MAX
	                    )
	skill_points = 16

	access = list()

/datum/job/explorer
	title = "Исследователь"
	department = "Exploration"
	department_flag = EXP
	total_positions = 3
	spawn_positions = 3
	supervisors = "лидеру экспедиционной группы"
	selection_color = "#68099e"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)

	allowed_ranks = list(
		/datum/mil_rank/ec/e3
	)
	min_skill = list(   SKILL_EVA 	  = SKILL_BASIC,
						SKILL_HAULING = SKILL_BASIC,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_BOTANY  = SKILL_BASIC,
						SKILL_SCIENCE = SKILL_BASIC)

	max_skill = list(	SKILL_SCIENCE     = SKILL_MAX
)

	access = list()

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "Вы самое любопытное существо на свете. Сбегите от мамы-утки навстречу приключениям!"