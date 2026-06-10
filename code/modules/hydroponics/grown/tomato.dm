// Tomato
/obj/item/seeds/tomato
	name = "пакет семян томата"
	desc = "Эти семена вырастают в томатные кусты."
	icon_state = "seed-tomato"
	species = "tomato"
	plantname = "Томатные кусты"
	product = /obj/item/food/grown/tomato
	maturation = 8
	instability = 25
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon_grow = "tomato-grow"
	icon_dead = "tomato-dead"
	genes = list(/datum/plant_gene/trait/squash, /datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/tomato/blue, /obj/item/seeds/tomato/blood, /obj/item/seeds/tomato/killer)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	graft_gene = /datum/plant_gene/trait/squash

/obj/item/food/grown/tomato
	seed = /obj/item/seeds/tomato
	name = "томат"
	desc = "Сочный красный томат."
	icon_state = "tomato"
	splat_type = /obj/effect/decal/cleanable/food/tomato_smudge
	foodtypes = VEGETABLES
	distill_reagent = /datum/reagent/consumable/enzyme

/obj/item/food/grown/tomato/grind_results()
	return list(/datum/reagent/consumable/ketchup = 0)

/obj/item/food/grown/tomato/juice_typepath()
	return /datum/reagent/consumable/tomatojuice

// Blood Tomato
/obj/item/seeds/tomato/blood
	name = "пакет семян кровавого томата"
	desc = "Эти семена вырастают в кровавые томатные кусты."
	icon_state = "seed-bloodtomato"
	species = "bloodtomato"
	plantname = "Кровавые томатные кусты"
	product = /obj/item/food/grown/tomato/blood
	mutatelist = null
	reagents_add = list(/datum/reagent/blood = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = PLANT_MODERATELY_RARE

/obj/item/food/grown/tomato/blood
	seed = /obj/item/seeds/tomato/blood
	name = "кровавый томат"
	desc = "Такой кровавый... такой... очень... кровавый... АААА!!!!"
	icon_state = "bloodtomato"
	bite_consumption_mod = 3
	splat_type = /obj/effect/gibspawner/generic
	foodtypes = VEGETABLES | GORE
	distill_reagent = /datum/reagent/consumable/ethanol/bloody_mary

/obj/item/food/grown/tomato/blood/grind_results()
	return list(/datum/reagent/consumable/ketchup = 0, /datum/reagent/blood = 0)

// Blue Tomato
/obj/item/seeds/tomato/blue
	name = "пакет семян синего томата"
	desc = "Эти семена вырастают в синие томатные кусты."
	icon_state = "seed-bluetomato"
	species = "bluetomato"
	plantname = "Синие томатные кусты"
	product = /obj/item/food/grown/tomato/blue
	yield = 2
	icon_grow = "bluetomato-grow"
	mutatelist = list(/obj/item/seeds/tomato/blue/bluespace)
	genes = list(/datum/plant_gene/trait/slip, /datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/lube = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = PLANT_MODERATELY_RARE
	graft_gene = /datum/plant_gene/trait/slip

/obj/item/food/grown/tomato/blue
	seed = /obj/item/seeds/tomato/blue
	name = "синий томат"
	desc = "Синий, скользкий и подозрительно блестящий."
	icon_state = "bluetomato"
	bite_consumption_mod = 2
	splat_type = /obj/effect/decal/cleanable/blood/oil
	distill_reagent = /datum/reagent/consumable/laughter

// Bluespace Tomato
/obj/item/seeds/tomato/blue/bluespace
	name = "пакет семян блюспейс-томата"
	desc = "Эти семена вырастают в блюспейс-томатные кусты."
	icon_state = "seed-bluespacetomato"
	species = "bluespacetomato"
	plantname = "Блюспейс-томатные кусты"
	product = /obj/item/food/grown/tomato/blue/bluespace
	yield = 2
	mutatelist = null
	genes = list(/datum/plant_gene/trait/squash, /datum/plant_gene/trait/slip, /datum/plant_gene/trait/teleport, /datum/plant_gene/trait/repeated_harvest, /datum/plant_gene/trait/backfire/bluespace)
	reagents_add = list(/datum/reagent/lube = 0.2, /datum/reagent/bluespace = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 50
	graft_gene = /datum/plant_gene/trait/teleport

/obj/item/food/grown/tomato/blue/bluespace
	seed = /obj/item/seeds/tomato/blue/bluespace
	name = "\improper блюспейс-томат"
	desc = "Настолько скользкий, что можно проскользнуть сквозь пространство-время."
	icon_state = "bluespacetomato"
	bite_consumption_mod = 3
	distill_reagent = null
	wine_power = 80

// Killer Tomato
/obj/item/seeds/tomato/killer
	name = "пакет семян томата-убийцы"
	desc = "Эти семена вырастают в томатные кусты-убийцы."
	icon_state = "seed-killertomato"
	species = "killertomato"
	plantname = "Томатные кусты-убийцы"
	product = /obj/item/food/grown/tomato/killer
	yield = 2
	genes = list(/datum/plant_gene/trait/mob_transformation/tomato)
	growthstages = 2
	icon_grow = "killertomato-grow"
	icon_harvest = "killertomato-harvest"
	icon_dead = "killertomato-dead"
	mutatelist = null
	rarity = 30

/obj/item/food/grown/tomato/killer
	seed = /obj/item/seeds/tomato/killer
	name = "\improper томат-убийца"
	desc = "Обычный томат... О БОЖЕ, ОН ЕСТ МОИ НОГИ!!"
	icon_state = "killertomato"
	distill_reagent = /datum/reagent/consumable/ethanol/demonsblood
