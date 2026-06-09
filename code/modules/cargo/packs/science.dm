/datum/supply_pack/science
	group = "Наука"
	access_view = ACCESS_RESEARCH
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/science/plasma
	name = "Ящик плазменных сборок"
	desc = "Всё необходимое, чтобы сжечь что-нибудь дотла: три \
		комплекта плазменных сборок. Каждый комплект содержит плазменный баллон, воспламенитель, датчик приближения \
		и таймер! Гарантия аннулируется при воздействии высоких температур."
	cost = CARGO_CRATE_VALUE * 2
	access = ACCESS_ORDNANCE
	access_view = ACCESS_ORDNANCE
	contains = list(/obj/item/tank/internals/plasma = 3,
					/obj/item/assembly/igniter = 3,
					/obj/item/assembly/prox_sensor = 3,
					/obj/item/assembly/timer = 3,
				)
	crate_name = "ящик плазменных сборок"
	crate_type = /obj/structure/closet/crate/secure/plasma

// Dummy type used in generating anomaly core supply packs, not actually orderable
/datum/supply_pack/science/raw_anomaly
	cost = CARGO_CRATE_VALUE * 10
	access = ACCESS_ORDNANCE
	access_view = ACCESS_ORDNANCE
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/raw_anomaly/generate_supply_packs()
	if(length(contains))
		return null // having contents indicates this is a generated pack so it doesn't need to generate more

	var/list/anomaly_packs = list()
	for(var/obj/item/raw_anomaly_core/raw_core as anything in subtypesof(/obj/item/raw_anomaly_core) - /obj/item/raw_anomaly_core/random)
		var/datum/supply_pack/science/raw_anomaly/pack = new
		pack.name = full_capitalize(raw_core::name)
		pack.id = "[type]/[raw_core]"
		pack.desc = "Содержит необработанное ядро \a [raw_core::anomaly_type::anomaly_type::name || "anomaly"], готовое к имплозионному сжатию в мощный артефакт."
		pack.contains = list(raw_core)
		pack.crate_name = LOWER_TEXT(pack.name)
		anomaly_packs += pack
	return anomaly_packs

/datum/supply_pack/science/robotics
	name = "Ящик сборки робототехники"
	desc = "Инструменты, необходимые, чтобы заменить этих капризных людей верной армией роботов! \
		Содержит четыре датчика приближения, две пустые аптечки, два анализатора здоровья, \
		две красные каски, два ящика для инструментов и две сборки клинботов!"
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_ROBOTICS
	access_view = ACCESS_ROBOTICS
	contains = list(/obj/item/assembly/prox_sensor = 4,
					/obj/item/healthanalyzer = 2,
					/obj/item/clothing/head/utility/hardhat/red = 2,
					/obj/item/storage/medkit = 2,
					/obj/item/storage/toolbox = 2,
					/obj/item/bot_assembly/cleanbot = 2)
	crate_name = "ящик сборки робототехники"
	crate_type = /obj/structure/closet/crate/secure/science/robo

/datum/supply_pack/science/rped
	name = "Ящик RPED"
	desc = "Нужно восстановить ORM, но наука исчезла после испытания бомбы? \
		Купите это, чтобы получить самые продвинутые детали, которые NT может вам дать."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/part_replacer/cargo)
	crate_name = "\improper ящик RPED"

/datum/supply_pack/science/shieldwalls
	name = "Ящик генераторов щита"
	desc = "Эти мощные генераторы щитовых стен гарантированно удержат любые нежелательные \
		формы жизни снаружи, где им и место! Содержит четыре генератора щитовых стен."
	cost = CARGO_CRATE_VALUE * 4
	access = ACCESS_TELEPORTER
	access_view = ACCESS_TELEPORTER
	contains = list(/obj/machinery/power/shieldwallgen = 4)
	crate_name = "ящик генераторов щита"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/transfer_valves
	name = "Ящик клапанов переноса баллонов"
	desc = "Ключевой ингредиент, чтобы очень быстро разозлить очень много людей. \
		Содержит два клапана переноса баллонов."
	cost = CARGO_CRATE_VALUE * 12
	access = ACCESS_RD
	contains = list(/obj/item/transfer_valve = 2)
	crate_name = "ящик клапанов переноса баллонов"
	crate_type = /obj/structure/closet/crate/secure/science
	order_flags = ORDER_DANGEROUS

/datum/supply_pack/science/monkey_helmets
	name = "Ящик шлемов усиления разума обезьян"
	desc = "Некоторые исследования лучше проводить с обезьянами, но иногда они \
		слишком глупы для более сложных задач. Эти два шлема должны помочь."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/head/helmet/monkey_sentience = 2)
	crate_name = "ящик усиления разума обезьян"

/datum/supply_pack/science/cytology
	name = "Ящик цитологических припасов"
	desc = "Вышедшие из-под контроля образцы разнесли ксенобиологию? Вот ещё \
		припасы для дальнейших испытаний. Содержит микроскоп, инструмент для биопсии, две чашки Петри \
		и коробку тампонов."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_XENOBIOLOGY
	contains = list(/obj/structure/microscope,
					/obj/item/biopsy_tool,
					/obj/item/storage/box/petridish = 2,
					/obj/item/storage/box/swab,
					/obj/item/circuitboard/machine/vatgrower,
					/obj/item/reagent_containers/condiment/protein,
				)
	crate_name = "ящик цитологических припасов"

/datum/supply_pack/science/mod_core
	name = "Ящик ядер MOD"
	desc = "Три ядра, идеально подходящие для сборки любого MOD-костюма! Разумеется, добыты естественным путём™."
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_ROBOTICS
	access_view = ACCESS_ROBOTICS
	contains = list(/obj/item/mod/core/standard = 3)
	crate_name = "\improper ящик ядер MOD"
	crate_type = /obj/structure/closet/crate/nakamura
