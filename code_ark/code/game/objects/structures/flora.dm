// JUNGLE TREES

/obj/structure/flora/tree/jungle
	name = "jungle tree"
	desc = "It's a tropical living tree. It brings you the atmosphere of home."
	icon = 'code_ark/icons/obj/flora/jungletree.dmi'
	icon_state = "tree"

/obj/structure/flora/tree/jungle/v_2
	icon_state = "tree1"

/obj/structure/flora/tree/jungle/v_3
	icon_state = "tree2"

/obj/structure/flora/tree/jungle/v_4
	icon_state = "tree3"

/obj/structure/flora/tree/jungle/v_5
	icon_state = "tree4"

/obj/structure/flora/tree/jungle/v_6
	icon_state = "tree5"

/obj/structure/flora/tree/jungle/v_7
	icon_state = "tree6"

/obj/structure/flora/tree/jungle/random/New()
	icon_state = pick("tree", "tree1", "tree2", "tree3", "tree4", "tree5", "tree6")
	..()

/obj/structure/flora/tree/jungle/stump
	name = "tree stump"
	desc = "There used to be a tree here apparently. It's a shame someone has cut it."
	icon_state = "tree_stump"

// SMALL JUNGLE TREES

/obj/structure/flora/tree/jungle/small
	icon = 'code_ark/icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree"

/obj/structure/flora/tree/jungle/small/v_2
	icon_state = "tree1"

/obj/structure/flora/tree/jungle/small/v_3
	icon_state = "tree2"

/obj/structure/flora/tree/jungle/small/v_4
	icon_state = "tree3"

/obj/structure/flora/tree/jungle/small/v_5
	icon_state = "tree4"

/obj/structure/flora/tree/jungle/small/v_6
	icon_state = "tree5"

/obj/structure/flora/tree/jungle/small/v_7
	icon_state = "tree6"

/obj/structure/flora/tree/jungle/small/random/New()
	icon_state = pick("tree", "tree1", "tree2", "tree3", "tree4", "tree5")
	..()

/obj/structure/flora/tree/jungle/small/stump
	name = "tree stump"
	desc = "There used to be a tree here apparently. It's a shame someone has cut it."
	icon_state = "tree_stump"

// GENERAL JUNGLE FLORA

/obj/structure/flora/jungle
	icon = 'code_ark/icons/obj/flora/jungleflora.dmi'

/obj/structure/flora/jungle/rock
	name = "rock"
	desc = "These are some nicely looking decorative rocks with some grass growing around."
	icon_state = "rock"

/obj/structure/flora/jungle/rock/v_2
	icon_state = "rock1"

/obj/structure/flora/jungle/rock/v_3
	icon_state = "rock2"

/obj/structure/flora/jungle/rock/v_4
	icon_state = "rock3"

/obj/structure/flora/jungle/rock/v_5
	icon_state = "rock4"

/obj/structure/flora/jungle/rock/v_6
	icon_state = "rock5"

/obj/structure/flora/jungle/rock/random/New()
	icon_state = pick("rock", "rock1", "rock2", "rock3", "rock4", "rock5")
	..()

/obj/structure/flora/jungle/grass
	name = "grass"
	desc = "It's some decorative living grass. Ideal for walking barefoot."
	icon_state = "grassa"

/obj/structure/flora/jungle/grass/a_1
	icon_state = "grassa"

/obj/structure/flora/jungle/grass/a_2
	icon_state = "grassa1"

/obj/structure/flora/jungle/grass/a_3
	icon_state = "grassa2"

/obj/structure/flora/jungle/grass/a_4
	icon_state = "grassa3"

/obj/structure/flora/jungle/grass/a_5
	icon_state = "grassa4"

/obj/structure/flora/jungle/grass/a_6
	icon_state = "grassa5"

/obj/structure/flora/jungle/grass/a_random/New()
	icon_state = pick("grassa", "grassa1", "grassa2", "grassa3", "grassa4", "grassa5")
	..()

/obj/structure/flora/jungle/grass/b_1
	icon_state = "grassb"

/obj/structure/flora/jungle/grass/b_2
	icon_state = "grassb1"

/obj/structure/flora/jungle/grass/b_3
	icon_state = "grassb2"

/obj/structure/flora/jungle/grass/b_4
	icon_state = "grassb3"

/obj/structure/flora/jungle/grass/b_5
	icon_state = "grassb4"

/obj/structure/flora/jungle/grass/b_6
	icon_state = "grassb5"

/obj/structure/flora/jungle/grass/b_random
	icon_state = "grassb"

/obj/structure/flora/jungle/grass/b_random/New()
	icon_state = pick("grassb", "grassb1", "grassb2", "grassb3", "grassb4", "grassb5")
	..()

/obj/structure/flora/jungle/bush
	name = "bush"
	desc = "It's a living bush making you feel home. Nothing remarkable."
	icon_state = "busha"

/obj/structure/flora/jungle/bush/a_1
	icon_state = "busha"

/obj/structure/flora/jungle/bush/a_2
	icon_state = "busha1"

/obj/structure/flora/jungle/bush/a_3
	icon_state = "busha2"

/obj/structure/flora/jungle/bush/a_4
	icon_state = "busha3"

/obj/structure/flora/jungle/bush/a_random
	icon_state = "busha"

/obj/structure/flora/jungle/bush/a_random/New()
	icon_state = pick("busha", "busha1", "busha2", "busha3")
	..()

/obj/structure/flora/jungle/bush/b_1
	icon_state = "bushb"

/obj/structure/flora/jungle/bush/b_2
	icon_state = "bushb1"

/obj/structure/flora/jungle/bush/b_3
	icon_state = "bushb2"

/obj/structure/flora/jungle/bush/b_4
	icon_state = "bushb3"

/obj/structure/flora/jungle/bush/b_random
	icon_state = "bushb"

/obj/structure/flora/jungle/bush/b_random/New()
	icon_state = pick("bushb", "bushb1", "bushb2", "bushb3")
	..()

/obj/structure/flora/jungle/bush/c_1
	icon_state = "bushc"

/obj/structure/flora/jungle/bush/c_2
	icon_state = "bushc1"

/obj/structure/flora/jungle/bush/c_3
	icon_state = "bushc2"

/obj/structure/flora/jungle/bush/c_4
	icon_state = "bushc3"

/obj/structure/flora/jungle/bush/c_random
	icon_state = "bushc"

/obj/structure/flora/jungle/bush/c_random/New()
	icon_state = pick("bushc", "bushc1", "bushc2", "bushc3")
	..()

// LARGE JUNGLE FLORA

/obj/structure/flora/jungle/large
	icon = 'code_ark/icons/obj/flora/largejungleflora.dmi'

/obj/structure/flora/jungle/large/bush
	name = "large bush"
	desc = "It's a large living bush. It makes you feel in a tropical forest rather than in orbit."
	icon_state = "bush"

/obj/structure/flora/jungle/large/bush/v_2
	icon_state = "bush1"

/obj/structure/flora/jungle/large/bush/v_3
	icon_state = "bush2"

/obj/structure/flora/jungle/large/bush/v_4
	icon_state = "bush3"

/obj/structure/flora/jungle/large/bush/random/New()
	icon_state = pick("bush", "bush1", "bush2", "bush3")
	..()

/obj/structure/flora/jungle/large/rock
	name = "large rocks"
	desc = "These are some large decorative rocks with some grass gworing around. It makes you feel cozy."
	icon_state = "rocks"

/obj/structure/flora/jungle/large/rock/v_2
	icon_state = "rocks1"

/obj/structure/flora/jungle/large/rock/v_3
	icon_state = "rocks2"

/obj/structure/flora/jungle/large/rock/v_4
	icon_state = "rocks3"

/obj/structure/flora/jungle/large/rock/random/New()
	icon_state = pick("rocks", "rocks1", "rocks2", "rocks3")
	..()

// NON-ORGANIC DECORATIONS (I wish I knew a better place than "flora" to put it to)

/obj/structure/flora/nonorganic/basalt
	name = "basalt chunk"
	desc = "It's a large chunk of basalt indicating an ongoing or bygone volcanic activity in the area."
	icon = 'code_ark/icons/obj/rocks.dmi'
	icon_state = "basalt"

/obj/structure/flora/nonorganic/basalt/v_2
	icon_state = "basalt1"

/obj/structure/flora/nonorganic/basalt/v_3
	icon_state = "basalt2"

/obj/structure/flora/nonorganic/basalt/v_4
	icon_state = "basalt3"

/obj/structure/flora/nonorganic/basalt/random/New()
	icon_state = pick("basalt", "basalt1", "basalt2", "basalt3")
	..()

/obj/structure/flora/nonorganic/lavarocks
	name = "basalt rocks"
	desc = "It's a pile of basalt rock indicating an ongoing or bygone volcanic activity in the area."
	icon = 'code_ark/icons/obj/rocks.dmi'
	icon_state = "lavarocks"

/obj/structure/flora/nonorganic/lavarocks/v_2
	icon_state = "lavarocks1"

/obj/structure/flora/nonorganic/lavarocks/v_3
	icon_state = "lavarocks2"

/obj/structure/flora/nonorganic/lavarocks/v_4
	icon_state = "lavarocks3"

/obj/structure/flora/nonorganic/lavarocks/random/New()
	icon_state = pick("lavarocks", "lavarocks1", "lavarocks2", "lavarocks3")
	..()