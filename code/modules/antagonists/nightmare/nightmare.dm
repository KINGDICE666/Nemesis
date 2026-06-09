/datum/antagonist/nightmare
	name = "\improper Кошмар"
	antagpanel_category = ANTAG_GROUP_ABOMINATIONS
	pref_flag = ROLE_NIGHTMARE
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	ui_name = "AntagInfoNightmare"
	suicide_cry = "ЗА ТЬМУ!!"
	preview_outfit = /datum/outfit/nightmare

/datum/antagonist/nightmare/greet()
	. = ..()
	owner.announce_objectives()

/datum/antagonist/nightmare/on_gain()
	forge_objectives()
	. = ..()

/datum/antagonist/nightmare/apply_innate_effects(mob/living/mob_override)
	var/mob/living/nightmare = mob_override || owner.current
	nightmare.mob_mood.mood_modifier -= 1

/datum/antagonist/nightmare/remove_innate_effects(mob/living/mob_override)
	var/mob/living/nightmare = mob_override || owner.current
	nightmare.mob_mood.mood_modifier += 1

/datum/outfit/nightmare
	name = "Кошмар (только предпросмотр)"

/datum/outfit/nightmare/post_equip(mob/living/carbon/human/human, visuals_only)
	human.set_species(/datum/species/shadow/nightmare)

/datum/objective/nightmare_fluff

/datum/objective/nightmare_fluff/New()
	var/list/explanation_texts = list(
		"Поглотите последний отблеск света на космической станции.",
		"Обрушьте суд на ходящих под дневным светом.",
		"Погасите пламя этого адского места.",
		"Раскройте истинную природу теней.",
		"Из теней придёт гибель для всех.",
		"Призовите ночь клинком или пламенем.",
		"Принесите тьму к свету."
	)
	explanation_text = pick(explanation_texts)
	..()

/datum/objective/nightmare_fluff/check_completion()
	return owner.current && owner.current.stat != DEAD

/datum/antagonist/nightmare/forge_objectives()
	var/datum/objective/nightmare_fluff/objective = new
	objective.owner = owner
	objectives += objective
