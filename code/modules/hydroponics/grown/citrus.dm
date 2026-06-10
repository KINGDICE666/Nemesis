// Citrus - base type
/obj/item/food/grown/citrus
	name = "цитрус"
	desc = "Такой кислый, что лицо перекосит."
	icon_state = "lime"
	abstract_type = /obj/item/food/grown/citrus
	foodtypes = FRUIT
	wine_power = 30
	seed = /obj/item/seeds/lime

// Lime
/obj/item/seeds/lime
	name = "пакет семян лайма"
	desc = "Это очень кислые семена."
	icon_state = "seed-lime"
	species = "lime"
	plantname = "Лаймовое дерево"
	product = /obj/item/food/grown/citrus/lime
	lifespan = 55
	endurance = 50
	yield = 4
	potency = 15
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/orange)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05)

/obj/item/food/grown/citrus/lime
	seed = /obj/item/seeds/lime
	name = "лайм"
	desc = "Такой кислый, что лицо перекосит."
	icon_state = "lime"

/obj/item/food/grown/citrus/lime/juice_typepath()
	return /datum/reagent/consumable/limejuice

// Orange
/obj/item/seeds/orange
	name = "пакет семян апельсина"
	desc = "Кислые семена."
	icon_state = "seed-orange"
	species = "orange"
	plantname = "Апельсиновое дерево"
	product = /obj/item/food/grown/citrus/orange
	lifespan = 60
	endurance = 50
	yield = 5
	potency = 20
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/lime, /obj/item/seeds/orange_3d)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05)

/obj/item/food/grown/citrus/orange
	seed = /obj/item/seeds/orange
	name = "апельсин"
	desc = "Пикантный цитрусовый фрукт."
	icon_state = "orange"
	foodtypes = ORANGES | FRUIT
	distill_reagent = /datum/reagent/consumable/ethanol/triple_sec

/obj/item/food/grown/citrus/orange/juice_typepath()
	return /datum/reagent/consumable/orangejuice

// Lemon
/obj/item/seeds/lemon
	name = "пакет семян лимона"
	desc = "Это кислые семена."
	icon_state = "seed-lemon"
	species = "lemon"
	plantname = "Лимонное дерево"
	product = /obj/item/food/grown/citrus/lemon
	lifespan = 55
	endurance = 45
	yield = 4
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/firelemon)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05)

/obj/item/food/grown/citrus/lemon
	seed = /obj/item/seeds/lemon
	name = "лимон"
	desc = "Когда жизнь даёт лимоны, делайте лимонад."
	icon_state = "lemon"

/obj/item/food/grown/citrus/lemon/juice_typepath()
	return /datum/reagent/consumable/lemonjuice

// Combustible lemon
/obj/item/seeds/firelemon //combustible lemon is too long so firelemon
	name = "пакет семян горючего лимона"
	desc = "Когда жизнь даёт лимоны, не делайте лимонад. Заставьте жизнь забрать лимоны обратно!"
	icon_state = "seed-firelemon"
	species = "firelemon"
	plantname = "Дерево горючих лимонов"
	product = /obj/item/food/grown/firelemon
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/bomb_plant/potency_based)
	lifespan = 55
	endurance = 45
	yield = 4
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.05, /datum/reagent/fuel = 0.05)

/obj/item/food/grown/firelemon
	seed = /obj/item/seeds/firelemon
	name = "горючий лимон"
	desc = "Создан для сжигания домов."
	icon_state = "firelemon"
	alt_icon = "firelemon_active"
	foodtypes = FRUIT
	wine_power = 70

//3D Orange
/obj/item/seeds/orange_3d
	name = "пакет семян внеземерного апельсина"
	desc = "Полигональные семена."
	icon_state = "seed-orange"
	species = "orange"
	plantname = "Внеземерное апельсиновое дерево"
	product = /obj/item/food/grown/citrus/orange_3d
	lifespan = 60
	endurance = 50
	yield = 5
	potency = 20
	instability = 64
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "lime-grow"
	icon_dead = "lime-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.05, /datum/reagent/medicine/haloperidol = 0.15) //insert joke about the effects of haloperidol and our glorious headcoder here

/obj/item/food/grown/citrus/orange_3d
	seed = /obj/item/seeds/orange_3d
	name = "внеземерный апельсин"
	desc = "Вашему разуму трудно охватить эту штуку."
	icon_state = "orang"
	foodtypes = ORANGES
	alt_icon = "orange"
	bite_consumption_mod = 2
	distill_reagent = /datum/reagent/toxin/mindbreaker
	tastes = list("полигоны" = 1, "блюспейс" = 1, "истинная природа реальности" = 1)

/obj/item/food/grown/citrus/orange_3d/juice_typepath()
	return /datum/reagent/consumable/orangejuice

/obj/item/food/grown/citrus/orange_3d/pickup(mob/user)
	. = ..()
	icon_state = alt_icon

/obj/item/food/grown/citrus/orange_3d/dropped(mob/user)
	. = ..()
	icon_state = initial(icon_state)
