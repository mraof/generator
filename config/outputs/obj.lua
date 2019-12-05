output = "This obj...\n"
        .. "-has a " .. o["head_casing"] .. " head casing\n"

if o["hair style"] then
    output = output .. "-has " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end

if o["eye shape"] then
    output = output .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes\n"
end

output = output .. "-has " .. o["teeth"] .. " teeth and a " .. o["tongue"] .. " tongue\n"

if o["ear size"] then
    output = output .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
end

output = output .. "-is " .. o["weight"] .. ", " .. o["height"] .. ", has a " .. o["build"] .. " build and a " .. o["scale"] .. " scale\n"
        .. "-has a " .. o["neck"] .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " "
if o["arm term"] == "hands" then
    output = output .. "arms with " .. o["arm"] .. " hands"
else
    output = output .. o["arm"] .. " " .. o["arm term"]
end
output = output .. ", " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"

output = output .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and a " .. o["palette"] .. " palette\n"

return output
