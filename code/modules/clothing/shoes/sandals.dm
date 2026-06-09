/obj/item/clothing/shoes/sandal
	desc = "Пара довольно простых деревянных сандалий."
	name = "сандалии"
	icon_state = "wizard"
	inhand_icon_state = "wizshoe"
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT)
	resistance_flags = FLAMMABLE
	strip_delay = 0.5 SECONDS
	equip_delay_other = 5 SECONDS
	armor_type = /datum/armor/shoes_sandal
	fastening_type = SHOES_SLIPON
	species_exception = list(/datum/species/golem)
	lace_time = 3 SECONDS
	clothing_flags = parent_type::clothing_flags | CARP_STYLE_FACTOR

/obj/item/clothing/shoes/sandal/alt
	name = "черные сандалии"
	desc = "Пара блестящих черных деревянных сандалий."
	icon_state = "blacksandals"
	inhand_icon_state = "blacksandals"

/datum/armor/shoes_sandal
	bio = 10

/obj/item/clothing/shoes/sandal/magic
	name = "волшебные сандалии"
	desc = "Пара сандалий, наполненных магией."
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/sandal/beach
	name = "шлепанцы"
	desc = "Очень модная пара шлепанцев."

/obj/item/clothing/shoes/sandal/velcro
	name = "сандалии на липучках"
	desc = "Пара деревянных сандалий, 'улучшенных' липучками ради соответствия корпоративной политике униформы."
	fastening_type = SHOES_VELCRO

/obj/item/clothing/shoes/sandal/alt/velcro
	name = "черные сандалии на липучках"
	desc = "Пара блестящих черных сандалий, 'улучшенных' липучками ради соответствия корпоративной политике униформы."
	fastening_type = SHOES_VELCRO
