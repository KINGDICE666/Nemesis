/datum/job
	/// Russian display name. Internal `title` stays English for configs, bans, spawn landmarks and DB keys.
	var/ru_title
	var/ru_description
	var/ru_supervisors

/datum/job/proc/get_display_title()
	return ru_title || title

/datum/job/proc/get_display_description()
	return ru_description || description

/datum/job/proc/get_display_supervisors()
	return ru_supervisors || supervisors

/datum/job_department
	var/ru_department_name

/datum/job_department/proc/get_display_name()
	return ru_department_name || department_name

/datum/job_department/assistant
	ru_department_name = "Ассистенты"

/datum/job_department/captain
	ru_department_name = "Капитан"

/datum/job_department/command
	ru_department_name = "Командование"

/datum/job_department/security
	ru_department_name = "Служба безопасности"

/datum/job_department/engineering
	ru_department_name = "Инженерный отдел"

/datum/job_department/medical
	ru_department_name = "Медицинский отдел"

/datum/job_department/science
	ru_department_name = "Научный отдел"

/datum/job_department/cargo
	ru_department_name = "Снабжение"

/datum/job_department/service
	ru_department_name = "Сервис"

/datum/job_department/silicon
	ru_department_name = "Синтетики"

/datum/job_department/undefined
	ru_department_name = "Без отдела"

/datum/job/assistant
	ru_title = "Ассистент"
	ru_description = "Освойтесь на станции, помогайте экипажу и попросите главу персонала выдать вам работу."
	ru_supervisors = "абсолютно всем"

/datum/job/prisoner
	ru_title = "Заключенный"
	ru_description = "Займите себя чем-нибудь в пермабриге."
	ru_supervisors = "сотрудникам службы безопасности"

/datum/job/captain
	ru_title = "Капитан"
	ru_description = "Отвечайте за станцию, руководите главами отделов и поддерживайте работу экипажа."
	ru_supervisors = "представителям Nanotrasen и Космическому Закону"

/datum/job/head_of_personnel
	ru_title = "Глава персонала"
	ru_description = "Настраивайте доступ на ID-картах, управляйте сервисным отделом и помогайте экипажу с назначениями."
	ru_supervisors = "капитану"

/datum/job/head_of_security
	ru_title = "Глава службы безопасности"
	ru_description = "Координируйте службу безопасности, следите за порядком и защищайте станцию."
	ru_supervisors = "капитану"

/datum/job/research_director
	ru_title = "Научный руководитель"
	ru_description = "Координируйте ученых, робототехников и генетиков, развивайте исследования станции."
	ru_supervisors = "капитану"

/datum/job/chief_engineer
	ru_title = "Старший инженер"
	ru_description = "Руководите инженерным отделом, следите за энергией, атмосферой и целостностью станции."
	ru_supervisors = "капитану"

/datum/job/chief_medical_officer
	ru_title = "Главный врач"
	ru_description = "Координируйте врачей и медицинский отдел, чтобы экипаж оставался живым."
	ru_supervisors = "капитану"

/datum/job/bridge_assistant
	ru_title = "Помощник мостика"
	ru_description = "Следите за мостиком, командными консолями и помогайте старшим офицерам."
	ru_supervisors = "капитану и главам отделов вне вопросов мостика"

/datum/job/veteran_advisor
	ru_title = "Ветеран службы безопасности"
	ru_description = "Консультируйте главу службы безопасности и капитана, обучайте зеленых офицеров."
	ru_supervisors = "главе службы безопасности"

/datum/job/ai
	ru_title = "ИИ"
	ru_description = "Помогайте экипажу, следуйте законам и координируйте киборгов."
	ru_supervisors = "вашим законам"

/datum/job/cyborg
	ru_title = "Киборг"
	ru_description = "Помогайте экипажу, следуйте законам и слушайтесь ИИ."
	ru_supervisors = "вашим законам и ИИ"

/datum/job/human_ai
	ru_title = "Большой Брат"
	ru_description = "Помогайте экипажу, открывайте шлюзы, следуйте набору законов и координируйте киборгов."
	ru_supervisors = "капитану, научному руководителю и вашему набору законов"

/datum/job/warden
	ru_title = "Смотритель"
	ru_description = "Следите за бригом и тюремным крылом, выпускайте заключенных, когда срок истек."
	ru_supervisors = "главе службы безопасности"

/datum/job/detective
	ru_title = "Детектив"
	ru_description = "Расследуйте преступления, собирайте улики и проводите допросы."
	ru_supervisors = "главе службы безопасности"

/datum/job/security_officer
	ru_title = "Офицер службы безопасности"
	ru_description = "Патрулируйте станцию, реагируйте на угрозы и обеспечивайте соблюдение закона."
	ru_supervisors = "главе службы безопасности"

/datum/job/station_engineer
	ru_title = "Инженер станции"
	ru_description = "Ремонтируйте станцию, обслуживайте энергосеть и помогайте с инженерными задачами."
	ru_supervisors = "старшему инженеру"

/datum/job/atmospheric_technician
	ru_title = "Атмосферный техник"
	ru_description = "Поддерживайте пригодную атмосферу, заправляйте кислородные баллоны, тушите пожары и очищайте воздух."
	ru_supervisors = "старшему инженеру"

/datum/job/coroner
	ru_title = "Коронер"
	ru_description = "Проводите вскрытия, работайте с телами и помогайте медицинскому отделу."
	ru_supervisors = "главе персонала и главному врачу"

/datum/job/medical_doctor
	ru_title = "Врач"
	ru_description = "Лечите раненых, спасайте умирающих и поддерживайте здоровье экипажа."
	ru_supervisors = "главному врачу"

/datum/job/paramedic
	ru_title = "Парамедик"
	ru_description = "Быстро реагируйте на вызовы, эвакуируйте раненых и стабилизируйте пациентов."
	ru_supervisors = "главному врачу"

/datum/job/chemist
	ru_title = "Химик"
	ru_description = "Снабжайте врачей реагентами, готовьте лекарства и экспериментируйте с химией."
	ru_supervisors = "главному врачу"

/datum/job/scientist
	ru_title = "Ученый"
	ru_description = "Проводите исследования, развивайте технологии и изучайте аномалии."
	ru_supervisors = "научному руководителю"

/datum/job/roboticist
	ru_title = "Робототехник"
	ru_description = "Создавайте киборгов, мехов и полезные машины для станции."
	ru_supervisors = "научному руководителю"

/datum/job/geneticist
	ru_title = "Генетик"
	ru_description = "Изменяйте геномы, превращайте обезьян в людей и создавайте резервные копии ДНК."
	ru_supervisors = "научному руководителю"

/datum/job/quartermaster
	ru_title = "Квартирмейстер"
	ru_description = "Руководите снабжением, заказами и шахтерами."
	ru_supervisors = "главе персонала"

/datum/job/cargo_technician
	ru_title = "Грузчик"
	ru_description = "Доставляйте заказы отделам, работайте с грузами и поддерживайте склад."
	ru_supervisors = "квартирмейстеру"

/datum/job/cargo_gorilla
	ru_title = "Горилла снабжения"
	ru_description = "Помогайте отделу снабжения переносить грузы и утилизировать лишние фрукты."
	ru_supervisors = "квартирмейстеру"

/datum/job/shaft_miner
	ru_title = "Шахтер"
	ru_description = "Добывайте руду, исследуйте Лаваленд и привозите ценные материалы."
	ru_supervisors = "квартирмейстеру"

/datum/job/bartender
	ru_title = "Бармен"
	ru_description = "Подавайте алкоголь, смешивайте напитки и держите экипаж веселым."
	ru_supervisors = "главе персонала"

/datum/job/botanist
	ru_title = "Ботаник"
	ru_description = "Выращивайте растения для кухни, медицины и отдыха."
	ru_supervisors = "главе персонала"

/datum/job/cook
	ru_title = "Повар"
	ru_description = "Готовьте еду, разделывайте мясо и кормите экипаж."
	ru_supervisors = "главе персонала"

/datum/job/janitor
	ru_title = "Уборщик"
	ru_description = "Поддерживайте чистоту станции и устраняйте неприятные последствия чужих решений."
	ru_supervisors = "главе персонала"

/datum/job/clown
	ru_title = "Клоун"
	ru_description = "Развлекайте экипаж, шутите плохо и ищите бананиум. ХОНК!"
	ru_supervisors = "главе персонала"

/datum/job/mime
	ru_title = "Мим"
	ru_description = "Развлекайте экипаж молча и храните обет тишины."
	ru_supervisors = "главе персонала"

/datum/job/curator
	ru_title = "Куратор"
	ru_description = "Читайте и пишите книги, пополняйте библиотеку и сохраняйте культуру станции."
	ru_supervisors = "главе персонала"

/datum/job/lawyer
	ru_title = "Юрист"
	ru_description = "Защищайте заключенных, составляйте контракты и следите за процедурой."
	ru_supervisors = "главе персонала"

/datum/job/chaplain
	ru_title = "Священник"
	ru_description = "Проводите службы и похороны, кремируйте тела и несите веру экипажу."
	ru_supervisors = "главе персонала"

/datum/job/psychologist
	ru_title = "Психолог"
	ru_description = "Помогайте экипажу справляться со стрессом и разговаривайте с теми, кому это нужно."
	ru_supervisors = "главному врачу"

/datum/job/pun_pun
	ru_title = "Пун-Пун"
	ru_description = "Помогайте сервисному отделу напитками, едой и развлечением экипажа."
	ru_supervisors = "бармену"
