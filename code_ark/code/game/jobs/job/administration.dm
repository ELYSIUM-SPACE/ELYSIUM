var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/director
	title = "Director"
	department = "Command"
	head_position = 1
	department_flag = COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_power = 20

	ideal_character_age = 70 // Old geezer captains ftw

	access = list(access_director_apartment, access_director_office, maint, cargonia, hangar, engmain, engpower, engatmos, engtcom,
					access_hydroponics, shop, hstaff, hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, psycho, priveye, chapl, keno)
	minimal_access = list(access_director_apartment, access_director_office, maint, cargonia, hangar, engmain, engpower, engatmos, engtcom,
					access_hydroponics, shop, hstaff, hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, psycho, priveye, chapl, keno)

	outfit_type = /decl/hierarchy/outfit/job/director

/datum/job/director/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

//--------------------------------------------

/datum/job/secretary
	title = "Secretary"
	department = "Command"
	head_position = 1
	department_flag = COM|CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	minimal_player_age = 14
	economic_power = 10
	ideal_character_age = 50

	access = list(access_director_office, maint, hangar, cargonia, engmain, engtcom, access_hydroponics, shop, hstaff,
					hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, chapl)
	minimal_access = list(access_director_office, maint, hangar, cargonia, engmain, engtcom, access_hydroponics, shop, hstaff,
					hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, chapl)

	outfit_type = /decl/hierarchy/outfit/job/secretary

//--------------------------------------------

/datum/job/consul
	title = "SCG Consul"
	department = "Command"
	head_position = 1
	department_flag = COM|CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	minimal_player_age = 14
	economic_power = 10
	ideal_character_age = 50

	access = list(scgoffice, access_aft_chkp, scgdocks, maint, access_hydroponics)
	minimal_access = list(scgoffice, access_aft_chkp, scgdocks, maint, access_hydroponics)

	outfit_type = /decl/hierarchy/outfit/job/consul

//--------------------------------------------

/datum/job/corpo_representative
	title = "Corporate Representative"
	department = "Command"
	head_position = 1
	department_flag = COM|CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#2f2f7f"
	req_admin_notify = 1
	minimal_player_age = 14
	economic_power = 10
	ideal_character_age = 50

	access = list(corpoffice, maint, access_hydroponics)
	minimal_access = list(corpoffice, maint, access_hydroponics)

	outfit_type = /decl/hierarchy/outfit/job/corpo_representative
