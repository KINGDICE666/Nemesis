/obj/structure/door_assembly/door_assembly_public
	name = "сборка общественного шлюза"
	icon = 'icons/obj/doors/airlocks/public/glass.dmi'
	overlays_file = 'icons/obj/doors/airlocks/public/overlays.dmi'
	glass_type = /obj/machinery/door/airlock/public/glass
	airlock_type = /obj/machinery/door/airlock/public

/obj/structure/door_assembly/door_assembly_com
	name = "сборка командного шлюза"
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	base_name = "командный шлюз"
	glass_type = /obj/machinery/door/airlock/command/glass
	airlock_type = /obj/machinery/door/airlock/command

/obj/structure/door_assembly/door_assembly_sec
	name = "сборка шлюза службы безопасности"
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	base_name = "шлюз службы безопасности"
	glass_type = /obj/machinery/door/airlock/security/glass
	airlock_type = /obj/machinery/door/airlock/security

/obj/structure/door_assembly/door_assembly_eng
	name = "сборка инженерного шлюза"
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	base_name = "инженерный шлюз"
	glass_type = /obj/machinery/door/airlock/engineering/glass
	airlock_type = /obj/machinery/door/airlock/engineering

/obj/structure/door_assembly/door_assembly_min
	name = "сборка шахтерского шлюза"
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	base_name = "шахтерский шлюз"
	glass_type = /obj/machinery/door/airlock/mining/glass
	airlock_type = /obj/machinery/door/airlock/mining

/obj/structure/door_assembly/door_assembly_atmo
	name = "сборка атмосферного шлюза"
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	base_name = "атмосферный шлюз"
	glass_type = /obj/machinery/door/airlock/atmos/glass
	airlock_type = /obj/machinery/door/airlock/atmos

/obj/structure/door_assembly/door_assembly_research
	name = "сборка исследовательского шлюза"
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	base_name = "исследовательский шлюз"
	glass_type = /obj/machinery/door/airlock/research/glass
	airlock_type = /obj/machinery/door/airlock/research

/obj/structure/door_assembly/door_assembly_science
	name = "сборка научного шлюза"
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	base_name = "научный шлюз"
	glass_type = /obj/machinery/door/airlock/science/glass
	airlock_type = /obj/machinery/door/airlock/science

/obj/structure/door_assembly/door_assembly_med
	name = "сборка медицинского шлюза"
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	base_name = "медицинский шлюз"
	glass_type = /obj/machinery/door/airlock/medical/glass
	airlock_type = /obj/machinery/door/airlock/medical

/obj/structure/door_assembly/door_assembly_hydro
	name = "сборка шлюза гидропоники"
	icon = 'icons/obj/doors/airlocks/station/hydroponics.dmi'
	base_name = "шлюз гидропоники"
	glass_type = /obj/machinery/door/airlock/hydroponics/glass
	airlock_type = /obj/machinery/door/airlock/hydroponics

/obj/structure/door_assembly/door_assembly_mai
	name = "сборка технического шлюза"
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	base_name = "технический шлюз"
	glass_type = /obj/machinery/door/airlock/maintenance/glass
	airlock_type = /obj/machinery/door/airlock/maintenance

/obj/structure/door_assembly/door_assembly_extmai
	name = "сборка внешнего технического шлюза"
	icon = 'icons/obj/doors/airlocks/station/maintenanceexternal.dmi'
	base_name = "внешний технический шлюз"
	glass_type = /obj/machinery/door/airlock/maintenance/external/glass
	airlock_type = /obj/machinery/door/airlock/maintenance/external

/obj/structure/door_assembly/door_assembly_ext
	name = "сборка внешнего шлюза"
	icon = 'icons/obj/doors/airlocks/external/external.dmi'
	base_name = "внешний шлюз"
	overlays_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	glass_type = /obj/machinery/door/airlock/external/glass
	airlock_type = /obj/machinery/door/airlock/external

/obj/structure/door_assembly/door_assembly_fre
	name = "сборка морозильного шлюза"
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	base_name = "морозильный шлюз"
	airlock_type = /obj/machinery/door/airlock/freezer
	noglass = TRUE

/obj/structure/door_assembly/door_assembly_hatch
	name = "сборка герметичного люка"
	icon = 'icons/obj/doors/airlocks/hatch/centcom.dmi'
	base_name = "герметичный люк"
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/hatch
	noglass = TRUE

/obj/structure/door_assembly/door_assembly_mhatch
	name = "сборка технического люка"
	icon = 'icons/obj/doors/airlocks/hatch/maintenance.dmi'
	base_name = "технический люк"
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/maintenance_hatch
	noglass = TRUE

/obj/structure/door_assembly/door_assembly_highsecurity
	name = "сборка шлюза высокой безопасности"
	icon = 'icons/obj/doors/airlocks/highsec/highsec.dmi'
	base_name = "шлюз высокой безопасности"
	overlays_file = 'icons/obj/doors/airlocks/highsec/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/highsecurity
	noglass = TRUE
	material_type = /obj/item/stack/sheet/plasteel
	material_amt = 4
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 4)

/obj/structure/door_assembly/door_assembly_vault
	name = "сборка двери хранилища"
	icon = 'icons/obj/doors/airlocks/vault/vault.dmi'
	base_name = "дверь хранилища"
	overlays_file = 'icons/obj/doors/airlocks/vault/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/vault
	noglass = TRUE
	material_type = /obj/item/stack/sheet/plasteel
	material_amt = 6
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 6)

/obj/structure/door_assembly/door_assembly_shuttle
	name = "сборка шлюза шаттла"
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	base_name = "шлюз шаттла"
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/shuttle
	glass_type = /obj/machinery/door/airlock/shuttle/glass

/obj/structure/door_assembly/door_assembly_cult
	name = "сборка культового шлюза"
	icon = 'icons/obj/doors/airlocks/cult/runed/cult.dmi'
	base_name = "культовый шлюз"
	overlays_file = 'icons/obj/doors/airlocks/cult/runed/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/cult
	glass_type = /obj/machinery/door/airlock/cult/glass

/obj/structure/door_assembly/door_assembly_cult/unruned
	icon = 'icons/obj/doors/airlocks/cult/unruned/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/unruned/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/cult/unruned
	glass_type = /obj/machinery/door/airlock/cult/unruned/glass

/obj/structure/door_assembly/door_assembly_viro
	name = "сборка шлюза вирусологии"
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	base_name = "шлюз вирусологии"
	glass_type = /obj/machinery/door/airlock/virology/glass
	airlock_type = /obj/machinery/door/airlock/virology

/obj/structure/door_assembly/door_assembly_centcom
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/centcom/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/centcom
	noglass = TRUE

/obj/structure/door_assembly/door_assembly_grunge
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/centcom/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/grunge
	noglass = TRUE

/obj/structure/door_assembly/door_assembly_gold
	name = "сборка золотого шлюза"
	icon = 'icons/obj/doors/airlocks/station/gold.dmi'
	base_name = "золотой шлюз"
	airlock_type = /obj/machinery/door/airlock/gold
	mineral = "gold"
	glass_type = /obj/machinery/door/airlock/gold/glass

/obj/structure/door_assembly/door_assembly_silver
	name = "сборка серебряного шлюза"
	icon = 'icons/obj/doors/airlocks/station/silver.dmi'
	base_name = "серебряный шлюз"
	airlock_type = /obj/machinery/door/airlock/silver
	mineral = "silver"
	glass_type = /obj/machinery/door/airlock/silver/glass

/obj/structure/door_assembly/door_assembly_diamond
	name = "сборка алмазного шлюза"
	icon = 'icons/obj/doors/airlocks/station/diamond.dmi'
	base_name = "алмазный шлюз"
	airlock_type = /obj/machinery/door/airlock/diamond
	mineral = "diamond"
	glass_type = /obj/machinery/door/airlock/diamond/glass

/obj/structure/door_assembly/door_assembly_uranium
	name = "сборка уранового шлюза"
	icon = 'icons/obj/doors/airlocks/station/uranium.dmi'
	base_name = "урановый шлюз"
	airlock_type = /obj/machinery/door/airlock/uranium
	mineral = "uranium"
	glass_type = /obj/machinery/door/airlock/uranium/glass

/obj/structure/door_assembly/door_assembly_plasma
	name = "сборка плазменного шлюза"
	icon = 'icons/obj/doors/airlocks/station/plasma.dmi'
	base_name = "плазменный шлюз"
	airlock_type = /obj/machinery/door/airlock/plasma
	mineral = "plasma"
	glass_type = /obj/machinery/door/airlock/plasma/glass

/obj/structure/door_assembly/door_assembly_bananium
	name = "сборка бананиумового шлюза"
	desc = "Хонк."
	icon = 'icons/obj/doors/airlocks/station/bananium.dmi'
	base_name = "бананиумовый шлюз"
	airlock_type = /obj/machinery/door/airlock/bananium
	mineral = "bananium"
	glass_type = /obj/machinery/door/airlock/bananium/glass

/obj/structure/door_assembly/door_assembly_sandstone
	name = "сборка песчаникового шлюза"
	icon = 'icons/obj/doors/airlocks/station/sandstone.dmi'
	base_name = "песчаниковый шлюз"
	airlock_type = /obj/machinery/door/airlock/sandstone
	mineral = "sandstone"
	glass_type = /obj/machinery/door/airlock/sandstone/glass

/obj/structure/door_assembly/door_assembly_titanium
	name = "сборка титанового шлюза"
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	base_name = "шлюз шаттла"
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	glass_type = /obj/machinery/door/airlock/titanium/glass
	airlock_type = /obj/machinery/door/airlock/titanium
	mineral = "titanium"

/obj/structure/door_assembly/door_assembly_wood
	name = "сборка деревянного шлюза"
	icon = 'icons/obj/doors/airlocks/station/wood.dmi'
	base_name = "деревянный шлюз"
	airlock_type = /obj/machinery/door/airlock/wood
	mineral = "wood"
	glass_type = /obj/machinery/door/airlock/wood/glass

/obj/structure/door_assembly/door_assembly_bronze
	name = "сборка бронзового шлюза"
	icon = 'icons/obj/doors/airlocks/clockwork/pinion_airlock.dmi'
	base_name = "бронзовый шлюз"
	airlock_type = /obj/machinery/door/airlock/bronze
	noglass = TRUE
	material_type = /obj/item/stack/sheet/bronze
	custom_materials = list(/datum/material/bronze = SHEET_MATERIAL_AMOUNT * 4)

/obj/structure/door_assembly/door_assembly_bronze/seethru
	airlock_type = /obj/machinery/door/airlock/bronze/seethru

/obj/structure/door_assembly/door_assembly_material
	name = "сборка шлюза"
	airlock_type = /obj/machinery/door/airlock/material
	glass_type = /obj/machinery/door/airlock/material/glass
	greyscale_config = /datum/greyscale_config/material_airlock
	nomineral = TRUE
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_AFFECT_STATISTICS

/obj/structure/door_assembly/multi_tile/door_assembly_public
	name = "сборка большого общественного шлюза"
	base_name = "большой общественный шлюз"

/obj/structure/door_assembly/multi_tile/door_assembly_tram
	name = "сборка двери трамвая"
	icon = 'icons/obj/doors/airlocks/tram/tram.dmi'
	base_name = "дверь трамвая"
	overlays_file = 'icons/obj/doors/airlocks/tram/tram-overlays.dmi'
	glass_type = /obj/machinery/door/airlock/tram
	airlock_type = /obj/machinery/door/airlock/tram
	glass = FALSE
	noglass = TRUE
	mineral = "titanium"
	material_type = /obj/item/stack/sheet/mineral/titanium
	custom_materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 8)

/obj/structure/door_assembly/door_assembly_material/atom_deconstruct(disassembled = TRUE)
	var/turf/target_turf = get_turf(src)
	for(var/datum/material/material_datum as anything in custom_materials)
		var/material_count = FLOOR(custom_materials[material_datum] / SHEET_MATERIAL_AMOUNT, 1)
		if(!disassembled)
			material_count = rand(FLOOR(material_count/2, 1), material_count)
		new material_datum.sheet_type(target_turf, material_count)
	if(glass)
		if(disassembled)
			if(heat_proof_finished)
				new /obj/item/stack/sheet/rglass(target_turf)
			else
				new /obj/item/stack/sheet/glass(target_turf)
		else
			new /obj/item/shard(target_turf)

/obj/structure/door_assembly/door_assembly_material/finish_door()
	var/obj/machinery/door/airlock/door = ..()
	door.set_custom_materials(custom_materials)
	door.update_appearance()
	return door
