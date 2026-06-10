/obj/machinery/computer/warrant
	name = "консоль ордеров службы безопасности"
	desc = "Используется для просмотра действующих ордеров и штрафов."
	icon_screen = "security"
	icon_keyboard = "security_key"
	circuit = /obj/item/circuitboard/computer/warrant
	light_color = COLOR_SOFT_RED
	/// The state of the printer
	var/printing = FALSE

/obj/machinery/computer/warrant/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "WarrantConsole", name)
		ui.set_autoupdate(FALSE)
		ui.open()

/obj/machinery/computer/warrant/ui_data(mob/user)
	var/list/data = list()

	var/list/records = list()

	for(var/datum/record/crew/target in GLOB.manifest.general)
		if(!length(target.citations))
			continue

		var/list/citations = list()

		for(var/datum/crime/citation/warrant as anything in target.citations)
			if(!warrant.valid)
				continue

			var/list/entry = list(list(
				author = warrant.author,
				details = warrant.details,
				fine = warrant.fine,
				fine_name = warrant.name,
				fine_ref = REF(warrant),
				paid = warrant.paid,
				time = warrant.time,
			))

			citations += entry

		var/list/record = list(list(
			citations = citations,
			crew_name = target.name,
			crew_ref = REF(target),
			notes = target.security_note,
			rank = target.rank,
		))

		records += record
	data["records"] = records

	return data

/obj/machinery/computer/warrant/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return FALSE

	switch(action)
		if("pay")
			pay_fine(usr, params)
			return TRUE

		if("print")
			ui.close()
			print_bounty(usr, params)
			return TRUE

		if("refresh")
			return TRUE

	return FALSE

/// Pays towards a listed fine.
/obj/machinery/computer/warrant/proc/pay_fine(mob/user, list/params)
	var/datum/record/crew/target = locate(params["crew_ref"]) in GLOB.manifest.general
	if(!target)
		return FALSE

	var/datum/crime/citation/warrant = locate(params["fine_ref"]) in target.citations
	if(!warrant)
		return FALSE

	if(!isliving(user) || issilicon(user))
		to_chat(user, span_warning("ДОСТУП ЗАПРЕЩЕН"))
		playsound(src, 'sound/machines/terminal/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/mob/living/player = user
	var/obj/item/card/id/auth = player.get_idcard(TRUE)
	if(!auth)
		to_chat(user, span_warning("ДОСТУП ЗАПРЕЩЕН: ID-карта не обнаружена."))
		playsound(src, 'sound/machines/terminal/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/datum/bank_account/account = auth.registered_account
	if(!account?.account_holder || account.account_holder == "Unassigned")
		to_chat(user, span_warning("ДОСТУП ЗАПРЕЩЕН: к ID не привязан счет."))
		playsound(src, 'sound/machines/terminal/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/amount = params["amount"]
	if(!amount || !isnum(amount) || amount <= 0 || amount > warrant.fine || !account.adjust_money(-amount, "Paid fine for [target.name]"))
		to_chat(user, span_warning("ДОСТУП ЗАПРЕЩЕН: неверная сумма."))
		playsound(src, 'sound/machines/terminal/terminal_error.ogg', 100, TRUE)
		return FALSE

	account.bank_card_talk("Вы внесли [amount][MONEY_SYMBOL] в счет штрафа [target.name] размером [warrant.fine][MONEY_SYMBOL].")
	log_econ("[amount][MONEY_SYMBOL] was transferred from [user]'s transaction to [target.name]'s [warrant.fine][MONEY_SYMBOL] fine")
	SSblackbox.record_feedback("amount", "credits_transferred", amount)
	warrant.pay_fine(amount)

	if(amount >= 100 && target?.name != user)
		var/list/titles = list(
			"Анонимный благотворитель",
			"Щедрый гражданин",
			"Добрая душа",
			"Добрый самаритянин",
			"Дружелюбный прохожий",
			"Неравнодушный незнакомец",
		)
		warrant.alert_owner(user, src, target.name, "[pick(titles)] внес [amount][MONEY_SYMBOL] в счет вашего штрафа.")

	var/datum/bank_account/sec_account = SSeconomy.get_dep_account(ACCOUNT_SEC)
	sec_account.adjust_money(amount)
	SSblackbox.ReportCitation(REF(warrant), paid = warrant.paid)

	if(warrant.fine != 0 || target.name == user)
		return TRUE

	warrant.alert_owner(user, src, target.name, "Один из ваших действующих ордеров был полностью оплачен.")
	warrant.valid = FALSE
	return TRUE

/// Finishes printing, resets the printer.
/obj/machinery/computer/warrant/proc/print_finish(obj/item/paper/bounty)
	printing = FALSE
	playsound(src, 'sound/machines/terminal/terminal_eject.ogg', 100, TRUE)
	bounty.forceMove(loc)

	return TRUE

/// Prints a bounty for a listed fine.
/obj/machinery/computer/warrant/proc/print_bounty(mob/user, list/params)
	if(printing)
		balloon_alert(user, "принтер занят")
		playsound(src, 'sound/machines/terminal/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/datum/record/crew/target = locate(params["crew_ref"]) in GLOB.manifest.general
	if(!target)
		return FALSE

	var/datum/crime/citation/warrant = locate(params["fine_ref"]) in target.citations
	if(!warrant?.fine)
		return FALSE

	var/bounty_text = "<center><h2><b>Награда за [target.name]</b><h2></center><BR>"
	bounty_text += "<center>Разыскивается за: [warrant.name]</h2></center><br><br>"
	bounty_text += "<b>Детали:</b><br>[warrant.details]<br>"
	bounty_text += "<b>Выдал:</b><br>[usr]<br>"
	bounty_text += "<b>Время выдачи:</b><br>[warrant.time]<br>"
	bounty_text += "<b>Комментарии:</b><br>[!target.security_note ? "Нет." : target.security_note]<br><br>"
	bounty_text += "<center><b>ШТРАФ:</b> [warrant.fine] [MONEY_NAME]</center>"

	printing = TRUE
	balloon_alert(user, "печать")
	playsound(src, 'sound/machines/printer.ogg', 100, TRUE)

	var/obj/item/paper/bounty = new(null)
	bounty.name = "награда за [target.name]"
	bounty.desc = "Награда [warrant.fine][MONEY_SYMBOL] за [target.name]."
	bounty.add_raw_text(bounty_text)
	bounty.update_icon()

	addtimer(CALLBACK(src, PROC_REF(print_finish), bounty), 2 SECONDS)

	return TRUE
