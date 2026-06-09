/datum/supply_pack/security
	group = "Служба безопасности"
	access = ACCESS_SECURITY
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/security/ammo
	name = "Ящик боеприпасов"
	desc = "Содержит три коробки мешочных ружейных патронов, три коробки \
		резиновой дроби и по одному специальному спидлоадеру .38 каждого типа."
	cost = CARGO_CRATE_VALUE * 8
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/beanbag = 3,
					/obj/item/storage/box/rubbershot = 3,
					/obj/item/ammo_box/speedloader/c38/trac,
					/obj/item/ammo_box/speedloader/c38/hotshot,
					/obj/item/ammo_box/speedloader/c38/iceblox,
				)
	crate_name = "ящик боеприпасов"

/datum/supply_pack/security/armor
	name = "Ящик брони"
	desc = "Три сбалансированных бронежилета с приличной защитой."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/suit/armor/vest = 3)
	crate_name = "ящик брони"

/datum/supply_pack/security/modsuit_plating
	name = "Пластины MOD службы безопасности"
	desc = "Один комплект пластин MOD-костюма службы безопасности."
	cost = CARGO_CRATE_VALUE
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/mod/construction/plating/security)
	crate_name = "ящик пластин MOD"

/datum/supply_pack/security/disabler
	name = "Ящик дизейблеров"
	desc = "Три дизейблера, истощающих выносливость."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/gun/energy/disabler = 3)
	crate_name = "ящик дизейблеров"

/datum/supply_pack/security/forensics
	name = "Ящик криминалистики"
	desc = "Идите по горячим следам преступника с детективным набором Nanotrasen™. \
		Содержит криминалистический сканер, шесть пакетов для улик, камеру, специальную доску для улик, диктофон, мел \
		и, конечно же, федору."
	cost = CARGO_CRATE_VALUE * 2.5
	access_view = ACCESS_MORGUE
	contains = list(/obj/item/detective_scanner,
					/obj/item/storage/box/evidence,
					/obj/item/camera,
					/obj/item/taperecorder,
					/obj/item/toy/crayon/white,
					/obj/item/clothing/head/fedora/det_hat,
					/obj/item/wallframe/detectiveboard
				)
	crate_name = "ящик криминалистики"

/datum/supply_pack/security/helmets
	name = "Ящик шлемов"
	desc = "Содержит три стандартных защитных ведра для головы."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/head/helmet/sec = 3)
	crate_name = "ящик шлемов"

/datum/supply_pack/security/securitybarriers
	name = "Гранаты барьеров безопасности"
	desc = "Сдержите поток четырьмя гранатами барьеров безопасности."
	access_view = ACCESS_BRIG
	contains = list(/obj/item/grenade/barrier = 4)
	cost = CARGO_CRATE_VALUE * 2
	crate_name = "ящик барьеров безопасности"

/datum/supply_pack/security/securityclothes
	name = "Ящик одежды службы безопасности"
	desc = "Содержит подходящую одежду для частной охраны станции. \
		Включает комплекты для смотрителя, главы службы безопасности и двух офицеров службы безопасности. \
		Каждый комплект содержит комбинезон, костюм и берет по званию."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/under/rank/security/officer/formal = 2,
					/obj/item/clothing/suit/jacket/officer/blue = 2,
					/obj/item/clothing/head/beret/sec/navyofficer = 2,
					/obj/item/clothing/under/rank/security/warden/formal,
					/obj/item/clothing/suit/jacket/warden/blue,
					/obj/item/clothing/head/beret/sec/navywarden,
					/obj/item/clothing/under/rank/security/head_of_security/formal,
					/obj/item/clothing/suit/jacket/hos/blue,
					/obj/item/clothing/head/hats/hos/beret/navyhos,
				)
	crate_name = "ящик одежды службы безопасности"

/datum/supply_pack/security/stingpack
	name = "Набор гранат Stingbang"
	desc = "Содержит пять гранат Stingbang, идеально подходящих для подавления \
		бунтов и морально немыслимых розыгрышей."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "ящик набора гранат Stingbang"

/datum/supply_pack/security/supplies
	name = "Ящик припасов службы безопасности"
	desc = "Содержит семь светошумовых гранат, семь гранат со слезоточивым газом, шесть вспышек и семь наручников."
	cost = CARGO_CRATE_VALUE * 3.5
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/flashbangs,
					/obj/item/storage/box/teargas,
					/obj/item/storage/box/flashes,
					/obj/item/storage/box/handcuffs,
				)
	crate_name = "ящик припасов службы безопасности"

/datum/supply_pack/security/maintenance_kits
	name = "Наборы обслуживания оружия"
	desc = "Три набора для ремонта и обслуживания огнестрельного оружия."
	access_view = ACCESS_BRIG
	contains = list(/obj/item/gun_maintenance_supplies = 3)
	cost = CARGO_CRATE_VALUE * 2
	crate_name = "ящик наборов обслуживания оружия"

/datum/supply_pack/security/firingpins
	name = "Ящик стандартных ударников"
	desc = "Улучшите арсенал десятью стандартными ударниками."
	cost = CARGO_CRATE_VALUE * 4
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/firingpins = 2)
	crate_name = "ящик ударников"

/datum/supply_pack/security/firingpins/paywall
	name = "Ящик платных ударников"
	desc = "Специализированные ударники со встроенной настраиваемой платной блокировкой."
	cost = CARGO_CRATE_VALUE * 2
	access_view = ACCESS_ARMORY
	contains = list(/obj/item/storage/box/firingpins/paywall = 2)
	crate_name = "ящик платных ударников"

/datum/supply_pack/security/justiceinbound
	name = "Ящик стандартного вершителя правосудия"
	desc = "Вот оно. Лучшее из лучшего. Сливки общества. Самый лакомый кусок. \
		Лучшее из лучшего из лучшего. Жемчужина короны Nanotrasen. \
		Альфа и омега головных уборов службы безопасности. Гарантированно вселяет страх в сердца \
		каждого преступника на станции. Также поставляется с противогазом службы безопасности."
	cost = CARGO_CRATE_VALUE * 6 //justice comes at a price. An expensive, noisy price.
	order_flags = ORDER_CONTRABAND
	contains = list(/obj/item/clothing/head/helmet/toggleable/justice,
					/obj/item/clothing/mask/gas/sechailer,
				)
	crate_name = "ящик одежды службы безопасности"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/security/baton
	name = "Ящик оглушающих дубинок"
	desc = "Вооружите силы гражданской защиты тремя оглушающими дубинками. Батареи включены."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/melee/baton/security/loaded = 3)
	crate_name = "ящик оглушающих дубинок"

/datum/supply_pack/security/wall_flash
	name = "Ящик настенных вспышек"
	desc = "Содержит четыре настенные вспышки."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/wall_flash = 4)
	crate_name = "ящик настенных вспышек"

/datum/supply_pack/security/constable
	name = "Ящик традиционного снаряжения"
	desc = "Запасное снаряжение, найденное на складе. Содержит форму констебля, \
		свисток и набор переоснащения."
	cost = CARGO_CRATE_VALUE * 2.2
	order_flags = ORDER_CONTRABAND
	contains = list(/obj/item/clothing/under/rank/security/constable,
					/obj/item/clothing/head/costume/constable,
					/obj/item/clothing/gloves/color/white,
					/obj/item/clothing/mask/whistle,
					/obj/item/conversion_kit,
				)
	crate_name = "ящик традиционного снаряжения"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/// Armory packs

/datum/supply_pack/security/armory
	group = "Оружейная"
	access = ACCESS_ARMORY
	access_view = ACCESS_ARMORY
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/security/armory/bulletarmor
	name = "Ящик пуленепробиваемой брони"
	desc = "Содержит три комплекта пуленепробиваемой брони. Гарантированно снижает \
		останавливающее действие пули более чем вдвое."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/suit/armor/bulletproof = 3)
	crate_name = "ящик пуленепробиваемой брони"

/datum/supply_pack/security/armory/bullethelmets
	name = "Ящик пуленепробиваемых шлемов"
	desc = "Содержит три пуленепробиваемых шлема."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/head/helmet/alt = 3)
	crate_name = "ящик пуленепробиваемых шлемов"

/datum/supply_pack/security/armory/chemimp
	name = "Ящик химических имплантов"
	desc = "Содержит пять дистанционных химических имплантов."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/storage/box/chemimp)
	crate_name = "ящик химических имплантов"

/datum/supply_pack/security/armory/ballistic
	name = "Ящик боевых дробовиков"
	desc = "На случай, когда противника совершенно необходимо заменить свинцом. \
		Содержит три боевых дробовика разработки Aussec и три патронташа для дробовика."
	cost = CARGO_CRATE_VALUE * 17.5
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat = 3,
					/obj/item/storage/belt/bandolier = 3)
	crate_name = "ящик боевых дробовиков"

/datum/supply_pack/security/armory/dragnet
	name = "Ящик транслокационных дробовиков DRAGnet"
	desc = "Содержит два транслокационных дробовика DRAGnet \
		- недавний прорыв в технологиях управления заключёнными для правоохранителей. Включает маяк DRAGnet."
	cost = CARGO_CRATE_VALUE * 18
	contains = list(
		/obj/item/gun/energy/e_gun/dragnet = 2,
		/obj/item/dragnet_beacon = 1
	)
	crate_name = "\improper ящик DRAGnet"

/datum/supply_pack/security/armory/energy
	name = "Ящик энергетических пистолетов"
	desc = "Содержит три энергетических пистолета, способных стрелять как нелетальными, так и летальными \
		световыми зарядами."
	cost = CARGO_CRATE_VALUE * 18
	contains = list(/obj/item/gun/energy/e_gun = 3)
	crate_name = "ящик энергетических пистолетов"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/armory/laser
	name = "Ящик лазерных пистолетов Type 5"
	desc = "Содержит три лазерных пистолета Type 5, разработанных Nanotrasen. Когда становится жарко, вы отвечаете \
		системой доставки тепла Type 5. Разработано Nanotrasen."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/gun/energy/laser = 3)
	crate_name = "\improper ящик лазеров Type 5"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/armory/laser_carbine
	name = "Ящик лазерных карабинов Type 5/R"
	desc = "Содержит три лазерных карабина Type 5R, разработанных Nanotrasen. Стреляет быстрой очередью чуть более слабых лазерных снарядов."
	cost = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/gun/energy/laser/carbine = 3)
	crate_name = "\improper ящик лазерных карабинов Type 5R"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/armory/disabler_smg
	name = "Ящик ПП-дизейблеров"
	desc = "Содержит три ПП-дизейблера, способных быстро стрелять слабыми дизейблерными лучами."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/energy/disabler/smg = 3)
	crate_name = "ящик ПП-дизейблеров"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/armory/battle_rifle
	name = "Ящик NT BR-38"
	desc = "Экспериментальная баллистическая боевая винтовка на энергетической основе, разработанная Nanotrasen. \
		Доступна только станциям Nanotrasen для нужд безопасности. НЕ ПЕРЕПРОДАВАТЬ СТОРОННИМ \
		КОМПАНИЯМ. Содержит три винтовки NT BR-38 и 6 магазинов с .38 Standard."
	cost = CARGO_CRATE_VALUE * 100
	contains = list(
		/obj/item/gun/ballistic/automatic/battle_rifle = 3,
		/obj/item/ammo_box/magazine/m38 = 6,
	)
	crate_name = "ящик боевых винтовок"

/datum/supply_pack/security/armory/br_mag
	name = "Ящик магазинов NT BR-38"
	desc = "Шесть магазинов .38, подходящих к NT BR-38. Содержит \
		два стандартных магазина, два магазина Hot Shot и два магазина Iceblox."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(
		/obj/item/ammo_box/magazine/m38 = 2,
		/obj/item/ammo_box/magazine/m38/hotshot = 2,
		/obj/item/ammo_box/magazine/m38/iceblox =2,
	)
	crate_name = "ящик магазинов .38"

/datum/supply_pack/security/armory/exileimp
	name = "Ящик имплантов изгнания"
	desc = "Содержит пять имплантов изгнания."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/storage/box/exileimp)
	crate_name = "ящик имплантов изгнания"

/datum/supply_pack/security/armory/fire
	name = "Ящик зажигательного оружия"
	desc = "Гори, гори ясно. Содержит три зажигательные гранаты, три плазменные канистры \
		и огнемёт."
	cost = CARGO_CRATE_VALUE * 7
	access = ACCESS_COMMAND
	contains = list(/obj/item/flamethrower/full,
					/obj/item/tank/internals/plasma = 3,
					/obj/item/grenade/chem_grenade/incendiary = 3,
				)
	crate_name = "ящик зажигательного оружия"
	crate_type = /obj/structure/closet/crate/secure/plasma
	order_flags = ORDER_DANGEROUS

/datum/supply_pack/security/armory/mindshield
	name = "Ящик имплантов защиты разума"
	desc = "Предотвращайте радикальные мысли с тремя имплантами защиты разума."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/storage/lockbox/loyalty)
	crate_name = "ящик имплантов защиты разума"

/datum/supply_pack/security/armory/trackingimp
	name = "Ящик отслеживающих имплантов"
	desc = "Содержит четыре отслеживающих импланта и три отслеживающих спидлоадера патронов .38."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/storage/box/trackimp,
					/obj/item/ammo_box/speedloader/c38/trac = 3,
				)
	crate_name = "ящик отслеживающих имплантов"

/datum/supply_pack/security/armory/laserarmor
	name = "Ящик отражающих бронежилетов"
	desc = "Содержит два бронежилета из высокоотражающего материала. Каждая единица брони \
		рассеивает более половины энергии лазера, а также даёт хороший шанс \
		полностью отразить лазер."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/clothing/suit/armor/laserproof = 2)
	crate_name = "ящик отражающих бронежилетов"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/armory/riotarmor
	name = "Ящик противобунтовой брони"
	desc = "Содержит три комплекта тяжёлой брони. Продвинутая подкладка защищает \
		от оружия ближнего боя, из-за чего удары вблизи ощущаются для пользователя \
		лишь в половину силы."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/clothing/suit/armor/riot = 3)
	crate_name = "ящик противобунтовой брони"

/datum/supply_pack/security/armory/riothelmets
	name = "Ящик противобунтовых шлемов"
	desc = "Содержит три противобунтовых шлема."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/clothing/head/helmet/toggleable/riot = 3)
	crate_name = "ящик противобунтовых шлемов"

/datum/supply_pack/security/armory/riotshields
	name = "Ящик противобунтовых щитов"
	desc = "На случай, когда серая волна совсем обнаглеет. Содержит три противобунтовых щита."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/shield/riot = 3)
	crate_name = "ящик противобунтовых щитов"

/datum/supply_pack/security/armory/swat
	name = "Ящик SWAT"
	desc = "Содержит два полных комплекта прочных огнестойких костюмов, созданных совместными \
		усилиями IS-ERI и Nanotrasen. Каждый комплект содержит костюм, шлем, маску, боевой пояс \
		и тактические перчатки."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/clothing/head/helmet/swat/nanotrasen = 2,
					/obj/item/clothing/suit/armor/swat = 2,
					/obj/item/clothing/mask/gas/sechailer/swat = 2,
					/obj/item/storage/belt/military/assault = 2,
					/obj/item/clothing/gloves/tackler/combat = 2,
				)
	crate_name = "ящик SWAT"

/datum/supply_pack/security/armory/thermal
	name = "Ящик термальных пистолетов"
	desc = "Содержит пару кобур, в каждой по два экспериментальных термальных пистолета, \
		использующих наниты как основу боеприпасов. Для перезарядки можно встряхнуть."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/storage/belt/holster/energy/thermal = 2)
	crate_name = "ящик термальных пистолетов"

/datum/supply_pack/security/sunglasses
	name = "Ящик солнцезащитных очков"
	desc = "Одна пара солнцезащитных очков с защитой от вспышек."
	cost = CARGO_CRATE_VALUE * 2
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/glasses/sunglasses = 1)
	crate_name = "ящик солнцезащитных очков"

/datum/supply_pack/security/armory/mechthermal
	name = "Ящик тяжёлых термальных пушек"
	desc = "Содержит две экспериментальные термальные пушки для мехов. \
		При одновременном использовании их избыточная мощность нагревает и охлаждает противоположное оружие, \
		увеличивая скорость перезарядки."
	cost = CARGO_CRATE_VALUE * 25
	contains = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/thermal/cryo,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/thermal/inferno,
	)
	crate_name = "ящик термальных пушек"

/datum/supply_pack/security/blood_worm_testers
	name = "Ящик тестеров гемопаразитов"
	desc = "Содержит четыре одноразовых инструмента для проверки на гемопаразитов. \
		Эти устройства точно сообщают, заселён ли пациент гемопаразитом, например печально известным космическим кровяным червём. \
		Медицинская корпорация DeForest не несёт ответственности за психические и/или физические травмы пациентов, вызванные неправильным использованием этих устройств."
	cost = CARGO_CRATE_VALUE * 50 // These aren't meant to be bought en-masse.
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/blood_worm_tester = 4)
	crate_name = "ящик тестеров гемопаразитов"
