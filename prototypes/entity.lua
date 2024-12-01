data:extend({
	{
		type = 'electric-energy-interface',
		name = SuitPlug.outlet_name,
		icon = '__Suit-Plug-Continued__/graphics/large_suit_outlet_icon.png',
		icon_size = 32,
		flags = {'placeable-player', 'player-creation'},
		minable = {mining_time = 0.1, result = SuitPlug.outlet_name},
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		picture = {
			filename = '__Suit-Plug-Continued__/graphics/large_suit_outlet.png',
			priority = 'extra-high',
			width = 124,
			height = 103,
			shift = {0.7, -0.2}
		},
		max_health = 1500,
		corpse = 'medium-remnants',
		energy_source = {
			type = 'electric',
			buffer_capacity = (80000 * settings.startup[SuitPlug.mod_setting_names.update_period].value / 60)..'kJ',
			usage_priority = 'secondary-input',
			input_flow_limit = '80MW',
			output_flow_limit = '0W'
		},
		gui_mode = 'none'
	}
})
