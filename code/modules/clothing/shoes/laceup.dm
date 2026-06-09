/obj/item/clothing/shoes/laceup
	name = "туфли на шнурках"
	desc = "Верх моды, к тому же уже отполированы!"
	icon_state = "laceups"
	equip_delay_other = 5 SECONDS
	clothing_flags = parent_type::clothing_flags | CARP_STYLE_FACTOR

/obj/item/clothing/shoes/laceup/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/adjust_fishing_difficulty, 3) //You aren't going to fish with these are you?
