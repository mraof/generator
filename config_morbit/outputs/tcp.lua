local b = {
  ["true"] = true,
  ["false"] = false
}
local types = {}
local i = 0
while o["Type " .. i] ~= nil do
  types[i + 1] = o[o["Category " .. i]] .. " " .. o["Type " .. i]
  i = i + 1
end
if b[o["Designer"]] then
  output = "This designer tcp...\n"
else
  output = "This tcp...\n"
end

if #types == 1 then
  output = output .. "-is " .. an(types[1]) .. " type\n"
else
  output = output .. "-is " .. an(table.concat(types, "/")) .. " hybrid\n"
end

if o["Condition 0"] then
  local conditions = {}
  i = 0
  while o["Condition " .. i] ~= nil do
    conditions[i + 1] = o["Condition " .. i]
    i = i + 1
  end
  output = output .. "-with the conditions: " .. table.concat(conditions, ", ") .. "\n"
end

if o["Anomaly 0"] then
  local anomalies = {}
  i = 0
  while o["Anomaly " .. i] ~= nil do
    anomalies[i + 1] = o["Anomaly " .. i] .. " (" .. o["Anomaly Tier " .. i] .. ")"
    i = i + 1
  end
  output = output .. "-with the anomalies: " .. table.concat(anomalies, ", ") .. "\n"
end

if o["Modifier 0"] then
  local modifiers = {}
  i = 0
  while o["Modifier " .. i] ~= nil do
    modifiers[i + 1] = o["Modifier " .. i] .. " (" .. o["Modifier Tier " .. i] .. ")"
    i = i + 1
  end
  output = output .. "-with the modifiers: " .. table.concat(modifiers, ", ") .. "\n"
end

return output
