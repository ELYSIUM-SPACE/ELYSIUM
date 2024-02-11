/datum/job/harbormaster
	title = "Harbormaster"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = COLOR_DARK_ORANGE
	economic_power = 5
	access = list(cargoboss, cargonia, hangar, maint, keno, access_hydroponics)
	minimal_access = list(cargoboss, cargonia, hangar, maint, keno, access_hydroponics)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/dock/harbormaster

/datum/job/harbormaster/get_description_blurb()
return "Вы - Начальник Порта. Ваша роль включает в себя обеспечение эффективного и безопасного функционирования космопорта, а также управление всеми грузовыми и логистическими операциями. Ваша работа направлена на обеспечение синхронизированной и организованной деятельности вашего отдела.
Под вашим руководством команда верных рабочих. На вашем складе хранится имущество станции, так что будьте начеку - отвечать в случае чего придётся вам.
Также под вашим контролем находится аренда складских помещений, которые вы можете сдавать всем желающим, тем самым создавая благоприятные условия для различных предпринимателей и компаний на станции "Либерти".
Удачи!"

//--------------------------------------------

/datum/job/docker
	title = "Docker"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the harbormaster and the secretary"
	selection_color = COLOR_DARK_ORANGE
	access = list(cargonia, hangar, maint, keno, access_hydroponics)
	minimal_access = list(cargonia, hangar, maint, keno, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/dock/docker

/datum/job/docker/get_description_blurb()
return "Вы - Портовый Рабочий. Ваши обязанности могут варьироваться от направления прибывающих кораблей к докам до обеспечения безопасного разгрузочного процесса. Вы можете заниматься организацией таможенных формальностей, помогать экипажам с необходимыми запросами и документацией.
Вы также занимаетесь складскими операциями. Это может включать в себя прием и отправку грузов, проверку инвентаря, и в целом, поддержание порядка на складе.
Ваша работа также включает в себя взаимодействие с капитанами кораблей, членами экипажей и другими работниками порта. Вам следует соблюдать инструкции Начальника Порта, а также содействовать в поддержании безопасности и порядка в портовых зонах.
Ваша роль как Работника Порта - это важное звено в процессе обслуживания космических кораблей и обеспечения эффективного функционирования порта станции "Либерти".
Удачи!"
