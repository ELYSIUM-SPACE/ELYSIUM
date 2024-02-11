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
	access = list(access_sol_sfp, access_sol_sfp_command, access_brig, access_armory, sfphos, sfparmory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_external_airlocks, access_hydroponics)
	minimal_access = list(access_sol_sfp, access_sol_sfp_command, access_brig, access_armory,  sfphos, sfparmory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_external_airlocks, access_hydroponics)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_curator

/datum/job/sfp_curator/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

/datum/job/sfp_curator/get_description_blurb()
return "Вы - Куратор Федеральной Полиции. Под вашим руководством находится местная ячейка вашей организации, которая должна следить за тем, чтобы как обитатели, так и посетители станции “Либерти” соблюдали Конституцию и Законы Правительства Солнечных Систем. Вы ответственны за соблюдение стандартов этики и законности в действиях агентов Федеральной Полиции. Вы и ваши сотрудники должны соответствовать высоким стандартам Правительства Солнечных Систем.
Курируйте работу Следователей и направляйте Агентов Реагирования в тех случаях, когда соблюдение закона нужно поддержать силой. 
Поддерживайте связь с Консулом и руководством через факс, вовлекайте их в дела вашего отдела в случае необходимости.
Помните, что вы не всевластны и не превыше закона. Удачи!"

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
	access = list(access_sol_sfp, access_brig, access_armory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_external_airlocks, access_hydroponics)
	minimal_access = list(access_sol_sfp, access_brig, access_armory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_external_airlocks, access_hydroponics)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_investigator

/datum/job/sfp_investigator/get_description_blurb()
return "Вы - Следователь Федеральной Полиции. 
Ваша профессия включает в себя разносторонние обязанности, направленные на расследование преступлений и обеспечение справедливости в космической среде. 
Проводите детальные расследования, собирая улики, интервьюируя свидетелей и выстраивая цепь событий для раскрытия преступлений.
Пользуйтесь передовыми технологиями и методами для анализа физических улик с целью выявления ключевых аспектов дела.
Проводите экспертизу, анализируя факторы, связанные с медицинской и судебной стороной преступлений.
Ваши навыки и оборудование позволяют вам интерпретировать результаты и предоставлять экспертные заключения, необходимые для вынесения приговора.
Тесно сотрудничайте с Куратором и Агентами Реагирования для поддержания расследования. Не стесняйтесь привлекать к помощи своих коллег, но следите за тем, чтобы они не оставили свои отпечатки на месте преступления.
Удачи!"

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
	access = list(access_sol_sfp, access_brig, access_armory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, koni, access_external_airlocks, access_hydroponics)
	minimal_access = list(access_sol_sfp, access_brig, access_armory, sfpmain, sfplaba, access_aft_chkp, scgdocks, maint, access_external_airlocks, koni, access_hydroponics)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/sfp_agent

/datum/job/sfp_agent/get_description_blurb()
return "Вы - Агент Реагирования Федеральной Полиции. Ваша профессия предполагает быстрое и решительное действие в ситуациях, требующих принятия мер безопасности и контроля над потенциальными угрозами, которые могут возникнуть на станции “Либерти”.
Ваша роль - быть силовым звеном Федеральной Полиции, способным оперативно реагировать на различные чрезвычайные ситуации.
Ваша работа требует сотрудничества со Следователями и Куратором, чтобы гарантировать эффективную координацию в ситуациях, требующих быстрого и организованного реагирования.
Вы обучены и оснащены средствами для обеспечения безопасности персонала и граждан, а также предотвращения преступлений и актов нарушения правопорядка. В экстренных ситуациях, таких как террористические угрозы или вооруженные инциденты, вы являетесь первым откликом, стремясь минимизировать риски и обеспечить защиту обитателей станции.
Помните, в первую очередь, вы - защита, а не кара.
Удачи!"
