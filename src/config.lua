config = {}
config_order = {}

setmetatable(config, {
               __newindex = function(t, k, v)
                 rawset(t, k, v)
                 table.insert(config_order, k)
               end
})
