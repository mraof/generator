local morphs = {
    spiked = {
        id = "spiked",
        ["fur_skin type"] = "spiked scales",
        ["head shape"] = {
            {"agamid", COMMON},
            {"skink", COMMON},
            {"tuatara", UNCOMMON},
            {"flat", UNCOMMON},
            {"earless monitor", UNCOMMON},
            {"viper", VERY_RARE}
        },
    },
    plated = {
        id = "plated",
        ["fur_skin type"] = "plated scales",
        ["head shape"] = {
            {"flat", COMMON},
            {"agamid", COMMON},
            {"skink", COMMON},
            {"tuatara", UNCOMMON},
            {"earless monitor", UNCOMMON},
            {"viper", VERY_RARE}
        },
    },
    feathered = {
        id = "feathered",
        ["fur_skin type"] = "feathered scales",
        ["head shape"] = {
            {"viper", COMMON},
            {"skink", COMMON},
            {"agamid", UNCOMMON},
            {"tuatara", UNCOMMON},
            {"flat", UNCOMMON},
            {"earless monitor", RARE},
        },
    },
    thorned = {
        id = "thorned",
        ["fur_skin type"] = "thorny scales",
        ["head shape"] = {
            {"agamid", COMMON},
            {"viper", COMMON},
            {"skink", UNCOMMON},
            {"tuatara", UNCOMMON},
            {"flat", UNCOMMON},
            {"earless monitor", RARE},
        },
    },
    soft = {
        id = "soft",
        ["fur_skin type"] = "skin",
        ["head shape"] = {
            {"agamid", COMMON},
            {"skink", COMMON},
            {"tuatara", UNCOMMON},
            {"flat", UNCOMMON},
            {"earless monitor", RARE},
            {"viper", EXTREMELY_RARE},
        },
    }
}


config["celascute"] = {
    species = "celascute",
    morph = {
        { morphs.spiked, COMMON },
        { morphs.plated, COMMON },
        { morphs.feathered, UNCOMMON },
        { morphs.thorned, UNCOMMON },
        { morphs.soft, RARE },
    },
    ["head size"] = "gen head size",
    ["head length"] = {"stout", "", "elongated"},
    weight = "gen weight",
    height = "gen height",
    build = "gen build",
    scale = "gen scale",
    neck = "gen neck",
    shoulders = "gen shoulders",
    chest = "gen chest",
    bust = "gen bust",
    hips = "gen hips",
    feet = "gen feet",
    ["tail length"] = {
        {"very short", VERY_RARE},
        {"short", RARE},
        {"average", UNCOMMON},
        {"long", COMMON},
        {"very long", UNCOMMON}
    },
    ["tail type"] = {
	{"pancake", UNCOMMON},
	{"whip", COMMON},
	{"thick", COMMON},
	{"stubby", COMMON},
    },
    blood = "red",
    ["bones color"] = "gen teeth color",
    ["organ color"] = "red",
    ["ear size"] = "gen ear size",
    palette = "gen palette",
    ["eye shape"] = "gen eye shape",
    ["tongue style"] = "forked",
    ["fur_skin color"] = "gen color",
    ["pupil shape"] = {"slit", "round"},
    prefixed = {
        prefix = true,
        teeth = {
            color = {"white", "translucent"},
            style = "gen teeth style",
        },
        leg = {
            length = "gen leg length",
            size = "gen leg size"
        },
        arm = {
            length = "gen leg length",
            size = "gen leg size"
        },
    }
}

for name,morph in pairs(morphs) do
    local morphed = {}
    for k,v in pairs(config["celascute"]) do
        morphed[k] = v
    end
    morphed.morph = morph
    config["celascute." .. name] = morphed
end
