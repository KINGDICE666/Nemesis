/datum/action/cooldown/spell/pointed/terrorize
	name = "Ужаснуть"
	desc = "Проникните в разум жертвы, накапливая в ней ужас. \
		Добыча будет бояться всё сильнее. Удар открытой рукой по испуганной добыче \
		напугает и дезориентирует её."
	button_icon_state = "terrify"
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	antimagic_flags = MAGIC_RESISTANCE_MIND
	spell_requirements = NONE
	cooldown_time = 25 SECONDS
	cast_range = 9
	active_msg = "Вы готовитесь впиться взглядом в цель..."
	deactive_msg = "Вы снова фокусируете взгляд..."

/datum/action/cooldown/spell/pointed/terrorize/is_valid_target(atom/cast_on)
	. = ..()
	if(!ishuman(cast_on))
		cast_on.balloon_alert(owner, "нельзя ужаснуть!")
		return FALSE

	var/lit_tiles = 0
	var/unlit_tiles = 0

	for(var/turf/open/turf_to_check in range(1, cast_on)) //We have to use range for this because fully darkened tiles get blocked by view()'s visibility checks
		var/light_amount = turf_to_check.get_lumcount()
		if(light_amount > 0.2)
			lit_tiles++
		else
			unlit_tiles++

	if(lit_tiles > unlit_tiles)
		cast_on.balloon_alert(owner, "цель должна быть во тьме!")
		return FALSE //Having a light on you will usually block this, meaning you'll probably need to get an initial hit on the victim with the light eater

/datum/action/cooldown/spell/pointed/terrorize/cast(mob/living/carbon/human/cast_on)
	. = ..()
	cast_on.apply_status_effect(/datum/status_effect/terrified) //Effect stacks, adding bonus terror to the victim if cast again
