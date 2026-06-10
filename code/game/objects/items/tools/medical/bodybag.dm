
/obj/item/bodybag
	name = "мешок для тел"
	desc = "Сложенный мешок для хранения и перевозки трупов."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bodybag_folded"
	w_class = WEIGHT_CLASS_SMALL
	///Stored path we use for spawning a new body bag entity when unfolded.
	var/unfoldedbag_path = /obj/structure/closet/body_bag

/obj/item/bodybag/attack_self(mob/user)
	if(user.is_holding(src))
		deploy_bodybag(user, get_turf(user))
	else
		deploy_bodybag(user, get_turf(src))

/obj/item/bodybag/interact_with_atom(atom/interacting_with, mob/living/user, flags)
	if(isopenturf(interacting_with))
		deploy_bodybag(user, interacting_with)
		return ITEM_INTERACT_SUCCESS
	return NONE

/obj/item/bodybag/attempt_pickup(mob/user)
	// can't pick ourselves up if we are inside of the bodybag, else very weird things may happen
	if(contains(user))
		return TRUE
	return ..()

/**
 * Creates a new body bag item when unfolded, at the provided location, replacing the body bag item.
 * * mob/user: User opening the body bag.
 * * atom/location: the place/entity/mob where the body bag is being deployed from.
 */
/obj/item/bodybag/proc/deploy_bodybag(mob/user, atom/location)
	var/obj/structure/closet/body_bag/item_bag = new unfoldedbag_path(location)
	item_bag.open(user)
	item_bag.add_fingerprint(user)
	item_bag.foldedbag_instance = src
	moveToNullspace()
	return item_bag

/obj/item/bodybag/suicide_act(mob/living/user)
	if(isopenturf(user.loc))
		user.visible_message(span_suicide("[user] заползает в [src]! Похоже, [user.p_theyre()] пытается совершить самоубийство!"))
		var/obj/structure/closet/body_bag/R = new unfoldedbag_path(user.loc)
		R.add_fingerprint(user)
		qdel(src)
		user.forceMove(R)
		playsound(src, 'sound/items/zip/zip.ogg', 15, TRUE, -3)
		return OXYLOSS

// Bluespace bodybag

/obj/item/bodybag/bluespace
	name = "блюспейс-мешок для тел"
	desc = "Сложенный блюспейс-мешок для хранения и перевозки трупов."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "bluebodybag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/bluespace
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NO_MAT_REDEMPTION

/obj/item/bodybag/bluespace/examine(mob/user)
	. = ..()
	if(contents.len)
		. += span_notice("Через ткань можно различить очертания [contents.len] объект[declension_ru(contents.len, "", "а", "ов")].")

/obj/item/bodybag/bluespace/Destroy()
	for(var/atom/movable/A in contents)
		A.forceMove(get_turf(src))
		if(isliving(A))
			to_chat(A, span_notice("Вы внезапно чувствуете, как пространство вокруг разрывается! Вы свободны!"))
	return ..()

/obj/item/bodybag/bluespace/deploy_bodybag(mob/user, atom/location)
	var/obj/structure/closet/body_bag/item_bag = new unfoldedbag_path(location)
	for(var/atom/movable/inside in contents)
		inside.forceMove(item_bag)
		if(isliving(inside))
			to_chat(inside, span_notice("Вы внезапно чувствуете воздух вокруг! Вы свободны!"))
	item_bag.open(user)
	item_bag.add_fingerprint(user)
	item_bag.foldedbag_instance = src
	moveToNullspace()
	return item_bag

/obj/item/bodybag/bluespace/container_resist_act(mob/living/user)
	if(user.incapacitated)
		to_chat(user, span_warning("Вы не можете выбраться, пока так связаны!"))
		return
	user.changeNext_move(CLICK_CD_BREAKOUT)
	user.last_special = world.time + CLICK_CD_BREAKOUT
	to_chat(user, span_notice("Вы царапаете ткань [src], пытаясь разорвать её..."))
	to_chat(loc, span_warning("Кто-то пытается вырваться из [src]!"))
	if(!do_after(user, 12 SECONDS, src, timed_action_flags = (IGNORE_TARGET_LOC_CHANGE|IGNORE_HELD_ITEM)))
		return
	// you are still in the bag? time to go unless you KO'd, honey!
	// if they escape during this time and you rebag them the timer is still clocking down and does NOT reset so they can very easily get out.
	if(user.incapacitated)
		to_chat(loc, span_warning("Давление спадает. Похоже, сопротивление прекратилось..."))
		return
	loc.visible_message(span_warning("[user] внезапно появляется перед [loc]!"), span_userdanger("[user] вырывается из [src]!"))
	qdel(src)

/obj/item/bodybag/environmental
	name = "защитный мешок"
	desc = "Сложенный усиленный мешок для защиты от экзопланетарных бурь."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "envirobag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental
	w_class = WEIGHT_CLASS_NORMAL //It's reinforced and insulated, like a beefed-up sleeping bag, so it has a higher bulkiness than regular bodybag
	resistance_flags = ACID_PROOF | FIRE_PROOF | FREEZE_PROOF

/obj/item/bodybag/environmental/nanotrasen
	name = "элитный защитный мешок"
	desc = "Сложенный, сильно усиленный и утеплённый мешок, способный полностью изолировать содержимое от внешних факторов."
	icon_state = "ntenvirobag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental/nanotrasen
	resistance_flags = ACID_PROOF | FIRE_PROOF | FREEZE_PROOF | LAVA_PROOF

/obj/item/bodybag/environmental/prisoner
	name = "мешок для перевозки заключённых"
	desc = "Сложенный защитный мешок для перевозки заключённых через опасную среду. Оснащён ремнями, чтобы надёжно удерживать пассажира."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "prisonerenvirobag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental/prisoner

/obj/item/bodybag/environmental/prisoner/pressurized
	name = "герметичный мешок для перевозки заключённых"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental/prisoner/pressurized

/obj/item/bodybag/environmental/prisoner/syndicate
	name = "мешок Синдиката для перевозки заключённых"
	desc = "Модификация защитного мешка Nanotrasen, использовавшаяся в нескольких громких похищениях. Предназначен для доставки жертвы в бессознательном, живом и зафиксированном состоянии."
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "syndieenvirobag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental/prisoner/pressurized/syndicate
	resistance_flags = ACID_PROOF | FIRE_PROOF | FREEZE_PROOF | LAVA_PROOF

/obj/item/bodybag/stasis
	name = /obj/structure/closet/body_bag/environmental/stasis::name
	desc = /obj/structure/closet/body_bag/environmental/stasis::desc
	max_integrity = /obj/structure/closet/body_bag/environmental/stasis::max_integrity
	icon = 'icons/obj/medical/bodybag.dmi'
	icon_state = "stasis_bag_folded"
	unfoldedbag_path = /obj/structure/closet/body_bag/environmental/stasis

/obj/item/bodybag/stasis/deploy_bodybag(mob/user, atom/location)
	var/obj/structure/closet/body_bag/environmental/stasis/bag = ..()
	bag.last_filter_update = -1
	bag.update_integrity(get_integrity())
	return bag
