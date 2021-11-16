/datum/job/janitor
	title = "Уборщик"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "Администратор отеля"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 24
	outfit_type =
	min_skill = list(   SKILL_HAULING = SKILL_BASIC)
	access = list()
	minimal_access = list()

/datum/job/bartender
	title = "Бармен"
	department = "Service"
	department_flag = SRV
	supervisors = "Администратор отеля"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 23
	outfit_type =
	access = list()
	minimal_access = list()
	min_skill = list(   SKILL_COOKING   = SKILL_BASIC,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)

/datum/job/chef
	title = "Повар"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 18)
	supervisors = "Администратор отеля"
	outfit_type =
	min_skill = list(   SKILL_COOKING   = SKILL_ADEPT,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)
	access = list()
	minimal_access = list()

/datum/job/crew
	title = "Стюарт"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "Администратор отеля"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	outfit_type =

	access = list()

/datum/job/merchant
	title = "Торговец"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "Секретарь"
	ideal_character_age = 30
	minimal_player_age = 0
	outfit_type =
	latejoin_at_spawnpoints = 1
	access = list()
	min_skill = list(   SKILL_FINANCE = SKILL_ADEPT)

	skill_points = 24

/datum/job/hotel_supervisor
title = Администратор отеля
department = "Service"
department_flag = SRV
total_positions = 2
spawn_positions = 2
supervisors = "Секретарь"
minimum_character_age = list(SPECIES_HUMAN = 18)
ideal_character_age = 20
outfit_type =

	access = list()