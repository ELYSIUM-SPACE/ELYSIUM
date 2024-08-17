/datum/job/visitor
	title = "Visitor"
	department = "Civilian"
	department_flag = CIV

	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#878787"
	economic_power = 1
	access = list()			//See /datum/job/visitor/get_access()
	minimal_access = list()	//See /datum/job/visitor/get_access()
	//alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	outfit_type = /decl/hierarchy/outfit/job/visitor

/datum/job/visitor/get_access()
	return list()
