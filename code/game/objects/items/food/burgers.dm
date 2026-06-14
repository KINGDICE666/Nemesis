/obj/item/food/burger
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "hburger"
	inhand_icon_state = "burger"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("булочка" = 2, "говяжья котлета" = 4)
	foodtypes = GRAIN | MEAT //lettuce doesn't make burger a vegetable.
	eat_time = 15 //Quick snack
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/plain
	name = "простой бургер"
	desc = "Краеугольный камень любого питательного завтрака."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = GRAIN | MEAT
	custom_price = PAYCHECK_CREW * 0.8
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/plain/Initialize(mapload)
	. = ..()
	if(!prob(1))
		return
	new/obj/effect/particle_effect/fluid/smoke(get_turf(src))
	playsound(src, 'sound/effects/smoke.ogg', 50, TRUE)
	visible_message(span_warning("О боги! [src] испорчен! Но что, если...?"))
	name = "паровая ветчина"
	desc = pick("Ahh, Head of Personnel, welcome. I hope you're prepared for an unforgettable luncheon!",
		"And you call these steamed hams despite the fact that they are obviously microwaved?",
		"Aurora Station 13? At this time of shift, in this time of year, in this sector of space, localized entirely within your freezer?",
		"You know, these hamburgers taste quite similar to the ones they have at the Maltese Falcon.")

/obj/item/food/burger/human
	name = "человеческий бургер"
	desc = "Кровавый бургер."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("булочка" = 2, "длинная свинина" = 4)
	foodtypes = MEAT | GRAIN
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/human/on_craft_completion(list/components, datum/crafting_recipe/current_recipe, atom/crafter)
	. = ..()
	for(var/datum/material/meat/mob_meat/mob_meat_material in custom_materials)
		if(mob_meat_material.subjectname)
			name = "бургер из [mob_meat_material.subjectname]"
		else if(mob_meat_material.subjectjob)
			name = "бургер из [mob_meat_material.subjectjob]"

/obj/item/food/burger/corgi
	name = "бургер из корги"
	desc = "Чудовище."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("булочка" = 4, "мясо корги" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/appendix
	name = "бургер с аппендиксом"
	desc = "На вкус как аппендицит."
	icon_state = "appendixburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("булочка" = 4, "трава" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/fish
	name = "сэндвич филе-о-карп"
	desc = "Почти как будто где-то кричит карп... Верни мне филе-о-карп, дай мне этого карпа."
	icon_state = "fishburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("булочка" = 4, "рыба" = 4)
	foodtypes = GRAIN | SEAFOOD | DAIRY
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/burger/tofu
	name = "бургер с тофу"
	desc = "Что... это мясо?"
	icon_state = "tofuburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("булочка" = 4, "тофу" = 4)
	foodtypes = GRAIN | VEGETABLES
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/roburger
	name = "робургер"
	desc = "Салат - единственный органический компонент. Бип."
	icon_state = "roburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/cyborg_mutation_nanomachines = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("булочка" = 4, "салат" = 2, "жижа" = 1)
	foodtypes = GRAIN | TOXIC
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/roburger/big
	desc = "Эта массивная котлета выглядит ядовитой. Бип."
	max_volume = 120
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/cyborg_mutation_nanomachines = 80,
		/datum/reagent/consumable/nutriment/vitamin = 15,
	)

/obj/item/food/burger/xeno
	name = "ксенобургер"
	desc = "Пахнет едко. На вкус как ересь."
	icon_state = "xburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("булочка" = 4, "кислота" = 4)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/bearger
	name = "медвежбургер"
	desc = "Лучше подавать ры-ы-рым."
	icon_state = "bearger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("булочка" = 2, "мясо" = 2, "лосось" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/clown
	name = "клоунский бургер"
	desc = "У него смешной вкус..."
	icon_state = "clownburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("булочка" = 2, "плохая шутка" = 4)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/mime
	name = "бургер мима"
	desc = "Его вкус не поддаётся словам."
	icon_state = "mimeburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 9,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nothing = 6,
	)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/brain
	name = "мозгбургер"
	desc = "Странно выглядящий бургер. Кажется почти разумным."
	icon_state = "brainburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/medicine/mannitol = 6,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("булочка" = 4, "мозги" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/ghost
	name = "призрачный бургер"
	desc = "Слишком жутко!"
	icon_state = "ghostburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/salt = 5,
	)
	tastes = list("булочка" = 2, "эктоплазма" = 4)
	foodtypes = GRAIN
	alpha = 170
	verb_say = "moans"
	verb_yell = "wails"
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3
	preserved_food = TRUE // It's made of ghosts

/obj/item/food/burger/ghost/Initialize(mapload, starting_reagent_purity, no_base_reagents)
	. = ..()
	START_PROCESSING(SSobj, src)
	AddComponent(/datum/component/ghost_edible, bite_consumption = bite_consumption)

/obj/item/food/burger/ghost/make_germ_sensitive()
	return // This burger moves itself so it shouldn't pick up germs from walking onto the floor

/obj/item/food/burger/ghost/process()
	if(!isturf(loc)) //no floating out of bags
		return
	var/paranormal_activity = rand(100)
	switch(paranormal_activity)
		if(97 to 100)
			audible_message("[src] гремит цепью.")
			playsound(loc, 'sound/misc/chain_rattling.ogg', 300, TRUE)
		if(91 to 96)
			say(pick("OoOoOoo.", "OoooOOooOoo!!"))
		if(84 to 90)
			dir = pick(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
			step(src, dir)
		if(71 to 83)
			step(src, dir)
		if(65 to 70)
			var/obj/machinery/light/light = locate(/obj/machinery/light) in view(4, src)
			light?.flicker()
		if(62 to 64)
			playsound(loc, SFX_HALLUCINATION_I_SEE_YOU, 50, TRUE, ignore_walls = FALSE)
		if(61)
			visible_message("[src] выплёвывает комок эктоплазмы!")
			new /obj/effect/decal/cleanable/greenglow/ecto(loc)
			playsound(loc, 'sound/effects/splat.ogg', 200, TRUE)

/obj/item/food/burger/ghost/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/food/burger/red
	name = "красный бургер"
	desc = "Идеально скрывает тот факт, что он сгорел до хруста."
	icon_state = "cburger"
	color = COLOR_RED
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/red = 10,
	)
	tastes = list("булочка" = 2, "красный цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/orange
	name = "оранжевый бургер"
	desc = "Содержит 0% сока."
	icon_state = "cburger"
	color = COLOR_ORANGE
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/orange = 10,
	)
	tastes = list("булочка" = 2, "оранжевый цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/yellow
	name = "жёлтый бургер"
	desc = "Яркий до последнего укуса."
	icon_state = "cburger"
	color = COLOR_YELLOW
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/yellow = 10,
	)
	tastes = list("булочка" = 2, "жёлтый цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/green
	name = "зелёный бургер"
	desc = "Это не испорченное мясо, это покрашенное мясо!"
	icon_state = "cburger"
	color = COLOR_GREEN
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/green = 10,
	)
	tastes = list("булочка" = 2, "зелёный цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/blue
	name = "синий бургер"
	desc = "Это блю-рэр?"
	icon_state = "cburger"
	color = COLOR_BLUE
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/blue = 10,
	)
	tastes = list("булочка" = 2, "синий цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/purple
	name = "фиолетовый бургер"
	desc = "Королевский и низкопробный одновременно."
	icon_state = "cburger"
	color = COLOR_PURPLE
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/purple = 10,
	)
	tastes = list("булочка" = 2, "фиолетовый цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/black
	name = "чёрный бургер"
	desc = "Он пережарен."
	icon_state = "cburger"
	color = COLOR_ALMOST_BLACK
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/black = 10,
	)
	tastes = list("булочка" = 2, "чёрный цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/white
	name = "белый бургер"
	desc = "Восхитительный титан!"
	icon_state = "cburger"
	color = COLOR_WHITE
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/colorful_reagent/powder/white = 10,
	)
	tastes = list("булочка" = 2, "белый цвет" = 2)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/spell
	name = "заклинательный бургер"
	desc = "Это совершенно точно Ei Nath."
	icon_state = "spellburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("булочка" = 4, "магия" = 2)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/bigbite
	name = "бургер большой укус"
	desc = "Забудьте Big Mac. ВОТ это будущее!"
	icon_state = "bigbiteburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("булочка" = 2, "мясо" = 10)
	w_class = WEIGHT_CLASS_NORMAL
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/burger/jelly
	name = "желейный бургер"
	desc = "Кулинарное наслаждение..?"
	icon_state = "jellyburger"
	tastes = list("булочка" = 4, "желе" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/jelly/slime
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/toxin/slimejelly = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	foodtypes = GRAIN | TOXIC

/obj/item/food/burger/jelly/cherry
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/cherryjelly = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	foodtypes = GRAIN | FRUIT

/obj/item/food/burger/superbite
	name = "бургер супер-укус"
	desc = "Это гора бургеров. ЕДА!"
	icon_state = "superbiteburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 26,
		/datum/reagent/consumable/nutriment/protein = 40,
		/datum/reagent/consumable/nutriment/vitamin = 13,
	)
	w_class = WEIGHT_CLASS_NORMAL
	bite_consumption = 7
	max_volume = 100
	tastes = list("булочка" = 4, "диабет второго типа" = 10)
	foodtypes = GRAIN | MEAT | DAIRY | VEGETABLES | EGG
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/superbite/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] starts to eat [src] in one bite, it looks like [user.p_theyre()] trying to commit suicide!"))
	var/datum/component/edible/component = GetComponent(/datum/component/edible)
	component?.TakeBite(user, user)
	return OXYLOSS

/obj/item/food/burger/fivealarm
	name = "пожарный бургер"
	desc = "ОСТРО! ОСТРО!"
	icon_state = "fivealarmburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/capsaicin = 5,
		/datum/reagent/consumable/condensedcapsaicin = 5,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("невыносимый жар" = 4, "булочка" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/rat
	name = "крысиный бургер"
	desc = "Примерно то, чего вы и ожидали..."
	icon_state = "ratburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("мёртвая крыса" = 4, "булочка" = 2)
	foodtypes = GRAIN | MEAT | GORE | RAW
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/baseball
	name = "бейсбольный бургер хоум-ран"
	desc = "Он всё ещё тёплый. Пар от него похож на бейсбол."
	icon_state = "baseball"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("булочка" = 2, "хоум-ран" = 4)
	foodtypes = GRAIN | GROSS
	custom_price = PAYCHECK_CREW * 0.8
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = /obj/item/melee/baseball_bat::custom_materials

/obj/item/food/burger/baconburger
	name = "бургер с беконом"
	desc = "Идеальное сочетание всего американского."
	icon_state = "baconburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("бекон" = 4, "булочка" = 2)
	foodtypes = GRAIN | MEAT
	custom_premium_price = PAYCHECK_CREW * 1.6
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/burger/empoweredburger
	name = "заряженный бургер"
	desc = "Шокирующе хорош, если вы питаетесь электричеством."
	icon_state = "empoweredburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/liquidelectricity/enriched = 6,
	)
	tastes = list("булочка" = 2, "чистое электричество" = 4)
	foodtypes = GRAIN | TOXIC
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/burger/catburger
	name = "котобургер"
	desc = "Наконец-то от кошек и фелинидов есть польза!"
	icon_state = "catburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("булочка" = 4, "мясо" = 2, "кот" = 2)
	foodtypes = GRAIN | MEAT | GORE
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/crab
	name = "крабовый бургер"
	desc = "Вкусная крабовая котлета, зажатая между булочками."
	icon_state = "crabburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("булочка" = 2, "крабовое мясо" = 4)
	foodtypes = GRAIN | SEAFOOD
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/soylent
	name = "сойлент-бургер"
	desc = "Экологичный бургер из переработанной низкосортной биомассы."
	icon_state = "soylentburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("булочка" = 2, "ассистент" = 4)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/rib
	name = "макриб"
	desc = "Неуловимый бургер в форме рёбрышка, доступный в галактике лишь ограниченное время. Уже не такой вкусный, как вы помните."
	icon_state = "mcrib"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/bbqsauce = 1,
		)
	tastes = list("булочка" = 2, "свиная котлета" = 4)
	foodtypes = GRAIN | MEAT | SUGAR | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/mcguffin
	name = "макгаффин"
	desc = "Дешёвая и жирная имитация яиц Бенедикт."
	icon_state = "mcguffin"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/eggyolk = 3,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("маффин" = 2, "бекон" = 3)
	foodtypes = GRAIN | MEAT | BREAKFAST | FRIED | EGG
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/chicken
	name = "куриный сэндвич"
	//Apparently the proud people of Americlapstan object to this thing being called a burger.
	//Apparently McDonald's just calls it a burger in Europe as to not scare and confuse us.
	desc = "Вкусный куриный сэндвич. Говорят, выручка от этого лакомства помогает криминализировать обезоруживание людей на космическом фронтире."
	icon_state = "chickenburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/mayonnaise = 3,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
	)
	tastes = list("булочка" = 2, "курица" = 4, "божий завет" = 1)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/cheese
	name = "чизбургер"
	desc = "Этот благородный бургер гордо облачён в золотой сыр."
	icon_state = "cheeseburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("булочка" = 2, "говяжья котлета" = 4, "сыр" = 3)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/cheese/Initialize(mapload)
	. = ..()
	if(prob(33))
		icon_state = "cheeseburgeralt"

/obj/item/food/burger/crazy
	name = "безумный гамбургер"
	desc = "Похоже на еду, которую приготовил бы обезумевший клоун в плаще."
	icon_state = "crazyburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/capsaicin = 3,
		/datum/reagent/consumable/condensedcapsaicin = 3,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("булочка" = 2, "говяжья котлета" = 4, "сыр" = 2, "говядина в чили" = 3, "дымящийся фальшфейер" = 2)
	foodtypes = GRAIN | MEAT | DAIRY | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(
		/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2,
		/datum/material/iron = SMALL_MATERIAL_AMOUNT * 0.5,
		/datum/material/plasma = SMALL_MATERIAL_AMOUNT * 0.5,
		/datum/material/plastic = SMALL_MATERIAL_AMOUNT * 0.5,
	)

/obj/item/food/burger/crazy/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/food/burger/crazy/process(seconds_per_tick) // DIT EES HORRIBLE
	if(SPT_PROB(2.5, seconds_per_tick))
		do_smoke(0, src, loc, smoke_type = /datum/effect_system/fluid_spread/smoke/bad/green)

// empty burger you can customize
/obj/item/food/burger/empty
	name = "бургер"
	desc = "Безумный авторский бургер, приготовленный сумасшедшим поваром."
	icon_state = "custburg"
	tastes = list("булочка")
	foodtypes = GRAIN

/obj/item/food/burger/sloppy_moe
	name = "неряшливый Мо"
	desc = "Фарш с луком и соусом барбекю, небрежно плюхнутый на булочку. Вкусно, но руки точно будут грязными."
	icon_state = "sloppy_moe"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("сочное мясо" = 4, "соус BBQ" = 3, "лук" = 2, "булочка" = 2)
	foodtypes = MEAT|VEGETABLES|GRAIN
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)
