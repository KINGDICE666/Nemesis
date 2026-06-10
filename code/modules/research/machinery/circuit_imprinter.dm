/obj/machinery/rnd/production/circuit_imprinter
	name = "принтер плат"
	desc = "Производит платы для сборки машин."
	icon_state = "circuit_imprinter"
	base_icon_state = "circuit_imprinter"
	production_animation = "circuit_imprinter_ani"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter
	allowed_buildtypes = IMPRINTER

/obj/machinery/rnd/production/circuit_imprinter/compute_efficiency()
	var/rating = 0
	for(var/datum/stock_part/servo/servo in component_parts)
		rating += servo.tier

	return 0.5 ** max(rating - 1, 0) // One sheet, half sheet, quarter sheet, eighth sheet.

/obj/machinery/rnd/production/circuit_imprinter/flick_animation(datum/material/mat)
	return //we presently have no animation

/obj/machinery/rnd/production/circuit_imprinter/offstation
	name = "древний принтер плат"
	desc = "Производит платы для сборки машин. Его древняя конструкция может ограничивать печать всех известных технологий."
	allowed_buildtypes = AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/offstation
