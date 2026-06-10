/obj/structure/closet/cabinet
	name = "шкафчик"
	desc = "Старина всегда будет в моде."
	icon_state = "cabinet"
	resistance_flags = FLAMMABLE
	open_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	close_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50
	max_integrity = 70
	door_anim_time = 0 // no animation
	material_drop = /obj/item/stack/sheet/mineral/wood
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT * 2)

/obj/structure/closet/acloset
	name = "странный шкаф"
	desc = "Выглядит инопланетным!"
	icon_state = "alien"
	material_drop = /obj/item/stack/sheet/mineral/abductor
	custom_materials = list(/datum/material/alloy/alien = SHEET_MATERIAL_AMOUNT * 2)

/obj/structure/closet/gimmick
	name = "административный шкаф снабжения"
	desc = "Шкаф для вещей, которым здесь явно не место."
	icon_state = "syndicate"

/obj/structure/closet/gimmick/russian
	name = "шкаф российских излишков"
	desc = "Шкаф для излишков российского стандартного снабжения."

/obj/structure/closet/gimmick/russian/PopulateContents()
	..()
	for(var/i in 1 to 5)
		new /obj/item/clothing/head/costume/ushanka(src)
	for(var/i in 1 to 5)
		new /obj/item/clothing/under/costume/soviet(src)

/obj/structure/closet/gimmick/tacticool
	name = "тактикульный шкаф снаряжения"
	desc = "Шкаф для тактикульного снаряжения."

/obj/structure/closet/gimmick/tacticool/PopulateContents()
	..()
	new /obj/item/clothing/glasses/eyepatch(src)
	new /obj/item/clothing/gloves/tackler/combat(src)
	new /obj/item/clothing/gloves/tackler/combat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/mod/control/pre_equipped/apocryphal(src)
	new /obj/item/mod/control/pre_equipped/apocryphal(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)

/obj/structure/closet/gimmick/tacticool/populate_contents_immediate()
	new /obj/item/clothing/glasses/sunglasses(src)

/obj/structure/closet/thunderdome
	name = "\improper шкаф Тандердома"
	desc = "Всё, что нужно!"
	anchored = TRUE

/obj/structure/closet/thunderdome/tdred
	name = "шкаф красной команды Тандердома"
	icon_door = "red"

/obj/structure/closet/thunderdome/tdred/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/red(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/baton/security/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdred/populate_contents_immediate()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser(src)

/obj/structure/closet/thunderdome/tdgreen
	name = "шкаф зелёной команды Тандердома"
	icon_door = "green"

/obj/structure/closet/thunderdome/tdgreen/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/green(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/baton/security/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdgreen/populate_contents_immediate()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser(src)

/obj/structure/closet/malf/suits
	desc = "Шкаф для оперативного снаряжения."
	icon_state = "syndicate"

/obj/structure/closet/malf/suits/PopulateContents()
	..()
	new /obj/item/tank/jetpack/void(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/head/helmet/space/nasavoid(src)
	new /obj/item/clothing/suit/space/nasavoid(src)
	new /obj/item/crowbar(src)
	new /obj/item/stock_parts/power_store/cell(src)
	new /obj/item/multitool(src)

/obj/structure/closet/mini_fridge
	name = "грязный мини-холодильник"
	desc = "Небольшое устройство, созданное, чтобы приятно охлаждать несколько напитков."
	icon_state = "mini_fridge"
	icon_welded = "welded_small"
	max_mob_size = MOB_SIZE_SMALL
	pass_flags = PASSTABLE
	anchored_tabletop_offset = 3
	anchored = 1
	storage_capacity = 10

/obj/structure/closet/mini_fridge/PopulateContents()
	. = ..()
	new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	if(prob(50))
		new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	if(prob(40))
		new /obj/item/reagent_containers/cup/glass/bottle/beer(src)

/obj/structure/closet/mini_fridge/grimy
	name = "грязный мини-холодильник"
	desc = "Небольшое устройство, созданное, чтобы приятно охлаждать несколько напитков. Впрочем, этот древний агрегат, похоже, нужен только тараканам для компании."

/obj/structure/closet/mini_fridge/grimy/PopulateContents()
	. = ..()
	if(prob(40))
		if(prob(50))
			new /obj/item/food/pizzaslice/moldy/bacteria(src)
		else
			new /obj/item/food/breadslice/moldy/bacteria(src)
	else if(prob(40))
		if(prob(50))
			new /obj/item/food/syndicake(src)
		else
			new /mob/living/basic/cockroach(src)
