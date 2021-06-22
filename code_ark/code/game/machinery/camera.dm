var/const/NETWORK_SOL_COMMAND		= "Sol Command"
var/const/NETWORK_SOL_EXPLORATION	= "Sol Exploration"

/obj/machinery/camera/network/sol_exploration
	network = list(NETWORK_SOL_EXPLORATION)

/obj/machinery/camera/network/sol_command
	network = list(NETWORK_SOL_COMMAND)
