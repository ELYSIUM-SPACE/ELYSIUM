/datum/job/trader
	title = "Trader"
	department = "Civilian"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	economic_power = 5
	access = list(shop)
	minimal_access = list(shop)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/visitor

/datum/job/trader/get_description_blurb()
return "Вы - Торговец. Ваша задача - создать привлекательный и разнообразный ассортимент товаров в вашем магазине, который привлечет внимание и удовлетворит потребности разнообразной клиентской аудитории.
Проводите акции, создавайте специальные предложения и рекламу для привлечения внимания к вашему магазину!
Тщательно подбирайте товары для вашего магазина, ориентируясь на интересы и потребности обитателей и посетителей станции “Либерти”. Ваш ассортимент включает товары для повседневного использования, развлекательные и уникальные предметы, косметику и предметы гигиены.
Вы можете рискнуть и начать торговать чем-то нелегальным, но тогда ждите гостей в лице Федеральной Полиции. 
На вашем небольшом складе вы эффективно управляете запасами товаров, следите за их актуальностью и обновляете ассортимент в соответствии с изменяющимися предпочтениями клиентов.
Сделайте ваш магазин привлекательным местом с разнообразным ассортиментом товаров и вы будете успешны!
Удачи!"

//--------------------------------------------

/datum/job/chaplain
	title = "Chaplain"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	access = list(chapl)
	minimal_access = list(chapl)
	outfit_type = /decl/hierarchy/outfit/job/chaplain

	equip(var/mob/living/carbon/human/H, var/alt_title, var/ask_questions = TRUE)
		. = ..()
		if(!.)
			return
		if(!ask_questions)
			return

		var/obj/item/storage/bible/B = locate(/obj/item/storage/bible) in H
		if(!B)
			return

		spawn(0)
			var/religion_name = "Christianity"
			var/new_religion = sanitize(input(H, "You are the crew services officer. Would you like to change your religion? Default is Christianity, in SPACE.", "Name change", religion_name), MAX_NAME_LEN)

			if (!new_religion)
				new_religion = religion_name
			switch(lowertext(new_religion))
				if("christianity")
					B.SetName(pick("The Holy Bible","The Dead Sea Scrolls"))
				if("satanism")
					B.SetName("The Unholy Bible")
				if("cthulu")
					B.SetName("The Necronomicon")
				if("islam")
					B.SetName("Quran")
				if("scientology")
					B.SetName(pick("The Biography of L. Ron Hubbard","Dianetics"))
				if("chaos")
					B.SetName("The Book of Lorgar")
				if("imperium")
					B.SetName("Uplifting Primer")
				if("toolboxia")
					B.SetName("Toolbox Manifesto")
				if("homosexuality")
					B.SetName("Guys Gone Wild")
				if("science")
					B.SetName(pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition"))
				else
					B.SetName("The Holy Book of [new_religion]")
			SSstatistics.set_field_details("religion_name","[new_religion]")

		spawn(1)
			var/deity_name = "Space Jesus"
			var/new_deity = sanitize(input(H, "Would you like to change your deity? Default is Space Jesus.", "Name change", deity_name), MAX_NAME_LEN)

			if ((length(new_deity) == 0) || (new_deity == "Space Jesus") )
				new_deity = deity_name
			B.deity_name = new_deity

			var/accepted = 0
			var/outoftime = 0
			spawn(200) // 20 seconds to choose
				outoftime = 1
			var/new_book_style = "Bible"

			while(!accepted)
				if(!B) break // prevents possible runtime errors
				new_book_style = input(H,"Which bible style would you like?") in list("Bible", "Koran", "Scrapbook", "Creeper", "White Bible", "Holy Light", "Athiest", "Tome", "The King in Yellow", "Ithaqua", "Scientology", "the bible melts", "Necronomicon")
				switch(new_book_style)
					if("Koran")
						B.icon_state = "koran"
						B.item_state = "koran"
					if("Scrapbook")
						B.icon_state = "scrapbook"
						B.item_state = "scrapbook"
					if("Creeper")
						B.icon_state = "creeper"
						B.item_state = "syringe_kit"
					if("White Bible")
						B.icon_state = "white"
						B.item_state = "syringe_kit"
					if("Holy Light")
						B.icon_state = "holylight"
						B.item_state = "syringe_kit"
					if("Athiest")
						B.icon_state = "athiest"
						B.item_state = "syringe_kit"
					if("Tome")
						B.icon_state = "tome"
						B.item_state = "syringe_kit"
					if("The King in Yellow")
						B.icon_state = "kingyellow"
						B.item_state = "kingyellow"
					if("Ithaqua")
						B.icon_state = "ithaqua"
						B.item_state = "ithaqua"
					if("Scientology")
						B.icon_state = "scientology"
						B.item_state = "scientology"
					if("the bible melts")
						B.icon_state = "melted"
						B.item_state = "melted"
					if("Necronomicon")
						B.icon_state = "necronomicon"
						B.item_state = "necronomicon"
					else
						B.icon_state = "bible"
						B.item_state = "bible"

				H.update_inv_l_hand() // so that it updates the bible's item_state in his hand

				switch(input(H,"Look at your bible - is this what you want?") in list("Yes","No"))
					if("Yes")
						accepted = 1
					if("No")
						if(outoftime)
							to_chat(H, "Welp, out of time, buddy. You're stuck. Next time choose faster.")
							accepted = 1

			SSstatistics.set_field_details("religion_deity","[new_deity]")
			SSstatistics.set_field_details("religion_book","[new_book_style]")
		return 1

/datum/job/chaplain/get_description_blurb()
return "Вы - Капеллан. Ваша роль предполагает предоставление духовной поддержки и наставлений тем, кто ищет духовное наполнение в безграничном космосе.
Вы открыты для общения с представителями различных верований и культур. Ваша задача - предоставить духовную поддержку, наставления и утешение тем, кто испытывает душевные трудности или потребность в духовном росте.
В вашем распоряжении зал с алтарём, где вы проводите религиозные церемонии и обряды. Это могут быть молитвы, обряды поклонения, бракосочетания или другие религиозные обряды, соответствующие вере вашего сообщества.
Также вам предоставлена комната космирования, где вы можете организовать соответствующие процедуры, предварительно устроив прощание с усопшим.
Кроме того, вы готовы слушать и советовать по вопросам душевного здоровья. Исповедальня или офис  - места, где можно обсудить духовные вопросы, проблемы или поиск решений.
Создавайте духовную гармонию и понимание среди разнообразного сообщества станции.
Удачи!"

//--------------------------------------------

/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	access = list(access_janitor, maint, access_hydroponics)
	minimal_access = list(access_janitor, maint, access_hydroponics)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/janitor

/datum/job//get_description_blurb()
return "Вы - Уборщик. Ваша роль несравненно важна для обеспечения чистоты и порядка на станции.
Ваша каморка на втором уровне станции - ваша святая зона, полная инструментов и средств для поддержания безупречной чистоты.
Ваш опыт и навыки в уборке помещений сделали вас настоящим профессионалом. Вы используете швабры, вёдра и другие профессиональные инструменты с исключительной мастерством, приводя помещения в порядок и сияние.
Ваш труд и усердие не остаются незамеченными. Директор ценит ваш вклад в поддержание порядка на станции, и ваше имя звучит с уважением в коридорах, а Секретарь смотрит на ваше фото перед сном и молится за безупречную чистоту.
Вы совершенны в своей профессии. Независимо от того, какие вызовы бросят вам грязь и беспорядок, вы всегда находите способ достичь идеальной чистоты.
Быть уборщиком - это быть героем, обеспечивающим чистоту и порядок для комфорта всех обитателей станции.
Удачи!"

//--------------------------------------------

/datum/job/psychologist
	title = "Psychologist"
	department = "Service"
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	economic_power = 5
	minimal_player_age = 3
	supervisors = "the secretary"
	access = list(psycho)
	minimal_access = list(psycho)
	outfit_type = /decl/hierarchy/outfit/job/psychologist

/datum/job/psychologist/get_description_blurb()
return "Вы - Психолог. Ваша задача - быть надежным партнером и поддержкой для всех, кто ищет профессиональное консультирование и моральную помощь. Ваш кабинет оборудован всем для того, чтобы обеспечить комфортную и конфиденциальную обстановку.
Ваш опыт в психологии и навыки консультирования позволяют вам предоставлять профессиональную помощь тем, кто сталкивается с эмоциональными или психологическими трудностями.
Строго соблюдайте принцип конфиденциальности, обеспечивая клиентам уверенность в том, что их личные данные и разговоры останутся в пределах вашего кабинета.
Вы всегда готовы выслушать и оказать моральную поддержку каждому, кто обращается к вам. Ваша эмпатия и понимание помогают создать доверительные отношения с клиентами, а цифроокно от DAIS создает атмосферу комфорта в соответствии с их потребностями и запросами.
Удачи!"

//--------------------------------------------

/datum/job/pvt_eye
	title = "Private Eye"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	economic_power = 3
	access = list(priveye)
	minimal_access = list(priveye)
	outfit_type = /decl/hierarchy/outfit/job/pvt_eye

/datum/job/pvt_eye/get_description_blurb()
return "Вы - Частный Детектив. В мире, полном тёмных закоулков, вы вступаете в игру в поисках правды.
Ваши лучшие друзья - плащ, выпивка, сигареты и мертвые женщины - создают неповторимую атмосферу вашего профессионального стиля. 
Ваши навыки и интуиция помогут вам решить даже самые сложные космические тайны.
Вы не связаны официальными органами исполнительной власти, что дает вам свободу действий. Ваша независимость - ваша сила, позволяющая вам проводить расследования в обход всяких правил и процедур. Но помните, что вам всё ещё придётся следовать закону ПСС, если вы недостаточно скрытны или уверены в себе.
Сомнительные предложения и роковые красотки становятся частью вашего ежедневного ритма. Вы готовы пройти через тёмные техтоннели станции, следуя за каждым слухом и зацепкой.
Держите своих клиентов в курсе расследования, предоставляя им информацию и отчеты, чтобы поддерживать доверительные отношения.
Вы - непредсказуемый следователь, готовый прокладывать путь сквозь тени космических интриг и раскрывать тайны, которые тщательно скрывает станция Либерти…
Удачи!"

//--------------------------------------------

/datum/job/freelancer
	title = "Freelancer"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the secretary"
	economic_power = 3
	access = list(maint)
	minimal_access = list(maint)
	outfit_type = /decl/hierarchy/outfit/job/freelancer

/datum/job/freelancer/get_description_blurb()
return "Вы - Наёмник. В мире космических интриг и теневых сделок, вы являетесь отчаянным баловнем судьбы, готовым приняться за нетипичную работу ради личных целей или наживы.
Ваша деятельность находится за пределами закона, так что остерегайтесь Федеральной Полиции. Но помните, что вас могут арестовать только если поймают вас на горячем или выйдут на вас в ходе расследования.
Вы готовы выполнять самые разные задачи - от похищения и устранения конкурентов до сбора информации и охраны ценных объектов. Ваша гибкость - ваше оружие, единственные рамки - ваша совесть и инстинкт самосохранения.
Вы готовы рисковать, чтобы достичь своих амбициозных целей. Ваша стойкость и стремление к приключениям делают вас ценным игроком в опасном мире космоса.
Будьте смелым авантюристом, который не боится ничего и готов взяться за опасные задачи. Ваша деятельность на грани закона придаёт станции “Либерти” тёмную нотку непредсказуемости.
Удачи!"

//--------------------------------------------

/datum/job/freelancer_pilot
	title = "Freelancer Pilot"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	economic_power = 3
	access = list(maint, bebo)
	minimal_access = list(maint, bebo)
	outfit_type = /decl/hierarchy/outfit/job/freelancer_pilot

/datum/job/freelancer_pilot/get_description_blurb()
return "Вы - Контрабандист. Смелый авантюрист, чей корабль бороздит самые темные и опасные уголки космоса. Вы готовы перевозить все, что вмещается в грузовой отсек, покуда цена высока и муки совести не слишком сильны. 
Смелость и приключения - ваша ежедневная жизнь. Ваш корабль, "Бибоп", стал надежным средством для перевозки любых грузов. Ваши навыки в уходе от погонь и скрытности помогут вам избежать столкновения с правоохранительными органами.
Ваша деятельность придает станции долю опасности и неопределенности, делая вас ключевой фигурой в теневых делах космического пространства.
Удачи!"

//--------------------------------------------

/datum/job/farmer
	title = "Farmer"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the secretary"
	access = list(access_hydroponics)
	minimal_access = list(access_hydroponics)
	//alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/farmer

/datum/job/farmer/get_description_blurb()
return "Вы - Фермер. Вы обеспечиваете станцию “Либерти” свежими продуктами, выращивая различные овощи, растения и животных в своём отделе. 
Ваша гидропоника служит источником свежих овощей и растений для обитателей станции. Вы ухаживаете за растениями, обеспечивая оптимальные условия для их роста.
Ваша фермерская продукция может стать частью меню ресторанов и отелей на станции. Сотрудничество с другими учреждениями создает вам новые возможности.
Станьте поставщиком свежих продуктов и важным звеном в экосистеме станции, обеспечив всем доступ к свежим овощам и мясу.
Удачи!"
