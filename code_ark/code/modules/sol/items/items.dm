/*******************
Torch specific items
*******************/

/obj/item/modular_computer/pda/explorer
	icon_state = "pda-exp"
	icon_state_unpowered = "pda-exp"

/obj/item/modular_computer/pda/heads/hop
	stored_pen = /obj/item/pen/multi/cmd/xo

/obj/item/modular_computer/pda/captain
	stored_pen = /obj/item/pen/multi/cmd/co

/obj/item/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/storage/backpack/satchel/explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"

/obj/item/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/pen/multi/cmd/xo
	name = "executive officer's pen"
	icon = 'code_ark/icons/obj/sol_uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/co
	name = "commanding officer's pen"
	icon = 'code_ark/icons/obj/sol_uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/storage/fakebook
	name = "Workplace Crisis Management"
	desc = "Also known as 'I fucked up, what do?'. A very popular book amongst corporate management."
	icon = 'icons/obj/library.dmi'
	icon_state = "booknanoregs"
	attack_verb = list("bashed", "whacked", "educated")
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = 4
	startswith = list(
			/obj/item/reagent_containers/pill/tox,
			/obj/item/paper/liason_note
	)

/******
Weapons
******/

/obj/item/gun/projectile/revolver/medium/captain
	name = "\improper Final Argument"
	icon = 'code_ark/icons/obj/sol_uniques.dmi'
	icon_state = "mosley"
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. This one has 'To the Captain of SEV Torch' engraved."
	fire_delay = 5.7 //Autorevolver. Also synced with the animation
	fire_anim = "mosley_fire"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	starts_loaded = 0 //Nobody keeps ballistic weapons loaded

/obj/item/gun/projectile/pistol/holdout/liaison
	magazine_type = /obj/item/ammo_magazine/pistol/small/oneway

/obj/item/ammo_magazine/pistol/small/oneway
	initial_ammo = 1

/obj/effect/paint/hull
	color = COLOR_HULL

/obj/effect/paint/expeditionary
	color = "#68099e"

/******
Passports
******/

/obj/item/passport
	name = "passport"
	icon = 'code_ark/icons/obj/sol_uniques.dmi'
	icon_state = "passport"
	force = 0.5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A passport. Its origin seems unknown."
	var/info //Everything inside. You can only see this if you open the passport by yourself.
	var/fingerprint_hash //Kinda identification.

/obj/item/passport/proc/set_info(mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/decl/cultural_info/culture = H.get_cultural_value(TAG_HOMEWORLD)
	var/pob = culture ? culture.name : "Unset"
	if(H.dna)
		fingerprint_hash = md5(H.dna.uni_identity)
	else
		fingerprint_hash = "N/A"
	info = "\icon[src] [src]:\nName: [H.real_name]\nSpecies: [H.get_species()]\nGender: [gender2text(H.gender)]\nAge: [H.age]\nPlace of Birth: [pob]\nFingerprint: [fingerprint_hash]"

/obj/item/passport/attack_self(mob/user as mob)
	user.visible_message(SPAN_NOTICE("[user] opens and checks [src]."), \
		SPAN_NOTICE("You open [src] and check for some main information."), \
		SPAN_ITALIC("You hear the faint rustle of pages."))
	if(info)
		to_chat(user, "[info].")
	else
		to_chat(user, SPAN_WARNING("[src] is completely blank!"))

/obj/item/passport/scg
	name = "\improper SCG passport"
	icon_state = "passport_scg"
	desc = "A passport from the Sol Central Government."

/obj/item/passport/earth
	name = "\improper Earth passport"
	icon_state = "passport_scg2"
	desc = "A passport from the Earth, within Sol Central Government space."

/obj/item/passport/venus
	name = "\improper Venusian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Venus, within Sol Central Government space."

/obj/item/passport/luna
	name = "\improper Luna passport"
	icon_state = "passport_scg2"
	desc = "A passport from Luna, within Sol Central Government space."

/obj/item/passport/mars
	name = "\improper Martian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Mars, within Sol Central Government space."

/obj/item/passport/phobos
	name = "\improper Phobos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Phobos, within Sol Central Government space."

/obj/item/passport/ceres
	name = "\improper Ceres passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceres, within Sol Central Government space."

/obj/item/passport/pluto
	name = "\improper Plutonian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Pluto, within Sol Central Government space."

/obj/item/passport/tiamat
	name = "\improper Tiamat passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tiamat, within Sol Central Government space."

/obj/item/passport/eos
	name = "\improper Eos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Eos, within Sol Central Government space."

/obj/item/passport/ceti_epsilon
	name = "\improper Cetite passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceti Epsilon, within Sol Central Government space."

/obj/item/passport/lordania
	name = "\improper Lordanian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Lordania, within Sol Central Government space."

/obj/item/passport/kingston
	name = "\improper Kingstonian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Kingston, within Sol Central Government space."

/obj/item/passport/cinu
	name = "\improper Cinusian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Cinu, within Sol Central Government space."

/obj/item/passport/yuklid
	name = "\improper Yuklid V passport"
	icon_state = "passport_scg2"
	desc = "A passport from Yuklid V, within Sol Central Government space."

/obj/item/passport/lorriman
	name = "\improper Lorriman passport"
	icon_state = "passport_scg2"
	desc = "A passport from Yuklid V, within Sol Central Government space."

/obj/item/passport/tersten
	name = "\improper Tersten passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tersten, within Sol Central Government space."

/obj/item/passport/south_gaia
	name = "\improper Southern Gaian passport"
	icon_state = "passport_scg2"
	desc = "A passport from the southern part of Gaia, under control of the Sol Central Government."

/obj/item/passport/iccg
	name = "\improper ICCG passport"
	icon_state = "passport_iccg"
	desc = "A passport from the Independent Colonial Confederation of Gilgamesh."

/obj/item/passport/north_gaia
	name = "\improper Northern Gaian passport"
	icon_state = "passport_iccg2"
	desc = "A passport from the northern part of Gaia, under control of the Independent Colonial Confederation of Gilgamesh."

/obj/item/passport/terra
	name = "\improper Terran passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Terra, within ICCG space."

/obj/item/passport/novayazemlya
	name = "\improper Novaya Zemlya passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Novaya Zemlya, within ICCG space."

/obj/item/passport/saveel
	name = "\improper Saveel passport"
	icon_state = "passport"
	desc = "A passport from Saveel, an isolationist frontier colony."

/obj/item/passport/magnitka
	name = "\improper Magnitkan passport"
	icon_state = "passport"
	desc = "A passport from Magnitka, an independant colony."

/obj/item/passport/empiremohranda
	name = "\improper Mohrandade passport"
	icon_state = "passport"
	desc = "A passport from the Empire of Mohranda, a frontier empire established on Lohrene and Mohranda, in the Luggust system."
