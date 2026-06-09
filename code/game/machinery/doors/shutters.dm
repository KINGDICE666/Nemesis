/obj/machinery/door/poddoor/shutters
	gender = PLURAL
	name = "ставни"
	desc = "Прочные механические ставни с атмосферным уплотнением, сохраняющим герметичность после закрытия."
	icon = 'icons/obj/doors/shutters.dmi'
	layer = SHUTTER_LAYER
	closingLayer = SHUTTER_LAYER
	damage_deflection = 20
	armor_type = /datum/armor/poddoor_shutters
	max_integrity = 100
	recipe_type = /datum/crafting_recipe/shutters
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 5, /datum/material/iron = SMALL_MATERIAL_AMOUNT, /datum/material/glass = SMALL_MATERIAL_AMOUNT)
	animation_sound = 'sound/machines/shutter.ogg'
	show_nav_computer_icon = FALSE

/obj/machinery/door/poddoor/shutters/animation_length(animation)
	switch(animation)
		if(DOOR_OPENING_ANIMATION)
			return 1.388 SECONDS
		if(DOOR_CLOSING_ANIMATION)
			return 1.388 SECONDS

/obj/machinery/door/poddoor/shutters/animation_segment_delay(animation)
	switch(animation)
		if(DOOR_OPENING_PASSABLE)
			return 0.76 SECONDS
		if(DOOR_OPENING_FINISHED)
			return 1.388 SECONDS
		if(DOOR_CLOSING_UNPASSABLE)
			return 0.152 SECONDS
		if(DOOR_CLOSING_FINISHED)
			return 1.388 SECONDS

/obj/machinery/door/poddoor/shutters/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/shutters/preopen/deconstructed
	deconstruction = BLASTDOOR_NEEDS_WIRES
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 5)

/obj/machinery/door/poddoor/shutters/indestructible
	name = "укрепленные ставни"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/door/poddoor/shutters/indestructible/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/shutters/radiation
	name = "радиационные ставни"
	desc = "Ставни со свинцовой обшивкой и знаком радиационной опасности. Они не защитят вас от облучения полностью, особенно рядом с кристаллом суперматерии, но ограничат распространение радиации."
	icon = 'icons/obj/doors/shutters_radiation.dmi'
	icon_state = "closed"
	rad_insulation = RAD_EXTREME_INSULATION

/obj/machinery/door/poddoor/shutters/radiation/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE
	rad_insulation = RAD_NO_INSULATION

/datum/armor/poddoor_shutters
	melee = 20
	bullet = 20
	laser = 20
	energy = 75
	bomb = 25
	fire = 100
	acid = 70

/obj/machinery/door/poddoor/shutters/radiation/open()
	. = ..()
	rad_insulation = RAD_NO_INSULATION

/obj/machinery/door/poddoor/shutters/radiation/close()
	. = ..()
	rad_insulation = RAD_EXTREME_INSULATION

/obj/machinery/door/poddoor/shutters/window
	name = "ставни с окном"
	desc = "Ставни с толстым прозрачным поликарбонатным окном."
	icon = 'icons/obj/doors/shutters_window.dmi'
	icon_state = "closed"
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/poddoor/shutters/window/preopen
	icon_state = "open"
	density = FALSE

/obj/machinery/door/poddoor/shutters/window/indestructible
	name = "укрепленные ставни с окном"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/door/poddoor/shutters/window/indestructible/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/shutters/syndicate
	icon = 'icons/obj/doors/syndicateshutters.dmi'

/obj/machinery/door/poddoor/shutters/syndicate/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/shutters/syndicate/indestructible
	name = "укрепленные ставни Синдиката"
	resistance_flags = INDESTRUCTIBLE
