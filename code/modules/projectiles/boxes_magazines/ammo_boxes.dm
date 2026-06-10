/obj/item/ammo_box/c9mm
	name = "коробка патронов (9 мм)"
	icon_state = "9mmbox"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 30

/obj/item/ammo_box/c10mm
	name = "коробка патронов (10 мм)"
	icon_state = "10mmbox"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 20

/obj/item/ammo_box/c45
	name = "коробка патронов (.45)"
	icon_state = "45box"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 20

/obj/item/ammo_box/a40mm
	name = "коробка боеприпасов (40-мм гранаты)"
	icon_state = "40mm"
	ammo_type = /obj/item/ammo_casing/a40mm
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/a40mm/rubber
	name = "коробка боеприпасов (40-мм резиновая шайба)"
	ammo_type = /obj/item/ammo_casing/a40mm/rubber

/obj/item/ammo_box/a40mm/flak
	name = "коробка боеприпасов (40-мм титановая шрапнель)"
	ammo_type = /obj/item/ammo_casing/a40mm/flak

/obj/item/ammo_box/a40mm/incendiary
	name = "коробка боеприпасов (40-мм зажигательная граната)"
	ammo_type = /obj/item/ammo_casing/a40mm/incendiary

/obj/item/ammo_box/a40mm/tear_gas
	name = "коробка боеприпасов (40-мм газовая граната)"
	ammo_type = /obj/item/ammo_casing/a40mm/tear_gas

/obj/item/ammo_box/rocket
	name = "связка ракет (84 мм фугасные)"
	icon_state = "rocketbundle"
	ammo_type = /obj/item/ammo_casing/rocket
	max_ammo = 3
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/rocket/can_load(mob/user)
	return FALSE

/obj/item/ammo_box/n762
	name = "коробка патронов (7.62x38mmR)"
	icon_state = "10mmbox"
	ammo_type = /obj/item/ammo_casing/n762
	max_ammo = 14

/obj/item/ammo_box/foambox
	name = "коробка патронов (пенные дротики)"
	icon = 'icons/obj/weapons/guns/toy.dmi'
	icon_state = "foambox"
	ammo_type = /obj/item/ammo_casing/foam_dart
	max_ammo = 40
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*5)

/obj/item/ammo_box/foambox/mini
	icon_state = "foambox_mini"
	max_ammo = 20
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*2.5)

/obj/item/ammo_box/foambox/riot
	icon_state = "foambox_riot"
	ammo_type = /obj/item/ammo_casing/foam_dart/riot
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*25)

/obj/item/ammo_box/foambox/riot/mini
	icon_state = "foambox_riot_mini"
	max_ammo = 20
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*12.5)
