require('init')

data:extend({
    {
        name = SuitPlug.mod_setting_names.update_period,
        type = 'int-setting',
        setting_type = 'startup',
        default_value = 60,
        minimum_value = 1
    },
})

data:extend({
    {
        name = SuitPlug.mod_setting_names.connection_distance,
        type = 'double-setting',
        setting_type = 'runtime-global',
        default_value = 7.5,
        minimum_value = 1.5
    },
})