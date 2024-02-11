/datum/job/service_officer
	title = "Service Officer"
	department = "Service"
	department_flag = SRV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the hotel manager"
	selection_color = COLOR_PALE_BTL_GREEN
	economic_power = 1
	access = list(hstaff, penth, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, penth, kitchen, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/hotel/service_officer

/datum/job/service_officer/get_description_blurb()
return "Вы - Сотрудник по Обслуживанию. Ваша универсальная роль включает в себя элементы работы сотрудника отеля и официанта, охватывая широкий спектр обязанностей для обеспечения комфорта гостей. 
Вы занимаетесь обслуживанием гостей во время их прибытия, выезда и пребывания в отеле, выполняя их несложные поручения и заказы.
При встрече гостей в отеле вы предоставляете информацию о услугах и удобствах, а также выполняете несложные поручения, например, предоставление дополнительных полотенец или  ужина в номер.
После выезда гостей из номера вы проводите уборку и подготовку помещения для новых постояльцев. Ваша работа направлена на обеспечение чистоты и порядка в гостиничных помещениях.
Принимая заказы от клиентов ресторана, вы эффективно коммуницируете с поваром и передаете заказы на приготовление. После готовности блюд вы доставляете их на столы гостей или в номера в соответствии с их предпочтениями.
Обеспечьте высокий уровень обслуживания и комфорта для гостей и они придут к вам снова!
Удачи!"

//--------------------------------------------

/datum/job/cook
	title = "Cook"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the hotel manager"
	selection_color = COLOR_PALE_BTL_GREEN
	access = list(hstaff, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, kitchen, maint, access_hydroponics)
	//alt_titles = list("Chef")
	outfit_type = /decl/hierarchy/outfit/job/hotel/cook

/datum/job/cook/get_description_blurb()
return "Вы - Повар. Создавайте изысканные кулинарные шедевры, удовлетворяя вкусовые предпочтения самых взыскательных гостей.
Кричите на стюардов, которые слишком долго несут ваш заказ.
Жарьте, варите, тушите, подавайте свежим - всё зависит лишь от вас и вашего творческого виденья! Принимайте восторжённые отзывы и игнорируйте плохие!
Удачи!"

//--------------------------------------------

/datum/job/bartender
	title = "Bartender"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the hotel manager"
	selection_color = COLOR_PALE_BTL_GREEN
	access = list(hstaff, kitchen, maint, access_hydroponics)
	minimal_access = list(hstaff, kitchen, maint, access_hydroponics)
	//alt_titles = list("Barista")
	outfit_type = /decl/hierarchy/outfit/job/hotel/bartender

/datum/job/bartender/get_description_blurb()
return "Вы - Бармен. Бар ресторана - это ваш холст.
Ваша основная обязанность — быстро и вкусно готовить коктейли и наливать выпивку, но не забывайте и про дружественную атмосферу. 
Будьте общительны и в состоянии посоветовать что-то посетителю. Выслушивайте их слёзные истории.
Слушайте, о чём болтают клиенты и не забывайте брать с них плату до тех пор, пока они не начали пускать пузыри в пьяном забвении.
Именно благодаря вашей харизме многие посетители будут возвращаться к вам, чтобы выпить в вашей компании и .
Удачи!"

//--------------------------------------------

/datum/job/manager
	title = "Hotel Manager"
	department = "Service"
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	selection_color = COLOR_BOTTLE_GREEN
	economic_power = 1
	access = list(hadmin, hstaff, penth, kitchen, maint, access_hydroponics)
	minimal_access = list(hadmin, penth, hstaff, kitchen, maint, access_hydroponics)
	outfit_type = /decl/hierarchy/outfit/job/hotel/manager

/datum/job/manager/get_description_blurb()
return "Вы - Администратор Отеля. 
Ваша работа включает в себя управление и обеспечение эффективной работы гостиничного комплекса на космической станции “Либерти”.
Руководите большим развлекательно-рекреационным комплексом, который включает в себя отель, ресторан,  спортзал, спа, сауну и казино. 
В вашем распоряжении стюарды, повар и бармен. Убедитесь в том, что ваши работники создают комфорт и уют для ваших посетителей.
За стенами казино находится убежище наёмников и контрабандистов. Вы знаете о них и в целом не против их нахождения там, покуда они не создают вам проблем и приносят выгоду.
Следите за порядком и безопасностью и не стесняйтесь в поисках дополнительных ресурсов для обеспечения своего комплекса.
Удачи!"
