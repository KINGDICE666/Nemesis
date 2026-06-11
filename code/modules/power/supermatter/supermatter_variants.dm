/// Normal SM with it's processing disabled.
/obj/machinery/power/supermatter_crystal/hugbox
	disable_damage = TRUE
	disable_gas =  TRUE
	disable_power_change = TRUE
	disable_process = SM_PROCESS_DISABLED

/// Normal SM designated as main engine.
/obj/machinery/power/supermatter_crystal/engine
	is_main_engine = TRUE

/// Shard SM.
/obj/machinery/power/supermatter_crystal/shard
	name = "осколок суперматерии"
	desc = "Странно полупрозрачный переливающийся кристалл, который, похоже, когда-то был частью более крупной структуры."
	base_icon_state = "sm_shard"
	icon_state = "sm_shard"
	anchored = FALSE
	absorption_ratio = 0.125
	explosion_power = 12
	layer = ABOVE_MOB_LAYER
	moveable = TRUE


/obj/machinery/power/supermatter_crystal/shard/Initialize(mapload)
	. = ..()

	register_context()


/obj/machinery/power/supermatter_crystal/shard/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(held_item?.tool_behaviour == TOOL_WRENCH)
		context[SCREENTIP_CONTEXT_LMB] = anchored ? "Открепить" : "Закрепить"
		return CONTEXTUAL_SCREENTIP_SET


/// Shard SM with it's processing disabled.
/obj/machinery/power/supermatter_crystal/shard/hugbox
	name = "закреплённый осколок суперматерии"
	disable_damage = TRUE
	disable_gas =  TRUE
	disable_power_change = TRUE
	disable_process = SM_PROCESS_DISABLED
	moveable = FALSE
	anchored = TRUE

/// Shard SM designated as the main engine.
/obj/machinery/power/supermatter_crystal/shard/engine
	name = "закреплённый осколок суперматерии"
	is_main_engine = TRUE
	anchored = TRUE
	moveable = FALSE

/// Normal sm but small (sm sword recipe element) (wiz only) and adamantine pedestal for it
/obj/machinery/power/supermatter_crystal/small
	name = "странно маленький кристалл суперматерии"
	desc = "Странно полупрозрачный переливающийся кристалл на адамантиновом пьедестале. Кажется, он должен быть немного больше..."
	base_icon_state = "sm_small"
	icon_state = "sm_small"
	moveable = TRUE
	anchored = FALSE
	custom_materials = list(/datum/material/adamantine = SHEET_MATERIAL_AMOUNT * 20, /datum/material/iron = SHEET_MATERIAL_AMOUNT)

/obj/machinery/power/supermatter_crystal/small/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Adamantium Signal")
	priority_announce("На борту обнаружен аномальный кристалл. Местоположение отмечено на каждом GPS-устройстве.", "Объявление отдела аномалий Nanotrasen")

/obj/item/adamantine_pedestal
	name = "адамантиновый пьедестал"
	desc = "Адамантиновый пьедестал. Кажется, сверху должно быть что-то маленькое, но массивное."
	icon = 'icons/obj/machines/engine/supermatter.dmi'
	icon_state = "pedestal"
	w_class = WEIGHT_CLASS_HUGE
	throw_speed = 1
	throw_range = 1
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	custom_materials = list(/datum/material/adamantine = SHEET_MATERIAL_AMOUNT * 20)
