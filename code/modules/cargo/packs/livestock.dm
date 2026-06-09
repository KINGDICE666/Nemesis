/datum/supply_pack/critter
	group = "Живность"
	crate_type = /obj/structure/closet/crate/critter

/datum/supply_pack/critter/parrot
	name = "Ящик птиц"
	desc = "Содержит пять птиц-экспертов по телекоммуникациям."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/parrot)
	crate_name = "ящик попугаев"

/datum/supply_pack/critter/parrot/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	for(var/i in 1 to 4)
		new /mob/living/basic/parrot(.)

/datum/supply_pack/critter/butterfly
	name = "Ящик бабочек"
	desc = "Не самое опасное насекомое, зато выглядит лучше, чем, скажем, мухи или тараканы."//is that a motherfucking worm reference
	order_flags = ORDER_CONTRABAND
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/mob/living/basic/butterfly)
	crate_name = "ящик энтомологических образцов"

/datum/supply_pack/critter/butterfly/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/basic/butterfly(.)

/datum/supply_pack/critter/cat
	name = "Ящик кошки"
	desc = "Кошка говорит мяу! Поставляется с ошейником и хорошей кошачьей игрушкой! Чизбургер не включён."//i can't believe im making this reference
	cost = CARGO_CRATE_VALUE * 4 //Cats are worth as much as corgis.
	contains = list(
		/mob/living/basic/pet/cat,
		/obj/item/clothing/neck/petcollar,
		/obj/item/toy/cattoy,
	)
	crate_name = "ящик кошки"

/datum/supply_pack/critter/cat/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	if(!prob(50))
		return
	var/mob/living/basic/pet/cat/delete_cat = locate() in .
	if(isnull(delete_cat))
		return
	qdel(delete_cat)
	new /mob/living/basic/pet/cat/_proc(.)

/datum/supply_pack/critter/chick
	name = "Ящик цыплёнка"
	desc = "Цыплёнок говорит ко-ко!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/mob/living/basic/chick)
	crate_name = "ящик цыплёнка"

/datum/supply_pack/critter/corgi
	name = "Ящик корги"
	desc = "Тысячи учёных считают корги оптимальной породой собак, а этот корги - лишь \
		одна собака из миллионов благородной родословной Иана. Поставляется с милым ошейником!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/pet/dog/corgi,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "ящик корги"

/datum/supply_pack/critter/corgi/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	if(prob(50))
		var/mob/living/basic/pet/dog/corgi/D = locate() in .
		if(D.gender == FEMALE)
			qdel(D)
			new /mob/living/basic/pet/dog/corgi/lisa(.)

/datum/supply_pack/critter/cow
	name = "Ящик коровы"
	desc = "Корова говорит му! Содержит одну корову."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/mob/living/basic/cow)
	crate_name = "ящик коровы"

/datum/supply_pack/critter/sheep
	name = "Ящик овцы"
	desc = "Овца говорит БЕЕЕ! Содержит одну овцу."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/mob/living/basic/sheep)
	crate_name = "ящик овцы"

/datum/supply_pack/critter/pig
	name = "Ящик свиньи"
	desc = "Свинья говорит хрю! Содержит одну свинью."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/mob/living/basic/pig)
	crate_name = "ящик свиньи"

/datum/supply_pack/critter/pony
	name = "Ящик пони"
	desc = "Пони, ура! Только один."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/mob/living/basic/pony)
	crate_name = "ящик пони"

/datum/supply_pack/critter/crab
	name = "Крабовая ракета"
	desc = "КРААААААБОВАЯ РАКЕТА. КРАБОВАЯ РАКЕТА. КРАБОВАЯ РАКЕТА. КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ \
		КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ \
		КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ \
		КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ РАКЕТА. КРАФТ. РАКЕТА. КУПИ. КРАФТ РАКЕТА. КРАБОООРАКЕТА. \
		КРАБООООРАКЕТА. КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ КРАБ РАААААААААААААААК \
		ЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕТАААААААААААААААААА АААААААААААА. КРАБОВАЯ РАКЕТА. КРАААБ \
		РАКЕЕЕЕЕЕЕЕЕЕЕЕЕТАА КРАБ КРАБ КРАБРАКЕТА КРАБ РАКЕЕЕЕТА."//fun fact: i actually spent like 10 minutes and transcribed the entire video.
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/mob/living/basic/crab)
	crate_name = "смотрите, сэр, бесплатные крабы"
	order_flags = ORDER_POD_ONLY

/datum/supply_pack/critter/crab/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	for(var/i in 1 to 49)
		new /mob/living/basic/crab(.)

/datum/supply_pack/critter/corgis/exotic
	name = "Ящик экзотического корги"
	desc = "Корги, достойный короля: этот корги имеет уникальный окрас, подчёркивающий его превосходство. \
		Поставляется с милым ошейником!"
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/mob/living/basic/pet/dog/corgi/exoticcorgi,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "ящик экзотического корги"

/datum/supply_pack/critter/fox
	name = "Ящик лисы"
	desc = "Лиса говорит...? Содержит одну лису. Поставляется с ошейником!"//what does the fox say
	cost = CARGO_CRATE_VALUE * 4
	contains = list(
		/mob/living/basic/pet/fox,
		/obj/item/clothing/neck/petcollar,
	)
	crate_name = "ящик лисы"

/datum/supply_pack/critter/goat
	name = "Ящик козы"
	desc = "Коза говорит бе! Содержит одну козу. Гарантия аннулируется при использовании в качестве замены Пита."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/mob/living/basic/goat)
	crate_name = "ящик козы"

/datum/supply_pack/critter/rabbit
	name = "Ящик кролика"
	desc = "Какие звуки вообще издают кролики? Содержит одного кролика."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/mob/living/basic/rabbit)
	crate_name = "ящик кролика"

/datum/supply_pack/critter/mothroach
	name = "Ящик мольтаракана"
	desc = "Положите мольтаракана на голову и узнайте, как выглядит настоящая милота. \
		Содержит одного мольтаракана."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/mob/living/basic/mothroach)
	crate_name = "ящик мольтаракана"

/datum/supply_pack/critter/monkey
	name = "Ящик кубиков обезьян"
	desc = "Хватит обезьянничать! Содержит семь кубиков обезьян. Просто добавь воды!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list (/obj/item/storage/box/monkeycubes)
	crate_type = /obj/structure/closet/crate
	crate_name = "ящик кубиков обезьян"

/datum/supply_pack/critter/pug
	name = "Ящик мопса"
	desc = "Как обычная собака, но... сплющенная. Содержит одного мопса. Поставляется с хорошим ошейником!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/pet/dog/pug,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "ящик мопса"

/datum/supply_pack/critter/bullterrier
	name = "Ящик бультерьера"
	desc = "Как обычная собака, но с головой в форме яйца. Содержит одного бультерьера. \
		Поставляется с хорошим ошейником!"
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/mob/living/basic/pet/dog/bullterrier,
					/obj/item/clothing/neck/petcollar,
				)
	crate_name = "ящик бультерьера"

/datum/supply_pack/critter/snake
	name = "Ящик змей"
	desc = "Устали от этих ЧЁРТОВЫХ змей на этой ЧЁРТОВОЙ космической станции? \
		Тогда этот ящик не для вас. Содержит трёх ядовитых змей."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/mob/living/basic/snake = 3)
	crate_name = "ящик змей"

/datum/supply_pack/critter/amphibians
	name = "Ящик друзей-амфибий"
	desc = "Два отвратительно милых склизких друга. Цитологи их обожают! \
		Содержит одну лягушку и одного аксолотля. Предупреждение: лягушка может обладать галлюциногенными свойствами."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(
		/mob/living/basic/axolotl,
		/obj/effect/spawner/random/frog,
	)
	crate_name = "ящик амфибий"

/datum/supply_pack/critter/lizard
	name = "Ящик ящерицы"
	desc = "Шшш! Содержит дружелюбную ящерицу. Не путать с ящерочеловеком."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/mob/living/basic/lizard)
	crate_name = "ящик ящерицы"

/datum/supply_pack/critter/garden_gnome
	name = "Ящик садовых гномов"
	desc = "Соберите их всех для своего сада. Поставляется с тремя!"
	order_flags = ORDER_EMAG_ONLY
	cost = CARGO_CRATE_VALUE * 15
	contains = list(/mob/living/basic/garden_gnome)
	crate_name = "ящик садовых гномов"
	discountable = SUPPLY_PACK_RARE_DISCOUNTABLE

/datum/supply_pack/critter/garden_gnome/generate(atom/A, datum/bank_account/paying_account, crate_override)
	. = ..()
	for(var/i in 1 to 2)
		new /mob/living/basic/garden_gnome(.)

/datum/supply_pack/critter/fish
	test_ignored = TRUE // However, we should be wary of how possible it is to get more valuable fish out of this on average, depending on sample size.

/datum/supply_pack/critter/fish/aquarium_fish
	name = "Кейс аквариумных рыб"
	desc = "Набор аквариумных рыб, вручную выбранный обезьянами из нашей коллекции. Содержит две случайные рыбы."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/fish_case/random = 2)
	crate_name = "ящик аквариумных рыб"

/datum/supply_pack/critter/fish/freshwater_fish
	name = "Кейс пресноводных рыб"
	desc = "Аквариумные рыбы, с которых смыли большую часть грязи."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/fish_case/random/freshwater = 2)
	crate_name = "ящик пресноводных рыб"

/datum/supply_pack/critter/fish/saltwater_fish
	name = "Кейс морских рыб"
	desc = "Аквариумные рыбы, наполняющие комнату запахом соли."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/fish_case/random/saltwater = 2)
	crate_name = "ящик морских рыб"

/datum/supply_pack/critter/fish/tiziran_fish
	name = "Кейс тизирских рыб"
	desc = "Тизирские морские рыбы, импортированные из моря Загос."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/fish_case/tiziran = 2)
	crate_name = "ящик тизирских рыб"

/datum/supply_pack/critter/turtle
	name = "Ящик черепах"
	desc = "Милые флора-черепахи, излучающие хорошие вибрации для ближайших растений!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/mob/living/basic/turtle)
	crate_name = "ящик флора-черепах"
