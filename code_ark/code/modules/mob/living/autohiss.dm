///datum/species/resomi
//	autohiss_basic_map = list(
//			"ç" = list("ñ"),
//
//			"Ç" = list("Ñ")
//		)
//	autohiss_extra_map = list(
//			"÷" = list("ù"),
//
//			"æ" = list("ø"),
//
//			"×" = list("Ù"),
//
//			"Æ" = list("Ø")
//		)
//	autohiss_exempt = list(LANGUAGE_RESOMI)



/datum/species/unathi
	autohiss_basic_map = list(
			"s" = list("s-s", "ss", "sss"),

			"ñ" = list("ñ-ñ", "ññ", "ñññ"),

			"x" = list("s-s", "ss", "s", "sss"),
		)
	autohiss_extra_map = list(
			"ö" = list("ñ-ñ", "ñ", "ññ", "ñññ"),

			"÷" = list("ø-ø", "ø", "øø", "øøø"),

			"æ" = list("ø-ø", "ø", "øø", "øøø"),
		)
	autohiss_exempt = list(
					LANGUAGE_UNATHI_SINTA,
					LANGUAGE_UNATHI_YEOSA
	    )


/datum/species/tajara
	autohiss_basic_map = list(
			"r" = list("rr", "r-r", "rrr"),
			"ð" = list("ð-ð", "ðð", "ððð"),
		)
	autohiss_extra_map = list()
	autohiss_exempt = list(
					LANGUAGE_SIIK_MAAS,
					LANGUAGE_SIIK_TAJR
	    )
