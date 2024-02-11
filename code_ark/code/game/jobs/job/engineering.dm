/datum/job/chief_engineer
	title = "Chief Engineer"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	economic_power = 10

	ideal_character_age = 50


	access = list(engmain, engpower, engatmos, engtcom, access_external_airlocks, hangar, access_aft_chkp, maint, access_hydroponics, keno)
	minimal_access = list(engmain, engpower, engatmos, engtcom, access_external_airlocks, hangar, access_aft_chkp, maint, access_hydroponics, keno)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer

//--------------------------------------------

/datum/job/station_engineer
	title = "Station Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 3
	spawn_positions = 3
	supervisors = "the chief engineer"
	selection_color = "#5b4d20"
	economic_power = 5
	minimal_player_age = 7
	access = list(engmain, engpower, engatmos, access_external_airlocks, hangar, maint, access_hydroponics, keno)
	minimal_access = list(engmain, engpower, engatmos, access_external_airlocks, hangar, maint, access_hydroponics, keno)
	//alt_titles = list("Maintenance Technician","Engine Technician","Electrician",
	//	"Atmospheric Technician" = /decl/hierarchy/outfit/job/engineering/atmos)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer
