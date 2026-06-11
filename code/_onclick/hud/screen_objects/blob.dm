/atom/movable/screen/blob
	icon = 'icons/hud/blob.dmi'
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/blob/MouseEntered(location,control,params)
	. = ..()
	openToolTip(usr,src,params,title = name,content = desc, theme = "blob")

/atom/movable/screen/blob/MouseExited()
	closeToolTip(usr)

/atom/movable/screen/blob/jump_to_node
	name = "Перейти к узлу"
	desc = "Перемещает камеру к выбранному узлу блоба."
	icon_state = "ui_tonode"
	screen_loc = ui_inventory

/atom/movable/screen/blob/jump_to_node/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	blob.jump_to_node()

/atom/movable/screen/blob/jump_to_core
	name = "Перейти к ядру"
	desc = "Перемещает камеру к ядру вашего блоба."
	icon_state = "ui_tocore"
	screen_loc = ui_zonesel

/atom/movable/screen/blob/jump_to_core/MouseEntered(location,control,params)
	if(hud?.mymob && isovermind(hud.mymob))
		var/mob/eye/blob/B = hud.mymob
		if(!B.placed)
			name = "Разместить ядро блоба"
			desc = "Попытаться разместить ядро блоба в этой точке."
		else
			name = initial(name)
			desc = initial(desc)
	return ..()

/atom/movable/screen/blob/jump_to_core/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	if(!blob.placed)
		blob.place_blob_core(BLOB_NORMAL_PLACEMENT)
	blob.transport_core()

/atom/movable/screen/blob/blobbernaut
	// Name and description get given their proper values on Initialize()
	name = "Создать блоббернаута (ERROR)"
	desc = "Создаёт сильного разумного блоббернаута из фабричного блоба за (ERROR) ресурсов.<br>Использованный фабричный блоб станет хрупким и не сможет производить споры."
	icon_state = "ui_blobbernaut"
	screen_loc = ui_belt

/atom/movable/screen/blob/blobbernaut/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	name = "Создать блоббернаута ([BLOBMOB_BLOBBERNAUT_RESOURCE_COST])"
	desc = "Создаёт сильного разумного блоббернаута из фабричного блоба за [BLOBMOB_BLOBBERNAUT_RESOURCE_COST] ресурсов.<br>Использованный фабричный блоб станет хрупким и не сможет производить споры."

/atom/movable/screen/blob/blobbernaut/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	blob.create_blobbernaut()

/atom/movable/screen/blob/resource_blob
	// Name and description get given their proper values on Initialize()
	name = "Создать ресурсный блоб (ERROR)"
	desc = "Создаёт ресурсный блоб за ERROR ресурсов.<br>Ресурсные блобы дают ресурсы каждые несколько секунд."
	icon_state = "ui_resource"
	screen_loc = ui_back

/atom/movable/screen/blob/resource_blob/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	name = "Создать ресурсный блоб ([BLOB_STRUCTURE_RESOURCE_COST])"
	desc = "Создаёт ресурсный блоб за [BLOB_STRUCTURE_RESOURCE_COST] ресурсов.<br>Ресурсные блобы дают ресурсы каждые несколько секунд."

/atom/movable/screen/blob/resource_blob/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	blob.create_special(BLOB_STRUCTURE_RESOURCE_COST, /obj/structure/blob/special/resource, BLOB_RESOURCE_MIN_DISTANCE, TRUE)

/atom/movable/screen/blob/node_blob
	// Name and description get given their proper values on Initialize()
	name = "Создать узловой блоб (ERROR)"
	desc = "Создаёт узловой блоб за ERROR ресурсов.<br>Узловые блобы расширяются и активируют ближайшие ресурсные и фабричные блобы."
	icon_state = "ui_node"

/atom/movable/screen/blob/node_blob/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	name = "Создать узловой блоб ([BLOB_STRUCTURE_NODE_COST])"
	desc = "Создаёт узловой блоб за [BLOB_STRUCTURE_NODE_COST] ресурсов.<br>Узловые блобы расширяются и активируют ближайшие ресурсные и фабричные блобы."

/atom/movable/screen/blob/node_blob/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	blob.create_special(BLOB_STRUCTURE_NODE_COST, /obj/structure/blob/special/node, BLOB_NODE_MIN_DISTANCE, FALSE)

/atom/movable/screen/blob/factory_blob
	// Name and description get given their proper values on Initialize()
	name = "Создать фабричный блоб (ERROR)"
	desc = "Создаёт фабричный блоб за ERROR ресурсов.<br>Фабричные блобы производят споры каждые несколько секунд."
	icon_state = "ui_factory"

/atom/movable/screen/blob/factory_blob/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	name = "Создать фабричный блоб ([BLOB_STRUCTURE_FACTORY_COST])"
	desc = "Создаёт фабричный блоб за [BLOB_STRUCTURE_FACTORY_COST] ресурсов.<br>Фабричные блобы производят споры каждые несколько секунд."

/atom/movable/screen/blob/factory_blob/Click()
	if(!isovermind(usr))
		return FALSE
	var/mob/eye/blob/blob = usr
	blob.create_special(BLOB_STRUCTURE_FACTORY_COST, /obj/structure/blob/special/factory, BLOB_FACTORY_MIN_DISTANCE, TRUE)

/atom/movable/screen/blob/readapt_strain
	// Description gets given its proper values on Initialize()
	name = "Переадаптировать штамм"
	desc = "Позволяет выбрать новый штамм из ERROR случайных вариантов за ERROR ресурсов."
	icon_state = "ui_chemswap"
	screen_loc = ui_storage1

/atom/movable/screen/blob/readapt_strain/MouseEntered(location,control,params)
	if(hud?.mymob && isovermind(hud.mymob))
		var/mob/eye/blob/B = hud.mymob
		if(B.free_strain_rerolls)
			name = "[initial(name)] (БЕСПЛАТНО)"
			desc = "Бесплатно случайно меняет ваш штамм."
		else
			name = "[initial(name)] ([BLOB_POWER_REROLL_COST])"
			desc = "Позволяет выбрать новый штамм из [BLOB_POWER_REROLL_CHOICES] случайных вариантов за [BLOB_POWER_REROLL_COST] ресурсов."
	return ..()

/atom/movable/screen/blob/readapt_strain/Click()
	if(isovermind(usr))
		var/mob/eye/blob/B = usr
		B.strain_reroll()

/atom/movable/screen/blob/relocate_core
	// Name and description get given their proper values on Initialize()
	name = "Переместить ядро (ERROR)"
	desc = "Меняет местами узел и ваше ядро за ERROR ресурсов."
	icon_state = "ui_swap"
	screen_loc = ui_storage2

/atom/movable/screen/blob/relocate_core/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	name = "Переместить ядро ([BLOB_POWER_RELOCATE_COST])"
	desc = "Меняет местами узел и ваше ядро за [BLOB_POWER_RELOCATE_COST] ресурсов."

/atom/movable/screen/blob/relocate_core/Click()
	if(isovermind(usr))
		var/mob/eye/blob/B = usr
		B.relocate_core()

/atom/movable/screen/blob/blob_power
	name = "blob power"
	icon_state = "block"
	screen_loc = ui_health
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = ABOVE_HUD_PLANE
