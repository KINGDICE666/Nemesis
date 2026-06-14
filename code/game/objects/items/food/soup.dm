/obj/item/food/bowled
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'icons/obj/food/soupsalad.dmi'
	abstract_type = /obj/item/food/bowled
	bite_consumption = 5
	max_volume = 80
	foodtypes = NONE
	eatverbs = list("хлебает", "отпивает", "вдыхает", "пьёт")
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/bowled/make_germ_sensitive(mapload)
	return // It's in a bowl

/obj/item/food/bowled/wish
	name = "суп желаний"
	desc = "Хотелось бы, чтобы это был суп."
	icon_state = "wishsoup"
	food_reagents = list(/datum/reagent/water = 10)
	tastes = list("желания" = 1)
	trash_type = /obj/item/reagent_containers/cup/bowl

/obj/item/food/bowled/wish/Initialize(mapload)
	. = ..()
	if(prob(25))
		desc = "Желание сбылось!"
		reagents.add_reagent(/datum/reagent/consumable/nutriment, 9)
		reagents.add_reagent(/datum/reagent/consumable/nutriment/vitamin, 1)

/obj/item/food/bowled/mammi
	name = "мямми"
	desc = "Миска размякшего хлеба с молоком. Не слишком приятно напоминает о работе кишечника."
	icon_state = "mammi"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	foodtypes = SUGAR | DAIRY | JUNKFOOD | GRAIN
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/bowled/spacylibertyduff
	name = "космический либерти-дафф"
	desc = "Желейный десерт из кулинарной книги Альфреда Хаббарда."
	icon_state = "spacylibertyduff"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/drug/mushroomhallucinogen = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	trash_type = /obj/item/reagent_containers/cup/bowl

	tastes = list("желе" = 1, "гриб" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/bowled/amanitajelly
	name = "желе из мухомора"
	desc = "Выглядит подозрительно токсично."
	icon_state = "amanitajelly"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 7,
		/datum/reagent/drug/mushroomhallucinogen = 3,
		/datum/reagent/toxin/amatoxin = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	trash_type = /obj/item/reagent_containers/cup/bowl


	tastes = list("желе" = 1, "гриб" = 1)
	foodtypes = VEGETABLES | TOXIC
	crafting_complexity = FOOD_COMPLEXITY_2
