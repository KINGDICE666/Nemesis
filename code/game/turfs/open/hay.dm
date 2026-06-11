/turf/open/misc/hay
	name = "сено"
	desc = "Для лошадей и коров вроде вас."
	icon = 'icons/turf/floors.dmi'
	icon_state = "hay"
	base_icon_state = "hay"

/turf/open/misc/hay/lavaland
	baseturfs = list(/turf/open/misc/basalt)
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/misc/hay/icemoon
	baseturfs = list(/turf/open/misc/snow)
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS
