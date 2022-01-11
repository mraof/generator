after = { "species" }

config["mutated teeth style"] = {
    "tusked",
    "massive",
    "saber",
    "lamprey",
    "fanged",
    "leatherback turtle",
    "shark",
    "snake",
    "hollow",
    "jack o' lantern",
    "retractable",
}

config["mutated scale"] = {
    {"vestigal", VERY_RARE},
    {"shrunken", RARE},
    {"small", COMMON},
    {"standard", COMMON},
    {"large", COMMON},
    {"massive", RARE},
    {"titanic", VERY_RARE},
}

config["mutated eyes"] = {
    {["pupil shape"] = "no"},
    {["pupil count"] = "double"},
    {["pupil shape"] = "slit"},
    {["pupil shape"] = "heart"},
    {["pupil shape"] = "star"},
    {["pupil shape"] = "ring"},
    {["pupil shape"] = "no", ["eye type"] = "mirror"},
    {["eye type"] = "glowing"},
    {["pupil shape"] = "swirly"},
    {["pupil shape"] = "no", ["eye type"] = "mouth", ["eye color"] = ""},
}

config["mutation"] = {
    {["mutation type"] = "teeth style", ["mutation value"] = "mutated teeth style"},
    {["mutation type"] = "id", ["mutation value"] = "mutated eyes"},
}

config["mutated karacel"] = {
    generators = {
        ["mutated teeth style"] = config["mutated teeth style"],
        ["mutated eyes"] = config["mutated eyes"],
    },
    "gen karacel",
    config["mutation"],
    function()
        local changes = {}
        changes[o["mutation type"]] = "gen " .. o["mutation value"]
        changes["mutation type"] = ""
        changes["mutation value"] = ""
        return changes
    end,
    config["mutation"],
    function()
        local changes = {}
        changes[o["mutation type"]] = "gen " .. o["mutation value"]
        changes["mutation type"] = ""
        changes["mutation value"] = ""
        return changes
    end,
}
