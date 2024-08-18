/datum/job/harbormaster
	title = "Harbormaster"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = "#c8760c"
	economic_power = 5
	access = list(cargoboss, cargonia, hangar, maint, keno, access_hydroponics)
	minimal_access = list(cargoboss, cargonia, hangar, maint, keno, access_hydroponics)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/dock/harbormaster

//--------------------------------------------

/datum/job/docker
	title = "Docker"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the harbormaster and the secretary"
	selection_color = "#ea9c14"
	access = list(cargonia, hangar, maint, keno, access_hydroponics)
	minimal_access = list(cargonia, hangar, maint, keno, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/dock/docker
