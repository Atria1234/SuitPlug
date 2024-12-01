data:extend(
{
	{
		type = "accumulator",
		name = "suit-outlet",
		icon = "__Suit-Plug-Continued__/graphics/large_suit_outlet_icon.png",
		icon_size = 32,
		flags = {"placeable-neutral", "placeable-player", "placeable-enemy", "player-creation"},
		minable = {hardness = 1, mining_time = 2, result = "suit-outlet"},
		max_health = 1500,
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		corpse = "medium-remnants",
		energy_source =
		{
			type = "electric",
			buffer_capacity = "5MJ",
			usage_priority = "terciary",
			input_flow_limit = "300MW",
			output_flow_limit = "300MW"
		},
		charge_cooldown = 30,
		discharge_cooldown = 0,
		picture ={
			filename = "__Suit-Plug-Continued__/graphics/large_suit_outlet.png",
			priority = "extra-high",
			width = 124,
			height = 103,
			shift = {0.7, -0.2}
		},
		charge_animation =
		{
			filename = "__Suit-Plug-Continued__/graphics/large_suit_outlet-charge-animation.png",
			width = 138,
			height = 135,
			line_length = 8,
			frame_count = 24,
			shift = {0.482, -0.638},
			animation_speed = 0.5
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0.3, size = 7},
		discharge_animation =
		{
			filename = "__Suit-Plug-Continued__/graphics/large_suit_outlet-discharge-animation.png",
			width = 147,
			height = 128,
			line_length = 8,
			frame_count = 24,
			shift = {0.395, -0.525},
			animation_speed = 0.5
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 7},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/accumulator-working.ogg",
				volume = 1
			},
			idle_sound =
			{
				filename = "__base__/sound/accumulator-idle.ogg",
				volume = 0.4
			},
			max_sounds_per_type = 5
		}
	}
})