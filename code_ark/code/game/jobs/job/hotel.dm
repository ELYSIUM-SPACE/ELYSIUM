/datum/job/service_officer
	title = "Service Officer"
	department = "Service"
	department_flag = SRV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the hotel manager"
	selection_color = COLOR_PALE_BTL_GREEN
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
	selection_color = COLOR_PALE_BTL_GREEN
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
	selection_color = COLOR_PALE_BTL_GREEN
	access = list(hstaff, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, kitchen, maint, access_hydroponics)
	//alt_titles = list("Barista")
	outfit_type = /decl/hierarchy/outfit/job/hotel/bartender

//--------------------------------------------

/datum/job/manager
	title = "Hotel Manager"
	department = "Service"
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = COLOR_BOTTLE_GREEN
	economic_power = 1
	access = list(hadmin, hstaff, penth, kitchen, maint, access_hydroponics)
	minimal_access = list(hadmin, penth, hstaff, kitchen, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/hotel/manager
