/obj/item/clothing/gloves/color/black
	desc = "Эти перчатки огнестойкие."
	name = "черные перчатки"
	icon_state = "black"
	greyscale_colors = "#2f2e31"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	cut_type = /obj/item/clothing/gloves/fingerless

/obj/item/clothing/gloves/color/black/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/radio_containing/radiogloves)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/obj/item/clothing/gloves/color/black/security
	name = "перчатки службы безопасности"
	desc = "В эти перчатки службы безопасности встроены микрочипы, помогающие быстро задерживать подозреваемых."
	icon_state = "sec"
	clothing_traits = list(TRAIT_FAST_CUFFING)

/obj/item/clothing/gloves/color/black/security/blu
	icon_state = "sec_blu"

/obj/item/clothing/gloves/fingerless
	name = "перчатки без пальцев"
	desc = "Простые черные перчатки без кончиков пальцев для трудяг."
	icon_state = "fingerless"
	greyscale_colors = "#2f2e31"
	strip_delay = 4 SECONDS
	equip_delay_other = 2 SECONDS
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	custom_price = PAYCHECK_CREW * 1.5
	undyeable = TRUE
	clothing_traits = list(TRAIT_FINGERPRINT_PASSTHROUGH)

/obj/item/clothing/gloves/fingerless/Initialize(mapload)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/gripperoffbrand)
	AddElement(/datum/element/adjust_fishing_difficulty, -4)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/obj/item/clothing/gloves/color/orange
	name = "оранжевые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "orange"
	greyscale_colors = COLOR_CRAYON_ORANGE

/obj/item/clothing/gloves/color/red
	name = "красные перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "red"
	greyscale_colors = COLOR_CRAYON_RED

/obj/item/clothing/gloves/color/red/insulated
	name = "изолирующие перчатки"
	desc = "Эти перчатки защищают от удара током."
	siemens_coefficient = 0
	armor_type = /datum/armor/red_insulated
	resistance_flags = NONE

/datum/armor/red_insulated
	bio = 50

/obj/item/clothing/gloves/color/rainbow
	name = "радужные перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "rainbow"
	inhand_icon_state = "rainbow_gloves"
	greyscale_colors = null

/obj/item/clothing/gloves/color/blue
	name = "синие перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "blue"
	greyscale_colors = COLOR_CRAYON_BLUE

/obj/item/clothing/gloves/color/purple
	name = "фиолетовые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "purple"
	greyscale_colors = "#cc33ff"

/obj/item/clothing/gloves/color/green
	name = "зеленые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "green"
	greyscale_colors = COLOR_CRAYON_GREEN

/obj/item/clothing/gloves/color/grey
	name = "серые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "gray"
	greyscale_colors = "#999999"

// Grey gloves intended to be paired with winter coats (specifically EVA winter coats)
/obj/item/clothing/gloves/color/grey/protects_cold
	name = "\proper перчатки Endotherm"
	desc = "Пара толстых серых перчаток с подкладкой, защищающей владельца от лютого холода."
	w_class = WEIGHT_CLASS_NORMAL
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	resistance_flags = NONE
	clothing_flags = parent_type::clothing_flags | THICKMATERIAL

/obj/item/clothing/gloves/color/light_brown
	name = "светло-коричневые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "lightbrown"
	greyscale_colors = "#c09f72"

/obj/item/clothing/gloves/color/brown
	name = "коричневые перчатки"
	desc = "Пара перчаток, ничем особенным не выделяются."
	icon_state = "brown"
	greyscale_colors = "#83613d"

/obj/item/clothing/gloves/color/white
	name = "белые перчатки"
	desc = "Выглядят довольно изысканно."
	icon_state = "white"
	greyscale_colors = COLOR_WHITE
	custom_price = PAYCHECK_CREW
