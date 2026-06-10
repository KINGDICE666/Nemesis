
/obj/item/storage/belt/holster
	name = "плечевая кобура"
	desc = "Довольно простая, но все еще круто выглядящая кобура для пистолета."
	icon_state = "holster"
	inhand_icon_state = "holster"
	worn_icon_state = "holster"
	alternate_worn_layer = UNDER_SUIT_LAYER
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/holster

/obj/item/storage/belt/holster/equipped(mob/user, slot)
	. = ..()
	if(slot & (ITEM_SLOT_BELT|ITEM_SLOT_SUITSTORE))
		ADD_CLOTHING_TRAIT(user, TRAIT_GUNFLIP)

/obj/item/storage/belt/holster/dropped(mob/user)
	. = ..()
	REMOVE_CLOTHING_TRAIT(user, TRAIT_GUNFLIP)

/obj/item/storage/belt/holster/energy
	name = "плечевые кобуры для энергооружия"
	desc = "Довольно простая пара плечевых кобур с изолирующей подкладкой внутри. Предназначены для энергетического оружия."
	storage_type = /datum/storage/holster/energy

/obj/item/storage/belt/holster/energy/thermal
	name = "плечевые кобуры для термального оружия"
	desc = "Довольно простая пара плечевых кобур с изолирующей подкладкой внутри. Рассчитаны на пару термальных пистолетов, но подходят и для некоторых других энергетических пистолетов."

/obj/item/storage/belt/holster/energy/thermal/PopulateContents()
	generate_items_inside(list(
		/obj/item/gun/energy/laser/thermal/inferno = 1,
		/obj/item/gun/energy/laser/thermal/cryo = 1,
	),src)

/obj/item/storage/belt/holster/energy/disabler
	desc = "Довольно простая пара плечевых кобур с изолирующей подкладкой внутри. Предназначены для энергетического оружия. Производственный штамп указывает, что они поставлялись с дизейблером."

/obj/item/storage/belt/holster/energy/disabler/PopulateContents()
	new /obj/item/gun/energy/disabler(src)

/obj/item/storage/belt/holster/energy/laser_pistol
	desc = "Довольно простая пара плечевых кобур с изолирующей подкладкой внутри. Предназначены для энергетического оружия. Производственный штамп указывает, что они поставлялись с лазерным пистолетом Type 5C."

/obj/item/storage/belt/holster/energy/laser_pistol/PopulateContents()
	new /obj/item/gun/energy/laser/pistol(src)

/obj/item/storage/belt/holster/energy/smoothbore
	desc = "Довольно простая пара плечевых кобур с изолирующей подкладкой внутри. Предназначены для энергетического оружия. Похоже, рассчитаны на два гладкоствольных образца."

/obj/item/storage/belt/holster/energy/smoothbore/PopulateContents()
	generate_items_inside(list(
		/obj/item/gun/energy/disabler/smoothbore = 2,
	),src)

/obj/item/storage/belt/holster/detective
	name = "кобура детектива"
	desc = "Кобура для пистолетов и небольшого запаса боеприпасов. ВНИМАНИЕ: только для крутых."
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/holster/detective

/obj/item/storage/belt/holster/detective/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/speedloader/c38 = 2,
		/obj/item/gun/ballistic/revolver/c38/detective = 1,
	), src)

/obj/item/storage/belt/holster/detective/full/ert
	name = "кобура морпеха"
	desc = "С ней вы чувствуете себя круче, но подозреваете, что это просто перекрашенная кобура детектива из излишков NT."
	icon_state = "syndicate_holster"
	inhand_icon_state = "syndicate_holster"
	worn_icon_state = "syndicate_holster"

/obj/item/storage/belt/holster/detective/full/ert/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/m45 = 2,
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
	),src)

/obj/item/storage/belt/holster/chameleon
	name = "кобура Синдиката"
	desc = "Набедренная кобура с хамелеон-технологией для маскировки. Из-за дополнительной электроники ее нельзя закрепить на броне."
	icon_state = "syndicate_holster"
	inhand_icon_state = "syndicate_holster"
	worn_icon_state = "syndicate_holster"
	w_class = WEIGHT_CLASS_NORMAL
	actions_types = list(/datum/action/item_action/chameleon/change/belt)
	storage_type = /datum/storage/holster/chameleon

/obj/item/storage/belt/holster/nukie
	name = "кобура оперативника"
	desc = "Глубокая плечевая кобура, способная вместить почти любое огнестрельное оружие и боеприпасы к нему."
	icon_state = "syndicate_holster"
	inhand_icon_state = "syndicate_holster"
	worn_icon_state = "syndicate_holster"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/holster/nukie

/obj/item/storage/belt/holster/nukie/cowboy
	desc = "Глубокая плечевая кобура, способная вместить почти любое малое огнестрельное оружие и боеприпасы к нему. Эта версия специализируется на пистолетах."
	storage_type = /datum/storage/holster/nukie/cowboy

/obj/item/storage/belt/holster/nukie/cowboy/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/speedloader/c357 = 2,
		/obj/item/gun/ballistic/revolver/cowboy/nuclear = 1,
	), src)
