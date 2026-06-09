/client/verb/open_character_preferences()
	set category = "OOC"
	set name = "Открыть настройки персонажа"
	set desc = "Открыть настройки персонажа"

	if(!prefs)
		return
	prefs.current_window = PREFERENCE_TAB_CHARACTER_PREFERENCES
	prefs.update_static_data(usr)
	prefs.ui_interact(usr)

/client/verb/open_game_preferences()
	set category = "OOC"
	set name = "Открыть игровые настройки"
	set desc = "Открыть игровые настройки"

	if(!prefs)
		return
	prefs.current_window = PREFERENCE_TAB_GAME_PREFERENCES
	prefs.update_static_data(usr)
	prefs.ui_interact(usr)
