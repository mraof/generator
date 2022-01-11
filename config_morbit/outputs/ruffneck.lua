output = "This " .. o["morph"] .. " ruffneck...\n"
  .. "-has " .. an(sized(o["head size"])) .. " " .. o["head shape"] .. " head\n";
if o["hair color"] then
  output = output .. "-has " .. o["hair color"] .. " " .. o["hair length"] .. " " .. o["hair style"] .. " hair\n"
end
output = output .. "-has " .. o["eye shape"] .. " " .. o["eye color"] .. " eyes with " .. o["pupil shape"] .. " pupils\n"
  .. "-has " .. join(" ", o["teeth color"], o["teeth style"]) .. " teeth and " .. an(join(" ", o["tongue color"], o["tongue style"]) .. " tongue\n")
  .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ears\n"
  .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has " .. an(o["build"]) .. " build and " .. an(o["scale"]) .. " scale\n"
  .. "-has " .. an(o["neck"]) .. " neck with " .. o["neck_fluff"] .. " fluff, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " arms, " .. o["hand"] .. " hands, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
if o["deposits color"] then
  output = output .. "-has " .. o["deposits color"] .. " " .. o["deposits type"] .. " deposits\n"
end
output = output .. "-has " .. an(average(o["tail length"], "length")) .. " " .. o["tail type"] .. " tail\n"
  .. "-has " .. o["blood color"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
  .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and " .. an(o["palette"]) .. " palette\n"

return output

