/datum/supply_pack/emergency
	group = "Чрезвычайные ситуации"
	discountable = SUPPLY_PACK_UNCOMMON_DISCOUNTABLE

/datum/supply_pack/emergency/bio
	name = "Ящик биологической защиты"
	desc = "Содержит 2 полных биозащитных костюма, а также коробку со стерильными масками и латексными перчатками для эффективной защиты от вирусов."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/clothing/head/bio_hood/general = 2,
					/obj/item/clothing/suit/bio_suit/general = 2,
					/obj/item/storage/bag/bio,
					/obj/item/reagent_containers/syringe/antiviral = 2,
					/obj/item/clothing/gloves/latex/nitrile = 2,
					/obj/item/storage/box/masks,
					/obj/item/storage/box/gloves,
				)
	crate_name = "ящик биозащитных костюмов"

/datum/supply_pack/emergency/equipment
	name = "Аварийный ящик ботов и дыхательного снаряжения"
	desc = "Взрывы портят настроение? Эти припасы гарантированно залатают дыры \
		и в станции, и в людях! В комплекте два флорбота, два медбота, пять кислородных \
		масок и пять малых кислородных баллонов."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/mob/living/basic/bot/medbot = 2,
		/mob/living/basic/bot/repairbot = 2,
		/obj/item/tank/internals/emergency_oxygen = 5,
		/obj/item/clothing/mask/breath = 5,
	)
	crate_name = "аварийный ящик"
	crate_type = /obj/structure/closet/crate/internals

/datum/supply_pack/emergency/bomb
	name = "Взрывотехнический аварийный ящик"
	desc = "Наука сошла с ума? За шлюзом что-то пищит? Купите сейчас и станьте героем, которого станция заслужи... \
		то есть нуждается! Время в комплект не входит. Содержит один противовзрывной костюм с капюшоном, противогаз и инструменты для обезвреживания бомб."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/clothing/head/utility/bomb_hood,
					/obj/item/clothing/suit/utility/bomb_suit,
					/obj/item/clothing/mask/gas,
					/obj/item/screwdriver,
					/obj/item/wirecutters,
					/obj/item/multitool,
				)
	crate_name = "ящик противовзрывного костюма"

/datum/supply_pack/emergency/firefighting
	name = "Противопожарный ящик"
	desc = "Только вы можете предотвратить пожары на станции. В комплекте по два пожарных костюма, противогаза, \
		фонаря, больших кислородных баллона, огнетушителя и каски!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/clothing/suit/utility/fire/firefighter = 2,
					/obj/item/clothing/mask/gas = 2,
					/obj/item/flashlight = 2,
					/obj/item/tank/internals/oxygen/red = 2,
					/obj/item/extinguisher/advanced = 2,
					/obj/item/clothing/head/utility/hardhat/red = 2,
				)
	crate_name = "противопожарный ящик"

/datum/supply_pack/emergency/atmostank
	name = "Противопожарный ранцевый бак"
	desc = "Сметайте пожары этим вместительным ранцевым противопожарным баком."
	cost = CARGO_CRATE_VALUE * 1.8
	access = ACCESS_ATMOSPHERICS
	contains = list(/obj/item/watertank/atmos)
	crate_name = "ящик противопожарного ранца"
	crate_type = /obj/structure/closet/crate/secure/engineering/atmos

/datum/supply_pack/emergency/internals
	name = "Ящик дыхательного снаряжения"
	desc = "Овладейте жизненной энергией и контролируйте дыхание с тремя дыхательными масками, \
		тремя аварийными кислородными баллонами и тремя большими воздушными баллонами." // IS THAT A
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/clothing/mask/gas = 3,
					/obj/item/clothing/mask/breath = 3,
					/obj/item/tank/internals/emergency_oxygen = 3,
					/obj/item/tank/internals/oxygen = 3,
				)
	crate_name = "ящик дыхательного снаряжения"
	crate_type = /obj/structure/closet/crate/internals

/datum/supply_pack/emergency/metalfoam
	name = "Ящик гранат с металлической пеной"
	desc = "Заделайте надоедливые пробоины корпуса семью гранатами с металлической пеной."
	cost = CARGO_CRATE_VALUE * 2.4
	contains = list(/obj/item/storage/box/metalfoam)
	crate_name = "ящик гранат с металлической пеной"

/datum/supply_pack/emergency/plasma_spacesuit
	name = "Космические энвирокостюмы плазмаменов"
	desc = "Содержит два пригодных для космоса энвирокостюма для плазмаменов. \
		Закажите сейчас, и мы добавим два бесплатных шлема!"
	cost = CARGO_CRATE_VALUE * 3.5
	access = ACCESS_EVA
	contains = list(/obj/item/clothing/suit/space/eva/plasmaman = 2,
					/obj/item/clothing/head/helmet/space/plasmaman = 2,
				)
	crate_name = "ящик EVA плазмамена"
	crate_type = /obj/structure/closet/crate/secure

/datum/supply_pack/emergency/plasmaman
	name = "Комплект снабжения плазмамена"
	desc = "Поддерживайте жизнь плазмаменов двумя наборами одежды. \
		Каждый набор содержит комбинезон плазмамена, перчатки, дыхательный баллон и шлем."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/clothing/under/plasmaman = 2,
					/obj/item/tank/internals/plasmaman/belt/full = 2,
					/obj/item/clothing/head/helmet/space/plasmaman = 2,
					/obj/item/clothing/gloves/color/plasmaman = 2,
				)
	crate_name = "комплект снабжения плазмамена"

/datum/supply_pack/emergency/radiation
	name = "Ящик радиационной защиты"
	desc = "Переживите ядерный апокалипсис и двигатель суперматерии с двумя комплектами радиационных костюмов. \
		Каждый комплект содержит шлем, костюм и счётчик Гейгера. Мы даже добавим бутылку водки и несколько рюмок, \
		учитывая ожидаемую продолжительность жизни тех, кто это заказывает."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/clothing/head/utility/radiation = 2,
					/obj/item/clothing/suit/utility/radiation = 2,
					/obj/item/geiger_counter = 2,
					/obj/item/reagent_containers/cup/glass/bottle/vodka,
					/obj/item/reagent_containers/cup/glass/drinkingglass/shotglass = 2,
				)
	crate_name = "ящик радиационной защиты"
	crate_type = /obj/structure/closet/crate/radiation

/datum/supply_pack/emergency/spacesuit
	name = "Ящик скафандра"
	desc = "Содержит один потрёпанный скафандр из Space-Goodwill и джетпак."
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_EVA
	contains = list(/obj/item/clothing/suit/space,
					/obj/item/clothing/head/helmet/space,
					/obj/item/clothing/mask/breath,
					/obj/item/tank/jetpack/carbondioxide,
				)
	crate_name = "ящик скафандра"
	crate_type = /obj/structure/closet/crate/secure

/datum/supply_pack/emergency/weedcontrol
	name = "Ящик борьбы с сорняками"
	desc = "Не пустите инвазивные виды ВНУТРЬ. Содержит косу, кожаные перчатки, противогаз и две химические гранаты против сорняков. \
		Гарантия аннулируется при использовании на амброзии."
	cost = CARGO_CRATE_VALUE * 2.5
	access = ACCESS_HYDROPONICS
	contains = list(/obj/item/scythe,
					/obj/item/clothing/gloves/botanic_leather,
					/obj/item/clothing/mask/gas,
					/obj/item/grenade/chem_grenade/antiweed = 2,
				)
	crate_name = "ящик борьбы с сорняками"
	crate_type = /obj/structure/closet/crate/secure/hydroponics

/datum/supply_pack/emergency/mothic_rations
	name = "Тройной набор излишков мольских пайков"
	desc = "Экипаж голодает? Повар бездельничает? Накормите всех минимально допустимым подобием еды \
		с излишками пайков прямо из Мольского флота! Набор содержит 3 упаковки по 3 батончика."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/storage/box/mothic_rations = 3)
	crate_name = "коробка излишков пайков"
	crate_type = /obj/structure/closet/crate/cardboard/mothic
