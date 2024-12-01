data:extend(
{
	{
		type = 'battery-equipment',
		name = SuitPlug.suit_plug_name,
		sprite = {
			filename = '__Suit-Plug-Continued__/graphics/suit-plug.png',
			width = 32,
			height = 32,
			priority = 'medium'
		},
		shape = {
			width = 1,
			height = 1,
			type = 'full'
		},
		energy_source = {
			type = 'electric',
			buffer_capacity = (20000 * settings.startup[SuitPlug.mod_setting_names.update_period].value / 60)..'kJ',
			input_flow_limit = '0W',
			output_flow_limit = '20MW',
			usage_priority = 'primary-output'
		},
		categories = {'armor'}
	},
})