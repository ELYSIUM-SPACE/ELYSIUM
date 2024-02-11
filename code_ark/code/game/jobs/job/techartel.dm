/datum/job/dev_head
	title = "Head of Development"
	head_position = 1
	department = "Science"
	department_flag = COM|SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#ad6bad"
	req_admin_notify = 1
	economic_power = 15
	access = list(rndboss, rndshop, rndbot, maint, access_hydroponics)
	minimal_access = list(rndboss, rndshop, rndbot, maint, access_hydroponics)
	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/science/rd

//--------------------------------------------

/datum/job/scientist
	title = "Scientist"
	department = "Science"
	department_flag = SCI

	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of development"
	selection_color = "#633d63"
	economic_power = 7
	access = list(rndshop, rndbot, maint, access_hydroponics)
	minimal_access = list(rndshop, rndbot, maint, access_hydroponics)
	//alt_titles = list("Xenoarcheologist", "Anomalist", "Phoron Researcher")
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

//--------------------------------------------

/datum/job/robotechnician
	title = "Robotechnician"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of development"
	selection_color = "#633d63"
	economic_power = 5
	access = list(rndshop, rndbot, maint, access_hydroponics) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_access = list(rndshop, rndbot, maint, access_hydroponics) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	//alt_titles = list("Biomechanical Engineer","Mechatronic Engineer")
	minimal_player_age = 3
	outfit_type = /decl/hierarchy/outfit/job/science/robotechnician
