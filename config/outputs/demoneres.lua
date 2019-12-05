for k, v in pairs(o) do
    if not used[k] then
        print(k .. " " .. v)
    end
end

output = "This " .. o["morph"] .. " demoneres...\n"
        .. "-has a " .. sized(o["head size"]) .. " " .. o["head shape"] .. " head with " .. o["horns size"] .. " " .. o["horns style"] .. " horns\n";
if o["hair color"] then
    output = output .. "-has " .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end
output = output .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes with " .. o["pupil shape"] .. " pupils\n"
        .. "-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and a " .. join(" ", o["tongue color"], o["tongue style"]) .. " tongue\n"
        .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
        .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has a " .. o["build"] .. " build and a " .. o["scale"] .. " scale\n"
        .. "-has a " .. o["neck"] .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " " .. o["hooves style"] .. " hooves\n"
        .. "-has a " .. average(o["tail length"], "length") .. " " .. o["tail style"] .. " tail\n"
        .. "-has " .. o["blood color"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
        .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and a " .. o["palette"] .. " palette\n"

return output