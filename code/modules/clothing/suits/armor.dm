/obj/item/clothing/suit/armor
	name = "броня"
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	abstract_type = /obj/item/clothing/suit/armor
	allowed = null
	body_parts_covered = CHEST
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 6 SECONDS
	equip_delay_other = 4 SECONDS
	max_integrity = 250
	resistance_flags = NONE
	armor_type = /datum/armor/suit_armor

/datum/armor/suit_armor
	melee = 35
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/suit/armor/Initialize(mapload)
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/armor/apply_fantasy_bonuses(bonus)
	. = ..()
	slowdown = modify_fantasy_variable("slowdown", slowdown, -bonus * 0.1, 0)
	if(ismob(loc))
		var/mob/wearer = loc
		wearer.update_equipment_speed_mods()

/obj/item/clothing/suit/armor/remove_fantasy_bonuses(bonus)
	slowdown = reset_fantasy_variable("slowdown", slowdown)
	if(ismob(loc))
		var/mob/wearer = loc
		wearer.update_equipment_speed_mods()
	return ..()

/obj/item/clothing/suit/armor/vest
	name = "бронежилет"
	desc = "Тонкий бронежилет типа I, обеспечивающий достойную защиту от большинства видов урона."
	icon_state = "armoralt"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	dog_fashion = /datum/dog_fashion/back/armorvest

/obj/item/clothing/suit/armor/vest/alt
	desc = "Бронежилет типа I, обеспечивающий достойную защиту от большинства видов урона."
	icon_state = "armor"
	inhand_icon_state = "armor"

/obj/item/clothing/suit/armor/vest/alt/sec
	icon_state = "armor_sec"

/obj/item/clothing/suit/armor/vest/press
	name = "бронежилет прессы"
	desc = "Синий бронежилет, обозначающий <i>некомбатантов</i> из \"ПРЕССЫ\", будто кому-то не все равно."
	icon_state = "armor_press"

/obj/item/clothing/suit/armor/vest/press/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands)
		. += emissive_appearance(icon_file, "[icon_state]-emissive", src, alpha = src.alpha, effect_type = EMISSIVE_SPECULAR)

/obj/item/clothing/suit/armor/vest/marine
	name = "тактический бронежилет"
	desc = "Комплект лучших массово производимых штампованных пласталевых бронепластин с модулем защиты от среды для выбивания дверей в любых условиях."
	icon_state = "marine_command"
	inhand_icon_state = "armor"
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/vest_marine
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT_OFF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/datum/armor/vest_marine
	melee = 50
	bullet = 50
	laser = 30
	energy = 25
	bomb = 50
	bio = 100
	fire = 40
	acid = 50
	wound = 20

/datum/armor/pmc
	melee = 40
	bullet = 50
	laser = 60
	energy = 50
	bomb = 50
	bio = 100
	acid = 50
	wound = 20

/obj/item/clothing/suit/armor/vest/marine/security
	name = "большой тактический бронежилет"
	icon_state = "marine_security"

/obj/item/clothing/suit/armor/vest/marine/engineer
	name = "тактический инженерный бронежилет"
	icon_state = "marine_engineer"

/obj/item/clothing/suit/armor/vest/marine/medic
	name = "тактический бронежилет медика"
	icon_state = "marine_medic"
	body_parts_covered = CHEST|GROIN

/obj/item/clothing/suit/armor/vest/marine/pmc
	desc = "Комплект лучших массово производимых штампованных пласталевых бронепластин для универсального выбивания дверей и ломания лиц. Выдающаяся живучесть компенсирует отсутствие космостойкости."
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	clothing_flags = THICKMATERIAL
	w_class = WEIGHT_CLASS_BULKY
	armor_type = /datum/armor/pmc

/obj/item/clothing/suit/armor/vest/old
	name = "изношенный бронежилет"
	desc = "Бронежилет типа I старого поколения. Из-за деградации со временем двигаться в нем стало гораздо сложнее."
	icon_state = "armor"
	inhand_icon_state = "armor"
	slowdown = 1

/obj/item/clothing/suit/armor/vest/blueshirt
	name = "большой бронежилет"
	desc = "Крупная, но удобная броня, защищающая от некоторых угроз."
	icon_state = "blueshift"
	inhand_icon_state = null
	custom_premium_price = PAYCHECK_COMMAND

/obj/item/clothing/suit/armor/vest/cuirass
	name = "кираса"
	desc = "Более легкая пластинчатая броня, которая все еще защищает от надоедливых стрел, сохраняя подвижность."
	icon_state = "cuirass"
	inhand_icon_state = "armor"
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/cuirass/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 8)

/obj/item/clothing/suit/armor/hos
	name = "бронированная шинель"
	desc = "Шинель, усиленная особым сплавом ради дополнительной защиты и стиля для тех, кто обладает командным видом."
	icon_state = "hos"
	inhand_icon_state = "greatcoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor_type = /datum/armor/armor_hos
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 8 SECONDS

/datum/armor/armor_hos
	melee = 30
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	fire = 70
	acid = 90
	wound = 10

/obj/item/clothing/suit/armor/hos/trenchcoat
	name = "бронированный тренчкот"
	desc = "Тренчкот, усиленный особым легким кевларом. Воплощение тактической гражданской одежды."
	icon_state = "hostrench"
	inhand_icon_state = "hostrench"
	flags_inv = 0
	strip_delay = 8 SECONDS

/obj/item/clothing/suit/armor/hos/trenchcoat/winter
	name = "зимний тренчкот главы службы безопасности"
	desc = "Тренчкот, усиленный особым легким кевларом, с шерстяной подкладкой на воротнике и внутри. В этом пальто вы чувствуете странное одиночество."
	icon_state = "hoswinter"
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/armor/hos/hos_formal
	name = "\improper парадная куртка главы службы безопасности"
	desc = "На случай, когда бронежилет недостаточно модный."
	icon_state = "hosformal"
	inhand_icon_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/suit/armor/hos/hos_formal/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)

/obj/item/clothing/suit/armor/vest/warden
	name = "куртка смотрителя"
	desc = "Темно-синяя бронированная куртка с синими обозначениями на плечах и вышивкой '/Warden/' на одном из нагрудных карманов."
	icon_state = "warden_alt"
	inhand_icon_state = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	strip_delay = 7 SECONDS
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/warden/alt
	name = "бронированная куртка смотрителя"
	desc = "Красная куртка с серебряными знаками ранга и броней, закрепленной сверху."
	icon_state = "warden_jacket"

/obj/item/clothing/suit/armor/vest/secjacket
	name = "куртка службы безопасности"
	desc = "Красная куртка в цветах службы безопасности. По всей поверхности нанесены светоотражающие полосы."
	icon_state = "secjacket"
	inhand_icon_state = "armor"
	armor_type = /datum/armor/armor_secjacket
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/secjacket/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands)
		. += emissive_appearance(icon_file, "[icon_state]-emissive", src, alpha = src.alpha, effect_type = EMISSIVE_SPECULAR)

/datum/armor/armor_secjacket //Gotta compensate those extra covered limbs
	melee = 25
	bullet = 25
	laser = 25
	energy = 35
	bomb = 20
	fire = 30
	acid = 30
	wound = 5

/obj/item/clothing/suit/armor/vest/leather
	name = "пальто службы безопасности"
	desc = "Слегка бронированное кожаное пальто для повседневной носки высокопоставленными офицерами. Несет герб службы безопасности Nanotrasen."
	icon_state = "leathercoat-sec"
	inhand_icon_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/capcarapace
	name = "капитанский панцирь"
	desc = "Огнестойкая бронированная нагрудная пластина, усиленная керамическими плитами и пласталевыми наплечниками, дающая дополнительную защиту при максимальной подвижности и гибкости. Выдается только лучшим на станции, хотя натирает соски."
	icon_state = "capcarapace"
	inhand_icon_state = "armor"
	body_parts_covered = CHEST|GROIN
	armor_type = /datum/armor/vest_capcarapace
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/datum/armor/vest_capcarapace
	melee = 50
	bullet = 40
	laser = 50
	energy = 50
	bomb = 25
	fire = 100
	acid = 90
	wound = 10

/obj/item/clothing/suit/armor/vest/capcarapace/syndicate
	name = "капитанский жилет Синдиката"
	desc = "Зловещий жилет из продвинутой брони, надетый поверх черно-красной огнестойкой куртки. Золотой воротник и плечи показывают, что он принадлежит высокопоставленному офицеру Синдиката."
	icon_state = "syndievest"

/obj/item/clothing/suit/armor/vest/capcarapace/captains_formal
	name = "капитанское парадное пальто"
	desc = "На случай, когда бронежилет недостаточно модный."
	icon_state = "capformal"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/suit/armor/vest/capcarapace/captains_formal/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)

/obj/item/clothing/suit/armor/riot
	name = "противоударный костюм"
	desc = "Костюм из полугибкой поликарбонатной брони с толстой подкладкой для защиты от атак ближнего боя. Помогает владельцу сопротивляться толчкам в тесных пространствах."
	icon_state = "riot"
	inhand_icon_state = "swat_suit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/armor_riot
	strip_delay = 8 SECONDS
	equip_delay_other = 6 SECONDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)

/obj/item/clothing/suit/armor/riot/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 5)
	init_rustle_component()

/obj/item/clothing/suit/armor/riot/proc/init_rustle_component()
	AddComponent(/datum/component/item_equipped_movement_rustle)

/datum/armor/armor_riot
	melee = 50
	bullet = 10
	laser = 10
	energy = 10
	fire = 80
	acid = 80
	wound = 20

/obj/item/clothing/suit/armor/balloon_vest
	name = "жилет из шариков"
	desc = "Жилет, полностью сделанный из шариков, устойчивый к любым злым силам, которые мим может обрушить на вас, включая электричество и огонь. Но хватит одного удара чем-нибудь острым..."
	icon_state = "balloon-vest"
	inhand_icon_state = "balloon_armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/balloon_vest
	siemens_coefficient = 0
	strip_delay = 7 SECONDS
	equip_delay_other = 5 SECONDS

/datum/armor/balloon_vest
	melee = 10
	laser = 10
	energy = 10
	fire = 60
	acid = 50

/obj/item/clothing/suit/armor/balloon_vest/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(isitem(hitby))
		var/obj/item/item_hit = hitby
		if(item_hit.get_sharpness())
			pop()

	if(istype(hitby, /obj/projectile/bullet))
		pop()

	return ..()

/obj/item/clothing/suit/armor/balloon_vest/proc/pop()
	playsound(src, 'sound/effects/cartoon_sfx/cartoon_pop.ogg', 50, vary = TRUE)
	qdel(src)


/obj/item/clothing/suit/armor/bulletproof
	name = "пуленепробиваемая броня"
	desc = "Тяжелый бронежилет типа III, отлично защищающий владельца от традиционного огнестрельного оружия и в небольшой степени от взрывов."
	icon_state = "bulletproof"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armor_bulletproof
	strip_delay = 7 SECONDS
	equip_delay_other = 5 SECONDS

/datum/armor/armor_bulletproof
	melee = 15
	bullet = 60
	laser = 10
	energy = 10
	bomb = 40
	fire = 50
	acid = 50
	wound = 20

/obj/item/clothing/suit/armor/laserproof
	name = "отражающий жилет"
	desc = "Жилет, отлично защищающий владельца от энергетических снарядов и иногда отражающий их."
	icon_state = "armor_reflec"
	inhand_icon_state = "armor_reflec"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	armor_type = /datum/armor/armor_laserproof
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 50

/datum/armor/armor_laserproof
	melee = 10
	bullet = 10
	laser = 60
	energy = 60
	fire = 100
	acid = 100

/obj/item/clothing/suit/armor/laserproof/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/armor/vest/det_suit
	name = "бронежилет детектива"
	desc = "Бронежилет с детективным значком."
	icon_state = "detective-armor"
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/det_suit/Initialize(mapload)
	. = ..()
	allowed = GLOB.detective_vest_allowed

/obj/item/clothing/suit/armor/swat
	name = "костюм SWAT MK.I"
	desc = "Тактический костюм, впервые разработанный совместными усилиями ныне несуществующей IS-ERI и Nanotrasen в 2321 году для военных операций. \
		Немного замедляет, но дает достойную защиту и помогает владельцу сопротивляться толчкам в тесных пространствах."
	icon_state = "heavy"
	inhand_icon_state = "swat_suit"
	armor_type = /datum/armor/armor_swat
	strip_delay = 12 SECONDS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = THICKMATERIAL
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT_OFF
	heat_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	slowdown = 0.7
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)

/obj/item/clothing/suit/armor/swat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 5)
	init_rustle_component()

/obj/item/clothing/suit/armor/swat/proc/init_rustle_component()
	AddComponent(/datum/component/item_equipped_movement_rustle)


//All of the armor below is mostly unused

/datum/armor/armor_swat
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 50
	bio = 90
	fire = 100
	acid = 100
	wound = 15

/obj/item/clothing/suit/armor/heavy
	name = "тяжелая броня"
	desc = "Тяжело бронированный костюм, защищающий от умеренного урона."
	icon_state = "heavy"
	inhand_icon_state = "swat_suit"
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor_type = /datum/armor/armor_heavy

/datum/armor/armor_heavy
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	fire = 90
	acid = 90

/obj/item/clothing/suit/armor/tdome
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	clothing_flags = THICKMATERIAL
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/armor_tdome

/datum/armor/armor_tdome
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	fire = 90
	acid = 90

/obj/item/clothing/suit/armor/tdome/red
	name = "костюм Громокола"
	desc = "Красноватая броня."
	icon_state = "tdred"
	inhand_icon_state = "tdred"

/obj/item/clothing/suit/armor/tdome/green
	name = "костюм Громокола"
	desc = "Тошнотворная броня." //classy.
	icon_state = "tdgreen"
	inhand_icon_state = "tdgreen"

/obj/item/clothing/suit/armor/tdome/holosuit
	name = "костюм Громокола"
	armor_type = /datum/armor/tdome_holosuit
	cold_protection = null
	heat_protection = null

/datum/armor/tdome_holosuit
	melee = 10
	bullet = 10

/obj/item/clothing/suit/armor/tdome/holosuit/red
	desc = "Красноватая броня."
	icon_state = "tdred"
	inhand_icon_state = "tdred"

/obj/item/clothing/suit/armor/tdome/holosuit/green
	desc = "Тошнотворная броня."
	icon_state = "tdgreen"
	inhand_icon_state = "tdgreen"

/obj/item/clothing/suit/armor/riot/knight
	name = "латная броня"
	desc = "Классический комплект латной брони, крайне эффективный против атак ближнего боя."
	icon_state = "knight_green"
	inhand_icon_state = null
	allowed = list(
		/obj/item/banner,
		/obj/item/claymore,
		/obj/item/nullrod,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
		)
/obj/item/clothing/suit/armor/riot/knight/init_rustle_component()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 8)

/obj/item/clothing/suit/armor/riot/knight/yellow
	icon_state = "knight_yellow"
	inhand_icon_state = null

/obj/item/clothing/suit/armor/riot/knight/blue
	icon_state = "knight_blue"
	inhand_icon_state = null

/obj/item/clothing/suit/armor/riot/knight/red
	icon_state = "knight_red"
	inhand_icon_state = null

/obj/item/clothing/suit/armor/riot/knight/greyscale
	name = "рыцарская броня"
	desc = "Классический комплект брони, который можно сделать из множества разных материалов."
	icon_state = "knight_greyscale"
	inhand_icon_state = null
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS // Can change color and add prefix
	armor_type = /datum/armor/knight_greyscale

/datum/armor/knight_greyscale
	melee = 35
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 10
	fire = 40
	acid = 40

/obj/item/clothing/suit/armor/vest/durathread
	name = "дюратканевый жилет"
	desc = "Жилет из дюраткани с кожаными полосами, выполняющими роль травматических пластин."
	icon_state = "durathread"
	inhand_icon_state = null
	strip_delay = 6 SECONDS
	equip_delay_other = 4 SECONDS
	max_integrity = 200
	resistance_flags = FLAMMABLE
	armor_type = /datum/armor/vest_durathread
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/durathread/Initialize(mapload)
	. = ..()
	allowed |= /obj/item/clothing/suit/apron::allowed

/datum/armor/vest_durathread
	melee = 20
	bullet = 10
	laser = 30
	energy = 40
	bomb = 15
	fire = 40
	acid = 50

/obj/item/clothing/suit/armor/vest/russian
	name = "русский бронежилет"
	desc = "Бронежилет с лесным камуфляжем. Хорошо, что здесь полно лесов, где можно спрятаться, правда?"
	icon_state = "rus_armor"
	inhand_icon_state = null
	armor_type = /datum/armor/vest_russian
	dog_fashion = null

/datum/armor/vest_russian
	melee = 25
	bullet = 30
	energy = 10
	bomb = 10
	fire = 20
	acid = 50
	wound = 10

/obj/item/clothing/suit/armor/vest/russian_coat
	name = "русское боевое пальто"
	desc = "Используется на крайне холодных фронтах, сделано из настоящих медведей."
	icon_state = "rus_coat"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor_type = /datum/armor/vest_russian_coat
	dog_fashion = null

/datum/armor/vest_russian_coat
	melee = 25
	bullet = 20
	laser = 20
	energy = 30
	bomb = 20
	bio = 50
	fire = -10
	acid = 50
	wound = 10

/obj/item/clothing/suit/armor/elder_atmosian
	name = "\improper броня Древнего Атмосианина"
	desc = "Превосходная броня из самых прочных и редких материалов, доступных человеку."
	icon_state = "h2armor"
	inhand_icon_state = null
	material_flags = MATERIAL_EFFECTS
	armor_type = /datum/armor/armor_elder_atmosian
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/armor/elder_atmosian/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/fireaxe/metal_h2_axe,
	)

/datum/armor/armor_elder_atmosian
	melee = 25
	bullet = 20
	laser = 30
	energy = 30
	bomb = 85
	bio = 10
	fire = 65
	acid = 40
	wound = 15

/obj/item/clothing/suit/armor/centcom_formal
	name = "\improper парадное пальто ЦК"
	desc = "Стильное пальто, выдаваемое командирам ЦК. Идеально подходит, чтобы отправлять ОБР на самоубийственные миссии со стилем!"
	icon_state = "centcom_formal"
	inhand_icon_state = "centcom"
	body_parts_covered = CHEST|GROIN|ARMS
	armor_type = /datum/armor/armor_centcom_formal

/datum/armor/armor_centcom_formal
	melee = 35
	bullet = 40
	laser = 40
	energy = 50
	bomb = 35
	bio = 10
	fire = 10
	acid = 60

/obj/item/clothing/suit/armor/centcom_formal/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)

/obj/item/clothing/suit/armor/vest/hop
	name = "пальто главы персонала"
	desc = "Стильное пальто, выдаваемое главе персонала."
	icon_state = "hop_coat"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/militia
	name = "пальто защитника станции"
	desc = "Потрепанная форма, используемая ополчением на фронтире. Толстая подкладка хорошо смягчает удары."
	icon_state = "militia"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor_type = /datum/armor/coat_militia

/datum/armor/coat_militia
	melee = 40
	bullet = 40
	laser = 30
	energy = 25
	bomb = 50
	fire = 40
	acid = 50
	wound = 30

/obj/item/clothing/suit/armor/vest/military
	name = "грубая кираса"
	desc = "Она выглядит грубой, ржавой и побитой, но еще и сделана из хлама, а носить ее неудобно."
	icon_state = "military"
	inhand_icon_state = "armor"
	dog_fashion = null
	armor_type = /datum/armor/military
	allowed = list(
		/obj/item/banner,
		/obj/item/claymore/shortsword,
		/obj/item/nullrod,
		/obj/item/spear,
		/obj/item/gun/ballistic/bow
	)

/obj/item/clothing/suit/armor/vest/military/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 5)

/datum/armor/military
	melee = 45
	bullet = 25
	laser = 25
	energy = 25
	bomb = 25
	fire = 10
	acid = 50
	wound = 20

/obj/item/clothing/suit/armor/riot/knight/warlord
	name = "золотая латная броня"
	desc = "Этот громоздкий комплект брони покрыт блестящим слоем золота. Кажется, он почти отражает все источники света."
	icon_state = "warlord"
	inhand_icon_state = null
	armor_type = /datum/armor/armor_warlord
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = THICKMATERIAL
	slowdown = 0.8

/datum/armor/armor_warlord
	melee = 70
	bullet = 60
	laser = 70
	energy = 70
	bomb = 40
	fire = 50
	acid = 50
	wound = 30

/obj/item/clothing/suit/armor/durability
	abstract_type = /obj/item/clothing/suit/armor/durability

/obj/item/clothing/suit/armor/durability/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	take_damage(1, BRUTE, 0, 0)

/obj/item/clothing/suit/armor/durability/watermelon
	name = "арбузная броня"
	desc = "Броня, сделанная из арбузов. Вряд ли выдержит много ударов, но хотя бы выглядит серьезно... насколько серьезно может выглядеть ношеный арбуз."
	icon_state = "watermelon"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/watermelon
	strip_delay = 6 SECONDS
	equip_delay_other = 4 SECONDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	max_integrity = 15

/obj/item/clothing/suit/armor/durability/watermelon/fire_resist
	resistance_flags = FIRE_PROOF
	armor_type = /datum/armor/watermelon_fr

/datum/armor/watermelon
	melee = 15
	bullet = 10
	energy = 10
	bomb = 10
	fire = 0
	acid = 25
	wound = 5

/datum/armor/watermelon_fr
	melee = 15
	bullet = 10
	energy = 10
	bomb = 10
	fire = 15
	acid = 30
	wound = 5

/obj/item/clothing/suit/armor/durability/holymelon
	name = "броня из святодынь"
	desc = "Броня, сделанная из святодынь. Вдохновляет на какой-нибудь крестовый поход... Может, распространять шпинат среди детей?"
	icon_state = "holymelon"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/watermelon
	strip_delay = 6 SECONDS
	equip_delay_other = 4 SECONDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	max_integrity = 15

/obj/item/clothing/suit/armor/durability/holymelon/fire_resist
	resistance_flags = FIRE_PROOF
	armor_type = /datum/armor/watermelon_fr

/obj/item/clothing/suit/armor/durability/holymelon/Initialize(mapload)
	. = ..()

	AddComponent(
		/datum/component/anti_magic, \
		antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, \
		inventory_flags = ITEM_SLOT_OCLOTHING, \
		charges = 1, \
		block_magic = CALLBACK(src, PROC_REF(drain_antimagic)), \
		expiration = CALLBACK(src, PROC_REF(decay)) \
	)

/obj/item/clothing/suit/armor/durability/holymelon/proc/drain_antimagic(mob/user)
	to_chat(user, span_warning("[src] теряет немного своего сияния и блеска..."))

/obj/item/clothing/suit/armor/durability/holymelon/proc/decay()
	take_damage(8, BRUTE, 0, 0)


/obj/item/clothing/suit/armor/durability/barrelmelon
	name = "броня из бочкодынь"
	desc = "Броня, сделанная из бочкодынь. Разит элем и вдохновляет на подвиги. Или, возможно, на барную драку."
	icon_state = "barrelmelon"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor_type = /datum/armor/barrelmelon
	strip_delay = 6 SECONDS
	equip_delay_other = 4 SECONDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	max_integrity = 10

/obj/item/clothing/suit/armor/durability/barrelmelon/fire_resist
	resistance_flags = FIRE_PROOF
	armor_type = /datum/armor/barrelmelon_fr

/datum/armor/barrelmelon
	melee = 25
	bullet = 20
	energy = 15
	bomb = 10
	fire = 0
	acid = 35
	wound = 10

/datum/armor/barrelmelon_fr
	melee = 25
	bullet = 20
	energy = 15
	bomb = 10
	fire = 20
	acid = 40
	wound = 10

/obj/item/clothing/suit/armor/dragoon
	name = "костюм драхена"
	desc = "Кольчужный костюм с драконьей чешуей, прикрепленной к каркасу, и покрытым пеплом мифриловым пластинчатым усилением."
	icon_state = "dragoon"
	inhand_icon_state = "dragoon"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	allowed = list(/obj/item/spear/skybulge)
