// Given to heretic monsters.
/datum/action/cooldown/spell/shapeshift/eldritch
	name = "Смена облика"
	desc = "Заклинание, позволяющее принять облик другого существа и получить его способности. \
		After making your choice, you will be unable to change to another."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"

	school = SCHOOL_FORBIDDEN
	invocation = "SH'PE."
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

	possible_shapes = list(
		/mob/living/basic/carp,
		/mob/living/basic/mouse,
		/mob/living/basic/pet/cat,
		/mob/living/basic/pet/dog/corgi,
		/mob/living/basic/pet/fox,
		/mob/living/basic/bot/secbot,
	)
