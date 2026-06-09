//Cyborg
/datum/design/borg_suit
	name = "Cyborg Endoskeleton"
	id = "borg_suit"
	build_type = MECHFAB
	build_path = /obj/item/robot_suit
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 50 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_chest
	name = "Cyborg Torso"
	id = "borg_chest"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/chest/robot
	materials = list(/datum/material/iron= SHEET_MATERIAL_AMOUNT*20)
	construction_time = 35 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_head
	name = "Cyborg Head"
	id = "borg_head"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/head/robot
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 35 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_l_arm
	name = "Cyborg Left Arm"
	id = "borg_l_arm"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/arm/left/robot
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_r_arm
	name = "Cyborg Right Arm"
	id = "borg_r_arm"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/arm/right/robot
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_l_leg
	name = "Cyborg Left Leg"
	id = "borg_l_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/left/robot
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

/datum/design/borg_r_leg
	name = "Cyborg Right Leg"
	id = "borg_r_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/right/robot
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CHASSIS
	)

//Advanced Robotic Limbs

/datum/design/advanced_l_arm
	name = "Advanced Left Arm"
	id = "advanced_l_arm"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/arm/left/robot/advanced
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ADVANCED_LIMBS
	)

/datum/design/advanced_r_arm
	name = "Advanced Right Arm"
	id = "advanced_r_arm"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/arm/right/robot/advanced
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ADVANCED_LIMBS
	)

/datum/design/advanced_l_leg
	name = "Advanced Left Leg"
	id = "advanced_l_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/left/robot/advanced
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ADVANCED_LIMBS
	)

/datum/design/advanced_r_leg
	name = "Advanced Right Leg"
	id = "advanced_r_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/right/robot/advanced
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ADVANCED_LIMBS
	)

//Ripley
/datum/design/ripley_chassis
	name = "Exosuit Chassis (APLU \"Ripley\")"
	id = "ripley_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/ripley
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/ripley_torso
	name = "Exosuit Torso (APLU \"Ripley\")"
	id = "ripley_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3.75,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/ripley_left_arm
	name = "Exosuit Left Arm (APLU \"Ripley\")"
	id = "ripley_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_left_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/ripley_right_arm
	name = "Exosuit Right Arm (APLU \"Ripley\")"
	id = "ripley_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_right_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/ripley_left_leg
	name = "Exosuit Left Leg (APLU \"Ripley\")"
	id = "ripley_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_left_leg
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/ripley_right_leg
	name = "Exosuit Right Leg (APLU \"Ripley\")"
	id = "ripley_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/ripley_right_leg
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Odysseus
/datum/design/odysseus_chassis
	name = "Exosuit Chassis (\"Odysseus\")"
	id = "odysseus_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/odysseus
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_torso
	name = "Exosuit Torso (\"Odysseus\")"
	id = "odysseus_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_torso
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*6)
	construction_time = 18 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_head
	name = "Exosuit Head (\"Odysseus\")"
	id = "odysseus_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_left_arm
	name = "Exosuit Left Arm (\"Odysseus\")"
	id = "odysseus_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_left_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*3)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_right_arm
	name = "Exosuit Right Arm (\"Odysseus\")"
	id = "odysseus_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_right_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*3)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_left_leg
	name = "Exosuit Left Leg (\"Odysseus\")"
	id = "odysseus_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_left_leg
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*3.5)
	construction_time = 13 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/odysseus_right_leg
	name = "Exosuit Right Leg (\"Odysseus\")"
	id = "odysseus_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/odysseus_right_leg
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*3.5)
	construction_time = 13 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_ODYSSEUS + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Gygax
/datum/design/gygax_chassis
	name = "Exosuit Chassis (\"Gygax\")"
	id = "gygax_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/gygax
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_torso
	name = "Exosuit Torso (\"Gygax\")"
	id = "gygax_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_head
	name = "Exosuit Head (\"Gygax\")"
	id = "gygax_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_left_arm
	name = "Exosuit Left Arm (\"Gygax\")"
	id = "gygax_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_left_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold=HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_right_arm
	name = "Exosuit Right Arm (\"Gygax\")"
	id = "gygax_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold=HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_left_leg
	name = "Exosuit Left Leg (\"Gygax\")"
	id = "gygax_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold=HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_right_leg
	name = "Exosuit Right Leg (\"Gygax\")"
	id = "gygax_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold=HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/gygax_armor
	name = "Exosuit Armor (\"Gygax\")"
	id = "gygax_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/gygax_armor
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 60 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Durand
/datum/design/durand_chassis
	name = "Exosuit Chassis (\"Durand\")"
	id = "durand_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/durand
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*12.5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_torso
	name = "Exosuit Torso (\"Durand\")"
	id = "durand_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*12.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_head
	name = "Exosuit Head (\"Durand\")"
	id = "durand_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_left_arm
	name = "Exosuit Left Arm (\"Durand\")"
	id = "durand_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_left_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_right_arm
	name = "Exosuit Right Arm (\"Durand\")"
	id = "durand_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_left_leg
	name = "Exosuit Left Leg (\"Durand\")"
	id = "durand_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_right_leg
	name = "Exosuit Right Leg (\"Durand\")"
	id = "durand_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/durand_armor
	name = "Exosuit Armor (\"Durand\")"
	id = "durand_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/durand_armor
	materials = list(
		/datum/material/iron=SMALL_MATERIAL_AMOUNT * 300,
		/datum/material/uranium=SHEET_MATERIAL_AMOUNT*12.5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*10,
	)
	construction_time = 60 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//H.O.N.K
/datum/design/honk_chassis
	name = "Exosuit Chassis (\"H.O.N.K\")"
	id = "honk_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/honker
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_torso
	name = "Exosuit Torso (\"H.O.N.K\")"
	id = "honk_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_head
	name = "Exosuit Head (\"H.O.N.K\")"
	id = "honk_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_left_arm
	name = "Exosuit Left Arm (\"H.O.N.K\")"
	id = "honk_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_left_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_right_arm
	name = "Exosuit Right Arm (\"H.O.N.K\")"
	id = "honk_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_left_leg
	name = "Exosuit Left Leg (\"H.O.N.K\")"
	id = "honk_left_leg"
	build_type = MECHFAB
	build_path =/obj/item/mecha_parts/part/honker_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/honk_right_leg
	name = "Exosuit Right Leg (\"H.O.N.K\")"
	id = "honk_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/honker_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Phazon
/datum/design/phazon_chassis
	name = "Exosuit Chassis (\"Phazon\")"
	id = "phazon_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/phazon
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_torso
	name = "Exosuit Torso (\"Phazon\")"
	id = "phazon_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*17.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*10,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_head
	name = "Exosuit Head (\"Phazon\")"
	id = "phazon_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_left_arm
	name = "Exosuit Left Arm (\"Phazon\")"
	id = "phazon_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_left_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_right_arm
	name = "Exosuit Right Arm (\"Phazon\")"
	id = "phazon_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_left_leg
	name = "Exosuit Left Leg (\"Phazon\")"
	id = "phazon_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_right_leg
	name = "Exosuit Right Leg (\"Phazon\")"
	id = "phazon_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/phazon_armor
	name = "Exosuit Armor (\"Phazon\")"
	id = "phazon_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/phazon_armor
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*12.5,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*10,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Savannah-Ivanov
/datum/design/savannah_ivanov_chassis
	name = "Exosuit Chassis (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/savannah_ivanov
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_torso
	name = "Exosuit Torso (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3.75,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_head
	name = "Exosuit Head (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_left_arm
	name = "Exosuit Left Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_right_arm
	name = "Exosuit Right Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_chassis
	name = "Exosuit Chassis (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/savannah_ivanov
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*12.5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_torso
	name = "Exosuit Torso (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*12.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_head
	name = "Exosuit Head (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_left_arm
	name = "Exosuit Left Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_right_arm
	name = "Exosuit Right Arm (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_arm
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_left_leg
	name = "Exosuit Left Leg (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_left_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_left_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_right_leg
	name = "Exosuit Right Leg (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_right_leg"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_right_leg
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/savannah_ivanov_armor
	name = "Exosuit Armor (\"Savannah-Ivanov\")"
	id = "savannah_ivanov_armor"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/savannah_ivanov_armor
	materials = list(
		/datum/material/iron=SMALL_MATERIAL_AMOUNT * 300,
		/datum/material/uranium=SHEET_MATERIAL_AMOUNT*12.5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*10,
	)
	construction_time = 60 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Clarke
/datum/design/clarke_chassis
	name = "Exosuit Chassis (\"Clarke\")"
	id = "clarke_chassis"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/chassis/clarke
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*10)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/clarke_torso
	name = "Exosuit Torso (\"Clarke\")"
	id = "clarke_torso"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/clarke_torso
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3.75,
		)
	construction_time = 20 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/clarke_head
	name = "Exosuit Head (\"Clarke\")"
	id = "clarke_head"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/clarke_head
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/clarke_left_arm
	name = "Exosuit Left Arm (\"Clarke\")"
	id = "clarke_left_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/clarke_left_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

/datum/design/clarke_right_arm
	name = "Exosuit Right Arm (\"Clarke\")"
	id = "clarke_right_arm"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/part/clarke_right_arm
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*7.5)
	construction_time = 15 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CHASSIS
	)

//Exosuit Equipment
/datum/design/ripleyupgrade
	name = "Ripley MK-I to MK-II Conversion Kit"
	id = "ripleyupgrade"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/ripleyupgrade
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MODULES,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
	)

/datum/design/paddyupgrade
	name = "Ripley MK-I to Paddy Conversion Kit"
	id = "paddyupgrade"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/ripleyupgrade/paddy
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT *5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MODULES,
		RND_CATEGORY_MECHFAB_PADDY + RND_SUBCATEGORY_MECHFAB_CHASSIS,
	)

/datum/design/mech_hydraulic_clamp
	name = "Hydraulic Clamp"
	id = "mech_hydraulic_clamp"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/hydraulic_clamp
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MISC,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
	)

/datum/design/mech_hydraulic_claw
	name = "Hydraulic Claw"
	id = "mech_hydraulic_claw"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/paddy_claw
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MISC,
		RND_CATEGORY_MECHFAB_PADDY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
	)

/datum/design/mech_drill
	name = "Mining Drill"
	id = "mech_drill"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/drill
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MINING,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_mining_scanner
	name = "Mining Scanner"
	id = "mech_mscanner"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/mining_scanner
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT *1.25,
	)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MINING,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)

/datum/design/mech_extinguisher
	name = "Extinguisher"
	id = "mech_extinguisher"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/extinguisher
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MISC,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)

/datum/design/mech_generator
	name = "Plasma Generator"
	id = "mech_generator"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/generator
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MISC,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_mousetrap_mortar
	name = "Mousetrap Mortar"
	id = "mech_mousetrap_mortar"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/mousetrap_mortar
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_HONK,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_banana_mortar
	name = "Banana Mortar"
	id = "mech_banana_mortar"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/banana_mortar
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 30 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_HONK,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_honker
	name = "HoNkER BlAsT 5000"
	id = "mech_honker"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/honker
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 50 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_HONK,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_punching_glove
	name = "Oingo Boingo Punch-face"
	id = "mech_punching_face"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*10,
		/datum/material/bananium=SHEET_MATERIAL_AMOUNT*3.75,
	)
	construction_time = 40 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_HONK,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_radio
	name = "Mech Radio"
	id = "mech_radio"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/radio
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*2.5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MINING,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mech_air_tank
	name = "Mech Air Tank"
	id = "mech_air_tank"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_equipment/air_tank
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*5)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MINING,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/////////////////////////////////////////
//////////////Borg Upgrades//////////////
/////////////////////////////////////////

/datum/design/borg_upgrade_rename
	name = "Плата переименования"
	id = "borg_upgrade_rename"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rename
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_restart
	name = "Плата аварийной перезагрузки"
	id = "borg_upgrade_restart"
	build_type = MECHFAB
	build_path = /obj/item/borg_restart_board
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_thrusters
	name = "Ионные двигатели"
	id = "borg_upgrade_thrusters"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/thrusters
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/plasma =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/uranium =SHEET_MATERIAL_AMOUNT*3,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_disablercooler
	name = "Модуль быстрого охлаждения дизейблера"
	id = "borg_upgrade_disablercooler"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/disablercooler
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*10,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold =SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond =SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SECURITY
	)

/datum/design/borg_upgrade_diamonddrill
	name = "Алмазный бур"
	id = "borg_upgrade_diamonddrill"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/diamond_drill
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/diamond =SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 8 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MINING
	)

/datum/design/borg_upgrade_holding
	name = "Бездонная сумка для руды"
	id = "borg_upgrade_holding"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/soh
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/gold =SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MINING
	)

/datum/design/borg_upgrade_lavaproof
	name = "Лавостойкие гусеницы"
	id = "borg_upgrade_lavaproof"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/lavaproof
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/plasma =SHEET_MATERIAL_AMOUNT*2,
		/datum/material/titanium =SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MINING
	)

/datum/design/borg_syndicate_module
	name = "Нелегальные модули"
	id = "borg_syndicate_module"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/syndicate
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/diamond =SHEET_MATERIAL_AMOUNT*5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_transform_clown
	name = "Модуль клоуна"
	id = "borg_transform_clown"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/clown
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/bananium =HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_selfrepair
	name = "Модуль саморемонта"
	id = "borg_upgrade_selfrepair"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/selfrepair
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
	)
	construction_time = 8 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/borg_upgrade_expandedsynthesiser
	name = "Расширенный синтезатор гипоспрея"
	id = "borg_upgrade_expandedsynthesiser"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/hypospray/expanded
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/plasma =SHEET_MATERIAL_AMOUNT*4,
		/datum/material/uranium =SHEET_MATERIAL_AMOUNT*4,
	)
	construction_time = 8 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_piercinghypospray
	name = "Пробивающий гипоспрей"
	id = "borg_upgrade_piercinghypospray"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/piercing_hypospray
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/titanium =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/diamond =SHEET_MATERIAL_AMOUNT * 1.5,
	)
	construction_time = 8 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_defibrillator
	name = "Дефибриллятор"
	id = "borg_upgrade_defibrillator"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/defib
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*4,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/silver =SHEET_MATERIAL_AMOUNT*2,
		/datum/material/gold =SHEET_MATERIAL_AMOUNT * 1.5,
	)
	construction_time = 8 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_surgicalprocessor
	name = "Хирургический процессор"
	id = "borg_upgrade_surgicalprocessor"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/processor
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*2,
		/datum/material/silver =SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_surgicalomnitool
	name = "Продвинутый хирургический омнитул"
	id = "borg_upgrade_surgicalomnitool"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/surgery_omnitool
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/silver=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_engineeringomnitool
	name = "Продвинутый инженерный омнитул"
	id = "borg_upgrade_engineeringomnitool"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/engineering_omnitool
	materials = list(
		/datum/material/iron=SHEET_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold=SHEET_MATERIAL_AMOUNT*2,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING,
	)

/datum/design/borg_upgrade_trashofholding
	name = "Бездонный мешок для мусора"
	id = "borg_upgrade_trashofholding"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/tboh
	materials = list(
		/datum/material/gold =SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_advancedmop
	name = "Продвинутая швабра"
	id = "borg_upgrade_advancedmop"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/amop
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_prt
	name = "Инструмент ремонта обшивки"
	id = "borg_upgrade_prt"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/prt
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*1.125,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*0.75,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_plunger
	name = "Встроенный вантуз"
	id = "borg_upgrade_plunger"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/plunger
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*1.125,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*0.75,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_high_capacity_replacer
	name = "Светозаменитель повышенной ёмкости"
	id = "borg_upgrade_high_capacity_replacer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/high_capacity_light_replacer
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*1.125,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*0.75,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/borg_upgrade_rolling_table
	name = "Док для катящегося стола"
	id = "borg_upgrade_rolling_table"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rolling_table
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*10,
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT*7.5,
	) //steeper price than a regular rolling table, with some added titanium to make up for the relative rarity of regular rolling tables
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_condiment_synthesizer
	name = "Синтезатор приправ"
	id = "borg_upgrade_condiment_synthesizer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/condiment_synthesizer
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*6,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT*3,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT*3,
	) //a bit cheaper than an expanded hypo for medical borg,
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_silicon_knife
	name = "Кухонный набор инструментов"
	id = "borg_upgrade_silicon_knife"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/silicon_knife
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_botany
	name = "Ботанические инструменты"
	id = "borg_upgrade_botany"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/botany_upgrade
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*13,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*2 // approx. all mats that u wasting on those tools on lathe
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)


/datum/design/borg_upgrade_drink_apparatus
	name = "Аппарат для напитков"
	id = "borg_upgrade_drink_apparatus"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/drink_app
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_service_apparatus
	name = "Сервисный аппарат"
	id = "borg_upgrade_service_apparatus"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/service_apparatus
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*2.5)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_service_cookbook
	name = "Сервисная кулинарная книга"
	id = "borg_upgrade_service_cookbook"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/service_cookbook
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/datum/design/borg_upgrade_shuttle_blueprints
	name = "Инженерные чертежи шаттла"
	id = "borg_upgrade_engineering_shuttle_blueprints"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/shuttle_blueprints
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*2.5,
	)
	construction_time = 4 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_expand
	name = "Модуль расширения"
	id = "borg_upgrade_expand"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/expand
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*100,
		/datum/material/titanium =SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/datum/design/boris_ai_controller
	name = "Пульт управления ИИ-киборгом B.O.R.I.S."
	id = "borg_ai_control"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/ai
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT*1.2,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT * 2,
	)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CONTROL_INTERFACES
	)
	search_metadata = "boris"

/datum/design/borg_upgrade_rped
	name = "Расширенный RPED"
	id = "borg_upgrade_rped"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/rped
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*2.5,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT*2.5
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_inducer
	name = "Индуктор киборга"
	id = "borg_upgrade_inducer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/inducer
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver = SHEET_MATERIAL_AMOUNT * 2)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_engineering_app
	name = "Инженерный аппарат"
	id = "borg_upgrade_engineeringapp"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/engineering_app
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ENGINEERING
	)

/datum/design/borg_upgrade_beaker_app
	name = "Дополнительное хранилище мензурок"
	id = "borg_upgrade_beakerapp"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/beaker_app
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT*1.125,
	) //Need glass for the new beaker too
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_pinpointer
	name = "Пинпоинтер экипажа"
	id = "borg_upgrade_pinpointer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/pinpointer
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_syringe
	name = "Продвинутый шприц"
	id = "borg_upgrade_syringe"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/bs_syringe
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =SMALL_MATERIAL_AMOUNT*5
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_MEDICAL
	)

/datum/design/borg_upgrade_broomer
	name = "Экспериментальная широкая щётка"
	id = "borg_upgrade_broomer"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/broomer
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*2,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_JANITOR
	)

/datum/design/mmi
	name = "Человеко-машинный интерфейс"
	desc = "Сухая аббревиатура MMI скрывает истинный ужас этого устройства."
	id = "mmi"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	construction_time = 7.5 SECONDS
	build_path = /obj/item/mmi
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CONTROL_INTERFACES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mmi/medical
	build_type = PROTOLATHE | AWAY_LATHE
	id = "mmi_m"
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/posibrain
	name = "Позитронный мозг"
	desc = "Новейшая разработка в области искусственного интеллекта."
	id = "mmi_posi"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT*1.7,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*1.35,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5
	)
	construction_time = 7.5 SECONDS
	build_path = /obj/item/mmi/posibrain
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CONTROL_INTERFACES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

//Misc
/datum/design/mecha_tracking
	name = "Маяк отслеживания экзокостюма"
	id = "mecha_tracking"
	build_type = MECHFAB
	build_path =/obj/item/mecha_parts/mecha_tracking
	materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*5)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_MISC,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_SUPPORTED_EQUIPMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mecha_tracking_ai_control
	name = "Маяк управления ИИ"
	id = "mecha_tracking_ai_control"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/mecha_tracking/ai_control
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/silver =SMALL_MATERIAL_AMOUNT * 2,
	)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/mecha_camera
	name = "Комплект внешней камеры экзокостюма"
	desc = "Прочная камера видеонаблюдения, предназначенная для работы с экзокостюмами."
	id = "mecha_camera"
	build_type = MECHFAB
	build_path = /obj/item/mecha_parts/camera_kit
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/plasma =SMALL_MATERIAL_AMOUNT * 2,
		/datum/material/titanium =SMALL_MATERIAL_AMOUNT * 2,
	)
	construction_time = 5 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_EQUIPMENT + RND_SUBCATEGORY_MECHFAB_EQUIPMENT_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_RIPLEY + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_GYGAX + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_DURAND + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_HONK + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_PHAZON + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_CLARKE + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES,
		RND_CATEGORY_MECHFAB_SAVANNAH_IVANOV + RND_SUBCATEGORY_MECHFAB_CONTROL_INTERFACES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/synthetic_flash
	name = "Вспышка"
	desc = "Когда возникает проблема, НАУКА становится решением."
	id = "sflash"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT * 7.5,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT * 7.5,
	)
	construction_time = 10 SECONDS
	build_path = /obj/item/assembly/flash/handheld
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG
	)
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_COMPONENTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

//MODsuit construction

/datum/design/mod_shell
	name = "Оболочка MOD"
	desc = "Оболочка модульного костюма, разработанная Nakamura Engineering."
	id = "mod_shell"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*5,
		/datum/material/plasma =SHEET_MATERIAL_AMOUNT * 2.5,
	)
	construction_time = 25 SECONDS
	build_path = /obj/item/mod/construction/shell
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODUITS_CHASSIS
	)

/datum/design/mod_helmet
	name = "Шлем MOD"
	desc = "Шлем модульного костюма, разработанный Nakamura Engineering."
	id = "mod_helmet"
	build_type = MECHFAB
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/helmet
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODUITS_CHASSIS
	)

/datum/design/mod_chestplate
	name = "Нагрудник MOD"
	desc = "Нагрудник модульного костюма, разработанный Nakamura Engineering."
	id = "mod_chestplate"
	build_type = MECHFAB
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/chestplate
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODUITS_CHASSIS
	)

/datum/design/mod_gauntlets
	name = "Рукавицы MOD"
	desc = "Рукавицы модульного костюма, разработанные Nakamura Engineering."
	id = "mod_gauntlets"
	build_type = MECHFAB
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/gauntlets
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODUITS_CHASSIS
	)

/datum/design/mod_boots
	name = "Ботинки MOD"
	desc = "Ботинки модульного костюма, разработанные Nakamura Engineering."
	id = "mod_boots"
	build_type = MECHFAB
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/boots
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODUITS_CHASSIS
	)

/datum/design/mod_plating
	name = "Внешняя обшивка MOD"
	desc = "Внешняя обшивка для MOD-костюма."
	id = "mod_plating_standard"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*1.5,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODSUITS_PLATING
	)
	research_icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	research_icon_state = "standard-plating"

/datum/design/mod_plating/New()
	. = ..()
	var/obj/item/mod/construction/plating/armor_type = build_path
	var/datum/mod_theme/theme = GLOB.mod_themes[initial(armor_type.theme)]
	desc = "Внешняя обшивка для MOD-костюма. [theme.desc]"

/datum/design/mod_plating/civilian
	name = "Гражданская обшивка MOD"
	id = "mod_plating_civilian"
	build_path = /obj/item/mod/construction/plating/civilian
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT*1.5,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	research_icon_state = "civilian-plating"

/datum/design/mod_plating/portable_suit
	name = "Портативная обшивка MOD"
	id = "mod_plating_portable_suit"
	build_path = /obj/item/mod/construction/plating/portable_suit
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 1,
		/datum/material/plasma = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plastic = SHEET_MATERIAL_AMOUNT,
	)
	research_icon_state = "psuit-plating"

/datum/design/mod_plating/engineering
	name = "Инженерная обшивка MOD"
	id = "mod_plating_engineering"
	build_path = /obj/item/mod/construction/plating/engineering
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/gold =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING
	research_icon_state = "engineering-plating"

/datum/design/mod_plating/atmospheric
	name = "Атмосферная обшивка MOD"
	id = "mod_plating_atmospheric"
	build_path = /obj/item/mod/construction/plating/atmospheric
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/titanium =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING
	research_icon_state = "atmospheric-plating"

/datum/design/mod_plating/medical
	name = "Медицинская обшивка MOD"
	id = "mod_plating_medical"
	build_path = /obj/item/mod/construction/plating/medical
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/silver =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
	research_icon_state = "medical-plating"

/datum/design/mod_plating/cosmohonk
	name = "Космохонк-обшивка MOD"
	id = "mod_plating_cosmohonk"
	build_path = /obj/item/mod/construction/plating/cosmohonk
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT*3,
		/datum/material/bananium =SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
	research_icon_state = "cosmohonk-plating"

/datum/design/mod_paint_kit
	name = "Набор покраски MOD"
	desc = "Набор краски для модульных костюмов."
	id = "mod_paint_kit"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plastic =SMALL_MATERIAL_AMOUNT*5,
	)
	construction_time = 5 SECONDS
	build_path = /obj/item/mod/paint
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODSUITS_MISC
	)

/datum/design/modlink_scryer
	name = "MODlink Scryer"
	desc = "Шейное устройство, способное связываться с другим MODlink-совместимым устройством."
	id = "modlink_scryer"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT * 3,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT * 3,
	)
	construction_time = 5 SECONDS
	build_path = /obj/item/clothing/neck/link_scryer
	category = list(
		RND_CATEGORY_MODSUITS + RND_SUBCATEGORY_MODSUITS_MISC
	)

//MODsuit modules

/datum/design/module
	name = "Модуль MOD"
	build_type = MECHFAB
	construction_time = 1 SECONDS
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_GENERAL
	)

/datum/design/module/New()
	. = ..()
	var/obj/item/mod/module/module = build_path
	desc = "[initial(module.desc)] Использует [initial(module.complexity)] сложности."

/datum/design/module/mod_storage
	name = "Компактный модуль хранения"
	id = "mod_storage"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT *1.25,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/storage

/datum/design/module/mod_storage_expanded
	name = "Модуль хранения"
	id = "mod_storage_expanded"
	materials = list(
		/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/uranium =SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/storage/large_capacity

/datum/design/module/mod_storage_holding
	name = "Бездонный модуль хранения"
	id = "mod_storage_holding"
	materials = list(
		/datum/material/gold =SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/uranium = SMALL_MATERIAL_AMOUNT*2.5,
		/datum/material/bluespace =SHEET_MATERIAL_AMOUNT
	)
	build_path = /obj/item/mod/module/storage/holding

/datum/design/module/mod_visor_medhud
	name = "Медицинский визорный модуль"
	id = "mod_visor_medhud"
	materials = list(
		/datum/material/silver =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/visor/medhud
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/mod_visor_diaghud
	name = "Диагностический визорный модуль"
	id = "mod_visor_diaghud"
	materials = list(
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/visor/diaghud
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SCIENCE
	)
/datum/design/module/mod_visor_sechud
	name = "Охранный визорный модуль"
	id = "mod_visor_sechud"
	materials = list(
		/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/visor/sechud
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)
/datum/design/module/mod_visor_meson
	name = "Мезонный визорный модуль"
	id = "mod_visor_meson"
	materials = list(
		/datum/material/uranium =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/visor/meson
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)
/datum/design/module/mod_visor_welding
	name = "Модуль сварочной защиты"
	id = "mod_welding"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/welding
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)
/datum/design/module/mod_head_protection
	name = "Модуль защиты головы Safety-First"
	id = "mod_safety"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/headprotector
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)
/datum/design/module/mod_t_ray
	name = "Модуль Т-лучевого сканера"
	id = "mod_t_ray"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/t_ray
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)
/datum/design/module/mod_health_analyzer
	name = "Модуль анализатора здоровья"
	id = "mod_health_analyzer"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/health_analyzer
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/mod_stealth
	name = "Модуль маскировки"
	id = "mod_stealth"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/stealth
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)
/datum/design/module/mod_jetpack
	name = "Модуль ионного джетпака"
	id = "mod_jetpack"
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/mod/module/jetpack

/datum/design/module/mod_magboot
	name = "Модуль магнитной стабилизации"
	id = "mod_magboot"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/magboot
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)

/datum/design/module/mod_mag_harness
	name = "Модуль магнитной сбруи"
	id = "mod_mag_harness"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/silver =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/magnetic_harness
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

/datum/design/module/mod_tether
	name = "Модуль аварийного троса"
	id = "mod_tether"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/tether
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)

/datum/design/module/mod_mouthhole
	name = "Модуль аппарата питания"
	id = "mod_mouthhole"
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	build_path = /obj/item/mod/module/mouthhole

/datum/design/module/mod_rad_protection
	name = "Модуль радиационной защиты"
	id = "mod_rad_protection"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/rad_protection
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)
/datum/design/module/mod_emp_shield
	name = "Модуль ЭМИ-защиты"
	id = "mod_emp_shield"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/emp_shield

/datum/design/module/mod_flashlight
	name = "Модуль фонаря"
	id = "mod_flashlight"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/flashlight

/datum/design/module/mod_reagent_scanner
	name = "Модуль сканера реагентов"
	id = "mod_reagent_scanner"
	materials = list(/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/mod/module/reagent_scanner
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SCIENCE
	)

/datum/design/module/mod_gps
	name = "Встроенный GPS-модуль"
	id = "mod_gps"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/gps
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)

/datum/design/module/mod_constructor
	name = "Строительный модуль"
	id = "mod_constructor"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/constructor
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)
/datum/design/module/mod_quick_carry
	name = "Модуль быстрой переноски"
	id = "mod_quick_carry"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/quick_carry
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/mod_longfall
	name = "Модуль безопасного падения"
	id = "mod_longfall"
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/mod/module/longfall

/datum/design/module/mod_thermal_regulator
	name = "Модуль терморегулятора"
	id = "mod_thermal_regulator"
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/thermal_regulator

/datum/design/module/mod_injector
	name = "Модуль инъектора"
	id = "mod_injector"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/injector
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/mod_bikehorn
	name = "Модуль клаксона"
	id = "mod_bikehorn"
	materials = list(
		/datum/material/plastic =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/bikehorn
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SERVICE
	)

/datum/design/module/mod_microwave_beam
	name = "Модуль микроволнового луча"
	id = "mod_microwave_beam"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/microwave_beam
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SERVICE
	)

/datum/design/module/mod_waddle
	name = "Модуль вперевалку"
	id = "mod_waddle"
	materials = list(
		/datum/material/plastic =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/waddle
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SERVICE
	)

/datum/design/module/mod_clamp
	name = "Модуль зажима ящиков"
	id = "mod_clamp"
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/mod/module/clamp
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)

/datum/design/module/mod_drill
	name = "Модуль бура"
	id = "mod_drill"
	materials = list(
		/datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/iron =SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/drill
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)

/datum/design/module/mod_orebag
	name = "Модуль рудной сумки"
	id = "mod_orebag"
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	build_path = /obj/item/mod/module/orebag
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)

/datum/design/module/mod_organizer
	name = "Модуль органайзера"
	id = "mod_organizer"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/organizer
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/mod_pathfinder
	name = "Модуль следопыта"
	id = "mod_pathfinder"
	materials = list(
		/datum/material/uranium =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/pathfinder

/datum/design/module/mod_dna_lock
	name = "Модуль ДНК-замка"
	id = "mod_dna_lock"
	materials = list(
		/datum/material/diamond =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/dna_lock

/datum/design/module/mod_plasma_stabilizer
	name = "Модуль стабилизатора плазмы"
	id = "mod_plasma"
	materials = list(
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/plasma_stabilizer

/datum/design/module/mod_glove_translator
	name = "Модуль перчаточного переводчика"
	id = "mod_sign_radio"
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT * 7.5,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/signlang_radio

/datum/design/module/mister_atmos
	name = "Модуль распылителя смолы"
	id = "mod_mister_atmos"
	materials = list(
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	build_path = /obj/item/mod/module/mister/atmos
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)

/datum/design/module/mod_holster
	name = "Модуль кобуры"
	id = "mod_holster"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/holster
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

/datum/design/module/mod_sonar
	name = "Модуль активного сонара"
	id = "mod_sonar"
	materials = list(
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/uranium = SMALL_MATERIAL_AMOUNT * 2.5,
	)
	build_path = /obj/item/mod/module/active_sonar
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

/datum/design/module/projectile_dampener
	name = "Модуль гасителя снарядов"
	id = "mod_projectile_dampener"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/mod/module/projectile_dampener
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

/datum/design/module/surgicalprocessor
	name = "Модуль хирургического процессора"
	id = "mod_surgicalprocessor"
	materials = list(
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	build_path = /obj/item/mod/module/surgical_processor
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/threadripper
	name = "Модуль вспарывателя швов"
	id = "mod_threadripper"
	materials = list(
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2.5,
		/datum/material/plastic =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	build_path = /obj/item/mod/module/thread_ripper
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/defibrillator
	name = "Модуль дефибриллятора"
	id = "mod_defib"
	materials = list(
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2.5,
		/datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	build_path = /obj/item/mod/module/defibrillator
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/statusreadout
	name = "Модуль вывода статуса"
	id = "mod_statusreadout"
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 2,
	)
	build_path = /obj/item/mod/module/status_readout
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/patienttransport
	name = "Модуль транспортировки пациентов"
	id = "mod_patienttransport"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/criminalcapture/patienttransport
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_MEDICAL
	)

/datum/design/module/criminalcapture
	name = "Модуль задержания преступников"
	id = "mod_criminalcapture"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/criminalcapture
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

/datum/design/module/mirage
	name = "Модуль раздатчика миражных гранат"
	id = "mod_mirage_grenade"
	materials = list(
		/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/dispenser/mirage
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

//MODsuit bepis modules
/datum/design/module/disposal
	name = "Модуль мусорного коннектора"
	id = "mod_disposal"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT *1.25,
		/datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/disposal_connector
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SUPPLY
	)

/datum/design/module/joint_torsion
	name = "Модуль суставной трещотки"
	id = "mod_joint_torsion"
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*2.5,
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/joint_torsion
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUITS_MISC
	)

/datum/design/module/recycler
	name = "Модуль переработчика"
	id = "mod_recycler"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plastic = SMALL_MATERIAL_AMOUNT*2,
	)
	build_path = /obj/item/mod/module/recycler
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SERVICE
	)

/datum/design/module/shooting_assistant
	name = "Модуль стрелкового ассистента"
	id = "mod_shooting"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*2,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT,
		/datum/material/diamond = SMALL_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/shooting_assistant
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SECURITY
	)

//MODsuit anomalock modules
/datum/design/module/mod_antigrav
	name = "Антигравитационный модуль"
	id = "mod_antigrav"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT *1.25,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/anomaly_locked/antigrav
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SCIENCE
	)

/datum/design/module/mod_teleporter
	name = "Модуль телепортера"
	id = "mod_teleporter"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT *1.25,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/anomaly_locked/teleporter
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SCIENCE
	)

/datum/design/module/mod_kinesis
	name = "Kinesis Module"
	id = "mod_kinesis"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT *1.25,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/anomaly_locked/kinesis
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_ENGINEERING
	)

/datum/design/module/fishing_glove
	name = "MOD Fishing Glove Module"
	id = "mod_fishing"
	materials = list(
		/datum/material/titanium = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/plastic = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/mod/module/fishing_glove

/datum/design/posisphere
	name = "Positronic Sphere"
	desc = "The latest in Artificial Pesterance."
	id = "posisphere"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT * 0.85,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 0.65,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT * 2.5
	)
	construction_time = 7.5 SECONDS
	build_path = /obj/item/mmi/posibrain/sphere
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CONTROL_INTERFACES
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/module/mister_janitor
	name = "Cleaning Mister Module"
	id = "mod_mister_janitor"
	materials = list(
		/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1,
	)
	build_path = /obj/item/mod/module/mister/cleaner
	category = list(
		RND_CATEGORY_MODSUIT_MODULES + RND_SUBCATEGORY_MODSUIT_MODULES_SERVICE
	)
