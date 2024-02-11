/datum/job/visitor
	title = "Visitor"
	department = "Civilian"
	department_flag = CIV

	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	economic_power = 1
	access = list()			//See /datum/job/visitor/get_access()
	minimal_access = list()	//See /datum/job/visitor/get_access()
	//alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	outfit_type = /decl/hierarchy/outfit/job/visitor

/datum/job/visitor/get_access()
	return list()

/datum/job/visitor/get_description_blurb()
return "Вы - Посетитель. Судьба тем или иным образом привела вас на станцию “Либерти”. 
Ваша роль даёт вам большую степень свободы и выбора того, как пройдёт ваш день.
Ваш опыт на станции может быть разнообразным и уникальным. Вы можете исследовать различные аспекты жизни на станции и общаться с разными её обитателями.
Ваш путь на станции полностью зависит от ваших предпочтений. Вы можете выбирать, как взаимодействовать с окружающим миром и какие цели преследовать.
Вы - свободный и независимый участник космического общества. Ваши действия и выборы формируют вашу историю на станции, делая вас частью её жизни и событий
Удачи!"
