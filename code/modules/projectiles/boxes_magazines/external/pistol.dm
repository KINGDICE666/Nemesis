
// Makarov (9mm) //

/obj/item/ammo_box/magazine/m9mm
	name = "пистолетный магазин (9 мм)"
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	desc = "Магазин для 9-мм пистолета, подходит к пистолету Макарова."
	ammo_band_icon = "+9x19ab"
	ammo_band_color = null
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 12
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m9mm/fire
	name = "пистолетный магазин (9 мм зажигательные)"
	MAGAZINE_TYPE_INCENDIARY
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/m9mm/hp
	name = "пистолетный магазин (9 мм экспансивные)"
	MAGAZINE_TYPE_HOLLOWPOINT
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/m9mm/ap
	name = "пистолетный магазин (9 мм бронебойные)"
	MAGAZINE_TYPE_ARMORPIERCE
	ammo_type = /obj/item/ammo_casing/c9mm/ap

// Stechkin APS (9mm) //

/obj/item/ammo_box/magazine/m9mm_aps
	name = "магазин пистолета Стечкина (9 мм)"
	desc = "Магазин для 9-мм пистолета, подходит к автоматическому пистолету Стечкина."
	icon_state = "9mmaps-15"
	base_icon_state = "9mmaps"
	ammo_band_icon = "+9mmapsab"
	ammo_band_color = null
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_aps/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 5)]"

/obj/item/ammo_box/magazine/m9mm_aps/fire
	name = "магазин пистолета Стечкина (9 мм зажигательные)"
	MAGAZINE_TYPE_INCENDIARY
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/m9mm_aps/hp
	name = "магазин пистолета Стечкина (9 мм экспансивные)"
	MAGAZINE_TYPE_HOLLOWPOINT
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/m9mm_aps/ap
	name = "магазин пистолета Стечкина (9 мм бронебойные)"
	MAGAZINE_TYPE_ARMORPIERCE
	ammo_type = /obj/item/ammo_casing/c9mm/ap

// Ansem (10mm) //

/obj/item/ammo_box/magazine/m10mm
	name = "пистолетный магазин (10 мм)"
	desc = "Магазин для 10-мм пистолета, подходит к пистолету Ansem."
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	ammo_band_icon = "+9x19ab"
	ammo_band_color = null

	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m10mm/fire
	name = "пистолетный магазин (10 мм зажигательные)"
	MAGAZINE_TYPE_INCENDIARY
	ammo_type = /obj/item/ammo_casing/c10mm/fire

/obj/item/ammo_box/magazine/m10mm/hp
	name = "пистолетный магазин (10 мм экспансивные)"
	MAGAZINE_TYPE_HOLLOWPOINT
	ammo_type = /obj/item/ammo_casing/c10mm/hp

/obj/item/ammo_box/magazine/m10mm/ap
	name = "пистолетный магазин (10 мм бронебойные)"
	MAGAZINE_TYPE_ARMORPIERCE
	ammo_type = /obj/item/ammo_casing/c10mm/ap

// Regal Condor (10mm) //

/obj/item/ammo_box/magazine/r10mm
	name = "магазин Regal Condor (10 мм Reaper)"
	desc = "Очень дорогой 10-мм пистолетный магазин для Regal Condor. Заряжен патронами \"reaper\", опасно эффективными против всего."
	icon_state = "r10mm-8"
	base_icon_state = "r10mm"
	ammo_type = /obj/item/ammo_casing/c10mm/reaper
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT * 10,
	)

// M1911 (.45) //

/obj/item/ammo_box/magazine/m45
	name = "пистолетный магазин (.45)"
	desc = "Пистолетный магазин калибра .45, подходит к M1911."
	icon_state = "45-8"
	base_icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

// Desert Eagle (.50 AE) //

/obj/item/ammo_box/magazine/m50
	name = "пистолетный магазин (.50 AE)"
	desc = "Пистолетный магазин калибра .50 AE, подходит к Desert Eagle."
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/a50ae
	caliber = CALIBER_50AE
	max_ammo = 7
	multiple_sprites = AMMO_BOX_PER_BULLET
