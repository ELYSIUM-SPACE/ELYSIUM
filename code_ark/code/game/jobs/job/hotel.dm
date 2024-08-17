/datum/job/manager
	title = "Hotel Manager"
	department = "Service"
	head_position = 1
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = "#262626"
	selection_text_color = "#e7c769"
	economic_power = 1
	access = list(hadmin, hstaff, penth, kitchen, maint, access_hydroponics)
	minimal_access = list(hadmin, penth, hstaff, kitchen, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/hotel/manager

//--------------------------------------------

/datum/job/service_officer
	title = "Hotel Staff"
	department = "Service"
	department_flag = SRV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the hotel manager"
	selection_color = "#343434"
	selection_text_color = "#e7c769"
	economic_power = 1
	access = list(hstaff, penth, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, penth, kitchen, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/hotel/service_officer

//--------------------------------------------

/datum/job/cook
	title = "Cook"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the hotel manager"
	selection_color = "#343434"
	selection_text_color = "#e7c769"
	access = list(hstaff, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, kitchen, maint, access_hydroponics)
	//alt_titles = list("Chef")
	outfit_type = /decl/hierarchy/outfit/job/hotel/cook

//--------------------------------------------

/datum/job/bartender
	title = "Bartender"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the hotel manager"
	selection_color = "#343434"
	selection_text_color = "#e7c769"
	access = list(hstaff, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, kitchen, maint, access_hydroponics)
	//alt_titles = list("Barista")
	outfit_type = /decl/hierarchy/outfit/job/hotel/bartender
