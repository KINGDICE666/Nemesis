/obj/item/storage/toolbox/medical
	name = "медицинский ящик для инструментов"
	desc = "Ящик для инструментов, выкрашенный в мягкий белый и светло-синий. Это становится нелепым."
	icon_state = "medical"
	inhand_icon_state = "toolbox_medical"
	attack_verb_continuous = list("лечит", "оперирует", "обрабатывает", "обрабатывает раны")
	attack_verb_simple = list("лечить", "оперировать", "обработать", "обработать раны")
	w_class = WEIGHT_CLASS_BULKY
	material_flags = NONE
	force = 5 // its for healing
	wound_bonus = 25 // wounds are medical right?
	/// Tray we steal the og contents from.
	var/obj/item/surgery_tray/tray_type = /obj/item/surgery_tray

/obj/item/storage/toolbox/medical/PopulateContents()
	atom_storage.max_slots = 0
	atom_storage.max_total_storage = 0

	var/atom/fake_tray = new tray_type(null)
	for(var/obj/item/tool in fake_tray)
		tool.forceMove(src)
		atom_storage.max_slots += 1
		atom_storage.max_total_storage += tool.w_class

	qdel(fake_tray)

/obj/item/storage/toolbox/medical/full
	tray_type = /obj/item/surgery_tray/full

/obj/item/storage/toolbox/medical/coroner
	name = "ящик коронера"
	desc = "Ящик для инструментов, выкрашенный в мягкий белый и тёмно-серый. Это уже за гранью нелепого."
	icon_state = "coroner"
	inhand_icon_state = "toolbox_coroner"
	attack_verb_continuous = list("рассекает", "вскрывает", "коронерит")
	attack_verb_simple = list("рассечь", "вскрыть", "коронерить")
	w_class = WEIGHT_CLASS_BULKY
	material_flags = NONE
	force = 17 // it's not for healing
	tray_type = /obj/item/surgery_tray/full/morgue

/obj/item/storage/toolbox/medical/coroner/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/bane, affected_biotypes = MOB_UNDEAD, damage_multiplier = 2) //Just in case one of the tennants get uppity
