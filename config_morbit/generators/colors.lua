local common_colors = { "light pink", "pink", "dark pink", "light red", "red", "dark red", "orange", "light orange", "dark orange", "yellow", "light yellow", "dark yellow", "light chartreuse", "chartreuse", "dark chartreuse", "green", "light green", "dark green", "blue", "light blue", "dark blue", "light indigo", "indigo", "dark indigo", "purple", "light purple", "dark purple", "white", "light gray", "mid-light gray", "gray", "mid-dark gray", "dark gray", "black", "tan", "dark tan", "light tan", "light brown", "dark brown", "brown", }

local colors = {}
for key,value in ipairs(common_colors) do
    colors[key] = {value, COMMON}
end

table.insert(colors, {"horror black", EXTREMELY_RARE})
table.insert(colors, {"pure white", VERY_RARE})

config["color"] = colors

config["hexcolor"] = function()
    return {id = string.format("%06X", random(0, 0xffffff))}
end
