/obj/machinery/vending/sustenance
	name = "\improper автомат питания"
	desc = "Торговый автомат, выдающий еду согласно разделу 47-C соглашения NT об этичном обращении с заключёнными."
	product_slogans = "Приятного аппетита.;Достаточно калорий для тяжёлого труда."
	product_ads = "Достаточно полезно.;Эффективно произведённый тофу!;М-м-м! Как вкусно!;Поешьте.;Вам нужна еда, чтобы жить!;Даже заключённые заслуживают свой хлеб насущный!;Возьмите ещё сахарной кукурузы!;Попробуйте наши новые стаканчики льда!"
	light_mask = "snack-light-mask"
	icon_state = "sustenance"
	panel_type = "panel2"
	products = list(
		/obj/item/food/tofu/prison = 24,
		/obj/item/food/breadslice/moldy = 15,
		/obj/item/reagent_containers/cup/glass/ice/prison = 12,
		/obj/item/food/candy_corn/prison = 6,
		/obj/item/kitchen/spoon/plastic = 6,
	)
	contraband = list(
		/obj/item/knife = 6,
		/obj/item/kitchen/spoon = 6,
		/obj/item/reagent_containers/cup/glass/coffee = 12,
		/obj/item/tank/internals/emergency_oxygen = 6,
		/obj/item/clothing/mask/breath = 6,
	)

	refill_canister = /obj/item/vending_refill/sustenance
	default_price = PAYCHECK_LOWER
	extra_price = PAYCHECK_LOWER * 0.6
	payment_department = NO_FREEBIES

/obj/machinery/vending/sustenance/interact(mob/living/living_user)
	if(!isliving(living_user))
		return
	if(!istype(living_user.get_idcard(TRUE), /obj/item/card/id/advanced/prisoner))
		if(!req_access)
			speak("Действующий счёт заключённого не найден. Выдача запрещена.")
			return
		if(!allowed(living_user))
			speak("Нет действующих прав доступа. Выдача запрещена.")
			return
	return ..()

/obj/item/vending_refill/sustenance
	machine_name = "автомат питания"
	icon_state = "refill_snack"

//Labor camp subtype that uses labor points obtained from mining and processing ore
/obj/machinery/vending/sustenance/labor_camp
	name = "\improper автомат питания трудового лагеря"
	desc = "Торговый автомат, выдающий еду согласно разделу 47-C соглашения NT об этичном обращении с заключёнными. \
			Этот, однако, принимает трудовые очки за товары, если пользователь находится в заключении."
	icon_state = "sustenance_labor"
	all_products_free = FALSE
	displayed_currency_icon = "digging"
	displayed_currency_name = "LP"
	allow_custom = FALSE

/obj/machinery/vending/sustenance/labor_camp/proceed_payment(obj/item/card/id/advanced/prisoner/paying_scum_id, mob/living/mob_paying, datum/data/vending_product/product_to_vend, price_to_use)
	if(!istype(paying_scum_id))
		speak("Я не беру взятки! Платите трудовыми очками!")
		return FALSE
	if(LAZYLEN(product_to_vend.returned_products))
		price_to_use = 0 //returned items are free
	if(price_to_use && !(paying_scum_id.points >= price_to_use)) //not enough good prisoner points
		speak("У вас недостаточно очков для покупки [product_to_vend.name].")
		flick(icon_deny, src)
		return FALSE

	paying_scum_id.points -= price_to_use
	return TRUE

/obj/machinery/vending/sustenance/labor_camp/fetch_balance_to_use(obj/item/card/id/passed_id)
	if(!istype(passed_id, /obj/item/card/id/advanced/prisoner))
		return null //no points balance - no balance at all
	var/obj/item/card/id/advanced/prisoner/paying_scum_id = passed_id
	return paying_scum_id.points
