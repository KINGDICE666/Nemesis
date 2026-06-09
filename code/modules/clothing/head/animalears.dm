/obj/item/clothing/head/costume/kitty
	name = "кошачьи ушки"
	desc = "Пара кошачьих ушек. Мяу!"
	icon_state = "kitty"
	color = "#999999"

	dog_fashion = /datum/dog_fashion/head/kitty

/obj/item/clothing/head/costume/kitty/visual_equipped(mob/living/carbon/human/user, slot)
	if(ishuman(user) && (slot & ITEM_SLOT_HEAD))
		update_icon(ALL, user)
		user.update_worn_head() //Color might have been changed by update_appearance.
	return ..()

/obj/item/clothing/head/costume/kitty/update_icon(updates=ALL, mob/living/carbon/human/user)
	. = ..()
	if(ishuman(user))
		add_atom_colour(user.hair_color, FIXED_COLOUR_PRIORITY)

/obj/item/clothing/head/costume/kitty/genuine
	desc = "Пара кошачьих ушек. На внутренней бирке написано: \"Сделано вручную из настоящих кошек.\""

/obj/item/clothing/head/costume/rabbitears
	name = "кроличьи ушки"
	desc = "В них вы выглядите бесполезно, зато сексуально."
	icon_state = "bunny"

	dog_fashion = /datum/dog_fashion/head/rabbit
