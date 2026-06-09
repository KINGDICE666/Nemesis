//Glasses
/obj/item/clothing/glasses
	name = "очки"
	icon = 'icons/obj/clothing/glasses.dmi'
	lefthand_file = 'icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/glasses_righthand.dmi'
	abstract_type = /obj/item/clothing/glasses
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_EYES
	strip_delay = 2 SECONDS
	equip_delay_other = 2.5 SECONDS
	resistance_flags = NONE
	custom_materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT*2.5)
	gender = PLURAL
	sound_vary = TRUE
	pickup_sound = SFX_GLASSES_PICKUP
	drop_sound = SFX_GLASSES_DROP
	equip_sound = SFX_GLASSES_EQUIP
	var/vision_flags = 0
	var/invis_view = SEE_INVISIBLE_LIVING // Admin only for now
	/// Override to allow glasses to set higher than normal see_invis
	var/invis_override = 0
	/// A percentage of how much rgb to "max" on the lighting plane
	/// This lets us brighten darkness without washing out bright color
	var/lighting_cutoff = null
	/// Similar to lighting_cutoff, except it has individual r g and b components in the same 0-100 scale
	var/list/color_cutoffs = null
	/// The current hud icons
	var/list/icon/current = list()
	/// Colors your vision when worn
	var/glass_colour_type
	/// Whether or not vision coloring is forcing
	var/forced_glass_color = FALSE

/obj/item/clothing/glasses/Initialize(mapload)
	. = ..()
	if(glass_colour_type)
		AddElement(/datum/element/wearable_client_colour, glass_colour_type, ITEM_SLOT_EYES, GLASSES_TRAIT, forced = forced_glass_color, comsig_toggle = COMSIG_CLICK_ALT_SECONDARY)

/obj/item/clothing/glasses/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] вонзает \the [src] в [user.p_their()] глаза! Похоже, [user.p_theyre()] пытается покончить с собой!"))
	return BRUTELOSS

/obj/item/clothing/glasses/visor_toggling()
	. = ..()
	alternate_worn_layer = up ? ABOVE_BODY_FRONT_HEAD_LAYER : null
	if(visor_vars_to_toggle & VISOR_VISIONFLAGS)
		vision_flags ^= initial(vision_flags)
	if(visor_vars_to_toggle & VISOR_INVISVIEW)
		invis_view ^= initial(invis_view)

/obj/item/clothing/glasses/adjust_visor(mob/living/user)
	. = ..()
	if(. && !user.is_holding(src) && (visor_vars_to_toggle & (VISOR_VISIONFLAGS|VISOR_INVISVIEW)))
		user.update_sight()

//called when thermal glasses are emped.
/obj/item/clothing/glasses/proc/thermal_overload()
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		var/obj/item/organ/eyes/eyes = H.get_organ_slot(ORGAN_SLOT_EYES)
		if(!H.is_blind())
			if(H.glasses == src)
				to_chat(H, span_danger("[src] перегружается и ослепляет вас!"))
				H.flash_act(visual = 1)
				H.adjust_temp_blindness(6 SECONDS)
				H.set_eye_blur_if_lower(10 SECONDS)
				eyes.apply_organ_damage(5)

/obj/item/clothing/glasses/proc/change_glass_color(new_color_type)
	if(glass_colour_type)
		RemoveElement(/datum/element/wearable_client_colour, glass_colour_type, ITEM_SLOT_EYES, GLASSES_TRAIT, forced = forced_glass_color)
	glass_colour_type = new_color_type
	if(glass_colour_type)
		AddElement(/datum/element/wearable_client_colour, glass_colour_type, ITEM_SLOT_EYES, GLASSES_TRAIT, forced = forced_glass_color)

/obj/item/clothing/glasses/meson
	name = "оптический мезонный сканер"
	desc = "Используется инженерами и шахтерами, чтобы видеть базовую структуру и рельеф сквозь стены независимо от освещения."
	icon_state = "meson"
	inhand_icon_state = "meson"
	clothing_traits = list(TRAIT_MADNESS_IMMUNE)
	flags_cover = GLASSESCOVERSEYES
	vision_flags = SEE_TURFS
	// Mesons get to be lightly green
	color_cutoffs = list(5, 15, 5)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/meson/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] подносит \the [src] к [user.p_their()] глазам и перегружает яркость! Похоже, [user.p_theyre()] пытается покончить с собой!"))
	return BRUTELOSS

/obj/item/clothing/glasses/meson/night
	name = "мезонный сканер ночного видения"
	desc = "Оптический мезонный сканер с усиленным наложением видимого спектра, дающий лучшую видимость в темноте."
	icon_state = "nvgmeson"
	inhand_icon_state = "nvgmeson"
	flash_protect = FLASH_PROTECTION_SENSITIVE
	// Night vision mesons get the same but more intense
	color_cutoffs = list(10, 35, 10)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle_nv)

/obj/item/clothing/glasses/meson/night/update_icon_state()
	. = ..()
	icon_state = length(color_cutoffs) ? initial(icon_state) : "nvgmeson_off"

/obj/item/clothing/glasses/meson/gar
	name = "гар-мезоны"
	desc = "Сделай невозможное, узри невидимое!"
	icon_state = "gar_meson"
	inhand_icon_state = "gar_meson"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/science
	name = "научные очки"
	desc = "Пара стильных очков для защиты от химических брызг. Оснащены анализатором для сканирования предметов и реагентов."
	icon_state = "purple"
	inhand_icon_state = "glasses"
	glass_colour_type = /datum/client_colour/glass_colour/purple
	flags_cover = GLASSESCOVERSEYES
	resistance_flags = ACID_PROOF
	armor_type = /datum/armor/glasses_science
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_RESEARCH_SCANNER)
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/datum/armor/glasses_science
	fire = 80
	acid = 100

/obj/item/clothing/glasses/science/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] затягивает ремешки \the [src] вокруг [user.p_their()] шеи! Похоже, [user.p_theyre()] пытается покончить с собой!"))
	return OXYLOSS

/obj/item/clothing/glasses/science/night
	name = "научные очки ночного видения"
	desc = "Позволяют видеть в темноте и с первого взгляда распознавать химические соединения."
	icon_state = "scihudnight"
	flash_protect = FLASH_PROTECTION_SENSITIVE
	// Real vivid purple
	color_cutoffs = list(30, 5, 15)
	glass_colour_type = /datum/client_colour/glass_colour/lightpurple
	actions_types = list(/datum/action/item_action/toggle_nv)

/obj/item/clothing/glasses/science/night/update_icon_state()
	. = ..()
	icon_state = length(color_cutoffs) ? initial(icon_state) : "night_off"

/obj/item/clothing/glasses/night
	name = "очки ночного видения"
	desc = "Теперь вы точно можете видеть в темноте!"
	icon_state = "night"
	inhand_icon_state = "glasses"
	flags_cover = GLASSESCOVERSEYES
	flash_protect = FLASH_PROTECTION_SENSITIVE
	// Dark green
	color_cutoffs = list(10, 25, 10)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	actions_types = list(/datum/action/item_action/toggle_nv)
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/night/update_icon_state()
	. = ..()
	icon_state = length(color_cutoffs) ? initial(icon_state) : "night_off"

/obj/item/clothing/glasses/eyepatch
	name = "повязка на глаз"
	desc = "Йарр."
	icon_state = "eyepatch"
	base_icon_state = "eyepatch"
	inhand_icon_state = null
	actions_types = list(/datum/action/item_action/flip)
	dog_fashion = /datum/dog_fashion/head/eyepatch
	var/flipped = FALSE
	pickup_sound = null
	drop_sound = null
	equip_sound = null
	custom_materials = null

/obj/item/clothing/glasses/eyepatch/click_alt(mob/user)
	. = ..()
	flip_eyepatch()

/obj/item/clothing/glasses/eyepatch/attack_self(mob/user)
	. = ..()
	flip_eyepatch()

/obj/item/clothing/glasses/eyepatch/proc/flip_eyepatch()
	flipped = !flipped
	icon_state = flipped ? "[base_icon_state]_flipped" : base_icon_state
	if (!ismob(loc))
		return
	var/mob/user = loc
	user.update_worn_glasses()
	if (!ishuman(user))
		return
	var/mob/living/carbon/human/human_user = user
	if (human_user.get_eye_scars() & (flipped ? RIGHT_EYE_SCAR : LEFT_EYE_SCAR))
		tint = INFINITY
	else
		tint = initial(tint)
	human_user.update_tint()

/obj/item/clothing/glasses/eyepatch/equipped(mob/living/user, slot)
	if (!ishuman(user))
		return ..()
	var/mob/living/carbon/human/human_user = user
	// lol lmao
	if (human_user.get_eye_scars() & (flipped ? RIGHT_EYE_SCAR : LEFT_EYE_SCAR))
		tint = INFINITY
	else
		tint = initial(tint)
	return ..()

/obj/item/clothing/glasses/eyepatch/dropped(mob/living/user)
	. = ..()
	tint = initial(tint)

/obj/item/clothing/glasses/eyepatch/medical
	name = "медицинская повязка на глаз"
	desc = "Используется космическими виабу, чтобы притворяться, будто глаза нет, и членами экипажа, реально потерявшими глаз, чтобы притворяться, будто он есть."
	icon_state = "eyepatch_medical"
	base_icon_state = "eyepatch_medical"
	inhand_icon_state = null

/// wizard version
/obj/item/clothing/glasses/eyepatch/medical/chuuni
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = CASTING_CLOTHES

/obj/item/clothing/glasses/eyepatch/medical/chuuni/equipped(mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_EYES)
		ADD_TRAIT(src, TRAIT_NODROP, type)

/obj/item/clothing/glasses/eyepatch/medical/chuuni/Initialize(mapload)
	. = ..()
	var/static/list/chuuni_backstories
	if(!chuuni_backstories)
		chuuni_backstories = list(
			"Эта повязка - печать, содержащая силу короля демонов. Если я сниму ее, на мир обрушится катастрофическое разрушение.",
			"Эта повязка - дар ангела света. Она позволяет мне видеть истинную природу вещей и защищать невинных от вреда.",
			"Эта повязка - знак моего контракта с драконьим богом. Она дает мне доступ к его древней мудрости и огненному дыханию.",
			"Эта повязка - символ моей жертвы во имя любви. Она скрывает шрам, который я получил, спасая любимого человека от смертельной атаки.",
		)
	desc = pick(chuuni_backstories)

/obj/item/clothing/glasses/monocle
	name = "монокль"
	desc = "Какой элегантный окуляр!"
	icon_state = "monocle"
	inhand_icon_state = "headset" // lol
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/material
	name = "оптический сканер материалов"
	desc = "Очень запутанные очки."
	icon_state = "material"
	inhand_icon_state = "glasses"
	flags_cover = GLASSESCOVERSEYES
	vision_flags = SEE_OBJS
	glass_colour_type = /datum/client_colour/glass_colour/lightblue
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/material/mining
	name = "оптический сканер материалов"
	desc = "Используется шахтерами для обнаружения руды глубоко в породе."
	icon_state = "material"
	inhand_icon_state = "glasses"

/obj/item/clothing/glasses/material/mining/gar
	name = "гар-сканер материалов"
	desc = "Сделай невозможное, узри невидимое!"
	icon_state = "gar_meson"
	inhand_icon_state = "gar_meson"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 20
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/glasses/regular
	name = "очки с диоптриями"
	desc = "Сделано Nerd. Co."
	icon_state = "glasses_regular"
	inhand_icon_state = "glasses"
	flags_cover = GLASSESCOVERSEYES
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/regular/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/knockoff, 25, list(BODY_ZONE_PRECISE_EYES), slot_flags)
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/obj/item/clothing/glasses/regular/proc/on_entered(datum/source, atom/movable/movable)
	SIGNAL_HANDLER
	if(damaged_clothes == CLOTHING_SHREDDED)
		return
	if(item_flags & IN_INVENTORY)
		return
	if(isliving(movable))
		var/mob/living/crusher = movable
		if(crusher.move_intent != MOVE_INTENT_WALK && (!(crusher.movement_type & MOVETYPES_NOT_TOUCHING_GROUND) || crusher.buckled))
			playsound(src, 'sound/effects/footstep/glass_step.ogg', 30, TRUE)
			visible_message(span_warning("[crusher] наступает на [src], повреждая их!"))
			take_damage(100, sound_effect = FALSE)

/obj/item/clothing/glasses/regular/atom_destruction(damage_flag)
	. = ..()
	detach_clothing_traits(TRAIT_NEARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/regular/welder_act(mob/living/user, obj/item/I)
	. = ..()
	if(damaged_clothes == CLOTHING_PRISTINE)
		return
	if(!I.tool_start_check(user, amount=1))
		return
	if(I.use_tool(src, user, 10, volume=30))
		user.visible_message(span_notice("[user] welds [src] back together."),\
					span_notice("Вы свариваете [src] обратно."))
		repair()
		return TRUE

/obj/item/clothing/glasses/regular/repair()
	. = ..()
	attach_clothing_traits(TRAIT_NEARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/regular/thin
	name = "тонкие очки с диоптриями"
	desc = "Дороже, хрупче и куда менее практичны, зато такие модные."
	icon_state = "glasses_thin"

/obj/item/clothing/glasses/regular/jamjar
	name = "очки-банки"
	desc = "Также известны как защитники девственности."
	icon_state = "glasses_jamjar"
	inhand_icon_state = "glasses_jamjar"

/obj/item/clothing/glasses/regular/hipster
	name = "очки с диоптриями"
	desc = "Сделано Uncool. Co."
	icon_state = "glasses_hipster"
	inhand_icon_state = null

/obj/item/clothing/glasses/regular/circle
	name = "круглые очки"
	desc = "Зачем носить что-то настолько спорное, но такое смелое?"
	icon_state = "glasses_circle"
	inhand_icon_state = null

//Here lies green glasses, so ugly they died. RIP

/obj/item/clothing/glasses/sunglasses
	name = "солнцезащитные очки"
	desc = "Странно древняя технология, дающая базовую защиту глаз. Улучшенное затемнение блокирует вспышки."
	icon_state = "sun"
	inhand_icon_state = "sunglasses"
	flags_cover = GLASSESCOVERSEYES
	flash_protect = FLASH_PROTECTION_FLASH
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/gray
	dog_fashion = /datum/dog_fashion/head

/obj/item/clothing/glasses/sunglasses/Initialize(mapload)
	. = ..()
	add_glasses_slapcraft_component()

/obj/item/clothing/glasses/sunglasses/proc/add_glasses_slapcraft_component()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/hudsunsec, /datum/crafting_recipe/hudsunmed, /datum/crafting_recipe/hudsundiag, /datum/crafting_recipe/scienceglasses)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/obj/item/clothing/glasses/sunglasses/reagent
	name = "пивные очки"
	icon_state = "sunhudbeer"
	desc = "Пара солнцезащитных очков с устройством для сканирования реагентов, а также врожденным пониманием вязкости жидкостей в движении."
	clothing_traits = list(TRAIT_BOOZE_SLIDER, TRAIT_REAGENT_SCANNER)

/obj/item/clothing/glasses/sunglasses/chemical
	name = "научные очки"
	icon_state = "sunhudsci"
	desc = "Пара безвкусных фиолетовых солнцезащитных очков, позволяющих владельцу распознавать разные химические соединения с одного взгляда."
	clothing_traits = list(TRAIT_REAGENT_SCANNER, TRAIT_RESEARCH_SCANNER)
	custom_materials = list(/datum/material/glass = SHEET_MATERIAL_AMOUNT * 0.55, /datum/material/iron = SMALL_MATERIAL_AMOUNT / 2)

/obj/item/clothing/glasses/sunglasses/chemical/add_glasses_slapcraft_component()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/scienceglassesremoval)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/obj/item/clothing/glasses/sunglasses/gar
	name = "черные гар-очки"
	desc = "Превзойди невозможное и вышвырни рассудок на обочину!"
	icon_state = "gar_black"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/sunglasses/gar/orange
	name = "гар-очки"
	desc = "Да за кого ты меня принимаешь?!"
	icon_state = "gar"
	inhand_icon_state = "gar"
	glass_colour_type = /datum/client_colour/glass_colour/orange

/obj/item/clothing/glasses/sunglasses/gar/giga
	name = "черные гига-гар-очки"
	desc = "Верь в нас, людей."
	icon_state = "gigagar_black"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/sunglasses/gar/giga/red
	name = "гига-гар-очки"
	desc = "Мы перерастаем себя прежних каждую минуту. Мало-помалу продвигаемся с каждым витком. Так работает бур!"
	icon_state = "gigagar_red"
	inhand_icon_state = "gar"
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/sunglasses/noir
	name = "нуарные очки"
	desc = "Пара гладких футуристичных очков, позволяющих владельцу увидеть мир в ином свете."
	glass_colour_type = /datum/client_colour/monochrome/glasses
	forced_glass_color =  TRUE

///Syndicate item that upgrades the flash protection of your eyes.
/obj/item/syndicate_contacts
	name = "подозрительный футляр для контактных линз"
	desc = "Зловещий красный футляр с двумя блестящими черными контактными линзами."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/obj/devices/syndie_gadget.dmi'
	icon_state = "contacts"

/obj/item/syndicate_contacts/attack_self(mob/user, modifiers)
	. = ..()
	if(!user.get_organ_slot(ORGAN_SLOT_EYES))
		to_chat(user, span_warning("У вас нет глаз, на которые можно надеть линзы!"))
		return
	var/obj/item/organ/eyes/eyes = user.get_organ_slot(ORGAN_SLOT_EYES)

	to_chat(user, span_notice("Вы начинаете надевать контактные линзы на глаза..."))
	if(!do_after(user, 3 SECONDS, src))
		return
	to_chat(user, span_notice("Линзы бесшовно сливаются с вашей радужкой."))
	eyes.flash_protect += FLASH_PROTECTION_WELDER
	to_chat(user, span_warning("\The [src] распадается в ничто."))
	qdel(src)

/obj/item/clothing/glasses/welding
	name = "сварочные очки"
	desc = "Защищают глаза от ярких вспышек; одобрены ассоциацией безумных ученых."
	icon_state = "welding-g"
	inhand_icon_state = "welding-g"
	actions_types = list(/datum/action/item_action/toggle)
	flash_protect = FLASH_PROTECTION_WELDER
	visor_flags_cover = GLASSESCOVERSEYES
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*2.5)
	tint = 2
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT
	glass_colour_type = /datum/client_colour/glass_colour/gray
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/welding/Initialize(mapload)
	. = ..()
	if(!up)
		AddElement(/datum/element/adjust_fishing_difficulty, 8)

/obj/item/clothing/glasses/welding/attack_self(mob/living/user)
	adjust_visor(user)

/obj/item/clothing/glasses/welding/adjust_visor(mob/user)
	. = ..()
	if(up)
		RemoveElement(/datum/element/adjust_fishing_difficulty)
	else
		AddElement(/datum/element/adjust_fishing_difficulty, 8)

/obj/item/clothing/glasses/welding/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][up ? "up" : ""]"

/obj/item/clothing/glasses/welding/up/Initialize(mapload)
	. = ..()
	visor_toggling()

/obj/item/clothing/glasses/blindfold
	name = "повязка на глаза"
	desc = "Закрывает глаза, лишая зрения."
	icon_state = "blindfold"
	inhand_icon_state = "blindfold"
	flash_protect = FLASH_PROTECTION_WELDER
	flags_cover = GLASSESCOVERSEYES
	tint = INFINITY // You WILL Be blind, no matter what
	dog_fashion = /datum/dog_fashion/head
	custom_materials = null

/obj/item/clothing/glasses/blindfold/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 8)

/obj/item/clothing/glasses/trickblindfold
	name = "повязка на глаза"
	desc = "Прозрачная повязка, идеально подходящая для жульничества в играх вроде 'приколи дубинку к клоуну'."
	icon_state = "trickblindfold"
	inhand_icon_state = "blindfold"
	flags_cover = GLASSESCOVERSEYES
	custom_materials = null

/obj/item/clothing/glasses/blindfold/white
	name = "повязка незрячего сотрудника"
	desc = "Показывает, что владелец страдает слепотой."
	icon_state = "blindfoldwhite"
	inhand_icon_state = null
	var/colored_before = FALSE

/obj/item/clothing/glasses/blindfold/white/visual_equipped(mob/living/carbon/human/user, slot)
	if(ishuman(user) && (slot & ITEM_SLOT_EYES) && !colored_before)
		add_atom_colour(BlendRGB(user.eye_color_left, user.eye_color_right, 0.5), FIXED_COLOUR_PRIORITY)
		colored_before = TRUE
	return ..()

/obj/item/clothing/glasses/sunglasses/big
	desc = "Странно древняя технология, дающая базовую защиту глаз. Увеличенная улучшенная защита блокирует вспышки."
	icon_state = "bigsunglasses"
	inhand_icon_state = null

/obj/item/clothing/glasses/thermal
	name = "оптический термальный сканер"
	desc = "Термалы в форме очков."
	icon_state = "thermal"
	inhand_icon_state = "glasses"
	vision_flags = SEE_MOBS
	// Going for an orange color here
	color_cutoffs = list(25, 8, 5)
	flash_protect = FLASH_PROTECTION_SENSITIVE
	flags_cover = GLASSESCOVERSEYES
	glass_colour_type = /datum/client_colour/glass_colour/red
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/thermal/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	thermal_overload()

/obj/item/clothing/glasses/thermal/xray
	name = "рентген-очки Синдиката"
	desc = "Пара рентген-очков производства Синдиката."
	icon_state = "material"
	color_cutoffs = null
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/thermal/xray/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!(slot & ITEM_SLOT_EYES) || !istype(user))
		return
	ADD_TRAIT(user, TRAIT_XRAY_VISION, GLASSES_TRAIT)

/obj/item/clothing/glasses/thermal/xray/dropped(mob/living/carbon/human/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_XRAY_VISION, GLASSES_TRAIT)

/obj/item/clothing/glasses/thermal/syndi
	name = "термалы-хамелеоны"
	desc = "Пара термооптических очков со встроенным генератором-хамелеоном."
	actions_types = list(/datum/action/item_action/chameleon/change/glasses/no_preset)

/obj/item/clothing/glasses/thermal/monocle
	name = "термонокль"
	desc = "Еще никогда видение сквозь стены не ощущалось таким джентльменским."
	icon_state = "thermoncle"
	flags_1 = null //doesn't protect eyes because it's a monocle, duh

/obj/item/clothing/glasses/thermal/monocle/examine(mob/user) //Different examiners see a different description!
	if(user.gender == MALE)
		desc = replacetext(desc, "person", "man")
	else if(user.gender == FEMALE)
		desc = replacetext(desc, "person", "woman")
	. = ..()
	desc = initial(desc)

/obj/item/clothing/glasses/thermal/eyepatch
	name = "оптическая термальная повязка"
	desc = "Повязка на глаз со встроенной термальной оптикой."
	icon_state = "eyepatch"
	base_icon_state = "eyepatch"
	inhand_icon_state = null
	actions_types = list(/datum/action/item_action/flip)

/obj/item/clothing/glasses/thermal/eyepatch/attack_self(mob/user, modifiers)
	. = ..()
	icon_state = (icon_state == base_icon_state) ? "[base_icon_state]_flipped" : base_icon_state
	user.update_worn_glasses()

/obj/item/clothing/glasses/cold
	name = "холодозащитные очки"
	desc = "Пара очков для низких температур."
	icon_state = "cold"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/heat
	name = "жарозащитные очки"
	desc = "Пара очков для высоких температур."
	icon_state = "heat"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/orange
	name = "оранжевые очки"
	desc = "Милая пара оранжевых очков."
	icon_state = "orangeglasses"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES
	glass_colour_type = /datum/client_colour/glass_colour/lightorange

/obj/item/clothing/glasses/red
	name = "красные очки"
	desc = "Эй, ты отлично выглядишь, семпай!"
	icon_state = "redglasses"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/geist_gazers
	name = "призрачные гляделки"
	icon_state = "geist_gazers"
	worn_icon_state = "geist_gazers"
	glass_colour_type = /datum/client_colour/glass_colour/green
	flags_cover = GLASSESCOVERSEYES
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/psych
	name = "психо-очки"
	icon_state = "psych_glasses"
	worn_icon_state = "psych_glasses"
	glass_colour_type = /datum/client_colour/glass_colour/red
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/debug
	name = "отладочные очки"
	desc = "Медицинский, охранный и диагностический HUD."
	desc_controls = "Alt-клик переключает рентген."
	icon_state = "nvgmeson"
	inhand_icon_state = "nvgmeson"
	flags_cover = GLASSESCOVERSEYES
	flash_protect = FLASH_PROTECTION_WELDER
	lighting_cutoff = LIGHTING_CUTOFF_HIGH
	glass_colour_type = FALSE
	vision_flags = SEE_TURFS
	clothing_traits = list(
		TRAIT_REAGENT_SCANNER,
		TRAIT_MADNESS_IMMUNE,
		TRAIT_MEDICAL_HUD,
		TRAIT_SECURITY_HUD,
		TRAIT_DIAGNOSTIC_HUD,
		TRAIT_BOT_PATH_HUD,
	)
	var/xray = FALSE
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/debug/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, -15)

/obj/item/clothing/glasses/debug/click_alt(mob/user)
	if(!ishuman(user))
		return CLICK_ACTION_BLOCKING
	if(xray)
		vision_flags &= ~SEE_MOBS|SEE_OBJS
		detach_clothing_traits(TRAIT_XRAY_VISION)
	else
		vision_flags |= SEE_MOBS|SEE_OBJS
		attach_clothing_traits(TRAIT_XRAY_VISION)
	xray = !xray
	var/mob/living/carbon/human/human_user = user
	human_user.update_sight()
	return CLICK_ACTION_SUCCESS

/obj/item/clothing/glasses/regular/kim
	name = "линзы binoclard"
	desc = "Показывают, что вы умеете пришивать лацкан и центрировать заднюю шлицу."
	icon_state = "glasses_binoclard"
	inhand_icon_state = null

/obj/item/clothing/glasses/salesman
	name = "цветные очки"
	desc = "Пара очков с уникально окрашенными линзами. На оправе выгравировано 'Лучший продавец 1997'."
	icon_state = "salesman"
	inhand_icon_state = "salesman"
	flags_cover = GLASSESCOVERSEYES
	///Tells us who the current wearer([BIGSHOT]) is.
	var/mob/living/carbon/human/bigshot

/obj/item/clothing/glasses/salesman/equipped(mob/living/carbon/human/user, slot)
	..()
	if(!(slot & ITEM_SLOT_EYES))
		return
	bigshot = user
	RegisterSignal(bigshot, COMSIG_CARBON_SANITY_UPDATE, PROC_REF(moodshift))

/obj/item/clothing/glasses/salesman/dropped(mob/living/carbon/human/user)
	..()
	UnregisterSignal(bigshot, COMSIG_CARBON_SANITY_UPDATE)
	bigshot = initial(bigshot)
	icon_state = initial(icon_state)
	desc = initial(desc)

/obj/item/clothing/glasses/salesman/proc/moodshift(atom/movable/source, amount)
	SIGNAL_HANDLER
	if(amount < SANITY_UNSTABLE)
		icon_state = "salesman_fzz"
		desc = "Пара очков, линзы которых заполнены телевизионным шумом. Они явно видали лучшие дни..."
		bigshot.update_worn_glasses()
	else
		icon_state = initial(icon_state)
		desc = initial(desc)
		bigshot.update_worn_glasses()

/obj/item/clothing/glasses/nightmare_vision
	name = "очки кошмарного зрения"
	desc = "От них исходит гнилостная вонь. Кажется, ни на что не влияют."
	icon_state = "nightmare"
	inhand_icon_state = "glasses"
	glass_colour_type = /datum/client_colour/glass_colour/nightmare
	forced_glass_color = TRUE
	lighting_cutoff = LIGHTING_CUTOFF_FULLBRIGHT
	flags_cover = GLASSESCOVERSEYES
	/// Hallucination datum currently being used for seeing mares
	var/datum/hallucination/stored_hallucination
	pickup_sound = SFX_GOGGLES_PICKUP
	drop_sound = SFX_GOGGLES_DROP
	equip_sound = SFX_GOGGLES_EQUIP

/obj/item/clothing/glasses/nightmare_vision/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 13)

/obj/item/clothing/glasses/nightmare_vision/Destroy()
	QDEL_NULL(stored_hallucination)
	return ..()

/obj/item/clothing/glasses/nightmare_vision/equipped(mob/living/user, slot)
	. = ..()
	if(!(slot & ITEM_SLOT_EYES))
		return
	//5% chance to get mare vision
	if(prob(5))
		stored_hallucination = 	user.cause_hallucination( \
			/datum/hallucination/delusion/preset/mare, \
			src.name, \
			duration = 0, \
			affects_us = TRUE, \
			affects_others = TRUE, \
			skip_nearby = FALSE, \
			play_wabbajack = FALSE, \
		)

/obj/item/clothing/glasses/nightmare_vision/dropped(mob/living/user)
	. = ..()
	QDEL_NULL(stored_hallucination)

/obj/item/clothing/glasses/osi
	name = "солнцезащитные очки O.S.I."
	desc = "Хороших новостей не бывает! Только плохие и... странные новости..."
	icon_state = "osi_glasses"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES

/obj/item/clothing/glasses/phantom
	name = "маска Призрачного Вора"
	desc = "Выглядит круто."
	icon_state = "phantom_glasses"
	inhand_icon_state = null
	flags_cover = GLASSESCOVERSEYES
	custom_materials = null
