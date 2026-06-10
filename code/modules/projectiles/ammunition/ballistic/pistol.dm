// 10mm

/obj/item/ammo_casing/c10mm
	name = "10-мм гильза"
	desc = "Гильза от 10-мм патрона."
	caliber = CALIBER_10MM
	projectile_type = /obj/projectile/bullet/c10mm
	newtonian_force = 0.75

/obj/item/ammo_casing/c10mm/ap
	name = "10-мм бронебойная гильза"
	desc = "Гильза от 10-мм бронебойного патрона."
	projectile_type = /obj/projectile/bullet/c10mm/ap

/obj/item/ammo_casing/c10mm/hp
	name = "10-мм экспансивная гильза"
	desc = "Гильза от 10-мм экспансивного патрона."
	projectile_type = /obj/projectile/bullet/c10mm/hp

/obj/item/ammo_casing/c10mm/fire
	name = "10-мм зажигательная гильза"
	desc = "Гильза от 10-мм зажигательного патрона."
	projectile_type = /obj/projectile/bullet/incendiary/c10mm

/obj/item/ammo_casing/c10mm/reaper
	name = "10-мм гильза reaper"
	desc = "Гильза от 10-мм патрона reaper."
	projectile_type = /obj/projectile/bullet/c10mm/reaper

// 9mm (Makarov, Stechkin APS)

/obj/item/ammo_casing/c9mm
	name = "9-мм гильза"
	desc = "Гильза от 9-мм патрона."
	caliber = CALIBER_9MM
	projectile_type = /obj/projectile/bullet/c9mm
	newtonian_force = 0.75

/obj/item/ammo_casing/c9mm/ap
	name = "9-мм бронебойная гильза"
	desc = "Гильза от 9-мм бронебойного патрона."
	projectile_type =/obj/projectile/bullet/c9mm/ap

/obj/item/ammo_casing/c9mm/hp
	name = "9-мм экспансивная гильза"
	desc = "Гильза от 9-мм экспансивного патрона."
	projectile_type = /obj/projectile/bullet/c9mm/hp

/obj/item/ammo_casing/c9mm/fire
	name = "9-мм зажигательная гильза"
	desc = "Гильза от 9-мм зажигательного патрона."
	projectile_type = /obj/projectile/bullet/incendiary/c9mm

// .50AE (Desert Eagle)

/obj/item/ammo_casing/a50ae
	name = "гильза .50 AE"
	desc = "Гильза от патрона .50 AE."
	caliber = CALIBER_50AE
	projectile_type = /obj/projectile/bullet/a50ae

// .160 Smart (Abielle smartgun)

/obj/item/ammo_casing/c160smart
	name = "гильза умного патрона .160"
	desc = "Умный патрон .160 с небольшим зарядом ускоряющего топлива в донце."
	icon_state = "smartgun_casing"
	caliber = CALIBER_160SMART
	projectile_type = /obj/projectile/bullet/c160smart
	/// How many tiles away should we check for smart auto-locking
	var/auto_lock_range = 2

/obj/item/ammo_casing/c160smart/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/c160smart/ready_proj(atom/target, mob/living/user, quiet, zone_override, atom/fired_from)
	. = ..()
	if(!isturf(target))
		loaded_projectile.set_homing_target(target)
		new /obj/effect/temp_visual/smartgun_target(get_turf(target))
	else
		var/atom/aimbot_target = locate(/mob/living) in range(auto_lock_range, target)
		if(aimbot_target)
			loaded_projectile.set_homing_target(aimbot_target)
			new /obj/effect/temp_visual/smartgun_target(get_turf(aimbot_target))

/obj/effect/temp_visual/smartgun_target
	name = "прицельная метка умного оружия"
	desc = "Голографический прицел, который, вероятно, означает, что пора бежать."
	icon_state = "launchpad_pull"
	duration = 0.25 SECONDS
