---Extra functions usable from output scripts

---Join sizes in a way where you just get "average" once when you'd otherwise get "average average"
---@param size string
---@param length string
function sizes(size, length)
    if size == "average" and length == "average" then
        return "average"
    end
    if size == "average" then
        return length
    end
    if length == "average" then
        return size
    end
    return size .. " " .. length
end

---Appends "-sized" when the size is average
---@param size string
function sized(size)
    if size == "average" then
        return "average-sized"
    end
    return size
end

---Appends the name when the adjective is just "average"
---@param adjective string
---@param name string
function average(adjective, name)
    if (adjective == "average") then
        return "average " .. name
    end
    return adjective
end

---Use the first argument to join all the following arguments, ignoring undefined arguments
---@param sep string
function join(sep, ...)
    local real = {}
    for _, v in pairs({ ... }) do
        real[#real + 1] = v
    end
    return table.concat(real, sep)
end
