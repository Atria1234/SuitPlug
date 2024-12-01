data:extend(
{
	{
		type = "battery-equipment",
		name = "suit-plug",
		sprite =
		{
			filename = "__Suit-Plug-Continued__/graphics/suit-plug.png",
			width = 32,
			height = 32,
			priority = "medium"
		},
		shape =
		{
			width = 1,
			height = 1,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "1MJ",
			input_flow_limit = "1MW",
			output_flow_limit = "100MW",
			usage_priority = "primary-output"
		},
		categories = {"armor"}
	},
})