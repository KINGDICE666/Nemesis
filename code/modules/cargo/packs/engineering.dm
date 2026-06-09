/datum/supply_pack/engineering
	group = "Инженерия"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/engineering/shieldgen
	name = "Ящик проекторов против пробоин"
	desc = "Снова пробоины корпуса? Больше ни слова с противоразгерметизационным проектором щита Nanotrasen! \
		Использует технологию силового поля, чтобы удерживать воздух внутри, а космос снаружи. Содержит два проектора щита."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_ENGINE_EQUIP
	contains = list(/obj/machinery/shieldgen = 2)
	crate_name = "ящик проекторов против пробоин"

/datum/supply_pack/engineering/ripley
	name = "Ящик APLU MK-I"
	desc = "Набор для самостоятельной сборки APLU MK-I «Ripley», предназначенного для подъёма, \
		переноски тяжёлого оборудования и других станционных задач. Батареи не включены."
	cost = CARGO_CRATE_VALUE * 10
	access_view = ACCESS_ROBOTICS
	contains = list(/obj/item/mecha_parts/chassis/ripley,
					/obj/item/mecha_parts/part/ripley_torso,
					/obj/item/mecha_parts/part/ripley_right_arm,
					/obj/item/mecha_parts/part/ripley_left_arm,
					/obj/item/mecha_parts/part/ripley_right_leg,
					/obj/item/mecha_parts/part/ripley_left_leg,
					/obj/item/stock_parts/capacitor,
					/obj/item/stock_parts/scanning_module,
					/obj/item/stock_parts/servo,
					/obj/item/circuitboard/mecha/ripley/main,
					/obj/item/circuitboard/mecha/ripley/peripherals,
					/obj/item/mecha_parts/mecha_equipment/drill,
					/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp,
				)
	crate_name= "\improper комплект APLU MK-I"
	crate_type = /obj/structure/closet/crate/science/robo

/datum/supply_pack/engineering/conveyor
	name = "Ящик сборки конвейера"
	desc = "Поддерживайте производство в движении с тридцатью конвейерными лентами. Переключатель конвейера включён. \
		Если есть вопросы, загляните в приложенную инструкцию."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/stack/conveyor/thirty,
					/obj/item/conveyor_switch_construct,
					/obj/item/paper/guides/conveyor,
				)
	crate_name = "ящик сборки конвейера"

/datum/supply_pack/engineering/engiequipment
	name = "Ящик инженерного снаряжения"
	desc = "Снарядитесь тремя поясами инструментов, сигнальными жилетами, сварочными масками, касками \
		и двумя парами мезонных очков!"
	cost = CARGO_CRATE_VALUE * 4
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/item/storage/belt/utility = 3,
					/obj/item/clothing/suit/hazardvest = 3,
					/obj/item/clothing/head/utility/welding = 3,
					/obj/item/clothing/head/utility/hardhat = 3,
					/obj/item/clothing/glasses/meson/engine = 2,
				)
	crate_name = "ящик инженерного снаряжения"

/datum/supply_pack/engineering/powergamermitts
	name = "Ящик изолированных перчаток"
	desc = "Основа современного общества. Почти никогда не заказывается для настоящей инженерии. \
		Содержит три пары изолированных перчаток."
	cost = CARGO_CRATE_VALUE * 8 //Made of pure-grade bullshittinium
	access_view = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/clothing/gloves/color/yellow = 3)
	crate_name = "ящик изолированных перчаток"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/engineering/inducers
	name = "Ящик электромагнитных индукторов питания NT-75"
	desc = "Нет зарядников? Не проблема: с NT-75 EPI можно заряжать любое стандартное \
		оборудование на батареях где угодно и когда угодно. Содержит два индуктора."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/inducer/orderable = 2)
	crate_name = "ящик индукторов"
	crate_type = /obj/structure/closet/crate/nakamura

/datum/supply_pack/engineering/pacman
	name = "Ящик генератора P.A.C.M.A.N"
	desc = "Инженеры не могут запустить двигатель? Для вас это не проблема, когда в руках \
		генератор P.A.C.M.A.N! Поглощает плазму и выдаёт сладкую-сладкую энергию."
	cost = CARGO_CRATE_VALUE * 5
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/machinery/power/port_gen/pacman)
	crate_name = "\improper ящик генератора PACMAN"
	crate_type = /obj/structure/closet/crate/nakamura

/datum/supply_pack/engineering/power
	name = "Ящик батарей"
	desc = "Ищете подавляющую мощь? Вы её нашли. Содержит три высоковольтные батареи."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/stock_parts/power_store/cell/high = 3)
	crate_name = "ящик батарей"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/engineering/shuttle_engine
	name = "Ящик двигателя шаттла"
	desc = "Благодаря продвинутым блюспейс-махинациям наши инженеры смогли уместить целый \
		двигатель шаттла в одну крошечную коробку."
	cost = CARGO_CRATE_VALUE * 6
	access = ACCESS_ENGINEERING
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/item/flatpack/shuttle_engine)
	crate_name = "ящик двигателя шаттла"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/tools
	name = "Ящик инструментальных ящиков"
	desc = "Любой робастный космонавт всегда держится рядом со своим верным ящиком для инструментов. Содержит три электротехнических \
		и три механических ящика для инструментов."
	access_view = ACCESS_ENGINE_EQUIP
	contains = list(/obj/item/storage/toolbox/electrical = 3,
					/obj/item/storage/toolbox/mechanical = 3,
				)
	cost = CARGO_CRATE_VALUE * 5
	crate_name = "ящик инструментальных ящиков"

/datum/supply_pack/engineering/portapump
	name = "Ящик портативных воздушных насосов"
	desc = "Кто-то снова выпустил воздух из шаттла? Мы вас прикроем. \
		Содержит два портативных воздушных насоса."
	cost = CARGO_CRATE_VALUE * 4.5
	access_view = ACCESS_ATMOSPHERICS
	contains = list(/obj/machinery/portable_atmospherics/pump = 2)
	crate_name = "ящик портативных воздушных насосов"
	crate_type = /obj/structure/closet/crate/secure/engineering/atmos

/datum/supply_pack/engineering/portascrubber
	name = "Ящик портативных скрубберов"
	desc = "Уберите надоедливую утечку плазмы собственным набором из двух портативных скрубберов."
	cost = CARGO_CRATE_VALUE * 4.5
	access_view = ACCESS_ATMOSPHERICS
	contains = list(/obj/machinery/portable_atmospherics/scrubber = 2)
	crate_name = "ящик портативных скрубберов"
	crate_type = /obj/structure/closet/crate/secure/engineering/atmos

/datum/supply_pack/engineering/hugescrubber
	name = "Ящик огромного портативного скруббера"
	desc = "Огромный портативный скруббер для огромных атмосферных ошибок."
	cost = CARGO_CRATE_VALUE * 7.5
	access_view = ACCESS_ATMOSPHERICS
	contains = list(/obj/machinery/portable_atmospherics/scrubber/huge/movable/cargo)
	crate_name = "ящик огромного портативного скруббера"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/engineering/space_heater
	name = "Ящик обогревателя"
	desc = "Устройство двойного назначения для нагрева и охлаждения, когда вокруг слишком холодно или жарко."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/machinery/space_heater)
	crate_name = "ящик обогревателя"
	crate_type = /obj/structure/closet/crate/secure/engineering/atmos

/datum/supply_pack/engineering/bsa
	name = "Детали блюспейс-артиллерии"
	desc = "Гордость военно-морского командования Nanotrasen. Легендарная блюспейс-артиллерийская пушка - \
		разрушительное достижение человеческой инженерии и свидетельство военной решимости. \
		Для правильной сборки требуются крайне продвинутые исследования."
	cost = CARGO_CRATE_VALUE * 30
	order_flags = ORDER_SPECIAL
	access_view = ACCESS_COMMAND
	contains = list(/obj/item/paper/guides/jobs/engineering/bsa,
					/obj/item/circuitboard/machine/bsa/front,
					/obj/item/circuitboard/machine/bsa/middle,
					/obj/item/circuitboard/machine/bsa/back,
					/obj/item/circuitboard/computer/bsa_control,
				)
	crate_name= "ящик деталей блюспейс-артиллерии"

/datum/supply_pack/engineering/dna_vault
	name = "Детали хранилища ДНК"
	desc = "Сохраните текущее состояние человечества в этой массивной \
		библиотеке научных знаний, способной даровать сверхчеловеческие силы и способности. \
		Для правильной сборки требуются крайне продвинутые исследования. Также содержит пять ДНК-зондов."
	cost = CARGO_CRATE_VALUE * 24
	order_flags = ORDER_SPECIAL
	access_view = ACCESS_COMMAND
	contains = list(/obj/item/circuitboard/machine/dna_vault,
					/obj/item/dna_probe = 5,
				)
	crate_name= "ящик деталей хранилища ДНК"

/datum/supply_pack/engineering/dna_probes
	name = "Пробоотборники хранилища ДНК"
	desc = "Содержит пять ДНК-зондов для использования в хранилище ДНК."
	cost = CARGO_CRATE_VALUE * 6
	order_flags = ORDER_SPECIAL
	access_view = ACCESS_COMMAND
	contains = list(/obj/item/dna_probe = 5)
	crate_name= "ящик ДНК-пробоотборников"


/datum/supply_pack/engineering/shield_sat
	name = "Спутник генератора щита"
	desc = "Защитите само существование станции этой противометеорной обороной. \
		Содержит три спутника генератора щита."
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_COMMAND
	contains = list(/obj/machinery/satellite/meteor_shield = 3)
	crate_name= "ящик спутников щита"


/datum/supply_pack/engineering/shield_sat_control
	name = "Плата управления системой щита"
	desc = "Система управления спутниками генератора щита."
	cost = CARGO_CRATE_VALUE * 10
	access_view = ACCESS_COMMAND
	contains = list(/obj/item/circuitboard/computer/sat_control)
	crate_name= "ящик платы управления щитом"

/datum/supply_pack/engineering/ceturtlenecks
	name = "Водолазки старшего инженера"
	desc = "Содержит водолазку старшего инженера и юбку-водолазку."
	cost = CARGO_CRATE_VALUE * 2
	access = ACCESS_CE
	contains = list(/obj/item/clothing/under/rank/engineering/chief_engineer/turtleneck,
					/obj/item/clothing/under/rank/engineering/chief_engineer/turtleneck/skirt,
				)

/// Engine Construction

/datum/supply_pack/engine
	group = "Строительство двигателя"
	access_view = ACCESS_ENGINEERING
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/engine/emitter
	name = "Ящик эмиттеров"
	desc = "Полезен для питания генераторов силового поля, а также уничтожения запертых ящиков \
		и незваных гостей. Содержит два мощных энергетических эмиттера."
	cost = CARGO_CRATE_VALUE * 7
	access = ACCESS_CE
	contains = list(/obj/machinery/power/emitter = 2)
	crate_name = "ящик эмиттеров"
	crate_type = /obj/structure/closet/crate/secure/engineering
	order_flags = ORDER_DANGEROUS

/datum/supply_pack/engine/field_gen
	name = "Ящик генераторов поля"
	desc = "Обычно это единственное, что стоит между станцией и грязной смертью. \
		Питается от эмиттеров. Содержит два генератора поля."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/machinery/field/generator = 2)
	crate_name = "ящик генераторов поля"

/datum/supply_pack/engine/grounding_rods
	name = "Ящик заземляющих стержней"
	desc = "Четыре заземляющих стержня, гарантированно удерживающих молнии любой зарвавшейся катушки Теслы под контролем."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/machinery/power/energy_accumulator/grounding_rod = 4)
	crate_name = "ящик заземляющих стержней"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/engine/solar
	name = "Ящик солнечных панелей"
	desc = "Станьте экологичнее с этой продвинутой солнечной батареей для самостоятельной сборки. Содержит двадцать одну солнечную сборку, \
		плату управления солнечными панелями и трекер. Если есть вопросы, \
		загляните в приложенную инструкцию."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/solar_assembly = 21,
					/obj/item/circuitboard/computer/solar_control,
					/obj/item/electronics/tracker,
					/obj/item/paper/guides/jobs/engi/solars,
				)
	crate_name = "ящик солнечных панелей"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/engine/supermatter_shard
	name = "Ящик осколка суперматерии"
	desc = "Сила небес, сжатая в один кристалл."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_CE
	contains = list(/obj/machinery/power/supermatter_crystal/shard)
	crate_name = "ящик осколка суперматерии"
	crate_type = /obj/structure/closet/crate/secure/radiation
	order_flags = ORDER_DANGEROUS
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/engine/tesla_coils
	name = "Ящик катушек Теслы"
	desc = "Высоковольтные казни, получение исследовательских очков или старое доброе \
		электроподжаривание ассистентов - этот набор из четырёх катушек Теслы умеет всё!"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/machinery/power/energy_accumulator/tesla_coil = 4)
	crate_name = "ящик катушек Теслы"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/engine/hypertorus_fusion_reactor
	name = "Ящик HFR"
	desc = "Новый и улучшенный термоядерный реактор."
	cost = CARGO_CRATE_VALUE * 23
	access = ACCESS_CE
	contains = list(/obj/item/hfr_box/corner = 4,
					/obj/item/hfr_box/body/fuel_input,
					/obj/item/hfr_box/body/moderator_input,
					/obj/item/hfr_box/body/waste_output,
					/obj/item/hfr_box/body/interface,
					/obj/item/hfr_box/core,
				)
	crate_name = "ящик HFR"
	crate_type = /obj/structure/closet/crate/secure/engineering/atmos
	order_flags = ORDER_DANGEROUS

/datum/supply_pack/engineering/rad_protection_modules
	name = "Модули радиационной защиты"
	desc = "Содержит несколько модулей радиационной защиты для MOD-костюмов."
	order_flags = ORDER_INVISIBLE
	contains = list(/obj/item/mod/module/rad_protection = 3)
	crate_name = "модули радиации MOD-костюма"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/engineering/rad_nebula_shielding_kit
	name = "Экранирование радиоактивной туманности"
	desc = "Содержит платы и радиационные модули для сборки экранирования радиоактивной туманности."
	cost = CARGO_CRATE_VALUE * 2

	order_flags = ORDER_SPECIAL
	contains = list(
		/obj/item/mod/module/rad_protection = 5,
		/obj/item/circuitboard/machine/radioactive_nebula_shielding = 5,
		/obj/item/paper/fluff/radiation_nebula = 1,
	)
	crate_name = "экранирование радиоактивной туманности (ВАЖНО)"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/engineering/portagrav
	name = "Ящик портативного гравитационного блока"
	desc = "Содержит портативный гравитационный блок, чтобы клоун улетел в потолок."
	cost = CARGO_CRATE_VALUE * 4
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/machinery/power/portagrav = 1)
	crate_name = "ящик портативного гравитационного блока"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/engineering/golfcart
	name = "Ящик комплекта деталей грузовой тележки"
	desc = "Содержит детали для сборки тележки, предназначенной для перевозки тяжёлой техники и грузов по станции. \
		Nanotrasen не несёт ответственности за тележки, используемые как «тусовочные фургоны»."
	cost = CARGO_CRATE_VALUE * 11
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/item/golfcart_kit = 1, /obj/item/key/golfcart = 2, /obj/item/stock_parts/power_store/cell/lead = 1)
	crate_name = "комплект деталей грузовой тележки"
	crate_type = /obj/structure/closet/crate/engineering
