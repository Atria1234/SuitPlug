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
		continuous_animation = true,
		animation = {
			layers = {
				{
					filename = '__Suit-Plug-Continued__/graphics/suit-plug-outlet-hr-animation.png',
					size = {160, 290},
					position = {0, 0},
					shift = {0, -1},
					scale = 0.5,
					frame_count = 16,
					line_length = 8
				},
				{
					filename = '__Suit-Plug-Continued__/graphics/suit-plug-outlet-hr-emission.png',
					size = {160, 290},
					position = {0, 0},
					shift = {0, -1},
					scale = 0.5,
					frame_count = 1,
					repeat_count = 16,
					draw_as_light = true
				},
				{
					filename = '__Suit-Plug-Continued__/graphics/suit-plug-outlet-hr-shadow.png',
					size = {400, 350},
					position = {0, 0},
					shift = {0, -1},
					scale = 0.5,
					frame_count = 1,
					repeat_count = 16,
					draw_as_shadow = true
				}
			}
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
