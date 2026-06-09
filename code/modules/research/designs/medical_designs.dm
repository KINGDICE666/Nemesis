/////////////////////////////////////////
////////////Medical Tools////////////////
/////////////////////////////////////////

/datum/design/healthanalyzer
	name = "Анализатор здоровья"
	id = "healthanalyzer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5)
	build_path = /obj/item/healthanalyzer
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/autopsy_scanner
	name = "Сканер аутопсии"
	id = "autopsyscanner"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*5, /datum/material/glass = SMALL_MATERIAL_AMOUNT)
	build_path = /obj/item/autopsy_scanner
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/bluespacebeaker
	name = "Блюспейс-мензурка"
	desc = "Блюспейс-мензурка на экспериментальной блюспейс-технологии, совмещённой с Element Cuban и Compound Pete. Вмещает до 300 единиц."
	id = "bluespacebeaker"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	build_path = /obj/item/reagent_containers/cup/beaker/bluespace
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/noreactbeaker
	name = "Криостазисная мензурка"
	desc = "Криостазисная мензурка, позволяющая хранить химикаты без реакций. Вмещает до 50 единиц."
	id = "splitbeaker"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	build_path = /obj/item/reagent_containers/cup/beaker/noreact
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/xlarge_beaker
	name = "Очень большая мензурка"
	id = "xlarge_beaker"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*2.5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	build_path = /obj/item/reagent_containers/cup/beaker/plastic
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/organ_jar
	name = "Банка для органов"
	id = "organ_jar"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*2.5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	build_path = /obj/item/reagent_containers/cup/beaker/organ_jar
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/meta_beaker
	name = "Метаматериальная мензурка"
	id = "meta_beaker"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*2.5, /datum/material/plastic =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	build_path = /obj/item/reagent_containers/cup/beaker/meta
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/ph_meter
	name = "Химический анализатор"
	id = "ph_meter"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*2.5, /datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/titanium =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/ph_meter
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/bluespacesyringe
	name = "Блюспейс-шприц"
	desc = "Продвинутый шприц, вмещающий 60 единиц химикатов."
	id = "bluespacesyringe"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass =SHEET_MATERIAL_AMOUNT, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/bluespace =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/reagent_containers/syringe/bluespace
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/dna_disk
	name = "Диск генетических данных"
	desc = "Дополнительные диски для хранения генетических данных."
	id = "dna_disk"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 3, /datum/material/glass =SMALL_MATERIAL_AMOUNT, /datum/material/silver =SMALL_MATERIAL_AMOUNT*0.5)
	build_path = /obj/item/disk/data
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GENETICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/piercesyringe
	name = "Пробивающий шприц"
	desc = "Шприц с алмазным наконечником, пробивающий броню при запуске на высокой скорости. Вмещает до 10 единиц."
	id = "piercesyringe"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/reagent_containers/syringe/piercing
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/inhaler
	name = "Ингалятор"
	desc = "Небольшое устройство для коротких выбросов аэрозольных химикатов. Для работы требует баллончик."
	id = "inhaler"
	build_path = /obj/item/inhaler/medical
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 0.1)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/inhaler_canister
	name = "Баллончик ингалятора"
	desc = "Небольшой баллончик с аэрозольными реагентами для использования в ингаляторе."
	id = "inhaler_canister"
	build_path = /obj/item/reagent_containers/inhaler_canister
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 0.2)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/bluespacebodybag
	name = "Блюспейс-мешок для тел"
	desc = "Мешок для тел на экспериментальной блюспейс-технологии. Вмещает множество тел и самых крупных существ."
	id = "bluespacebodybag"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =SHEET_MATERIAL_AMOUNT, /datum/material/diamond =SMALL_MATERIAL_AMOUNT*5, /datum/material/bluespace =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/bodybag/bluespace
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/stasis_bag
	name = "Стазисный мешок для тел"
	desc = "Мешок для тел, предназначенный для стабилизации пациентов в критическом состоянии в полевых условиях. \
		Сам мешок не может долго поддерживать стазис и со временем развалится."
	id = "stasis_bodybag"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/plastic = 10 * SHEET_MATERIAL_AMOUNT, // Very plastic expensive (but only because cloth cannot be put in the lathe)
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/bodybag/stasis
	category = list(RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/plasmarefiller
	name = "Заправка комбинезона плазмамена"
	desc = "Заправочный комплект для автоогнетушителя на костюмах плазмаменов."
	id = "plasmarefiller" //Why did this have no plasmatech
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*2, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/extinguisher_refill
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS_EQUIPMENT
	)
	departmental_flags = ALL

/datum/design/crewpinpointer
	name = "Пинпоинтер экипажа"
	desc = "Позволяет отслеживать местоположение, если датчики костюма цели включены в режим маяка."
	id = "crewpinpointer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/gold =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/pinpointer/crew
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/defibrillator_mount
	name = "Настенное крепление дефибриллятора"
	desc = "Настенная рама для хранения дефибрилляторов с простой защитой."
	id = "defibmountdefault"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/wallframe/defib_mount
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MOUNTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/defibrillator_mount_charging
	name = "Настенное крепление дефибриллятора PENLITE"
	desc = "Универсальная настенная рама для дефибрилляторов с ID-замками и зарядными кабелями. Версия PENLITE также медленно заряжает батарею дефибриллятора."
	id = "defibmount"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/silver =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/wallframe/defib_mount/charging
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MOUNTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/genescanner
	name = "Анализатор генетической последовательности"
	desc = "Удобный ручной анализатор для быстрого определения мутаций и сбора полной последовательности."
	id = "genescanner"
	build_path = /obj/item/sequence_scanner
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GENETICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/healthanalyzer_advanced
	name = "Продвинутый анализатор здоровья"
	desc = "Ручной сканер тела, способный с высокой точностью определять жизненные показатели субъекта."
	id = "healthanalyzer_advanced"
	build_path = /obj/item/healthanalyzer/advanced
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT*1.25, /datum/material/silver =SHEET_MATERIAL_AMOUNT, /datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/medigel
	name = "Медицинский гель"
	desc = "Флакон-аппликатор медицинского геля для точного нанесения, с откручивающейся крышкой."
	id = "medigel"
	build_path = /obj/item/reagent_containers/medigel
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*1.25, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/surgical_drapes
	name = "Хирургические салфетки"
	id = "surgical_drapes"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/surgical_drapes
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/laserscalpel
	name = "Лазерный скальпель"
	desc = "Лазерный скальпель для точных разрезов."
	id = "laserscalpel"
	build_path = /obj/item/scalpel/advanced
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*3, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/silver =SHEET_MATERIAL_AMOUNT, /datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/diamond =SMALL_MATERIAL_AMOUNT * 2, /datum/material/titanium = SHEET_MATERIAL_AMOUNT*2)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/mechanicalpinches
	name = "Механические щипцы"
	desc = "Эти щипцы можно использовать как ретрактор или зажим."
	id = "mechanicalpinches"
	build_path = /obj/item/retractor/advanced
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*6, /datum/material/glass = SHEET_MATERIAL_AMOUNT*2, /datum/material/silver = SHEET_MATERIAL_AMOUNT*2, /datum/material/titanium =SHEET_MATERIAL_AMOUNT * 2.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/searingtool
	name = "Прижигающий инструмент"
	desc = "Используется для соединения тканей. Или для их высверливания."
	id = "searingtool"
	build_path = /obj/item/cautery/advanced
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*2, /datum/material/glass =SHEET_MATERIAL_AMOUNT, /datum/material/plasma =SHEET_MATERIAL_AMOUNT, /datum/material/uranium =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/titanium =SHEET_MATERIAL_AMOUNT * 1.5)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/medical_spray_bottle
	name = "Медицинский распылитель"
	desc = "Обычный флакон-распылитель для создания мелкого тумана. Не путать с медспреем."
	id = "med_spray_bottle"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/reagent_containers/spray/medical
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/chem_pack
	name = "Пакет внутривенного лекарства"
	desc = "Пластиковый пакет под давлением для внутривенного введения препаратов."
	id = "chem_pack"
	build_type = PROTOLATHE | AWAY_LATHE
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
	materials = list(/datum/material/plastic =SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/reagent_containers/chem_pack
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/blood_pack
	name = "Пакет крови"
	desc = "Используется для хранения крови для переливания. Должен подключаться к капельнице."
	id = "blood_pack"
	build_type = PROTOLATHE | AWAY_LATHE
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
	materials = list(/datum/material/plastic =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/reagent_containers/blood
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/portable_chem_mixer
	name = "Портативный химический смеситель"
	desc = "Портативное устройство, выдающее и смешивающее химикаты. Реагенты подаются через мензурки."
	id = "portable_chem_mixer"
	build_type = PROTOLATHE | AWAY_LATHE
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
	materials = list(/datum/material/plastic =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/iron = SHEET_MATERIAL_AMOUNT*5, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 1.5)
	build_path = /obj/item/storage/portable_chem_mixer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/medical_bed
	name = "Медицинская кровать"
	desc = "Кровать из стерильных материалов, идеально подходящая для медотдела. Помощь пациентам или весёлые покатушки, справится со всем!"
	id = "medicalbed"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2.7, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 1.7)
	build_path = /obj/structure/bed/medical
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/emergency_bed
	name = "Медицинская кровать (экстренная)"
	desc = "Переносная складная версия медицинской кровати. Идеальна для парамедиков или случаев массовых жертв."
	id = "medicalbed_emergency"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2.7, /datum/material/plastic = SHEET_MATERIAL_AMOUNT * 1.7)
	build_path = /obj/item/emergency_bed
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/penlight
	name = "Медицинский фонарик"
	id = "penlight"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*0.5)
	build_path = /obj/item/flashlight/pen
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/penlight_paramedic
	name = "Фонарик парамедика"
	id = "penlight_paramedic"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*1)
	build_path = /obj/item/flashlight/pen/paramedic
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/flesh_reshapers
	name = "Изменитель плоти"
	desc = "Меняйте внешние черты!"
	id = "fleshreshaper"
	build_path = /obj/item/flesh_shears
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1, /datum/material/silver =SHEET_MATERIAL_AMOUNT * 1)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL_ADVANCED
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/flesh_reshapers/medical // slight variant with different color palette
	name = "Медицинский изменитель плоти"
	id = "fleshreshapermed"
	build_path = /obj/item/flesh_shears/medical
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/////////////////////////////////////////
//////////Cybernetic Implants////////////
/////////////////////////////////////////

/datum/design/cyberimp_breather
	name = "Имплант дыхательной трубки"
	desc = "Простой имплант добавляет на спину разъём для баллона, позволяя пользоваться подачей воздуха без маски и защищая от удушения."
	id = "ci-breather"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 3.5 SECONDS
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*6, /datum/material/glass = SMALL_MATERIAL_AMOUNT*2.5)
	build_path = /obj/item/organ/cyberimp/mouth/breathing_tube
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_surgical
	name = "Ручной хирургический имплант"
	desc = "Набор хирургических инструментов, скрытый за потайной панелью на руке пользователя."
	id = "ci-surgery"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1.25,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	construction_time = 2 SECONDS
	build_path = /obj/item/organ/cyberimp/arm/toolkit/surgery
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_toolset
	name = "Ручной имплант набора инструментов"
	desc = "Упрощённая версия инженерного набора инструментов киборга, предназначенная для установки в руку субъекта."
	id = "ci-toolset"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1.25,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 1.5,
	)
	construction_time = 2 SECONDS
	build_path = /obj/item/organ/cyberimp/arm/toolkit/toolset
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_medical_hud
	name = "Имплант медицинского ИЛС"
	desc = "Эти кибернетические глаза отображают медицинский ИЛС поверх всего видимого. Управление движением глаз."
	id = "ci-medhud"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 5 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/cyberimp/eyes/hud/medical
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_security_hud
	name = "Имплант охранного ИЛС"
	desc = "Эти кибернетические глаза отображают охранный ИЛС поверх всего видимого. Управление движением глаз."
	id = "ci-sechud"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 5 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*7.5,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*7.5,
	)
	build_path = /obj/item/organ/cyberimp/eyes/hud/security
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_diagnostic_hud
	name = "Имплант диагностического ИЛС"
	desc = "Эти кибернетические глаза отображают диагностический ИЛС поверх всего видимого. Управление движением глаз."
	id = "ci-diaghud"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 5 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*6,
	)
	build_path = /obj/item/organ/cyberimp/eyes/hud/diagnostic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_xray
	name = "Рентгеновские глаза"
	desc = "Эти кибернетические глаза дают рентгеновское зрение. Моргать бесполезно."
	id = "ci-xray"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/plasma = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/uranium = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/bluespace = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/eyes/robotic/xray
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_COMBAT
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_xray/moth
	name = "Рентгеновские глаза ниана"
	id = "ci-xray-moth"
	build_path = /obj/item/organ/eyes/robotic/xray/moth

/datum/design/cyberimp_thermals
	name = "Термальные глаза"
	desc = "Эти кибернетические глаза дают тепловое зрение. Вертикальный щелевидный зрачок прилагается."
	id = "ci-thermals"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond =SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/eyes/robotic/thermals
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_COMBAT
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_thermals/moth
	name = "Термальные глаза ниана"
	id = "ci-thermals-moth"
	build_path = /obj/item/organ/eyes/robotic/thermals/moth

/datum/design/cyberimp_tacvisor
	name = "Тактический визор IFF"
	desc = "Мощный визор IFF со встроенным LED-дисплеем. Может критически перегрузить префронтальную кору пользователя."
	id = "ci-tacvisor"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT * 4,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT * 4,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT * 4,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT * 6,
		/datum/material/plasma = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/eyes/robotic/tacvisor
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_COMBAT
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_antidrop
	name = "Имплант против выпадения"
	desc = "Этот кибернетический мозговой имплант заставляет мышцы рук сокращаться, не давая выронить предмет. Переключается движением уха."
	id = "ci-antidrop"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*4,
		/datum/material/gold = SMALL_MATERIAL_AMOUNT*4,
	)
	build_path = /obj/item/organ/cyberimp/brain/anti_drop
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_COMBAT
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_antistun
	name = "Имплант перезапуска ЦНС"
	desc = "Этот имплант автоматически возвращает контроль над центральной нервной системой, сокращая время беспомощности при оглушении."
	id = "ci-antistun"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/silver =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/cyberimp/brain/anti_stun
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_COMBAT
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_herculean
	name = "Геркулесов гравитронный спинной имплант"
	desc = "Этот гравитронный спинной интерфейс снижает воздействие гравитации на тело пользователя, фактически улучшая физические показатели."
	id = "ci-herculean"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/titanium=SMALL_MATERIAL_AMOUNT*3,
		/datum/material/gold=SMALL_MATERIAL_AMOUNT*3,
		/datum/material/diamond =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/cyberimp/chest/spine
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_connector
	name = "Имплант разъёма скиллчипов ЦНС"
	desc = "Эта кибернетика добавляет порт на затылке, позволяя свободно извлекать и устанавливать скиллчипы."
	id = "ci-connector"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/titanium = SMALL_MATERIAL_AMOUNT*3,
	)
	build_path = /obj/item/organ/cyberimp/brain/connector
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_MISC
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_nutriment
	name = "Имплант питательного насоса"
	desc = "Этот имплант синтезирует и вводит в кровь небольшое количество питательных веществ, когда вы голодаете."
	id = "ci-nutriment"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/iron =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/cyberimp/chest/nutriment
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_nutriment_plus
	name = "Имплант питательного насоса ПЛЮС"
	desc = "Этот имплант синтезирует и вводит в кровь небольшое количество питательных веществ, когда вы проголодались."
	id = "ci-nutrimentplus"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 5 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*6,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT*5,
		/datum/material/uranium = SMALL_MATERIAL_AMOUNT*7.5,
	)
	build_path = /obj/item/organ/cyberimp/chest/nutriment/plus
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_reviver
	name = "Имплант-реаниматор"
	desc = "Этот имплант попытается оживить вас при потере сознания. Для слабых сердцем!"
	id = "ci-reviver"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 6 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*8,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*8,
		/datum/material/gold =SMALL_MATERIAL_AMOUNT * 3,
		/datum/material/uranium =SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/cyberimp/chest/reviver
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_thrusters
	name = "Имплант набора маневровых двигателей"
	desc = "Этот имплант позволяет использовать газ из окружения или баллона для движения в невесомости."
	id = "ci-thrusters"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 8 SECONDS
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT*2,
		/datum/material/glass =SHEET_MATERIAL_AMOUNT,
		/datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/cyberimp/chest/thrusters
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_surgery_brain
	name = "Имплант хирургического процессора"
	desc = "Кибернетический мозговой имплант, открывающий доступ к продвинутым операциям."
	id = "ci-surgery-brain"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 0.25,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 0.5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT * 0.75,
	)
	build_path = /obj/item/organ/cyberimp/brain/surgical_processor
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_UTILITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/////////////////////////////////////////
////////////Regular Implants/////////////
/////////////////////////////////////////

/datum/design/implanter
	name = "Имплантер"
	desc = "Стерильный автоматический инъектор имплантов."
	id = "implanter"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*6, /datum/material/glass =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/implanter
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_TOOLS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/implantcase
	name = "Футляр импланта"
	desc = "Стеклянный футляр для хранения импланта."
	id = "implantcase"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/implantcase
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_TOOLS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/implant_sadtrombone
	name = "Футляр импланта грустного тромбона"
	desc = "Делает смерть забавной."
	id = "implant_trombone"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/bananium =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/implantcase/sad_trombone
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_HEALTH
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/implant_chem
	name = "Футляр химического импланта"
	desc = "Стеклянный футляр с химическим имплантом."
	id = "implant_chem"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT * 7)
	build_path = /obj/item/implantcase/chem
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/implant_tracking
	name = "Футляр отслеживающего импланта"
	desc = "Стеклянный футляр с отслеживающим имплантом."
	id = "implant_tracking"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 5)
	build_path = /obj/item/implantcase/tracking
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/implant_beacon
	name = "Футляр импланта-маяка"
	desc = "Стеклянный футляр с имплантом-маяком."
	id = "implant_beacon"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 5, /datum/material/bluespace = SMALL_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/implantcase/beacon
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/implant_bluespace
	name = "Футляр блюспейс-заземляющего импланта"
	desc = "Стеклянный футляр с имплантом-блокиратором телепортации."
	id = "implant_bluespace"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 5, /datum/material/bluespace = SMALL_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/implantcase/teleport_blocker
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/implant_exile
	name = "Футляр импланта изгнания"
	desc = "Стеклянный футляр с имплантом изгнания."
	id = "implant_exile"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 5, /datum/material/titanium = SMALL_MATERIAL_AMOUNT * 3)
	build_path = /obj/item/implantcase/exile
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_IMPLANTS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

//Cybernetic organs

/datum/design/cybernetic_liver
	name = "Базовая кибернетическая печень"
	desc = "Базовая кибернетическая печень."
	id = "cybernetic_liver"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/liver/cybernetic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_liver/tier2
	name = "Кибернетическая печень"
	desc = "Кибернетическая печень."
	id = "cybernetic_liver_tier2"
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/liver/cybernetic/tier2
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_liver/tier3
	name = "Улучшенная кибернетическая печень"
	desc = "Улучшенная кибернетическая печень."
	id = "cybernetic_liver_tier3"
	construction_time = 5 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/silver=SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/liver/cybernetic/tier3
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_heart
	name = "Базовое кибернетическое сердце"
	desc = "Базовое кибернетическое сердце."
	id = "cybernetic_heart"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/heart/cybernetic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_heart/tier2
	name = "Кибернетическое сердце"
	desc = "Кибернетическое сердце."
	id = "cybernetic_heart_tier2"
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/heart/cybernetic/tier2
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_heart/tier3
	name = "Улучшенное кибернетическое сердце"
	desc = "Улучшенное кибернетическое сердце."
	id = "cybernetic_heart_tier3"
	construction_time = 5 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/silver=SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/heart/cybernetic/tier3
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_heart/anomalock
	name = "Вольтаическое боевое киберсердце"
	desc = "Передовое киберсердце, изначально разработанное для ударных отрядов Nanotrasen, но позже рассекреченное для обычных исследований. Вольтаическая технология помогает телу держаться в критических обстоятельствах и перенаправляет аномальную энергию потока, полностью защищая пользователя от ударов током и ЭМИ. Не работает без ядра потоковой аномалии."
	id = "cybernetic_heart_anomalock"
	construction_time = 5 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/diamond = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/organ/heart/cybernetic/anomalock
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/cybernetic_lungs
	name = "Базовые кибернетические лёгкие"
	desc = "Базовая пара кибернетических лёгких."
	id = "cybernetic_lungs"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/lungs/cybernetic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_lungs/tier2
	name = "Кибернетические лёгкие"
	desc = "Пара кибернетических лёгких."
	id = "cybernetic_lungs_tier2"
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/lungs/cybernetic/tier2
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_lungs/tier3
	name = "Улучшенные кибернетические лёгкие"
	desc = "Пара улучшенных кибернетических лёгких."
	id = "cybernetic_lungs_tier3"
	construction_time = 5 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/silver =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/lungs/cybernetic/tier3
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_stomach
	name = "Базовый кибернетический желудок"
	desc = "Базовый кибернетический желудок."
	id = "cybernetic_stomach"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/stomach/cybernetic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_stomach/tier2
	name = "Кибернетический желудок"
	desc = "Кибернетический желудок."
	id = "cybernetic_stomach_tier2"
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/stomach/cybernetic/tier2
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_stomach/tier3
	name = "Улучшенный кибернетический желудок"
	desc = "Улучшенный кибернетический желудок."
	id = "cybernetic_stomach_tier3"
	construction_time = 5 SECONDS
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/silver =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/organ/stomach/cybernetic/tier3
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears
	name = "Базовые кибернетические уши"
	desc = "Базовая пара кибернетических ушей."
	id = "cybernetic_ears"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 3 SECONDS
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*2.5, /datum/material/glass = SMALL_MATERIAL_AMOUNT*4)
	build_path = /obj/item/organ/ears/cybernetic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears_u
	name = "Кибернетические уши"
	desc = "Пара кибернетических ушей."
	id = "cybernetic_ears_u"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/ears/cybernetic/upgraded
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears_whisper
	name = "Кибернетические уши для шёпота"
	desc = "Пара кибернетических ушей с повышенной чувствительностью к шёпоту."
	id = "cybernetic_ears_whisper"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/ears/cybernetic/whisper
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears_volume
	name = "Кибернетические уши с регулировкой громкости"
	desc = "Пара кибернетических ушей с регулировкой громкости."
	id = "cybernetic_ears_volume"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
			/datum/material/iron = SMALL_MATERIAL_AMOUNT*5,
			/datum/material/glass = SMALL_MATERIAL_AMOUNT*5,
			/datum/material/silver = SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/ears/cybernetic/volume
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears_xray
	name = "Кибернетические уши сквозь стены"
	desc = "Пара кибернетических ушей, слышащих сквозь стены."
	id = "cybernetic_ears_xray"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(
		/datum/material/iron = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/glass = SMALL_MATERIAL_AMOUNT*5,
		/datum/material/silver = SMALL_MATERIAL_AMOUNT*5,
	)
	build_path = /obj/item/organ/ears/cybernetic/xray
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_ears/cat
	name = "Базовые кибернетические кошачьи уши"
	desc = "Базовая пара кибернетических кошачьих ушей."
	id = "cybernetic_ears_cat"
	build_path = /obj/item/organ/ears/cat/cybernetic

/datum/design/cybernetic_ears_u/cat
	name = "Кибернетические кошачьи уши"
	desc = "Пара кибернетических кошачьих ушей."
	id = "cybernetic_ears_u_cat"
	build_path = /obj/item/organ/ears/cat/cybernetic/upgraded

/datum/design/cybernetic_ears_whisper/cat
	name = "Кибернетические кошачьи уши для шёпота"
	desc = "Пара кибернетических кошачьих ушей с повышенной чувствительностью к шёпоту."
	id = "cybernetic_ears_whisper_cat"
	build_path = /obj/item/organ/ears/cat/cybernetic/whisper

/datum/design/cybernetic_ears_volume/cat
	name = "Кибернетические кошачьи уши с регулировкой громкости"
	desc = "Пара кибернетических кошачьих ушей с регулировкой громкости."
	id = "cybernetic_ears_volume_cat"
	build_path = /obj/item/organ/ears/cat/cybernetic/volume

/datum/design/cybernetic_ears_xray/cat
	name = "Кибернетические кошачьи уши сквозь стены"
	desc = "Пара кибернетических кошачьих ушей, слышащих сквозь стены."
	id = "cybernetic_ears_xray_cat"
	build_path = /obj/item/organ/ears/cat/cybernetic/xray

/datum/design/cybernetic_eyes
	name = "Базовые кибернетические глаза"
	desc = "Базовая пара кибернетических глаз."
	id = "cybernetic_eyes"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 3 SECONDS
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*2.5, /datum/material/glass = SMALL_MATERIAL_AMOUNT*4)
	build_path = /obj/item/organ/eyes/robotic/basic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_eyes/moth
	name = "Базовые кибернетические глаза ниана"
	id = "cybernetic_eyes_moth"
	build_path = /obj/item/organ/eyes/robotic/basic/moth

/datum/design/cybernetic_eyes/improved
	name = "Кибернетические глаза"
	desc = "Пара кибернетических глаз."
	id = "cybernetic_eyes_improved"
	build_path = /obj/item/organ/eyes/robotic
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_2
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cybernetic_eyes/improved/moth
	name = "Кибернетические глаза ниана"
	id = "cybernetic_eyes_improved_moth"
	build_path = /obj/item/organ/eyes/robotic/moth

/datum/design/cyberimp_welding
	name = "Глаза со сварочной защитой"
	desc = "Эти реактивные микрозащитные экраны защищают от сварки и вспышек, не закрывая обзор."
	id = "ci-welding"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*6, /datum/material/glass = SMALL_MATERIAL_AMOUNT*4)
	build_path = /obj/item/organ/eyes/robotic/shield
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_welding/moth
	name = "Глаза ниана со сварочной защитой"
	id = "ci-welding-moth"
	build_path = /obj/item/organ/eyes/robotic/shield/moth

/datum/design/cyberimp_gloweyes
	name = "Люминесцентные глаза"
	desc = "Пара кибернетических глаз, способных излучать многоцветный свет."
	id = "ci-gloweyes"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*6, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT)
	build_path = /obj/item/organ/eyes/robotic/glow
	category = list(
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_3
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cyberimp_gloweyes/moth
	name = "Люминесцентные глаза ниана"
	id = "ci-gloweyes-moth"
	build_path = /obj/item/organ/eyes/robotic/glow/moth

/datum/design/medibot_upgrade
	name = "Улучшение медботов"
	desc = "Автоматически повышает эффективность всех медботов, подключённых к исследовательской сети."
	id = "medibot_upgrade"
	research_icon = 'icons/mob/silicon/aibots.dmi'
	research_icon_state = "medbot_generic_idle"
	/// Medibot healing starts at a 1x multiplier. For every tech researched, it goes up by this amount additively.
	var/additive_multiplier = 1

/datum/design/medibot_upgrade/tier_two
	id = "medibot_upgrade_two"
	research_icon_state = "medbot_adv_idle"

/datum/design/medibot_upgrade/tier_three
	id = "medibot_upgrade_three"
	research_icon_state = "medbot_adv_idle"

/datum/design/medibot_upgrade/tier_four
	id = "medibot_upgrade_four"
	research_icon_state = "medbot_bezerk_idle" // alien tech

/////////////////////
///Surgery Designs///
/////////////////////

/datum/design/surgery
	abstract_type = /datum/design/surgery
	id = DESIGN_ID_IGNORE
	name = null
	desc = null
	research_icon = 'icons/obj/medical/surgery_ui.dmi'
	research_icon_state = "surgery_any"
	/// Typepath of what operation this design unlocks
	var/datum/surgery_operation/surgery

/datum/design/surgery/New()
	. = ..()
	if(isnull(name))
		name = surgery::rnd_name || capitalize(surgery::name)
	if(isnull(desc))
		desc = surgery::rnd_desc || surgery::desc

/datum/design/surgery/lobotomy
	id = "surgery_lobotomy"
	surgery = /datum/surgery_operation/organ/lobotomy
	research_icon_state = "surgery_head"

/datum/design/surgery/lobotomy/mechanic
	id = "surgery_lobotomy_mechanic"
	surgery = /datum/surgery_operation/organ/lobotomy/mechanic

/datum/design/surgery/pacify
	id = "surgery_pacify"
	surgery = /datum/surgery_operation/organ/pacify
	research_icon_state = "surgery_head"

/datum/design/surgery/pacify/mechanic
	id = "surgery_pacify_mechanic"
	surgery = /datum/surgery_operation/organ/pacify/mechanic

/datum/design/surgery/viral_bonding
	id = "surgery_viral_bond"
	surgery = /datum/surgery_operation/basic/viral_bonding
	research_icon_state = "surgery_chest"

/datum/design/surgery/tend_wounds_upgrade
	name = "Улучшение обработки ран"
	desc = "Повышает эффективность отдельных операций по обработке ран."
	id = "surgery_heal_upgrade"
	surgery = /datum/surgery_operation/basic/tend_wounds/upgraded
	research_icon_state = "surgery_chest"

/datum/design/surgery/tend_wounds_upgrade/femto
	name = "Улучшение обработки ран"
	surgery = /datum/surgery_operation/basic/tend_wounds/upgraded/master
	id = "surgery_heal_upgrade_femto"

/datum/design/surgery/tend_wounds_combo
	name = "Комбинированная обработка ран"
	desc = "Альтернативная операция обработки ран, одновременно лечащая ушибы и ожоги, но менее эффективно, чем отдельные процедуры."
	surgery = /datum/surgery_operation/basic/tend_wounds/combo
	id = "surgery_heal_combo"
	research_icon_state = "surgery_chest"

/datum/design/surgery/tend_wounds_combo/upgrade
	name = "Улучшение комбинированной обработки ран"
	surgery = /datum/surgery_operation/basic/tend_wounds/combo/upgraded
	id = "surgery_heal_combo_upgrade"

/datum/design/surgery/tend_wounds_combo/upgrade/femto
	name = "Улучшение комбинированной обработки ран"
	desc = "Вершина операций по обработке ран: лечит ушибы и ожоги одновременно и быстрее, чем отдельные процедуры."
	surgery = /datum/surgery_operation/basic/tend_wounds/combo/upgraded/master
	id = "surgery_heal_combo_upgrade_femto"

/datum/design/surgery/brainwashing
	id = "surgery_brainwashing"
	surgery = /datum/surgery_operation/organ/brainwash
	research_icon_state = "surgery_head"

/datum/design/surgery/brainwashing/mechanic
	id = "surgery_brainwashing_mechanic"
	surgery = /datum/surgery_operation/organ/brainwash/mechanic

/datum/design/surgery/nerve_splicing
	desc = "Хирургическая процедура сращивает нервы пациента, повышая устойчивость к оглушению."
	id = "surgery_nerve_splice"
	surgery = /datum/surgery_operation/limb/bioware/nerve_splicing
	research_icon_state = "surgery_chest"

/datum/design/surgery/nerve_splicing/mechanic
	desc = "Роботизированное улучшение модернизирует автоматические системы пациента, повышая устойчивость к оглушению."
	id = "surgery_nerve_splice_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/nerve_splicing/mechanic

/datum/design/surgery/nerve_grounding
	desc = "Хирургическая процедура заставляет нервы пациента работать как заземляющие стержни, защищая от ударов током."
	id = "surgery_nerve_ground"
	surgery = /datum/surgery_operation/limb/bioware/nerve_grounding
	research_icon_state = "surgery_chest"

/datum/design/surgery/nerve_grounding/mechanic
	desc = "Роботизированное улучшение устанавливает заземляющие стержни в систему пациента, защищая от ударов током."
	id = "surgery_nerve_ground_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/nerve_grounding/mechanic

/datum/design/surgery/vein_threading
	desc = "Хирургическая процедура значительно снижает потерю крови при травмах."
	id = "surgery_vein_thread"
	surgery = /datum/surgery_operation/limb/bioware/vein_threading
	research_icon_state = "surgery_chest"

/datum/design/surgery/vein_threading/mechanic
	desc = "Роботизированное улучшение значительно снижает потерю гидравлической жидкости при повреждениях."
	id = "surgery_vein_thread_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/vein_threading/mechanic

/datum/design/surgery/muscled_veins
	desc = "Хирургическая процедура добавляет мышечную оболочку к сосудам, позволяя пациенту перекачивать кровь без сердца."
	id = "surgery_muscled_veins"
	surgery = /datum/surgery_operation/limb/bioware/muscled_veins
	research_icon_state = "surgery_chest"

/datum/design/surgery/muscled_veins/mechanic
	desc = "Роботизированное улучшение добавляет сложное резервирование гидравлики, позволяя пациенту перекачивать гидравлическую жидкость без двигателя."
	id = "surgery_muscled_veins_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/muscled_veins/mechanic

/datum/design/surgery/ligament_hook
	desc = "Хирургическая процедура меняет соединения между торсом и конечностями, позволяя вручную прикреплять отсечённые конечности. \
		Однако это ослабляет соединение, из-за чего их также проще отсоединить."
	id = "surgery_ligament_hook"
	surgery = /datum/surgery_operation/limb/bioware/ligament_hook
	research_icon_state = "surgery_chest"

/datum/design/surgery/ligament_hook/mechanic
	desc = "Роботизированное улучшение устанавливает крепления быстрого отсоединения, позволяя вручную прикреплять отделённые конечности. \
		Однако это ослабляет соединение, из-за чего их также проще отсоединить."
	id = "surgery_ligament_hook_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/ligament_hook/mechanic

/datum/design/surgery/ligament_reinforcement
	desc = "Хирургическая процедура добавляет защитную ткань и костный каркас вокруг соединений торса и конечностей, предотвращая расчленение. \
		Однако нервные соединения из-за этого проще нарушить, поэтому конечности легче вывести из строя повреждениями."
	id = "surgery_ligament_reinforcement"
	surgery = /datum/surgery_operation/limb/bioware/ligament_reinforcement
	research_icon_state = "surgery_chest"

/datum/design/surgery/ligament_reinforcement/mechanic
	desc = "Процедура добавляет усиленные точки крепления конечностей к шасси пациента, предотвращая расчленение. \
		Однако нервные соединения из-за этого проще нарушить, поэтому конечности легче вывести из строя повреждениями."
	id = "surgery_ligament_reinforcement_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/ligament_reinforcement/mechanic

/datum/design/surgery/cortex_imprint
	desc = "Хирургическая процедура меняет кору мозга на резервный нейронный паттерн, позволяя мозгу обходить повреждения от лёгких травм."
	id = "surgery_cortex_imprint"
	surgery = /datum/surgery_operation/limb/bioware/cortex_imprint
	research_icon_state = "surgery_head"

/datum/design/surgery/cortex_imprint/mechanic
	desc = "Процедура обновляет операционную систему пациента до «последней версии», что бы это ни значило, позволяя мозгу обходить повреждения от лёгких травм."
	id = "surgery_cortex_imprint_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/cortex_imprint/mechanic

/datum/design/surgery/cortex_folding
	desc = "Хирургическая процедура превращает кору мозга в сложную складку, освобождая место для нестандартных нейронных паттернов."
	id = "surgery_cortex_folding"
	surgery = /datum/surgery_operation/limb/bioware/cortex_folding
	research_icon_state = "surgery_head"

/datum/design/surgery/cortex_folding/mechanic
	desc = "Роботизированное улучшение перепрограммирует нейросеть пациента на откровенно потустороннем языке, освобождая место для нестандартных нейронных паттернов."
	id = "surgery_cortex_folding_mechanic"
	surgery = /datum/surgery_operation/limb/bioware/cortex_folding/mechanic

/datum/design/surgery/necrotic_revival
	id = "surgery_zombie"
	surgery = /datum/surgery_operation/limb/bionecrosis
	research_icon_state = "surgery_head"

/datum/design/surgery/wing_reconstruction
	id = "surgery_wing_reconstruction"
	surgery = /datum/surgery_operation/organ/fix_wings
	research_icon_state = "surgery_chest"

/datum/design/surgery/experimental_dissection
	id = "surgery_oldstation_dissection"
	surgery = /datum/surgery_operation/basic/dissection
	research_icon_state = "surgery_chest"

/datum/design/vitals_monitor
	name = "Монитор жизненных показателей"
	desc = "Настенный компьютер, отображающий жизненные показатели пациента поблизости. \
		Подключается к стазисным кроватям, операционным столам и другим машинам, удерживающим пациентов, \
		например криокапсулам, слиперам и другим устройствам."
	id = "vitals_monitor"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT * 0.5,
	)
	build_path = /obj/item/wallframe/status_display/vitals
	category = list(RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/vitals_monitor/advanced
	name = "Продвинутый монитор жизненных показателей"
	desc = "Обновлённый дисплей жизненных показателей, выполняющий более детальное сканирование пациента, чем базовая версия."
	id = "vitals_monitor_advanced"
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT * 0.5,
	)
	build_path = /obj/item/wallframe/status_display/vitals/advanced
