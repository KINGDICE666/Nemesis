
// see code/datums/recipe.dm


// see code/module/crafting/table.dm

////////////////////////////////////////////////SANDWICHES////////////////////////////////////////////////

/datum/crafting_recipe/food/sandwich
	name = "Сэндвич"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/meat/steak = 1,
		/obj/item/food/cheese/wedge = 1
	)
	result = /obj/item/food/sandwich
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/cheese_sandwich
	name = "Сэндвич с сыром"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/cheese/wedge = 2
	)
	result = /obj/item/food/sandwich/cheese
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/slimesandwich
	name = "Сэндвич с желе"
	reqs = list(
		/datum/reagent/toxin/slimejelly = 5,
		/obj/item/food/breadslice/plain = 2,
	)
	added_foodtypes = TOXIC
	result = /obj/item/food/sandwich/jelly/slime
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/cherrysandwich
	name = "Сэндвич с желе"
	reqs = list(
		/datum/reagent/consumable/cherryjelly = 5,
		/obj/item/food/breadslice/plain = 2,
	)
	added_foodtypes = FRUIT|SUGAR
	result = /obj/item/food/sandwich/jelly/cherry
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/notasandwich
	name = "Не сэндвич"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/clothing/mask/fakemoustache = 1
	)
	added_foodtypes = GROSS
	result = /obj/item/food/sandwich/notasandwich
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/hotdog
	name = "Хот-дог"
	reqs = list(
		/datum/reagent/consumable/ketchup = 5,
		/obj/item/food/bun = 1,
		/obj/item/food/sausage = 1
	)
	result = /obj/item/food/hotdog
	removed_foodtypes = BREAKFAST
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/danish_hotdog
	name = "Датский хот-дог"
	reqs = list(
		/datum/reagent/consumable/ketchup = 5,
		/obj/item/food/bun = 1,
		/obj/item/food/sausage = 1,
		/obj/item/food/pickle = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/danish_hotdog
	removed_foodtypes = BREAKFAST
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/blt
	name = "BLT"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/meat/bacon = 2,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/sandwich/blt
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/peanut_butter_jelly_sandwich
	name = "Сэндвич с арахисовой пастой и желе"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/datum/reagent/consumable/peanut_butter = 5,
		/datum/reagent/consumable/cherryjelly = 5
	)
	result = /obj/item/food/sandwich/peanut_butter_jelly
	added_foodtypes = FRUIT|NUTS
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/peanut_butter_banana_sandwich
	name = "Сэндвич с арахисовой пастой и бананом"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/food/grown/banana = 1
	)
	result = /obj/item/food/sandwich/peanut_butter_banana
	added_foodtypes = NUTS
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/philly_cheesesteak
	name = "Филадельфийский чизстейк"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/sandwich/philly_cheesesteak
	dish_category = DISH_SANDWICH

/datum/crafting_recipe/food/death_sandwich
	name = "Сэндвич смерти"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/salami = 4,
		/obj/item/food/meatball = 4,
		/obj/item/food/grown/tomato = 1,
	)
	result = /obj/item/food/sandwich/death
	dish_category = DISH_SANDWICH
	crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_MUST_BE_LEARNED

/datum/crafting_recipe/food/toast_sandwich
	name = "Сэндвич с тостом"
	reqs = list(
		/obj/item/food/breadslice/plain = 2,
		/obj/item/food/butteredtoast = 1,
	)
	result = /obj/item/food/sandwich/toast_sandwich
	removed_foodtypes = BREAKFAST
	dish_category = DISH_SANDWICH
