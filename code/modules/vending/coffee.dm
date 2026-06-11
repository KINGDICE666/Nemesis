/obj/machinery/vending/coffee
	name = "\improper Solar's Best Hot Drinks"
	desc = "Торговый автомат, выдающий горячие напитки."
	product_ads = "Выпейте!;Пейте до дна!;Это полезно!;Хотите горячего кофе?;Я бы убил за кофе!;Лучшие зёрна в галактике.;Только лучший напиток для вас.;М-м-м. Ничто не сравнится с кофе.;Я люблю кофе, а вы?;Кофе помогает работать!;Попробуйте чай.;Надеемся, вам нравится лучшее!;Попробуйте наш новый шоколад!;Админские заговоры"
	icon_state = "coffee"
	icon_vend = "coffee-vend"
	panel_type = "panel9"
	products = list(
		/obj/item/reagent_containers/cup/glass/coffee = 6,
		/obj/item/reagent_containers/cup/glass/mug/tea = 6,
		/obj/item/reagent_containers/cup/glass/mug/coco = 3,
	)
	contraband = list(
		/obj/item/reagent_containers/cup/glass/ice = 12,
	)
	refill_canister = /obj/item/vending_refill/coffee
	default_price = PAYCHECK_LOWER
	extra_price = PAYCHECK_CREW
	payment_department = ACCOUNT_SRV
	light_mask = "coffee-light-mask"
	light_color = COLOR_DARK_MODERATE_ORANGE

/obj/item/vending_refill/coffee
	machine_name = "Solar's Best Hot Drinks"
	icon_state = "refill_joe"
