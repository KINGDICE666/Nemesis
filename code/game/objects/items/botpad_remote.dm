/obj/item/botpad_remote
	name = "пульт площадки запуска ботов"
	desc = "Это устройство управляет привязанной площадкой запуска ботов."
	desc_controls = "Левый клик - запуск, правый клик - возврат."
	icon = 'icons/obj/devices/remote.dmi'
	icon_state = "botpad_controller"
	w_class = WEIGHT_CLASS_SMALL
	// ID of the remote, used for linking up
	var/id = "botlauncher"
	var/obj/machinery/botpad/connected_botpad

/obj/item/botpad_remote/Destroy()
	if(connected_botpad)
		connected_botpad.connected_remote = null
		connected_botpad = null
	return ..()

/obj/item/botpad_remote/attack_self(mob/living/user)
	playsound(src, SFX_TERMINAL_TYPE, 25, FALSE)
	try_launch(user)
	return

/obj/item/botpad_remote/attack_self_secondary(mob/living/user)
	playsound(src, SFX_TERMINAL_TYPE, 25, FALSE)
	if(connected_botpad)
		connected_botpad.recall(user)
		return
	user?.balloon_alert(user, "нет привязанной площадки!")
	return

/obj/item/botpad_remote/multitool_act(mob/living/user, obj/item/multitool/multitool)
	. = NONE
	if(!istype(multitool.buffer, /obj/machinery/botpad))
		return

	var/obj/machinery/botpad/buffered_remote = multitool.buffer
	if(buffered_remote == connected_botpad)
		to_chat(user, span_warning("Пульт не может подключиться к собственной площадке запуска ботов!"))
		return ITEM_INTERACT_BLOCKING

	if(!connected_botpad && istype(buffered_remote, /obj/machinery/botpad))
		connected_botpad = buffered_remote
		connected_botpad.connected_remote = src
		connected_botpad.id = id
		multitool.set_buffer(null)
		to_chat(user, span_notice("Вы подключаете пульт к площадке, используя данные из буфера \the [multitool]."))
		return ITEM_INTERACT_SUCCESS

/obj/item/botpad_remote/proc/try_launch(mob/living/user)
	if(!connected_botpad)
		user?.balloon_alert(user, "нет привязанной площадки!")
		return
	if(connected_botpad.panel_open)
		user?.balloon_alert(user, "закройте панель!")
		return
	if(!(locate(/mob/living) in get_turf(connected_botpad)))
		user?.balloon_alert(user, "на площадке нет ботов!")
		return
	connected_botpad.launch(user)
