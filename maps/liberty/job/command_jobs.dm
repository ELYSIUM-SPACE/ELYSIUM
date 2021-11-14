/datum/job/captain
	title = "Директор"
	supervisors = "никому"
	minimal_player_age = 14
	economic_power = 25
	minimum_character_age = list(SPECIES_HUMAN = 30)
	ideal_character_age = 50
	outfit_type =

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_FINANCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_BUREAUCRACY = SKILL_MAX,
						SKILL_FINANCE     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 20

	access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Вы Директор. Местный король, владетель станции и самый богатый на ней человек. Но не забывайте об ответственности и бдительном оке ЦПСС."

/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("Внимание [alt_title || title] [person.real_name] на рабочем месте!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "Секретарь"
	supervisors = "директору"
	department = "Администрация"
	department_flag = COM
	minimal_player_age = 14
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 35
	outfit_type =
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_FINANCE     = SKILL_TRAINED)
	max_skill = list(   SKILL_BUREAUCRACY = SKILL_MAX,
						SKILL_FINANCE     = SKILL_MAX)
	skill_points = 15

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
/datum/job/hop/get_description_blurb()
	return "Вы Секретарь - правая рука директора. Приносите директору кофе, делайте миньет и решайте вопросы станции когда директор думает над вопросами мироздания."