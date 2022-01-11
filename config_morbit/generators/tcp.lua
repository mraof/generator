local types = {
    abstract = {},
    body = {},
    creature = {},
    food = {},
    machine = {},
    nature = {},
    form = {},
    storage = {},
    weapon = {}
}

local types_set = {
    abstract = {},
    body = {},
    creature = {},
    food = {},
    machine = {},
    nature = {},
    form = {},
    storage = {},
    weapon = {}
}

for _, file in ipairs(dir_files("config/tcp/types")) do
    local category
    for line in io.lines(file) do
        line = trim(line)
        if line:sub(1, 1) == "#" then
            category = line:sub(2)
            if not types[category] then
                error("Invalid category " .. category)
            end
        elseif category == nil then
            error("No category set in file " .. file)
        else
            if not types_set[category][line] then
                types_set[category][line] = true
                table.insert(types[category], line)
            end
        end
    end
end

local anomalies = {}
local anomalies_set = {}

for _, file in ipairs(dir_files("config/tcp/anomalies")) do
    for line in io.lines(file) do
        line = trim(line)
        if not anomalies_set[line] then
            anomalies_set[line] = true
            anomalies[#anomalies + 1] = line
        end
    end
end

local conditions = {}
local conditions_set = {}

for _, file in ipairs(dir_files("config/tcp/conditions")) do
    for line in io.lines(file) do
        line = trim(line)
        if not conditions_set[line] then
            conditions_set[line] = true
            conditions[#conditions + 1] = line
        end
    end
end

local modifiers = {}
local modifiers_set = {}

for _, file in ipairs(dir_files("config/tcp/modifiers")) do
    for line in io.lines(file) do
        line = trim(line)
        if not modifiers_set[line] then
            modifiers_set[line] = true
            modifiers[#modifiers + 1] = line
        end
    end
end

local tiers = {"minor", "intermediate", "major"}

local tcp_simple = {
    ["Type 0"] = {
        { ["Category 0"] = "abstract", ["Type 0"] = types.abstract },
        { ["Category 0"] = "body", ["Type 0"] = types.body },
        { ["Category 0"] = "creature", ["Type 0"] = types.creature },
        { ["Category 0"] = "food", ["Type 0"] = types.food },
        { ["Category 0"] = "machine", ["Type 0"] = types.machine },
        { ["Category 0"] = "nature", ["Type 0"] = types.nature },
        { ["Category 0"] = "form", ["Type 0"] = types.form },
        { ["Category 0"] = "storage", ["Type 0"] = types.storage },
        { ["Category 0"] = "weapon", ["Type 0"] = types.weapon },
    }
}

local tcp_complicated =
function()
    local attributes = {}
    local categories = { "abstract", "body", "creature", "food", "machine", "nature", "form", "storage", "weapon" }
    local category_counts = { abstract = 0, body = 0, creature = 0, food = 0, machine = 0, nature = 0, form = 0, storage = 0, weapon = 0 }
    local condition_count = 0
    local modifier_count = 0
    local anomaly_count = 0
    local category = choose(categories)
    category_counts[category] = category_counts[category] + 1
    for i = 1, 4 do
        if random(0, 99) > 86 then
            category = choose(categories)
            category_counts[category] = category_counts[category] + 1
        end
        if random(0, 99) > 94 then
            condition_count = condition_count + 1
        end
        if random(0, 99) > 86 then
            modifier_count = modifier_count + 1
        end
        if random(0, 99) > 76 then
            anomaly_count = anomaly_count + 1
        end
    end
    local extant_categories = {}
    local category_types = {}
    for name, count in pairs(category_counts) do
        if count > 0 then
            extant_categories[#extant_categories + 1] = name
            category_types[name] = choose_multiple(types[name], count)
        end
    end
    local offset = 0
    while #extant_categories > 0 do
        local i = random(1, #extant_categories)
        attributes["Category " .. offset] = extant_categories[i]
        attributes["Type " .. offset] = table.remove(category_types[extant_categories[i]])
        if #category_types[extant_categories[i]] == 0 then
            table.remove(extant_categories, i)
        end
    end

    for i, anomaly in ipairs(choose_multiple(anomalies, anomaly_count)) do
        attributes["Anomaly " .. (i-1)] = anomaly
        attributes["Anomaly Tier " .. (i-1)] = choose(tiers)
    end

    for i, condition in ipairs(choose_multiple(conditions, condition_count)) do
        attributes["Condition " .. (i-1)] = condition
    end

    for i, modifier in ipairs(choose_multiple(modifiers, modifier_count)) do
        attributes["Modifier " .. (i-1)] = modifier
        attributes["Modifier Tier " .. (i-1)] = choose(tiers)
    end
    return attributes
end

config["tcp"] = {
    species = "tcp",
    Designer = {
        { "false", 3 },
        { "true", 1 }
    },
    tcp_attributes = {
        tcp_simple,
        tcp_complicated
    }
}
