/datum/job/sfp_curator
	title = "SFP Curator"
	head_position = 1
	department = "Security"
	department_flag = SEC|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#8e2929"
	req_admin_notify = 1
	economic_power = 10
	access = list(sfphos, sfparmory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_access = list(sfphos, sfparmory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_curator

/datum/job/sfp_curator/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

//--------------------------------------------

/datum/job/sfp_investigator
	title = "SFP Investigator"
	department = "Security"
	department_flag = SEC

	total_positions = 2
	spawn_positions = 2
	supervisors = "the SFP curator"
	selection_color = "#601c1c"
	//alt_titles = list("Forensic Technician" = /decl/hierarchy/outfit/job/security/detective/forensic)
	economic_power = 5
	access = list(sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_access = list(sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_investigator

//--------------------------------------------

/datum/job/sfp_agent
	title = "SFP Response Agent"
	department = "Security"
	department_flag = SEC

	total_positions = 2
	spawn_positions = 2
	supervisors = "the SFP curator"
	selection_color = "#601c1c"
	//alt_titles = list("Junior Officer")
	economic_power = 4
	access = list(sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_access = list(sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_hydroponics)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_agent
