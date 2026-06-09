/datum/supply_pack/service
	group = "Сервис"

/datum/supply_pack/service/cargo_supples
	name = "Ящик снабжения карго"
	desc = "Продали всё, что не было прикручено? Вы можете сразу \
		вернуться к работе с этим ящиком, содержащим печати, экспортный сканер, \
		маркиратор назначения, ручной этикетировщик и немного упаковочной плёнки."
	cost = CARGO_CRATE_VALUE * 1.75
	contains = list(/obj/item/stamp/granted,
					/obj/item/stamp/denied,
					/obj/item/universal_scanner,
					/obj/item/dest_tagger,
					/obj/item/hand_labeler,
					/obj/item/stack/package_wrap,
				)
	crate_name = "ящик снабжения карго"

/datum/supply_pack/service/noslipfloor
	name = "Напольная плитка с высоким сцеплением"
	desc = "Оставьте скольжение в прошлом с тридцатью промышленными противоскользящими плитками!"
	cost = CARGO_CRATE_VALUE * 4
	access_view = ACCESS_JANITOR
	contains = list(/obj/item/stack/tile/noslip/thirty)
	crate_name = "ящик плитки с высоким сцеплением"

/datum/supply_pack/service/janitor
	name = "Ящик уборочных припасов"
	desc = "Дайте отпор грязи и налёту с уборочным набором Nanotrasen™! \
		Содержит по три ведра, предупреждающих знака и чистящих гранаты. Также включает одну швабру, \
		метлу, чистящий спрей, тряпку и мешок для мусора."
	cost = CARGO_CRATE_VALUE * 2
	access_view = ACCESS_JANITOR
	contains = list(/obj/item/reagent_containers/cup/bucket = 3,
					/obj/item/mop,
					/obj/item/pushbroom,
					/obj/item/clothing/suit/caution = 3,
					/obj/item/storage/bag/trash,
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/rag,
					/obj/item/grenade/chem_grenade/cleaner = 3,
				)
	crate_name = "ящик уборочных припасов"

/datum/supply_pack/service/janitor/janicart
	name = "Ящик уборочной тележки и галош"
	desc = "Ключ к успеху любого уборщика. Пока у вас есть ноги, эта пара \
		галош будет крепко держать их на полу. Также содержит уборочную тележку."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/structure/mop_bucket/janitorialcart,
					/obj/item/clothing/shoes/galoshes,
				)
	crate_name = "ящик уборочной тележки"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/service/janitor/janitank
	name = "Ящик ранца уборщика"
	desc = "Призовите божественный суд на грязь и налёт с этим вместительным уборочным \
		ранцем. Содержит 500 единиц станционного чистящего средства."
	cost = CARGO_CRATE_VALUE * 2
	access = ACCESS_JANITOR
	contains = list(/obj/item/watertank/janitor)
	crate_name = "ящик ранца уборщика"
	crate_type = /obj/structure/closet/crate/secure

/datum/supply_pack/service/mule
	name = "Ящик MULEbot"
	desc = "Розововолосый квартирмейстер не справляется с работой? Замените его этим неутомимым работником уже сегодня! \
		Содержит одного MULEbot."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/simple_animal/bot/mulebot)
	crate_name = "\improper ящик MULEbot"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/service/party
	name = "Вечериночное снаряжение"
	desc = "Празднуйте жизнь и смерть на станции с вечериночным набором Nanotrasen™! \
		Содержит семь цветных светящихся палочек, шесть бутылок пива, шесть газировок, два эля, бутылку патрона, \
		гольдшлегер и шейкер!"
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/storage/box/drinkingglasses,
					/obj/item/reagent_containers/cup/glass/shaker,
					/obj/item/reagent_containers/cup/glass/bottle/patron,
					/obj/item/reagent_containers/cup/glass/bottle/goldschlager,
					/obj/item/reagent_containers/cup/glass/bottle/ale = 2,
					/obj/item/storage/cans/sixbeer,
					/obj/item/storage/cans/sixsoda,
					/obj/item/flashlight/glowstick,
					/obj/item/flashlight/glowstick/red,
					/obj/item/flashlight/glowstick/blue,
					/obj/item/flashlight/glowstick/cyan,
					/obj/item/flashlight/glowstick/orange,
					/obj/item/flashlight/glowstick/yellow,
					/obj/item/flashlight/glowstick/pink,
				)
	crate_name = "ящик вечериночного снаряжения"

/datum/supply_pack/service/carpet
	name = "Ящик премиального ковра"
	desc = "Железная напольная плитка действует на нервы? Эти стопки особенно мягкого ковра \
		свяжут любую комнату воедино. Содержит по 100 плиток обычного и чёрного ковра."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/stack/tile/carpet/fifty = 2,
					/obj/item/stack/tile/carpet/black/fifty = 2)
	crate_name = "ящик премиального ковра"
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/carpet_exotic
	name = "Ящик экзотического ковра"
	desc = "Экзотические ковры прямо из Космической России для всех ваших декоративных нужд. \
		Содержит по 100 плиток 8 разных узоров пола."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/stack/tile/carpet/blue/fifty = 2,
					/obj/item/stack/tile/carpet/cyan/fifty = 2,
					/obj/item/stack/tile/carpet/green/fifty = 2,
					/obj/item/stack/tile/carpet/orange/fifty = 2,
					/obj/item/stack/tile/carpet/purple/fifty = 2,
					/obj/item/stack/tile/carpet/red/fifty = 2,
					/obj/item/stack/tile/carpet/royalblue/fifty = 2,
					/obj/item/stack/tile/carpet/royalblack/fifty = 2,
				)
	crate_name = "ящик экзотического ковра"
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/carpet_neon
	name = "Ящик простого неонового ковра"
	desc = "Простые резиновые коврики с фосфоресцентной окантовкой. Содержит по 120 плиток \
		13 цветовых вариантов. Ограниченный выпуск."
	cost = CARGO_CRATE_VALUE * 15
	contains = list(/obj/item/stack/tile/carpet/neon/simple/white/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/black/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/red/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/orange/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/yellow/sixty =2,
					/obj/item/stack/tile/carpet/neon/simple/lime/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/green/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/teal/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/cyan/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/blue/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/purple/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/violet/sixty = 2,
					/obj/item/stack/tile/carpet/neon/simple/pink/sixty = 2,
				)
	crate_name = "ящик неонового ковра"
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/lightbulbs
	name = "Запасные лампы"
	desc = "Да озарит эту станцию свет Эфира! Или хотя бы свет \
		сорока двух световых трубок и двадцати одной лампочки."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/lights/mixed = 3)
	crate_name = "запасные лампы"

/datum/supply_pack/service/minerkit
	name = "Стартовый набор шахтёра"
	desc = "Все шахтёры слишком быстро умерли? Ассистент хочет вкусить жизнь вне станции? \
		В любом случае этот набор - лучший способ превратить обычного члена экипажа в добывающую руду \
		и уничтожающую чудовищ машину. Содержит мезонные очки, кирку, продвинутый шахтёрский сканер, \
		гарнитуру карго, мешок для руды, противогаз, костюм исследователя и улучшение ID шахтёра."
	cost = CARGO_CRATE_VALUE * 4
	access = ACCESS_QM
	access_view = ACCESS_MINING_STATION
	contains = list(/obj/item/storage/backpack/duffelbag/mining_conscript)
	crate_name = "стартовый набор шахтёра"
	crate_type = /obj/structure/closet/crate/secure/cargo/mining

/datum/supply_pack/service/survivalknives
	name = "Ящик ножей выживания"
	desc = "Содержит три заточенных ножа выживания. Каждый нож гарантированно удобно помещается \
		в любой стандартный ботинок Nanotrasen."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/knife/combat/survival = 3)
	crate_name = "ящик ножей выживания"
	crate_type = /obj/structure/closet/crate/cargo/mining

/datum/supply_pack/service/wedding
	name = "Свадебный ящик"
	desc = "Всё необходимое для свадьбы! Теперь нужен только церемониймейстер. \
		Содержит свадебное платье, смокинг, кушак, свадебную фату, три букета \
		и бутылку шампанского."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/under/dress/wedding_dress,
					/obj/item/clothing/under/suit/tuxedo,
					/obj/item/storage/belt/fannypack/cummerbund,
					/obj/item/clothing/head/costume/weddingveil,
					/obj/item/bouquet,
					/obj/item/bouquet/sunflower,
					/obj/item/bouquet/poppy,
					/obj/item/reagent_containers/cup/glass/bottle/champagne,
				)
	crate_name = "свадебный ящик"

/// Box of 7 grey IDs.
/datum/supply_pack/service/greyidbox
	name = "Мультинабор серых ID-карт"
	desc = "Удобный ящик с коробкой из семи дешёвых ID-карт в компактном формате для бумажника. \
		Карты бывают любого цвета, который вы можете представить, если этот цвет серый."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/box/ids)
	crate_name = "ящик базовых ID-карт"

/// Single silver ID.
/datum/supply_pack/service/silverid
	name = "Ящик серебряной ID-карты"
	desc = "Мы забыли нанять глав отделов? Наберите своих с этой ценной ID-картой, \
		способной хранить продвинутые уровни доступа в удобном формате для бумажника."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/card/id/advanced/silver)
	crate_name = "ящик серебряной ID-карты"

/datum/supply_pack/service/emptycrate
	name = "Пустой ящик"
	desc = "Это пустой ящик для всех ваших нужд хранения."
	cost = CARGO_CRATE_VALUE * 1.4 //Net Zero Profit.
	contains = list()
	crate_name = "ящик"

/datum/supply_pack/service/randomized/donkpockets
	name = "Ящик разных Donk Pocket"
	desc = "Линейка самой популярной выпечки Donk Co.! Содержит \
		случайный набор коробок Donk Pocket."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy,
					/obj/item/storage/box/donkpockets/donkpocketteriyaki,
					/obj/item/storage/box/donkpockets/donkpocketpizza,
					/obj/item/storage/box/donkpockets/donkpocketberry,
					/obj/item/storage/box/donkpockets/donkpockethonk,
				)
	crate_name = "ящик Donk Pocket"
	crate_type = /obj/structure/closet/crate/freezer/food

/datum/supply_pack/service/randomized/donkpockets/fill(obj/container)
	for(var/i in 1 to 3)
		var/item = pick(contains)
		new item(container)

/datum/supply_pack/service/randomized/ready_donk
	name = "Ящик разных Ready-Donk"
	desc = "Линейка любимых фанатами блюд Donk Co. для микроволновки! Содержит \
		случайный набор продуктов Ready Donk."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/food/ready_donk,
					/obj/item/food/ready_donk/mac_n_cheese,
					/obj/item/food/ready_donk/donkhiladas,
					/obj/item/food/ready_donk/nachos_grandes,
					/obj/item/food/ready_donk/donkrange_chicken,
					/obj/item/food/ready_donk/salisbury_steak,
					/obj/item/food/ready_donk/country_chicken,
				)
	crate_name = "\improper ящик Ready-Donk"
	crate_type = /obj/structure/closet/crate/freezer/donk
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/randomized/ready_donk/fill(obj/container)
	for(var/i in 1 to 3)
		var/item = pick(contains)
		new item(container)

/datum/supply_pack/service/coffeekit
	name = "Ящик кофейного оборудования"
	desc = "Полный набор для создания собственной уютной кофейни; кофеварка почему-то не включена."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/obj/item/storage/box/coffeepack/robusta,
		/obj/item/storage/box/coffeepack,
		/obj/item/reagent_containers/cup/coffeepot,
		/obj/item/storage/fancy/coffee_condi_display,
		/obj/item/reagent_containers/cup/glass/bottle/juice/cream,
		/obj/item/reagent_containers/condiment/milk,
		/obj/item/reagent_containers/condiment/soymilk,
		/obj/item/reagent_containers/condiment/sugar,
		/obj/item/reagent_containers/cup/bottle/syrup_bottle/caramel, //one extra syrup as a treat
	)
	crate_name = "ящик кофейного оборудования"
	crate_type = /obj/structure/closet/crate/robust
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/service/coffeemaker
	name = "Ящик кофеварки Impressa"
	desc = "Собранная кофеварка модели Impressa."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/machinery/coffeemaker/impressa)
	crate_name = "ящик кофеварки"
	crate_type = /obj/structure/closet/crate/large
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/// Spare bar sign wallmount
/datum/supply_pack/service/bar_sign
	name = "Запасной комплект барной вывески"
	desc = "Запасная барная вывеска, идеально подходящая для привлечения клиентов в бар, таверну, постоялый двор, ночной клуб или даже кофейню!"
	cost = CARGO_CRATE_VALUE * 14
	contains = list(/obj/item/wallframe/barsign/all_access)
	crate_name = "ящик барной вывески"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/service/bowmaking
	name = "Стартовый набор оперения и изготовления луков"
	desc = "Довольно устаревший экземпляр «Выстрогай мне это: оперение для современного космонавта» и немного полезных материалов. \
		Для тех, кто хочет заняться изготовлением луков или добавить остроты своему LARP, это беспроигрышный вариант. Также содержит \
		инструкции по изготовлению скрипок."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(
		/obj/item/book/granter/crafting_recipe/fletching = 1,
		/obj/item/stack/sheet/mineral/wood = 10,
		/obj/item/stack/sheet/cloth = 10,
	)
	crate_name = "ящик стартового набора изготовления луков"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/service/mousetraps
	name = "Мышеловки Pest-B-Gon"
	desc = "Три коробки удобных маленьких пружинных ловушек для поимки вредных грызунов. Беречь от детей!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/box/mousetraps = 3)
	crate_name = "ящик мышеловок"
