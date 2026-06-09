/obj/item/clothing/gloves/color
	abstract_type = /obj/item/clothing/gloves/color
	dying_key = DYE_REGISTRY_GLOVES
	greyscale_colors = null

/obj/item/clothing/gloves/color/yellow
	desc = "Эти перчатки защищают от удара током."
	name = "изолирующие перчатки"
	icon_state = "yellow"
	inhand_icon_state = "ygloves"
	siemens_coefficient = 0
	armor_type = /datum/armor/color_yellow
	resistance_flags = NONE
	custom_price = PAYCHECK_CREW * 10
	custom_premium_price = PAYCHECK_COMMAND * 6
	cut_type = /obj/item/clothing/gloves/cut
	equip_sound = 'sound/items/equip/glove_equip.ogg'

/obj/item/clothing/gloves/color/yellow/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 10)

/obj/item/clothing/gloves/color/yellow/apply_fantasy_bonuses(bonus)
	. = ..()
	if(bonus >= 10)
		RemoveElement(/datum/element/adjust_fishing_difficulty)

/obj/item/clothing/gloves/color/yellow/remove_fantasy_bonuses(bonus)
	if(bonus >= 10)
		RemoveElement(/datum/element/adjust_fishing_difficulty)
		AddElement(/datum/element/adjust_fishing_difficulty, 10)
	return ..()

/datum/armor/color_yellow
	bio = 50

/obj/item/clothing/gloves/color/yellow/heavy
	name = "изолирующие перчатки с керамической подкладкой"
	desc = "Более дешевая версия стандартных изолирующих перчаток, где внутренняя керамическая подкладка компенсирует посредственную резину. Из-за лишнего веса ими неудобнее пользоваться."
	slowdown = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/toy/sprayoncan
	name = "аэрозольный изолирующий аппликатор"
	desc = "Какая проблема номер один стоит перед нашей станцией сегодня?"
	icon = 'icons/obj/clothing/gloves.dmi'
	icon_state = "sprayoncan"

/obj/item/toy/sprayoncan/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!iscarbon(interacting_with))
		return NONE
	var/mob/living/carbon/C = interacting_with
	var/mob/living/carbon/U = user
	var/success = C.equip_to_slot_if_possible(new /obj/item/clothing/gloves/color/yellow/sprayon, ITEM_SLOT_GLOVES, qdel_on_fail = TRUE, disable_warning = TRUE)
	if(success)
		if(C == user)
			C.visible_message(span_notice("[U] покрывает свои руки блестящей резиной!"))
		else
			C.visible_message(span_warning("[U] покрывает руки [C] блестящей резиной!"))
	else
		C.visible_message(span_warning("Резина не прилипает к рукам [C]!"))
	return ITEM_INTERACT_SUCCESS

/obj/item/clothing/gloves/color/yellow/sprayon
	desc = "И как ты теперь их снимешь, умник?"
	name = "напыляемые изолирующие перчатки"
	icon_state = "sprayon"
	inhand_icon_state = null
	item_flags = DROPDEL
	clothing_traits = list(TRAIT_CHUNKYFINGERS)
	armor_type = /datum/armor/none
	resistance_flags = ACID_PROOF
	var/charges_remaining = 10

/obj/item/clothing/gloves/color/yellow/sprayon/Initialize(mapload)
	.=..()
	ADD_TRAIT(src, TRAIT_NODROP, INNATE_TRAIT)

/obj/item/clothing/gloves/color/yellow/sprayon/equipped(mob/user, slot)
	. = ..()
	RegisterSignal(user, COMSIG_LIVING_SHOCK_PREVENTED, PROC_REF(use_charge))
	RegisterSignal(src, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(use_charge))

/obj/item/clothing/gloves/color/yellow/sprayon/proc/use_charge()
	SIGNAL_HANDLER

	. = NONE

	charges_remaining--
	if(charges_remaining <= 0)
		var/turf/location = get_turf(src)
		location.visible_message(span_warning("[src] рассыпаются в ничто.")) // just like my dreams after working with .dm
		qdel(src)

	. |= COMPONENT_CLEANED

/obj/item/clothing/gloves/color/fyellow                             //Cheap Chinese Crap
	desc = "Эти перчатки - дешевая подделка под желанную модель. Ничего плохого точно не случится."
	name = "бюджетные изолирующие перчатки"
	icon_state = "yellow"
	inhand_icon_state = "ygloves"
	greyscale_colors = null
	siemens_coefficient = 1 //Set to a default of 1, gets overridden in Initialize()
	armor_type = /datum/armor/color_fyellow
	resistance_flags = NONE
	cut_type = /obj/item/clothing/gloves/cut

/datum/armor/color_fyellow
	bio = 25

/obj/item/clothing/gloves/color/fyellow/Initialize(mapload)
	. = ..()
	siemens_coefficient = pick(0,0.5,0.5,0.5,0.5,0.75,1.5)

/obj/item/clothing/gloves/color/fyellow/examine_tags(mob/user)
	. = ..()
	// Pretend we're always insulated
	if (.["partially insulated"])
		. -= "partially insulated"
	.["insulated"] = "Они сделаны из прочного электроизолятора и блокируют проходящий через них ток!"

/obj/item/clothing/gloves/color/fyellow/old
	desc = "Старые и изношенные изолирующие перчатки. Остается надеяться, что они все еще работают."
	name = "изношенные изолирующие перчатки"

/obj/item/clothing/gloves/color/fyellow/old/Initialize(mapload)
	. = ..()
	siemens_coefficient = pick(0,0,0,0.5,0.5,0.5,0.75)

/obj/item/clothing/gloves/cut
	desc = "Эти перчатки защищали бы владельца от удара током... если бы пальцы были закрыты."
	name = "изолирующие перчатки без пальцев"
	icon_state = "yellowcut"
	inhand_icon_state = "ygloves"
	greyscale_colors = null
	clothing_traits = list(TRAIT_FINGERPRINT_PASSTHROUGH)

/obj/item/clothing/gloves/cut/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, -5)

/obj/item/clothing/gloves/cut/heirloom
	desc = "Старые перчатки, которые ваш прадед когда-то украл из инженерного отдела. Последнее время им пришлось нелегко."

/obj/item/clothing/gloves/chief_engineer
	desc = "Эти перчатки отлично защищают от жара и электричества."
	name = "продвинутые изолирующие перчатки"
	icon_state = "ce_insuls"
	inhand_icon_state = null
	greyscale_colors = null
	siemens_coefficient = 0
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE

/obj/item/clothing/gloves/chief_engineer/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, -6)
