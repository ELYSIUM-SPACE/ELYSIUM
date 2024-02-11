/datum/job/chief_engineer
	title = "Chief Engineer"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	economic_power = 10

	ideal_character_age = 50


	access = list(engmain, engpower, engatmos, engtcom, access_external_airlocks, hangar, access_aft_chkp, maint, access_hydroponics, keno)
	minimal_access = list(engmain, engpower, engatmos, engtcom, access_external_airlocks, hangar, access_aft_chkp, maint, access_hydroponics, keno)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer

/datum/job/chief_engineer/get_description_blurb()
return "Вы - Главный Инженер. Ваша роль представляет собой ключевую позицию в обеспечении стабильности и эффективности всех важных систем станции “Либерти”
Ваша ответственность включает в себя не только техническую экспертизу, но и координацию работы инженерного персонала. Вам поручено руководство небольшой командой Инженеров, занимающихся обслуживанием, ремонтом и модернизацией технических систем станции. Ваша роль также включает в себя взаимодействие с администрацией станции, чтобы гарантировать, что технические аспекты станции соответствуют всем нормам и стандартам. Вы активно участвуете в планировании и реализации проектов по модернизации инженерных систем.
Ваша работа направлена на создание устойчивой и функциональной инженерной инфраструктуры, что обеспечивает не только комфорт и безопасность обитателей станции, но и её способность справляться с вызовами космоса.
Следите за состоянием реактора. Организовывайте ремонтные работы судов и кораблей. Закручивайте гвозди. Забивайте болты.
Удачи!"

//--------------------------------------------

/datum/job/station_engineer
	title = "Station Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 3
	spawn_positions = 3
	supervisors = "the chief engineer"
	selection_color = "#5b4d20"
	economic_power = 5
	minimal_player_age = 7
	access = list(engmain, engpower, engatmos, access_external_airlocks, hangar, maint, access_hydroponics, keno)
	minimal_access = list(engmain, engpower, engatmos, access_external_airlocks, hangar, maint, access_hydroponics, keno)
	//alt_titles = list("Maintenance Technician","Engine Technician","Electrician",
	//	"Atmospheric Technician" = /decl/hierarchy/outfit/job/engineering/atmos)
	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

/datum/job/station_engineer/get_description_blurb()
return "Вы - Инженер. Ваша роль состоит в том, чтобы эффективно выполнять задачи по поддержанию и ремонту технических систем станции “Либерти” под руководством Главного Инженера.
Под вашей ответственностью находятся реактор, атмосферная система, терминалы связи и другие инфраструктурные элементы. Вы работаете в тесном сотрудничестве с остальными членами инженерной команды, чтобы обеспечить нормальное функционирование всех систем станции.
Ваша роль также включает в себя активное участие в ремонтных работах, а также отклик на чрезвычайные ситуации, требующие быстрого и компетентного реагирования. Вы следуете указаниям Главного Инженера и содействуете в достижении общих инженерных целей.
Ваша преданность команде и профессионализм играют ключевую роль в поддержании стабильности технических систем станции "Либерти" и обеспечении безопасности для всех её обитателей.
Удачи!"
