/datum/supply_pack/misc
	group = "Разные припасы"

/datum/supply_pack/misc/artsupply
	name = "Художественные припасы"
	desc = "Устройте немного счастливых случайностей с быстрым укладчиком труб, \
		тремя баллончиками краски и кучей мелков!"
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(/obj/item/rcl,
					/obj/item/storage/toolbox/artistic,
					/obj/item/storage/toolbox/crafter,
					/obj/item/toy/crayon/spraycan = 3,
					/obj/item/storage/crayons,
					/obj/item/toy/crayon/white,
					/obj/item/toy/crayon/rainbow,
				)
	crate_name = "ящик художественных припасов"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/tattoo_kit
	name = "Набор татуировщика"
	desc = "Набор для татуировок с небольшим запасом стартовых чернил."
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(
		/obj/item/tattoo_kit,
		/obj/item/toner = 2)
	crate_name = "ящик татуировщика"
	crate_type = /obj/structure/closet/crate/wooden
	discountable = SUPPLY_PACK_STD_DISCOUNTABLE

/datum/supply_pack/misc/bicycle
	name = "Велосипед"
	desc = "Nanotrasen напоминает всем сотрудникам не играться с силами, которые им неподконтрольны."
	cost = 1000000 //Special case, we don't want to make this in terms of crates because having bikes be a million credits is the whole meme.
	contains = list(/obj/vehicle/ridden/bicycle)
	crate_name = "ящик велосипеда"
	crate_type = /obj/structure/closet/crate/large
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/misc/bigband
	name = "Коллекция инструментов биг-бэнда"
	desc = "Расшевелите свою унылую станцию этой прекрасной коллекцией! \
		Содержит девять разных инструментов!"
	cost = CARGO_CRATE_VALUE * 10
	crate_name = "коллекция музыкальных инструментов биг-бэнда"
	contains = list(/obj/item/instrument/violin,
					/obj/item/instrument/guitar,
					/obj/item/instrument/glockenspiel,
					/obj/item/instrument/accordion,
					/obj/item/instrument/saxophone,
					/obj/item/instrument/trombone,
					/obj/item/instrument/recorder,
					/obj/item/instrument/harmonica,
					/obj/structure/musician/piano/unanchored,
				)
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/book_crate
	name = "Ящик книг"
	desc = "Излишки из архивов Nanotrasen: эти семь книг наверняка будут хорошим чтением."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_LIBRARY
	contains = list(/obj/item/book/codex_gigas,
					/obj/item/book/manual/random = 3,
					/obj/item/book/random = 3,
				)
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/commandkeys
	name = "Ящик ключей шифрования командования"
	desc = "Набор ключей шифрования, дающих доступ к радиосети командования. \
		Nanotrasen напоминает неавторизованным сотрудникам не подслушивать защищённые каналы связи, \
		или хотя бы свести издёвки над командным составом к минимуму."
	access_view = ACCESS_COMMAND
	access = ACCESS_COMMAND
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/encryptionkey/headset_com = 3)
	crate_type = /obj/structure/closet/crate/secure/centcom
	crate_name = "ящик ключей шифрования командования"

/datum/supply_pack/misc/exploration_drone
	name = "Разведывательный дрон"
	desc = "Запасной дальнобойный разведывательный дрон."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/exodrone)
	crate_name = "ящик экзодрона"

/datum/supply_pack/misc/exploration_fuel
	name = "Топливная таблетка дрона"
	desc = "Свежий бак топлива для разведывательного дрона."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/fuel_pellet)
	crate_name = "ящик топлива экзодрона"

/datum/supply_pack/misc/paper
	name = "Ящик бюрократии"
	desc = "Высокие стопки бумаг на столе - большая проблема; уменьшите её до размера горошины \
		с этими бюрократическими припасами! Содержит шесть ручек, немного фотоплёнки, припасы для ручного этикетировщика, \
		лоток бумаги, лоток копировальной бумаги, три папки, лазерную указку, два планшета и две печати."
	cost = CARGO_CRATE_VALUE * 3.2
	contains = list(/obj/structure/filingcabinet/chestdrawer/wheeled,
					/obj/item/camera_film,
					/obj/item/hand_labeler,
					/obj/item/hand_labeler_refill = 2,
					/obj/item/paper_bin,
					/obj/item/paper_bin/carbon,
					/obj/item/pen/fourcolor = 2,
					/obj/item/pen,
					/obj/item/pen/fountain,
					/obj/item/pen/blue,
					/obj/item/pen/red,
					/obj/item/folder/blue,
					/obj/item/folder/red,
					/obj/item/folder/yellow,
					/obj/item/clipboard = 2,
					/obj/item/storage/box/stamps,
					/obj/item/laser_pointer/purple,
				)
	crate_name = "ящик бюрократии"

/datum/supply_pack/misc/fountainpens
	name = "Ящик каллиграфии"
	desc = "Подписывайте смертные приговоры стильно с этими семью представительскими перьевыми ручками."
	cost = CARGO_CRATE_VALUE * 1.45
	contains = list(/obj/item/storage/box/fountainpens)
	crate_type = /obj/structure/closet/crate/wooden
	crate_name = "ящик каллиграфии"

/datum/supply_pack/misc/wrapping_paper
	name = "Ящик праздничной упаковочной бумаги"
	desc = "Хотите отправить близким подарочно упакованные шоколадки, плюшевые игрушки или отрезанную голову клоуна? \
		Всё это можно сделать с ящиком, полным упаковочной бумаги."
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(/obj/item/stack/wrapping_paper)
	crate_type = /obj/structure/closet/crate/wooden
	crate_name = "ящик праздничной упаковочной бумаги"


/datum/supply_pack/misc/funeral
	name = "Ящик похоронных принадлежностей"
	desc = "В конце концов кому-нибудь обязательно понадобится чья-то смерть. Устройте достойные проводы с этими \
		похоронными принадлежностями! Содержит гроб с погребальной одеждой и цветами."
	cost = CARGO_CRATE_VALUE * 1.6
	access_view = ACCESS_CHAPEL_OFFICE
	contains = list(/obj/item/clothing/under/misc/burial,
					/obj/item/food/grown/harebell,
					/obj/item/food/grown/poppy/geranium,
				)
	crate_name = "гроб"
	crate_type = /obj/structure/closet/crate/coffin

/datum/supply_pack/misc/empty
	name = "Пустая капсула снабжения"
	desc = "Представляем новую блюспейс-капсулу снабжения бренда Nanotrasen! Перевозите грузы изящно и легко! \
		Позвоните сегодня, и мы отправим демонстрационный экземпляр всего за 300 кредитов!"
	cost = CARGO_CRATE_VALUE * 0.6 //Empty pod, so no crate refund
	contains = list()
	order_flags = ORDER_POD_ONLY
	crate_type = null
	special_pod = /obj/structure/closet/supplypod/bluespacepod

/datum/supply_pack/misc/empty/generate(atom/A, datum/bank_account/paying_account, crate_override)
	return

/datum/supply_pack/misc/religious_supplies
	name = "Ящик религиозных принадлежностей"
	desc = "Держите местного священника довольным и снабжённым, иначе он призовёт суд на ваш \
		карго-отсек. Содержит две бутылки святой воды, библии, робы священника и погребальные одежды."
	cost = CARGO_CRATE_VALUE * 6 // it costs so much because the Space Church needs funding to build a cathedral
	access_view = ACCESS_CHAPEL_OFFICE
	contains = list(/obj/item/reagent_containers/cup/glass/bottle/holywater = 2,
					/obj/item/book/bible/booze = 2,
					/obj/item/clothing/suit/hooded/chaplain_hoodie = 2,
					/obj/item/clothing/under/misc/burial = 2,
				)
	crate_name = "ящик религиозных принадлежностей"

/datum/supply_pack/misc/candles_bulk
	name = "Ящик коробок свечей"
	desc = "Осветите местную часовню тремя коробками свечей!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/fancy/candle_box = 3)
	crate_name = "ящик коробок свечей"

/datum/supply_pack/misc/toner
	name = "Ящик тонера"
	desc = "Потратили слишком много чернил на печать задниц? Не переживайте: с этими шестью заправками тонера \
		вы будете печатать задницы до второго пришествия!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/toner = 6)
	crate_name = "ящик тонера"

/datum/supply_pack/misc/toner_large
	name = "Ящик тонера (большой)"
	desc = "Устали менять картриджи тонера? Эти шесть особо мощных заправок содержат \
		примерно в пять раз больше тонера, чем базовая модель!"
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/toner/large = 6)
	crate_name = "большой ящик тонера"

/datum/supply_pack/misc/training_toolbox
	name = "Ящик тренировочных инструментальных ящиков"
	desc = "Оттачивайте боевые навыки с двумя тренировочными ящиками для инструментов бренда AURUMILL! \
		Гарантированно считает удары по живым существам!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/training_toolbox = 2)
	crate_name = "ящик тренировочных инструментальных ящиков"

///Special supply crate that generates random syndicate gear up to a determined TC value
/datum/supply_pack/misc/syndicate
	name = "Разное снаряжение Синдиката"
	desc = "Содержит случайный набор снаряжения Синдиката."
	order_flags = ORDER_SPECIAL //Cannot be ordered via cargo
	contains = list()
	crate_name = "ящик снаряжения Синдиката"
	crate_type = /obj/structure/closet/crate
	test_ignored = TRUE
	///Total TC worth of contained uplink items
	var/crate_value = 30
	///What uplink the contents are pulled from
	var/contents_uplink_type = UPLINK_TRAITORS

///Generate assorted uplink items, taking into account the same surplus modifiers used for surplus crates
/datum/supply_pack/misc/syndicate/fill(obj/container)
	var/list/uplink_items = list()
	for(var/datum/uplink_item/item as anything in SStraitor.uplink_items)
		if(item.purchasable_from & contents_uplink_type && item.item)
			uplink_items += item

	while(crate_value)
		var/datum/uplink_item/uplink_item = pick(uplink_items)
		if(!uplink_item.surplus || prob(100 - uplink_item.surplus))
			continue
		if(length(uplink_item.restricted_roles) || length(uplink_item.restricted_species))
			continue
		if(crate_value < uplink_item.cost)
			continue
		crate_value -= uplink_item.cost
		new uplink_item.item(container)

///Syndicate supply crate that can have its contents value changed by admins, uses a seperate datum to avoid having admins touch the original one.
/datum/supply_pack/misc/syndicate/custom_value

/datum/supply_pack/misc/syndicate/custom_value/proc/setup_contents(value, uplink)
	crate_value = value
	contents_uplink_type = uplink

/datum/supply_pack/misc/papercutter
	name = "Ящик резаков для бумаги"
	desc = "Содержит 3 офисных резака для бумаги с острыми лезвиями, способными разрезать любой лист на две тонкие полоски.\
		Поставляется с одним запасным лезвием."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(
		/obj/item/papercutter = 3,
		/obj/item/hatchet/cutterblade = 1,
	)
	crate_name = "ящик резаков для бумаги"

/datum/supply_pack/misc/water_cooler
	name = "Кулер жидкости - вода"
	desc = "Кулер жидкости, наполненный самой свежей водой во всей Периферии. Идеально для траты времени в офисе!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/structure/reagent_dispensers/water_cooler/jugless = 1, /obj/item/reagent_containers/cooler_jug/water = 1)
	crate_name = "ящик кулера воды"

/datum/supply_pack/misc/punch_cooler
	name = "Кулер жидкости - фруктовый пунш"
	desc = "Кулер жидкости, наполненный экзотическим фруктовым пуншем, способным лечить травмы! Ради собственного здоровья и безопасности оставайтесь рядом с кулером во время питья. Серьёзно, НЕ пейте это вдали от кулера."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/structure/reagent_dispensers/water_cooler/jugless = 1, /obj/item/reagent_containers/cooler_jug/punch = 1)
	crate_name = "ящик кулера пунша"
