b = {
    ["true"] = true,
    ["false"] = false
}
types = {}
i = 0
while o["Type " .. i] ~= nil do
    types[i + 1] = o[o["Category " .. i]] .. o["Type " .. i]
    i = i + 1
end

output = table.concat(types, "/")
if b[o["Designer"]] then
    output = "designer " .. output
end

if o["Condition 0"] then
    conditions = {}
    i = 0
    while o["Condition " .. i] ~= nil do
        conditions[i + 1] = o["Condition " .. i]
        i = i + 1
    end
    output = output .. ", conditions: " .. table.concat(conditions, ", ")
end

if o["Anomaly 0"] then
    anomalies = {}
    i = 0
    while o["Anomaly " .. i] ~= nil do
        anomalies[i + 1] = o["Anomaly " .. i] .. " (" .. o["Anomaly Tier " .. i] .. ")"
        i = i + 1
    end
    output = output .. ", anomalies: " .. table.concat(anomalies, ", ")
end

if o["Modifier 0"] then
    modifiers = {}
    i = 0
    while o["Modifier " .. i] ~= nil do
        modifiers[i + 1] = o["Modifier " .. i] .. " (" .. o["Modifier Tier " .. i] .. ")"
        i = i + 1
    end
    output = output .. ", modifiers: " .. table.concat(modifiers, ", ")
end

return output
