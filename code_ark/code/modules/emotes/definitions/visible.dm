/decl/emote/visible
	key ="tail"
	emote_message_3p = "USER машет своим хвостом."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/scratch
	key = "scratch"
	check_restraints = TRUE
	emote_message_3p = "USER чешется."

/decl/emote/visible/drool
	key ="drool"
	emote_message_3p = "USER пускает слюни."
	conscious = 0

/decl/emote/visible/nod
	key ="nod"
	emote_message_3p_target = "USER кивает TARGET."
	emote_message_3p = "USER кивает."

/decl/emote/visible/sway
	key ="sway"
	emote_message_3p = "USER головокружительно покачивается."

/decl/emote/visible/sulk
	key ="sulk"
	emote_message_3p = "USER жалобно скулит."

/decl/emote/visible/dance
	key ="dance"
	check_restraints = TRUE
	emote_message_3p = "USER счастливо танцует."

/decl/emote/visible/roll
	key ="roll"
	check_restraints = TRUE
	emote_message_3p = "USER перекатывается." // Как вариант - "Делает бочку"

/decl/emote/visible/shake
	key ="shake"
	emote_message_3p = "USER трясёт головой."

/decl/emote/visible/jump
	key ="jump"
	emote_message_3p = "USER подпрыгивает!"

/decl/emote/visible/shiver
	key ="shiver"
	emote_message_3p = "USER дрожит."
	conscious = 0

/decl/emote/visible/collapse
	key ="collapse"
	emote_message_3p = "USER падает!" // "Коллапсирует!!"

/decl/emote/visible/collapse/do_extra(var/mob/user)
	if(istype(user))
		user.Paralyse(2)

/decl/emote/visible/flash
	key = "flash"
	emote_message_3p = "Свет на USER быстро зажигается."

/decl/emote/visible/blink
	key = "blink"
	emote_message_3p = "USER моргает."

/decl/emote/visible/blink/do_emote(var/mob/user)
	key = "blink"
	if(isliving(user)) user:eye_blink()

/decl/emote/visible/airguitar
	key = "airguitar"
	check_restraints = TRUE
	emote_message_3p = "USER бренчит в воздухе и болтает головой словно шимпанзе."

/decl/emote/visible/blink_r
	key = "blink_r"
	emote_message_3p = "USER часто моргает."

/decl/emote/visible/bow
	key = "bow"
	emote_message_3p_target = "USER кланяется TARGET."
	emote_message_3p = "USER кланяется."

/decl/emote/visible/salute
	key = "salute"
	emote_message_3p_target = "USER выполняет воинское приветствие TARGET."
	emote_message_3p = "USER выполняет воинское приветствие."

/decl/emote/visible/flap
	key = "flap"
	check_restraints = TRUE
	emote_message_3p = "USER хлопает своими крыльями."

/decl/emote/visible/aflap
	key = "aflap"
	check_restraints = TRUE
	emote_message_3p = "USER сердито хлопает клыьями!"

/decl/emote/visible/eyebrow
	key = "eyebrow"
	emote_message_3p = "USER приподнимает бровь."

/decl/emote/visible/twitch
	key = "twitch"
	emote_message_3p = "USER дёргается."
	conscious = 0

/decl/emote/visible/twitch_v
	key = "twitch_v"
	emote_message_3p = "USER яростно дёргается."
	conscious = 0

/decl/emote/visible/faint
	key = "faint"
	emote_message_3p = "USER теряет сознание."

/decl/emote/visible/faint/do_extra(var/mob/user)
	if(istype(user) && user.sleeping <= 0)
		user.sleeping += 10

/decl/emote/visible/frown
	key = "frown"
	emote_message_3p = "USER хмурится."

/decl/emote/visible/blush
	key = "blush"
	emote_message_3p = "USER краснеет."

/decl/emote/visible/wave
	key = "wave"
	emote_message_3p_target = "USER машет рукой TARGET."
	emote_message_3p = "USER машет рукой."

/decl/emote/visible/glare
	key = "glare"
	emote_message_3p_target = "USER пристально смотрит на TARGET."
	emote_message_3p = "USER пристально смотрит."

/decl/emote/visible/stare
	key = "stare"
	emote_message_3p_target = "USER пялится на TARGET."
	emote_message_3p = "USER пялится."

/decl/emote/visible/look
	key = "look"
	emote_message_3p_target = "USER смотрит на TARGET."
	emote_message_3p = "USER смотрит."

/decl/emote/visible/point
	key = "point"
	check_restraints = TRUE
	emote_message_3p_target = "USER указывает на TARGET."
	emote_message_3p = "USER указывает."

/decl/emote/visible/raise
	key = "raise"
	check_restraints = TRUE
	emote_message_3p = "USER поднимает руку."

/decl/emote/visible/grin
	key = "grin"
	emote_message_3p_target = "USER улыбается, скаля зубы, на TARGET."
	emote_message_3p = "USER улыбается, скаля зубы."

/decl/emote/visible/shrug
	key = "shrug"
	emote_message_3p = "USER пожимает плечами."

/decl/emote/visible/smile
	key = "smile"
	emote_message_3p_target = "USER улыбается TARGET."
	emote_message_3p = "USER улыбается."

/decl/emote/visible/pale
	key = "pale"
	emote_message_3p = "USER на секунду становится бледным."

/decl/emote/visible/tremble
	key = "tremble"
	emote_message_3p = "USER дрожит в ужасе!"

/decl/emote/visible/wink
	key = "wink"
	emote_message_3p_target = "USER подмигивает TARGET."
	emote_message_3p = "USER подмигивает."

/decl/emote/visible/hug
	key = "hug"
	check_restraints = TRUE
	emote_message_3p_target = "USER обнимает TARGET."
	emote_message_3p = "USER обнимает себя."

/decl/emote/visible/dap
	key = "dap"
	check_restraints = TRUE
	emote_message_3p_target = "USER обменивается дружеским рукопожатием с TARGET."
	emote_message_3p = "USER обменивается дружеским рукопожатием с собой." // Изменить бы потом

/decl/emote/visible/signal
	key = "signal"
	check_restraints = TRUE
	emote_message_3p = "USER сигнализирует."

/decl/emote/visible/signal/check_user(var/atom/user)
	return ismob(user)

/decl/emote/visible/bounce
	key = "bounce"
	emote_message_3p = "USER прыгает на месте."

/decl/emote/visible/jiggle
	key = "jiggle"
	emote_message_3p = "USER трясётся!"

/decl/emote/visible/lightup
	key = "light"
	emote_message_3p = "USER на секунду зажигается, потом потухает."

/decl/emote/visible/vibrate
	key = "vibrate"
	emote_message_3p = "USER вибрирует!" // Заметка, можно использовать для ЕРП-вещей

/decl/emote/visible/deathgasp_robot
	key = "deathgasp"
	emote_message_3p = "USER сильно вздрагивает на мгновение, потом становится неподвижным; глаза медленно угасают."

/decl/emote/visible/handshake
	key = "handshake"
	check_restraints = TRUE
	emote_message_3p_target = "USER обменивается рукопожатием с TARGET."
	emote_message_3p = "USER жмёт себе руку."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/handshake/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(target && !user.Adjacent(target))
		return "USER протягивает свою руку к TARGET."
	return ..()

/decl/emote/visible/signal
	key = "signal"
	emote_message_3p_target = "USER указывает на TARGET."
	emote_message_3p = "USER сигнализирует."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/signal/get_emote_message_3p(var/mob/user, var/atom/target, var/extra_params)
	if(istype(user) && !(user.r_hand && user.l_hand))
		var/t1 = round(text2num(extra_params))
		if(isnum(t1) && t1 <= 5)
			return "USER поднимает [t1] палец\s."
	return .. ()

/decl/emote/visible/afold
	key = "afold"
	check_restraints = TRUE
	emote_message_3p = "USER складывает руки на груди."

/decl/emote/visible/alook
	key = "alook"
	emote_message_3p = "USER отводит взгляд."

/decl/emote/visible/hbow
	key = "hbow"
	emote_message_3p = "USER кланяет своей головой."

/decl/emote/visible/hip
	key = "hip"
	check_restraints = TRUE
	emote_message_3p = "USER подбоченивается."

/decl/emote/visible/holdup
	key = "holdup"
	check_restraints = TRUE
	emote_message_3p = "USER поднимает вверх свои ладони."

/decl/emote/visible/hshrug
	key = "hshrug"
	emote_message_3p = "USER слабо пожимает плечами."

/decl/emote/visible/crub
	key = "crub"
	check_restraints = TRUE
	emote_message_3p = "USER трет свой подбородок."

/decl/emote/visible/eroll
	key = "eroll"
	emote_message_3p = "USER закатывает свои глаза."
	emote_message_3p_target = "USER закатывает свои глаза на TARGET."

/decl/emote/visible/erub
	key = "erub"
	check_restraints = TRUE
	emote_message_3p = "USER трёт свои глаза."

/decl/emote/visible/fslap
	key = "fslap"
	check_restraints = TRUE
	emote_message_3p = "USER хлопает себя по лбу."

/decl/emote/visible/ftap
	key = "ftap"
	emote_message_3p = "USER топает ногой."

/decl/emote/visible/hrub
	key = "hrub"
	check_restraints = TRUE
	emote_message_3p = "USER потирает свои руки."

/decl/emote/visible/hspread
	key = "hspread"
	check_restraints = TRUE
	emote_message_3p = "USER разводит руками."

/decl/emote/visible/pocket
	key = "pocket"
	check_restraints = TRUE
	emote_message_3p = "USER суёт руки в карманы."

/decl/emote/visible/rsalute
	key = "rsalute"
	check_restraints = TRUE
	emote_message_3p = "USER возвращает воинское приветствие." // Я уверен, что есть какой-то термин для этого, дайте знать, если что

/decl/emote/visible/rshoulder
	key = "rshoulder"
	emote_message_3p = "USER разминает плечи."

/decl/emote/visible/squint
	key = "squint"
	emote_message_3p = "USER щурится."
	emote_message_3p_target = "USER щурится на TARGET."

/decl/emote/visible/tfist
	key = "tfist"
	emote_message_3p = "USER сжимает свои руки в кулаки."

/decl/emote/visible/tilt
	key = "tilt"
	emote_message_3p = "USER наклоняет голову набок."