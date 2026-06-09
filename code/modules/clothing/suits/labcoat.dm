/obj/item/clothing/suit/toggle/labcoat
	name = "лабораторный халат"
	desc = "Одежда, защищающая от небольших химических разливов."
	icon_state = "labcoat"
	icon = 'icons/obj/clothing/suits/labcoat.dmi'
	worn_icon = 'icons/mob/clothing/suits/labcoat.dmi'
	inhand_icon_state = "labcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS
	allowed = list(
		/obj/item/analyzer,
		/obj/item/biopsy_tool,
		/obj/item/defibrillator/compact,
		/obj/item/dnainjector,
		/obj/item/flashlight/pen,
		/obj/item/gun/syringe,
		/obj/item/healthanalyzer,
		/obj/item/paper,
		/obj/item/reagent_containers/applicator,
		/obj/item/reagent_containers/cup/beaker,
		/obj/item/reagent_containers/cup/bottle,
		/obj/item/reagent_containers/cup/tube,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/syringe,
		/obj/item/sensor_device,
		/obj/item/soap,
		/obj/item/stack/medical,
		/obj/item/storage/pill_bottle,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
	)
	armor_type = /datum/armor/toggle_labcoat
	species_exception = list(/datum/species/golem)

/obj/item/clothing/suit/toggle/labcoat/cmo
	name = "лабораторный халат главного врача"
	desc = "Синее стандартной модели."
	icon_state = "labcoat_cmo"
	inhand_icon_state = null

/obj/item/clothing/suit/toggle/labcoat/cmo/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, -3) //FISH DOCTOR?!

/datum/armor/toggle_labcoat
	bio = 50
	fire = 50
	acid = 50

/obj/item/clothing/suit/toggle/labcoat/cmo/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/melee/baton/telescopic,
	)

/obj/item/clothing/suit/toggle/labcoat/paramedic
	name = "куртка парамедика"
	desc = "Темно-синяя куртка парамедика со светоотражающими полосами."
	icon_state = "labcoat_paramedic"
	inhand_icon_state = null

/obj/item/clothing/suit/toggle/labcoat/paramedic/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, -3) //FISH DOCTOR?!
	allowed += /obj/item/crowbar/power/paramedic

/obj/item/clothing/suit/toggle/labcoat/mad
	name = "\proper халат Безумца"
	desc = "В нем вы выглядите так, будто способны стукнуть кого-нибудь по башке и запустить в космос."
	icon_state = "labgreen"
	inhand_icon_state = null

/obj/item/clothing/suit/toggle/labcoat/genetics
	name = "халат генетика"
	desc = "Одежда, защищающая от небольших химических разливов. На плече есть синяя полоса."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/genetics"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#4A77A1#4A77A1#7095C2"

/obj/item/clothing/suit/toggle/labcoat/genetics/Initialize(mapload)
	. = ..()
	allowed += /obj/item/sequence_scanner

/obj/item/clothing/suit/toggle/labcoat/chemist
	name = "халат химика"
	desc = "Одежда, защищающая от небольших химических разливов. На плече есть оранжевая полоса."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/chemist"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#F17420#F17420#EB6F2C"

/obj/item/clothing/suit/toggle/labcoat/chemist/Initialize(mapload)
	. = ..()
	allowed += /obj/item/storage/bag/chemistry

/obj/item/clothing/suit/toggle/labcoat/virologist
	name = "халат вирусолога"
	desc = "Одежда, защищающая от небольших химических разливов. На плече есть зеленая полоса."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/virologist"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#198019#198019#40992E"

/obj/item/clothing/suit/toggle/labcoat/virologist/Initialize(mapload)
	. = ..()
	allowed += /obj/item/storage/bag/bio

/obj/item/clothing/suit/toggle/labcoat/coroner
	name = "халат коронера"
	desc = "Одежда, защищающая от небольших химических разливов. На плече есть черная полоса."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/coroner"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#2D2D33#2D2D33#39393F"

/obj/item/clothing/suit/toggle/labcoat/coroner/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/autopsy_scanner,
		/obj/item/scythe,
		/obj/item/shovel,
		/obj/item/shovel/serrated,
		/obj/item/trench_tool,
	)

/obj/item/clothing/suit/toggle/labcoat/science
	name = "халат ученого"
	desc = "Одежда, защищающая от небольших химических разливов. На плече есть фиолетовая полоса."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/science"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#7E1980#7E1980#B347A1"

/obj/item/clothing/suit/toggle/labcoat/science/Initialize(mapload)
	. = ..()
	allowed += /obj/item/storage/bag/xeno

/obj/item/clothing/suit/toggle/labcoat/roboticist
	name = "халат робототехника"
	desc = "Больше похож на эксцентричное пальто, чем на халат. Помогает выдавать пятна крови за часть эстетики. Идет с красными наплечниками."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/roboticist"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#88242D#88242D#39393F"

/obj/item/clothing/suit/toggle/labcoat/interdyne
	name = "халат Interdyne"
	desc = "Больше похож на эксцентричное пальто, чем на халат. Помогает выдавать пятна крови за часть эстетики. Идет с красными наплечниками."
	icon = 'icons/map_icons/clothing/suit/_suit.dmi'
	icon_state = "/obj/item/clothing/suit/toggle/labcoat/interdyne"
	post_init_icon_state = "labcoat_job"
	greyscale_config = /datum/greyscale_config/labcoat
	greyscale_config_worn = /datum/greyscale_config/labcoat/worn
	greyscale_colors = "#EEEEEE#88242D#88242D#39393F"

// Research Director

/obj/item/clothing/suit/toggle/labcoat/research_director
	name = "пальто научного руководителя"
	desc = "Нечто среднее между лабораторным халатом и обычным пальто. Сделано из специальной антибактериальной, кислотостойкой и биозащитной синтетической ткани."
	icon_state = "labcoat_rd"
	armor_type = /datum/armor/jacket_research_director
	body_parts_covered = CHEST|GROIN|ARMS

/datum/armor/jacket_research_director
	bio = 75
	fire = 75
	acid = 75

/obj/item/clothing/suit/toggle/labcoat/research_director/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/storage/bag/xeno,
		/obj/item/melee/baton/telescopic,
	)
