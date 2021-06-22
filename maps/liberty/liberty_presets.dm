///////////////////////////////////////////////
///////////////// Main tcomms /////////////////
///////////////////////////////////////////////

// Servers

/obj/machinery/telecomms/server/liberty
	network = "tcomms"

/obj/machinery/telecomms/server/liberty/admin
	id = "Administration Server"
	freq_listening = list(COMM_FREQ)
	channel_tags = list(list(COMM_FREQ, "Administration", COMMS_COLOR_COMMAND))
	autolinkers = list("administration")

/obj/machinery/telecomms/server/liberty/engineering
	id = "Engineering Server"
	freq_listening = list(ENG_FREQ)
	channel_tags = list(list(ENG_FREQ, "Engineering", COMMS_COLOR_ENGINEER))
	autolinkers = list("engineering")
	network = "tcomms"

/obj/machinery/telecomms/server/liberty/medical
	id = "Medical Server"
	freq_listening = list(MED_FREQ)
	channel_tags = list(list(MED_FREQ, "Medical", COMMS_COLOR_MEDICAL))
	autolinkers = list("medical")
	network = "tcomms"

/obj/machinery/telecomms/server/liberty/harbor
	id = "Harbor Services Server"
	freq_listening = list(SUP_FREQ)
	channel_tags = list(list(SUP_FREQ, "Harbor", COMMS_COLOR_SUPPLY))
	autolinkers = list("harbor")
	network = "tcomms"

/obj/machinery/telecomms/server/liberty/service
	id = "Service Server"
	freq_listening = list(SRV_FREQ)
	channel_tags = list(list(SRV_FREQ, "Harbor", COMMS_COLOR_SUPPLY))
	autolinkers = list("harbor")
	network = "tcomms"

/obj/machinery/telecomms/server/liberty/unused
	id = "Unused Server"
	freq_listening = list()
	autolinkers = list("unused")

// Receivers

/obj/machinery/telecomms/receiver/liberty
	network = "tcomms"

/obj/machinery/telecomms/receiver/liberty/preset_one
	id = "Receiver One"
	autolinkers = list("receiver_one")
	freq_listening = list(COMM_FREQ, SUP_FREQ, SRV_FREQ)

/obj/machinery/telecomms/receiver/liberty/preset_two
	id = "Receiver Two"
	autolinkers = list("receiver_two")
	freq_listening = list(ENG_FREQ, MED_FREQ)

// Broadcasters

/obj/machinery/telecomms/broadcaster/liberty
	network = "tcomms"

/obj/machinery/telecomms/broadcaster/liberty/preset_one
	id = "Broadcaster One"
	autolinkers = list("broadcaster_one")
	freq_listening = list(COMM_FREQ, SUP_FREQ, SRV_FREQ)

/obj/machinery/telecomms/broadcaster/liberty/preset_two
	id = "Broadcaster Two"
	autolinkers = list("broadcaster_two")
	freq_listening = list(ENG_FREQ, MED_FREQ)

// Buses

/obj/machinery/telecomms/bus/liberty
	network = "tcomms"

/obj/machinery/telecomms/bus/liberty/preset_one
	id = "Bus One"
	freq_listening = list(COMM_FREQ, SUP_FREQ, SRV_FREQ)
	autolinkers = list("processor_one", "administration", "harbor", "service")

/obj/machinery/telecomms/bus/liberty/preset_two
	id = "Bus Two"
	freq_listening = list(ENG_FREQ, MED_FREQ)
	autolinkers = list("processor_two", "engineering", "medical", "unused")

// Processors

/obj/machinery/telecomms/processor/liberty
	network = "tcomms"

/obj/machinery/telecomms/processor/liberty/preset_one
	id = "Processor One"
	autolinkers = list("processor_one")

/obj/machinery/telecomms/processor/liberty/preset_two
	id = "Processor Two"
	autolinkers = list("processor_two")

// Hub

/obj/machinery/telecomms/hub/liberty
	id = "Hub"
	network = "tcomms"
	autolinkers = list("administration", "harbor", "service", "engineering", "medical", "unused", "receiver_one", "receiver_two", "broadcaster_one", "broadcaster_two")

//////////////////////////////////////////////
///////////////// SFP tcomms /////////////////
//////////////////////////////////////////////

/obj/machinery/telecomms/server/liberty/sfp
	id = "Police Server"
	freq_listening = list(SEC_FREQ)
	channel_tags = list(list(SEC_FREQ, "Security", COLOR_SFP_BLUE))
	autolinkers = list("serverSFP", "broadcasterSFP")
	network = "sfp"

/obj/machinery/telecomms/receiver/liberty/preset_sfp
	id = "Police Receiver"
	network = "lucius"
	autolinkers = list("receiverSFP")
	freq_listening = list(SEC_FREQ)

/obj/machinery/telecomms/bus/liberty/preset_sfp
	id = "Police Mainframe"
	network = "sfp"
	autolinkers = list("receiverSFP", "processorSFP", "serverSFP")
	freq_listening = list(SEC_FREQ)

/obj/machinery/telecomms/processor/liberty/preset_sfp
	id = "Police Processor"
	network = "sfp"
	autolinkers = list("processorSFP")
	freq_listening = list(SEC_FREQ)

/obj/machinery/telecomms/broadcaster/liberty/preset_sfp
	id = "Police Broadcaster"
	network = "sfp"
	autolinkers = list("broadcasterSFP")
	freq_listening = list(SEC_FREQ)

//////////////////////////////////////////////
////////////////// Networks //////////////////
//////////////////////////////////////////////

var/const/NETWORK_LEVEL_ZERO		= "Level Zero"
var/const/NETWORK_LEVEL_ONE			= "Level One"
var/const/NETWORK_LEVEL_TWO			= "Level Two"
var/const/NETWORK_LEVEL_THREE		= "Level Three"

/datum/map/liberty/get_network_access(var/network)
	switch(network)
		if(NETWORK_SOL_COMMAND)
			return access_sol_command
		if(NETWORK_SOL_EXPLORATION)
			return access_sol_exp
	return /*get_shared_network_access(network) ||*/ ..()

/datum/map/liberty
	station_networks = list(
		NETWORK_ROBOTS,
		NETWORK_LEVEL_ZERO,
		NETWORK_LEVEL_ONE,
		NETWORK_LEVEL_TWO,
		NETWORK_LEVEL_THREE,
	/*	NETWORK_COMMAND,
		NETWORK_ENGINEERING,
		NETWORK_ENGINE,
		NETWORK_MEDICAL,
		NETWORK_RESEARCH,
		NETWORK_SECURITY,
		NETWORK_SUPPLY,
		NETWORK_POD,
		NETWORK_NANOTRASEN, FINISH ME*/
		NETWORK_ALARM_ATMOS,
		NETWORK_ALARM_CAMERA,
		NETWORK_ALARM_FIRE,
		NETWORK_ALARM_MOTION,
		NETWORK_ALARM_POWER,
		NETWORK_THUNDER,
	)

//////////////////////////////////////////////
////////////////// Cameras ///////////////////
//////////////////////////////////////////////
// PLACE HERE LIBERTY CAMS ONLY!!! NOT ARK_CODE CAMS!!! Ark cams at "\code_ark\code\game\machinery\camera.dm" ~Laxesh


//////////////////////////////////////////////
/////////////////// SMES /////////////////////
//////////////////////////////////////////////

/obj/machinery/power/smes/buildable/preset/liberty/shuttle
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/power/smes/buildable/preset/liberty/substation
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1) // Note that it gets one more from construction
	_input_maxed = TRUE
	_output_maxed = TRUE

/obj/machinery/power/smes/buildable/preset/liberty/substation_full
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/power/smes/buildable/preset/liberty/engine_main
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2,
		/obj/item/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE
