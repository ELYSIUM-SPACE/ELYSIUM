/datum/job/warden/sfp
	title = "Супервайзер SFP"
	total_positions = 1
	spawn_positions = 1
	supervisors = "ЦПСС"
	economic_power = 9
	minimal_player_age = 7
	ideal_character_age = 35
	minimum_character_age = list(SPECIES_HUMAN = 22)
	outfit_type = /decl/hierarchy/outfit/job/liberty/security/warden

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 22

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/detective/sfp
	title = "Следователь SFP"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Супервайзер SFP"
	economic_power = 5
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 21)
	ideal_character_age = 35
	skill_points = 14
	outfit_type = /decl/hierarchy/outfit/job/liberty/security/forensic_tech

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_ADEPT,
	                    SKILL_ANATOMY	  = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/officer/sfp
	title = "Полевой агент SFP"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Супервайзер SFP"
	economic_power = 4
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 35
	skill_points = 14
	outfit_type = /decl/hierarchy/outfit/job/liberty/security/agent
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_HAULING   = SKILL_MAX)

	access = list()
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

