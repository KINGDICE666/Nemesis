//this category is very little but I think that it has great potential to grow
////////////////////////////////////////////SALAD////////////////////////////////////////////
/obj/item/food/salad
	icon = 'icons/obj/food/soupsalad.dmi'
	abstract_type = /obj/item/food/salad
	trash_type = /obj/item/reagent_containers/cup/bowl
	bite_consumption = 3
	w_class = WEIGHT_CLASS_NORMAL
	food_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("листья" = 1)
	foodtypes = VEGETABLES
	eatverbs = list("devour", "nibble", "gnaw", "gobble", "chomp") //who the fuck gnaws and devours on a salad
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/salad/aesirsalad
	name = "\improper салат Асов"
	desc = "Вероятно, слишком невероятен, чтобы смертные могли полностью им насладиться."
	icon_state = "aesirsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 12)
	tastes = list("листья" = 1)
	foodtypes = VEGETABLES | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/herbsalad
	name = "травяной салат"
	desc = "Вкусный салат с яблоками сверху."
	icon_state = "herbsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("листья" = 1, "яблоко" = 1)
	foodtypes = VEGETABLES | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/salad/validsalad
	name = "валидный салат"
	desc = "Это просто травяной салат с фрикадельками и жареными ломтиками картофеля. Ничего подозрительного."
	icon_state = "validsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/doctor_delight = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("листья" = 1, "картофель" = 1, "мясо" = 1, "валидхантинг" = 1)
	foodtypes = VEGETABLES | MEAT | FRIED
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/salad/fruit
	name = "фруктовый салат"
	desc = "Ваш стандартный фруктовый салат."
	icon_state = "fruitsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("фрукты" = 1)
	foodtypes = FRUIT|ORANGES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/jungle
	name = "салат джунглей"
	desc = "Экзотические фрукты в миске."
	icon_state = "junglesalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 11, /datum/reagent/consumable/banana = 5, /datum/reagent/consumable/nutriment/vitamin = 7)
	tastes = list("фрукты" = 1, "джунгли" = 1)
	foodtypes = FRUIT
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/citrusdelight
	name = "цитрусовое наслаждение"
	desc = "Цитрусовая перегрузка!"
	icon_state = "citrusdelight"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 7,
	)
	tastes = list("кислота" = 1, "листья" = 1)
	foodtypes = FRUIT | ORANGES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/uncooked_rice
	name = "сырой рис"
	desc = "Комок сырого риса."
	icon_state = "uncooked_rice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("рис" = 1)
	foodtypes = GRAIN | RAW

/obj/item/food/uncooked_rice/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledrice, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/uncooked_rice/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledrice)

/obj/item/food/boiledrice
	name = "варёный рис"
	desc = "Дымящаяся чашка варёного риса. Сам по себе немного пресный, но это основа для чего-то вкусного..."
	icon_state = "cooked_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("рис" = 1)
	foodtypes = GRAIN | BREAKFAST
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/salad/ricepudding
	name = "рисовый пудинг"
	desc = "Все любят рисовый пудинг!"
	icon_state = "ricepudding"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("рис" = 1, "сладость" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/salad/ricepork
	name = "рис со свининой"
	desc = "Ну, выглядит как свинина..."
	icon_state = "riceporkbowl"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("рис" = 1, "мясо" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/salad/risotto
	name = "ризотто"
	desc = "Доказательство, что итальянцы освоили все углеводы."
	icon_state = "risotto"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("рис" = 1, "сыр" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/eggbowl
	name = "миска с яйцом"
	desc = "Миска риса с жареным яйцом."
	icon_state = "eggbowl"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("рис" = 1, "яйцо" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN|EGG
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/edensalad
	name = "\improper салат Эдема"
	desc = "Салат, переполненный нераскрытым потенциалом."
	icon_state = "edensalad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 7,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("крайняя горечь" = 3, "надежда" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/gumbo
	name = "гамбо с чёрным горошком"
	desc = "Острое и сытное блюдо из мяса и риса."
	icon_state = "gumbo"
	food_reagents = list(
		/datum/reagent/consumable/capsaicin = 2,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment = 5,
	)
	tastes = list("нарастающая острота" = 2, "сытное мясо и овощи" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/reagent_containers/cup/bowl
	name = "миска"
	desc = "Простая миска для супов и салатов."
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "bowl"
	base_icon_state = "bowl"
	initial_reagent_flags = OPENCONTAINER | DUNKABLE
	custom_materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT*5)
	w_class = WEIGHT_CLASS_NORMAL
	custom_price = PAYCHECK_CREW * 0.6
	fill_icon_thresholds = list(0)
	fill_icon_state = "fullbowl"
	fill_icon = 'icons/obj/food/soupsalad.dmi'

	volume = SOUP_SERVING_SIZE + 5
	gulp_size = 3

	loop_drink = TRUE

/obj/item/reagent_containers/cup/bowl/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ATOM_REAGENT_EXAMINE, PROC_REF(reagent_special_examine))
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/salad/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 6)
	AddComponent( \
		/datum/component/takes_reagent_appearance, \
		on_icon_changed = CALLBACK(src, PROC_REF(on_cup_change)), \
		on_icon_reset = CALLBACK(src, PROC_REF(on_cup_reset)), \
		base_container_type = /obj/item/reagent_containers/cup/bowl, \
	)

/obj/item/reagent_containers/cup/bowl/on_cup_change(datum/glass_style/style)
	. = ..()
	fill_icon_thresholds = null

/obj/item/reagent_containers/cup/bowl/on_cup_reset()
	. = ..()
	fill_icon_thresholds ||= list(0)

/**
 * Override standard reagent examine
 * so that anyone examining a bowl of soup sees the soup but nothing else (unless they have sci goggles)
 */
/obj/item/reagent_containers/cup/bowl/proc/reagent_special_examine(datum/source, mob/user, list/examine_list, can_see_insides = FALSE)
	SIGNAL_HANDLER

	if(can_see_insides || reagents.total_volume <= 0)
		return

	var/unknown_volume = 0
	var/list/soups_found = list()
	for(var/datum/reagent/current_reagent as anything in reagents.reagent_list)
		if(istype(current_reagent, /datum/reagent/consumable/nutriment/soup))
			soups_found += "&bull; [round(current_reagent.volume, 0.01)] ед. [current_reagent.name]"
		else
			unknown_volume += current_reagent.volume

	if(!length(soups_found))
		// There was no soup in the pot, do normal examine
		return

	examine_list += "Внутри видно:"
	examine_list += soups_found
	if(unknown_volume > 0)
		examine_list += "&bull; [round(unknown_volume, 0.01)] ед. неизвестных реагентов"

	return STOP_GENERIC_REAGENT_EXAMINE

// empty salad for custom salads
/obj/item/food/salad/empty
	name = "салат"
	foodtypes = NONE
	tastes = list()
	icon_state = "bowl"
	desc = "Вкусный авторский салат."

/obj/item/food/salad/kale_salad
	name = "салат из кейла"
	desc = "Полезный салат из кейла, сбрызнутый маслом, идеален для тёплых летних месяцев."
	icon_state = "kale_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("полезная зелень" = 2, "оливковая заправка" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/greek_salad
	name = "греческий салат"
	desc = "Популярный салат из томатов, лука, сыра фета и оливок, сбрызнутых оливковым маслом. Хотя кажется, что чего-то не хватает..."
	icon_state = "greek_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 13,
		/datum/reagent/consumable/nutriment = 14,
	)
	tastes = list("полезная зелень" = 2, "оливковая заправка" = 1, "сыр фета" = 1)
	foodtypes = VEGETABLES|FRUIT|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/caesar_salad
	name = "салат цезарь"
	desc = "Простой, но насыщенный салат из лука, салата-латука, гренок и тёртого сыра с масляной заправкой. Подаётся с ломтиком питы!"
	icon_state = "caesar_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("полезная зелень" = 2, "оливковая заправка" = 2, "сыр фета" = 2, "пита" = 1)
	foodtypes = VEGETABLES | DAIRY | GRAIN
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/spring_salad
	name = "весенний салат"
	desc = "Простой салат из моркови, латука и гороха, сбрызнутый маслом и щепоткой соли."
	icon_state = "spring_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("хрустящая зелень" = 2, "оливковая заправка" = 2, "соль" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/potato_salad
	name = "картофельный салат"
	desc = "Блюдо из варёного картофеля, смешанного с варёными яйцами, луком и майонезом. Основа любого уважающего себя барбекю."
	icon_state = "potato_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("сливочный картофель" = 2, "яйца" = 2, "майонез" = 1, "лук" = 1)
	foodtypes = MEAT|VEGETABLES|BREAKFAST|EGG
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/spinach_fruit_salad
	name = "фруктовый салат со шпинатом"
	desc = "Яркий фруктовый салат из шпината, ягод и кусочков ананаса, сбрызнутых маслом. Вкусно!"
	icon_state = "spinach_fruit_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("шпинат" = 2, "ягоды" = 2, "ананас" = 2, "заправка" = 1)
	foodtypes = VEGETABLES|FRUIT|PINEAPPLE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/antipasto_salad
	name = "салат антипасто"
	desc = "Традиционный итальянский салат из салями, моцареллы, оливок и томатов. Часто подаётся как первое блюдо."
	icon_state = "antipasto_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("латук" = 2, "салями" = 2, "моцарелла" = 2, "томаты" = 2, "заправка" = 1)
	foodtypes = MEAT|VEGETABLES|FRUIT|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
