output = "This " .. o["classification"] .. "-class ".. o["species"] .. "...\n"
  .. "-has " .. an(sized(o["head size"])) .. " " .. o["head shape"] .. " head\n"
  .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes with " .. o["pupil shape"] .. " pupils\n"
  .. "-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and " .. an(join(" ", o["tongue color"], o["tongue style"]) .. " tongue\n")
  .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
  .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has " .. an(o["build"]) .. " build and " .. an(o["scale"]) .. " scale\n"
  .. "-has " .. an(o["neck"]) .. " neck, " .. o["shoulders"] .. " shoulders, " .. join(" ", o["wing color"], o["wing type"]) .. " wings, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
  .. "-has " .. an(average(o["tail length"], "length")) .. " " .. o["tail type"] .. " tail\n"
  .. "-has " .. o["blood color"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
  .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and " .. o["pattern color"] .. " " .. o["pattern type"] .. " patterns\n"
  .. "-has " .. o["power type"] .. " " .. average(o["power strength"], "strength") .. " magical abilities\n"
if o["accessory type"] then
  output = output .. "-has " .. o["accessory type"] .. "\n"
end
output = output .. "-lives in the " .. o["district"] .. " District"

return output
