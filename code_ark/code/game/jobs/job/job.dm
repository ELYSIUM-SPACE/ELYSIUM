/datum/job
	var/selection_text_color = "#ffffff"		// Selection screen text color

//sorted list of all available jobs to help sort preferences and late join windows
GLOBAL_LIST_INIT(sorted_joblist, list(
	/datum/job/director,
	/datum/job/secretary,
	/datum/job/manager,
	/datum/job/service_officer,
	/datum/job/cook,
	/datum/job/bartender,
	/datum/job/janitor,
	/datum/job/consul,
	/datum/job/sfp_curator,
	/datum/job/sfp_investigator,
	/datum/job/sfp_agent,
	/datum/job/cmo,
	/datum/job/doctor,
	/datum/job/pharmacist,
	/datum/job/dev_head,
	/datum/job/scientist,
	/datum/job/robotechnician,
	/datum/job/chief_engineer,
	/datum/job/station_engineer,
	/datum/job/corpo_representative,
	/datum/job/trader,
	/datum/job/chaplain,
	/datum/job/psychologist,
	/datum/job/pvt_eye,
	/datum/job/farmer,
	/datum/job/harbormaster,
	/datum/job/docker,
	/datum/job/submap/vstar_leader,
	/datum/job/submap/vstar_miner,
	/datum/job/submap/sev_captain,
	/datum/job/submap/sev_pilot,
	/datum/job/submap/sev_tech,
	/datum/job/submap/sev_medic,
	/datum/job/submap/sev_scientist,
	/datum/job/submap/sev_expeditor,
	/datum/job/freelancer,
	/datum/job/freelancer_pilot,
	/datum/job/visitor
	))

//bad way of doing it, but can't think of anything else
//this proc here sorts the list of jobs to order them the way we want
proc/sort_roles_list(var/list/L)

	var/list/origin_L = L.Copy()
	var/list/sorted_L = list()
	for(var/jobtype in GLOB.sorted_joblist)
		for(var/datum/job/J in origin_L)
			if(!istype(J))
				continue
			if(J.type == jobtype)
				sorted_L += J
				origin_L -= J
				break

	//dump remaining jobs in
	sorted_L.Add(origin_L)

	return sorted_L
