require('init')

local WIRE_COLOR = { 0.88, 0.55, 0, 1 }
local CONNECTION_OFFSETS = {
    ['spidertron'] = {0, -1.2}
}
local DEFAULT_CONNECTION_OFFSET = {0, -0.7}

script.on_nth_tick(settings.startup[SuitPlug.mod_setting_names.update_period].value, function()
    for _, grid in pairs(storage.equipment_grids) do
        if grid.entity_owner and grid.entity_owner.grid and grid.entity_owner.grid.unique_id == grid.unique_id then
            local energy_needed = false
            for _, equipment in ipairs(grid.equipment) do
                if equipment.name == SuitPlug.suit_plug_name and equipment.energy < equipment.max_energy then
                    energy_needed = true
                    break
                end
            end

            if energy_needed then
                local outlets = grid.entity_owner.surface.find_entities_filtered({
                    position = grid.entity_owner.position,
                    radius = settings.global[SuitPlug.mod_setting_names.connection_distance].value,
                    name = SuitPlug.outlet_name
                })
                for _, outlet in ipairs(outlets) do
                    local wire_drawn = false
                    for _, equipment in ipairs(grid.equipment) do
                        if equipment.name == SuitPlug.suit_plug_name then
                            local power_taken = math.min(
                                outlet.energy, -- don't take more energy than outlet has
                                equipment.max_energy - equipment.energy -- don't take more energy than plug needs
                            )

                            if power_taken > 0 then
                                if not wire_drawn then
                                    rendering.draw_line({
                                        color = WIRE_COLOR,
                                        width = 1,
                                        from = {
                                            entity = grid.entity_owner,
                                            offset = CONNECTION_OFFSETS[grid.entity_owner.name] or DEFAULT_CONNECTION_OFFSET
                                        },
                                        to = {
                                            entity = outlet,
                                            offset = {0, -1}
                                        },
                                        surface = outlet.surface,
                                        time_to_live = settings.startup[SuitPlug.mod_setting_names.update_period].value
                                    })

                                    wire_drawn = true
                                end

                                equipment.energy = equipment.energy + power_taken
                                outlet.energy = outlet.energy - power_taken
                            end
                        end
                    end
                end
            end
        end
    end
end)

script.on_event(defines.events.on_equipment_inserted, function (event)
    if event.equipment.name == SuitPlug.suit_plug_name then
        if storage.equipment_grids[event.grid.unique_id] == nil then
            storage.equipment_grids[event.grid.unique_id] = event.grid
        end
    end
end)

script.on_event(defines.events.on_equipment_removed, function (event)
    if event.equipment == SuitPlug.suit_plug_name then
        if event.grid.count(SuitPlug.suit_plug_name) == 0 then
            storage.equipment_grids[event.grid.unique_id] = nil
        end
    end
end)

script.on_init(function()
    storage.equipment_grids = {}

    ---@param grid LuaEquipmentGrid | nil
    local function process_grid(grid)
        if grid and grid.count(SuitPlug.suit_plug_name) > 0 then
            storage.equipment_grids[grid.unique_id] = grid
        end
    end

    -- Find all equipment grids currently in the world
    for _, surface in pairs(game.surfaces) do
        for _, entity in ipairs(surface.find_entities()) do
            process_grid(entity.grid)

            for i = 1, entity.get_max_inventory_index() do
                local inventory = entity.get_inventory(i)
                if inventory then
                    for j = 1, #inventory do
                        if inventory[j].valid and inventory[j].valid_for_read then
                            process_grid(inventory[j].grid)
                        end
                    end
                end
            end
        end
    end
end)

script.on_configuration_changed(function ()
    local buffer_size = 80000000 * settings.startup[SuitPlug.mod_setting_names.update_period].value / 60
    -- update charge 
    for _, surface in pairs(game.surfaces) do
        for _, entity in ipairs(surface.find_entities_filtered({name = SuitPlug.outlet_name})) do
            entity.electric_buffer_size = buffer_size
        end
    end
end)