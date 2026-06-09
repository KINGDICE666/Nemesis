/* Beds... get your mind out of the gutter, they're for sleeping!
 * Contains:
 * Beds
 * Medical beds
 * Roller beds
 * Pet beds
 */

/// Beds
/obj/structure/bed
	name = "кровать"
	desc = "На ней можно лежать, спать или быть пристегнутым."
	icon_state = "bed"
	icon = 'icons/obj/bed.dmi'
	anchored = TRUE
	can_buckle = TRUE
	buckle_lying = 90
	buckle_dir = SOUTH
	resistance_flags = FLAMMABLE
	max_integrity = 100
	integrity_failure = 0.35
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2)
	/// What material this bed is made of
	var/build_stack_type = /obj/item/stack/sheet/iron
	/// How many mats to drop when deconstructed
	var/build_stack_amount = 2
	/// Mobs standing on it are nudged up by this amount. Also used to align the person back when buckled to it after init.
	var/elevation = 8
	/// If this bed can be deconstructed using a wrench
	var/can_deconstruct = TRUE
	/// Directions in which the bed has its headrest on the left side.
	var/left_headrest_dirs = NORTHEAST

/obj/structure/bed/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/soft_landing)
	if(elevation)
		AddElement(/datum/element/elevation, pixel_shift = elevation)
	update_buckle_vars(dir)
	register_context()

/obj/structure/bed/buckle_feedback(mob/living/being_buckled, mob/buckler)
	if(HAS_TRAIT(being_buckled, TRAIT_RESTRAINED))
		return ..()

	if(being_buckled == buckler)
		being_buckled.visible_message(
			span_notice("[buckler] lays down on [src]."),
			span_notice("You lay down on [src]."),
			visible_message_flags = ALWAYS_SHOW_SELF_MESSAGE,
		)
	else
		being_buckled.visible_message(
			span_notice("[buckler] lays [being_buckled] down on [src]."),
			span_notice("[buckler] lays you down on [src]."),
			visible_message_flags = ALWAYS_SHOW_SELF_MESSAGE,
		)

/obj/structure/bed/unbuckle_feedback(mob/living/being_unbuckled, mob/unbuckler)
	if(HAS_TRAIT(being_unbuckled, TRAIT_RESTRAINED))
		return ..()

	if(being_unbuckled == unbuckler)
		being_unbuckled.visible_message(
			span_notice("[unbuckler] gets up from [src]."),
			span_notice("You get up from [src]."),
			visible_message_flags = ALWAYS_SHOW_SELF_MESSAGE,
		)
	else
		being_unbuckled.visible_message(
			span_notice("[unbuckler] pulls [being_unbuckled] up from [src]."),
			span_notice("[unbuckler] pulls you up from [src]."),
			visible_message_flags = ALWAYS_SHOW_SELF_MESSAGE,
		)

/obj/structure/bed/examine(mob/user)
	. = ..()
	if (can_deconstruct)
		. += span_notice("Она держится на паре <b>болтов</b>.")

/obj/structure/bed/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	if(held_item)
		if(held_item.tool_behaviour != TOOL_WRENCH)
			return

		context[SCREENTIP_CONTEXT_RMB] = "Разобрать"
		return CONTEXTUAL_SCREENTIP_SET

	else if(has_buckled_mobs())
		context[SCREENTIP_CONTEXT_LMB] = "Отстегнуть"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/bed/setDir(newdir)
	. = ..()
	update_buckle_vars(newdir)

/obj/structure/bed/proc/update_buckle_vars(newdir)
	buckle_lying = newdir & left_headrest_dirs ? 270 : 90

/obj/structure/bed/atom_deconstruct(disassembled = TRUE)
	if(build_stack_type)
		new build_stack_type(loc, build_stack_amount)

/obj/structure/bed/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/obj/structure/bed/wrench_act_secondary(mob/living/user, obj/item/weapon)
	if (!can_deconstruct)
		return NONE
	..()
	weapon.play_tool_sound(src)
	deconstruct(disassembled = TRUE)
	return TRUE

/// Medical beds
/obj/structure/bed/medical
	name = "медицинская кровать"
	icon = 'icons/obj/medical/medical_bed.dmi'
	desc = "Медицинская кровать на колесах для перевозки пациентов или гоночных турниров медотсека."
	icon_state = "med_down"
	base_icon_state = "med"
	anchored = FALSE
	left_headrest_dirs = SOUTHWEST
	buckle_lying = 270
	resistance_flags = NONE
	build_stack_type = /obj/item/stack/sheet/mineral/titanium
	build_stack_amount = 1
	elevation = 0
	buckle_sound = SFX_SEATBELT_BUCKLE
	unbuckle_sound = SFX_SEATBELT_UNBUCKLE
	/// The item it spawns when it's folded up.
	var/foldable_type

/obj/structure/bed/medical/anchored
	anchored = TRUE

/obj/structure/bed/medical/emergency
	name = "аварийная медицинская кровать"
	desc = "Компактная медицинская кровать. Эту аварийную версию можно сложить и переносить для быстрой транспортировки."
	icon_state = "emerg_down"
	base_icon_state = "emerg"
	foldable_type = /obj/item/emergency_bed

/obj/structure/bed/medical/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/noisy_movement)
	if(anchored)
		update_appearance()

/obj/structure/bed/medical/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()
	context[SCREENTIP_CONTEXT_ALT_LMB] = "[anchored ? "Отпустить тормоза" : "Включить тормоза"]"
	if(!isnull(foldable_type) && !has_buckled_mobs())
		context[SCREENTIP_CONTEXT_RMB] = "Сложить"

	return CONTEXTUAL_SCREENTIP_SET

/obj/structure/bed/medical/examine(mob/user)
	. = ..()
	if(anchored)
		. += span_notice("Тормоза включены. Их можно отпустить Alt-кликом.")
	else
		. += span_notice("Тормоза можно включить Alt-кликом.")

	if(!isnull(foldable_type))
		. += span_notice("Ее можно сложить правым кликом.")

/obj/structure/bed/medical/click_alt(mob/user)
	if(has_buckled_mobs() && (user in buckled_mobs))
		return CLICK_ACTION_BLOCKING

	anchored = !anchored
	balloon_alert(user, "тормоза [anchored ? "включены" : "отпущены"]")
	update_appearance()
	return CLICK_ACTION_SUCCESS

/obj/structure/bed/medical/post_buckle_mob(mob/living/buckled)
	. = ..()
	set_density(TRUE)
	update_appearance()

/obj/structure/bed/medical/post_unbuckle_mob(mob/living/buckled)
	. = ..()
	set_density(FALSE)
	update_appearance()

/obj/structure/bed/medical/update_icon_state()
	. = ..()
	if(has_buckled_mobs())
		icon_state = "[base_icon_state]_up"
		// Push them up from the normal lying position
		if(buckled_mobs.len > 1)
			for(var/mob/living/patient as anything in buckled_mobs)
				patient.pixel_y = patient.base_pixel_y
		else
			buckled_mobs[1].pixel_y = buckled_mobs[1].base_pixel_y
	else
		icon_state = "[base_icon_state]_down"

/obj/structure/bed/medical/update_overlays()
	. = ..()
	if(!anchored)
		return

	if(has_buckled_mobs())
		. += mutable_appearance(icon, "brakes_up")
		. += emissive_appearance(icon, "brakes_up", src, alpha = src.alpha)
	else
		. += mutable_appearance(icon, "brakes_down")
		. += emissive_appearance(icon, "brakes_down", src, alpha = src.alpha)

/obj/structure/bed/medical/emergency/attackby(obj/item/item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(item, /obj/item/emergency_bed/silicon))
		var/obj/item/emergency_bed/silicon/silicon_bed = item
		if(silicon_bed.loaded)
			to_chat(user, span_warning("You already have a medical bed docked!"))
			return

		if(has_buckled_mobs())
			if(buckled_mobs.len > 1)
				unbuckle_all_mobs()
				user.visible_message(span_notice("[user] unbuckles all creatures from [src]."))
			else
				user_unbuckle_mob(buckled_mobs[1],user)
		else
			silicon_bed.loaded = src
			forceMove(silicon_bed)
			user.visible_message(span_notice("[user] collects [src]."), span_notice("You collect [src]."))
		return TRUE
	else
		return ..()

/obj/structure/bed/medical/emergency/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(!ishuman(user) || !user.can_perform_action(src))
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(has_buckled_mobs())
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	user.visible_message(span_notice("[user] collapses [src]."), span_notice("You collapse [src]."))
	var/obj/structure/bed/medical/emergency/folding_bed = new foldable_type(get_turf(src))
	user.put_in_hands(folding_bed)
	qdel(src)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/emergency_bed
	name = "каталка"
	desc = "Сложенная медицинская кровать, которую можно носить с собой."
	icon = 'icons/obj/medical/medical_bed.dmi'
	icon_state = "emerg_folded"
	inhand_icon_state = "emergencybed"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL // No more excuses, stop getting blood everywhere

/obj/item/emergency_bed/attackby(obj/item/item, mob/living/user, list/modifiers, list/attack_modifiers)
	if(istype(item, /obj/item/emergency_bed/silicon))
		var/obj/item/emergency_bed/silicon/silicon_bed = item
		if(silicon_bed.loaded)
			to_chat(user, span_warning("[silicon_bed] already has a roller bed loaded!"))
			return

		user.visible_message(span_notice("[user] loads [src]."), span_notice("You load [src] into [silicon_bed]."))
		silicon_bed.loaded = new/obj/structure/bed/medical/emergency(silicon_bed)
		qdel(src) //"Load"
		return

	else
		return ..()

/obj/item/emergency_bed/attack_self(mob/user)
	deploy_bed(user, user.loc)

/obj/item/emergency_bed/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(isopenturf(interacting_with))
		deploy_bed(user, interacting_with)
		return ITEM_INTERACT_SUCCESS
	return NONE


/obj/item/emergency_bed/proc/deploy_bed(mob/user, atom/location)
	var/obj/structure/bed/medical/emergency/deployed = new /obj/structure/bed/medical/emergency(location)
	deployed.add_fingerprint(user)
	qdel(src)

/obj/item/emergency_bed/silicon // ROLLER ROBO DA!
	name = "док аварийной кровати"
	desc = "Сложенная медицинская кровать, которую можно выдвинуть для экстренного использования. После применения ее нужно собрать или заменить."
	var/obj/structure/bed/medical/emergency/loaded = null

/obj/item/emergency_bed/silicon/Initialize(mapload)
	. = ..()
	loaded = new(src)

/obj/item/emergency_bed/silicon/examine(mob/user)
	. = ..()
	. += "Док [loaded ? "заряжен" : "пуст"]."

/obj/item/emergency_bed/silicon/deploy_bed(mob/user, atom/location)
	if(loaded)
		loaded.forceMove(location)
		user.visible_message(span_notice("[user] deploys [loaded]."), span_notice("You deploy [loaded]."))
		loaded = null
	else
		to_chat(user, span_warning("Док пуст!"))

/// Dog bed
/obj/structure/bed/dogbed
	name = "лежанка"
	icon_state = "dogbed"
	desc = "Уютная лежанка. В нее даже можно пристегнуть питомца на случай отключения гравитации."
	anchored = FALSE
	build_stack_type = /obj/item/stack/sheet/mineral/wood
	build_stack_amount = 10
	elevation = 0
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT * 10)
	var/owned = FALSE

/obj/structure/bed/dogbed/ian
	desc = "Лежанка Яна! Выглядит уютно."
	name = "лежанка Яна"
	anchored = TRUE

/obj/structure/bed/dogbed/cayenne
	desc = "Кажется какой-то... рыбной."
	name = "лежанка Кайен"
	anchored = TRUE

/obj/structure/bed/dogbed/misha
	desc = "Она вся в шерсти, и на ней немного крови..."
	name = "лежанка Миши"
	anchored = TRUE

/obj/structure/bed/dogbed/lia
	desc = "Кажется какой-то... рыбной."
	name = "лежанка Лии"
	anchored = TRUE

/obj/structure/bed/dogbed/renault
	desc = "Лежанка Рено! Выглядит уютно. Хитрому человеку нужен хитрый питомец."
	name = "лежанка Рено"
	anchored = TRUE

/obj/structure/bed/dogbed/mcgriff
	desc = "Лежанка МакГриффа, потому что даже борцам с преступностью иногда нужен сон."
	name = "лежанка МакГриффа"

/obj/structure/bed/dogbed/runtime
	desc = "Уютная кошачья лежанка. В нее даже можно пристегнуть питомца на случай отключения гравитации."
	name = "лежанка Рантайма"
	anchored = TRUE

///Used to set the owner of a dogbed, returns FALSE if called on an owned bed or an invalid one, TRUE if the possesion succeeds
/obj/structure/bed/dogbed/proc/update_owner(mob/living/furball)
	if(owned || type != /obj/structure/bed/dogbed) //Only marked beds work, this is hacky but I'm a hacky man
		return FALSE //Failed

	owned = TRUE
	name = "лежанка [furball]"
	desc = "Лежанка [furball]! Выглядит уютно."
	return TRUE // Let any callers know that this bed is ours now

/obj/structure/bed/dogbed/buckle_mob(mob/living/furball, force, check_loc)
	. = ..()
	update_owner(furball)

/obj/structure/bed/maint
	name = "грязный матрас"
	desc = "Старый замызганный матрас. Вы стараетесь не думать, откуда на нем эти пятна."
	icon_state = "dirty_mattress"
	elevation = 7

/obj/structure/bed/maint/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_MOLD, CELL_VIRUS_TABLE_GENERIC, rand(2,4), 25)

// Double Beds, for luxurious sleeping, i.e. the captain and maybe heads- if people use this for ERP, send them to skyrat
/obj/structure/bed/double
	name = "двуспальная кровать"
	desc = "Роскошная двуспальная кровать для тех, кто слишком важен для маленьких снов."
	icon_state = "bed_double"
	build_stack_amount = 4
	max_buckled_mobs = 2
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 4)
	/// The mob who buckled to this bed second, to avoid other mobs getting pixel-shifted before he unbuckles.
	var/mob/living/goldilocks

/obj/structure/bed/double/post_buckle_mob(mob/living/target)
	. = ..()
	if(buckled_mobs.len > 1 && !goldilocks) // Push the second buckled mob a bit higher from the normal lying position
		target.pixel_y += 6
		goldilocks = target

/obj/structure/bed/double/post_unbuckle_mob(mob/living/target)
	. = ..()
	if(target == goldilocks)
		target.pixel_y -= 6
		goldilocks = null
