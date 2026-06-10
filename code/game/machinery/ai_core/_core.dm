#define AI_CORE_BRAIN(X) X.braintype == "Android" ? "мозг" : "ММИ"

/obj/structure/ai_core
	name = "\improper ядро ИИ"
	desc = "Каркас ядра искусственного интеллекта."
	icon = 'icons/mob/silicon/ai.dmi'
	icon_state = "build_0"
	base_icon_state = "build_"
	density = TRUE
	anchored = FALSE
	max_integrity = 500
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 4)
	var/state = CORE_STATE_EMPTY
	var/datum/ai_laws/laws
	var/obj/item/circuitboard/aicore/circuit
	var/obj/item/mmi/core_mmi

/obj/structure/ai_core/Initialize(mapload, state = src.state, obj/item/mmi/core_mmi = null)
	. = ..()
	laws = new
	laws.set_laws_config()

	if(core_mmi && state < CORE_STATE_CABLED)
		stack_trace("supplied a core_mmi as constructor argument, but core state wouldn't have accepted it!")
		state = CORE_STATE_FINISHED // just in case...
	src.state = state
	if(state >= CORE_STATE_CIRCUIT)
		circuit = new(src)
	if(state >= CORE_STATE_CABLED)
		if(!core_mmi)
			core_mmi = new /obj/item/mmi(src)
			core_mmi.brain = new(core_mmi)
			core_mmi.brain.organ_flags |= ORGAN_FROZEN
			core_mmi.set_brainmob(new /mob/living/brain())
			core_mmi.brainmob.container = core_mmi
			core_mmi.update_appearance()
		core_mmi.forceMove(src)
		src.core_mmi = core_mmi
		set_anchored(TRUE)

	update_appearance(UPDATE_ICON_STATE)

/obj/structure/ai_core/update_icon_state()
	cut_overlays()

	if(state != CORE_STATE_FINISHED)
		icon_state = "[base_icon_state][state]"
		if(state == CORE_STATE_CABLED && core_mmi)
			icon_state += "b"
	else

		icon_state = "ai-core"

		var/mutable_appearance/screen = mutable_appearance(icon, "ai-empty")
		screen.layer = FLOAT_LAYER
		screen.appearance_flags = RESET_COLOR | KEEP_APART

		add_overlay(screen)

		add_overlay(emissive_appearance(icon, "ai-empty", src, alpha = 255))

		set_light(0.2, 0.2, LIGHT_COLOR_FAINT_CYAN)

	return ..()

/obj/structure/ai_core/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == circuit)
		circuit = null
		if((state != CORE_STATE_GLASSED) && (state != CORE_STATE_FINISHED))
			state = CORE_STATE_EMPTY
			update_appearance()
	if(gone == core_mmi)
		core_mmi = null
		update_appearance()

/obj/structure/ai_core/atom_deconstruct(disassembled = TRUE)
	if(state >= CORE_STATE_GLASSED)
		new /obj/item/stack/sheet/rglass(drop_location(), 2)
	if(state >= CORE_STATE_CABLED)
		new /obj/item/stack/cable_coil(drop_location(), 5)
	core_mmi?.forceMove(drop_location())
	circuit?.forceMove(drop_location())
	new /obj/item/stack/sheet/plasteel(drop_location(), 4)

/obj/structure/ai_core/Destroy()
	QDEL_NULL(circuit)
	QDEL_NULL(core_mmi)
	QDEL_NULL(laws)
	return ..()

/obj/structure/ai_core/examine(mob/user)
	. = ..()
	. += span_notice("У него есть <b>болты</b>, которые выглядят [anchored ? "затянутыми" : "ослабленными"].")

	switch(state)
		if(CORE_STATE_EMPTY)
			. += span_notice("Здесь есть <b>слот</b> для платы, а каркас можно <b>переплавить</b>.")
		if(CORE_STATE_CIRCUIT)
			. += span_notice("Плату можно <b>прикрутить</b> на место или <b>вытащить</b>.")
		if(CORE_STATE_SCREWED)
			. += span_notice("Каркас можно <b>обмотать проводами</b>, а плату можно <b>открутить</b>.")
		if(CORE_STATE_CABLED)
			if(!core_mmi)
				. += span_notice("Здесь есть провода, которые можно подключить к <b>ММИ или позитронному мозгу</b>, либо <b>перерезать</b>.")
			else
				var/accept_laws = TRUE
				if(core_mmi.laws.id != DEFAULT_AI_LAWID || !core_mmi.brainmob || !core_mmi.brainmob?.mind)
					accept_laws = FALSE
				. += span_notice("Здесь есть <b>слот</b> для панели армированного стекла, [AI_CORE_BRAIN(core_mmi)] можно <b>вытащить</b>.[accept_laws ? " Модуль законов можно <b>провести</b> по ядру." : ""]")
		if(CORE_STATE_GLASSED)
			. += span_notice("Монитор [core_mmi?.brainmob?.mind && !suicide_check() ? "и нейроинтерфейс " : ""]можно <b>прикрутить</b>, а панель можно <b>вытащить</b>.")
		if(CORE_STATE_FINISHED)
			. += span_notice("Соединение монитора можно <b>перерезать</b>[core_mmi?.brainmob?.mind && !suicide_check() ? ", нейроинтерфейс можно <b>прикрутить</b>." : "."]")

/obj/structure/ai_core/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(state < CORE_STATE_FINISHED)
		return construction_item_interaction(user, tool, modifiers)

	return NONE

/// Exists to be used for callbacks.
/obj/structure/ai_core/proc/check_state(state_to_check)
	return (state == state_to_check)

/obj/structure/ai_core/latejoin_inactive
	name = "сетевое ядро ИИ"
	desc = "Это ядро ИИ подключено к NTNet через блюспейс-передатчики, что позволяет загрузить в него личность ИИ прямо во время смены."
	anchored = TRUE
	state = CORE_STATE_FINISHED
	var/available = TRUE
	var/safety_checks = TRUE
	var/active = TRUE

/obj/structure/ai_core/latejoin_inactive/Initialize(mapload, state, posibrain)
	. = ..()
	GLOB.latejoin_ai_cores += src

/obj/structure/ai_core/latejoin_inactive/Destroy()
	GLOB.latejoin_ai_cores -= src
	return ..()

/obj/structure/ai_core/latejoin_inactive/examine(mob/user)
	. = ..()
	. += "Его передатчик выглядит <b>[active? "включенным" : "выключенным"]</b>."
	. += span_notice("Вы можете [active? "отключить" : "включить"] его мультитулом.")

/obj/structure/ai_core/latejoin_inactive/proc/is_available() //If people still manage to use this feature to spawn-kill AI latejoins ahelp them.
	if(!available)
		return FALSE
	if(!safety_checks)
		return TRUE
	if(!active)
		return FALSE
	var/turf/T = get_turf(src)
	var/area/A = get_area(src)
	if(!(A.area_flags & BLOBS_ALLOWED))
		return FALSE
	if(!A.power_equip)
		return FALSE
	if(!SSmapping.level_trait(T.z,ZTRAIT_STATION))
		return FALSE
	if(!isfloorturf(T))
		return FALSE
	return TRUE

/obj/structure/ai_core/latejoin_inactive/multitool_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
		return NONE

	if(!tool.use_tool(src, user, 0 SECONDS, 0, 50))
		return ITEM_INTERACT_BLOCKING

	active = !active
	balloon_alert(user, active ? "передатчики включены" : "передатчики отключены")
	return ITEM_INTERACT_SUCCESS

/obj/structure/ai_core/proc/ai_structure_to_mob()
	var/mob/living/brain/the_brainmob = core_mmi.brainmob
	if(!the_brainmob.mind || suicide_check())
		return FALSE
	the_brainmob.mind.remove_antags_for_borging()
	if(!the_brainmob.mind.has_ever_been_ai)
		SSblackbox.record_feedback("amount", "ais_created", 1)
	var/mob/living/silicon/ai/ai_mob = null

	if(core_mmi.overrides_aicore_laws)
		ai_mob = new /mob/living/silicon/ai(loc, core_mmi.laws, the_brainmob)
		core_mmi.laws = null //MMI's law datum is being donated, so we need the MMI to let it go or the GC will eat it
	else
		ai_mob = new /mob/living/silicon/ai(loc, laws, the_brainmob)
		laws = null //we're giving the new AI this datum, so let's not delete it when we qdel(src) 5 lines from now

	var/datum/antagonist/malf_ai/malf_datum = IS_MALF_AI(ai_mob)
	if(malf_datum)
		malf_datum.add_law_zero()

	if(!isnull(the_brainmob.client))
		ai_mob.set_gender(the_brainmob.client)
	if(core_mmi.force_replace_ai_name)
		ai_mob.fully_replace_character_name(ai_mob.name, core_mmi.replacement_ai_name())
	ai_mob.posibrain_inside = core_mmi.braintype == "Android"
	deadchat_broadcast(" has been brought online at <b>[get_area_name(ai_mob, format_text = TRUE)]</b>.", span_name("[ai_mob]"), follow_target = ai_mob, message_type = DEADCHAT_ANNOUNCEMENT)
	qdel(src)
	return ai_mob

/// Quick proc to call to see if the brainmob inside of us has suicided. Returns TRUE if we have, FALSE in any other scenario.
/obj/structure/ai_core/proc/suicide_check()
	if(isnull(core_mmi) || isnull(core_mmi.brainmob))
		return FALSE
	return HAS_TRAIT(core_mmi.brainmob, TRAIT_SUICIDED)

/*
This is a good place for AI-related object verbs so I'm sticking it here.
If adding stuff to this, don't forget that an AI need to cancel_camera() whenever it physically moves to a different location.
That prevents a few funky behaviors.
*/
//The type of interaction, the player performing the operation, the AI itself, and the card object, if any.


/atom/proc/transfer_ai(interaction, mob/user, mob/living/silicon/ai/AI, obj/item/aicard/card)
	SHOULD_CALL_PARENT(TRUE)
	if(istype(card))
		if(card.flush)
			to_chat(user, span_alert("ОШИБКА: идет очистка ИИ, невозможно выполнить протокол переноса."))
			return FALSE
	return TRUE

/obj/structure/ai_core/transfer_ai(interaction, mob/user, mob/living/silicon/ai/AI, obj/item/aicard/card)
	if(state != CORE_STATE_FINISHED || !..())
		return
	if(core_mmi && core_mmi.brainmob)
		if(core_mmi.brainmob.mind)
			to_chat(user, span_warning("[src] уже содержит активный разум!"))
			return
		else if(suicide_check())
			to_chat(user, span_warning("[AI_CORE_BRAIN(core_mmi)] внутри [src] совершенно бесполезен!"))
			return
	//Transferring a carded AI to a core.
	if(interaction == AI_TRANS_FROM_CARD)
		AI.set_control_disabled(FALSE)
		AI.radio_enabled = TRUE
		AI.forceMove(loc) // to replace the terminal.
		to_chat(AI, span_notice("Вы загружены в стационарный терминал. Подключение к удаленным устройствам восстановлено."))
		to_chat(user, "[span_boldnotice("Перенос успешен")]: [AI.name] ([rand(1000,9999)].exe) установлен и успешно запущен. Локальная копия удалена.")
		card.AI = null
		AI.battery = circuit.battery
		AI.posibrain_inside = isnull(core_mmi) || core_mmi.braintype == "Android"
		qdel(src)
	else //If for some reason you use an empty card on an empty AI terminal.
		to_chat(user, span_alert("На этот терминал не загружен ИИ."))

/obj/item/circuitboard/aicore
	name = "ядро ИИ (плата ядра ИИ)" //Well, duh, but best to be consistent
	var/battery = 200 //backup battery for when the AI loses power. Copied to/from AI mobs when carding, and placed here to avoid recharge via deconning the core

/obj/item/circuitboard/aicore/Initialize(mapload)
	. = ..()
	if(mapload && HAS_TRAIT(SSstation, STATION_TRAIT_HUMAN_AI))
		return INITIALIZE_HINT_QDEL

#undef AI_CORE_BRAIN
