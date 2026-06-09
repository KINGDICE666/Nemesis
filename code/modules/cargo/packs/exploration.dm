/// Exploration drone unlockables ///

/datum/supply_pack/exploration
	order_flags = ORDER_SPECIAL
	group = "Аутсорсинг"

/datum/supply_pack/exploration/scrapyard
	name = "Ящик со свалки"
	desc = "Аутсорсинговый ящик с разным хламом."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/relic,
					/obj/item/broken_bottle,
					/obj/item/pickaxe/rusted)
	crate_name = "ящик со свалки"

/datum/supply_pack/exploration/catering
	name = "Ящик кейтеринга"
	desc = "Нет повара? Не проблема! Качество еды может зависеть от поставщика."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/food/sandwich = 5)
	crate_name = "ящик аутсорсинговой еды"

/datum/supply_pack/exploration/catering/fill(obj/structure/closet/crate/crate)
	. = ..()
	if(!prob(30))
		return

	for(var/obj/item/food/food_item in crate)
		// makes all of our items GROSS
		food_item.name = "испорченный [food_item.name]"
		food_item.AddComponentFrom(SOURCE_EDIBLE_INNATE, /datum/component/edible, foodtypes = GROSS)

/datum/supply_pack/exploration/shrubbery
	name = "Ящик кустарников"
	desc = "Ящик, полный кустов для живой изгороди."
	cost = CARGO_CRATE_VALUE * 5
	crate_name = "ящик кустарников"
	var/shrub_amount = 8

/datum/supply_pack/exploration/shrubbery/fill(obj/container)
	for(var/i in 1 to shrub_amount)
		new /obj/item/grown/shrub(container)
