/*
 * Photo album
 */
/obj/item/storage/photo_album
	name = "фотоальбом"
	desc = "Большая книга для хранения фотографий и памятных вещей."
	icon = 'icons/obj/art/camera.dmi'
	icon_state = "album"
	inhand_icon_state = "album"
	lefthand_file = 'icons/mob/inhands/items/books_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/books_righthand.dmi'
	storage_type = /datum/storage/photo_album
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	var/persistence_id

/obj/item/storage/photo_album/Initialize(mapload)
	. = ..()
	if (!SSpersistence.initialized)
		LAZYADD(SSpersistence.queued_photo_albums, src)

/obj/item/storage/photo_album/Destroy()
	LAZYREMOVE(SSpersistence.queued_photo_albums, src)
	return ..()

/obj/item/storage/photo_album/proc/get_picture_id_list()
	var/list/L = list()
	for(var/i in contents)
		if(istype(i, /obj/item/photo))
			L += i
	if(!L.len)
		return
	. = list()
	for(var/i in L)
		var/obj/item/photo/P = i
		if(!istype(P.picture))
			continue
		. |= P.picture.id

//Manual loading, DO NOT USE FOR HARDCODED/MAPPED IN ALBUMS. This is for if an album needs to be loaded mid-round from an ID.
/obj/item/storage/photo_album/proc/persistence_load()
	var/list/data = SSpersistence.photo_albums_database.get_key(persistence_id)
	if (!isnull(data))
		populate_from_id_list(data)

/obj/item/storage/photo_album/proc/populate_from_id_list(list/ids)
	var/list/current_ids = get_picture_id_list()
	for(var/i in ids)
		if(i in current_ids)
			continue
		var/obj/item/photo/old/P = load_photo_from_disk(i)
		if(istype(P))
			if(!atom_storage?.attempt_insert(P, override = TRUE))
				qdel(P)

/datum/storage/photo_album
	max_total_storage = 42
	max_slots = 21

/datum/storage/photo_album/New(
	atom/parent,
	max_slots,
	max_specific_storage,
	max_total_storage,
)
	. = ..()
	set_holdable(/obj/item/photo)

/datum/storage/photo_album/proc/save_everything()
	var/obj/item/storage/photo_album/album = parent
	ASSERT(istype(album))
	SSpersistence.photo_albums_database.set_key(album.persistence_id, album.get_picture_id_list())

/datum/storage/photo_album/handle_enter(datum/source, obj/item/arrived)
	. = ..()
	save_everything()

/datum/storage/photo_album/handle_exit(datum/source, obj/item/gone)
	. = ..()
	save_everything()

/obj/item/storage/photo_album/hos
	name = "фотоальбом (глава службы безопасности)"
	icon_state = "album_blue"
	persistence_id = "HoS"

/obj/item/storage/photo_album/rd
	name = "фотоальбом (научный руководитель)"
	icon_state = "album_blue"
	persistence_id = "RD"

/obj/item/storage/photo_album/hop
	name = "фотоальбом (глава персонала)"
	icon_state = "album_blue"
	persistence_id = "HoP"

/obj/item/storage/photo_album/captain
	name = "фотоальбом (капитан)"
	icon_state = "album_blue"
	persistence_id = "Captain"

/obj/item/storage/photo_album/cmo
	name = "фотоальбом (главный врач)"
	icon_state = "album_blue"
	persistence_id = "CMO"

/obj/item/storage/photo_album/qm
	name = "фотоальбом (квартирмейстер)"
	icon_state = "album_blue"
	persistence_id = "QM"

/obj/item/storage/photo_album/ce
	name = "фотоальбом (старший инженер)"
	icon_state = "album_blue"
	persistence_id = "CE"

/obj/item/storage/photo_album/bar
	name = "фотоальбом (бар)"
	icon_state = "album_blue"
	persistence_id = "bar"

/obj/item/storage/photo_album/syndicate
	name = "фотоальбом (Синдикат)"
	icon_state = "album_red"
	persistence_id = "syndicate"

/obj/item/storage/photo_album/library
	name = "фотоальбом (библиотека)"
	icon_state = "album_blue"
	persistence_id = "library"

/obj/item/storage/photo_album/chapel
	name = "фотоальбом (церковь)"
	icon_state = "album_blue"
	persistence_id = "chapel"

/obj/item/storage/photo_album/listeningstation
	name = "фотоальбом (пункт прослушки)"
	icon_state = "album_red"
	persistence_id = "listeningstation"

/obj/item/storage/photo_album/icemoonlisteningstation
	name = "фотоальбом (аванпост ледяной луны)"
	icon_state = "album_red"
	persistence_id = "icemooncomms"

/obj/item/storage/photo_album/prison
	name = "фотоальбом (тюрьма)"
	icon_state = "album_blue"
	persistence_id = "prison"

/obj/item/storage/photo_album/personal
	icon_state = "album_green"

/obj/item/storage/photo_album/hall_of_fame
	name = "фотоальбом (зал славы)"
	icon_state = "album_red"
	persistence_id = "hall_of_fame"
