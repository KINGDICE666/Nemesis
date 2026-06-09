/obj/item/clothing/mask/breath
	desc = "Плотно прилегающая маска, которую можно подключить к источнику воздуха."
	name = "дыхательная маска"
	icon_state = "breath"
	inhand_icon_state = "m_mask"
	body_parts_covered = 0
	clothing_flags = MASKINTERNALS
	visor_flags = MASKINTERNALS
	w_class = WEIGHT_CLASS_SMALL
	armor_type = /datum/armor/mask_breath
	actions_types = list(/datum/action/item_action/adjust)
	flags_cover = MASKCOVERSMOUTH
	visor_flags_cover = MASKCOVERSMOUTH
	resistance_flags = NONE
	interaction_flags_click = NEED_DEXTERITY|ALLOW_RESTING
	/// Can this mask be adjusted?
	var/adjustable = TRUE

/datum/armor/mask_breath
	bio = 50

/obj/item/clothing/mask/breath/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] обматывает трубку \the [src] вокруг [user.p_their()] шеи! Похоже, [user.p_theyre()] пытается покончить с собой!"))
	return OXYLOSS

/obj/item/clothing/mask/breath/attack_self(mob/user)
	if(adjustable)
		adjust_visor(user)

/obj/item/clothing/mask/breath/click_alt(mob/user)
	if(!adjustable)
		return
	adjust_visor(user)
	return CLICK_ACTION_SUCCESS

/obj/item/clothing/mask/breath/examine(mob/user)
	. = ..()
	if(adjustable)
		. += span_notice("Alt-клик по [src], чтобы поправить ее.")

/obj/item/clothing/mask/breath/medical
	desc = "Плотно прилегающая стерильная маска, которую можно подключить к источнику воздуха."
	name = "медицинская маска"
	icon_state = "medical"
	inhand_icon_state = "m_mask"
	armor_type = /datum/armor/breath_medical
	equip_delay_other = 1 SECONDS

/datum/armor/breath_medical
	bio = 90

/obj/item/clothing/mask/breath/muzzle
	name = "хирургическая маска"
	desc = "Чтобы заставить надоедливых пациентов замолчать перед наркозом."
	icon_state = "breathmuzzle"
	inhand_icon_state = "breathmuzzle"
	lefthand_file = 'icons/mob/inhands/clothing/masks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/masks_righthand.dmi'
	body_parts_covered = NONE
	flags_cover = NONE
	actions_types = null
	armor_type = /datum/armor/breath_muzzle
	equip_delay_other = 2.5 SECONDS // my sprite has 4 straps, a-la a head harness. takes a while to equip, longer than a muzzle
	adjustable = FALSE

/obj/item/clothing/mask/breath/muzzle/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/muffles_speech)

/obj/item/clothing/mask/breath/muzzle/attack_paw(mob/user, list/modifiers)
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		if(src == carbon_user.wear_mask)
			to_chat(user, span_warning("Вам нужна помощь, чтобы снять это!"))
			return
	return ..()

/obj/item/clothing/mask/breath/muzzle/examine_tags(mob/user)
	. = ..()
	.["surgical"] = "Не блокирует операции на закрытых частях тела."

/datum/armor/breath_muzzle
	bio = 100
