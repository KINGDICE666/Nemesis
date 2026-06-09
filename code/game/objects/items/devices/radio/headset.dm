// Used for translating channels to tokens on examination
GLOBAL_LIST_INIT(channel_tokens, list(
	RADIO_CHANNEL_COMMON = RADIO_KEY_COMMON,
	RADIO_CHANNEL_SCIENCE = RADIO_TOKEN_SCIENCE,
	RADIO_CHANNEL_COMMAND = RADIO_TOKEN_COMMAND,
	RADIO_CHANNEL_MEDICAL = RADIO_TOKEN_MEDICAL,
	RADIO_CHANNEL_ENGINEERING = RADIO_TOKEN_ENGINEERING,
	RADIO_CHANNEL_SECURITY = RADIO_TOKEN_SECURITY,
	RADIO_CHANNEL_CENTCOM = RADIO_TOKEN_CENTCOM,
	RADIO_CHANNEL_SYNDICATE = RADIO_TOKEN_SYNDICATE,
	RADIO_CHANNEL_SUPPLY = RADIO_TOKEN_SUPPLY,
	RADIO_CHANNEL_SERVICE = RADIO_TOKEN_SERVICE,
	MODE_BINARY = MODE_TOKEN_BINARY,
	RADIO_CHANNEL_AI_PRIVATE = RADIO_TOKEN_AI_PRIVATE,
	RADIO_CHANNEL_ENTERTAINMENT = RADIO_TOKEN_ENTERTAINMENT,
))

/proc/ru_radio_channel_name(channel_name)
	switch(channel_name)
		if(RADIO_CHANNEL_COMMON)
			return "общий канал"
		if(RADIO_CHANNEL_SCIENCE)
			return "научный канал"
		if(RADIO_CHANNEL_COMMAND)
			return "командный канал"
		if(RADIO_CHANNEL_MEDICAL)
			return "медицинский канал"
		if(RADIO_CHANNEL_ENGINEERING)
			return "инженерный канал"
		if(RADIO_CHANNEL_SECURITY)
			return "канал службы безопасности"
		if(RADIO_CHANNEL_CENTCOM)
			return "канал ЦК"
		if(RADIO_CHANNEL_SYNDICATE)
			return "канал Синдиката"
		if(RADIO_CHANNEL_SUPPLY)
			return "канал снабжения"
		if(RADIO_CHANNEL_SERVICE)
			return "сервисный канал"
		if(RADIO_CHANNEL_AI_PRIVATE)
			return "приватный канал ИИ"
		if(RADIO_CHANNEL_ENTERTAINMENT)
			return "развлекательный канал"
		if(MODE_BINARY)
			return "бинарный канал"
	return channel_name

/obj/item/radio/headset
	name = "радиогарнитура"
	desc = "Обновлённый модульный интерком, надеваемый на голову. Принимает ключи шифрования."
	icon = 'icons/obj/clothing/headsets.dmi'
	icon_state = "headset"
	inhand_icon_state = "headset"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	worn_icon_state = "headset"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT * 0.75)
	subspace_transmission = TRUE
	canhear_range = 0 // can't hear headsets from very far away
	interaction_flags_mouse_drop = FORBID_TELEKINESIS_REACH
	slot_flags = ITEM_SLOT_EARS
	dog_fashion = null
	equip_sound = SFX_HEADSET_EQUIP
	pickup_sound = SFX_HEADSET_PICKUP
	drop_sound = 'sound/items/handling/headset/headset_drop1.ogg'
	sound_vary = TRUE
	var/obj/item/encryptionkey/keyslot2 = null

	// headset is too small to display overlays
	overlay_speaker_idle = null
	overlay_speaker_active = null
	overlay_mic_idle = null
	overlay_mic_active = null

/obj/item/radio/headset/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] начинает засовывать антенну [src] себе в нос! Похоже, это попытка самоубийства!"))
	return TOXLOSS

/obj/item/radio/headset/examine(mob/user)
	. = ..()

	if(!(item_flags & IN_INVENTORY) || loc != user)
		. += span_notice("На гарнитуре мигает маленький экран. Он слишком мал, чтобы прочитать его, не держа или не надев гарнитуру.")
		return

	// construction of frequency description
	var/list/available_channels = list()
	available_channels += "<li><b>[span_radio(RADIO_KEY_COMMON)]</b> для текущей настроенной частоты</li>"
	if(special_channels & RADIO_SPECIAL_BINARY)
		available_channels += "<li><b>[span_binarysay(MODE_TOKEN_BINARY)] для [span_binarysay(ru_radio_channel_name(MODE_BINARY))]</b></li>"

	for(var/i in 1 to length(channels))
		var/channel_name = channels[i]
		var/channel_token = GLOB.channel_tokens[channel_name]
		var/channel_span_class = get_radio_span(GLOB.default_radio_channels[channel_name])
		var/display_channel_name = ru_radio_channel_name(channel_name)

		if(i == 1)
			available_channels += "<li><b>[span_class(channel_span_class, MODE_TOKEN_DEPARTMENT)]</b> или <b>[span_class(channel_span_class, channel_token)]</b> для <b>[span_class(channel_span_class, display_channel_name)]</b></li>"
		else
			available_channels += "<li><b>[span_class(channel_span_class, channel_token)]</b> для <b>[span_class(channel_span_class, display_channel_name)]</b></li>"

	. += span_notice("Маленький экран гарнитуры показывает доступные частоты:")
	. += span_notice("<ul style='display:inline-block; margin: 0; list-style: square;'>[available_channels.Join()]</ul>")

	if(command)
		. += span_info("<b>Alt-click</b> переключает громкий режим.")

/obj/item/radio/headset/Initialize(mapload)
	. = ..()
	if(ispath(keyslot2))
		keyslot2 = new keyslot2()
	set_listening(TRUE)
	set_broadcasting(TRUE)
	recalculateChannels()
	possibly_deactivate_in_loc()

/obj/item/radio/headset/proc/possibly_deactivate_in_loc()
	if(ismob(loc))
		set_listening(should_be_listening)
	else
		set_listening(FALSE, actual_setting = FALSE)

/obj/item/radio/headset/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	possibly_deactivate_in_loc()

/obj/item/radio/headset/Destroy()
	if(istype(keyslot2))
		QDEL_NULL(keyslot2)
	return ..()

/obj/item/radio/headset/ui_data(mob/user)
	. = ..()
	.["headset"] = TRUE

/obj/item/radio/headset/mouse_drop_dragged(atom/over, mob/user, src_location, over_location, params)
	if(user == over)
		return attack_self(user)

/// Grants all the languages this headset allows the mob to understand via installed chips.
/obj/item/radio/headset/proc/grant_headset_languages(mob/grant_to)
	var/list/language_list = keyslot?.language_data?.Copy()

	if(keyslot2)
		if(length(language_list))
			for(var/language in keyslot2.language_data)
				if(language_list[language] < keyslot2.language_data[language])
					language_list[language] = keyslot2.language_data[language]
					continue
				language_list[language] = keyslot2.language_data[language]

		else
			language_list = keyslot2.language_data?.Copy()

	for(var/language in language_list)
		var/amount_understood = language_list[language]
		if(amount_understood >= 100)
			grant_to.grant_language(language, language_flags = UNDERSTOOD_LANGUAGE, source = LANGUAGE_RADIOKEY)
		else
			grant_to.grant_partial_language(language, amount = amount_understood, source = LANGUAGE_RADIOKEY)

/// Clears all radio related languages from the mob.
/obj/item/radio/headset/proc/remove_headset_languages(mob/remove_from)
	if(QDELETED(remove_from)) //This can be called as a part of destroy
		return
	remove_from.remove_all_languages(source = LANGUAGE_RADIOKEY)
	remove_from.remove_all_partial_languages(source = LANGUAGE_RADIOKEY)

/obj/item/radio/headset/equipped(mob/user, slot, initial)
	. = ..()
	if(!(slot_flags & slot))
		return

	grant_headset_languages(user)

/obj/item/radio/headset/dropped(mob/user, silent)
	. = ..()
	remove_headset_languages(user)

// Headsets do not become hearing sensitive as broadcasting instead controls their talk_into capabilities
/obj/item/radio/headset/set_broadcasting(new_broadcasting, actual_setting = TRUE)
	broadcasting = new_broadcasting
	if(actual_setting)
		should_be_broadcasting = broadcasting

	if (perform_update_icon && !isnull(overlay_mic_idle))
		update_icon()
	else if (!perform_update_icon)
		should_update_icon = TRUE

/obj/item/radio/headset/talk_into_impl(atom/movable/talking_movable, message, channel, list/spans, datum/language/language, list/message_mods)
	if (!broadcasting)
		return
	return ..()

/obj/item/radio/headset/syndicate //disguised to look like a normal headset for stealth ops

/obj/item/radio/headset/syndicate/Initialize(mapload)
	. = ..()
	make_syndie()

/obj/item/radio/headset/syndicate/alt //undisguised bowman with flash protection
	name = "гарнитура Синдиката"
	desc = "Гарнитура Синдиката, позволяющая слышать все радиочастоты. Защищает уши от светошумовых гранат."
	icon_state = "syndie_headset"
	worn_icon_state = "syndie_headset"

/obj/item/radio/headset/syndicate/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/syndicate/alt/leader
	name = "гарнитура лидера команды"
	command = TRUE

/obj/item/radio/headset/binary
	keyslot = /obj/item/encryptionkey/binary

/obj/item/radio/headset/headset_sec
	name = "радиогарнитура службы безопасности"
	desc = "Используется элитными силами службы безопасности."
	icon_state = "sec_headset"
	worn_icon_state = "sec_headset"
	keyslot = /obj/item/encryptionkey/headset_sec

/obj/item/radio/headset/headset_sec/alt
	name = "защитная гарнитура службы безопасности"
	desc = "Используется элитными силами службы безопасности. Защищает уши от светошумовых гранат."
	icon_state = "sec_headset_alt"
	worn_icon_state = "sec_headset_alt"

/obj/item/radio/headset/headset_sec/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/headset_eng
	name = "инженерная радиогарнитура"
	desc = "Гарнитура для связи инженерного отдела."
	icon_state = "eng_headset"
	worn_icon_state = "eng_headset"
	keyslot = /obj/item/encryptionkey/headset_eng

/obj/item/radio/headset/headset_rob
	name = "радиогарнитура робототехников"
	desc = "Создана специально для робототехников, которые никак не выберут между отделами."
	icon_state = "rob_headset"
	worn_icon_state = "rob_headset"
	keyslot = /obj/item/encryptionkey/headset_rob

/obj/item/radio/headset/headset_med
	name = "медицинская радиогарнитура"
	desc = "Гарнитура для обученного персонала медбея."
	icon_state = "med_headset"
	worn_icon_state = "med_headset"
	keyslot = /obj/item/encryptionkey/headset_med

/obj/item/radio/headset/headset_sci
	name = "научная радиогарнитура"
	desc = "Научная гарнитура. Как обычно."
	icon_state = "sci_headset"
	worn_icon_state = "sci_headset"
	keyslot = /obj/item/encryptionkey/headset_sci

/obj/item/radio/headset/headset_medsci
	name = "медико-научная радиогарнитура"
	desc = "Гарнитура, объединяющая медицинский и научный каналы."
	icon_state = "medsci_headset"
	worn_icon_state = "medsci_headset"
	keyslot = /obj/item/encryptionkey/headset_medsci

/obj/item/radio/headset/headset_srvsec
	name = "гарнитура закона и порядка"
	desc = "Гарнитура объединяет две разные, но одинаково важные группы: службу безопасности, расследующую преступления, и сервис, предоставляющий услуги. Это их связь."
	icon_state = "srvsec_headset"
	worn_icon_state = "srvsec_headset"
	keyslot = /obj/item/encryptionkey/headset_srvsec

/obj/item/radio/headset/headset_srvmed
	name = "сервисно-медицинская гарнитура"
	desc = "Гарнитура для связи с медбеем и сервисным отделом."
	icon_state = "srv_headset"
	worn_icon_state = "srv_headset"
	keyslot = /obj/item/encryptionkey/headset_srvmed

/obj/item/radio/headset/headset_srvent
	name = "гарнитура прессы"
	desc = "Гарнитура для связи с сервисом и вещания в развлекательный канал."
	icon_state = "srvent_headset"
	worn_icon_state = "srv_headset"
	keyslot = /obj/item/encryptionkey/headset_srvent

/obj/item/radio/headset/headset_com
	name = "командная радиогарнитура"
	desc = "Гарнитура с командным каналом."
	icon_state = "com_headset"
	worn_icon_state = "com_headset"
	keyslot = /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/heads
	command = TRUE
	icon_state = "com_headset"
	worn_icon_state = "com_headset"

/obj/item/radio/headset/heads/captain
	name = "\proper гарнитура капитана"
	desc = "Гарнитура главного на станции."
	keyslot = /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/captain/alt
	name = "\proper защитная гарнитура капитана"
	desc = "Гарнитура начальника. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"
	worn_icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/captain/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/heads/rd
	name = "\proper гарнитура научного руководителя"
	desc = "Гарнитура человека, ведущего общество к технологической сингулярности."
	keyslot = /obj/item/encryptionkey/heads/rd

/obj/item/radio/headset/heads/hos
	name = "\proper гарнитура главы службы безопасности"
	desc = "Гарнитура ответственного за порядок и защиту станции."
	keyslot = /obj/item/encryptionkey/heads/hos

/obj/item/radio/headset/heads/hos/advisor
	name = "\proper гарнитура ветерана-советника службы безопасности"
	desc = "Гарнитура человека, который когда-то отвечал за порядок и защиту станции..."
	keyslot = /obj/item/encryptionkey/heads/hos
	command = FALSE

/obj/item/radio/headset/heads/hos/alt
	name = "\proper защитная гарнитура главы службы безопасности"
	desc = "Гарнитура ответственного за порядок и защиту станции. Защищает уши от светошумовых гранат."
	icon_state = "com_headset_alt"
	worn_icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/hos/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/heads/ce
	name = "\proper гарнитура старшего инженера"
	desc = "Гарнитура ответственного за питание и целостность станции."
	keyslot = /obj/item/encryptionkey/heads/ce

/obj/item/radio/headset/heads/cmo
	name = "\proper гарнитура главного врача"
	desc = "Гарнитура высококвалифицированного главы медбея."
	keyslot = /obj/item/encryptionkey/heads/cmo

/obj/item/radio/headset/heads/hop
	name = "\proper гарнитура главы персонала"
	desc = "Гарнитура того, кто однажды может стать капитаном."
	keyslot = /obj/item/encryptionkey/heads/hop

/obj/item/radio/headset/heads/qm
	name = "\proper гарнитура квартирмейстера"
	desc = "Гарнитура руководителя отдела снабжения."
	keyslot = /obj/item/encryptionkey/heads/qm

/obj/item/radio/headset/headset_cargo
	name = "радиогарнитура снабжения"
	desc = "Гарнитура отдела снабжения."
	icon_state = "cargo_headset"
	worn_icon_state = "cargo_headset"
	keyslot = /obj/item/encryptionkey/headset_cargo

/obj/item/radio/headset/headset_cargo/mining
	name = "шахтёрская радиогарнитура"
	desc = "Гарнитура шахтёров. Имеет аплинк шахтёрской сети для быстрой передачи команд товарищам и усиливает голос в средах с низким давлением."
	icon_state = "mine_headset"
	worn_icon_state = "mine_headset"
	// "puts the antenna down" while the headset is off
	overlay_speaker_idle = "headset_up"
	overlay_mic_idle = "headset_up"
	keyslot = /obj/item/encryptionkey/headset_mining

/obj/item/radio/headset/headset_cargo/mining/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/callouts, ITEM_SLOT_EARS, examine_text = span_info("Ctrl-click включает или отключает выкрики."))

/obj/item/radio/headset/headset_cargo/mining/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot & ITEM_SLOT_EARS)
		ADD_TRAIT(user, TRAIT_SPEECH_BOOSTER, CLOTHING_TRAIT)

/obj/item/radio/headset/headset_cargo/mining/dropped(mob/living/carbon/human/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_SPEECH_BOOSTER, CLOTHING_TRAIT)

/obj/item/radio/headset/headset_srv
	name = "сервисная радиогарнитура"
	desc = "Гарнитура персонала сервиса, отвечающего за сытость, довольство и чистоту станции."
	icon_state = "srv_headset"
	worn_icon_state = "srv_headset"
	keyslot = /obj/item/encryptionkey/headset_service

/obj/item/radio/headset/headset_cent
	name = "\improper гарнитура ЦК"
	desc = "Гарнитура высших эшелонов Nanotrasen."
	icon_state = "cent_headset"
	worn_icon_state = "cent_headset"
	keyslot = /obj/item/encryptionkey/headset_cent
	keyslot2 = /obj/item/encryptionkey/headset_com

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot2 = /obj/item/encryptionkey/heads/captain
	command = TRUE

/obj/item/radio/headset/headset_cent/alt
	name = "\improper защитная гарнитура ЦК"
	desc = "Гарнитура специально для персонала экстренного реагирования. Защищает уши от светошумовых гранат."
	icon_state = "cent_headset_alt"
	worn_icon_state = "cent_headset_alt"
	keyslot2 = null

/obj/item/radio/headset/headset_cent/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/headset_cent/alt/leader
	command = TRUE

/obj/item/radio/headset/silicon/pai
	name = "\proper миниатюрный встроенный субпространственный трансивер"
	subspace_transmission = FALSE

/obj/item/radio/headset/silicon/ai
	name = "\proper встроенный субпространственный трансивер"
	keyslot2 = new /obj/item/encryptionkey/ai
	command = TRUE

/obj/item/radio/headset/silicon/human_ai
	name = "\proper отключённый субпространственный трансивер"
	desc = "Говорят, однажды такую гарнитуру будут вживлять прямо в мозг в банке."
	icon_state = "rob_headset"
	worn_icon_state = "rob_headset"
	keyslot2 = new /obj/item/encryptionkey/ai_with_binary
	command = TRUE

/obj/item/radio/headset/silicon/human_ai/equipped(mob/user, slot, initial)
	. = ..()
	ADD_TRAIT(user, TRAIT_LOUD_BINARY, REF(src))

/obj/item/radio/headset/silicon/human_ai/dropped(mob/user, slot, initial)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_LOUD_BINARY, REF(src))

/obj/item/radio/headset/silicon/ai/evil
	name = "\proper злой встроенный субпространственный трансивер"
	keyslot2 = new /obj/item/encryptionkey/ai/evil
	command = FALSE

/obj/item/radio/headset/silicon/ai/evil/Initialize(mapload)
	. = ..()
	make_syndie()

/obj/item/radio/headset/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == keyslot2)
		keyslot2 = null
		if(!QDELING(src))
			recalculateChannels()

/obj/item/radio/headset/remove_keys(mob/living/user)
	. = ..()
	if(!keyslot2)
		return

	. += keyslot2
	user.put_in_hands(keyslot2) // null via Exited

/obj/item/radio/headset/install_key(mob/living/user, obj/item/encryptionkey/key)
	if(!keyslot)
		return ..()

	if(keyslot2)
		loc.balloon_alert(user, "третий ключ не помещается!")
		return ITEM_INTERACT_BLOCKING

	if(!user.transferItemToLoc(key, src))
		loc.balloon_alert(user, "не установить!")
		return ITEM_INTERACT_BLOCKING

	keyslot2 = key
	recalculateChannels()
	playsound(src, 'sound/machines/click.ogg', 50, TRUE)
	loc.balloon_alert(user, "ключ шифрования установлен")
	return ITEM_INTERACT_SUCCESS

/obj/item/radio/headset/recalculateChannels()
	. = ..()
	if(keyslot2)
		for(var/channel_name in keyslot2.channels)
			if(!(channel_name in channels))
				channels[channel_name] = keyslot2.channels[channel_name]

		special_channels |= keyslot2.special_channels

		for(var/ch_name in channels)
			LAZYSET(secure_radio_connections, ch_name, add_radio(src, GLOB.default_radio_channels[ch_name]))

	// Updates radio languages entirely for the mob wearing the headset
	var/mob/mob_loc = loc
	if(istype(mob_loc) && mob_loc.get_item_by_slot(slot_flags) == src)
		remove_headset_languages(mob_loc)
		grant_headset_languages(mob_loc)

/obj/item/radio/headset/click_alt(mob/living/user)
	if(!istype(user) || !command)
		return CLICK_ACTION_BLOCKING
	use_command = !use_command
	to_chat(user, span_notice("Вы [use_command ? "включаете" : "выключаете"] громкий режим."))
	return CLICK_ACTION_SUCCESS
