

// SET THE ACCESS!
// /datum/map/torch/default_internal_channels()



// TCOMMS PRESETS
/obj/machinery/telecomms/server/presets/lucius_command
	id = "Command Server"
	freq_listening = list(SOL_COMM_FREQ)
	channel_tags = list(list(SOL_COMM_FREQ, "Sol Command", COMMS_COLOR_SOL_COMMAND))
	autolinkers = list("commandLucius", "broadcasterLucius")
	network = "lucius"

/obj/machinery/telecomms/server/presets/lucius_general
	id = "General Server"
	freq_listening = list(SOL_PUB_FREQ)
	channel_tags = list(list(SOL_PUB_FREQ, "Sol General", COMMS_COLOR_COMMON))
	autolinkers = list("generalLucius", "broadcasterLucius")
	network = "lucius"

/obj/machinery/telecomms/receiver/preset_lucius
	id = "Lucius Receiver"
	network = "lucius"
	autolinkers = list("receiverLucius")
	freq_listening = list(SOL_PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/bus/preset_lucius
	id = "Lucius Mainframe"
	network = "lucius"
	autolinkers = list("receiverLucius", "processorLucius", "generalLucius", "commandLucius")
	freq_listening = list(SOL_PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/processor/preset_lucius
	id = "Lucius Processor"
	network = "lucius"
	autolinkers = list("processorLucius")
	freq_listening = list(SOL_PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/broadcaster/preset_lucius
	id = "Lucius Broadcaster"
	network = "lucius"
	autolinkers = list("broadcasterLucius")
	freq_listening = list(SOL_PUB_FREQ, SOL_COMM_FREQ)

/obj/item/device/radio/intercom/sol
	name = "intercom (Sol General)"
	frequency = SOL_PUB_FREQ