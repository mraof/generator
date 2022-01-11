after = { "beatfox", "dopple", "demoneres", "aerosoul", "celascute", "mothlie", "obj", "karacel", "pockitt", "snuglin", "ruffneck", "regions", "genders", "sphinx", "tcp"}

local obj_regions = {
    {{
        id = "Luxson Cluster",
        zone = {
            { "gen luxson", COMMON },
            { "gen monte", UNCOMMON },
            { "gen fallow's island", UNCOMMON },
        }
    }, COMMON},
    {"gen regions", RARE}
}

local beatfox_regions = {
    {{
         id = "Luxson Cluster",
         zone = {
             { "gen luxson", COMMON },
             { "gen monte", UNCOMMON },
             { "gen fallow's island", UNCOMMON },
         }
     }, COMMON},
    {"gen regions", RARE}
}

local demoneres_regions = {
    {{
         id = "Luxson Cluster",
         zone = {
             { "gen monte", COMMON },
             { "gen luxson", UNCOMMON },
             { "gen fallow's island", RARE },
         }
     }, COMMON},
    {"gen regions", VERY_RARE}
}

local karacel_regions = {
    {"gen taverne", COMMON},
    {"gen regions", RARE}
}

local ruffneck_regions = {
    {"gen taverne", COMMON},
    {"gen regions", RARE}
}

local snuglin_regions = {
    {"gen taverne", COMMON},
    {"gen regions", RARE}
}

local pockitt_regions = {
    {"gen taverne", COMMON},
    {"gen regions", RARE}
}

local mothlie_regions = {
    {"gen taverne", COMMON},
    {"gen regions", RARE}
}

local aerosoul_regions = {
    {"gen synalboc", COMMON},
    {"gen regions", RARE}
}

local celascute_regions = {
    {"gen synalboc", COMMON},
    {"gen regions", RARE}
}

local dopple_regions = {
    {"gen plaza", COMMON},
    {"gen taverne", RARE},
    {"gen regions", VERY_RARE}
}

config["species"] = {
    "gen tcp",
    "gen karacel",
    "gen pockitt",
    "gen snuglin",
    "gen aerosoul",
    "gen celascute",
    "gen beatfox",
    "gen mothlie",
    "gen demoneres",
    "gen obj",
    "gen dopple",
    "gen ruffneck"
}

config["character.tcp"] = {
    region = "gen regions",
    generator = "gen tcp"
}

config["character.dopple"] = {
    region = dopple_regions,
    generator = "gen dopple"
}
config["character.obj"] = {
    region = obj_regions,
    generator = "gen obj"
}
config["character.beatfox"] = {
    region = beatfox_regions,
    generator = "gen beatfox"
}
config["character.demoneres"] = {
    region = demoneres_regions,
    generator = "gen demoneres"
}
config["character.aerosoul"] = {
    region = aerosoul_regions,
    generator = "gen aerosoul"
}
config["character.celascute"] = {
    region = celascute_regions,
    generator = "gen celascute"
}
config["character.karacel"] = {
    region = karacel_regions,
    generator = "gen karacel"
}
config["character.snuglin"] = {
    region = snuglin_regions,
    generator = "gen snuglin"
}
config["character.ruffneck"] = {
    region = ruffneck_regions,
    generator = "gen ruffneck"
}
config["character.mothlie"] = {
    region = mothlie_regions,
    generator = "gen mothlie"
}
config["character.pockitt"] = {
    region = pockitt_regions,
    generator = "gen pockitt"
}

config["character"] = {
    config["character.tcp"],
    config["character.dopple"],
    config["character.obj"],
    config["character.beatfox"],
    config["character.demoneres"],
    config["character.aerosoul"],
    config["character.celascute"],
    config["character.karacel"],
    config["character.snuglin"],
    config["character.ruffneck"],
    config["character.mothlie"],
    config["character.pockitt"]
}

config["supercyber"] = {
    "gen sphinx",
}

config["generators"] = {}
