data:extend({
	{
		type = 'recipe',
		name = 'suit-plug',
		ingredients = {
			{
				type = 'item',
				name = 'battery-equipment',
				amount = 2
			},
			{
				type = 'item',
				name = 'processing-unit',
				amount = 5
			},
			{
				type = 'item',
				name = 'copper-plate',
				amount = 5
			},
			{
				type = 'item',
				name = 'speed-module',
				amount = 1
			}
		},
		enabled = false,
		results = {
			{
				type = 'item',
				name = SuitPlug.suit_plug_name,
				amount = 1
			}
		}
	},
	{
		type = 'recipe',
		name = 'suit-outlet',
		ingredients = {
			{
				type = 'item',
				name = 'accumulator',
				amount = 10
			},
			{
				type = 'item',
				name = 'substation',
				amount = 1
			},
			{
				type = 'item',
				name = 'processing-unit',
				amount = 5
			},
			{
				type = 'item',
				name = 'steel-plate',
				amount = 20
			},
			{
				type = 'item',
				name = 'speed-module',
				amount = 1
			}
		},
		enabled = false,
		results = {
			{
				type = 'item',
				name = SuitPlug.outlet_name,
				amount = 1
			}
		}
	},
})
