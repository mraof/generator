output = "This " .. o["morph"] .. " mothlie...\n"
  .. "-has " .. an(sized(o["head size"])) .. " " .. o["head shape"] .. " head with " .. sized(o["antennae size"]) .. " " .. o["antennae style"] .. " antennae\n"
  .. "-has "
if o["hair color"] then
  output = output .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair and "
end
output = output .. "" .. an(sized(o["mane"])) .. " mane\n"
  .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes with " .. o["pupil shape"] .. " pupils\n"
  .. "-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and " .. an(join(" ", o["tongue color"], o["tongue style"]) .. " tongue\n")
  .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has " .. an(o["build"]) .. " build and " .. an(o["scale"]) .. " scale\n"
  .. "-has " .. an(o["neck"]) .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["wings style"] .. " wings, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
  .. "-has " .. o["blood color"] .. " blood, and " .. o["organ color"] .. " organs\n"
  .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and " .. an(o["palette"]) .. " palette\n"

return output
