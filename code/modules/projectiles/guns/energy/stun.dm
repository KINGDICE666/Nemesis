/obj/item/gun/energy/taser
	name = "тазер"
	desc = "Энергетическое оглушающее оружие небольшой емкости, используемое службой безопасности для задержания целей на расстоянии."
	icon_state = "taser"
	inhand_icon_state = null //so the human update icon uses the icon_state instead.
	light_color = LIGHT_COLOR_DIM_YELLOW
	ammo_type = list(/obj/item/ammo_casing/energy/electrode)
	ammo_x_offset = 3

/obj/item/gun/energy/e_gun/advtaser
	name = "гибридный тазер"
	desc = "Двухрежимный тазер, способный стрелять мощными электродами ближней дистанции и дальнобойными лучами дизейблера."
	icon_state = "advtaser"
	ammo_type = list(/obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/disabler)
	ammo_x_offset = 2

/obj/item/gun/energy/e_gun/advtaser/cyborg
	name = "тазер киборга"
	desc = "Встроенный гибридный тазер, питающийся напрямую от батареи киборга. Ограничитель не дает батарее перегреваться."
	can_charge = FALSE
	use_cyborg_cell = TRUE

/obj/item/gun/energy/e_gun/advtaser/cyborg/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)

/obj/item/gun/energy/e_gun/advtaser/cyborg/add_seclight_point()
	return

/obj/item/gun/energy/disabler
	name = "дизейблер"
	desc = "Оружие самообороны, истощающее органические цели и ослабляющее их до падения."
	icon_state = "disabler"
	inhand_icon_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/disabler)
	ammo_x_offset = 2

/obj/item/gun/energy/disabler/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 15, \
		overlay_y = 10)

/obj/item/gun/energy/disabler/smg
	name = "дизейблер-пистолет-пулемет"
	desc = "Автоматический вариант дизейблера с повышенной емкостью, но немного сниженной эффективностью луча."
	icon_state = "disabler_smg"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smg)
	shaded_charge = 1

/obj/item/gun/energy/disabler/smg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS, allow_akimbo = FALSE)

/obj/item/gun/energy/disabler/add_seclight_point()
	AddComponent(\
		/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 15, \
		overlay_y = 13, \
	)

/obj/item/gun/energy/disabler/cyborg
	name = "дизейблер киборга"
	desc = "Встроенный дизейблер, питающийся от батареи киборга. Ограничитель не дает батарее перегреваться."
	can_charge = FALSE
	use_cyborg_cell = TRUE

/obj/item/gun/energy/disabler/cyborg/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)
