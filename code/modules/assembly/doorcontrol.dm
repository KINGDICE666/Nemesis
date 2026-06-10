/obj/item/assembly/control
	name = "контроллер гермоворот"
	desc = "Небольшое электронное устройство для дистанционного управления гермоворотами."
	icon_state = "control"
	/// The ID of the blast door electronics to match to the ID of the blast door being used.
	var/id = -1
	/// Cooldown of the door's controller. Updates when pressed (activate())
	var/cooldown = FALSE
	/// Should we toggle open/close of doors based on their current state
	var/sync_doors = TRUE

/obj/item/assembly/control/Initialize(mapload)
	. = ..()
	register_context()

/obj/item/assembly/control/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = NONE
	if(istype(held_item, /obj/item/assembly/control))
		context[SCREENTIP_CONTEXT_LMB] = "Скопировать ID"
		return CONTEXTUAL_SCREENTIP_SET

/obj/item/assembly/control/examine(mob/user)
	. = ..()
	if(id)
		if(id != -1)
			. += span_notice("Its channel ID is '[id]'.")
		else
			. += span_notice("Взаимодействуйте с гермоворотами, чтобы создать новый ID.")
	. += span_notice("Можно взаимодействовать с другим контроллером, чтобы скопировать его ID.")

/obj/item/assembly/control/multitool_act(mob/living/user)
	var/list/door_ids = list()
	var/list/display_ids = list("UNIQUE")
	for(var/obj/machinery/door/poddoor/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/poddoor))
		if(!M.id || (M.id in door_ids))
			continue
		door_ids += "[M.id]"
		if(M.owner?.resolve() != user)
			continue
		var/area/door_area = get_area(M)
		display_ids += "[door_area.name]([M.id])"

	var/change_id = tgui_input_list(user, "Установить ID контроллера", "ID контроллера", display_ids)
	if(!change_id || QDELETED(user) || QDELETED(src) || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return

	if(change_id == "UNIQUE")
		id = -1
	else
		var/start = findtext(change_id, "(") + 1
		var/end = length(change_id) - 1
		if(start == end)
			id = "[change_id[start]]"
		else
			id = copytext(change_id, start, end)
	balloon_alert(user, "ID изменен")
	if(id != -1)
		to_chat(user, span_notice("Вы меняете ID на [id]."))
	else
		to_chat(user, span_notice("Теперь нужно взаимодействовать с гермоворотами, чтобы создать уникальный ID."))

/obj/item/assembly/control/interact_with_atom(obj/item/assembly/control/interacting_with, mob/living/user, list/modifiers)
	. = NONE
	if(istype(interacting_with))
		id = interacting_with.id
		balloon_alert(user, "ID изменен")
		return ITEM_INTERACT_SUCCESS

/obj/item/assembly/control/activate()
	var/openclose
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/door/poddoor/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/poddoor))
		if(M.id == src.id)
			if(openclose == null || !sync_doors)
				openclose = M.density
			INVOKE_ASYNC(M, openclose ? TYPE_PROC_REF(/obj/machinery/door/poddoor, open) : TYPE_PROC_REF(/obj/machinery/door/poddoor, close))
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 1 SECONDS)

/obj/item/assembly/control/curtain
	name = "контроллер занавеса"
	desc = "Небольшое электронное устройство для дистанционного управления механическим занавесом."

/obj/item/assembly/control/curtain/examine(mob/user)
	. = ..()
	if(id)
		. += span_notice("ID канала: '[id]'.")

/obj/item/assembly/control/curtain/activate()
	var/openclose
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/structure/curtain/cloth/fancy/mechanical/M in GLOB.curtains)
		if(M.id == src.id)
			if(openclose == null || !sync_doors)
				openclose = M.density
			INVOKE_ASYNC(M, openclose ? TYPE_PROC_REF(/obj/structure/curtain/cloth/fancy/mechanical, open) : TYPE_PROC_REF(/obj/structure/curtain/cloth/fancy/mechanical, close))
	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 0.5 SECONDS)


/obj/item/assembly/control/airlock
	name = "контроллер шлюза"
	desc = "Небольшое электронное устройство для дистанционного управления шлюзом."
	id = "badmin" // Set it to null for MEGAFUN.
	var/specialfunctions = OPEN
	/*
	Bitflag, 1= open (OPEN)
				2= idscan (IDSCAN)
				4= bolts (BOLTS)
				8= shock (SHOCK)
				16= door safties (SAFE)
	*/

/obj/item/assembly/control/airlock/activate()
	if(cooldown)
		return
	cooldown = TRUE
	var/doors_need_closing = FALSE
	var/list/obj/machinery/door/airlock/open_or_close = list()
	for(var/obj/machinery/door/airlock/D as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/airlock))
		if(D.id_tag == src.id)
			if(specialfunctions & OPEN)
				open_or_close += D
				if(!D.density)
					doors_need_closing = TRUE
			if(specialfunctions & IDSCAN)
				D.aiDisabledIdScanner = !D.aiDisabledIdScanner
			if(specialfunctions & BOLTS)
				if(!D.wires.is_cut(WIRE_BOLTS) && D.hasPower())
					if(D.locked)
						D.unlock()
					else
						D.lock()
					D.update_appearance()
			if(specialfunctions & SHOCK)
				if(D.secondsElectrified)
					D.set_electrified(MACHINE_ELECTRIFIED_PERMANENT, usr)
				else
					D.set_electrified(MACHINE_NOT_ELECTRIFIED, usr)
			if(specialfunctions & SAFE)
				D.safe = !D.safe

	for(var/D in open_or_close)
		INVOKE_ASYNC(D,  doors_need_closing ? TYPE_PROC_REF(/obj/machinery/door/airlock, close) : TYPE_PROC_REF(/obj/machinery/door/airlock, open))

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 1 SECONDS)


/obj/item/assembly/control/massdriver
	name = "контроллер масс-драйвера"
	desc = "Небольшое электронное устройство для управления масс-драйвером."

/obj/item/assembly/control/massdriver/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/door/poddoor/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/poddoor))
		if (M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/door/poddoor, open))

	addtimer(CALLBACK(src, PROC_REF(activate_stage2)), 1 SECONDS)

/obj/item/assembly/control/massdriver/proc/activate_stage2()
	for(var/obj/machinery/mass_driver/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/mass_driver))
		if(M.id == src.id)
			M.drive()

	addtimer(CALLBACK(src, PROC_REF(activate_stage3)), 6 SECONDS)

/obj/item/assembly/control/massdriver/proc/activate_stage3()
	for(var/obj/machinery/door/poddoor/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/door/poddoor))
		if (M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/door/poddoor, close))

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 1 SECONDS)


/obj/item/assembly/control/igniter
	name = "контроллер зажигания"
	desc = "Дистанционный контроллер установленного воспламенителя."

/obj/item/assembly/control/igniter/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/sparker/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/sparker))
		if (M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/sparker, ignite))

	for(var/obj/machinery/igniter/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/igniter))
		if(M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/igniter, toggle))

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 3 SECONDS)

/obj/item/assembly/control/flasher
	name = "контроллер вспышки"
	desc = "Дистанционный контроллер установленной вспышки."

/obj/item/assembly/control/flasher/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for(var/obj/machinery/flasher/M as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/flasher))
		if(M.id == src.id)
			INVOKE_ASYNC(M, TYPE_PROC_REF(/obj/machinery/flasher, flash))

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 5 SECONDS)


/obj/item/assembly/control/crematorium
	name = "контроллер крематория"
	desc = "Зловещий дистанционный контроллер крематория."

/obj/item/assembly/control/crematorium/activate()
	if(cooldown)
		return
	cooldown = TRUE
	for (var/obj/structure/bodycontainer/crematorium/C in GLOB.crematoriums)
		if (C.id == id)
			C.cremate(usr)

	addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 5 SECONDS)
