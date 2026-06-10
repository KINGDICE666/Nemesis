// Wheat
/obj/item/seeds/wheat
	name = "пакет семян пшеницы"
	desc = "Из них может вырасти пшеница. А может и нет."
	icon_state = "seed-wheat"
	species = "wheat"
	plantname = "Стебли пшеницы"
	product = /obj/item/food/grown/wheat
	production = 1
	yield = 4
	potency = 15
	instability = 20
	icon_dead = "wheat-dead"
	mutatelist = list(/obj/item/seeds/wheat/oat, /obj/item/seeds/wheat/meat)
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.12)

/obj/item/food/grown/wheat
	seed = /obj/item/seeds/wheat
	name = "пшеница"
	desc = "Колосья пшеницы."
	gender = PLURAL
	icon_state = "wheat"
	bite_consumption_mod = 0.5 // Chewing on wheat grains?
	foodtypes = GRAIN
	tastes = list("пшеница" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/beer
	slot_flags = ITEM_SLOT_MASK
	worn_icon = 'icons/mob/clothing/head/hydroponics.dmi'

/obj/item/food/grown/wheat/grind_results()
	return list(/datum/reagent/consumable/flour = 0)

// Oat
/obj/item/seeds/wheat/oat
	name = "пакет семян овса"
	desc = "Из них может вырасти овёс. А может и нет."
	icon_state = "seed-oat"
	species = "oat"
	plantname = "Стебли овса"
	product = /obj/item/food/grown/oat
	mutatelist = null

/obj/item/food/grown/oat
	seed = /obj/item/seeds/wheat/oat
	name = "овёс"
	desc = "Ешь овёс, держи рост."
	gender = PLURAL
	icon_state = "oat"
	bite_consumption_mod = 0.5
	foodtypes = GRAIN
	tastes = list("овёс" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/ale

/obj/item/food/grown/oat/grind_results()
	return list(/datum/reagent/consumable/flour = 0)

// Rice
/obj/item/seeds/wheat/rice
	name = "пакет семян риса"
	desc = "Из них может вырасти рис. А может и нет."
	icon_state = "seed-rice"
	species = "rice"
	plantname = "Стебли риса"
	instability = 1
	product = /obj/item/food/grown/rice
	mutatelist = null
	growthstages = 3
	genes = list(/datum/plant_gene/trait/semiaquatic)


/obj/item/food/grown/rice
	seed = /obj/item/seeds/wheat/rice
	name = "рис"
	desc = "Зёрна риса."
	gender = PLURAL
	icon_state = "rice"
	bite_consumption_mod = 0.5
	foodtypes = GRAIN
	tastes = list("рис" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/sake

/obj/item/food/grown/rice/grind_results()
	return list(/datum/reagent/consumable/rice = 0)

//Meatwheat - grows into synthetic meat
/obj/item/seeds/wheat/meat
	name = "пакет семян мясопшеницы"
	desc = "Если вы когда-нибудь хотели свести вегетарианца с ума, вот способ."
	icon_state = "seed-meatwheat"
	species = "meatwheat"
	plantname = "Мясопшеница"
	product = /obj/item/food/grown/meatwheat
	mutatelist = null

/obj/item/food/grown/meatwheat
	name = "мясопшеница"
	desc = "Пропитанные кровью стебли пшеницы. Если сильно прищуриться, их можно размять во что-то похожее на мясо."
	icon_state = "meatwheat"
	gender = PLURAL
	bite_consumption_mod = 0.5
	seed = /obj/item/seeds/wheat/meat
	foodtypes = MEAT
	tastes = list("мясопшеница" = 1)
	can_distill = FALSE
	slot_flags = ITEM_SLOT_MASK
	worn_icon = 'icons/mob/clothing/head/hydroponics.dmi'

/obj/item/food/grown/meatwheat/grind_results()
	return list(/datum/reagent/consumable/flour = 0, /datum/reagent/blood = 0)

/obj/item/food/grown/meatwheat/attack_self(mob/living/user)
	user.visible_message(span_notice("[user] разминает [src] в мясо."), span_notice("Вы разминаете [src] во что-то похожее на мясо."))
	playsound(user, 'sound/effects/blob/blobattack.ogg', 50, TRUE)
	var/obj/item/food/meat/slab/meatwheat/meaties = new(null)
	meaties.reagents.set_all_reagents_purity(seed.get_reagent_purity())
	qdel(src)
	user.put_in_hands(meaties)
	return TRUE
