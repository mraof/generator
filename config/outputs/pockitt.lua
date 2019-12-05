output = "This " .. o["morph"] .. " pockitt...\n"
        .. "-has a " .. sized(o["head size"]) .. " " .. o["head shape"] .. " head\n";
if o["hair color"] then
    output = output .. "-has " .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end
if o["fluff type"] then
    output = output .. "-has " .. o["fluff type"] .. " fluff\n"
end
output = output .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes\n"
        .. "-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and a " .. o["tongue style"] .. " tongue\n"
        .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
        .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has a " .. o["build"] .. " build and a " .. o["scale"] .. " scale\n"
        .. "-has a " .. o["neck"] .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
        .. "-has a " .. average(o["tail length"], "length") .. " " .. o["tail type"] .. " tail\n"
        .. "-has " .. o["blood color"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
        .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and a " .. o["palette"] .. " palette\n"

return output
