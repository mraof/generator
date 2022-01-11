output = "This " .. o["morph"] .. " aerosoul...\n"
  .. "-has " .. an(sized(o["head size"])) .. " " .. o["head shape"] .. " head\n"
  .. join(" ", "-has", o["eye count"], o["eye shape"], plural(o["eye count"], "eye"), "per wing with", o["pupil count"], o["pupil shape"], "pupils\n")
  .. join(" ", "-has", o["teeth color"], o["teeth style"], "teeth and ", an(o["tongue style"]), "tongue\n")
  .. "-has " .. o["ear size"] .. " " .. o["ear type"] .. " ear fins\n"
  .. "-is " .. average(o["weight"], "weight") .. ", " .. average(o["height"], "height") .. ", has " .. an(o["build"]) .. " build and " .. an(o["scale"]) .. " scale\n"
  .. "-has " .. an(o["neck"]) .. " neck, " .. o["shoulders"] .. " shoulders, " .. o["chest"] .. " chest, " .. o["bust"] .. " bust, " .. sizes(o["arm size"], o["arm length"]) .. " wings, " .. o["hips"] .. " hips, " .. sizes(o["leg size"], o["leg length"]) .. " legs, and " .. o["feet"] .. " feet\n"
  .. "-has " .. an(average(o["tail length"], "length")) .. " " .. o["tail type"] .. " tail\n"
  .. "-has " .. o["blood"] .. " blood, " .. o["bones color"] .. " bones, and " .. o["organ color"] .. " organs\n"
  .. "-has " .. o["fur_skin color"] .. " " .. o["fur_skin type"] .. " and " .. an(o["palette"]) .. " palette\n"

return output
