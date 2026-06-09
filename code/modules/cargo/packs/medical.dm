/datum/supply_pack/medical
	group = "Медицина"
	access_view = ACCESS_MEDICAL
	crate_type = /obj/structure/closet/crate/medical/department

/datum/supply_pack/medical/bloodpacks
	name = "Ящик разных пакетов крови"
	desc = "Содержит десять разных пакетов крови для восполнения крови у пациентов."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(
		/obj/item/reagent_containers/blood = 2,
		/obj/item/reagent_containers/blood/a_plus,
		/obj/item/reagent_containers/blood/a_minus,
		/obj/item/reagent_containers/blood/b_plus,
		/obj/item/reagent_containers/blood/b_minus,
		/obj/item/reagent_containers/blood/o_plus,
		/obj/item/reagent_containers/blood/o_minus,
		/obj/item/reagent_containers/blood/lizard,
		/obj/item/reagent_containers/blood/ethereal,
		/obj/item/paper/fluff/jobs/medical/blood_types,
	)
	crate_name = "кровяной морозильник"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/medical/medipen_variety
	name = "Набор разных медипенов"
	desc = "Содержит восемь медипенов трёх разных видов, \
		помогающих быстро лечить тяжело раненых пациентов."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/reagent_containers/hypospray/medipen = 2,
					/obj/item/reagent_containers/hypospray/medipen/ekit = 3,
					/obj/item/reagent_containers/hypospray/medipen/blood_loss = 3)
	crate_name = "ящик медипенов"
	crate_type = /obj/structure/closet/crate/deforest

/datum/supply_pack/medical/coroner_crate
	name = "Комплект для аутопсии"
	desc = "Содержит сканер аутопсии на случай, если вы потеряли свой и вам очень \
		нужно завершить эксперименты по вскрытию."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(
		/obj/item/autopsy_scanner = 1,
		/obj/item/storage/medkit/coroner = 1,
	)
	crate_name = "ящик комплекта для аутопсии"

/datum/supply_pack/medical/chemical
	name = "Стартовый химический набор"
	desc = "Содержит тринадцать разных химикатов для всех весёлых экспериментов, которые вы можете провести."
	cost = CARGO_CRATE_VALUE * 2.6
	contains = list(/obj/item/reagent_containers/cup/bottle/hydrogen,
					/obj/item/reagent_containers/cup/bottle/carbon,
					/obj/item/reagent_containers/cup/bottle/nitrogen,
					/obj/item/reagent_containers/cup/bottle/oxygen,
					/obj/item/reagent_containers/cup/bottle/fluorine,
					/obj/item/reagent_containers/cup/bottle/phosphorus,
					/obj/item/reagent_containers/cup/bottle/silicon,
					/obj/item/reagent_containers/cup/bottle/chlorine,
					/obj/item/reagent_containers/cup/bottle/radium,
					/obj/item/reagent_containers/cup/bottle/sacid,
					/obj/item/reagent_containers/cup/bottle/ethanol,
					/obj/item/reagent_containers/cup/bottle/potassium,
					/obj/item/reagent_containers/cup/bottle/sugar,
					/obj/item/clothing/glasses/science,
					/obj/item/reagent_containers/dropper,
					/obj/item/storage/box/beakers,
				)
	crate_name = "химический ящик"

/datum/supply_pack/medical/defibs
	name = "Ящик дефибрилляторов"
	desc = "Содержит два дефибриллятора для возвращения недавно умерших к жизни."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/defibrillator/loaded = 2)
	crate_name = "ящик дефибрилляторов"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/medical/iv_drip
	name = "Ящик капельницы"
	desc = "Содержит одну капельницу для введения крови пациентам."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/machinery/iv_drip)
	crate_name = "ящик капельницы"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/medical/supplies
	name = "Ящик медицинских припасов"
	desc = "Содержит случайный набор медицинских припасов. Немецкий доктор не включён."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/reagent_containers/cup/bottle/multiver,
					/obj/item/reagent_containers/cup/bottle/epinephrine,
					/obj/item/reagent_containers/cup/bottle/morphine,
					/obj/item/reagent_containers/cup/bottle/toxin,
					/obj/item/reagent_containers/cup/beaker/large,
					/obj/item/reagent_containers/applicator/pill/insulin,
					/obj/item/stack/medical/wrap/gauze,
					/obj/item/storage/box/bandages,
					/obj/item/storage/box/beakers,
					/obj/item/storage/box/medigels,
					/obj/item/storage/box/syringes,
					/obj/item/storage/box/bodybags,
					/obj/item/storage/medkit/regular,
					/obj/item/storage/medkit/o2,
					/obj/item/storage/medkit/toxin,
					/obj/item/storage/medkit/brute,
					/obj/item/storage/medkit/fire,
					/obj/item/defibrillator/loaded,
					/obj/item/reagent_containers/blood/o_minus,
					/obj/item/storage/pill_bottle/mining,
					/obj/item/reagent_containers/applicator/pill/neurine,
					/obj/item/stack/medical/bone_gel = 2,
					/obj/item/vending_refill/medical,
					/obj/item/vending_refill/drugs,
				)
	crate_name = "ящик медицинских припасов"
	crate_type = /obj/structure/closet/crate/medical
	test_ignored = TRUE

/datum/supply_pack/medical/supplies/fill(obj/container)
	for(var/i in 1 to 10)
		var/item = pick(contains)
		new item(container)

/datum/supply_pack/medical/experimentalmedicine
	name = "Ящик экспериментальной медицины"
	desc = "Ящик с препаратом Sansufentanyl, необходимым для жизни с наследственной многосложной болезнью."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/pill_bottle/sansufentanyl = 2)
	crate_name = "ящик экспериментальной медицины"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/medical/surgery
	name = "Ящик хирургических припасов"
	desc = "Хотите провести операцию, но у вас нет одной из этих модных \
		дипломированных бумажек? Просто начните с этого ящика, содержащего хирургический лоток DeForest, \
		спрей Sterilizine и складную кровать на колёсиках."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(
		/obj/item/surgery_tray/full,
		/obj/item/reagent_containers/medigel/sterilizine,
		/obj/item/emergency_bed,
	)
	crate_name = "ящик хирургических припасов"
	crate_type = /obj/structure/closet/crate/deforest

/datum/supply_pack/medical/salglucanister
	name = "Усиленная канистра физраствора"
	desc = "Содержит крупный запас физраствора с глюкозой, упакованный в одну канистру, \
		которой должно хватить на несколько дней, а также большой насос для наполнения ёмкостей. Прямое введение \
		физраствора стоит оставить медицинским специалистам, поскольку насос способен вызвать передозировку \
		у пациентов."
	cost = CARGO_CRATE_VALUE * 6
	access = ACCESS_MEDICAL
	contains = list(/obj/machinery/iv_drip/saline)
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/medical/virus
	name = "Ящик вирусов"
	desc = "Содержит двенадцать бутылок с несколькими вирусными образцами для вирусологических \
		исследований. Также включает семь мензурок и шприцы. Скомканные джинсы не включены."
	cost = CARGO_CRATE_VALUE * 5
	access = ACCESS_CMO
	access_view = ACCESS_VIROLOGY
	contains = list(/obj/item/reagent_containers/cup/bottle/flu_virion,
					/obj/item/reagent_containers/cup/bottle/cold,
					/obj/item/reagent_containers/cup/bottle/random_virus = 4,
					/obj/item/reagent_containers/cup/bottle/fake_gbs,
					/obj/item/reagent_containers/cup/bottle/magnitis,
					/obj/item/reagent_containers/cup/bottle/pierrot_throat,
					/obj/item/reagent_containers/cup/bottle/brainrot,
					/obj/item/reagent_containers/cup/bottle/anxiety,
					/obj/item/reagent_containers/cup/bottle/beesease,
					/obj/item/storage/box/syringes,
					/obj/item/storage/box/beakers,
					/obj/item/reagent_containers/cup/bottle/mutagen,
				)
	crate_name = "ящик вирусов"
	crate_type = /obj/structure/closet/crate/secure/plasma
	order_flags = ORDER_DANGEROUS

/datum/supply_pack/medical/cmoturtlenecks
	name = "Водолазки главного врача"
	desc = "Содержит водолазку главного врача и юбку-водолазку."
	cost = CARGO_CRATE_VALUE * 2
	access = ACCESS_CMO
	contains = list(/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck,
					/obj/item/clothing/under/rank/medical/chief_medical_officer/turtleneck/skirt,
				)

/datum/supply_pack/medical/arm_implants
	name = "Набор имплантов сильных рук"
	desc = "Ящик с двумя имплантами, которые можно хирургически установить для усиления человеческих рук. Гарантия аннулируется при воздействии электромагнитных импульсов."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/organ/cyberimp/arm/strongarm = 2)
	crate_name = "ящик имплантов сильных рук"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/medical/paperwork_implants
	name = "Набор имплантов бумажной работы"
	desc = "Ящик с двумя имплантами, которые можно хирургически установить для повышения эффективности экипажа в бумажной работе. Гарантия аннулируется при воздействии электромагнитных импульсов."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/organ/cyberimp/arm/toolkit/paperwork = 2)
	crate_name = "ящик имплантов бумажной работы"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/medical/lost_crew
	name = "Найденное тело сотрудника NT"
	desc = "У нас нет условий, чтобы вернуть его к жизни. Можно отправить его вам? Пожалуйста, оживите и трудоустройте его. \
	Цена является авансом, мы возместим медицинский бюджет, как только наш сотрудник снова немного поживёт."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/structure/closet/body_bag/lost_crew/with_body)
	crate_name = "морозильник для тел"
	crate_type = /obj/structure/closet/crate/secure/freezer

/datum/supply_pack/medical/organ_growing
	name = "Набор выращивания органов"
	desc = "Все инструменты, необходимые для выращивания органов дома! Помимо выращивания стандартных органов из образцов ткани, \
	вы можете найти мутантные клетки, которые можно дальше размножать для получения странных свойств."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(
		/obj/machinery/vatgrower/small/unanchored,
		/obj/item/biopsy_tool/organ,
		/obj/item/storage/box/petridish,
		/obj/structure/microscope/unanchored,
		/obj/item/reagent_containers/cup/mortar,
		/obj/item/pestle,
	)
	crate_name = "набор выращивания органов"

/datum/supply_pack/medical/chiral_inversing_buffer
	name = "Ящик хирального инвертирующего буфера"
	desc = "Ящик с редким образцом инвертирующего буфера. \
		При подходящих условиях он может превращать нечистые реагенты в их обратные аналоги."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/reagent_containers/cup/bottle/inversing_buffer)
	crate_name = "ящик хирального инвертирующего буфера"

/datum/supply_pack/medical/handheld_crew_monitor
	name = "Ящик ручных мониторов экипажа"
	desc = "Ящик с тремя ручными мониторами экипажа."
	cost = (CARGO_CRATE_VALUE * /obj/item/sensor_device::custom_premium_price * 3 * 0.8) / 280 // Bulk discount .8X base /tg/ vending machine value with the CARGO_CRATE_VALUE modifier
	contains = list(
		/obj/item/sensor_device,
		/obj/item/sensor_device,
		/obj/item/sensor_device,
	)
	crate_name = "ящик ручных мониторов экипажа"
