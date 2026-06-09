
/////////////////////////////////////////
/////////////////Tools///////////////////
/////////////////////////////////////////

/datum/design/fire_extinguisher_advanced
	name = "Продвинутый огнетушитель"
	id = "adv_fire_extinguisher"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/titanium =SMALL_MATERIAL_AMOUNT*5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/extinguisher/advanced/empty
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/handdrill
	name = "Ручная дрель"
	desc = "Небольшая электрическая ручная дрель со сменными битами отвёртки и болта."
	id = "handdrill"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*1.75, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/screwdriver/power
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/jawsoflife
	name = "Челюсти жизни"
	desc = "Небольшие компактные челюсти жизни со сменными разжимными и режущими насадками."
	id = "jawsoflife" // added one more requirment since the Jaws of Life are a bit OP
	build_path = /obj/item/crowbar/power
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*2.25, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.75)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING
	autolathe_exportable = FALSE

/datum/design/exwelder
	name = "Экспериментальный сварочный аппарат"
	desc = "Экспериментальный сварочный аппарат, способный сам вырабатывать топливо."
	id = "exwelder"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/uranium =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/weldingtool/experimental
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rangedanalyzer
	name = "Экспериментальный дальнобойный газоанализатор"
	desc = "Экспериментальный газоанализатор, способный работать на большом расстоянии."
	id = "rangedanalyzer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.2, /datum/material/gold =SMALL_MATERIAL_AMOUNT * 3, /datum/material/bluespace=SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/analyzer/ranged
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ATMOSPHERICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/rpd
	name = "Быстрый прокладчик труб (RPD)"
	id = "rpd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*37.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*18.75)
	build_path = /obj/item/pipe_dispenser
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_loaded
	name = "Устройство быстрого строительства"
	desc = "Инструмент, способный на ходу строить и разбирать стены, шлюзы и полы."
	id = "rcd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*30, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/construction/rcd/loaded
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rtd_loaded
	name = "Устройство быстрой укладки плитки"
	desc = "Инструмент, способный на ходу укладывать и разрушать напольную плитку."
	id = "rtd_loaded"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 15, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/construction/rtd/loaded
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_ammo
	name = "Картридж материи RCD"
	id = "rcd_ammo"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*6, /datum/material/glass =SHEET_MATERIAL_AMOUNT*4)
	build_path = /obj/item/rcd_ammo
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/frames
	name = "Улучшение RCD: чертежи каркасов"
	desc = "Добавляет в RCD чертежи компьютерных и машинных каркасов."
	id = "rcd_upgrade_frames"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/frames
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/simple_circuits
	name = "Улучшение RCD: чертежи простых схем"
	desc = "Добавляет возможность создавать простые схемы с помощью RCD."
	id = "rcd_upgrade_simple_circuits"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/simple_circuits
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/anti_interrupt
	name = "Улучшение RCD: защита от прерывания"
	desc = "Предотвращает прерывание строительства и разборки через RCD."
	id = "rcd_upgrade_anti_interrupt"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 1.25,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/rcd_upgrade/anti_interrupt
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/cooling
	name = "Улучшение RCD: охлаждение"
	desc = "Позволяет RCD быстрее выполнять несколько действий подряд."
	id = "rcd_upgrade_cooling"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/rcd_upgrade/cooling
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/furnishing
	name = "Улучшение RCD: мебель"
	desc = "Добавляет возможность обставлять помещения с помощью RCD."
	id = "rcd_upgrade_furnishing"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/rcd_upgrade/furnishing
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rcd_upgrade/silo_link
	name = "Продвинутое улучшение RCD: связь с силосом"
	desc = "Позволяет RCD брать материалы из рудного силоса. Перед использованием RCD нужно привязать к силосу мультитулом."
	id = "rcd_upgrade_silo_link"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/titanium =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/bluespace =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/rcd_upgrade/silo_link
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rpd_upgrade/unwrench
	name = "Улучшение RPD: откручивание"
	desc = "Добавляет RPD обратный режим гаечного ключа. Внимание: из-за урезания бюджета режим жёстко привязан к кнопке режима разрушения."
	id = "rpd_upgrade_unwrench"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.25)
	build_path = /obj/item/rpd_upgrade/unwrench
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rld_mini
	name = "Мини-устройство быстрого освещения (MRLD)"
	desc = "Инструмент, способный устанавливать переносные и стационарные световые сферы, а также светящиеся палочки."
	id = "rld_mini"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*10, /datum/material/glass =SHEET_MATERIAL_AMOUNT*5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT*4, /datum/material/gold =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/construction/rld/mini
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SERVICE

/datum/design/geneshears
	name = "Ботаногенетические секаторы"
	desc = "Высокотехнологичные точные секаторы, способные вырезать генетические признаки из растения."
	id = "gene_shears"
	build_path = /obj/item/geneshears
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*2, /datum/material/uranium=HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/silver=SMALL_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_BOTANY_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/plumbing_rcd_service
	name = "Сервисный конструктор сантехники"
	id = "plumbing_rcd_service"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*37.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT*18.75, /datum/material/plastic =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/construction/plumbing/service
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_PLUMBING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/biopsy_tool
	name = "Инструмент для биопсии"
	id = "biopsy_tool"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*2, /datum/material/glass =SHEET_MATERIAL_AMOUNT*1.5)
	build_path = /obj/item/biopsy_tool
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_XENOBIOLOGY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/////////////////////////////////////////
//////////////Alien Tools////////////////
/////////////////////////////////////////

/datum/design/alienwrench
	name = "Инопланетный гаечный ключ"
	desc = "Продвинутый гаечный ключ, полученный с помощью технологий абдукторов."
	id = "alien_wrench"
	build_path = /obj/item/wrench/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/alienwirecutters
	name = "Инопланетные кусачки"
	desc = "Продвинутые кусачки, полученные с помощью технологий абдукторов."
	id = "alien_wirecutters"
	build_path = /obj/item/wirecutters/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/alienscrewdriver
	name = "Инопланетная отвёртка"
	desc = "Продвинутая отвёртка, полученная с помощью технологий абдукторов."
	id = "alien_screwdriver"
	build_path = /obj/item/screwdriver/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/aliencrowbar
	name = "Инопланетный лом"
	desc = "Продвинутый лом, полученный с помощью технологий абдукторов."
	id = "alien_crowbar"
	build_path = /obj/item/crowbar/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/alienwelder
	name = "Инопланетный сварочный аппарат"
	desc = "Продвинутый сварочный аппарат, полученный с помощью технологий абдукторов."
	id = "alien_welder"
	build_path = /obj/item/weldingtool/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/alienmultitool
	name = "Инопланетный мультитул"
	desc = "Продвинутый мультитул, полученный с помощью технологий абдукторов."
	id = "alien_multitool"
	build_path = /obj/item/multitool/abductor
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/////////////////////////////////////////
/////////Alien Surgical Tools////////////
/////////////////////////////////////////

/datum/design/alienscalpel
	name = "Инопланетный скальпель"
	desc = "Продвинутый скальпель, полученный с помощью технологий абдукторов."
	id = "alien_scalpel"
	build_path = /obj/item/scalpel/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT*5, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/alienhemostat
	name = "Инопланетный зажим"
	desc = "Продвинутый зажим, полученный с помощью технологий абдукторов."
	id = "alien_hemostat"
	build_path = /obj/item/hemostat/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT*5, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/alienretractor
	name = "Инопланетный ретрактор"
	desc = "Продвинутый ретрактор, полученный с помощью технологий абдукторов."
	id = "alien_retractor"
	build_path = /obj/item/retractor/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT*5, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/aliensaw
	name = "Инопланетная циркулярная пила"
	desc = "Продвинутая хирургическая пила, полученная с помощью технологий абдукторов."
	id = "alien_saw"
	build_path = /obj/item/circular_saw/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/aliendrill
	name = "Инопланетная дрель"
	desc = "Продвинутая дрель, полученная с помощью технологий абдукторов."
	id = "alien_drill"
	build_path = /obj/item/surgicaldrill/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT*5, /datum/material/silver =SHEET_MATERIAL_AMOUNT*1.25, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/aliencautery
	name = "Инопланетный каутер"
	desc = "Продвинутый каутер, полученный с помощью технологий абдукторов."
	id = "alien_cautery"
	build_path = /obj/item/cautery/alien
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =SMALL_MATERIAL_AMOUNT*5, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ALIEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/wirebrush
	name = "Проволочная щётка"
	desc = "Инструмент для удаления ржавчины со стен."
	id = "wirebrush"
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	category = list(RND_CATEGORY_INITIAL, RND_CATEGORY_TOOLS)
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 2, /datum/material/glass =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/wirebrush
	category = list(RND_CATEGORY_TOOLS)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)

/datum/design/bolter_wrench
	name = "Болтер-ключ"
	desc = "Гаечный ключ, способный откручивать шлюзы независимо от состояния питания."
	id = "bolter_wrench"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/wrench/bolter
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/shuttle_blueprints
	name = "Чертежи шаттла"
	desc = "Чертежи, пригодные для строительства шаттлов."
	id = "shuttle_blueprints"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/shuttle_blueprints
	category = list(RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/shuttle_remote
	name = "Пульт управления шаттлом"
	desc = "Пульт, который после привязки к навигационной консоли может отправлять шаттлы или пытаться пристыковать их."
	id = "shuttle_remote"
	build_type = PROTOLATHE
	build_path = /obj/item/shuttle_remote
	materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT, /datum/material/bluespace = HALF_SHEET_MATERIAL_AMOUNT, /datum/material/iron = SMALL_MATERIAL_AMOUNT * 2, /datum/material/glass = SMALL_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING
