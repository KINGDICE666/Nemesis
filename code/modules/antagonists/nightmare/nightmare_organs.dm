/// How many life ticks are required for the nightmare's heart to revive the nightmare.
#define HEART_RESPAWN_THRESHHOLD (80 SECONDS)
/// A special flag value used to make a nightmare heart not grant a light eater. Appears to be unused.
#define HEART_SPECIAL_SHADOWIFY 2

/obj/item/organ/brain/shadow/nightmare
	name = "опухолевая масса"
	desc = "Мясистый нарост, извлечённый из черепа Кошмара."
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "brain-x-d"
	shade_color = "чёрный, каким-то образом"

	///Our associated shadow jaunt spell, for all nightmares
	var/datum/action/cooldown/spell/jaunt/shadow_walk/our_jaunt
	///Our associated terrorize spell, for antagonist nightmares
	var/datum/action/cooldown/spell/pointed/terrorize/terrorize_spell

/obj/item/organ/brain/shadow/nightmare/on_mob_insert(mob/living/carbon/brain_owner)
	. = ..()

	if(brain_owner.dna.species.id != SPECIES_NIGHTMARE)
		brain_owner.set_species(/datum/species/shadow/nightmare, replace_missing = FALSE)
		visible_message(span_warning("[brain_owner] бьётся в судорогах, пока [src] укореняется в [brain_owner.p_their()] теле!"))

	our_jaunt = new(brain_owner)
	our_jaunt.Grant(brain_owner)

	if(brain_owner.mind?.has_antag_datum(/datum/antagonist/nightmare)) //Only a TRUE NIGHTMARE is worthy of using this ability
		terrorize_spell = new(src)
		terrorize_spell.Grant(brain_owner)

/obj/item/organ/brain/shadow/nightmare/on_mob_remove(mob/living/carbon/brain_owner)
	. = ..()
	QDEL_NULL(our_jaunt)
	QDEL_NULL(terrorize_spell)

/obj/item/organ/brain/shadow/nightmare/on_life(seconds_per_tick)
	. = ..()

	var/turf/owner_turf = owner.loc
	if(!isturf(owner_turf))
		return
	var/light_amount = owner_turf.get_lumcount()

	if (light_amount < SHADOW_SPECIES_LIGHT_THRESHOLD) //dodge in the dark
		owner.apply_status_effect(/datum/status_effect/shadow/nightmare)

/datum/status_effect/shadow/nightmare
	id = "nightmare"
	alert_type = /atom/movable/screen/alert/status_effect/shadow_regeneration/nightmare

/datum/status_effect/shadow/nightmare/on_apply()
	. = ..()
	if (!.)
		return FALSE
	RegisterSignal(owner, COMSIG_ATOM_PRE_BULLET_ACT, PROC_REF(dodge_bullets))
	return TRUE

/datum/status_effect/shadow/nightmare/on_remove()
	UnregisterSignal(owner, COMSIG_ATOM_PRE_BULLET_ACT)
	return ..()

/datum/status_effect/shadow/nightmare/proc/dodge_bullets(mob/living/carbon/human/source, obj/projectile/hitting_projectile, def_zone)
	SIGNAL_HANDLER
	source.visible_message(
		span_danger("[source] танцует в тенях, уклоняясь от [hitting_projectile]!"),
		span_danger("Вы уклоняетесь от [hitting_projectile] под покровом тьмы!"),
	)
	playsound(source, SFX_BULLET_MISS, 75, TRUE)
	return COMPONENT_BULLET_PIERCED

/atom/movable/screen/alert/status_effect/shadow_regeneration/nightmare
	name = "Владения без света"
	desc = "Окутанные успокаивающей тьмой, вы медленно восстанавливаетесь, даже за гранью смерти. \
		Обострённые рефлексы позволяют уклоняться от снарядов."

/obj/item/organ/heart/nightmare
	name = "сердце тьмы"
	desc = "Чужеродный орган, который скручивается и извивается на свету."
	visual = TRUE
	icon = 'icons/obj/medical/organs/shadow_organs.dmi'
	icon_state = "dark_heart-on"
	base_icon_state = "dark_heart"

	beat_noise = "извивающиеся пульсации страха, обрётшего форму" // evil schmeevil
	decay_factor = 0
	// No love is to be found in a heart so twisted.
	food_reagents = list(/datum/reagent/consumable/nutriment/organ_tissue = 5)
	// In case you want to drink light as well as eat it
	organ_traits = list(TRAIT_LIGHT_DRINKER)
	/// How many life ticks in the dark the owner has been dead for. Used for nightmare respawns.
	var/respawn_progress = 0
	/// The armblade granted to the host of this heart.
	var/obj/item/light_eater/blade

/obj/item/organ/heart/nightmare/attack(mob/M, mob/living/carbon/user, obj/target)
	if(M != user)
		return ..()
	user.visible_message(
		span_warning("[user] подносит [src] ко рту и вгрызается в него зубами!"),
		span_danger("[src] неестественно холоден в ваших руках. Вы подносите [src] ко рту и пожираете его!")
	)
	playsound(user, 'sound/effects/magic/demon_consume.ogg', 50, TRUE)

	user.visible_message(
		span_warning("Кровь вырывается из руки [user], пока она превращается в оружие!"),
		span_userdanger("Ледяная кровь пульсирует в ваших венах, пока рука перестраивается!")
	)
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	Insert(user)

/obj/item/organ/heart/nightmare/on_mob_insert(mob/living/carbon/heart_owner, special, movement_flags)
	. = ..()
	if(special != HEART_SPECIAL_SHADOWIFY)
		blade = new/obj/item/light_eater
		heart_owner.put_in_hands(blade)

/obj/item/organ/heart/nightmare/on_mob_remove(mob/living/carbon/heart_owner, special, movement_flags)
	. = ..()
	respawn_progress = 0
	if(blade && special != HEART_SPECIAL_SHADOWIFY)
		heart_owner.visible_message(span_warning("\The [blade] распадается!"))
		QDEL_NULL(blade)

/obj/item/organ/heart/nightmare/Stop()
	return FALSE

/obj/item/organ/heart/nightmare/on_death(seconds_per_tick)
	if(!owner)
		return
	var/turf/T = get_turf(owner)
	if(istype(T))
		var/light_amount = T.get_lumcount()
		if(light_amount < SHADOW_SPECIES_LIGHT_THRESHOLD)
			respawn_progress += seconds_per_tick SECONDS
			playsound(owner, 'sound/effects/singlebeat.ogg', 40, TRUE)
	if(respawn_progress < HEART_RESPAWN_THRESHHOLD)
		return

	owner.revive(HEAL_ALL & ~HEAL_REFRESH_ORGANS)
	if(!(owner.dna.species.id == SPECIES_SHADOW || owner.dna.species.id == SPECIES_NIGHTMARE))
		var/mob/living/carbon/old_owner = owner
		Remove(owner, HEART_SPECIAL_SHADOWIFY)
		old_owner.set_species(/datum/species/shadow)
		Insert(old_owner, HEART_SPECIAL_SHADOWIFY)
		to_chat(owner, span_userdanger("Вы чувствуете, как тени вторгаются в кожу и бросаются к центру груди! Вы живы!"))
		SEND_SOUND(owner, sound('sound/effects/ghost.ogg'))
	owner.visible_message(span_warning("[owner] пошатываясь поднимается на ноги!"))
	playsound(owner, 'sound/effects/hallucinations/far_noise.ogg', 50, TRUE)
	respawn_progress = 0

/obj/item/organ/heart/nightmare/get_availability(datum/species/owner_species, mob/living/owner_mob)
	if(isnightmare(owner_mob))
		return TRUE
	return ..()

#undef HEART_SPECIAL_SHADOWIFY
#undef HEART_RESPAWN_THRESHHOLD
