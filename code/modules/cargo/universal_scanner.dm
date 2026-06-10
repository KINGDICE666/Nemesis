#define PAPER_PER_SHEET 10

/obj/item/universal_scanner
	name = "универсальный сканер"
	desc = "Устройство для проверки предметов по базе экспорта Nanotrasen, назначения ценников и подготовки товаров для пользовательских торговых автоматов."
	icon = 'icons/obj/devices/scanner.dmi'
	icon_state = "export scanner"
	worn_icon_state = "electronic"
	inhand_icon_state = "export_scanner"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_SMALL
	/// Which mode is the scanner currently on?
	var/scanning_mode = SCAN_EXPORTS
	/// A list of all available export scanner modes.
	var/list/scale_mode = list()
	/// The paper currently stored by the export scanner.
	var/paper_count = 10
	/// The maximum paper to be stored by the export scanner.
	var/max_paper_count = 20

	/// The price of the item used by price tagger mode.
	var/new_custom_price = 1

	/// The account which is receiving the split profits in sales tagger mode.
	var/datum/bank_account/payments_acc = null
	/// The person who tagged this will receive the sale value multiplied by this number in sales tagger mode.
	var/cut_multiplier = 0.5
	/// Maximum value for cut_multiplier in sales tagger mode.
	var/cut_max = 0.5
	/// Minimum value for cut_multiplier in sales tagger mode.
	var/cut_min = 0.01

/obj/item/universal_scanner/Initialize(mapload)
	. = ..()
	scale_mode = sort_list(list(
		"сканер экспорта" = image(icon = src.icon, icon_state = "export scanner"),
		"ценникатор" = image(icon = src.icon, icon_state = "price tagger"),
		"продажный маркиратор" = image(icon = src.icon, icon_state = "sales tagger"),
))
	register_context()

/obj/item/universal_scanner/attack_self(mob/user, modifiers)
	. = ..()
	var/choice = show_radial_menu(user, src, scale_mode, custom_check = CALLBACK(src, PROC_REF(check_menu), user), radius = 36, require_near = TRUE)
	if(!choice)
		return FALSE
	if(icon_state == "[choice]")
		return FALSE
	switch(choice)
		if("сканер экспорта")
			scanning_mode = SCAN_EXPORTS
		if("ценникатор")
			scanning_mode = SCAN_PRICE_TAG
		if("продажный маркиратор")
			scanning_mode = SCAN_SALES_TAG
	icon_state = "[choice]"
	playsound(src, 'sound/machines/click.ogg', 40, TRUE)

/obj/item/universal_scanner/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!isobj(interacting_with))
		return NONE
	if(scanning_mode == SCAN_EXPORTS)
		export_scan(interacting_with, user)
		return ITEM_INTERACT_SUCCESS
	if(scanning_mode == SCAN_PRICE_TAG)
		price_tag(interacting_with, user)
		return ITEM_INTERACT_SUCCESS
	return NONE

/obj/item/universal_scanner/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	. = ..()
	if(scanning_mode == SCAN_SALES_TAG && isidcard(attacking_item))
		var/obj/item/card/id/potential_acc = attacking_item
		if(potential_acc.registered_account)
			if(payments_acc == potential_acc.registered_account)
				to_chat(user, span_notice("ID-карта уже зарегистрирована."))
				return
			else
				payments_acc = potential_acc.registered_account
				playsound(src, 'sound/machines/ping.ogg', 40, TRUE)
				to_chat(user, span_notice("[src] регистрирует ID-карту. Промаркируйте упакованный предмет, чтобы создать штрихкод."))
		else if(!potential_acc.registered_account)
			to_chat(user, span_warning("К этой ID-карте не привязан счет!"))
			return
	if(istype(attacking_item, /obj/item/paper))
		if (!(paper_count >= max_paper_count))
			paper_count += PAPER_PER_SHEET
			qdel(attacking_item)
			if (paper_count >= max_paper_count)
				paper_count = max_paper_count
				to_chat(user, span_notice("Запас бумаги в [src] теперь полон."))
				return
			to_chat(user, span_notice("Вы пополняете запас бумаги в [src]. Осталось: [paper_count]."))
		else
			to_chat(user, span_notice("Запас бумаги в [src] полон."))

/obj/item/universal_scanner/attack_self_secondary(mob/user, modifiers)
	. = ..()
	if(scanning_mode == SCAN_SALES_TAG)
		if(paper_count <= 0)
			to_chat(user, span_warning("У вас закончилась бумага!"))
			return
		if(!payments_acc)
			to_chat(user, span_warning("Сначала нужно провести ID-картой по [src]."))
			return
		paper_count--
		playsound(src, 'sound/machines/click.ogg', 40, TRUE)
		to_chat(user, span_notice("Вы печатаете новый штрихкод."))
		var/obj/item/barcode/new_barcode = new /obj/item/barcode(src)
		new_barcode.payments_acc = payments_acc		// The sticker gets the scanner's registered account.
		new_barcode.cut_multiplier = cut_multiplier		// Also the registered percent cut.
		user.put_in_hands(new_barcode)
	if(scanning_mode == SCAN_PRICE_TAG)
		if(loc != user)
			to_chat(user, span_warning("Чтобы продолжить, нужно держать [src] в руках!"))
			return
		var/chosen_price = tgui_input_number(user, "Установите цену", "Цена", new_custom_price)
		if(!chosen_price || QDELETED(user) || QDELETED(src) || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH) || loc != user)
			return
		new_custom_price = chosen_price
		to_chat(user, span_notice("[src] теперь будет ставить ценник [new_custom_price] [MONEY_SYMBOL]."))

/obj/item/universal_scanner/item_ctrl_click(mob/user)
	. = CLICK_ACTION_BLOCKING
	if(scanning_mode == SCAN_SALES_TAG)
		payments_acc = null
		to_chat(user, span_notice("Вы очищаете зарегистрированный счет."))
		return CLICK_ACTION_SUCCESS

/obj/item/universal_scanner/click_alt(mob/user)
	if(!scanning_mode == SCAN_SALES_TAG)
		return CLICK_ACTION_BLOCKING
	var/potential_cut = input("Какую долю прибыли выплачивать зарегистрированной карте?","Процент прибыли ([round(cut_min*100)]% - [round(cut_max*100)]%)") as num|null
	if(!potential_cut)
		cut_multiplier = initial(cut_multiplier)
	cut_multiplier = clamp(round(potential_cut/100, cut_min), cut_min, cut_max)
	to_chat(user, span_notice("При продаже посылки со штрихкодом будет выплачено [round(cut_multiplier*100)]% прибыли."))
	return CLICK_ACTION_SUCCESS

/obj/item/universal_scanner/examine(mob/user)
	. = ..()
	. += span_notice("Доступно штрихкодов: [paper_count]/[max_paper_count]. Пополняется бумагой.")

	if(scanning_mode == SCAN_SALES_TAG)
		. += span_notice("Доля прибыли при продаже сейчас установлена на [round(cut_multiplier*100)]%. <b>Alt-click</b>, чтобы изменить.")
		if(payments_acc)
			. += span_notice("<b>Ctrl-click</b>, чтобы очистить зарегистрированный счет.")

	if(scanning_mode == SCAN_PRICE_TAG)
		. += span_notice("Текущая пользовательская цена: [new_custom_price] [MONEY_SYMBOL]. <b>ПКМ</b>, чтобы изменить.")

/obj/item/universal_scanner/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	switch(scanning_mode)
		if(SCAN_SALES_TAG)
			context[SCREENTIP_CONTEXT_LMB] = "Промаркировать посылку"
			context[SCREENTIP_CONTEXT_ALT_LMB] = "Изменить выплату %"
			context[SCREENTIP_CONTEXT_CTRL_LMB] = "Очистить целевой счет"
		if(SCAN_PRICE_TAG)
			context[SCREENTIP_CONTEXT_LMB] = "Оценить предмет"
			context[SCREENTIP_CONTEXT_RMB] = "Установить цену"
		if(SCAN_EXPORTS)
			context[SCREENTIP_CONTEXT_LMB] = "Сканировать экспортную стоимость"
	return CONTEXTUAL_SCREENTIP_SET
/**
 * Scans an object, target, and provides its export value based on selling to the cargo shuttle, to mob/user.
 */
/obj/item/universal_scanner/proc/export_scan(obj/target, mob/user)
	var/datum/export_report/report = export_item_and_contents(target, dry_run = TRUE)
	var/price = 0
	for(var/exported_datum in report.total_amount)
		price += report.total_value[exported_datum]

	var/message = "Просканировано: [target]"
	var/warning = FALSE
	if(length(target.contents))
		message = "Просканировано: [target] и содержимое"
		if(price)
			message += ", общая стоимость: <b>[price]</b> [MONEY_NAME]"
		else
			message += ", экспортной стоимости нет"
			warning = TRUE
		if(!report.all_contents_scannable)
			message += " (обнаружена неопределимая стоимость, итоговая цена может отличаться)"
		message += "."
	else
		if(!report.all_contents_scannable)
			message += ", невозможно определить стоимость."
			warning = TRUE
		else if(price)
			message += ", стоимость: <b>[price]</b> [MONEY_NAME]."
		else
			message += ", экспортной стоимости нет."
			warning = TRUE
	if(warning)
		to_chat(user, span_warning(message))
	else
		to_chat(user, span_notice(message))

	if(price)
		playsound(src, 'sound/machines/terminal/terminal_select.ogg', 50, vary = TRUE)

	if(istype(target, /obj/item/delivery))
		var/obj/item/delivery/parcel = target
		if(!parcel.sticker)
			return
		var/obj/item/barcode/our_code = parcel.sticker
		to_chat(user, span_notice("Обнаружен экспортный штрихкод! При экспорте эта посылка выплатит средства [our_code.payments_acc.account_holder], \
			с долей [our_code.cut_multiplier * 100]% для него (уже учтено в указанной выше стоимости)."))

	if(istype(target, /obj/item/barcode))
		var/obj/item/barcode/our_code = target
		to_chat(user, span_notice("Обнаружен экспортный штрихкод! Если прикрепить его к посылке, выплата пойдет [our_code.payments_acc.account_holder], \
			с долей [our_code.cut_multiplier * 100]%."))

	if(ishuman(user))
		var/mob/living/carbon/human/scan_human = user
		if(istype(target, /obj/item/bounty_cube))
			var/obj/item/bounty_cube/cube = target
			var/datum/bank_account/scanner_account = scan_human.get_bank_account()

			if(!istype(get_area(cube), /area/shuttle/supply))
				to_chat(user, span_warning("Размещение на шаттле не обнаружено. Чаевые за обработку не зарегистрированы."))

			else if(cube.bounty_handler_account)
				to_chat(user, span_warning("Банковский счет для чаевых за обработку уже зарегистрирован!"))

			else if(scanner_account)
				cube.AddComponent(/datum/component/pricetag, list(scanner_account), cube.handler_tip, FALSE)

				cube.bounty_handler_account = scanner_account
				cube.bounty_handler_account.bank_card_talk("Банковский счет для [price ? "<b>[price * cube.handler_tip]</b> [MONEY_NAME_SINGULAR] " : ""]чаевых за обработку успешно зарегистрирован.")

				for(var/datum/bank_account/shareholder in cube.bounty_holder_accounts)
					if(shareholder != cube.bounty_handler_account) //No need to send a tracking update to the person scanning it
						shareholder.bank_card_talk("<b>[cube]</b> был просканирован в <b>[get_area(cube)]</b> пользователем <b>[scan_human] ([scan_human.job])</b>.")

			else
				to_chat(user, span_warning("Банковский счет не обнаружен. Чаевые за обработку не зарегистрированы."))

/**
 * Scans an object, target, and sets its custom_price variable to new_custom_price, presenting it to the user.
 */
/obj/item/universal_scanner/proc/price_tag(obj/target, mob/user)
	if(isitem(target))
		var/obj/item/selected_target = target
		selected_target.custom_price = new_custom_price
		to_chat(user, span_notice("Вы устанавливаете цену [selected_target]: [new_custom_price] [MONEY_SYMBOL]."))

/**
 * check_menu: Checks if we are allowed to interact with a radial menu
 *
 * Arguments:
 * * user The mob interacting with a menu
 */
/obj/item/universal_scanner/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated)
		return FALSE
	return TRUE

/obj/item/barcode
	name = "штрихкодовая метка"
	desc = "Крошечная метка, связанная со счетом члена экипажа. Прикрепите ее к упакованному предмету, чтобы этот счет получил часть прибыли от продажи."
	icon = 'icons/obj/service/bureaucracy.dmi'
	icon_state = "barcode"
	w_class = WEIGHT_CLASS_TINY
	//All values inherited from the sales tagger it came from.
	///The bank account assigned to pay out to from the sales tagger.
	var/datum/bank_account/payments_acc = null
	///The percentage of profit to give to the payments_acc, from 0 to 1.
	var/cut_multiplier = 0.5

#undef PAPER_PER_SHEET
