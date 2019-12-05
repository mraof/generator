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

function sized(size)
    if size == "average" then
        return "average-sized"
    end
    return size
end

function average(adjective, name)
    if (adjective == "average") then
        return "average " .. name
    end
    return adjective
end

function join(sep, ...)
    local real = {}
    for _, v in pairs({ ... }) do
        real[#real + 1] = v
    end
    return table.concat(real, sep)
end
