/obj/item/food/pie
	icon = 'icons/obj/food/piecake.dmi'
	inhand_icon_state = "pie"
	bite_consumption = 3
	w_class = WEIGHT_CLASS_NORMAL
	max_volume = 80
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("пирог" = 1)
	foodtypes = GRAIN | DAIRY
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2
	/// type is spawned 5 at a time and replaces this pie when processed by cutting tool
	var/obj/item/food/pieslice/slice_type
	/// so that the yield can change if it isn't 5
	var/yield = 5

/obj/item/food/pie/make_processable()
	if (slice_type)
		AddElement(/datum/element/processable, TOOL_KNIFE, slice_type, yield, table_required = TRUE, screentip_verb = "Нарезать", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/pieslice
	name = "кусок пирога"
	icon = 'icons/obj/food/piecake.dmi'
	w_class = WEIGHT_CLASS_TINY
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("пирог" = 1, "неуверенность" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/plain
	name = "простой пирог"
	desc = "Простой пирог, всё ещё вкусный."
	icon_state = "pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("пирог" = 1)
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/plain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/pie/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/food/pie/empty
	name = "пирог"
	desc = "Авторский пирог, приготовленный безумным поваром."
	icon_state = "pie_custom"
	slice_type = /obj/item/food/pieslice/empty

/obj/item/food/pieslice/empty
	name = "кусок пирога"
	desc = "Кусок авторского пирога, приготовленного безумным поваром."
	icon_state = "pie_custom_slice"

/obj/item/food/pieslice/empty/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, null, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/food/pie/cream
	name = "банановый кремовый пирог"
	desc = "Прямо как дома, на планете клоунов! ХОНК!"
	icon_state = "pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/banana = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR|FRUIT
	var/stunning = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/cream/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/splat, hit_callback = CALLBACK(src, PROC_REF(stun_and_blur)))

/obj/item/food/pie/cream/proc/stun_and_blur(mob/living/victim, can_splat_on)
	if(stunning)
		victim.Paralyze(2 SECONDS) //splat!
	if(can_splat_on)
		victim.adjust_eye_blur(2 SECONDS)
	victim.visible_message(span_warning("[victim] получает кремом от [src]!"), span_userdanger("Вас залепило кремом от [src]!"))
	playsound(victim, SFX_DESECRATION, 50, TRUE)

/obj/item/food/pie/cream/nostun
	stunning = FALSE

/obj/item/food/pie/berryclafoutis
	name = "ягодный клафути"
	desc = "Никаких чёрных птиц, хороший знак."
	icon_state = "berryclafoutis"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/berryjuice = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "ежевика" = 1)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/bearypie
	name = "медвежий пирог"
	desc = "Никаких бурых медведей, хороший знак."
	icon_state = "bearypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("пирог" = 1, "мясо" = 1, "лосось" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR|MEAT|FRUIT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pie/meatpie
	name = "мясной пирог"
	icon_state = "meatpie"
	desc = "Старый рецепт цирюльника, очень вкусный!"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
	)
	tastes = list("пирог" = 1, "мясо" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	venue_value = FOOD_PRICE_NORMAL
	slice_type = /obj/item/food/pieslice/meatpie
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pieslice/meatpie
	name = "кусок мясного пирога"
	desc = "О, здорово, мясной пирог!"
	icon_state = "meatpie_slice"
	tastes = list("пирог" = 1, "мясо" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 5)

/obj/item/food/pie/tofupie
	name = "пирог с тофу"
	icon_state = "meatpie"
	desc = "Вкусный пирог с тофу."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("пирог" = 1, "тофу" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	slice_type = /obj/item/food/pieslice/tofupie
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/tofupie
	name = "кусок пирога с тофу"
	desc = "О, здорово, мясной пирог... СЕКУНДОЧКУ!!"
	icon_state = "meatpie_slice"
	tastes = list("пирог" = 1, "разочарование" = 1, "тофу" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/amanita_pie
	name = "пирог с мухомором"
	desc = "Сладкий и вкусный ядовитый пирог."
	icon_state = "amanita_pie"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/toxin/amatoxin = 3,
		/datum/reagent/drug/mushroomhallucinogen = 1,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "гриб" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|TOXIC|GROSS
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/plump_pie
	name = "пирог с толстошлемником"
	desc = "Наверняка вы любите штуки из толстошлемников!"
	icon_state = "plump_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "гриб" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/plump_pie/Initialize(mapload)
	var/fey = prob(10)
	if(fey)
		name = "исключительный пирог с толстошлемником"
		desc = "Микроволновка охвачена фейским настроением! Она приготовила исключительный пирог с толстошлемником!"
		food_reagents = list(
			/datum/reagent/consumable/nutriment = 11,
			/datum/reagent/medicine/omnizine = 5,
			/datum/reagent/consumable/nutriment/vitamin = 4,
		)
	. = ..()

/obj/item/food/pie/xemeatpie
	name = "ксенопирог"
	icon_state = "xenomeatpie"
	desc = "Вкусный мясной пирог. Вероятно, еретический."
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("пирог" = 1, "мясо" = 1, "кислота" = 1)
	foodtypes = MEAT|GRAIN|DAIRY
	slice_type = /obj/item/food/pieslice/xemeatpie
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/pieslice/xemeatpie
	name = "кусок ксенопирога"
	desc = "О боже... Оно всё ещё двигается?"
	icon_state = "xenopie_slice"
	tastes = list("пирог" = 1, "кислота" = 1, "мясо" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT / 5)

/obj/item/food/pie/applepie
	name = "яблочный пирог"
	desc = "Пирог, содержащий сладкую-сладкую любовь... или яблоко."
	icon_state = "applepie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("пирог" = 1, "яблоко" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/apple
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/apple
	name = "кусок яблочного пирога"
	desc = "Кусок уютного яблочного пирога, впереди тёплые осенние воспоминания."
	icon_state = "applepie_slice"
	tastes = list("пирог" = 1, "яблоки" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3


/obj/item/food/pie/cherrypie
	name = "вишнёвый пирог"
	desc = "Вкус настолько хорош, что взрослый мужчина заплачет."
	icon_state = "cherrypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("пирог" = 7, "Nicole Paige Brooks" = 2)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/cherry
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/cherry
	name = "кусок вишнёвого пирога"
	desc = "Кусок вкусного вишнёвого пирога, надеюсь, с морелло!"
	icon_state = "cherrypie_slice"
	tastes = list("пирог" = 1, "вишня" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/pumpkinpie
	name = "тыквенный пирог"
	desc = "Вкусное лакомство для осенних месяцев."
	icon_state = "pumpkinpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("пирог" = 1, "тыква" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	slice_type = /obj/item/food/pieslice/pumpkin
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/pumpkin
	name = "кусок тыквенного пирога"
	desc = "Кусок тыквенного пирога со взбитыми сливками сверху. Совершенство."
	icon_state = "pumpkinpieslice"
	tastes = list("пирог" = 1, "тыква" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/appletart
	name = "штрейзельный тарт с золотым яблоком"
	desc = "Вкусный десерт, который не пройдёт через металлодетектор."
	icon_state = "gappletart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/gold = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "яблоко" = 1, "дорогой металл" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/grapetart
	name = "виноградный тарт"
	desc = "Вкусный десерт, напоминающий о вине, которое вы так и не сделали."
	icon_state = "grapetart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "виноград" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/mimetart
	name = "тарт мима"
	desc = "..."
	icon_state = "mimetart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/nothing = 10,
	)
	tastes = list("ничего" = 3)
	foodtypes = GRAIN|DAIRY|SUGAR
	crafted_food_buff = /datum/status_effect/food/trait/mute

/obj/item/food/pie/berrytart
	name = "ягодный тарт"
	desc = "Вкусный десерт с множеством разных мелких ягод на тонкой корочке."
	icon_state = "berrytart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("пирог" = 1, "ягоды" = 2)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR

/obj/item/food/pie/cocolavatart
	name = "шоколадный лава-тарт"
	desc = "Вкусный шоколадный десерт с жидкой сердцевиной." //But it doesn't even contain chocolate...
	icon_state = "cocolavatart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "тёмный шоколад" = 3)
	foodtypes = GRAIN|DAIRY|SUGAR

/obj/item/food/pie/blumpkinpie
	name = "пирог с синетыквой"
	desc = "Странный синий пирог из токсичной синетыквы."
	icon_state = "blumpkinpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 13,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("пирог" = 1, "полный рот воды из бассейна" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	slice_type = /obj/item/food/pieslice/blumpkin
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/blumpkin
	name = "кусок пирога с синетыквой"
	desc = "Кусок пирога с синетыквой и взбитыми сливками сверху. Это съедобно?"
	icon_state = "blumpkinpieslice"
	tastes = list("пирог" = 1, "полный рот воды из бассейна" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/dulcedebatata
	name = "dulce de batata"
	desc = "Вкусное желе из батата."
	icon_state = "dulcedebatata"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 14,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("желе" = 1, "батат" = 1)
	foodtypes = VEGETABLES | SUGAR
	venue_value = FOOD_PRICE_EXOTIC
	slice_type = /obj/item/food/pieslice/dulcedebatata
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/dulcedebatata
	name = "кусок dulce de batata"
	desc = "Кусок сладкого желе dulce de batata."
	icon_state = "dulcedebatataslice"
	tastes = list("желе" = 1, "батат" = 1)
	foodtypes = VEGETABLES | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/frostypie
	name = "морозный пирог"
	desc = "На вкус как синий и холод."
	icon_state = "frostypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 14,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("мята" = 1, "пирог" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/frostypie
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/frostypie
	name = "кусок морозного пирога"
	desc = "Вкусный синий, как мой любимый мелок!"
	icon_state = "frostypie_slice"
	tastes = list("пирог" = 1, "мята" = 1)
	foodtypes = GRAIN | FRUIT | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/baklava
	name = "пахлава"
	desc = "Восхитительная полезная закуска из ореховых слоёв и тонкого теста."
	icon_state = "baklava"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("орехи" = 1, "пирог" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR
	slice_type = /obj/item/food/pieslice/baklava
	yield = 6
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pieslice/baklava
	name = "порция пахлавы"
	desc = "Порция восхитительной полезной закуски из ореховых слоёв и тонкого теста."
	icon_state = "baklavaslice"
	tastes = list("орехи" = 1, "пирог" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/frenchsilkpie
	name = "французский шёлковый пирог"
	desc = "Роскошный пирог с начинкой из кремового шоколадного мусса, слоем взбитых сливок и шоколадной стружкой. Можно нарезать."
	icon_state = "frenchsilkpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("пирог" = 1, "нежный шоколад" = 1, "взбитые сливки" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	slice_type = /obj/item/food/pieslice/frenchsilk
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/frenchsilk
	name = "кусок французского шёлкового пирога"
	desc = "Кусок французского шёлкового пирога с шоколадным муссом, слоем взбитых сливок и шоколадной стружкой. Достаточно вкусный, чтобы расплакаться."
	icon_state = "frenchsilkpieslice"
	tastes = list("пирог" = 1, "нежный шоколад" = 1, "взбитые сливки" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/shepherds_pie
	name = "пастуший пирог"
	desc = "Блюдо из фарша и овощной смеси, запечённое под слоем сливочного картофельного пюре. Можно нарезать."
	icon_state = "shepherds_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 40,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment/protein = 20,
	)
	tastes = list("сочное мясо" = 2, "картофельное пюре" = 2, "запечённые овощи" = 2)
	foodtypes = MEAT | DAIRY | VEGETABLES
	slice_type = /obj/item/food/pieslice/shepherds_pie
	yield = 4
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pieslice/shepherds_pie
	name = "кусок пастушьего пирога"
	desc = "Неряшливый кусок пастушьего пирога из фарша и овощной смеси, запечённых под слоем сливочного картофельного пюре. Опасно вкусно."
	icon_state = "shepherds_pie_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment/protein = 5,
	)
	tastes = list("сочное мясо" = 1, "картофельное пюре" = 1, "запечённые овощи" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = SHEET_MATERIAL_AMOUNT)

/obj/item/food/pie/asdfpie
	name = "пирог со вкусом пирога"
	desc = "Я испёк тебе пирог!"
	icon_state = "asdfpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("пирог" = 1, "далёкий 2010 год" = 1)
	foodtypes = GRAIN|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/bacid_pie
	name = "пирог с аккумуляторной кислотой"
	desc = "О, это пирог из... аккумуляторной кислоты? Пожалуй, эфириал смог бы получить от этого удовольствие."
	icon_state = "bacid_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 18,
		/datum/reagent/consumable/liquidelectricity/enriched = 18
	)
	tastes = list("аккумуляторная кислота" = 2, "электричество" = 2, "кибермир" = 2)
	foodtypes = GRAIN|DAIRY|TOXIC
	slice_type = /obj/item/food/pieslice/bacid_pie
	yield = 4
	crafting_complexity = FOOD_COMPLEXITY_3


/obj/item/food/pieslice/bacid_pie
	name = "кусок пирога с аккумуляторной кислотой"
	desc = "Начинка из аккумуляторной кислоты имеет тревожно привлекательный ярко-зелёный цвет."
	icon_state = "bacid_pie_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4.5,
		/datum/reagent/consumable/liquidelectricity/enriched = 4.5
	)
	tastes = list("аккумуляторная кислота" = 1, "электричество" = 1, "кибермир" = 1)
	foodtypes = TOXIC
	crafting_complexity = FOOD_COMPLEXITY_3
