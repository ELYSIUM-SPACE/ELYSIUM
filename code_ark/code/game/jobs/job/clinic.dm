/datum/job/cmo
	title = "Chief Medical Officer"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#597839"
	req_admin_notify = 1
	economic_power = 10
	access = list(chmo, doctor, farma, maint, access_hydroponics)
	minimal_access = list(chmo, doctor, farma, maint, access_hydroponics)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

//--------------------------------------------

/datum/job/doctor
	title = "Medical Doctor"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 3
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#72994a"
	economic_power = 7
	access = list(doctor, farma, maint, access_hydroponics)
	minimal_access = list(doctor, farma, maint, access_hydroponics)
	//alt_titles = list(
	//	"Surgeon" = /decl/hierarchy/outfit/job/medical/doctor/surgeon,
	//	"Emergency Physician" = /decl/hierarchy/outfit/job/medical/doctor/emergency_physician,
	//	"Nurse" = /decl/hierarchy/outfit/job/medical/doctor/nurse,
	//	"Virologist" = /decl/hierarchy/outfit/job/medical/doctor/virologist)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

//--------------------------------------------

/datum/job/pharmacist
	title = "Pharmacist"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 7
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#72994a"
	economic_power = 5
	access = list(doctor, farma, maint, access_hydroponics)
	minimal_access = list(doctor, farma, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/medical/pharmacist
