/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER рыгает."
	message_type = AUDIBLE_MESSAGE

/decl/emote/audible/do_extra(var/atom/user)
	if(emote_sound)
		playsound(user.loc, emote_sound, 50, 0)

/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER издает слабеющий гортанный визг; зеленая кровь пузырится из пасти."

/decl/emote/audible/whimper
	key ="whimper"
	emote_message_3p = "USER хнычет."

/decl/emote/audible/gasp
	key ="gasp"
	emote_sound = list(
		MALE = list(
			'code_ark/sound/voice/gasp_male1.ogg', 'code_ark/sound/voice/gasp_male2.ogg',
			'code_ark/sound/voice/gasp_male3.ogg', 'code_ark/sound/voice/gasp_male4.ogg',
			'code_ark/sound/voice/gasp_male5.ogg', 'code_ark/sound/voice/gasp_male6.ogg',
			'code_ark/sound/voice/gasp_male7.ogg'),
		FEMALE = list(
			'code_ark/sound/voice/gasp_female1.ogg', 'code_ark/sound/voice/gasp_female2.ogg',
			'code_ark/sound/voice/gasp_female3.ogg', 'code_ark/sound/voice/gasp_female4.ogg',
			'code_ark/sound/voice/gasp_female5.ogg', 'code_ark/sound/voice/gasp_female6.ogg',
			'code_ark/sound/voice/gasp_female7.ogg'))
	emote_message_3p = "USER задыхается!"
	conscious = 0

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER чешется."

/decl/emote/audible/choke
	key ="choke"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/gasp_male6.ogg',
		FEMALE = 'code_ark/sound/voice/cough_female.ogg')
	emote_message_3p = "USER задыхается!"
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER скалится и показывает свои зубы.."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER щебечет!"
	emote_sound = 'sound/misc/nymphchirp.ogg'

/decl/emote/audible/multichirp
	key ="mchirp"
	emote_message_3p = "USER щебечет хор нот!"
	emote_sound = 'sound/misc/multichirp.ogg'

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "Вы проигрываете звук оповещения."
	emote_message_3p = "USER проигрывает звук оповещения."
	emote_sound = 'sound/machines/chime.ogg'

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "Вы проигрываете звук тревоги."
	emote_message_3p = "USER проигрывает звук тревоги."
	emote_sound = 'sound/machines/fire_alarm.ogg'

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "Вы проигрываете громкий звук."
	emote_message_3p = "USER проигрывает громкий звук."
	emote_sound = 'sound/machines/boop1.ogg'

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "Вы свистите."
	emote_message_3p = "USER свистит."
	emote_sound = 'code_ark/sound/voice/whistle.ogg'

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "Вы бибикаете."
	emote_message_3p = "USER бибикает."
	emote_sound = list('sound/machines/boop1.ogg', 'sound/machines/boop2.ogg')

/decl/emote/audible/sneeze
	key = "sneeze"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/sneeze_male_1.ogg', 'code_ark/sound/voice/sneeze_male_2.ogg'),
		FEMALE = list('code_ark/sound/voice/sneeze_female_1.ogg', 'code_ark/sound/voice/sneeze_female_2.ogg'))
	emote_message_3p = "USER чихает."

/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER сопит."

/decl/emote/audible/snore
	key = "snore"
	emote_sound = list(
		'code_ark/sound/voice/snore_1.ogg', 'code_ark/sound/voice/snore_2.ogg',
		'code_ark/sound/voice/snore_3.ogg', 'code_ark/sound/voice/snore_4.ogg',
		'code_ark/sound/voice/snore_5.ogg', 'code_ark/sound/voice/snore_6.ogg',
		'code_ark/sound/voice/snore_7.ogg')
	emote_message_3p = "USER храпит."
	conscious = 0

/decl/emote/audible/yawn
	key = "yawn"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/yawn_male_1.ogg', 'code_ark/sound/voice/yawn_male_2.ogg'),
		FEMALE = list('code_ark/sound/voice/yawn_female_1.ogg', 'code_ark/sound/voice/yawn_female_2.ogg',
						'code_ark/sound/voice/yawn_female_3.ogg'))
	emote_message_3p = "USER зевает."

/decl/emote/audible/clap
	key = "clap"
	emote_sound = 'code_ark/sound/voice/clap.ogg'
	emote_message_3p = "USER хлопает."

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/chuckle_male.ogg',
		FEMALE = 'code_ark/sound/voice/chuckle_female.ogg')
	emote_message_3p = "USER усмехается."

/decl/emote/audible/chuckle/resomi
	emote_sound = 'code_ark/sound/voice/resomicougha.ogg'
	emote_message_3p = "USER усмехается."

/decl/emote/audible/cough
	key = "cough"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/cough_male.ogg',
		FEMALE = 'code_ark/sound/voice/cough_female.ogg')
	emote_message_3p = "USER кашляет!"
	conscious = 0

/decl/emote/audible/cough/resomi
	emote_sound = 'code_ark/sound/voice/resomicoughb.ogg'
	emote_message_3p = "USER кашляет!"

/decl/emote/audible/cry
	key = "cry"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/cry_male_1.ogg', 'code_ark/sound/voice/cry_male_2.ogg'),
		FEMALE = list('code_ark/sound/voice/cry_female_1.ogg', 'code_ark/sound/voice/cry_female_2.ogg',
						'code_ark/sound/voice/cry_female_3.ogg'))
	emote_message_3p = "USER плачет."

/decl/emote/audible/sigh
	key = "sigh"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/sigh_male.ogg',
		FEMALE = 'code_ark/sound/voice/sigh_female.ogg')
	emote_message_3p = "USER вздыхает."

/decl/emote/audible/laugh
	key = "laugh"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/laugh_male_1.ogg', 'code_ark/sound/voice/laugh_male_2.ogg',
				'code_ark/sound/voice/laugh_male_3.ogg', 'code_ark/sound/voice/laugh_male_4.ogg',
				'code_ark/sound/voice/laugh_male_5.ogg', 'code_ark/sound/voice/laugh_male_6.ogg'),
		FEMALE = list('code_ark/sound/voice/laugh_female_1.ogg', 'code_ark/sound/voice/laugh_female_2.ogg',
				'code_ark/sound/voice/laugh_female_3.ogg', 'code_ark/sound/voice/laugh_female_4.ogg',
				'code_ark/sound/voice/laugh_female_5.ogg', 'code_ark/sound/voice/laugh_female_6.ogg'))
	emote_message_3p = "USER смеётся."
	emote_message_3p_target = "USER смеётся над TARGET!"

/decl/emote/audible/laugh/resomi
	emote_sound = 'code_ark/sound/voice/resomicougha.ogg'
	emote_message_3p = "USER смеётся."
	emote_message_3p_target = "USER смеётся над TARGET!"

/decl/emote/audible/mumble
	key = "mumble"
	emote_message_3p = "USER бубнит."

/decl/emote/audible/grumble
	key = "grumble"
	emote_message_3p = "USER ворчит."

/decl/emote/audible/groan
	key = "groan"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/groan_TEMP.ogg',
		FEMALE = 'code_ark/sound/voice/groan_TEMP.ogg')
	emote_message_3p = "USER постанывает!"
	conscious = 0

/decl/emote/audible/moan
	key = "moan"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/moan_m2.ogg', 'code_ark/sound/voice/moan_m3.ogg', 'code_ark/sound/voice/moan_m4.ogg', 'code_ark/sound/voice/moan_m5.ogg', 'code_ark/sound/voice/moan_m6.ogg'),
		FEMALE = list('code_ark/sound/voice/moan_f2.ogg', 'code_ark/sound/voice/moan_f3.ogg', 'code_ark/sound/voice/moan_f4.ogg', 'code_ark/sound/voice/moan_f5.ogg', 'code_ark/sound/voice/moan_f7.ogg'))
	emote_message_3p = "USER стонет!"
	conscious = 0

/decl/emote/audible/giggle
	key = "giggle"
	emote_sound = list(
		MALE = 'code_ark/sound/voice/giggle_male_2.ogg',
		FEMALE = 'code_ark/sound/voice/giggle_female_3.ogg')
	emote_message_3p = "USER хихикает."

/decl/emote/audible/scream
	key = "scream"
	emote_sound = list(
		MALE = list('code_ark/sound/voice/scream_male_1.ogg', 'code_ark/sound/voice/scream_male_2.ogg',
					'code_ark/sound/voice/scream_male_3.ogg'),
		FEMALE = list('code_ark/sound/voice/scream_female_1.ogg', 'code_ark/sound/voice/scream_female_2.ogg'))
	emote_message_3p = "USER кричит!"

/decl/emote/audible/scream/resomi
	emote_sound = 'code_ark/sound/voice/resomisneeze.ogg'
	emote_message_3p = "USER кричит!"

/decl/emote/audible/grunt
	key = "grunt"
	emote_message_3p = "USER мычит."

/decl/emote/audible/slap
	emote_message_1p_target = "<span class='warning'>Вы даёте пощёчину TARGET!</span>"
	emote_message_1p = "Вы даёте себе пощёчину!"
	emote_message_3p_target = "<span class='warning'>USER даёт пощёчину TARGET!</span>"
	emote_message_3p = "USER даёт пощёчину USER_SELF!"
	emote_sound = 'sound/effects/snap.ogg'

/decl/emote/audible/bug_hiss
	key ="hiss"
	emote_message_3p_target = "USER шипит на TARGET."
	emote_message_3p = "USER шипит."
	emote_sound = 'sound/voice/BugHiss.ogg'

/decl/emote/audible/bug_buzz
	key ="buzz"
	emote_message_3p = "USER жужжит своими крыльями."
	emote_sound = 'sound/voice/BugBuzz.ogg'

/decl/emote/audible/bug_chitter
	key ="chitter"
	emote_message_3p = "USER издаёт жучинные звуки."
	emote_sound = 'sound/voice/Bug.ogg'

/decl/emote/audible/vox_shriek
	key ="shriek"
	emote_message_3p = "USER БЕШЕННО ОРЁТ!" // Не ну вы бля послушайте этот файл, я в душе не ебу, как это назвать ещё
	emote_sound = 'sound/voice/shriek1.ogg'

/decl/emote/audible/roar
	key = "roar"
	emote_message_3p = "USER рычит!"

/decl/emote/audible/bellow
	key = "bellow"
	emote_message_3p = "USER ревёт!"

/decl/emote/audible/howl
	key = "howl"
	emote_message_3p = "USER воет!"

/decl/emote/audible/wheeze
	key = "wheeze"
	emote_message_3p = "USER хрипит."

/decl/emote/audible/hiss
	key ="hiss_"
	emote_message_3p_target = "USER мягко шипит на TARGET."
	emote_message_3p = "USER мягко шипит."

/decl/emote/audible/lizard_bellow
	key = "bellow"
	emote_message_3p_target = "USER рычит на TARGET!"
	emote_message_3p = "USER рычит!"
	emote_sound = 'sound/voice/LizardBellow.ogg'

/decl/emote/audible/lizard_squeal
	key = "squeal"
	emote_message_3p = "USER пищит."
	emote_sound = 'sound/voice/LizardSqueal.ogg'

/decl/emote/audible/lizard_squeal
	key = "prate"
	emote_message_3p = "USER несет чепуху"