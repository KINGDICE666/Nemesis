/obj/item/ammo_box/speedloader
	name = "спидлоадер (базовый тип)"
	desc = "Этого здесь быть не должно. Сообщите кодеру, спасибо!"
	multiple_sprites = AMMO_BOX_PER_BULLET
	ammo_box_multiload = (AMMO_BOX_MULTILOAD_IN | AMMO_BOX_MULTILOAD_OUT_LOADED)
	// You can feed ammo in from a box (assuming someone ever codes a relevant ammo box),
	// you can feed ammo out to a revolver's cylinder,
	// but you can't use it to teleport six bullets into a detached rifle magazine.

/obj/item/ammo_box/speedloader/c357
	name = "спидлоадер (.357)"
	desc = "Предназначен для быстрой перезарядки семизарядных револьверов .357."
	icon_state = "357"
	ammo_type = /obj/item/ammo_casing/c357
	max_ammo = 7
	caliber = CALIBER_357
	item_flags = NO_MAT_REDEMPTION
	ammo_band_icon = "+357_ammo_band"
	ammo_band_color = null

/obj/item/ammo_box/speedloader/c357/match
	name = "спидлоадер (.357 Match)"
	desc = parent_type::desc + " Матчевые патроны производятся с крайне малыми допусками, что удобно для демонстрации трюковых выстрелов."
	ammo_type = /obj/item/ammo_casing/c357/match
	ammo_band_color = "#77828a"

/obj/item/ammo_box/speedloader/c357/phasic
	name = "спидлоадер (.357 Phasic)"
	desc = parent_type::desc + " Фазовые патроны, также известные как 'Ghost Lead', специально изготовлены для прохождения через неорганический материал. Каким-то образом."
	ammo_type = /obj/item/ammo_casing/c357/phasic
	ammo_band_color = "#693a6a"

/obj/item/ammo_box/speedloader/c357/heartseeker
	name = "спидлоадер (.357 Heartseeker)"
	desc = parent_type::desc + " Heartseeker rounds veer into targets with exceptional precision using an unknown method. \
		It apparently predicts movement using neural pulses in the brain, but that's less marketable. \
		As seen in the hit NTFlik horror-space western film, Forget-Me-Not, brought to you by Roseus Galactic!"
	ammo_type = /obj/item/ammo_casing/c357/heartseeker
	ammo_band_color = "#a91e1e"

/obj/item/ammo_box/speedloader/c38
	name = "спидлоадер (.38)"
	desc = "Предназначен для быстрой перезарядки шестизарядных револьверов .38 Special."
	icon_state = "38"
	base_icon_state = "38"
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 6
	caliber = CALIBER_38
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT)
	ammo_band_icon = "+38_ammo_band"
	ammo_band_color = null

/obj/item/ammo_box/speedloader/c38/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-base"

/obj/item/ammo_box/speedloader/c38/update_overlays()
	. = ..()
	if(!LAZYLEN(stored_ammo))
		return
	for(var/inserted_ammo in 1 to stored_ammo.len)
		var/obj/item/ammo_casing/c38/boolet = stored_ammo[inserted_ammo]
		. += "38-[boolet::lead_or_laser]-[inserted_ammo]"

/obj/item/ammo_box/speedloader/c38/trac
	name = "спидлоадер (.38 TRAC)"
	desc = parent_type::desc + " Пули TRAC внедряют отслеживающий имплант в тело цели."
	ammo_type = /obj/item/ammo_casing/c38/trac
	ammo_band_color = COLOR_AMMO_TRACK

/obj/item/ammo_box/speedloader/c38/match
	name = "спидлоадер (.38 Match)"
	desc = parent_type::desc + " Матчевые пули производятся с крайне малыми допусками, что удобно для демонстрации трюковых выстрелов."
	ammo_type = /obj/item/ammo_casing/c38/match
	ammo_band_color = COLOR_AMMO_MATCH

/obj/item/ammo_box/speedloader/c38/match/bouncy
	name = "спидлоадер (.38 Rubber)"
	desc = parent_type::desc + " Резиновые патроны невероятно прыгучие и В ОСНОВНОМ менее летальные, отлично подходят для трюковых выстрелов."
	ammo_type = /obj/item/ammo_casing/c38/match/bouncy
	ammo_band_color = COLOR_AMMO_RUBBER

/obj/item/ammo_box/speedloader/c38/true
	name = "спидлоадер (.38 True Strike)"
	desc = parent_type::desc + " Пули True Strike после рикошета с удивительной точностью отскакивают к новым целям."
	ammo_type = /obj/item/ammo_casing/c38/match/true
	ammo_band_color = COLOR_AMMO_TRUESTRIKE

/obj/item/ammo_box/speedloader/c38/dumdum
	name = "спидлоадер (.38 DumDum)"
	desc = parent_type::desc + " DumDum bullets expand on impact, reducing outright stopping power but \
		shredding targets and causing massive bleeding in close range, \
		at the cost of suffering greatly against armor and distant targets."
	ammo_type = /obj/item/ammo_casing/c38/dumdum
	ammo_band_color = COLOR_AMMO_DUMDUM

/obj/item/ammo_box/speedloader/c38/hotshot
	name = "спидлоадер (.38 Hot Shot)"
	desc = parent_type::desc + " Пули Hot Shot содержат зажигательный заряд, поджигающий пораженные цели."
	ammo_type = /obj/item/ammo_casing/c38/hotshot
	ammo_band_color = COLOR_AMMO_HOTSHOT

/obj/item/ammo_box/speedloader/c38/iceblox
	name = "спидлоадер (.38 Iceblox)"
	desc = parent_type::desc + " Пули Iceblox содержат криогенный заряд, понижающий температуру тела пораженных целей."
	ammo_type = /obj/item/ammo_casing/c38/iceblox
	ammo_band_color = COLOR_AMMO_ICEBLOX

/obj/item/ammo_box/speedloader/c38/flare
	name = "спидлоадер (.38 Flare)"
	desc = parent_type::desc + " Гильзы Flare выпускают концентрированный пучок частиц в цель, подсвечивая ее для всех."
	ammo_type = /obj/item/ammo_casing/c38/flare
	ammo_band_color = COLOR_AMMO_HELLFIRE

/obj/item/ammo_box/speedloader/strilka310
	name = "обойма (.310 Strilka)"
	desc = "Патронная обойма на пять выстрелов для винтовок .310 Strilka."
	icon_state = "310_strip"
	ammo_type = /obj/item/ammo_casing/strilka310
	max_ammo = 5
	ammo_box_multiload = AMMO_BOX_MULTILOAD_ALL
	caliber = CALIBER_STRILKA310

/obj/item/ammo_box/speedloader/strilka310/surplus
	name = "обойма (.310 Surplus)"
	desc = parent_type::desc + " На ней есть несколько пятен ржавчины там, где нет избыточного количества оружейной смазки."
	ammo_type = /obj/item/ammo_casing/strilka310/surplus

/obj/item/ammo_box/speedloader/strilka310/phasic
	name = "обойма (.310 Phasic)"
	desc = parent_type::desc + " These should come with phasic bullets, \
		hastily developed after an incident where a misfire resulted in the destruction of Atrakor Silverscale's priceless Vigoxian Fabergé egg. \
		These fancy bullets pass right though valuables until they end up in a far less expensive human skull."
	ammo_type = /obj/item/ammo_casing/strilka310/phasic
