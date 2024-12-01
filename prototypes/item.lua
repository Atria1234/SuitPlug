data:extend(
{
	{
		type = 'item',
		name = SuitPlug.suit_plug_name,
		icon = '__Suit-Plug-Continued__/graphics/suit-plug.png',
		icon_size = 32,
		subgroup = 'equipment',
		stack_size = 5,
		order = 'a[energy-source]-a[suit-plug]',
		place_as_equipment_result = SuitPlug.suit_plug_name,
	},
	{
		type = 'item',
		name = SuitPlug.outlet_name,
		icon = '__Suit-Plug-Continued__/graphics/large_suit_outlet_icon.png',
		icon_size = 32,
		subgroup = 'energy',
		stack_size = 10,
		place_result = SuitPlug.outlet_name,
		order = 'e[accumulator]-a[suit-outlet]'
	},
})
