
//base ID code in code/game/objects/items/weapons
//----------Station Administration-----------

/obj/item/card/id/gold
	desc = "A golden card which shows power and might."
	job_access_type = /datum/job/director
	color = "#d4c780"
	extra_details = list("goldstripe")

/obj/item/card/id/silver
	desc = "A silver card which shows honour and dedication."
	item_state = "silver_id"
	job_access_type = /datum/job/secretary

/obj/item/card/id/silver/consul
	job_access_type = /datum/job/consul

/obj/item/card/id/silver/corpo_representative
	job_access_type = /datum/job/corpo_representative

//----------Sol Federal Police---------------

/obj/item/card/id/security
	name = "identification card"
	desc = "A card issued to security staff."
	job_access_type = /datum/job/sfp_agent
	color = COLOR_OFF_WHITE
	detail_color = COLOR_SFP_BLUE

/obj/item/card/id/security/sfp_investigator
	job_access_type = /datum/job/sfp_investigator

/obj/item/card/id/security/head
	desc = "A card which represents honor and protection."
	job_access_type = /datum/job/sfp_curator
	extra_details = list("goldstripe")

//----------Engineering Department-----------

/obj/item/card/id/engineering
	name = "identification card"
	desc = "A card issued to engineering staff."
	job_access_type = /datum/job/station_engineer
	detail_color = COLOR_SUN

/obj/item/card/id/engineering/head
	desc = "A card which represents creativity and ingenuity."
	job_access_type = /datum/job/chief_engineer
	extra_details = list("goldstripe")

//----------Dock-----------------------------

/obj/item/card/id/dock
	name = "identification card"
	desc = "A card issued to dock staff."
	job_access_type = /datum/job/docker
	detail_color = COLOR_BROWN

/obj/item/card/id/dock/harbormaster
	desc = "A card issued to dock supervisor."
	job_access_type = /datum/job/harbormaster
	extra_details = list("onegoldstripe")

//----------Clinic---------------------------

/obj/item/card/id/medical
	desc = "A card issued to medical staff."
	job_access_type = /datum/job/doctor
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/medical/pharmacist
	job_access_type = /datum/job/pharmacist

/obj/item/card/id/medical/head
	desc = "A card which represents care and compassion."
	job_access_type = /datum/job/cmo
	extra_details = list("goldstripe")

//----------Techartel------------------------

/obj/item/card/id/science
	desc = "A card issued to science staff."
	job_access_type = /datum/job/scientist
	detail_color = COLOR_PALE_PURPLE_GRAY

/obj/item/card/id/science/robotechnician
	job_access_type = /datum/job/robotechnician

/obj/item/card/id/science/head
	desc = "A card which represents knowledge and reasoning."
	job_access_type = /datum/job/dev_head
	extra_details = list("goldstripe")

//----------Hotel----------------------------

/obj/item/card/id/hotel
	desc = "A card issued to hotel staff."
	job_access_type = /datum/job/service_officer
	detail_color = COLOR_BRASS

/obj/item/card/id/hotel/cook
	job_access_type = /datum/job/cook

/obj/item/card/id/hotel/bartender
	job_access_type = /datum/job/bartender

/obj/item/card/id/hotel/manager
	desc = "A card issued to hotel management."
	job_access_type = /datum/job/manager
	extra_details = list("onegoldstripe")

//----------Others---------------------------

/obj/item/card/id/civilian
	desc = "A card issued to civillians and visitors."
	job_access_type = DEFAULT_JOB_TYPE
	detail_color = COLOR_CIVIE_GREEN

/obj/item/card/id/civilian/trader
	desc = "A card issued to traders, indicating their right to sell and buy goods."
	job_access_type = /datum/job/trader
	color = COLOR_OFF_WHITE
	detail_color = COLOR_BEIGE

/obj/item/card/id/civilian/chaplain
	job_access_type = /datum/job/chaplain

/obj/item/card/id/civilian/janitor
	job_access_type = /datum/job/janitor

/obj/item/card/id/civilian/psychologist
	job_access_type = /datum/job/psychologist

/obj/item/card/id/civilian/pvt_eye
	job_access_type = /datum/job/pvt_eye

/obj/item/card/id/civilian/freelancer
	job_access_type = /datum/job/freelancer

/obj/item/card/id/civilian/freelancer_pilot
	job_access_type = /datum/job/freelancer
	extra_details = list("onegoldstripe")

/obj/item/card/id/civilian/farmer
	job_access_type = /datum/job/farmer
