after = {"common"}

config["karacel"] = {
    prefix = false,
    morph = {
        {{
             prefix = true,
             id = "shorthair",
             ear = {
                 type = {
                     {"upright", COMMON},
                     {"downturned", COMMON},
                     {"sideways", COMMON},
                     {"folded", RARE},
                     {"lop", RARE},
                     {"curled", RARE}
                 }
             },
             tail = {
                 type = {
                     {"curled", RARE},
                     {"tufted", RARE},
                     {"fluffy", UNCOMMON},
                     {"patchy", RARE},
                     {"swirled", RARE},
                     {"coiled", RARE},
                     {"shorthair", COMMON},
                     {"longhair", RARE}
                 }
             },
             fur_skin = {
                 type = {
                     {"long fur", RARE},
                     {"short fur", COMMON},
                     {"patchy fur", RARE},
                     {"hairless skin", VERY_RARE},
                     {"wirey fur", RARE},
                     {"spiky fur", RARE},
                     {"wispy fur", RARE},
                     {"messy fur", UNCOMMON},
                     {"fluffy fur", UNCOMMON}
                 }
             }
         }, COMMON},
        {{
             prefix = true,
             id = "longhair",
             ear = {
                 type = {
                     {"upright", COMMON},
                     {"downturned", COMMON},
                     {"sideways", COMMON},
                     {"folded", RARE},
                     {"lop", RARE},
                     {"curled", RARE}
                 }
             },
             tail = {
                 type = {
                     {"curled", VERY_RARE},
                     {"tufted", RARE},
                     {"fluffy", COMMON},
                     {"patchy", RARE},
                     {"swirled", RARE},
                     {"coiled", RARE},
                     {"shorthair", RARE},
                     {"longhair", COMMON}
                 }
             },
             fur_skin = {
                 type = {
                     {"long fur", COMMON},
                     {"short fur", RARE},
                     {"patchy fur", RARE},
                     {"hairless skin", VERY_RARE},
                     {"wirey fur", RARE},
                     {"spiky fur", RARE},
                     {"wispy fur", RARE},
                     {"messy fur", UNCOMMON},
                     {"fluffy fur", UNCOMMON}
                 }
             }
         }, COMMON},
        {{
             prefix = true,
             id = "hairless",
             ear = {
                 type = {
                     {"upright", COMMON},
                     {"downturned", UNCOMMON},
                     {"sideways", COMMON},
                     {"folded", RARE},
                     {"lop", RARE},
                     {"curled", RARE}
                 }
             },
             tail = {
                 type = {
                     {"curled", VERY_RARE},
                     {"patchy", RARE},
                     {"swirled", RARE},
                     {"coiled", RARE},
                     {"hairless", COMMON}
                 }
             },
             fur_skin = {
                 type = {
                     {"fur patches", RARE},
                     {"hairless skin", COMMON}
                 }
             }
         }, VERY_RARE},
        {{
             prefix = true,
             id = "wild",
             ear = {
                 type = {
                     {"upright", COMMON},
                     {"downturned", RARE},
                     {"sideways", UNCOMMON},
                     {"folded", VERY_RARE},
                     {"lop", RARE},
                     {"curled", VERY_RARE}
                 }
             },
             tail = {
                 type = {
                     {"curled", VERY_RARE},
                     {"tufted", COMMON},
                     {"fluffy", RARE},
                     {"patchy", RARE},
                     {"swirled", UNCOMMON},
                     {"coiled", RARE},
                     {"shorthair", RARE},
                     {"longhair", RARE}
                 }
             },
             fur_skin = {
                 type = {
                     {"long fur", RARE},
                     {"short fur", RARE},
                     {"patchy fur", RARE},
                     {"hairless skin", RARE},
                     {"wirey fur", COMMON},
                     {"spiky fur", UNCOMMON},
                     {"wispy fur", RARE},
                     {"messy fur", UNCOMMON},
                     {"fluffy fur", UNCOMMON}
                 }
             }
         }, RARE},
        {{
             prefix = true,
             id = "maned",
             ear = {
                 type = {
                     {"upright", COMMON},
                     {"downturned", COMMON},
                     {"sideways", COMMON},
                     {"folded", RARE},
                     {"lop", RARE},
                     {"curled", UNCOMMON}
                 }
             },
             tail = {
                 type = {
                     {"curled", RARE},
                     {"tufted", RARE},
                     {"fluffy", UNCOMMON},
                     {"patchy", COMMON},
                     {"swirled", RARE},
                     {"coiled", RARE},
                     {"shorthair", RARE},
                     {"longhair", RARE}
                 }
             },
             fur_skin = {
                 type = {
                     {"long fur", RARE},
                     {"short fur", RARE},
                     {"patchy fur", COMMON},
                     {"hairless skin", VERY_RARE},
                     {"wirey fur", RARE},
                     {"spiky fur", RARE},
                     {"wispy fur", RARE},
                     {"messy fur", UNCOMMON},
                     {"fluffy fur", UNCOMMON}
                 }
             }
         }, RARE},
    },
    prefixed = {
        prefix = true,
        head = {
            size = "gen head size",
            shape = {
                {"angular", COMMON},
                {"square", COMMON},
                {"triangular", COMMON},
                {"round", COMMON},
                {"squishy", UNCOMMON},
                {"chunky", COMMON},
                {"chubby", UNCOMMON},
                {"rectangular", UNCOMMON}
            }
        },
        hair = {
            color = {
                {"light pink", RARE},
                {"pink", RARE},
                {"dark pink", RARE},
                {"light red", RARE},
                {"red", RARE},
                {"dark red", UNCOMMON},
                {"orange", COMMON},
                {"light orange", COMMON},
                {"dark orange", COMMON},
                {"yellow", RARE},
                {"light yellow", RARE},
                {"dark yellow", RARE},
                {"light chartreuse", RARE},
                {"chartreuse", RARE},
                {"dark chartreuse", RARE},
                {"green", RARE},
                {"light green", RARE},
                {"dark green", RARE},
                {"blue", RARE},
                {"light blue", RARE},
                {"dark blue", RARE},
                {"light indigo", RARE},
                {"indigo", RARE},
                {"dark indigo", RARE},
                {"purple", RARE},
                {"light purple", RARE},
                {"dark purple", RARE},
                {"horror black", EXTREMELY_RARE},
                {"pure white", EXTREMELY_RARE},
                {"white", COMMON},
                {"light gray", COMMON},
                {"mid-light gray", COMMON},
                {"gray", COMMON},
                {"mid-dark gray", COMMON},
                {"dark gray", COMMON},
                {"black", COMMON},
                {"tan", COMMON},
                {"dark tan", COMMON},
                {"light tan", COMMON},
                {"light brown", COMMON},
                {"dark brown", COMMON},
                {"brown", COMMON}
            },
            length = "gen hair length",
            style = "gen hair style"
        },
        eye = {
            shape = "gen eye shape"
        },
        pupil = {
            shape = "slit"
        },
        teeth = {
            color = "gen teeth color",
            style = "gen teeth style"
        },
        tongue = {
            style = {
                {"standard", COMMON},
                {"pointed", VERY_RARE}
            }
        },
        ear = {
            size = "gen ear size"
        },
        ear_tuft = {
            size = {
                {"very small", RARE},
                {"small", UNCOMMON},
                {"average", COMMON},
                {"large", UNCOMMON},
                {"very large", RARE}
            },
            points = {
                {"one", RARE},
                {"two", UNCOMMON},
                {"three", COMMON},
                {"four", RARE}
            }
        },
        weight = "gen weight",
        height = "gen height",
        build = "gen build",
        scale = "gen scale",
        neck = "gen neck",
        shoulders = "gen shoulders",
        chest = "gen chest",
        bust = "gen bust",
        arm = {
            length = "gen arm length",
            size = "gen arm size"
        },
        hand = "gen hand",
        hips = "gen hips",
        leg = {
            length = "gen leg length",
            size = "gen leg size"
        },
        feet = "gen feet",
        tail = {
            length = {
                {"very short", VERY_RARE},
                {"short", RARE},
                {"average", UNCOMMON},
                {"long", COMMON},
                {"very long", UNCOMMON}
            }
        },
        blood = "red",
        bones = {
            color = "gen teeth color"
        },
        organ = {
            color = "red"
        },
        fur_skin = {
            color = {
                {"light pink", RARE},
                {"pink", RARE},
                {"dark pink", RARE},
                {"light red", RARE},
                {"red", RARE},
                {"dark red", UNCOMMON},
                {"orange", COMMON},
                {"light orange", COMMON},
                {"dark orange", COMMON},
                {"yellow", RARE},
                {"light yellow", RARE},
                {"dark yellow", RARE},
                {"light chartreuse", RARE},
                {"chartreuse", RARE},
                {"dark chartreuse", RARE},
                {"green", RARE},
                {"light green", RARE},
                {"dark green", RARE},
                {"blue", RARE},
                {"light blue", RARE},
                {"dark blue", RARE},
                {"light indigo", RARE},
                {"indigo", RARE},
                {"dark indigo", RARE},
                {"purple", RARE},
                {"light purple", RARE},
                {"dark purple", RARE},
                {"horror black", EXTREMELY_RARE},
                {"pure white", EXTREMELY_RARE},
                {"white", COMMON},
                {"light gray", COMMON},
                {"mid-light gray", COMMON},
                {"gray", COMMON},
                {"mid-dark gray", COMMON},
                {"dark gray", COMMON},
                {"black", COMMON},
                {"tan", COMMON},
                {"dark tan", COMMON},
                {"light tan", COMMON},
                {"light brown", COMMON},
                {"dark brown", COMMON},
                {"brown", COMMON}
            }
        },
        accent = {
            {"light pink", COMMON},
            {"pink", COMMON},
            {"dark pink", COMMON},
            {"light red", COMMON},
            {"red", COMMON},
            {"dark red", COMMON},
            {"orange", COMMON},
            {"light orange", COMMON},
            {"dark orange", COMMON},
            {"yellow", COMMON},
            {"light yellow", COMMON},
            {"dark yellow", COMMON},
            {"light chartreuse", COMMON},
            {"chartreuse", COMMON},
            {"dark chartreuse", COMMON},
            {"green", COMMON},
            {"light green", COMMON},
            {"dark green", COMMON},
            {"blue", COMMON},
            {"light blue", COMMON},
            {"dark blue", COMMON},
            {"light indigo", COMMON},
            {"indigo", COMMON},
            {"dark indigo", COMMON},
            {"purple", COMMON},
            {"light purple", COMMON},
            {"dark purple", COMMON},
            {"horror black", EXTREMELY_RARE},
            {"pure white", EXTREMELY_RARE},
            {"white", RARE},
            {"light gray", RARE},
            {"mid-light gray", RARE},
            {"gray", RARE},
            {"mid-dark gray", RARE},
            {"dark gray", RARE},
            {"black", RARE},
            {"tan", RARE},
            {"dark tan", RARE},
            {"light tan", RARE},
            {"light brown", RARE},
            {"dark brown", RARE},
            {"brown", RARE}
        },
        palette = {
            {"monochrome", RARE},
            {"analogous", UNCOMMON},
            {"triad", UNCOMMON},
            {"complementary", UNCOMMON},
            {"neutral w/ accent", COMMON}
        }
    }
}
