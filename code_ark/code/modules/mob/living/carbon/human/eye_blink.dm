//THIS FILE IS A PART OF THE ARK PROJECT CODE STOLEN FROM INFINITY

/mob/living/carbon/human/proc/handle_eye_blink() //Основной процесс для моргания
	eye_blink()

/mob/living/carbon/human //Вообще без понятия, что это, но работает
	var/eye_red_back = null
	var/eye_green_back = null
	var/eye_blue_back = null
	var/eye_close_stat = 0

/mob/living/carbon/human/proc/create_eye_blink()
	eye_red_back = r_eyes
	eye_green_back = g_eyes
	eye_blue_back = b_eyes

/mob/living/carbon/human/proc/eye_blink_spawn() //Смена век обратно на глаза

	change_eye_color(eye_red_back, eye_green_back, eye_blue_back, 1)
	eye_close_stat = 0

/mob/living/carbon/human/proc/eye_blink() //Основная логика моргания
	var/RED
	var/GREEN
	var/BLUE
	switch(get_species())
		if(SPECIES_HUMAN)
			RED = 225 + s_tone
			GREEN = 172 + s_tone
			BLUE = 119 + s_tone
		/*if("grav-adapted Human")
			RED = 112 + s_tone
			GREEN = 65 + s_tone
			BLUE = 0
		if("space-adapted Human")
			RED = 75 + s_tone
			GREEN = 55 + s_tone
			BLUE = 230 + s_tone
		if("vat-grown Human")
			RED = 230 + s_tone
			GREEN = 256 + s_tone
			BLUE = 204 + s_tone*/
		if(SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_SKRELL)
			RED = r_skin
			GREEN = g_skin
			BLUE = b_skin
		else
			return

	if(!stat)

		if(rand(1,100) <= 20)

			if(!eye_close_stat) //Если глаза открыты, то меняем их цвет на цвет век и чуть позже возвращаем

				create_eye_blink()

			change_eye_color(RED, GREEN, BLUE, 1)
			addtimer(CALLBACK(src, PROC_REF(eye_blink_spawn)), 1)

		else if(eye_close_stat)

			change_eye_color(eye_red_back, eye_green_back, eye_blue_back, 1)

	else if(!eye_close_stat)

		if(!eye_close_stat)

			create_eye_blink()

		change_eye_color(RED, GREEN, BLUE, 1)
		eye_close_stat = 1
