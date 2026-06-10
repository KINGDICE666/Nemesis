/obj/structure/closet/crate/secure
	desc = "Защищённый ящик."
	name = "защищённый ящик"
	icon_state = "securecrate"
	base_icon_state = "securecrate"
	secure = TRUE
	locked = TRUE
	max_integrity = 500
	armor_type = /datum/armor/crate_secure
	damage_deflection = 25

	var/tamperproof = 0

/datum/armor/crate_secure
	melee = 30
	bullet = 50
	laser = 50
	energy = 100
	fire = 80
	acid = 80

/obj/structure/closet/crate/secure/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_MISSING_ITEM_ERROR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NO_MANIFEST_CONTENTS_ERROR, TRAIT_GENERIC)

/obj/structure/closet/crate/secure/take_damage(damage_amount, damage_type = BRUTE, damage_flag = "", sound_effect = TRUE, attack_dir, armour_penetration = 0)
	if(prob(tamperproof) && damage_amount >= DAMAGE_PRECISION)
		boom()
	else
		return ..()

/obj/structure/closet/crate/secure/proc/boom(mob/user)
	if(user)
		to_chat(user, span_danger("Противовзломная система ящика активируется!"))
		log_bomber(user, "has detonated a", src)
	dump_contents()
	explosion(src, heavy_impact_range = 1, light_impact_range = 5, flash_range = 5)
	qdel(src)

/obj/structure/closet/crate/secure/weapon
	desc = "Защищённый ящик с оружием."
	name = "оружейный ящик"
	icon_state = "weaponcrate"
	base_icon_state = "weaponcrate"

/obj/structure/closet/crate/secure/plasma
	desc = "Защищённый ящик с плазмой."
	name = "ящик плазмы"
	icon_state = "plasmacrate"
	base_icon_state = "plasmacrate"

/obj/structure/closet/crate/secure/gear
	desc = "Защищённый ящик со снаряжением."
	name = "ящик снаряжения"
	icon_state = "secgearcrate"
	base_icon_state = "secgearcrate"

/obj/structure/closet/crate/secure/hydroponics
	desc = "Запираемый ящик, окрашенный в цвета станционных ботаников."
	name = "защищённый ящик гидропоники"
	icon_state = "hydrosecurecrate"
	base_icon_state = "hydrosecurecrate"

/obj/structure/closet/crate/secure/freezer //for consistency with other "freezer" closets/crates
	desc = "Запираемый холодильный ящик для скоропортящихся продуктов."
	name = "защищённый кухонный холодильник"
	icon_state = "kitchen_secure_crate"
	base_icon_state = "kitchen_secure_crate"
	paint_jobs = null

/obj/structure/closet/crate/secure/freezer/pizza
	name = "защищённый ящик для пиццы"
	desc = "Утеплённый запираемый ящик для безопасного хранения пиццы."
	tamperproof = 10
	req_access = list(ACCESS_KITCHEN)

/obj/structure/closet/crate/secure/freezer/pizza/PopulateContents()
	. = ..()
	new /obj/effect/spawner/random/food_or_drink/pizzaparty(src)

/obj/structure/closet/crate/secure/centcom
	name = "защищённый ящик ЦентКома"
	icon_state = "centcom_secure"
	base_icon_state = "centcom_secure"

/obj/structure/closet/crate/secure/cargo
	name = "защищённый грузовой ящик"
	icon_state = "cargo_secure"
	base_icon_state = "cargo_secure"

/obj/structure/closet/crate/secure/cargo/mining
	name = "защищённый шахтёрский ящик"
	icon_state = "mining_secure"
	base_icon_state = "mining_secure"

/obj/structure/closet/crate/secure/radiation
	name = "защищённый радиационный ящик"
	icon_state = "radiation_secure"
	base_icon_state = "radiation_secure"

/obj/structure/closet/crate/secure/engineering
	desc = "Запираемый ящик, окрашенный в цвета станционных инженеров."
	name = "защищённый инженерный ящик"
	icon_state = "engi_secure_crate"
	base_icon_state = "engi_secure_crate"

/obj/structure/closet/crate/secure/engineering/atmos
	name = "защищённый ящик атмосферного отдела"
	desc = "Запираемый ящик, окрашенный в цвета инженеров атмосферного отдела."
	icon_state = "atmos_secure"
	base_icon_state = "atmos_secure"


/obj/structure/closet/crate/secure/science
	name = "защищённый научный ящик"
	desc = "Запираемый ящик, окрашенный в цвета станционных учёных."
	icon_state = "scisecurecrate"
	base_icon_state = "scisecurecrate"

/obj/structure/closet/crate/secure/science/robo
	name = "ящик робототехники"
	icon_state = "robo_secure"
	base_icon_state = "robo_secure"

/obj/structure/closet/crate/secure/trashcart
	desc = "Тяжёлая металлическая мусорная тележка на колёсах. Оснащена электронным замком."
	name = "защищённая мусорная тележка"
	max_integrity = 250
	damage_deflection = 10
	icon_state = "securetrashcart"
	base_icon_state = "securetrashcart"
	weld_z = 5
	paint_jobs = null
	req_access = list(ACCESS_JANITOR)

/obj/structure/closet/crate/secure/trashcart/filled

/obj/structure/closet/crate/secure/trashcart/filled/PopulateContents()
	. = ..()
	for(var/i in 1 to rand(8,12))
		new /obj/effect/spawner/random/trash/deluxe_garbage(src)
		if(prob(35))
			new /obj/effect/spawner/random/trash/garbage(src)
	for(var/i in 1 to rand(4,6))
		if(prob(30))
			new /obj/item/storage/bag/trash/filled(src)

/obj/structure/closet/crate/secure/owned
	name = "личный ящик"
	desc = "Защитная крышка ящика открывается только для покупателя содержимого."
	icon_state = "privatecrate"
	base_icon_state = "privatecrate"
	///Account of the person buying the crate if private purchasing.
	var/datum/bank_account/buyer_account
	///Department of the person buying the crate if buying via the NIRN app.
	var/datum/bank_account/department/department_account
	///Is the secure crate opened or closed?
	var/privacy_lock = TRUE
	///Is the crate being bought by a person, or a budget card?
	var/department_purchase = FALSE

/obj/structure/closet/crate/secure/owned/examine(mob/user)
	. = ..()
	. += span_notice("Он закрыт приватным замком и открывается только ID-картой покупателя.")

/obj/structure/closet/crate/secure/owned/Initialize(mapload, datum/bank_account/_buyer_account)
	. = ..()
	buyer_account = _buyer_account
	if(IS_DEPARTMENTAL_ACCOUNT(buyer_account))
		department_purchase = TRUE
		department_account = buyer_account

/obj/structure/closet/crate/secure/owned/togglelock(mob/living/user, silent)
	if(privacy_lock)
		if(!broken)
			var/obj/item/card/id/id_card = user.get_idcard(TRUE)
			if(id_card)
				if(id_card.registered_account)
					if(id_card.registered_account == buyer_account || (department_purchase && (id_card.registered_account?.account_job?.paycheck_department) == (department_account.department_id)))
						if(iscarbon(user))
							add_fingerprint(user)
						locked = !locked
						user.visible_message(span_notice("[user] отпирает приватный замок [src]."),
										span_notice("Вы отпираете приватный замок [src]."))
						privacy_lock = FALSE
						update_appearance()
					else if(!silent)
						to_chat(user, span_warning("Банковский счёт не совпадает с покупателем!"))
				else if(!silent)
					to_chat(user, span_warning("Привязанный банковский счёт не обнаружен!"))
			else if(!silent)
				to_chat(user, span_warning("ID-карта не обнаружена!"))
		else if(!silent)
			to_chat(user, span_warning("[src] сломан!"))
	else ..()

/obj/structure/closet/crate/secure/freezer/interdyne
	name = "\improper морозильник Interdyne"
	desc = "Фирменный морозильник Interdyne Pharmaceuticals. Может содержать свежие органы, а может и нет."
	icon_state = "interdynefreezer"
	base_icon_state = "interdynefreezer"
	req_access = list(ACCESS_SYNDICATE)

/obj/structure/closet/crate/secure/freezer/interdyne/blood
	name = "\improper морозильник крови Interdyne"
	desc = "Фирменный морозильник Interdyne Pharmaceuticals. Предназначен для свежей крови высокого качества."

/obj/structure/closet/crate/secure/freezer/interdyne/blood/PopulateContents()
	. = ..()
	for(var/i in 1 to 13)
		new /obj/item/reagent_containers/blood/random(src)

/obj/structure/closet/crate/secure/freezer/donk
	name = "\improper холодильник Donk Co."
	desc = "Фирменный холодильник Donk Co., сохраняющий свежими донк-покеты и пенные боеприпасы!"
	icon_state = "donkcocrate_secure"
	base_icon_state = "donkcocrate_secure"
	req_access = list(ACCESS_SYNDICATE)

/obj/structure/closet/crate/secure/syndicate
	name = "\improper ящик Синдиката"
	desc = "Защищённый ящик с маркировкой Синдиката."
	icon_state = "syndicrate"
	base_icon_state = "syndicrate"
	req_access = list(ACCESS_SYNDICATE)

/obj/structure/closet/crate/secure/syndicate/interdyne
	name = "\improper ящик Interdyne"
	desc = "Ящик Interdyne Pharmaceutics. Будем надеяться, внутри нет биооружия..."
	icon_state = "interdynecrate"
	base_icon_state = "interdynecrate"

/obj/structure/closet/crate/secure/syndicate/tiger
	name = "\improper ящик Tiger Co-Op"
	icon_state = "tigercrate"
	base_icon_state = "tigercrate"

/obj/structure/closet/crate/secure/syndicate/self
	name = "\improper ящик S.E.L.F."
	desc = "Защищённый ящик, запертый изнутри, со сканирующей панелью сверху и голографическим индикатором состояния замка. Инженеры Sentient Engine Liberation Front любят покрасоваться."
	icon_state = "selfcrate_secure"
	base_icon_state = "selfcrate_secure"

/obj/structure/closet/crate/secure/syndicate/mi13
	name = "таинственный защищённый ящик"
	desc = "Защищённый ящик без очевидных логотипов и кодов отправления, будто взятый прямиком из шпионского фильма."
	icon_state = "mithirteencrate"
	base_icon_state = "mithirteencrate"
	open_sound_volume = 15
	close_sound_volume = 20

/obj/structure/closet/crate/secure/syndicate/arc
	name = "\improper ящик Animal Rights Consortium"
	icon_state = "arccrate"
	base_icon_state = "arccrate"

/obj/structure/closet/crate/secure/syndicate/cybersun
	name = "\improper ящик Cybersun"

/obj/structure/closet/crate/secure/syndicate/cybersun/dawn
	desc = "Защищённый ящик Cybersun Industries. Оранжево-зелёная окраска явно принадлежит какому-то отделу или подразделению, но вы не можете понять какому."
	icon_state = "cyber_dawncrate"
	base_icon_state = "cyber_dawncrate"

/obj/structure/closet/crate/secure/syndicate/cybersun/noon
	desc = "Защищённый ящик Cybersun Industries. Жёлто-оранжевая окраска явно принадлежит какому-то отделу или подразделению, но вы не можете понять какому."
	icon_state = "cyber_nooncrate"
	base_icon_state = "cyber_nooncrate"

/obj/structure/closet/crate/secure/syndicate/cybersun/dusk
	desc = "Защищённый ящик Cybersun Industries. Фиолетово-зелёная окраска явно принадлежит какому-то отделу или подразделению, но вы не можете понять какому."
	icon_state = "cyber_duskcrate"
	base_icon_state = "cyber_duskcrate"

/obj/structure/closet/crate/secure/syndicate/cybersun/night
	desc = "Защищённый ящик Cybersun Industries. Этот явно выкрашен в цвета Синдиката. Остаётся лишь догадываться, что внутри снаряжение для оперативников."
	icon_state = "cyber_nightcrate"
	base_icon_state = "cyber_nightcrate"

/obj/structure/closet/crate/secure/syndicate/wafflecorp
	name = "\improper ящик Waffle corp."
	desc = "Сильно устаревшая модель грузового ящика с современным замком поверх, вполне в духе владельца бренда, Waffle Corporation. Золотая курсивная надпись у логотипа гласит: 'приносим вам завтрак из пятёрки лучших в мире* с 2055 года'. Мелкий шрифт уточняет: '*в 2099-2126 годах'... Сейчас, впрочем, 2563 год."
	icon_state = "wafflecrate"
	base_icon_state = "wafflecrate"

/obj/structure/closet/crate/secure/syndicate/gorlex
	name = "\improper ящик Gorlex Marauders"
	icon_state = "gorlexcrate"
	base_icon_state = "gorlexcrate"

/obj/structure/closet/crate/secure/syndicate/gorlex/weapons
	desc = "Защищённый оружейный ящик Gorlex Marauders."
	name = "оружейный ящик"
	icon_state = "gorlex_weaponcrate"
	base_icon_state = "gorlex_weaponcrate"

/obj/structure/closet/crate/secure/syndicate/gorlex/weapons/bustedlock
	desc = "Потрёпанный оружейный ящик с маркировкой Gorlex Marauders. Замок выглядит сломанным."
	name = "повреждённый оружейный ящик"
	secure = FALSE
	locked = FALSE
	max_integrity = 400
	damage_deflection = 15
