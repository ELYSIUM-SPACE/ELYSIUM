/datum/nanoui/proc/autoset_mode()
	var/list/sol_accesses = list("ACCESS_SOL_GENERAL", "ACCESS_SOL_MAINT", "ACCESS_SOL_ENG", "ACCESS_SOL_EXP", "ACCESS_SOL_SCI",
							"ACCESS_SOL_MED", "ACCESS_SOL_SEC", "ACCESS_SOL_PILOT", "ACCESS_SOL_COMMAND", "ACCESS_SOL_HIGH_COMMAND", "ACCESS_SOL_DIPLOMACY")
	var/list/sfp_accesses = list("ACCESS_SOL_SFP")
	if(istype(src_object, /datum/extension/interactive/ntos/console))
		var/datum/extension/interactive/ntos/console/C = src_object
		var/obj/machinery/computer/modular/M = C.holder
		var/turf/T = M.loc
		var/area/A = T.loc
		for(var/R in A.req_access)
			if(R in sol_accesses)
				layout_key = "sol"
				add_stylesheet("shared_sol.css")
				break
			if(R in sfp_accesses)
				layout_key = "sfp"
				break
	if(istype(src_object, /datum/nano_module))
		var/datum/nano_module/program/P = src_object
		var/obj/machinery/M = P.host
		var/turf/T = M.loc
		var/area/A = T.loc
		for(var/R in A.req_access)
			if(R in sol_accesses)
				layout_key = "sol"
				add_stylesheet("shared_sol.css")
				break
			if(R in sfp_accesses)
				layout_key = "sfp"
				break