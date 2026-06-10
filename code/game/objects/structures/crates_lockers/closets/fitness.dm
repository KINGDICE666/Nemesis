/obj/structure/closet/athletic_mixed
	name = "спортивный гардероб"
	desc = "Шкаф для спортивной одежды."
	icon_door = "mixed"

/obj/structure/closet/athletic_mixed/PopulateContents()
	..()
	new /obj/item/clothing/under/shorts/purple(src)
	new /obj/item/clothing/under/shorts/grey(src)
	new /obj/item/clothing/under/shorts/black(src)
	new /obj/item/clothing/under/shorts/red(src)
	new /obj/item/clothing/under/shorts/blue(src)
	new /obj/item/clothing/under/shorts/green(src)
	new /obj/item/clothing/under/costume/jabroni(src)

/obj/structure/closet/boxinggloves
	name = "шкаф с боксёрскими перчатками"
	desc = "Шкаф для перчаток, используемых на боксёрском ринге."
	icon_door = "mixed"

/obj/structure/closet/boxinggloves/PopulateContents()
	..()
	new /obj/item/clothing/gloves/boxing/blue(src)
	new /obj/item/clothing/gloves/boxing/green(src)
	new /obj/item/clothing/gloves/boxing/yellow(src)
	new /obj/item/clothing/gloves/boxing(src)

/obj/structure/closet/masks
	name = "шкаф с масками"
	desc = "ШКАФ ДЛЯ БОЙЦОВСКИХ МАСОК, ОЛЕ!"

/obj/structure/closet/masks/PopulateContents()
	..()
	new /obj/item/clothing/mask/luchador(src)
	new /obj/item/clothing/mask/luchador/rudos(src)
	new /obj/item/clothing/mask/luchador/tecnicos(src)

/obj/structure/closet/lasertag/red
	name = "красное снаряжение для лазертага"
	desc = "Шкаф для снаряжения лазертага."
	icon_door = "red"
	icon_state = "rack"

/obj/structure/closet/lasertag/red/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser/redtag(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/redtag(src)
	new /obj/item/clothing/head/helmet/taghelm/red(src)


/obj/structure/closet/lasertag/blue
	name = "синее снаряжение для лазертага"
	desc = "Шкаф для снаряжения лазертага."
	icon_door = "blue"
	icon_state = "rack"

/obj/structure/closet/lasertag/blue/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser/bluetag(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/bluetag(src)
	new /obj/item/clothing/head/helmet/taghelm/blue(src)
