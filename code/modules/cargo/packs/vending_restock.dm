/datum/supply_pack/vending
	group = "Пополнение автоматов"

/datum/supply_pack/vending/bartending
	name = "Ящик пополнения Booze-o-mat и кофе"
	desc = "Пополнения для алкогольного и кофейного торговых автоматов."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee,
				)
	crate_name = "ящик пополнения бара"

/datum/supply_pack/vending/cigarette
	name = "Ящик пополнения сигарет"
	desc = "Не верьте отчётам - курите сегодня! Содержит \
		пополнение сигаретного автомата."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "ящик пополнения сигарет"
	crate_type = /obj/structure/closet/crate/robust

/datum/supply_pack/vending/science/cytopro
	name = "Ящик пополнения цитологического автомата"
	desc = "Для всех ваших нужд выращивания в чанах! Содержит пополнение автомата CytoPro."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/cytopro)
	crate_name = "ящик пополнения CytoPro"

/datum/supply_pack/vending/dinnerware
	name = "Ящик пополнения посуды"
	desc = "Больше ножей для повара."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/dinnerware)
	crate_name = "ящик пополнения посуды"

/datum/supply_pack/vending/science/modularpc
	name = "Пополнение Deluxe Silicate Selections"
	desc = "Что такое компьютер? Содержит блок пополнения Deluxe Silicate Selections."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/modularpc)
	crate_name = "ящик компьютерного пополнения"

/datum/supply_pack/vending/engivend
	name = "Ящик пополнения EngiVend"
	desc = "У инженеров закончились гранаты с металлической пеной? Это должно помочь."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/engivend)
	crate_name = "ящик инженерного пополнения"

/datum/supply_pack/vending/games
	name = "Ящик пополнения игр"
	desc = "Включайтесь в игру с этим пополнением игрового автомата."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/games)
	crate_name = "ящик пополнения игр"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/hydro_refills
	name = "Пополнение гидропонных автоматов"
	desc = "На случай, когда клоун забрал все семена бананов. \
		Содержит пополнение NutriMax и пополнение MegaSeed Servitor."
	cost = CARGO_CRATE_VALUE * 4
	crate_type = /obj/structure/closet/crate
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients,
				)
	crate_name = "ящик пополнения гидропоники"

/datum/supply_pack/vending/imported
	name = "Импортные торговые автоматы"
	desc = "Торговые автоматы, известные в других частях галактики."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/vending_refill/sustenance,
					/obj/item/vending_refill/robotics,
					/obj/item/vending_refill/sovietsoda,
					/obj/item/vending_refill/engineering,
				)
	crate_name = "немаркированный ящик пополнения"

/datum/supply_pack/vending/medical
	name = "Ящик медицинского пополнения"
	desc = "Содержит одно пополнение NanoMed Plus, одно пополнение NanoDrug Plus \
		и одно пополнение настенного NanoMed."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/drugs,
					/obj/item/vending_refill/wallmed,
				)
	crate_name = "ящик медицинского автомата"

/datum/supply_pack/vending/ptech
	name = "Ящик пополнения PTech"
	desc = "Не хватает картриджей после того, как половина экипажа потеряла КПК \
		из-за взрывов? Это может помочь."
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/item/vending_refill/cart)
	crate_name = "\improper ящик пополнения PTech"

/datum/supply_pack/vending/sectech
	name = "Ящик пополнения SecTech"
	desc = "Офицер Пол купил все пончики? Тогда пополните автомат службы безопасности \
		этим ящиком."
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_SECURITY
	contains = list(/obj/item/vending_refill/security)
	crate_name = "\improper ящик пополнения SecTech"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/vending/snack
	name = "Ящик пополнения снеков"
	desc = "Одно пополнение автомата с кариесной радостью! \
		Заказ номер один по рекомендации стоматологов!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "ящик пополнения снеков"
	crate_type = /obj/structure/closet/crate/robust

/datum/supply_pack/vending/cola
	name = "Ящик пополнения газировки"
	desc = "Вас ударили ящиком для инструментов, но эти надоедливые зубы всё ещё на месте? \
		Избавьтесь от жемчужно-белой улыбки с этим пополнением автомата газировки уже сегодня!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "ящик пополнения газировки"

/datum/supply_pack/vending/vendomat
	name = "Ящик пополнения Part-Mart и YouTool"
	desc = "Больше инструментов для вашего полигона испытаний СВУ."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/assist,
					/obj/item/vending_refill/youtool,
				)
	crate_name = "\improper ящик пополнения Part-Mart и YouTool"

/datum/supply_pack/vending/clothesmate
	name = "Ящик пополнения ClothesMate"
	desc = "Закончились ковбойские сапоги? Купите этот ящик."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/clothing)
	crate_name = "\improper ящик пополнения ClothesMate"


/// Clothing Vending Restocks

/datum/supply_pack/vending/wardrobes/autodrobe
	name = "Ящик пополнения Autodrobe"
	desc = "В Autodrobe нет любимого платья? Решите проблему уже сегодня \
		этим пополнением Autodrobe."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "ящик пополнения Autodrobe"

/datum/supply_pack/vending/wardrobes/cargo
	name = "Ящик пополнения гардероба карго"
	desc = "Этот ящик содержит пополнение для CargoDrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/cargo_wardrobe)
	crate_name = "ящик пополнения отдела карго"

/datum/supply_pack/vending/wardrobes/engineering
	name = "Ящик пополнения инженерного гардероба"
	desc = "Этот ящик содержит пополнения для EngiDrobe и AtmosDrobe."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/wardrobe/engi_wardrobe,
					/obj/item/vending_refill/wardrobe/atmos_wardrobe,
				)
	crate_name = "ящик пополнения инженерного гардероба"

/datum/supply_pack/vending/wardrobes/general
	name = "Ящик пополнения общих гардеробов"
	desc = "Этот ящик содержит пополнения для CuraDrobe, BarDrobe, \
		ChefDrobe и ChapDrobe."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/vending_refill/wardrobe/curator_wardrobe,
					/obj/item/vending_refill/wardrobe/bar_wardrobe,
					/obj/item/vending_refill/wardrobe/chef_wardrobe,
					/obj/item/vending_refill/wardrobe/chap_wardrobe,
				)
	crate_name = "пополнения общих гардеробных автоматов"

/datum/supply_pack/vending/wardrobes/hydroponics
	name = "Ящик пополнения Hydrobe"
	desc = "Этот ящик содержит пополнение для Hydrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/hydro_wardrobe)
	crate_name = "ящик пополнения Hydrobe"

/datum/supply_pack/vending/wardrobes/janitor
	name = "Ящик пополнения JaniDrobe"
	desc = "Этот ящик содержит пополнение для JaniDrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/jani_wardrobe)
	crate_name = "ящик пополнения JaniDrobe"

/datum/supply_pack/vending/wardrobes/medical
	name = "Ящик пополнения медицинского гардероба"
	desc = "Этот ящик содержит пополнения для MediDrobe, \
		ChemDrobe, ViroDrobe и MortiDrobe."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/vending_refill/wardrobe/medi_wardrobe,
					/obj/item/vending_refill/wardrobe/chem_wardrobe,
					/obj/item/vending_refill/wardrobe/viro_wardrobe,
					/obj/item/vending_refill/wardrobe/coroner_wardrobe,
				)
	crate_name = "ящик пополнения медицинского гардероба"

/datum/supply_pack/vending/wardrobes/science
	name = "Ящик пополнения научного гардероба"
	desc = "Этот ящик содержит пополнения для SciDrobe, \
		GeneDrobe и RoboDrobe."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/item/vending_refill/wardrobe/robo_wardrobe,
					/obj/item/vending_refill/wardrobe/gene_wardrobe,
					/obj/item/vending_refill/wardrobe/science_wardrobe,
				)
	crate_name = "ящик пополнения научного гардероба"

/datum/supply_pack/vending/wardrobes/security
	name = "Ящик пополнения гардероба службы безопасности"
	desc = "Этот ящик содержит пополнения для SecDrobe, \
		DetDrobe и LawDrobe."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe,
					/obj/item/vending_refill/wardrobe/det_wardrobe,
					/obj/item/vending_refill/wardrobe/law_wardrobe,
				)
	crate_name = "ящик пополнения гардероба службы безопасности"
