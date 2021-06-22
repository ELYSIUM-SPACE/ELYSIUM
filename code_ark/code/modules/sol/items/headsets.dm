/obj/item/device/radio/headset/sol_basic
	name = "basic sol headset"
	desc = "A standard headset used by the SCG for general communications aboard their vessels. It has the Sol common frequency preset by default."
	frequency = SOL_PUB_FREQ

/obj/item/device/encryptionkey/heads/sol_command_basic
	name = "basic sol command encryption key"
	icon_state = "com_cypherkey"
	channels = list("Sol Command" = 1)

/obj/item/device/radio/headset/heads/sol_command
	name = "basic sol command headset"
	desc = "A headset used by the SCG officers. This one has only the Sol Command channel by default."
	icon_state = "com_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/heads/sol_command_basic
	frequency = SOL_PUB_FREQ