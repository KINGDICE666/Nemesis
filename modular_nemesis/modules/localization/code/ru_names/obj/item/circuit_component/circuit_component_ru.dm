// TODO: figure the good way to handle names like these

/obj/item/circuit_component/Initialize(mapload)
	. = ..()
	if(name == COMPONENT_DEFAULT_NAME)
		name = "[LOWER_TEXT(display_name)] [COMPONENT_DEFAULT_NAME]"
	populate_options()
	populate_ports()
	if((circuit_flags & CIRCUIT_FLAG_INPUT_SIGNAL) && !trigger_input)
		trigger_input = add_input_port("Trigger", PORT_TYPE_SIGNAL, order = 2)
	if((circuit_flags & CIRCUIT_FLAG_OUTPUT_SIGNAL) && !trigger_output)
		trigger_output = add_output_port("Triggered", PORT_TYPE_SIGNAL, order = 2)
	update_ui_alerts()



/obj/item/circuit_component/advanced_camera


/obj/item/circuit_component/advanced_camera,


/obj/item/circuit_component/advanced_camera_intercept


/obj/item/circuit_component/air_alarm


/obj/item/circuit_component/air_alarm/duplicate


/obj/item/circuit_component/air_alarm_general


/obj/item/circuit_component/air_alarm_general,


/obj/item/circuit_component/air_alarm_scrubbers


/obj/item/circuit_component/air_alarm_scrubbers/duplicate


/obj/item/circuit_component/air_alarm_vents


/obj/item/circuit_component/air_alarm_vents/duplicate


/obj/item/circuit_component/airlock


/obj/item/circuit_component/airlock_access_event


/obj/item/circuit_component/animation_step


/obj/item/circuit_component/arctan2


/obj/item/circuit_component/arithmetic


/obj/item/circuit_component/arrest_console_arrest


/obj/item/circuit_component/arrest_console_data


/obj/item/circuit_component/arrest_console_data,


/obj/item/circuit_component/assembly_input


/obj/item/circuit_component/assembly_output


/obj/item/circuit_component/assoc_literal


/obj/item/circuit_component/atmos_meter


/obj/item/circuit_component/atmos_meter,


/obj/item/circuit_component/atmos_pump


/obj/item/circuit_component/atmos_temperature_pump


/obj/item/circuit_component/atmos_volume_pump


/obj/item/circuit_component/atmos_volume_pump,


/obj/item/circuit_component/bci_core


/obj/item/circuit_component/begin_animation


/obj/item/circuit_component/binary_conversion


/obj/item/circuit_component/bitflag_helper


/obj/item/circuit_component/bluespace_launchpad


/obj/item/circuit_component/bluespace_launchpad/console


/obj/item/circuit_component/bot


/obj/item/circuit_component/bot_circuit


/obj/item/circuit_component/camera


/obj/item/circuit_component/clock


/obj/item/circuit_component/compact_remote


/obj/item/circuit_component/compare


/obj/item/circuit_component/compare/access


/obj/item/circuit_component/compare/comparison


/obj/item/circuit_component/compare/contains


/obj/item/circuit_component/compare/health_state


/obj/item/circuit_component/compare/logic


/obj/item/circuit_component/compare/toggle


/obj/item/circuit_component/compare/typecheck


/obj/item/circuit_component/concat


/obj/item/circuit_component/concat_list


/obj/item/circuit_component/controller


/obj/item/circuit_component/conveyor_switch


/obj/item/circuit_component/counter_overlay


/obj/item/circuit_component/decimal_conversion


/obj/item/circuit_component/delay


/obj/item/circuit_component/digital_valve


/obj/item/circuit_component/direction


/obj/item/circuit_component/dispenser_bot


/obj/item/circuit_component/emitter


/obj/item/circuit_component/equipment_action


/obj/item/circuit_component/filter_adder


/obj/item/circuit_component/filter_helper


/obj/item/circuit_component/filter_list


/obj/item/circuit_component/filter_remover


/obj/item/circuit_component/firealarm


/obj/item/circuit_component/foreach


/obj/item/circuit_component/format


/obj/item/circuit_component/format/assoc


/obj/item/circuit_component/get_column


/obj/item/circuit_component/get_variable


/obj/item/circuit_component/gps


/obj/item/circuit_component/health


/obj/item/circuit_component/hear


/obj/item/circuit_component/holo_signboard


/obj/item/circuit_component/holo_signboard,


/obj/item/circuit_component/hydroponics


/obj/item/circuit_component/id_access_reader


/obj/item/circuit_component/id_getter


/obj/item/circuit_component/id_info_reader


/obj/item/circuit_component/implant_core


/obj/item/circuit_component/index


/obj/item/circuit_component/index/assoc_string


/obj/item/circuit_component/index_table


/obj/item/circuit_component/input_request


/obj/item/circuit_component/install_detector


/obj/item/circuit_component/keyboard_shell


/obj/item/circuit_component/laserpointer


/obj/item/circuit_component/length


/obj/item/circuit_component/light


/obj/item/circuit_component/light_switch


/obj/item/circuit_component/list_literal


/obj/item/circuit_component/list_literal/nfc_send


/obj/item/circuit_component/list_literal/ntnet_send


/obj/item/circuit_component/list_literal/wirenet_send


/obj/item/circuit_component/list_pick


/obj/item/circuit_component/list_pick/assoc


/obj/item/circuit_component/listin


/obj/item/circuit_component/matscanner


/obj/item/circuit_component/medical_console_data


/obj/item/circuit_component/mmi


/obj/item/circuit_component/mod_adapter_core


/obj/item/circuit_component/mod_program


/obj/item/circuit_component/mod_program/borg_monitor


/obj/item/circuit_component/mod_program/borg_monitor/syndie


/obj/item/circuit_component/mod_program/camera


/obj/item/circuit_component/mod_program/messenger


/obj/item/circuit_component/mod_program/modsuit_control


/obj/item/circuit_component/mod_program/notepad


/obj/item/circuit_component/mod_program/nt_pay


/obj/item/circuit_component/mod_program/ntnetmonitor


/obj/item/circuit_component/mod_program/radar


/obj/item/circuit_component/mod_program/radar/janitor


/obj/item/circuit_component/mod_program/radar/medical


/obj/item/circuit_component/mod_program/radar/nukie


/obj/item/circuit_component/mod_program/signaler


/obj/item/circuit_component/mod_program/spectre_meter


/obj/item/circuit_component/mod_program/status


/obj/item/circuit_component/modpc


/obj/item/circuit_component/module


/obj/item/circuit_component/module_input


/obj/item/circuit_component/module_output


/obj/item/circuit_component/money_bot


/obj/item/circuit_component/money_dispenser


/obj/item/circuit_component/nfc_receive


/obj/item/circuit_component/nfc_send


/obj/item/circuit_component/not


/obj/item/circuit_component/ntnet_receive


/obj/item/circuit_component/ntnet_send


/obj/item/circuit_component/object_overlay


/obj/item/circuit_component/object_overlay/bar


/obj/item/circuit_component/pathfind


/obj/item/circuit_component/pinpointer


/obj/item/circuit_component/pressuresensor


/obj/item/circuit_component/proccall


/obj/item/circuit_component/pull


/obj/item/circuit_component/quantumpad


/obj/item/circuit_component/radio


/obj/item/circuit_component/random


/obj/item/circuit_component/reagent_injector


/obj/item/circuit_component/reagentscanner


/obj/item/circuit_component/reflector


/obj/item/circuit_component/remotecam


/obj/item/circuit_component/remotecam/airlock


/obj/item/circuit_component/remotecam/bci


/obj/item/circuit_component/remotecam/drone


/obj/item/circuit_component/remotecam/polaroid


/obj/item/circuit_component/router


/obj/item/circuit_component/router/multiplexer


/obj/item/circuit_component/save_shell


/obj/item/circuit_component/scanner_gate


/obj/item/circuit_component/sdql_operation


/obj/item/circuit_component/select


/obj/item/circuit_component/self


/obj/item/circuit_component/set_variable


/obj/item/circuit_component/signal_handler


/obj/item/circuit_component/slime_processor


/obj/item/circuit_component/soundemitter


/obj/item/circuit_component/spawn_atom


/obj/item/circuit_component/species


/obj/item/circuit_component/speech


/obj/item/circuit_component/split


/obj/item/circuit_component/status_display


/obj/item/circuit_component/synth


/obj/item/circuit_component/synth/headphones


/obj/item/circuit_component/target_intercept


/obj/item/circuit_component/teleporter_control_console


/obj/item/circuit_component/tempsensor


/obj/item/circuit_component/textcase


/obj/item/circuit_component/thermomachine


/obj/item/circuit_component/thought_listener


/obj/item/circuit_component/timepiece


/obj/item/circuit_component/to_type


/obj/item/circuit_component/tonumber


/obj/item/circuit_component/tostring


/obj/item/circuit_component/trigonometry


/obj/item/circuit_component/typecast


/obj/item/circuit_component/variable


/obj/item/circuit_component/variable/assoc_list


/obj/item/circuit_component/variable/assoc_list/list_remove


/obj/item/circuit_component/variable/assoc_list/list_set


/obj/item/circuit_component/variable/getter


/obj/item/circuit_component/variable/list


/obj/item/circuit_component/variable/list/listadd


/obj/item/circuit_component/variable/list/listclear


/obj/item/circuit_component/variable/list/listremove


/obj/item/circuit_component/variable/setter


/obj/item/circuit_component/variable/setter/trigger


/obj/item/circuit_component/vendor_component


/obj/item/circuit_component/view_sensor


/obj/item/circuit_component/vim


/obj/item/circuit_component/vitals_monitor


/obj/item/circuit_component/vox


/obj/item/circuit_component/wire_bundle


/obj/item/circuit_component/wiremod_gun


/obj/item/circuit_component/wiremod_scanner


/obj/item/circuit_component/wirenet_receive


/obj/item/circuit_component/wirenet_send
