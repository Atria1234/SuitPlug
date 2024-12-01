SuitPlug = {}

SuitPlug.mod_name = 'SuitPlug'

function SuitPlug.prefix_with_mod_name(value)
    return SuitPlug.mod_name..'__'..value
end

SuitPlug.mod_setting_names = {
    update_period = SuitPlug.prefix_with_mod_name('update-period'),
    connection_distance = SuitPlug.prefix_with_mod_name('connection-distance')
}

SuitPlug.suit_plug_name = 'suit-plug'

SuitPlug.outlet_name = 'suit-outlet'
