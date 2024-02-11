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
					access_hydroponics, shop, hstaff, hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, psycho, priveye, chapl, keno, penth)
	minimal_access = list(access_director_apartment, access_director_office, maint, cargonia, hangar, engmain, engpower, engatmos, engtcom,
					access_hydroponics, shop, hstaff, hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, psycho, priveye, chapl, keno, penth)

	outfit_type = /decl/hierarchy/outfit/job/director

/datum/job/director/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/director/get_description_blurb()
return "Вы - Директор. Вы обладаете выдающимися управленческими навыками и стремитесь обеспечить эффективное функционирование станции. Не подведите - остальной директорат и управление пристально наблюдает за вашими успехами.
Следите за работой подчинённых отделов - Порт, Отель и Инженерный полностью под вашим надзором. Взымайте плату с отдельных бизнесов, вроде клиники и техноартеля. Заключайте легальные (или не очень) сделки со всеми, чьи предложения достаточно выгодны для вас и вашей корпорации. Но не наглейте - за соблюдением закона следит Федеральная Полиция ПСС.
Ваши решения во многом определят то, с чем сегодня предстоит столкнуться всем обитателям станции. Удачи!"

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
					hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, chapl, penth)
	minimal_access = list(access_director_office, maint, hangar, cargonia, engmain, engtcom, access_hydroponics, shop, hstaff,
					hadmin, kitchen, cargoboss, access_aft_chkp, access_janitor, chapl, penth)

	outfit_type = /decl/hierarchy/outfit/job/secretary

/datum/job/secretary/get_description_blurb()
return "Вы - Секретарь. В роли правой руки директора станции, вы являетесь неотъемлемой частью администрации, обеспечивая бесперебойное функционирование “Либерти” и поддерживая эффективность рабочих процессов.
Ваша роль включает в себя ассистирование директора и управление потоком информации между различными отделами.
Принимайте решения в отсутствие директора, обеспечивая бесперебойное функционирование станции. Составляйте отчеты по факту совершенных административных действий и  обеспечиваете своевременное информирование директора по всем важным вопросам.
Быть верным слугой и помощником Директора или попытаться переиграть своего босса и занять его кресло? Вам решать! Удачи!"

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

/datum/job/consul/get_description_blurb()
return "Вы - Консул. Как амбассадор Правительства Солнечной Системы, ваша роль на станции "Либерти" включает наблюдение за деятельностью Федеральной Полиции и активное сотрудничество с местной администрацией, представленной Директором и Секретарем. Станция "Либерти" играет ключевую роль в исследовательских инициативах и потенциальной экспансии ПСС, и ваша миссия - обеспечить безопасность и стабильность на этом объекте.
Оказывайте помощь полиции и докладывайте о их деятельности в Центральный Комитет, если в этом есть необходимость. 
Содействуйте стратегическим и экономическим инициативам, которые могут поддержать как интересы ПСС, так и благосостояние станции.
Учавствуйте в  совещаниях и переговорах, направленных на разрешение потенциальных конфликтов и обеспечение гармонии в отношениях между ПСС и местными обитателями.
Будьте образцом высоких моральных ценностей, обеспечивая гармоничное соседство и благоприятные условия для взаимодействия.
Удачи!

"

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

/datum/job/corpo_representative/get_description_blurb()
return "Вы - Корпоративный Представитель. Вы - гарант сохранения взаимовыгодных отношений между станцией и корпорациями.
Ваша основная задача - обеспечить сохранность и выполнение условий договоров между станцией и корпорациями, которые представляют на ней свои товары и услуги. Вы также тесно сотрудничаете с Консулом, Директором и Секретарём, чтобы обеспечить гармоничное взаимодействие между корпоративными интересами и административными процессами станции. Ваша роль важна для поддержания партнёрства и стабильности в деловых отношениях на станции "Либерти".
Помогайте предприятиям решать внутренние или внешние конфликты и, конечно, не упустите ни одной возможности заработать на этом!
Вы - ключевой посредник между всеми компаниями и администрацией и гарантируете, что все предприятия станции “Либерти” будут успешно функционировать.
Удачи!"
