after = { "beatfox", "demoneres", "aerosoul", "obj", "karacel", "pockitt", "snuglin", "regions", "genders" }

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

local karacel_regions = {
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

local aerosoul_regions = {
    {"gen synalboc", COMMON},
    {"gen regions", RARE}
}

config["species"] = {
    {
        species = "karacel",
        generator = "gen karacel"
    },
    {
        species = "pockitt",
        generator = "gen pockitt"
    },
    {
        species = "tcp",
        generator = "gen tcp"
    },
    {
        species = "snuglin",
        generator = "gen snuglin"
    },
    {
        species = "beatfox",
        generator = "gen beatfox"
    },
    {
        species = "aerosoul",
        generator = "gen aerosoul"
    },
    {
        species = "obj",
        generator = "gen obj"
    }
}

config["character"] = {
    {
        species = "obj",
        region = obj_regions,
        generator = "gen obj"
    },
    {
        species = "beatfox",
        region = beatfox_regions,
        generator = "gen beatfox"
    },
    {
        species = "tcp",
        region = "gen regions",
        generator = "gen tcp"
    },
    {
        species = "aerosoul",
        region = aerosoul_regions,
        generator = "gen aerosoul"
    },
    {
        species = "karacel",
        region = karacel_regions,
        generator = "gen karacel"
    },
    {
        species = "snuglin",
        region = snuglin_regions,
        generator = "gen snuglin"
    },
    {
        species = "pockitt",
        region = pockitt_regions,
        generator = "gen pockitt"
    }
}
