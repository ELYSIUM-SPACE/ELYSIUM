var/list/autodocs = list()
//Autodoc
/obj/machinery/autodoc
	name = "Autodoc"
	desc = "An automatic surgery machine, capable for performing even most complex operations"
	icon = 'code_ark/icons/obj/autodoc.dmi'
	icon_state = "autodoc_open"
	density = TRUE
	anchored = TRUE
	var/mob/living/carbon/human/occupant = null
	var/list/queue = list()
	var/permitted = list(/obj/item/implant/chem, /obj/item/implant/death_alarm, /obj/item/implant/loyalty, /obj/item/implant/adrenalin, /obj/item/implant/translator)
	var/operating = 0
	var/obj/item/reagent_container/blood/OMinus/blood_pack
	var/obj/item/reagent_containers/glass/beaker/loaded
	var/stasis = 1
	var/anestesia = 0
	var/filtering = 0
	var/blood_transfer = 0
	var/automaticmode = 0
	var/list/organs = list()
	var/list/organs_ext = list()
	var/obj/item/Stor_autodoc = null
	var/datum/nano_module/autodoc_console/console
	var/obj/machinery/autodoc_loader/connected_loa
	var/list/operating_limbs = list()
	//It uses power
	use_power = 1
	idle_power_usage = 15
	active_power_usage = 450



/obj/machinery/autodoc/New()
	..()
	autodocs += src

/obj/machinery/autodoc/Destroy()
	autodocs -= src
	..()



/obj/machinery/autodoc/power_change(var/area/master_area = null)
	..()
	if(stat & NOPOWER)
		visible_message("\ [src] turns off.")
		operating = 0
		return


/obj/machinery/autodoc/attack_hand(mob/user)
	move_inside()

/obj/machinery/autodoc/on_update_icon()
	if(stat & NOPOWER)
		icon_state = "autodoc_off"
	else if(operating)
		icon_state = "autodoc_operate"
	else if (occupant)
		icon_state = "autodoc_closed"
	else
		icon_state = "autodoc_open"

/obj/machinery/autodoc/Process()
	updateUsrDialog()
	if(occupant)
		if(anestesia && occupant.sleeping < 3)
			occupant.Sleeping(3 - occupant.sleeping)
		icon_state = "autodoc"
		if(occupant.stat == DEAD)
			visible_message("[src] Suddenly switches off.")
			operating = 0
			return
		if(stasis > 1)
			occupant.SetStasis(stasis)
		organs = occupant.internal_organs|occupant.organs
		organs_ext = occupant.organs // ^ occupant.internal_organs
		if(operating)
			update_use_power(active_power_usage)
			icon_state = "autodoc_active"



		else
			icon_state = "autodoc"
			update_use_power(idle_power_usage)
	else
		update_use_power(idle_power_usage)
		icon_state = "autodoc_open"


/obj/machinery/autodoc/proc/defib()
	var/obj/item/organ/internal/heart/heart = occupant.internal_organs_by_name[BP_HEART]
	if(occupant.should_have_organ(BP_HEART) && heart && (occupant.get_blood_volume() > BLOOD_VOLUME_SURVIVE))
		occupant.apply_damage(5, BURN, BP_CHEST)
		playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 50, 1, -1)
		occupant.resuscitate()



/obj/machinery/autodoc/proc/surgery(var/name, var/opname)
	var/obj/item/organ/Org
	for(var/obj/item/organ/N in organs)
		if(N.name == name)
			Org = N
			break

	visible_message("<span class='notice'>[src] beeps.</span>")
	operating = 1
	if(Org in organs_ext)
		var/obj/item/organ/external/O = Org
		operating_limbs.Add(O)
		switch(opname)
			if("Heal")
				while (O.damage > 0)
					sleep(30)
					O.damage -= rand(3,6)
					if(O.damage < 0)
						O.damage = 0
			if("remove")
				O.droplimb(1,DROPLIMB_EDGE)
				O.parent.take_external_damage(rand(5,14), used_weapon = /obj/item/circular_saw)
				occupant.custom_pain("[src.name] is just cutted off your [O.name]",100,affecting = O)
			if("purify")
				O.germ_level = 0
				for(var/wound in O.wounds)
					var/datum/wound/Wou = new wound
					Wou.disinfected = 1
			if("fix Bones")
				occupant.custom_pain("[src.name] made a cut on your skin",10,affecting = O)
				var/chance = rand(0,10)
				if(chance > 8)
					O.take_external_damage(3, used_weapon = /obj/item/scalpel)
					occupant.custom_pain("[src.name] cuts your internal tissue",15,affecting = O)
				O.status &= ~ORGAN_BROKEN
				O.update_wounds()
				occupant.custom_pain("[src.name] messed with your bones in your [O.name]",rand(20,30),affecting = O)
			if("attach")
				sleep(50)
				if(Stor_autodoc in typesof(/obj/item/organ/external) )
					var/obj/item/organ/external/E = Stor_autodoc
					O = E.parent_organ
					if(!BP_IS_CRYSTAL(E) && O)
						E.replaced(occupant)
					else
						visible_message("[src] Breaks the crystal bodypart, while it tries to attach it.")
				else if (Stor_autodoc in typesof(/obj/item/robot_parts))
					var/obj/item/robot_parts/L = Stor_autodoc
					if(L.part)
						for(var/part_name in L.part)
							if(!isnull(occupant.get_organ(part_name)))
								continue
							var/list/organ_data = occupant.species.has_limbs["[part_name]"]
							if(!organ_data)
								continue
							var/new_limb_type = organ_data["path"]
							var/obj/item/organ/external/new_limb = new new_limb_type(occupant)
							new_limb.robotize(L.model_info)
							if(L.sabotaged)
								new_limb.status |= ORGAN_SABOTAGED

				else if(Stor_autodoc in typesof(/obj/item/organ/internal))
					O.take_external_damage(rand(0,4), used_weapon = /obj/item/scalpel)
					sleep(30)
					O.internal_organs += Stor_autodoc
					occupant.custom_pain("[src.name] messed with your insides",rand(20,30),affecting = O)
				else
					O.take_external_damage(rand(0,4), used_weapon = /obj/item/scalpel)
					occupant.custom_pain("[src.name] messed with your insides",rand(20,30),affecting = O)
					sleep(30)
					O.implants += Stor_autodoc


				Stor_autodoc = null
			if("clamp")
				for(var/wound in O.wounds)
					var/datum/wound/Wou = new wound
					Wou.clamped = 1
					occupant.custom_pain("[src.name] has clamped a wound on your [O.name]",3,affecting = O)
				O.status &= ~ORGAN_ARTERY_CUT
			if("face")
				sleep(rand(500, 640))
				O.status &= ~ORGAN_DISFIGURED

			if("artery")
				sleep(rand(50, 60))
				O.status &= ~ORGAN_ARTERY_CUT

			if("remove implants")
				sleep(rand(50, 60))
				O.take_external_damage(rand(0,4), used_weapon = /obj/item/scalpel)
				occupant.custom_pain("[src.name] messed with your insides",rand(20,30),affecting = O)
				for(var/Imp in O.implants)
					var/obj/item/I = new Imp
					sleep(rand(10,30))
					if(!(I in permitted))
						occupant.remove_implant(I, TRUE, O)

		operating_limbs.Remove(O)

	else if(!(Org in organs_ext) && Org.name != "brain")
		var/obj/item/organ/internal/O = Org
		var/obj/item/organ/external/P = null
		if(O.parent_organ && (O.parent_organ in typesof(/obj/item/organ/external)))
			P = O.parent_organ
			operating_limbs.Add(P)
		switch(opname)
			if("Heal")
				if(!O.surface_accessible)
					P.take_external_damage(rand(0,4), used_weapon = /obj/item/scalpel)
					occupant.custom_pain("[src.name] made a cut on your skin",10,affecting = O)
				while (O.damage > 0)
					sleep(30)
					O.damage -= rand(3,6)
					if(O.damage < 0)
						O.damage = 0
			if("necro")
				if(!O.surface_accessible)
					P.take_external_damage(rand(0,7), used_weapon = /obj/item/scalpel)
					occupant.custom_pain("[src.name] made a cut on your skin",10,affecting = O)
				sleep(rand(30,50))
				O.germ_level = 0
				O.status &= ~ORGAN_DEAD
				O.owner.update_body(1)

			if("purify")
				if(!O.surface_accessible)
					P.take_external_damage(rand(0,4), used_weapon = /obj/item/scalpel)
					occupant.custom_pain("[src.name] made a cut on your skin",10,affecting = O)
				sleep(rand(100,120))
				O.germ_level = 0

			if("remove")
				O.status |= ORGAN_CUT_AWAY
				P.internal_organs -= O
				O.dropInto(src.loc)
				P.take_external_damage(rand(5,13), used_weapon = /obj/item/scalpel)
				occupant.custom_pain("[src.name] removes one of your organs",rand(30,40),affecting = O)

		operating_limbs.Remove(P)
		O.owner.update_body(1)
	else if(Org.name == "brain")
		var/obj/item/organ/internal/O = Org
		var/obj/item/organ/external/P = null
		if(O.parent_organ && (O.parent_organ in typesof(/obj/item/organ/external)))
			P = O.parent_organ
			operating_limbs.Add(P)
		switch(opname)
			if("completeheal")
				P.take_external_damage(rand(4,10), used_weapon = /obj/item/scalpel)
				occupant.custom_pain("[src.name] made a cut on your skin and drilled your scull",10,affecting = O)
				O.germ_level = 0
				while (O.damage > 0)
					sleep(30)
					O.damage -= rand(3,6)
					if(O.damage <0)
						O.damage = 0
			if("MMI")
				sleep(20)

		operating_limbs.Remove(P)
		O.owner.update_body(1)


	occupant.update_body()
	occupant.updatehealth()
	occupant.UpdateDamageIcon()
	if(!operating_limbs.len)
		operating = 0


/obj/machinery/autodoc/verb/eject()
	set name = "Eject"
	set category = "Object"
	set src in oview(1)
	if(usr.stat == DEAD)
		return
	if(occupant)
		if(usr == occupant)
			if(operating)
				to_chat(usr, "<span class='warning'>There's no way you're getting out while this thing is operating on you!</span>")
				return
			else
				visible_message("[usr] engages the internal release mechanism, and climbs out of \the [src].")
		if(usr && usr.skill_check(SKILL_MEDICAL, SKILL_ADEPT) )
			usr.visible_message("<span class='notice'>[usr] fumbles around figuring out how to use [src].</span>",
			"<span class='notice'>You fumble around figuring out how to use [src].</span>")
			var/fumbling_time = max(0 , SKILL_ADEPT - usr.get_skill_value(SKILL_MEDICAL))// 8 secs non-trained, 5 amateur
			if(do_after(usr, fumbling_time, src))
				if(operating)
					operating = 0
					if(usr && usr.skill_check(SKILL_MEDICAL, SKILL_ADEPT)) //Untrained people will fail to terminate the surgery properly.
						visible_message("\The [src] malfunctions as [usr] aborts the surgery in progress.")
				//		occupant.take_damage(rand(30,50),rand(30,50))
						message_staff("[key_name(usr)] ejected [key_name(occupant)] from the autodoc during surgery causing damage.")
						log_admin("[key_name(usr)] ejected [key_name(occupant)] from the autodoc during surgery causing damage.")

		go_out()
		add_fingerprint(usr)

/obj/machinery/autodoc/verb/move_inside()
	set name = "Enter autodoc"
	set category = "Object"
	set src in oview(1)

	if(usr.stat == DEAD || !ishuman(usr)) return
//	var/mob/living/carbon/human/H = usr
//	if(H.isSynthetic)
//		to_chat(usr, "<span class='notice'>\ [src] is incompatible with syntetic bodies!</span>")
//		return
	if(occupant)
		to_chat(usr, "<span class='notice'>\ [src] is already occupied!</span>")
		return

	if(stat & (NOPOWER|BROKEN))
		to_chat(usr, "<span class='notice'>\ [src] is non-functional!</span>")
		return

	if(usr &&  usr.skill_check(SKILL_MEDICAL, SKILL_ADEPT))
		usr.visible_message("<span class='notice'>[usr] fumbles around figuring out how to get into \the [src].</span>",
		"<span class='notice'>You fumble around figuring out how to get into \the [src].</span>")
		var/fumbling_time = max(0 , SKILL_ADEPT -  usr.get_skill_value(SKILL_MEDICAL))// 8 secs non-trained, 5 amateur
		if(!do_after(usr, fumbling_time, src)) return

	usr.visible_message("<span class='notice'>[usr] starts climbing into \the [src].</span>",
	"<span class='notice'>You start climbing into \the [src].</span>")
	if(do_after(usr, 10, src))
		if(occupant)
			to_chat(usr, "<span class='notice'>\ [src] is already occupied!</span>")
			return
		usr.stop_pulling()
		usr.client.perspective = EYE_PERSPECTIVE
		usr.client.eye = src
		usr.loc = src
		update_use_power(2)
		occupant = usr
		icon_state = "autodoc_closed"
//		start_processing()
//		connected.start_processing()

		for(var/obj/O in src)
			qdel(O)
		add_fingerprint(usr)

/obj/machinery/autodoc/proc/go_out()
	if(!occupant)
		return
	occupant.forceMove(loc)
	occupant = null
	queue = list()
	update_use_power(1)
	update_icon()
//	stop_processing()
//	connected.stop_processing()
//	connected.process() // one last update

/obj/machinery/autodoc/attackby(obj/item/W, mob/living/user)



	if(istype(W, /obj/item/grab))

		if(stat & (NOPOWER|BROKEN))
			to_chat(user, "<span class='notice'>\ [src] is non-functional!</span>")
			return

		if(src.occupant)
			to_chat(user, "<span class='notice'>\ [src] is already occupied!</span>")
			return

		var/obj/item/grab/G = W
		var/mob/M
		if(ismob(G.affecting))
			M = G.affecting
		else
			return

		if(!ishuman(M) ) // well, no medical experiments on monkeys

			to_chat(user, "<span class='notice'>\ [src] is compatible with humanoid anatomies only!</span>")
			return
//		var/mob/living/carbon/human/H = M
//		if(H.isSynthetic)
//			to_chat(user, "<span class='notice'>\ [src] is incompatible with syntetic bodies!</span>")
//			return
		if (M.abiotic())
			to_chat(user, "<span class='warning'>Subject cannot have abiotic items on.</span>")
			return

		if(user && user.skill_check(SKILL_MEDICAL, SKILL_ADEPT))
			user.visible_message("<span class='notice'>[user] fumbles around figuring out how to put [M] into [src].</span>",
			"<span class='notice'>You fumble around figuring out how to put [M] into [src].</span>")
			var/fumbling_time = max(0 , SKILL_ADEPT - user.get_skill_value(SKILL_MEDICAL))// 8 secs non-trained, 5 amateur
			if(do_after(user, fumbling_time, src))
				visible_message("[user] finally figures out.", 3)
		visible_message("[user] starts putting [M] into [src].", 3)

		if(do_after(user, 10, src))
			if(src.occupant)
				to_chat(user, "<span class='notice'>\ [src] is already occupied!</span>")
				return
			if(!M || !G) return
			M.forceMove(src)
			update_use_power(2)
			occupant = M
			icon_state = "autodoc_closed"
		//	start_processing()
		//	connected.start_processing()

			add_fingerprint(user)


/obj/machinery/computer/autodoc_console
	name = "\improper autodoc console"
	desc = "Console used to control autodoc."
	icon_keyboard = "power_key"
	icon_screen = "crew"
	light_color = "#315ab4"
	idle_power_usage = 250
	active_power_usage = 500
	var/datum/nano_module/autodoc_console/auto

/obj/machinery/computer/autodoc_console/New()
	..()
	auto = new(src)


/obj/item/stock_parts/circuitboard/autodoc_control
	name = T_BOARD("Autodoc console")
	build_path = /obj/machinery/computer/autodoc_console
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_POWER = 5)

/obj/machinery/computer/autodoc_console/Destroy()
	qdel(auto)
	auto = null
	..()


/obj/machinery/computer/autodoc_console/attack_ai(mob/user)
	ui_interact(user)



/obj/machinery/computer/autodoc_console/attack_hand(mob/user)
	ui_interact(user)

/obj/machinery/computer/autodoc_console/nano_container()
	return auto


/obj/machinery/computer/autodoc_console/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.default_state)
	auto.ui_interact(user, ui_key, ui, force_open, state)




/datum/nano_module/autodoc_console
	name = "Autodoc control"
	var/list/permitted_implants = list(/obj/item/implant/chem, /obj/item/implant/death_alarm, /obj/item/implant/loyalty, /obj/item/implant/adrenalin, /obj/item/implant/translator)
	var/emagged = TRUE
	var/obj/item/organ/sellimb
	var/list/organs = list()
	var/list/operations = list()
	var/obj/item/organ/Something_selected = null
	var/window = 0
	var/obj/machinery/autodoc/connected = null



/datum/nano_module/autodoc_console/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui=null, force_open=1, var/datum/topic_state/state = GLOB.default_state)
	var/list/data = host.initial_data()

	if(connected)
		data["autodoc"] = 1
	else
		data["autodoc"] = 0
	if(connected)
		data["stasis"] = connected.stasis
		data["anestesia"] = connected.anestesia
	organs = list()
	if(connected)
		for(var/obj/item/organ/external/O in connected.organs_ext)
			var/list/status = new/list()
			var/list/implants = new/list()
			var/list/internal = new/list()

			if(BP_IS_ROBOTIC(O))
				status.Add("synthetic")
			else
				if(O.damage > 0)
					switch(O.damage / O.max_damage)
						if(0 to 1)
							status.Add(" damaged")
						if(1 to INFINITY)
							status.Add(" seriously damaged")
				if(O && (O.status & ORGAN_DISFIGURED))
					status.Add(" disfigured face")
				if(O && (O.status & ORGAN_ARTERY_CUT))
					status.Add(" damaged artery")
				if(O && (O.status & ORGAN_BROKEN))
					status.Add(" broken bones")
				if(O && (O.status & ORGAN_DEAD))
					status.Add(" disfigured face")
				for(var/datum/wound/Wou in O.wounds)
					if(!Wou.bandaged || !Wou.clamped)
						status.Add(" bleeding")
						break
				switch(O.germ_level)
					if(1 to INFECTION_LEVEL_TWO)
						status.Add(" infected")

					if(INFECTION_LEVEL_TWO to INFINITY)
						status.Add(" heavily infected")

			for(var/obj/item/organ/internal/I in O.internal_organs)
				var/list/internalstatus = new/list()
				if(BP_IS_ROBOTIC(I))
					internalstatus.Add(" synthetic")
				else if(I && (I.status & ORGAN_DEAD) && !(I.can_recover()))
					internalstatus.Add(" dead")
				else
					if(I.damage > 0)
						switch(I.damage / I.max_damage)
							if(0 to 1)
								status.Add(" damaged")
							if(1 to INFINITY)
								status.Add(" seriously damaged")
					if(I && (I.status & ORGAN_DEAD) )
						internalstatus.Add(" necrosis(initial)")
					switch(O.germ_level)
						if(1 to INFECTION_LEVEL_TWO)
							internalstatus.Add(" infected")
						if(INFECTION_LEVEL_TWO to INFINITY)
							internalstatus.Add(" heavily infected")
				internal.Add(list(list(
				"intproblems" = internalstatus,
				"condition" = I.damage / I.max_damage,
				"name" = I.name,\
				"id" = I)))

			for(var/obj/item/I  in O.implants)
				implants.Add(list(list(
				"name" = I.name,\
				"id" = I)))

			organs.Add(list(list(
			"problems" = status,
			"condition" = O.damage / O.max_damage,
			"internal" = sortByKey(internal, "name"),
			"implants" = sortByKey(implants, "id"),
			"name" = O.name,\
			"id" = O)))

		data["organs"] = sortByKey(organs, "name")
		data["auto"] = connected.automaticmode
		if(connected.occupant)
			data["patientstatus"] = connected.occupant.stat
			data["health"] = connected.occupant.health
			data["mhealth"]	= connected.occupant.maxHealth
			data["relat"] = connected.occupant.health / connected.occupant.maxHealth * 100
			if(connected.occupant.stat == DEAD)
				data["dead"] = 1
			else
				data["dead"] = 0

	var/list/permittedI = new/list()
	for(var/I in permitted_implants)
		var/obj/item/Ino = new I
		permittedI.Add(list(list(
		"name" = Ino.name,\
		"id" = Ino
		)))
	data["PermittedI"] = permittedI
	data["selected_operations"] = operations
	data["selected"] = Something_selected
	data["window"] = window
	if(sellimb)
		data["selectedlimb"] = sellimb




	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "autodoc.tmpl", "Autodoc Console", 600, 400, state = state)
		if(host.update_layout()) // This is necessary to ensure the status bar remains updated along with rest of the UI.
			ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

// Proc: Topic()
// Parameters: 2 (href, href_list - allows us to process UI clicks)
// Description: Allows us to process UI clicks, which are relayed in form of hrefs.
/datum/nano_module/autodoc_console/Topic(href, href_list)

	if(href_list["SelectLimb"])
		var/name = (href_list["SelectLimb"])
		for(var/obj/item/organ/O in connected.organs)
			if(O.name == name)
				Something_selected = O
				sellimb = O.name
				break
		var/list/status = new/list()
		if(BP_IS_ROBOTIC(Something_selected))
			status.Add("augment")
		else
			if(Something_selected.damage > 0)
				status.Add("damaged")
			if(Something_selected && (Something_selected.status & ORGAN_DISFIGURED))
				status.Add("disfigured face")
			if(Something_selected && (Something_selected.status & ORGAN_ARTERY_CUT))
				status.Add("damaged artery")
			if(Something_selected && (Something_selected.status & ORGAN_BROKEN))
				status.Add("broken bones")
			if(Something_selected && (Something_selected.status & ORGAN_DEAD))
				status.Add("disfigured face")
			if(Something_selected.germ_level > 0)
				status.Add("infected")
			if(Something_selected in connected.organs_ext)
				var/obj/item/organ/external/E = Something_selected
				for(var/datum/wound/Wou in E.wounds)
					if(!Wou.bandaged || !Wou.clamped)
						status.Add("bleed")
						break
				for(var/imp in E.implants)
					var/obj/item/I = new imp
					if(!(I in permitted_implants))
						status.Add("implant")
						break


		operations = status

	if(href_list["HealO"])
		var/name = (href_list["HealO"])
		connected.surgery(name, "Heal")
	if(href_list["RemoveO"])
		var/name = (href_list["RemoveO"])
		connected.surgery(name, "remove")
	if(href_list["PuriO"])
		var/name = (href_list["PuriO"])
		connected.surgery(name, "purify")
	if(href_list["BoneO"])
		var/name = (href_list["BoneO"])
		connected.surgery(name, "fix Bones")
	if(href_list["FaceO"])
		var/name = (href_list["FaceO"])
		connected.surgery(name, "face")
	if(href_list["VeinO"])
		var/name = (href_list["VeinO"])
		connected.surgery(name, "artery")
	if(href_list["BandO"])
		var/name = (href_list["BandO"])
		connected.surgery(name, "clamp")
	if(href_list["ImplO"])
		var/name = (href_list["ImplO"])
		connected.surgery(name, "Heal")
	if(href_list["TranspO"])
		var/name = (href_list["TranspO"])
		connected.surgery(name, "attach")
	if(href_list["NecrO"])
		var/name = (href_list["NecrO"])
		connected.surgery(name, "necro")

	if(href_list["RemoveImp"])
		var/name = (href_list["RemoveImp"])
		for(var/obj/item/I in permitted_implants)
			if(I.name == name)
				permitted_implants.Remove(I)
				break

	if(href_list["Find Autodoc"])
		for(var/obj/machinery/autodoc/Auto in autodocs)
			if(get_dist(src, Auto) < 150)
				connected = Auto
				Auto.console = src
				window = 3
	if(href_list["anest"])
		if(connected.anestesia)
			connected.anestesia = 0
		else
			connected.anestesia = 1

	if(href_list["setstasis"])
		if(connected.occupant)
			var/inputset = (input(usr, "Enter stasis level", "Autodoc stasis setings", connected.stasis) as num)
			connected.stasis = inputset

	if(href_list["Defib"])
		connected.defib()

	if(href_list["eject"])
		connected.go_out()

	if(href_list["Que"])
		window = 2

	if(href_list["Settings"])
		window = 3

	if(href_list["Control"])
		window = 1

	if(href_list["switch"])
		connected.automaticmode = !connected.automaticmode
