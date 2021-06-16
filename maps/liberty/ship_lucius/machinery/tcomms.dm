

// SET THE ACCESS!


// TCOMMS PRESETS
/obj/machinery/telecomms/server/presets/lucius_command
	id = "Command Server"
	freq_listening = list(SOL_COMM_FREQ)
	channel_tags = list(list(SOL_COMM_FREQ, "Sol Command", COMMS_COLOR_SOL_COMMAND))
	autolinkers = list("commandLucius")
	network = "lucius"

/obj/machinery/telecomms/server/presets/lucius_general
	id = "General Server"
	freq_listening = list(PUB_FREQ)
	channel_tags = list(list(PUB_FREQ, "General", COMMS_COLOR_COMMON))
	autolinkers = list("generalLucius")
	network = "lucius"

/obj/machinery/telecomms/receiver/preset_lucius
	id = "Lucius Receiver"
	network = "lucius"
	autolinkers = list("receiverLucius")
	freq_listening = list(PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/bus/preset_lucius
	id = "Lucius Mainframe"
	network = "lucius"
	autolinkers = list("receiverLucius", "processorLucius", "generalLucius", "commandLucius")
	freq_listening = list(PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/processor/preset_lucius
	id = "Lucius Processor"
	network = "lucius"
	autolinkers = list("processorPrometeus")
	freq_listening = list(PUB_FREQ, SOL_COMM_FREQ)

/obj/machinery/telecomms/broadcaster/preset_lucius
	id = "Lucius Broadcaster"
	network = "lucius"
	autolinkers = list("broadcasterLucius")
	freq_listening = list(PUB_FREQ, SOL_COMM_FREQ)
