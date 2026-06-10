/obj/machinery/power/emitter
	name = "эмиттер"
	desc = "Тяжелый промышленный лазер, часто используемый в полях сдерживания и энергетике."
	icon = 'icons/obj/machines/engine/singularity.dmi'
	icon_state = "emitter"
	base_icon_state = "emitter"

	anchored = FALSE
	density = TRUE
	req_access = list(ACCESS_ENGINE_EQUIP)
	circuit = /obj/item/circuitboard/machine/emitter

	use_power = NO_POWER_USE
	can_change_cable_layer = TRUE

	/// The icon state used by the emitter when it's on.
	var/icon_state_on = "emitter_+a"
	/// The icon state used by the emitter when it's on and low on power.
	var/icon_state_underpowered = "emitter_+u"
	///Is the machine active?
	var/active = FALSE
	///Does the machine have power?
	var/powered = FALSE
	///Seconds before the next shot
	var/fire_delay = 10 SECONDS
	///Max delay before firing
	var/maximum_fire_delay = 10 SECONDS
	///Min delay before firing
	var/minimum_fire_delay = 2 SECONDS
	///Modifier to the preceeding two numbers
	var/fire_rate_mod = 1
	///Deactivates the "pause every 3 shots" system
	var/no_shot_counter = FALSE
	///When was the last shot
	var/last_shot = 0
	///Number of shots made (gets reset every few shots)
	var/shot_number = 0
	///if it's welded down to the ground or not. the emitter will not fire while unwelded. if set to true, the emitter will start anchored as well.
	var/welded = FALSE
	///Is the emitter id locked?
	var/locked = FALSE
	///Used to stop interactions with the object (mainly in the wabbajack statue)
	var/allow_switch_interact = TRUE
	///What projectile type are we shooting?
	var/projectile_type = /obj/projectile/beam/emitter/hitscan
	///What's the projectile sound?
	var/projectile_sound = 'sound/items/weapons/emitter.ogg'
	///Sparks emitted with every shot
	var/datum/effect_system/basic/spark_spread/sparks
	///Stores the type of gun we are using inside the emitter
	var/obj/item/gun/energy/gun
	///List of all the properties of the inserted gun
	var/list/gun_properties
	//only used to always have the gun properties on non-letal (no other instances found)
	var/mode = FALSE

	// The following 3 vars are mostly for the prototype
	///manual shooting? (basically you hop onto the emitter and choose the shooting direction, is very janky since you can only shoot at the 8 directions and i don't think is ever used since you can't build those)
	var/manual = FALSE
	///Amount of power inside
	var/charge = 0
	///stores the direction and orientation of the last projectile
	var/last_projectile_params
	//the disk in the gun
	var/obj/item/emitter_disk/diskie

/obj/machinery/power/emitter/Initialize(mapload)
	. = ..()
	//Add to the early process queue to prioritize power draw
	SSmachines.processing_early += src
	set_wires(new /datum/wires/emitter(src))
	if(welded)
		if(!anchored)
			set_anchored(TRUE)
		connect_to_network()

	sparks = new(src, 5, TRUE)
	sparks.attach(src)
	AddElement(/datum/element/simple_rotation)
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF | EMP_PROTECT_WIRES)
	AddComponent(/datum/component/usb_port, typecacheof(list(/obj/item/circuit_component/emitter), only_root_path = TRUE))

/obj/machinery/power/emitter/welded/Initialize(mapload)
	welded = TRUE
	. = ..()

/obj/machinery/power/emitter/cable_layer_act(mob/living/user, obj/item/tool)
	if(panel_open)
		return NONE
	if(welded)
		balloon_alert(user, "сначала срежьте сварку!")
		return ITEM_INTERACT_BLOCKING
	return ..()

/obj/machinery/power/emitter/set_anchored(anchorvalue)
	. = ..()
	if(!anchored && welded) //make sure they're keep in sync in case it was forcibly unanchored by badmins or by a megafauna.
		welded = FALSE

/obj/machinery/power/emitter/RefreshParts()
	. = ..()
	var/max_fire_delay = 12 SECONDS
	var/fire_shoot_delay = 12 SECONDS
	var/min_fire_delay = 2.4 SECONDS
	var/power_usage = 350
	for(var/datum/stock_part/micro_laser/laser in component_parts)
		max_fire_delay -= 2 SECONDS * laser.tier
		min_fire_delay -= 0.4 SECONDS * laser.tier
		fire_shoot_delay -= 2 SECONDS * laser.tier
	maximum_fire_delay = max_fire_delay
	minimum_fire_delay = min_fire_delay
	fire_delay = fire_shoot_delay
	for(var/datum/stock_part/servo/servo in component_parts)
		power_usage -= 50 * servo.tier
	update_mode_power_usage(ACTIVE_POWER_USE, power_usage)

/obj/machinery/power/emitter/examine(mob/user)
	. = ..()
	if(welded)
		. += span_info("Он надежно прикреплен к полу. Крепления можно срезать <b>сваркой</b>.")
	else if(anchored)
		. += span_info("Сейчас он закреплен на полу. Крепления можно зафиксировать <b>сваркой</b> или снять <b>ключом</b>.")
	else
		. += span_info("Он не закреплен на полу. Его можно закрепить <b>ключом</b>.")

	if(!in_range(user, src) && !isobserver(user))
		return

	if(!active)
		. += span_notice("Его статусный дисплей сейчас выключен.")
	else if(!powered)
		. += span_notice("Его статусный дисплей тускло светится.")
	else
		. += span_notice("На статусном дисплее написано: один луч каждые <b>[DisplayTimeText(minimum_fire_delay * fire_rate_mod)]</b> - <b>[DisplayTimeText(maximum_fire_delay * fire_rate_mod)]</b>.")
		. += span_notice("Потребление энергии: <b>[display_power(active_power_usage, convert = FALSE)]</b>.")

/obj/machinery/power/emitter/should_have_node()
	return welded

/obj/machinery/power/emitter/Destroy()
	if(SSticker.IsRoundInProgress())
		var/turf/T = get_turf(src)
		message_admins("[src] deleted at [ADMIN_VERBOSEJMP(T)].")
		log_game("[src] deleted at [AREACOORD(T)].")
		investigate_log("deleted at [AREACOORD(T)].", INVESTIGATE_ENGINE)
	QDEL_NULL(sparks)
	return ..()

/obj/machinery/power/emitter/update_overlays()
	. = ..()
	if(!active)
		return
	var/laser_color = COLOR_VIBRANT_LIME
	if (!powered)
		laser_color = COLOR_ORANGE //stank low power orange
	else if (diskie)
		laser_color = diskie.laser_color
	var/mutable_appearance/overlay = mutable_appearance(icon, "emitter_overlay")
	overlay.color = laser_color
	. += overlay
	. += emissive_appearance(icon, "emitter_overlay", src, alpha = src.alpha)

/obj/machinery/power/emitter/update_icon_state()
	if(panel_open)
		icon_state = "[base_icon_state]_open"
	else
		icon_state = base_icon_state
	return ..()

/obj/machinery/power/emitter/interact(mob/user)
	add_fingerprint(user)
	if(!welded)
		to_chat(user, span_warning("[src] сначала нужно надежно закрепить на полу!"))
		return FALSE
	if(!powernet)
		to_chat(user, span_warning("\The [src] не подключен к проводу!"))
		return FALSE
	if(locked || !allow_switch_interact)
		to_chat(user, span_warning("Управление заблокировано!"))
		return FALSE

	if(active)
		active = FALSE
	else
		active = TRUE
		shot_number = 0
		fire_delay = maximum_fire_delay

	to_chat(user, span_notice("Вы [active ? "включаете" : "выключаете"] [src]."))
	message_admins("[src] turned [active ? "ON" : "OFF"] by [ADMIN_LOOKUPFLW(user)] in [ADMIN_VERBOSEJMP(src)]")
	log_game("[src] turned [active ? "ON" : "OFF"] by [key_name(user)] in [AREACOORD(src)]")
	investigate_log("turned [active ? "ON" : "OFF"] by [key_name(user)] at [AREACOORD(src)]", INVESTIGATE_ENGINE)
	update_appearance()
	SEND_SIGNAL(src, COMSIG_EMITTER_MACHINE_SET_ON, active ? TRUE : FALSE)

/obj/machinery/power/emitter/attack_animal(mob/living/simple_animal/user, list/modifiers)
	if(ismegafauna(user) && anchored)
		set_anchored(FALSE)
		user.visible_message(span_warning("[user] вырывает [src] из креплений!"))
	else
		. = ..()
	if(. && !anchored)
		step(src, get_dir(user, src))

/obj/machinery/power/emitter/attack_ai_secondary(mob/user, list/modifiers)
	togglelock(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/machinery/power/emitter/process_early(seconds_per_tick)
	var/power_usage = active_power_usage * seconds_per_tick
	if(machine_stat & (BROKEN))
		return
	if(!welded || (!powernet && power_usage))
		active = FALSE
		update_appearance()
		return
	if(!active)
		return
	if(power_usage && surplus() < power_usage)
		if(powered)
			powered = FALSE
			update_appearance()
			investigate_log("lost power and turned OFF at [AREACOORD(src)]", INVESTIGATE_ENGINE)
			log_game("[src] lost power in [AREACOORD(src)]")
		return

	add_load(power_usage)
	if(!powered)
		powered = TRUE
		update_appearance()
		investigate_log("regained power and turned ON at [AREACOORD(src)]", INVESTIGATE_ENGINE)
	if(charge <= 80)
		charge += 2.5 * seconds_per_tick
	if(!check_delay() || manual == TRUE)
		return FALSE
	fire_beam()

/obj/machinery/power/emitter/proc/check_delay()
	if((last_shot + fire_delay) <= world.time)
		return TRUE
	return FALSE

/obj/machinery/power/emitter/proc/fire_beam_pulse()
	if(!check_delay())
		return FALSE
	if(!welded)
		return FALSE
	if(surplus() >= active_power_usage)
		add_load(active_power_usage)
		fire_beam()

/obj/machinery/power/emitter/proc/fire_beam(mob/user)
	var/obj/projectile/projectile = new projectile_type(get_turf(src))
	playsound(src, projectile_sound, 50, TRUE)
	if(prob(35))
		sparks.start()
	projectile.firer = user ? user : src
	projectile.fired_from = src
	if(last_projectile_params)
		projectile.p_x = last_projectile_params[2]
		projectile.p_y = last_projectile_params[3]
		projectile.fire(last_projectile_params[1])
	else
		projectile.fire(dir2angle(dir))
	if(!manual)
		last_shot = world.time
		if(shot_number < 3 || no_shot_counter)
			fire_delay = 20 * fire_rate_mod
			shot_number ++
		else
			fire_delay = rand(minimum_fire_delay,maximum_fire_delay) * fire_rate_mod
			shot_number = 0
	SEND_SIGNAL(src, COMSIG_EMITTER_MACHINE_ON_FIRE)
	return projectile

/obj/machinery/power/emitter/can_be_unfasten_wrench(mob/user, silent)
	if(active)
		if(!silent)
			to_chat(user, span_warning("Turn \the [src] off first!"))
		return FAILED_UNFASTEN

	else if(welded)
		if(!silent)
			to_chat(user, span_warning("[src] is welded to the floor!"))
		return FAILED_UNFASTEN

	return ..()

/obj/machinery/power/emitter/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/power/emitter/welder_act(mob/living/user, obj/item/item)
	..()
	if(active)
		to_chat(user, span_warning("Turn [src] off first!"))
		return TRUE

	if(welded)
		if(!item.tool_start_check(user, amount=1))
			return TRUE
		user.visible_message(span_notice("[user.name] starts to cut \the [src] free from the floor."), \
			span_notice("Вы начинаете отрезать [src] от пола..."), \
			span_hear("Вы слышите сварку."))
		if(!item.use_tool(src, user, 20, 1, 50))
			return FALSE
		welded = FALSE
		to_chat(user, span_notice("Вы отрезаете [src] от пола."))
		disconnect_from_network()
		update_cable_icons_on_turf(get_turf(src))
		return TRUE

	if(!anchored)
		to_chat(user, span_warning("[src] needs to be wrenched to the floor!"))
		return TRUE
	if(!item.tool_start_check(user, amount=1))
		return TRUE
	user.visible_message(span_notice("[user.name] starts to weld \the [src] to the floor."), \
		span_notice("Вы начинаете приваривать [src] к полу..."), \
		span_hear("Вы слышите сварку."))
	if(!item.use_tool(src, user, 20, 1, 50))
		return FALSE
	welded = TRUE
	to_chat(user, span_notice("Вы привариваете [src] к полу."))
	connect_to_network()
	update_cable_icons_on_turf(get_turf(src))
	return TRUE

/obj/machinery/power/emitter/crowbar_act(mob/living/user, obj/item/item)
	if(panel_open && gun)
		return remove_gun(user)
	if(panel_open && diskie)
		return remove_disk(user)
	return default_deconstruction_crowbar(user, item)

/obj/machinery/power/emitter/screwdriver_act(mob/living/user, obj/item/item)
	return default_deconstruction_screwdriver(user, item)

/// Attempt to toggle the controls lock of the emitter
/obj/machinery/power/emitter/proc/togglelock(mob/user)
	if(obj_flags & EMAGGED)
		to_chat(user, span_warning("Похоже, замок сломан!"))
		return
	if(!allowed(user))
		to_chat(user, span_danger("Доступ запрещен."))
		return
	if(!active)
		to_chat(user, span_warning("Управление можно заблокировать только когда [src] включен!"))
		return
	locked = !locked
	to_chat(user, span_notice("Вы [src.locked ? "блокируете" : "разблокируете"] управление."))

/obj/machinery/power/emitter/attackby(obj/item/item, mob/user, list/modifiers, list/attack_modifiers)
	if(item.GetID())
		togglelock(user)
		return

	if(is_wire_tool(item) && panel_open)
		wires.interact(user)
		return
	if(panel_open && !gun && istype(item,/obj/item/gun/energy))
		if(diskie)
			to_chat(user, span_warning("Перед установкой оружия извлеките диодный диск."))
			return
		if(integrate(item,user))
			return
	if(panel_open && !gun && istype(item,/obj/item/emitter_disk))
		var/obj/item/emitter_disk/config_disk = item
		if(!user.transferItemToLoc(config_disk, src))
			balloon_alert(user, "застряло в руке!")
			return
		if(diskie)
			user.put_in_hands(diskie)
			balloon_alert(user, "диски заменены!")
		else
			balloon_alert(user, "диск вставлен")
		diskie = config_disk
		projectile_type = diskie.stored_proj
		projectile_sound = diskie.stored_sound
		fire_rate_mod = diskie.fire_rate_mod
		no_shot_counter = diskie.no_shot_counter
		playsound(src, 'sound/machines/card_slide.ogg', 50)
		to_chat(user, span_notice("Вы обновляете диодную конфигурацию [src] с помощью [config_disk]."))
		update_appearance()
		if(diskie.consumable)
			qdel(diskie)
	return ..()


/obj/machinery/power/emitter/proc/integrate(obj/item/gun/energy/energy_gun, mob/user)
	if(!istype(energy_gun, /obj/item/gun/energy))
		return
	if(!user.transferItemToLoc(energy_gun, src))
		return
	if(energy_gun.gun_flags & TURRET_INCOMPATIBLE)
		user.balloon_alert(user, "[energy_gun] не подходит!")
		return
	gun = energy_gun
	gun_properties = gun.get_turret_properties()
	set_projectile()
	return TRUE

/obj/machinery/power/emitter/proc/remove_gun(mob/user)
	if(!gun)
		return
	user.put_in_hands(gun)
	gun = null
	playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
	gun_properties = list()
	set_projectile()
	return TRUE

/obj/machinery/power/emitter/proc/remove_disk(mob/user)
	if(!diskie)
		return
	if(diskie.consumed_on_removal)
		qdel(diskie)
	else
		user.put_in_hands(diskie)
	diskie = null
	playsound(src, 'sound/machines/card_slide.ogg', 50, TRUE)
	update_appearance()
	set_projectile()
	return TRUE


/obj/machinery/power/emitter/proc/set_projectile()
	if(LAZYLEN(gun_properties))
		if(mode || !gun_properties["lethal_projectile"])
			projectile_type = gun_properties["stun_projectile"]
			projectile_sound = gun_properties["stun_projectile_sound"]
		else
			projectile_type = gun_properties["lethal_projectile"]
			projectile_sound = gun_properties["lethal_projectile_sound"]
		return
	projectile_type = initial(projectile_type)
	projectile_sound = initial(projectile_sound)
	fire_rate_mod = initial(fire_rate_mod)
	no_shot_counter = initial(no_shot_counter)

/obj/machinery/power/emitter/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	locked = FALSE
	obj_flags |= EMAGGED
	balloon_alert(user, "ID-замок закоротило")
	return TRUE


/obj/machinery/power/emitter/prototype
	name = "прототип эмиттера"
	icon = 'icons/obj/weapons/turrets.dmi'
	icon_state = "protoemitter"
	base_icon_state = "protoemitter"
	icon_state_on = "protoemitter_+a"
	icon_state_underpowered = "protoemitter_+u"
	can_buckle = TRUE
	buckle_lying = 0
	///Sets the view size for the user
	var/view_range = 4.5
	///Grants the buckled mob the action button
	var/datum/action/innate/proto_emitter/firing/auto

//BUCKLE HOOKS

/obj/machinery/power/emitter/prototype/unbuckle_mob(mob/living/buckled_mob, force = FALSE, can_fall = TRUE)
	playsound(src,'sound/vehicles/mecha/mechmove01.ogg', 50, TRUE)
	manual = FALSE
	for(var/obj/item/item in buckled_mob.held_items)
		if(istype(item, /obj/item/turret_control))
			qdel(item)
	if(istype(buckled_mob))
		buckled_mob.pixel_x = buckled_mob.base_pixel_x
		buckled_mob.pixel_y = buckled_mob.base_pixel_y
		if(buckled_mob.client)
			buckled_mob.client.view_size.resetToDefault()
	auto.Remove(buckled_mob)
	. = ..()

/obj/machinery/power/emitter/prototype/user_buckle_mob(mob/living/buckled_mob, mob/user, check_loc = TRUE)
	if(user.incapacitated || !istype(user))
		return
	for(var/atom/movable/atom in get_turf(src))
		if(atom.density && (atom != src && atom != buckled_mob))
			return
	buckled_mob.forceMove(get_turf(src))
	..()
	playsound(src, 'sound/vehicles/mecha/mechmove01.ogg', 50, TRUE)
	buckled_mob.pixel_y = 14
	layer = 4.1
	if(buckled_mob.client)
		buckled_mob.client.view_size.setTo(view_range)
	if(!auto)
		auto = new()
	auto.Grant(buckled_mob, src)

/datum/action/innate/proto_emitter
	check_flags = AB_CHECK_HANDS_BLOCKED | AB_CHECK_CONSCIOUS | AB_CHECK_INCAPACITATED
	///Stores the emitter the user is currently buckled on
	var/obj/machinery/power/emitter/prototype/proto_emitter
	///Stores the mob instance that is buckled to the emitter
	var/mob/living/carbon/buckled_mob

/datum/action/innate/proto_emitter/Destroy()
	proto_emitter = null
	buckled_mob = null
	return ..()

/datum/action/innate/proto_emitter/Grant(mob/living/carbon/user, obj/machinery/power/emitter/prototype/proto)
	proto_emitter = proto
	buckled_mob = user
	. = ..()

/datum/action/innate/proto_emitter/firing
	name = "Переключиться на ручной огонь"
	desc = "Эмиттер будет стрелять только по вашей команде и по указанной цели"
	button_icon_state = "mech_zoom_on"

/datum/action/innate/proto_emitter/firing/Activate()
	if(proto_emitter.manual)
		playsound(proto_emitter,'sound/vehicles/mecha/mechmove01.ogg', 50, TRUE)
		proto_emitter.manual = FALSE
		name = "Переключиться на ручной огонь"
		desc = "Эмиттер будет стрелять только по вашей команде и по указанной цели"
		button_icon_state = "mech_zoom_on"
		for(var/obj/item/item in buckled_mob.held_items)
			if(istype(item, /obj/item/turret_control))
				qdel(item)
		build_all_button_icons()
		return
	playsound(proto_emitter,'sound/vehicles/mecha/mechmove01.ogg', 50, TRUE)
	name = "Переключиться на автоматический огонь"
	desc = "Эмиттер будет периодически стрелять по вашей последней цели"
	button_icon_state = "mech_zoom_off"
	proto_emitter.manual = TRUE
	for(var/things in buckled_mob.held_items)
		var/obj/item/item = things
		if(istype(item))
			if(!buckled_mob.dropItemToGround(item))
				continue
			var/obj/item/turret_control/turret_control = new /obj/item/turret_control()
			buckled_mob.put_in_hands(turret_control)
		else //Entries in the list should only ever be items or null, so if it's not an item, we can assume it's an empty hand
			var/obj/item/turret_control/turret_control = new /obj/item/turret_control()
			buckled_mob.put_in_hands(turret_control)
	build_all_button_icons()


/obj/item/turret_control
	name = "управление турелью"
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "offhand"
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT | NOBLUDGEON
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	///Ticks before being able to shoot
	var/delay = 0

/obj/item/turret_control/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, ABSTRACT_ITEM_TRAIT)

/obj/item/turret_control/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(HAS_TRAIT(interacting_with, TRAIT_COMBAT_MODE_SKIP_INTERACTION))
		return NONE
	return ranged_interact_with_atom(interacting_with, user, modifiers)

/obj/item/turret_control/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	var/obj/machinery/power/emitter/emitter = user.buckled
	emitter.setDir(get_dir(emitter, interacting_with))
	user.setDir(emitter.dir)
	switch(emitter.dir)
		if(NORTH)
			emitter.layer = 3.9
			user.pixel_x = 0
			user.pixel_y = -14
		if(NORTHEAST)
			emitter.layer = 3.9
			user.pixel_x = -8
			user.pixel_y = -12
		if(EAST)
			emitter.layer = 4.1
			user.pixel_x = -14
			user.pixel_y = 0
		if(SOUTHEAST)
			emitter.layer = 3.9
			user.pixel_x = -8
			user.pixel_y = 12
		if(SOUTH)
			emitter.layer = 4.1
			user.pixel_x = 0
			user.pixel_y = 14
		if(SOUTHWEST)
			emitter.layer = 3.9
			user.pixel_x = 8
			user.pixel_y = 12
		if(WEST)
			emitter.layer = 4.1
			user.pixel_x = 14
			user.pixel_y = 0
		if(NORTHWEST)
			emitter.layer = 3.9
			user.pixel_x = 8
			user.pixel_y = -12

	emitter.last_projectile_params = calculate_projectile_angle_and_pixel_offsets(user, null, list2params(modifiers))

	if(emitter.charge >= 10 && world.time > delay)
		emitter.charge -= 10
		emitter.fire_beam(user)
		delay = world.time + 10
	else if (emitter.charge < 10)
		playsound(src,'sound/machines/buzz/buzz-sigh.ogg', 50, TRUE)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/power/emitter/ctf
	name = "энергетическая пушка"
	active = TRUE
	active_power_usage = 0
	idle_power_usage = 0
	locked = TRUE
	req_access = list("science")
	welded = TRUE
	use_power = NO_POWER_USE

/obj/item/emitter_disk
	name = "\improper диодный диск: отладчик"
	desc = "Этот диск можно использовать на эмиттере с открытой панелью, чтобы сбросить его снаряд. Если его выдал не администратор, сообщите об этом на GitHub."
	icon = 'icons/obj/devices/floppy_disks.dmi'
	icon_state = "datadisk6"
	var/laser_color = COLOR_VIBRANT_LIME
	var/stored_proj = /obj/projectile/beam/emitter/hitscan
	var/stored_sound = 'sound/items/weapons/emitter.ogg'
	var/consumed_on_removal = TRUE
	var/consumable = TRUE
	var/fire_rate_mod = 1
	var/no_shot_counter = FALSE

/obj/item/emitter_disk/stamina
	name = "\improper диодный диск: электродизруптивный"
	desc = "Этот диск можно использовать на эмиттере с открытой панелью, чтобы он стрелял лазерами, повышающими целостность кристаллов суперматерии и истощающими живых существ. Диск будет израсходован."
	stored_proj = /obj/projectile/beam/emitter/hitscan/bluelens
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_TRUE_BLUE

/obj/item/emitter_disk/healing
	name = "\improper диодный диск: биорегенеративный"
	desc = "Этот диск можно установить в эмиттер с открытой панелью, чтобы он стрелял лазерами, исцеляющими физические повреждения живых существ."
	stored_proj = /obj/projectile/beam/emitter/hitscan/bioregen
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_YELLOW

/obj/item/emitter_disk/incendiary
	name = "\improper диодный диск: зажигательный"
	desc = "Этот диск можно использовать на эмиттере с открытой панелью, чтобы он стрелял лазерами, поджигающими живых существ."
	stored_proj = /obj/projectile/beam/emitter/hitscan/incend
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_RED_LIGHT


/obj/item/emitter_disk/sanity
	name = "\improper диодный диск: психосифонный"
	desc = "Этот диск можно использовать на эмиттере с открытой панелью, чтобы он стрелял лазерами, подавляющими живых существ и успокаивающими кристаллы суперматерии."
	stored_proj = /obj/projectile/beam/emitter/hitscan/psy
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_TONGUE_PINK


/obj/item/emitter_disk/magnetic
	name = "\improper диодный диск: магнитогенеративный"
	desc = "Этот диск можно использовать на эмиттере с открытой панелью, чтобы он стрелял лазерами, притягивающими ближайшие предметы."
	stored_proj = /obj/projectile/beam/emitter/hitscan/magnetic
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_SILVER

/obj/item/emitter_disk/blast
	name = "\improper диодный диск: гиперударный"
	desc = "Этот диск с фирменной прошивкой Синдиката можно использовать на эмиттере с открытой панелью, чтобы он стрелял лучами ударной силы, вызывающими небольшие взрывы."
	stored_proj = /obj/projectile/beam/emitter/hitscan/blast
	consumed_on_removal = FALSE
	consumable = FALSE
	laser_color = COLOR_SYNDIE_RED //magnetic is already grey
	fire_rate_mod = 2
