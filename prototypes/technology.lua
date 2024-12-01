data:extend(
{
	{
		type = "technology",
		name = "suit-plug",
		icon = "__Suit-Plug-Continued__/graphics/suit-plug-tech.png",
		icon_size = 64,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "suit-plug"
			},
			{
				type = "unlock-recipe",
				recipe = "suit-outlet"
			},
		},
		prerequisites =
		{
			"battery-equipment",
			"advanced-electronics-2",
			"speed-module",
			"electric-energy-accumulators-1"
		},
		unit =
		{
			count = 100,
			ingredients={
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		order = "e[accumulator]-a[suit-plug]"
	},
})