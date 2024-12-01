local playerArmorInventory = defines.inventory.player_armor
local OUTLET = "suit-outlet"
local searchRadius = 1.5

script.on_event(defines.events.on_tick, function(event)
	for _, player in pairs(game.players) do
		checkArmor(player)
	end
end)

function checkArmor(player)
	if not player.connected or not player.character then
		return
	end
	
	local character = player.character
	
	-- find armor
	local armor = character.get_inventory(playerArmorInventory)[1];
	if not armor or not armor.valid_for_read or not armor.grid then
		return
	end
	
	local plugs = {}
	
	-- find all plugs
	for i, equipment in ipairs(armor.grid.equipment) do
		if equipment.name == "suit-plug" then
			table.insert(plugs, equipment)
		end
	end
	
	if #plugs == 0 then
		return
	end
	
	-- does some plug need power?
	local missingPower = false
	for i, plug in ipairs(plugs) do
		if plug.energy < plug.max_energy then
			missingPower = true
			break
		end
	end
	
	if not missingPower then
		return
	end
	
	-- find outlets close to player
	local playerPos = character.position
	local outlets = character.surface.find_entities_filtered{
			area =
			{
				{playerPos.x - searchRadius, playerPos.y - searchRadius},
				{playerPos.x + searchRadius, playerPos.y + searchRadius}
			},
			name = OUTLET
		}
	
	-- trasnfer energy from outlets to plugs
	for i, outlet in ipairs(outlets) do
		for i, plug in ipairs(plugs) do
			local energy_source = plug.prototype.energy_source
			
			if plug.energy < plug.max_energy then
				-- don't take more that plug is able to take (throughput)
				local powerTaken = energy_source.input_flow_limit
				
				-- don't take more that outlet has (capacity)
				if energy_source.input_flow_limit > outlet.energy then
					powerTaken = outlet.energy
				end
				
				-- don't take more that outlet is able to give (thoughput)
				if powerTaken > outlet.electric_output_flow_limit then
					powerTaken = outlet.electric_output_flow_limit
				end
				
				-- don't take more that plug actualy needs (capacity)
				if powerTaken > plug.max_energy - plug.energy then
					powerTaken = plug.max_energy - plug.energy
				end
				
				outlet.energy = outlet.energy - powerTaken
				plug.energy = plug.energy + powerTaken
			end
		end
	end
end