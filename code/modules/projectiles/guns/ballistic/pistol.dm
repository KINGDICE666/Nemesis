/obj/item/gun/ballistic/automatic/pistol
	name = "\improper пистолет Макарова"
	desc = "Небольшой 9-мм пистолет, который легко скрыть. Имеет резьбу на стволе для глушителей."
	icon_state = "pistol"
	w_class = WEIGHT_CLASS_SMALL
	accepted_magazine_type = /obj/item/ammo_box/magazine/m9mm
	can_suppress = TRUE
	burst_size = 1
	fire_delay = 0 SECONDS
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	fire_sound = 'sound/items/weapons/gun/pistol/shot.ogg'
	dry_fire_sound = 'sound/items/weapons/gun/pistol/dry_fire.ogg'
	suppressed_sound = 'sound/items/weapons/gun/pistol/shot_suppressed.ogg'
	load_sound = 'sound/items/weapons/gun/pistol/mag_insert.ogg'
	load_empty_sound = 'sound/items/weapons/gun/pistol/mag_insert.ogg'
	eject_sound = 'sound/items/weapons/gun/pistol/mag_release.ogg'
	eject_empty_sound = 'sound/items/weapons/gun/pistol/mag_release.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack_small.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/lock_small.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/drop_small.ogg'
	drop_sound = 'sound/items/handling/gun/ballistics/pistol/pistol_drop1.ogg'
	pickup_sound = 'sound/items/handling/gun/ballistics/pistol/pistol_pickup1.ogg'
	fire_sound_volume = 90
	bolt_wording = "slide"
	suppressor_x_offset = 10
	suppressor_y_offset = -1
	recoil_backtime_multiplier = 1

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/fire_mag
	spawn_magazine_type = /obj/item/ammo_box/magazine/m9mm/fire

/obj/item/gun/ballistic/automatic/pistol/contraband

/obj/item/gun/ballistic/automatic/pistol/contraband/Initialize(mapload)
	if(prob(10))
		pin = pick(
		list(
			/obj/item/firing_pin/clown,
			/obj/item/firing_pin/clown/ultra,
			/obj/item/firing_pin/clown/ultra/selfdestruct,
		))
	. = ..()
	pin.pin_removable = FALSE


/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)

/obj/item/gun/ballistic/automatic/pistol/clandestine
	name = "\improper пистолет Ansem"
	desc = "Духовный наследник Макарова, или кто-то просто уронил оружие в ведро краски. Использует патроны 10 мм."
	icon_state = "pistol_evil"
	accepted_magazine_type = /obj/item/ammo_box/magazine/m10mm
	empty_indicator = TRUE
	suppressor_x_offset = 12

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher
	name = "\improper пистолет Ansem/SC"
	desc = "Модифицированный вариант Ansem, духовного наследника Макарова, со встроенным глушителем и кнопкой на рукояти \
		для подствольного дезруптора, работающего аналогично отдельному SC/FISHER. Использует патроны 10 мм."
	desc_controls = "Правый клик - использовать подствольный дезруптор. Максимум два выстрела между самозарядками."
	icon_state = "pistol_evil_fisher"
	suppressed = SUPPRESSED_QUIET
	can_suppress = FALSE
	can_unsuppress = FALSE
	var/obj/item/gun/energy/recharge/fisher/underbarrel

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/energy/recharge/fisher(src)
	AddElement(/datum/element/examine_lore, \
		lore = "The Ansem/SC is a Scarborough Arms overhaul suite for their own Ansem handgun, designed for special operators who operate operationally, \
		especially against people who like using lightbulbs.<br>\
		<br>\
		The slide is chopped down, with the front half of the handgun featuring a monolithic integral suppressor built around the barrel, \
		and a compact kinetic light disruptor mounted underneath the barrel assembly. The integral suppressor is engineered to not affect \
		ballistic performance nor affect the concealability of the handgun, leading to a surprisingly robust firearm.<br>\
		<br>\
		Scarborough Arms has never actually addressed allegations of their involvement with the modification and/or manufacture \
		of the SC/FISHER or similar disruptor weapons. Prospective operators are reminded that kinetic light disruptors do not actually physically harm targets.<br>\
		<br>\
		Caveat emptor." \
	)

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher/try_fire_gun(atom/target, mob/living/user, params)
	if(LAZYACCESS(params2list(params), RIGHT_CLICK))
		underbarrel.try_fire_gun(target, user, params)
		return
	return ..()

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher/afterattack(atom/target, mob/user, list/modifiers, list/attack_modifiers)
	if(QDELETED(target))
		return
	var/obj/projectile/energy/fisher/melee/simulated_hit = new
	simulated_hit.firer = user
	simulated_hit.on_hit(target)

/obj/item/gun/ballistic/automatic/pistol/clandestine/fisher/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(.)
		return
	var/obj/projectile/energy/fisher/melee/simulated_hit = new
	simulated_hit.firer = throwingdatum?.get_thrower()
	simulated_hit.on_hit(hit_atom)

/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "\improper M1911"
	desc = "Классический пистолет калибра .45 с небольшим магазином."
	icon_state = "m1911"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/m45
	can_suppress = FALSE
	fire_sound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'

/**
 * Weak 1911 for syndicate chimps. It comes in a 4 TC kit.
 * 15 damage every.. second? 7 shots to kill. Not fast.
 */
/obj/item/gun/ballistic/automatic/pistol/m1911/chimpgun
	name = "\improper CH1M911"
	desc = "Для мобильного мафиози. Использует патроны .45 и отчетливо пахнет бананами."
	projectile_damage_multiplier = 0.5
	projectile_wound_bonus = -12
	pin = /obj/item/firing_pin/monkey


/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "\improper Desert Eagle"
	desc = "Надежный пистолет калибра .50 AE."
	icon_state = "deagle"
	force = 14
	accepted_magazine_type = /obj/item/ammo_box/magazine/m50
	can_suppress = FALSE
	mag_display = TRUE
	fire_sound = 'sound/items/weapons/gun/rifle/shot.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'

/obj/item/gun/ballistic/automatic/pistol/deagle/contraband

/obj/item/gun/ballistic/automatic/pistol/deagle/contraband/Initialize(mapload)
	if(prob(10))
		pin = pick(
		list(
			/obj/item/firing_pin/clown,
			/obj/item/firing_pin/clown/ultra,
			/obj/item/firing_pin/clown/ultra/selfdestruct,
		))
	. = ..()
	pin.pin_removable = FALSE

/obj/item/gun/ballistic/automatic/pistol/deagle/gold
	desc = "Позолоченный Desert Eagle, миллион раз перекованный превосходными марсианскими оружейниками. Использует патроны .50 AE."
	icon_state = "deagleg"
	inhand_icon_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/deagle/camo
	desc = "Фирменный Deagle для оперативников, работающих оперативно. Использует патроны .50 AE."
	icon_state = "deaglecamo"
	inhand_icon_state = "deagleg"

/obj/item/gun/ballistic/automatic/pistol/deagle/regal
	name = "\improper Regal Condor"
	desc = "В отличие от Desert Eagle, это оружие использует продвинутую внутреннюю систему стабилизации, значительно \
		снижающую отдачу и повышающую точность ценой меньшего калибра. \
		Это позволяет вести очень быструю очередь по 2 выстрела. Использует патроны 10 мм."
	icon_state = "reagle"
	inhand_icon_state = "deagleg"
	burst_size = 2
	burst_delay = 1
	projectile_damage_multiplier = 1.25
	accepted_magazine_type = /obj/item/ammo_box/magazine/r10mm
	actions_types = list(/datum/action/item_action/toggle_firemode)
	obj_flags = UNIQUE_RENAME // if you did the sidequest, you get the customization
	custom_materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT * 30, /datum/material/silver = SHEET_MATERIAL_AMOUNT * 25, /datum/material/iron = SHEET_MATERIAL_AMOUNT * 11.5, /datum/material/telecrystal = SHEET_MATERIAL_AMOUNT * 4)

/obj/item/gun/ballistic/automatic/pistol/aps
	name = "\improper автоматический пистолет Стечкина"
	desc = "Старый советский автоматический пистолет. Стреляет быстро, но лягается как мул. Использует патроны 9 мм. Имеет резьбу на стволе для глушителей."
	icon_state = "aps"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/m9mm_aps
	can_suppress = TRUE
	burst_size = 3
	burst_delay = 1
	spread = 10
	actions_types = list(/datum/action/item_action/toggle_firemode)
	suppressor_x_offset = 6

/obj/item/gun/ballistic/automatic/pistol/stickman
	name = "плоский пистолет"
	desc = "Двухмерный пистолет... что?"
	icon_state = "flatgun"
	mag_display = FALSE
	show_bolt_icon = FALSE

/obj/item/gun/ballistic/automatic/pistol/stickman/equipped(mob/user, slot)
	..()
	to_chat(user, span_notice("Когда вы пытаетесь управиться с [src], он выскальзывает из рук..."))
	if(prob(50))
		to_chat(user, span_notice("...и исчезает из поля зрения! Куда он делся?"))
		qdel(src)
		user.update_icons()
	else
		to_chat(user, span_notice("...и снова появляется. Фух, пронесло."))
		user.dropItemToGround(src)

#define DOORHICKEY_GUN_MIN_DAMAGE 70
#define DOORHICKEY_GUN_MAX_DAMAGE 140

/obj/item/gun/ballistic/automatic/pistol/doorhickey
	name = "\improper Liberator"
	desc = "Плохо сделанное 3D-печатное \"оружие\", способное выстрелить только один раз. Широко известно в секторе Спинвард \
		после случая, когда 3 ассистента погибли от осколков такого устройства при попытке выстрелить в мышь."
	icon_state = "doorhickey"
	custom_materials = list(/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 2)
	bolt_type = BOLT_TYPE_NO_BOLT
	internal_magazine = TRUE
	casing_ejector = FALSE
	force = 10
	max_integrity = 100
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/doorhickey
	can_suppress = FALSE
	semi_auto = FALSE
	show_bolt_icon = FALSE
	projectile_damage_multiplier = 0.5
	spread = 10

/obj/item/gun/ballistic/automatic/pistol/doorhickey/unload_ammo(mob/living/user, forced = FALSE)
	if (forced)
		return ..()

	balloon_alert(user, "откручиваем ствол...")
	playsound(user, 'sound/items/tools/screwdriver_operating.ogg', 75, FALSE, MEDIUM_RANGE_SOUND_EXTRARANGE)
	if (!do_after(user, 2 SECONDS, src))
		balloon_alert(user, "прервано!")
		return
	. = ..()

/obj/item/gun/ballistic/automatic/pistol/doorhickey/load_gun(obj/item/ammo, mob/living/user)
	. = ..()
	if (!.)
		return

	balloon_alert(user, "прикручиваем ствол...")
	playsound(user, 'sound/items/tools/screwdriver_operating.ogg', 75, FALSE, MEDIUM_RANGE_SOUND_EXTRARANGE)
	if (do_after(user, 2 SECONDS, src))
		return TRUE

	balloon_alert(user, "прервано!")
	unload_ammo(user, forced = TRUE)
	return FALSE

/obj/item/gun/ballistic/automatic/pistol/doorhickey/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	var/dmg_multiplier = 1

	if (get_dist(target, user) <= 1)
		dmg_multiplier *= 2

	if (isliving(target))
		var/mob/living/victim = target
		var/datum/status_effect/grouped/heldup/gunpoint = victim.has_status_effect(/datum/status_effect/grouped/heldup)
		if (gunpoint)
			for (var/datum/weakref/pointer_ref as anything in gunpoint.sources)
				if (pointer_ref.resolve() == user)
					dmg_multiplier *= 1.5 // Caps at 60 damage
					break

	projectile_damage_multiplier *= dmg_multiplier
	. = ..()
	projectile_damage_multiplier /= dmg_multiplier

/obj/item/gun/ballistic/automatic/pistol/doorhickey/shoot_live_shot(mob/living/user, pointblank = FALSE, atom/pbtarget = null, message = TRUE)
	. = ..()
	if (!.)
		return

	var/damage_to_take = rand(DOORHICKEY_GUN_MIN_DAMAGE, DOORHICKEY_GUN_MAX_DAMAGE)
	if (atom_integrity > damage_to_take)
		take_damage(damage_to_take)
		return

	playsound(loc, SFX_SHATTER, 75, TRUE)
	if (loc != user)
		take_damage(damage_to_take)
		return

	var/shrapnel_bomb = FALSE
	var/obj/item/bodypart/arm/poor_sod = user.get_active_hand()
	if (prob(damage_to_take - atom_integrity) && poor_sod)
		shrapnel_bomb = TRUE

	user.visible_message(span_danger("[src] разлетается на мелкие куски[shrapnel_bomb ? ", один из них впивается в [user.parse_zone_with_bodypart(poor_sod.body_zone)] [user]" : ""]!"),
		span_userdanger("[src] разлетается на мелкие куски[shrapnel_bomb ? ", один из них впивается в ваш [poor_sod]!" : ""]!"),
		span_hear("Вы слышите треск ломающегося пластика."))

	if (poor_sod)
		poor_sod.receive_damage((damage_to_take - atom_integrity) * 0.5, wound_bonus = -10, exposed_wound_bonus = 20, sharpness = SHARP_EDGED, damage_source = src)
	else
		user.take_bodypart_damage((damage_to_take - atom_integrity) * 0.5, wound_bonus = -10, exposed_wound_bonus = 20, sharpness = SHARP_EDGED)

	if (shrapnel_bomb)
		var/obj/item/shrapnel/plastic/shrapnel = new(user.loc)
		if (!shrapnel.force_embed(user, poor_sod))
			qdel(shrapnel)
		else if(!HAS_TRAIT(user, TRAIT_ANALGESIA))
			user.emote("scream")

	new /obj/effect/decal/cleanable/plastic(get_turf(src))
	take_damage(damage_to_take)

/obj/item/disk/design_disk/liberator
	name = "диск нелегального чертежа для 3D-принтера"

/obj/item/disk/design_disk/liberator/Initialize(mapload)
	. = ..()
	blueprints += new /datum/design/liberator_gun

#undef DOORHICKEY_GUN_MIN_DAMAGE
#undef DOORHICKEY_GUN_MAX_DAMAGE
