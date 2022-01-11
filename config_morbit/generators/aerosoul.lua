after = { "colors" }

local morphs = {
    passenger = {
        id = "passenger",
        ["head shape"] = {
            "blunt"
        },
        ["tail type"] = "round finned",
        ["ear type"] = "round"
    },
    stealth = {
        id = "stealth",
        ["head shape"] = "pointy",
        ["tail type"] = "geometric",
        ["ear type"] = "square"
    },
    fighter = {
        id = "fighter",
        ["head shape"] = "pointy",
        ["tail type"] = {
            "pointy finned"
        },
        ["ear type"] = "pointy"
    },
    drone = {
        id = "drone",
        ["head shape"] = {
            "pointy",
            "blunt"
        },
        ["tail type"] = {
            "round finned",
            "ribbon finned"
        },
        ["ear type"] = "round"
    },
    craft = {
        id = "craft",
        ["head shape"] = {
            "pointy"
        },
        ["tail type"] = {
            "pointy finned",
            "geometric",
            "flat"
        },
        ["ear type"] = {
            "round",
            "pointy",
            "horn-shaped"
        }
    }
}

config["aerosoul"] = {
    species = "aerosoul",
    morph = {
        morphs.passenger,
        morphs.stealth,
        morphs.fighter,
        morphs.drone,
        morphs.craft
    },
    ["head size"] = "gen head size",
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
    blood = "red",
    ["bones color"] = "gen teeth color",
    ["organ color"] = "red",
    ["ear size"] = "gen ear size",
    palette = "gen palette",
    prefixed = {
        prefix = true,
        eye = {
            count = {
                { "one", COMMON },
                { "two", UNCOMMON },
                { "three", VERY_RARE },
                { "four", VERY_RARE }
            },
            shape = {
                "round",
                "oval",
                "almond-shaped",
                "curved",
                "square",
                "triangular",
                "rectangular",
                "semi-circle",
                "long round",
                "long rectangular",
                "crescent",
            }
        },
        pupil = {
            shape = {
                "round",
                "rectangular",
                "hourglass",
                "square",
                "sideways hourglass",
                "spiral",
                "slit",
                "crescent",
                "plus-shaped",
                "three-pointed star",
                "four-pointed star",
                "five-pointed star",
                "concentric circle",
                "diamond",
                "v-shaped",
                "heart",
                { id = "no", _count = "" }
            },
            count = {
                { "", COMMON },
                { "double", RARE },
            }
        },
        teeth = {
            style = "gen teeth style",
            color = {
                { "white", COMMON },
                { "silver", RARE },
                { "black", RARE }
            }
        },
        tongue = {
            style = {
                "forked",
                "round",
                "pointed"
            }
        },
        leg = {
            length = "gen leg length",
            size = "gen leg size"
        },
        fur_skin = {
            type = "smooth skin",
            color = "gen color"
        },
        arm = {
            length = "gen leg length",
            size = "gen leg size"
        },
    }
}

for name,morph in pairs(morphs) do
  local morphed = {}
  for k,v in pairs(config["aerosoul"]) do
    morphed[k] = v
  end
  morphed.morph = morph
  config["aerosoul." .. name] = morphed
end
