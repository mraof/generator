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
    if(adjective == "average") then
        return "average " .. name
    end
    return adjective
end

function join(sep, ...)
    local real = {}
    for _, v in pairs({...}) do
        real[#real + 1] = v
    end
    return table.concat(real, sep)
end

output = "This " .. o["morph"] .. " aerosoul...\n"
        .. "-has a " .. sized(o["head size"]) .. " " .. o["head shape"] .. " head\n";
if o["hair color"] then
    output = output .. "-has " .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end
output = output .. join(" ", "-has", o["eye count"], o["eye shape"], plural(o["eye count"], "eye"), "per wing with", o["pupil count"], o["pupil shape"], "pupils\n")
        .. join(" ", "-has", o["teeth color"], o["teeth style"], "teeth and a", o["tongue style"], "tongue\n")
        .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ear fins\n"
        .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has a " .. o["build"] .. " build and a " .. o["scale"] .. " scale\n"
        .. "-has a " .. o["neck"] .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " wings, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
        .. "-has a " .. average(o["tail length"], "length") .. " " .. o["tail type"] .. " tail\n"
        .. "-has " .. o["blood"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
        .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and a " .. o["palette"] .. " palette\n"

return output