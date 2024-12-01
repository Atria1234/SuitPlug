data:extend(
{
	{
		type = "item",
		name = "suit-plug",
		
		icon = "__Suit-Plug-Continued__/graphics/suit-plug.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "equipment",
		stack_size = 5,
		order = "a[energy-source]-a[suit-plug]",
		placed_as_equipment_result = "suit-plug",
	},
	{
		type = "item",
		name = "suit-outlet",

		icon = "__Suit-Plug-Continued__/graphics/large_suit_outlet_icon.png",
		icon_size = 32,
		subgroup = "energy",
		stack_size = 10,
		place_result = "suit-outlet",
		order = "e[accumulator]-a[suit-outlet]",
		flags = {"goes-to-quickbar"}
	},
})
