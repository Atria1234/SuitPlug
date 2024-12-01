data:extend(
{
	{
		type = 'technology',
		name = 'suit-plug',
		icon = '__Suit-Plug-Continued__/graphics/suit-plug-tech.png',
		icon_size = 64,
		effects = {
			{
				type = 'unlock-recipe',
				recipe = 'suit-plug'
			},
			{
				type = 'unlock-recipe',
				recipe = 'suit-outlet'
			},
		},
		prerequisites = {
			'battery-equipment',
			'processing-unit',
			'speed-module',
			'electric-energy-accumulators'
		},
		unit = {
			count = 100,
			ingredients= {
				{'automation-science-pack', 1},
				{'logistic-science-pack', 1},
				{'chemical-science-pack', 1}
			},
			time = 30
		},
		order = 'e[accumulator]-a[suit-plug]'
	},
})