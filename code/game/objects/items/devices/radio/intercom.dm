/obj/item/radio/intercom
	name = "станционный интерком"
	desc = "Надёжный станционный интерком, готовый вступить в дело даже когда гарнитуры молчат."
	icon = 'icons/obj/machines/wallmounts.dmi'
	icon_state = "intercom"
	anchored = TRUE
	w_class = WEIGHT_CLASS_BULKY
	canhear_range = 2
	dog_fashion = null
	unscrewed = FALSE
	item_flags = NO_BLOOD_ON_ITEM

	overlay_speaker_idle = "intercom_s"
	overlay_speaker_active = "intercom_receive"

	overlay_mic_idle = "intercom_m"
	overlay_mic_active = null

	///The icon of intercom while its turned off
	var/icon_off = "intercom-p"

/obj/item/radio/intercom/unscrewed
	unscrewed = TRUE

/obj/item/radio/intercom/prison
	name = "интерком только для приёма"
	desc = "Станционный интерком. Похоже, его модифицировали так, чтобы он не передавал речь."
	icon_state = "intercom_prison"
	icon_off = "intercom_prison-p"

/obj/item/radio/intercom/prison/Initialize(mapload)
	. = ..()
	wires?.cut(WIRE_TX)

/obj/item/radio/intercom/Initialize(mapload)
	. = ..()
	var/area/current_area = get_area(src)
	if(!current_area)
		return
	RegisterSignal(current_area, COMSIG_AREA_POWER_CHANGE, PROC_REF(AreaPowerCheck))
	if(mapload)
		find_and_mount_on_atom()
	GLOB.intercoms_list += src

/obj/item/radio/intercom/Destroy()
	GLOB.intercoms_list -= src
	return ..()

/obj/item/radio/intercom/examine(mob/user)
	. = ..()
	. += span_notice("Используйте [MODE_TOKEN_INTERCOM] рядом с ним, чтобы говорить через интерком.")
	if(!unscrewed)
		. += span_notice("Он <b>прикручен</b> и закреплён на стене.")
	else
		. += span_notice("Он <i>откручен</i> от стены, его можно <b>снять</b>.")

	if(anonymize)
		. += span_notice("Речь через этот интерком будет анонимизирована.")

	if(freqlock == RADIO_FREQENCY_UNLOCKED)
		if((obj_flags & EMAGGED) && initial(freqlock) == RADIO_FREQENCY_EMAGGABLE_LOCK)
			. += span_warning("Блокировка частоты замкнута...")
	else
		. += span_notice("Блокировка частоты установлена на [frequency/10].")

	if(keylock == RADIO_KEYSLOT_UNLOCKED)
		if((obj_flags & EMAGGED) && initial(keylock) == RADIO_KEYSLOT_EMAGGABLE_LOCK)
			. += span_warning("Защитные винты слота ключа сорваны...")
	else
		. += span_notice("Винты в слоте ключа [keylock == RADIO_KEYSLOT_LOCKED ? "сорваны" : "затянуты намертво"], \
			что не даёт снять ключ шифрования[keylock == RADIO_KEYSLOT_LOCKED ? "" : " без какого-нибудь магнита"].")

/obj/item/radio/intercom/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()
	if(held_item?.tool_behaviour == TOOL_SCREWDRIVER)
		context[SCREENTIP_CONTEXT_RMB] = unscrewed ? "Закрепить на стене" : "Открутить от стены"
		context[SCREENTIP_CONTEXT_LMB] = isnull(keyslot) ? context[SCREENTIP_CONTEXT_RMB] : "Снять ключ шифрования" // sometimes same behavior
		. = CONTEXTUAL_SCREENTIP_SET

	if(held_item?.tool_behaviour == TOOL_WRENCH && unscrewed)
		context[SCREENTIP_CONTEXT_RMB] = "Снять со стены"
		context[SCREENTIP_CONTEXT_LMB] = context[SCREENTIP_CONTEXT_LMB] // same behavior
		. = CONTEXTUAL_SCREENTIP_SET

/obj/item/radio/intercom/screwdriver_act_secondary(mob/living/user, obj/item/tool)
	if(unscrewed)
		user.visible_message(span_notice("[user] начинает закручивать винты [src]..."), span_notice("Вы начинаете прикручивать [src]..."))
		if(tool.use_tool(src, user, 30, volume=50))
			user.visible_message(span_notice("[user] закручивает винты [src]!"), span_notice("Вы закручиваете винты [src]."))
			unscrewed = FALSE
			update_appearance(UPDATE_OVERLAYS)
	else
		user.visible_message(span_notice("[user] начинает откручивать винты [src]..."), span_notice("Вы начинаете откручивать [src]..."))
		if(tool.use_tool(src, user, 40, volume=50))
			user.visible_message(span_notice("[user] ослабляет винты [src]!"), span_notice("Вы откручиваете [src], ослабляя крепление к стене."))
			unscrewed = TRUE
			update_appearance(UPDATE_OVERLAYS)
	return ITEM_INTERACT_SUCCESS

/obj/item/radio/intercom/screwdriver_act(mob/living/user, obj/item/tool)
	if(isnull(keyslot))
		return screwdriver_act_secondary(user, tool)
	return ..()

/obj/item/radio/intercom/wrench_act(mob/living/user, obj/item/tool)
	if(!unscrewed)
		to_chat(user, span_warning("Сначала нужно открутить [src] от стены!"))
		return ITEM_INTERACT_BLOCKING
	user.visible_message(span_notice("[user] начинает снимать [src] с креплений..."), span_notice("Вы начинаете снимать [src] с креплений..."))
	tool.play_tool_sound(src)
	if(tool.use_tool(src, user, 80))
		user.visible_message(span_notice("[user] снимает [src] с креплений!"), span_notice("Вы снимаете [src] со стены."))
		playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
		deconstruct(TRUE)
	return ITEM_INTERACT_SUCCESS

/obj/item/radio/intercom/wrench_act_secondary(mob/living/user, obj/item/tool)
	return wrench_act(user, tool)

/**
 * Override attack_tk_grab instead of attack_tk because we actually want attack_tk's
 * functionality. What we DON'T want is attack_tk_grab attempting to pick up the
 * intercom as if it was an ordinary item.
 */
/obj/item/radio/intercom/attack_tk_grab(mob/user)
	interact(user)
	return COMPONENT_CANCEL_ATTACK_CHAIN


/obj/item/radio/intercom/attack_ai(mob/user)
	interact(user)

/obj/item/radio/intercom/attack_robot(mob/user)
	interact(user)

/obj/item/radio/intercom/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	interact(user)

/obj/item/radio/intercom/ui_state(mob/user)
	return GLOB.default_state

/obj/item/radio/intercom/can_receive(freq, list/levels)
	if(levels != RADIO_NO_Z_LEVEL_RESTRICTION)
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in levels))
			return FALSE

	if(freq == FREQ_SYNDICATE)
		if(!(special_channels &= RADIO_SPECIAL_SYNDIE))
			return FALSE//Prevents broadcast of messages over devices lacking the encryption

	return TRUE

/obj/item/radio/intercom/Hear(atom/movable/speaker, message_langs, raw_message, radio_freq, radio_freq_name, radio_freq_color, list/spans, list/message_mods = list(), message_range)
	if(message_mods[RADIO_EXTENSION] == MODE_INTERCOM)
		return  // Avoid hearing the same thing twice
	return ..()

/obj/item/radio/intercom/emp_act(severity)
	. = ..() // Parent call here will set `on` to FALSE.
	update_appearance()

/obj/item/radio/intercom/end_emp_effect(curremp)
	. = ..()
	AreaPowerCheck() // Make sure the area/local APC is powered first before we actually turn back on.

/obj/item/radio/intercom/emag_act(mob/user, obj/item/card/emag/emag_card)
	. = ..()

	if(obj_flags & EMAGGED)
		return .

	if(!freqlock && !keylock)
		balloon_alert(user, "нечего взламывать!")
		return .

	var/message = ""
	if(freqlock == RADIO_FREQENCY_EMAGGABLE_LOCK && keylock == RADIO_KEYSLOT_EMAGGABLE_LOCK)
		message = "блокировка частоты и ключа"
	else if(freqlock == RADIO_FREQENCY_EMAGGABLE_LOCK)
		message = "блокировка частоты"
	else if(keylock == RADIO_KEYSLOT_EMAGGABLE_LOCK)
		message = "блокировка ключа"

	if(!message)
		balloon_alert(user, "не взломать зам[(freqlock && keylock) ? "ки" : "ок"]!")
		playsound(src, 'sound/machines/buzz/buzz-two.ogg', 50, FALSE, SILENCED_SOUND_EXTRARANGE)
		return .

	balloon_alert(user, "[message] сломан")
	playsound(src, SFX_SPARKS, 75, TRUE, SILENCED_SOUND_EXTRARANGE)
	if(freqlock == RADIO_FREQENCY_EMAGGABLE_LOCK)
		freqlock = RADIO_FREQENCY_UNLOCKED
	if(keylock == RADIO_KEYSLOT_EMAGGABLE_LOCK)
		keylock = RADIO_KEYSLOT_UNLOCKED
	obj_flags |= EMAGGED
	return TRUE

/obj/item/radio/intercom/update_icon_state()
	icon_state = on ? initial(icon_state) : icon_off
	return ..()

/**
 * Proc called whenever the intercom's area loses or gains power. Responsible for setting the `on` variable and calling `update_icon()`.
 *
 * Normally called after the intercom's area receives the `COMSIG_AREA_POWER_CHANGE` signal, but it can also be called directly.
 * Arguments:
 * * source - the area that just had a power change.
 */
/obj/item/radio/intercom/proc/AreaPowerCheck(datum/source)
	SIGNAL_HANDLER
	var/area/current_area = get_area(src)
	if(!current_area)
		set_on(FALSE)
	else
		set_on(current_area.powered(AREA_USAGE_EQUIP)) // set "on" to the equipment power status of our area.
	update_appearance()

/**
 * Called by the wall mount component and reused during the tool deconstruction proc.
 */
/obj/item/radio/intercom/atom_deconstruct(disassembled)
	new/obj/item/wallframe/intercom(get_turf(src))

//Created through the autolathe or through deconstructing intercoms. Can be applied to wall to make a new intercom on it!
/obj/item/wallframe/intercom
	name = "рама интеркома"
	desc = "Готовый к установке интерком. Просто приложите к стене и прикрутите!"
	icon = 'icons/obj/machines/wallmounts.dmi'
	icon_state = "intercom"
	result_path = /obj/item/radio/intercom/unscrewed
	pixel_shift = 26
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2)

// Used in the confessional booth in the chapel, locked to the confessional frequency and hides voices
/obj/item/radio/intercom/chapel
	name = "исповедальный интерком"
	desc = "Говорите через него... чтобы исповедаться во множестве грехов. Скрывает голос, сохраняя тайну."
	anonymize = TRUE
	freqlock = RADIO_FREQENCY_EMAGGABLE_LOCK

/obj/item/radio/intercom/chapel/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_CONFESSIONAL)
	set_broadcasting(TRUE)

// Special type of intercom for use in the bridge that can tune into any frequency and has loudmic (NOT FOR PUBLIC AREAS)
/obj/item/radio/intercom/command
	name = "командный интерком"
	desc = "Специальный широкополосный интерком командования. Универсальный инструмент, который можно настроить на любую частоту и получить доступ к каналам, где вам быть не положено. Оснащён встроенным усилителем голоса для кристально чистой связи."
	icon_state = "intercom_command"
	freerange = TRUE
	command = TRUE
	icon_off = "intercom_command-p"

// Set of intercoms for use in interrogation. Interior one starts broadcasting, exterior one hides voices.
/obj/item/radio/intercom/interrogation
	name = "интерком допросной"
	abstract_type = /obj/item/radio/intercom/interrogation
	freqlock = RADIO_FREQENCY_LOCKED

/obj/item/radio/intercom/interrogation/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_INTERROGATION)

/obj/item/radio/intercom/interrogation/inside
	desc = "Интерком, транслирующий текущий допрос тому, кто, вероятно, ведёт записи."

/obj/item/radio/intercom/interrogation/inside/Initialize(mapload)
	. = ..()
	set_broadcasting(TRUE)
	set_listening(FALSE)

/obj/item/radio/intercom/interrogation/outside
	desc = "Интерком для связи с допросной, искажающий голоса ради \"конфиденциальности\"."
	anonymize = TRUE

// Subtype that simply has freerange enabled
/obj/item/radio/intercom/freerange
	name = "широкополосный интерком"
	desc = "Специальный интерком, который можно настроить на любую частоту в обход шифрования."
	freerange = TRUE

// For use in the AI core to allow the AI to tune into any encrypted frequency if comms are down
/obj/item/radio/intercom/freerange/ai_core
	name = "\improper широкополосный интерком ИИ"

/obj/item/radio/intercom/freerange/ai_core/Initialize(mapload)
	. = ..()
	set_listening(FALSE)

// Intercom with loudmic and innate syndicate channel access
/obj/item/radio/intercom/syndicate
	name = "интерком Синдиката"
	desc = "Говорите через него всё, что нужно."
	command = TRUE
	special_channels = RADIO_SPECIAL_SYNDIE

// Syndicate intercom that also has freefrange on top of syndicate channel
/obj/item/radio/intercom/syndicate/freerange
	name = "широкополосный интерком Синдиката"
	desc = "Интерком Синдиката на заказ, используемый для передачи на всех частотах Nanotrasen. Особенно дорогой."
	freerange = TRUE

/obj/item/radio/intercom/mi13
	name = "интерком"
	desc = "Говорите через него, чтобы связаться с теми, кто находится с вами в этом объекте."
	freerange = TRUE

/obj/item/radio/intercom/ai_private
	name = "\improper приватный интерком ИИ"
	desc = "Интерком, в основном используемый для прямой приватной линии к станционному ИИ."

/obj/item/radio/intercom/ai_private/Initialize(mapload)
	. = ..()
	set_frequency(FREQ_AI_PRIVATE)

// For use in AI uploads: Tuned to AI private, actively broadcasting and relaying
/obj/item/radio/intercom/ai_private/broadcasting

/obj/item/radio/intercom/ai_private/broadcasting/Initialize(mapload)
	. = ..()
	set_broadcasting(TRUE)

// For use in AI chambers: Tuned to AI private, free-range allowed, otherwise doesn't broadcast or relay
/obj/item/radio/intercom/ai_private/freerange
	desc = parent_type::desc + " Этот можно настроить на любую частоту в обход шифрования."
	freerange = TRUE

/obj/item/radio/intercom/ai_private/freerange/Initialize(mapload)
	. = ..()
	set_listening(FALSE)

// For use in AI antechambers: Tuned to AI private, actively broadcasting, but not relaying
/obj/item/radio/intercom/ai_private/quiet

/obj/item/radio/intercom/ai_private/quiet/Initialize(mapload)
	. = ..()
	set_listening(FALSE)

// Subtype that spawns with an encryption key and has a key lock
/obj/item/radio/intercom/departmental
	desc = "Станционный интерком, предназначенный в первую очередь для связи с сотрудниками отдела."
	keylock = RADIO_KEYSLOT_EMAGGABLE_LOCK
	abstract_type = /obj/item/radio/intercom/departmental

/obj/item/radio/intercom/departmental/Initialize(mapload)
	. = ..()
	if(length(keyslot?.channels) >= 1)
		set_frequency(GLOB.default_radio_channels[keyslot.channels[1]])

/obj/item/radio/intercom/departmental/cargo
	name = "интерком снабжения"
	keyslot = /obj/item/encryptionkey/headset_cargo

/obj/item/radio/intercom/departmental/command
	name = "командный интерком"
	keyslot = /obj/item/encryptionkey/headset_com

/obj/item/radio/intercom/departmental/engineering
	name = "инженерный интерком"
	keyslot = /obj/item/encryptionkey/headset_eng

/obj/item/radio/intercom/departmental/medical
	name = "медицинский интерком"
	keyslot = /obj/item/encryptionkey/headset_med

/obj/item/radio/intercom/departmental/science
	name = "научный интерком"
	keyslot = /obj/item/encryptionkey/headset_sci

/obj/item/radio/intercom/departmental/security
	name = "интерком службы безопасности"
	keyslot = /obj/item/encryptionkey/headset_sec

/obj/item/radio/intercom/departmental/service
	name = "сервисный интерком"
	keyslot = /obj/item/encryptionkey/headset_service

#define INTERCOM_OFFSET 27

MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/prison, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/chapel, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/ai_private, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/ai_private/broadcasting, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/ai_private/freerange, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/ai_private/quiet, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/command, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/interrogation/inside, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/interrogation/outside, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/freerange, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/freerange/ai_core, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/syndicate, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/syndicate/freerange, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/mi13, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/cargo, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/command, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/engineering, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/medical, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/science, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/security, INTERCOM_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/departmental/service, INTERCOM_OFFSET)

#undef INTERCOM_OFFSET
