/datum/job/cmo
	title = "Chief Medical Officer"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#026865"
	req_admin_notify = 1
	economic_power = 10
	access = list(chmo, doctor, farma, maint, access_hydroponics)
	minimal_access = list(chmo, doctor, farma, maint, access_hydroponics)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

/datum/job/cmo/get_description_blurb()
return "Вы - Главный Врач. Ваша роль включает в себя общее руководство и управление медицинским персоналом частной клиники на станции “Либерти”, обеспечение высоких стандартов медицинского обслуживания и эффективное экономическое существование клиники.
Вы занимаетесь координацией работы клиники, управлением ресурсами и внедрением новых медицинских технологий и методов лечения. Как главврач, вам поручено также обеспечивать соблюдение всех медицинских стандартов и законов, регулирующих деятельность клиники.
Кроме того, вам приходится взаимодействовать с пациентами, родственниками и другими членами медицинского сообщества на станции. Ваша роль играет важную часть в обеспечении клиники не только высокотехнологичным оборудованием, но и экономической выгодой для вашей компании.
Удачи!"

//--------------------------------------------

/datum/job/doctor
	title = "Medical Doctor"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 3
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#013d3b"
	economic_power = 7
	access = list(doctor, farma, maint, access_hydroponics)
	minimal_access = list(doctor, farma, maint, access_hydroponics)
	//alt_titles = list(
	//	"Surgeon" = /decl/hierarchy/outfit/job/medical/doctor/surgeon,
	//	"Emergency Physician" = /decl/hierarchy/outfit/job/medical/doctor/emergency_physician,
	//	"Nurse" = /decl/hierarchy/outfit/job/medical/doctor/nurse,
	//	"Virologist" = /decl/hierarchy/outfit/job/medical/doctor/virologist)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

/datum/job/doctor/get_description_blurb()
return "Вы - Доктор. Ваша роль заключается в обеспечении высококвалифицированной медицинской помощи для обитателей станции. Ваша задача - диагностика и лечение пациентов.
Ваши обязанности включают проведение медицинских осмотров, составление диагнозов, предписание лечения и проведение процедур. Вы также можете консультировать пациентов касательно стоимости различных услуг в вашей клинике.
Ваша профессиональная и заботливая деятельность играет важную роль в обеспечении благополучия и здоровья обитателей станции. Удачи!"

//--------------------------------------------

/datum/job/pharmacist
	title = "Pharmacist"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 7
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#013d3b"
	economic_power = 5
	access = list(doctor, farma, maint, access_hydroponics)
	minimal_access = list(doctor, farma, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/medical/pharmacist

/datum/job/pharmacist/get_description_blurb()
return "Вы - Фармацевт. Ваша роль включает в себя обеспечение правильного и безопасного распределения лекарственных средств, контроль за запасами медикаментов и предоставление поддержки медицинскому персоналу и продажа препаратов посетителям.
Ваши обязанности включают хранение и выдачу лекарственных препаратов в соответствии с запросами врачей. Вы должны обеспечивать клинику необходимыми медикаментами.
Вам может быть поручено сотрудничество с медицинскими представителями, предоставление информации пациентам по применению лекарств, а также управление документацией, связанной с фармацевтическими процессами в клинике.
Удачи!"
