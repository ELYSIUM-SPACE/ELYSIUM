/datum/job/dev_head
	title = "Head of Development"
	head_position = 1
	department = "Science"
	department_flag = COM|SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the director"
	selection_color = "#ad6bad"
	req_admin_notify = 1
	economic_power = 15
	access = list(rndboss, rndshop, rndbot, maint, access_hydroponics)
	minimal_access = list(rndboss, rndshop, rndbot, maint, access_hydroponics)
	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/science/rd

/datum/job/dev_head/get_description_blurb()
return "Вы - Глава Разработки. Ваша роль представляет собой руководство и управление местным Техноартелем. Координируйте работу Учёных в создании высокотехнологичных и креативных продуктов и задавайте общий вектор разработки. Ищите новые возможности и ресурсы. Возможно, Шахтёры или ЭК обладают интересными артефактами и находками, которые вы можете приобрести или… добыть альтернативными способами. В случае необходимости - попытайте удачи найти на станции энтузиастов, которые помогут вам в ваших легальных или не очень инициативах. Организовывайте розничную торговлю в вашем магазине или договаривайтесь о крупных поставках с частными клиентами или другими организациями. Ваши изобретения могут во многом помочь обитателям станции или навредить им. Удачи!"

//--------------------------------------------

/datum/job/scientist
	title = "Scientist"
	department = "Science"
	department_flag = SCI

	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of development"
	selection_color = "#633d63"
	economic_power = 7
	access = list(rndshop, rndbot, maint, access_hydroponics)
	minimal_access = list(rndshop, rndbot, maint, access_hydroponics)
	//alt_titles = list("Xenoarcheologist", "Anomalist", "Phoron Researcher")
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

/datum/job/scientist/get_description_blurb()
return "Вы - Учёный. Ваша профессия включает в себя исследование и разработку новых устройств и технологий в различных научных областях.
В зависимости от специализации, вы можете заниматься разработкой новых технологий, улучшением существующих или применением научных открытий в практических областях.
Вам предоставляется возможность воплотить свои идеи в жизнь. Создание технологических гаджетов или исследование неизвестного артефакта с неназванной планеты - каждый проект становится частью вашего научного творчества. 
Создавайте уникальные прототипы вместе со своими коллегами.
Не ограничивайтесь стенами станции. Если нужно - ищите новые возможности в космосе и за его пределами, чтобы внести свой вклад в бурное развитие вашей компании.
Удачи!"

//--------------------------------------------

/datum/job/robotechnician
	title = "Robotechnician"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of development"
	selection_color = "#633d63"
	economic_power = 5
	access = list(rndshop, rndbot, maint, access_hydroponics) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_access = list(rndshop, rndbot, maint, access_hydroponics) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	//alt_titles = list("Biomechanical Engineer","Mechatronic Engineer")
	minimal_player_age = 3
	outfit_type = /decl/hierarchy/outfit/job/science/robotechnician

/datum/job/robotechnician/get_description_blurb()
return "Вы - Робототехник.
В зависимости от потребностей отдела или клиентов, вы разрабатываете и ремонтируете такие устройства, как кибернетические протезы различных классов и назначений. Также ваша специальность подразумевает создание и производство разнообразных роботов для выполнения различных функций - от ботов-уборщиков до инженерных боргов и меха - специализированных экзоскелетов, предназначенных для выполнений различных задач, включая работу в непригодных для живых существ условиях.
Удачи!"
