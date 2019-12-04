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

local used = {
    ["morph"] = true,
    ["head size"] = true,
    ["head shape"] = true,
    ["hair color"] = true,
    ["hair color"] = true,
    ["hair length"] = true,
    ["hair style"] = true,
    ["eye shape"] = true,
    ["eye color"] = true,
    ["teeth color"] = true,
    ["teeth style"] = true,
    ["tongue color"] = true,
    ["tongue style"] = true,
    ["ear size"] = true,
    ["ear type"] = true,
    ["weight"] = true,
    ["height"] = true,
    ["build"] = true,
    ["scale"] = true,
    ["neck"] = true,
    ["shoulders"] = true,
    ["chest"] = true,
    ["bust"] = true,
    ["arm size"] = true,
    ["arm length"] = true,
    ["hand"] = true,
    ["hips"] = true,
    ["leg size"] = true,
    ["leg length"] = true,
    ["feet"] = true,
    ["tail length"] = true,
    ["tail type"] = true,
    ["blood color"] = true,
    ["bones color"] = true,
    ["organ color"] = true,
    ["fur_skin color"] = true,
    ["fur_skin type"] = true,
    ["palette"] = true,
    ["fluff size"] = true,
    ["fluff style"] = true,
    ["pupil shape"] = true,
    ["heart style"] = true,
    Abstract = true,
    Body = true,
    Form = true,
    Creature = true,
    Food = true,
    Machine = true,
    Nature = true,
    Storage = true,
    Weapon = true,
}

for k, v in pairs(o) do
    if not used[k] then
        print(k .. " " .. v)
    end
end

output = "This " .. o["morph"] .. " snuglin...\n"
        .. "-has a " .. sized(o["head size"]) .. " " .. o["head shape"] .. " head\n";
if o["hair color"] then
    output = output .. "-has " .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end
output = output .. "-has " .. o["fluff size"] .. " " .. o["fluff style"] .. " and a " .. o["heart style"] .. " heart\n"
        .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes"
if o["pupil shape"] then
    output = output .. o["pupil shape"] .. " pupils"
end
output = output .. "\n-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and a " .. join(o["tongue color"], o["tongue style"]) .. " tongue\n"
        .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
        .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has a " .. o["build"] .. " build and a " .. o["scale"] .. " scale\n"
        .. "-has a " .. o["neck"] .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
        .. "-has a " .. average(o["tail length"], "length") .. " " .. o["tail type"] .. " tail\n"
        .. "-has " .. o["blood color"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
        .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and a " .. o["palette"] .. " palette\n"

return output

