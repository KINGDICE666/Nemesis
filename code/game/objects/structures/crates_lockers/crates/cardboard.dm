/obj/structure/closet/crate/cardboard
	name = "картонная коробка"
	desc = "Коробка, в которую можно класть вещи. Революционно, знаю."
	material_drop = /obj/item/stack/sheet/cardboard
	material_drop_amount = 4
	custom_materials = list(/datum/material/cardboard = SHEET_MATERIAL_AMOUNT * 4)
	icon_state = "cardboard"
	base_icon_state = "cardboard"
	open_sound = 'sound/items/poster/poster_ripped.ogg'
	close_sound = 'sound/machines/cardboard_box.ogg'
	open_sound_volume = 25
	close_sound_volume = 25
	paint_jobs = null
	cutting_tool = /obj/item/wirecutters
	can_weld_shut = FALSE
	lid_icon_state = "cardboardopen"

/obj/structure/closet/crate/cardboard/mothic
	name = "\improper коробка Мотического флота"
	desc = "Вероятно, для хранения ниан."
	icon_state = "cardboard_moth"
	base_icon_state = "cardboard_moth"

/obj/structure/closet/crate/cardboard/tiziran
	name = "\improper транспортная коробка Тизирана"
	desc = "Вероятно, для хранения ящеров."
	icon_state = "cardboard_tiziran"
	base_icon_state = "cardboard_tiziran"

/obj/structure/closet/crate/cardboard/update_icon_state()
	. = ..()
	if(opened)
		icon_state = "[base_icon_state]"
