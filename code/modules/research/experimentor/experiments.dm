/datum/experimentor_result_handler
	/// The name as seen in the UI
	var/name
	/// The FontAwesome icon for the UI
	var/fa_icon
	/// Which scan type triggers this reaction
	var/scantype
	/// Message to display when the experiment begins
	var/start_message_template
	/// The probability of the experiment reaching critical state
	var/critical_prob
	/// Message to display when the critical state triggers
	var/critical_message_template
	/// The span for the visible message
	var/start_message_type = MSG_TYPE_NOTICE
	/// This reaction handler has bespoke handing
	var/is_special = FALSE

/datum/experimentor_result_handler/proc/execute(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/final_message = replacetext(start_message_template, "%ITEM%", exp_on)
	machine.show_start_message(final_message, start_message_type)

	var/critical = machine.is_critical_reaction(exp_on)
	if(critical && prob(critical_prob))
		handle_critical(machine, exp_on)
		return

	handle_malfunctions(machine, exp_on)

/datum/experimentor_result_handler/proc/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	if(critical_message_template)
		var/final_critical_message = replacetext(critical_message_template, "%ITEM%", exp_on)
		machine.visible_message(span_notice(final_critical_message))

/datum/experimentor_result_handler/proc/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	return

/// Pokes the object
/datum/experimentor_result_handler/scan/poke
	name = "Тыкнуть"
	fa_icon = "hand"
	scantype = SCANTYPE_POKE
	start_message_template = "тычет в %ITEM% механическими манипуляторами."
	critical_prob = EFFECT_PROB_LOW
	critical_message_template = "%ITEM% захвачен идеально точно, что усиливает его фокусировку."

/datum/experimentor_result_handler/scan/poke/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	machine.critical_malfunction_counter++
	machine.RefreshParts()

/datum/experimentor_result_handler/scan/poke/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("[machine] дает сбой и уничтожает [exp_on], размахивая манипуляторами по всем поблизости!"))
		for(var/mob/living/nearby_mob in oview(1, machine))
			nearby_mob.apply_damage(15, BRUTE, pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST))
			machine.investigate_log("Experimentor dealt minor brute to [nearby_mob].", INVESTIGATE_EXPERIMENTOR)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой!"))
		machine.run_experiment(SCANTYPE_OBLITERATE)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		machine.visible_message(span_danger("[machine] дает сбой и швыряет [exp_on]!"))
		var/mob/living/target = locate(/mob/living) in oview(7, machine)
		if(target)
			var/obj/item/throwing = machine.loaded_item
			machine.investigate_log("Experimentor has thrown [machine.loaded_item] at [key_name(target)]", INVESTIGATE_EXPERIMENTOR)
			machine.item_eject()
			if(throwing)
				throwing.throw_at(target, 10, 1)

/// Infuses it with radiation
/datum/experimentor_result_handler/scan/irradiate
	name = "Облучить"
	fa_icon = "radiation"
	scantype = SCANTYPE_IRRADIATE
	start_message_template = "направляет радиоактивные лучи на %ITEM%!"
	start_message_type = MSG_TYPE_DANGER
	critical_prob = EFFECT_PROB_VERYLOW
	critical_message_template = "%ITEM% активирует неизвестную подпрограмму!"

/datum/experimentor_result_handler/scan/irradiate/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	machine.investigate_log("Experimentor has made a clone of [exp_on]", INVESTIGATE_EXPERIMENTOR)
	machine.item_eject(TRUE)

/datum/experimentor_result_handler/scan/irradiate/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("[machine] дает сбой, расплавляет [exp_on] и выпускает радиацию!"))
		playsound(machine, 'sound/effects/supermatter.ogg', 50, TRUE, -3)
		radiation_pulse(machine, max_range = 6, threshold = 0.3)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой и извергает токсичные отходы!"))
		for(var/turf/T in oview(1, machine))
			if(!T.density && prob(EFFECT_PROB_VERYHIGH) && !(locate(/obj/effect/decal/cleanable/greenglow) in T))
				new /obj/effect/decal/cleanable/greenglow/filled(T)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		var/savedName = "[exp_on]"
		QDEL_NULL(machine.loaded_item)
		var/newPath = text2path(pick_weight(machine.valid_items))
		machine.loaded_item = new newPath(machine)
		machine.visible_message(span_warning("[machine] дает сбой и превращает [savedName] в [machine.loaded_item]!"))
		machine.investigate_log("Experimentor has transformed [savedName] into [machine.loaded_item]", INVESTIGATE_EXPERIMENTOR)

		if(istype(machine.loaded_item, /obj/item/grenade/chem_grenade))
			var/obj/item/grenade/chem_grenade/CG = machine.loaded_item
			CG.detonate()

		machine.item_eject()

/// Fills the chamber with gas
/datum/experimentor_result_handler/scan/gas
	name = "Газ"
	fa_icon = "cloud"
	scantype = SCANTYPE_GAS
	start_message_template = "заполняет камеру газом вместе с %ITEM%."
	start_message_type = MSG_TYPE_WARNING
	critical_prob = EFFECT_PROB_LOW
	critical_message_template = "%ITEM% достигает идеальной смеси!"

/datum/experimentor_result_handler/scan/gas/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	new /obj/item/stack/sheet/mineral/plasma(get_turf(pick(oview(1, machine))))

/datum/experimentor_result_handler/scan/gas/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()
	var/chosenchem

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("[machine] уничтожает [exp_on] и выпускает опасный газ!"))
		chosenchem = pick(
			/datum/reagent/carbon,
			/datum/reagent/uranium/radium,
			/datum/reagent/toxin,
			/datum/reagent/consumable/condensedcapsaicin,
			/datum/reagent/drug/mushroomhallucinogen,
			/datum/reagent/drug/space_drugs,
			/datum/reagent/consumable/ethanol,
			/datum/reagent/consumable/ethanol/beepsky_smash,
		)
		do_chem_smoke(0, machine, machine.loc, chosenchem, 50)
		machine.investigate_log("Experimentor has released [chosenchem] smoke.", INVESTIGATE_EXPERIMENTOR)
		playsound(machine, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("Химическая камера [machine] дала течь!"))
		chosenchem = pick(
			/datum/reagent/mutationtoxin/classic,
			/datum/reagent/cyborg_mutation_nanomachines,
			/datum/reagent/toxin/acid,
		)
		do_chem_smoke(0, machine, machine.loc, chosenchem, 50)
		playsound(machine, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		QDEL_NULL(machine.loaded_item)
		machine.warn_admins(usr, "[chosenchem] smoke")
		machine.investigate_log("Experimentor has released <font color='red'>[chosenchem]</font> smoke!", INVESTIGATE_EXPERIMENTOR)

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой и выпускает безвредный газ."))
		do_smoke(1, machine, machine.loc)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		machine.visible_message(span_warning("[machine] расплавляет [exp_on], ионизируя воздух вокруг!"))
		empulse(machine.loc, 4, 6, emp_source = machine)
		machine.investigate_log("Experimentor has generated an Electromagnetic Pulse.", INVESTIGATE_EXPERIMENTOR)
		QDEL_NULL(machine.loaded_item)

/// Heats the object
/datum/experimentor_result_handler/scan/heat
	name = "Нагреть"
	fa_icon = "fire"
	scantype = SCANTYPE_HEAT
	start_message_template = "повышает температуру %ITEM%."
	start_message_type = MSG_TYPE_NOTICE
	critical_prob = EFFECT_PROB_LOW
	critical_message_template = "аварийная система охлаждения %ITEM% издает тихий звон!"

/datum/experimentor_result_handler/scan/heat/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	playsound(machine, 'sound/machines/ding.ogg', 50, TRUE)

	var/obj/item/reagent_containers/cup/glass/coffee/C = new /obj/item/reagent_containers/cup/glass/coffee(get_turf(pick(oview(1, machine))))
	var/chosenchem = pick(
		/datum/reagent/toxin/plasma,
		/datum/reagent/consumable/capsaicin,
		/datum/reagent/consumable/ethanol,
	)
	C.reagents.remove_all(25)
	C.reagents.add_reagent(chosenchem, 50)
	C.name = "чашка подозрительной жидкости"
	C.desc = "На боку выцветшими чернилами напечатан крупный символ опасности."
	machine.investigate_log("Experimentor has made a cup of [chosenchem] coffee.", INVESTIGATE_EXPERIMENTOR)

/datum/experimentor_result_handler/scan/heat/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		var/turf/start = get_turf(machine)
		var/mob/target_mob = locate(/mob/living) in view(machine, 3)
		var/turf/target_turf = get_turf(target_mob)

		if(target_turf)
			machine.visible_message(span_danger("[machine] опасно перегревается и запускает пылающий топливный шар!"))
			machine.investigate_log("Experimentor has launched a <font color='red'>fireball</font> at [target_mob]!", INVESTIGATE_EXPERIMENTOR)
			var/obj/projectile/magic/fireball/FB = new /obj/projectile/magic/fireball(start)
			FB.aim_projectile(target_turf, start)
			FB.fire()

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_danger("[machine] дает сбой, расплавляет [exp_on] и выпускает вспышку пламени!"))
		explosion(machine, devastation_range = -1, flame_range = 2, adminlog = FALSE)
		machine.investigate_log("Experimentor started a fire.", INVESTIGATE_EXPERIMENTOR)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой, расплавляет [exp_on] и выпускает горячий воздух!"))
		var/datum/gas_mixture/env = machine.loc.return_air()
		if(env)
			var/heat_capacity = max(env.heat_capacity(), 1)
			env.temperature = min((env.temperature * heat_capacity + 100000) / heat_capacity, 1000)
		machine.air_update_turf(FALSE, FALSE)
		machine.investigate_log("Experimentor has released hot air.", INVESTIGATE_EXPERIMENTOR)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой и активирует аварийную систему охлаждения!"))
		do_smoke(1, machine, machine.loc)
		for(var/mob/living/nearby_mob in oview(1, machine))
			nearby_mob.apply_damage(5, BURN, pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST))
			machine.investigate_log("Experimentor has dealt minor burn damage to [key_name(nearby_mob)]", INVESTIGATE_EXPERIMENTOR)
		machine.item_eject()

/// Cools the object
/datum/experimentor_result_handler/scan/cold
	name = "Заморозить"
	fa_icon = "snowflake"
	scantype = SCANTYPE_COLD
	start_message_template = "понижает температуру %ITEM%."
	start_message_type = MSG_TYPE_NOTICE
	critical_prob = EFFECT_PROB_LOW
	critical_message_template = "аварийная система охлаждения %ITEM% издает тихий звон!"

/datum/experimentor_result_handler/scan/cold/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	playsound(machine, 'sound/machines/ding.ogg', 50, TRUE)

	var/obj/item/reagent_containers/cup/glass/coffee/C = new /obj/item/reagent_containers/cup/glass/coffee(get_turf(pick(oview(1, machine))))
	var/chosenchem = pick(
		/datum/reagent/uranium,
		/datum/reagent/consumable/frostoil,
		/datum/reagent/medicine/ephedrine,
	)
	C.reagents.remove_all(25)
	C.reagents.add_reagent(chosenchem, 50)
	C.name = "чашка подозрительной жидкости"
	C.desc = "На боку выцветшими чернилами напечатан крупный символ опасности."
	machine.investigate_log("Experimentor has made a cup of [chosenchem] coffee.", INVESTIGATE_EXPERIMENTOR)

/datum/experimentor_result_handler/scan/cold/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("[machine] дает сбой, разбивает [exp_on] и выпускает опасное облако хладагента!"))
		do_chem_smoke(0, machine, machine.loc, /datum/reagent/consumable/frostoil, 50)
		machine.investigate_log("Experimentor has released frostoil gas.", INVESTIGATE_EXPERIMENTOR)
		playsound(machine, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой, разбивает [exp_on] и выпускает холодный воздух!"))
		var/datum/gas_mixture/env = machine.loc.return_air()
		if(env)
			var/heat_capacity = max(env.heat_capacity(), 1)
			env.temperature = max((env.temperature * heat_capacity - 75000) / heat_capacity, TCMB)
		machine.air_update_turf(FALSE, FALSE)
		machine.investigate_log("Experimentor has released cold air.", INVESTIGATE_EXPERIMENTOR)
		QDEL_NULL(machine.loaded_item)

	else if(prob(EFFECT_PROB_MEDIUM * malf_chance))
		machine.visible_message(span_warning("[machine] дает сбой и выпускает поток ледяного воздуха, пока [exp_on] выскакивает наружу!"))
		do_smoke(1, machine, machine.loc)
		machine.item_eject()

/// Crushes the object
/datum/experimentor_result_handler/scan/obliterate
	name = "Уничтожить"
	fa_icon = "trash"
	scantype = SCANTYPE_OBLITERATE
	start_message_template = "активирует дробящий механизм, %ITEM% уничтожен!"
	start_message_type = MSG_TYPE_WARNING
	critical_prob = EFFECT_PROB_LOW
	critical_message_template = "дробящий механизм %ITEM% медленно и плавно опускается, расплющивая %ITEM%!"

/datum/experimentor_result_handler/scan/obliterate/handle_critical(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	..()
	new /obj/item/stack/sheet/plasteel(get_turf(pick(oview(1, machine))))

/datum/experimentor_result_handler/scan/obliterate/handle_malfunctions(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/malf_chance = machine.get_malfunction_chance()

	if(prob(EFFECT_PROB_VERYLOW * malf_chance))
		machine.visible_message(span_danger("Дробилка [machine] поднимается слишком высоко и проламывает само пространство-время!"))
		playsound(machine, 'sound/effects/supermatter.ogg', 50, TRUE, -3)
		machine.investigate_log("Experimentor has triggered the 'throw things' reaction.", INVESTIGATE_EXPERIMENTOR)

		for(var/atom/movable/AM in oview(7, machine))
			if(!AM.anchored)
				AM.throw_at(machine, 10, 1)

	else if(prob(EFFECT_PROB_LOW * malf_chance))
		machine.visible_message(span_danger("Дробилка [machine] поднимается на уровень выше нормы и врезается в пространство-время!"))
		playsound(machine, 'sound/effects/supermatter.ogg', 50, TRUE, -3)
		machine.investigate_log("Experimentor has triggered the 'minor throw things' reaction.", INVESTIGATE_EXPERIMENTOR)

		var/list/throw_at = list()
		for(var/atom/movable/AM in oview(7, machine))
			if(!AM.anchored)
				throw_at.Add(AM)

		for(var/counter in 1 to throw_at.len)
			var/atom/movable/cast = throw_at[counter]
			cast.throw_at(pick(throw_at), 10, 1)

	QDEL_NULL(machine.loaded_item)

/// Discovers relic properties
/datum/experimentor_result_handler/scan/discover
	scantype = SCANTYPE_DISCOVER
	start_message_template = "сканирует %ITEM%, раскрывая его истинную природу!"
	start_message_type = MSG_TYPE_NOTICE
	is_special = TRUE

/datum/experimentor_result_handler/scan/discover/execute(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/final_message = replacetext(start_message_template, "%ITEM%", exp_on)
	machine.show_start_message(final_message, start_message_type)
	playsound(machine, 'sound/effects/supermatter.ogg', 50, 3, -1)

	var/obj/item/relic/loaded_artifact = machine.loaded_item
	if(loaded_artifact)
		loaded_artifact.reveal()
		machine.investigate_log("Experimentor has revealed a relic with [span_danger("[loaded_artifact.hidden_power]")] effect.", INVESTIGATE_EXPERIMENTOR)
	machine.item_eject()

/// Experiment failure
/datum/experimentor_result_handler/fail
	start_message_type = MSG_TYPE_WARNING
	is_special = TRUE

/datum/experimentor_result_handler/fail/execute(obj/machinery/rnd/experimentor/machine, obj/item/exp_on)
	var/a = pick("грохочет", "трясется", "вибрирует", "содрогается", "сигналит")
	var/b = pick("сминает", "крутит", "потрошит", "разбивает", "оскорбляет")
	machine.visible_message(span_warning("[exp_on] [a] и [b]; эксперимент провалился."))
