///spaghetti prototype used by all subtypes
/obj/item/food/spaghetti
	icon = 'icons/obj/food/spaghetti.dmi'
	abstract_type = /obj/item/food/spaghetti
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

// Why are you putting cooked spaghetti in your pockets?
/obj/item/food/spaghetti/make_microwaveable()
	var/list/display_message = list(
		span_notice("Что-то влажное выпадает из кармана и падает на пол. Это... [name]?"),
		span_warning("Вот чёрт! Вся ваша карманная [name] выпала!"))
	AddComponent(/datum/component/spill, display_message, 'sound/effects/splat.ogg', /datum/memory/lost_spaghetti)

	return ..()

/obj/item/food/spaghetti/raw
	name = "спагетти"
	desc = "Вот это славная паста!"
	icon_state = "spaghetti"
	tastes = list("паста" = 1)
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spaghetti/raw/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/spaghetti/boiledspaghetti, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/spaghetti/raw/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/spaghetti/boiledspaghetti)

/obj/item/food/spaghetti/boiledspaghetti
	name = "варёные спагетти"
	desc = "Простое блюдо из лапши, ему нужно больше ингредиентов."
	icon_state = "spaghettiboiled"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spaghetti/boiledspaghetti/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, null, CUSTOM_INGREDIENT_ICON_SCATTER, max_ingredients = 6)

/obj/item/food/spaghetti/pastatomato
	name = "спагетти"
	desc = "Спагетти и давленые томаты. Совсем как готовил ваш жестокий отец!"
	icon_state = "pastatomato"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("паста" = 1, "томат" = 1)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/pastatomato/soulful
	name = "душевная еда"
	desc = "Именно так, как готовила мама."
	food_reagents = list(
		// same as normal pasghetti
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		// where the soul comes from
		/datum/reagent/pax = 5,
		/datum/reagent/medicine/psicodine = 10,
		/datum/reagent/medicine/morphine = 5,
	)
	tastes = list("ностальгия" = 1, "счастье" = 1)

/obj/item/food/spaghetti/copypasta
	name = "копипаста"
	desc = "Вам, наверное, не стоит это пробовать: все только и говорят, насколько она плоха..."
	icon_state = "copypasta"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/tomatojuice = 20,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("паста" = 1, "томат" = 1)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/meatballspaghetti
	name = "спагетти с фрикадельками"
	desc = "Вот это славная фрикаделька!"
	icon_state = "meatballspaghetti"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("паста" = 1, "мясо" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/spesslaw
	name = "космозакон"
	desc = "Любимое блюдо юристов."
	icon_state = "spesslaw"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("паста" = 1, "мясо" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/spaghetti/chowmein
	name = "чау-мейн"
	desc = "Приятная смесь лапши и жареных овощей."
	icon_state = "chowmein"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("лапша" = 1, "мясо" = 1, "жареные овощи" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/beefnoodle
	name = "говяжья лапша"
	desc = "Питательная, мясная и лапшичная."
	icon_state = "beefnoodle"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/liquidgibs = 3,
	)
	tastes = list("лапша" = 1, "мясо" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/butternoodles
	name = "лапша с маслом"
	desc = "Лапша, покрытая ароматным маслом. Простая и скользкая, но вкусная."
	icon_state = "butternoodles"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("лапша" = 1, "масло" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/mac_n_cheese
	name = "макароны с сыром"
	desc = "Приготовлены правильно, только с лучшим сыром и панировочными сухарями. И всё же это не заменит Ready-Donk."
	icon_state = "mac_n_cheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("сыр" = 1, "панировочные сухари" = 1, "паста" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/shoyu_tonkotsu_ramen
	name = "сёю тонкоцу рамен"
	desc = "Простой рамен из мяса, яйца, лука и листа водорослей."
	icon_state = "shoyu_tonkotsu_ramen"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("лапша" = 5, "мясо" = 3, "яйцо" = 4, "сушёные водоросли" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES | EGG
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/kitakata_ramen
	name = "китаката рамен"
	desc = "Сытный рамен из мяса, грибов, лука и чеснока. Часто дают больным для утешения."
	icon_state = "kitakata_ramen"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("лапша" = 5, "мясо" = 4, "грибы" = 3, "лук" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/kitsune_udon
	name = "кицунэ удон"
	desc = "Вегетарианский удон с жареным тофу и луком, сладко-солёный благодаря сахару и соевому соусу. Название пришло из старой сказки о лисе, любившей жареный тофу."
	icon_state = "kitsune_udon"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("лапша" = 5, "тофу" = 4, "сахар" = 3, "соевый соус" = 2)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/nikujaga
	name = "нику-дзяга"
	desc = "Приятное японское рагу из лапши, лука, картофеля, мяса и овощной смеси."
	icon_state = "nikujaga"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("лапша" = 5, "мясо" = 4, "картофель" = 3, "лук" = 2, "овощная смесь" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/pho
	name = "фо"
	desc = "Вьетнамское блюдо из лапши, овощей, трав и мяса. Очень популярная уличная еда."
	icon_state = "pho"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("лапша" = 5, "мясо" = 4, "капуста" = 3, "лук" = 2, "травы" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/pad_thai
	name = "пад-тай"
	desc = "Популярное в Таиланде блюдо из жареной лапши с арахисом, тофу, лаймом и луком."
	icon_state = "pad_thai"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("лапша" = 5, "жареный тофу" = 4, "лайм" = 2, "арахис" = 3, "лук" = 2)
	foodtypes = GRAIN | VEGETABLES | NUTS | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/carbonara
	name = "спагетти карбонара"
	desc = "Шёлковые яйца, хрустящая свинина, сырное блаженство. Mamma mia!"
	icon_state = "carbonara"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("спагетти" = 1, "пармиджано реджано" = 1,  "гуанчале" = 1)
	foodtypes = GRAIN | MEAT | DAIRY | EGG
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/carbonara/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/love_food_buff, /datum/status_effect/food/speech/italian)
