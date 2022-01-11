local morphs = {
    warrior = {
        prefix = true,
        id = "warrior",
        head = {
            shape = {
                { "long muzzled", UNCOMMON },
                { "average muzzled", COMMON },
                { "short muzzled", UNCOMMON },
                { "slope muzzled", UNCOMMON },
                { "very short muzzled", RARE },
                { "pointed muzzled", RARE },
                { "wrinkle muzzled", VERY_RARE }
            }
        },
        ear = {
            size = {
                { "very long", RARE },
                { "long", UNCOMMON },
                { "average", COMMON },
                { "short", UNCOMMON },
                { "very short", RARE },
                { "very large", RARE },
                { "large", UNCOMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", COMMON },
                { "rounded", RARE },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", UNCOMMON },
                { "floppy", VERY_RARE }
            }
        },
        tail = {
            length = {
                { "stubby", VERY_RARE },
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON },
                { "long", UNCOMMON },
                { "very long", RARE }
            },
            type = {
                { "whip", RARE },
                { "scruffy", UNCOMMON },
                { "fluffy", UNCOMMON },
                { "wispy", COMMON },
                { "tapered", RARE }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", UNCOMMON },
                { "scruffy fur", UNCOMMON },
                { "wispy fur", COMMON }
            }
        },
        neck_fluff = {
            { "mane instead of", VERY_RARE },
            { "large", UNCOMMON },
            { "small", UNCOMMON },
            { "average", COMMON },
            { "very large", RARE },
            { "very small", RARE },
            { "no", RARE },
            { "gel", EXTREMELY_RARE }
        }
    },
    royal = {
        prefix = true,
        id = "royal",
        head = {
            shape = {
                { "long muzzled", COMMON },
                { "average muzzled", UNCOMMON },
                { "short muzzled", RARE },
                { "slope muzzled", RARE },
                { "very short muzzled", VERY_RARE },
                { "pointed muzzled", COMMON },
                { "wrinkle muzzled", VERY_RARE }
            }
        },
        ear = {
            size = {
                { "very long", UNCOMMON },
                { "long", COMMON },
                { "average", UNCOMMON },
                { "short", RARE },
                { "very short", VERY_RARE },
                { "very large", RARE },
                { "large", UNCOMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", COMMON },
                { "rounded", RARE },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", RARE },
                { "floppy", VERY_RARE }
            }
        },
        tail = {
            length = {
                { "stubby", VERY_RARE },
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON },
                { "long", UNCOMMON },
                { "very long", RARE }
            },
            type = {
                { "whip", UNCOMMON },
                { "scruffy", RARE },
                { "fluffy", RARE },
                { "wispy", RARE },
                { "tapered", COMMON }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", RARE },
                { "scruffy fur", UNCOMMON },
                { "wispy fur", RARE }
            }
        },
        neck_fluff = {
            { "mane instead of", VERY_RARE },
            { "large", RARE },
            { "small", RARE },
            { "average", RARE },
            { "very large", VERY_RARE },
            { "very small", UNCOMMON },
            { "no", COMMON },
            { "gel", EXTREMELY_RARE }
        }
    },
    devil = {
        prefix = true,
        id = "devil",
        head = {
            shape = {
                { "long muzzled", COMMON },
                { "average muzzled", UNCOMMON },
                { "short muzzled", RARE },
                { "slope muzzled", COMMON },
                { "very short muzzled", VERY_RARE },
                { "pointed muzzled", UNCOMMON },
                { "wrinkle muzzled", VERY_RARE }
            }
        },
        ear = {
            size = {
                { "very long", RARE },
                { "long", UNCOMMON },
                { "average", COMMON },
                { "short", UNCOMMON },
                { "very short", RARE },
                { "very large", RARE },
                { "large", UNCOMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", RARE },
                { "rounded", COMMON },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", UNCOMMON },
                { "floppy", VERY_RARE }
            }
        },
        tail = {
            length = {
                { "stubby", VERY_RARE },
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON },
                { "long", UNCOMMON },
                { "very long", RARE }
            },
            type = {
                { "whip", UNCOMMON },
                { "scruffy", RARE },
                { "fluffy", RARE },
                { "wispy", RARE },
                { "tapered", COMMON }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", RARE },
                { "scruffy fur", COMMON },
                { "wispy fur", UNCOMMON }
            }
        },
        neck_fluff = {
            { "mane instead of", VERY_RARE },
            { "large", RARE },
            { "small", UNCOMMON },
            { "average", COMMON },
            { "very large", UNCOMMON },
            { "very small", RARE },
            { "no", RARE },
            { "gel", EXTREMELY_RARE }
        }
    },
    wild = {
        prefix = true,
        id = "wild",
        head = {
            shape = {
                { "long muzzled", RARE },
                { "average muzzled", UNCOMMON },
                { "short muzzled", COMMON },
                { "slope muzzled", RARE },
                { "very short muzzled", COMMON },
                { "pointed muzzled", VERY_RARE },
                { "wrinkle muzzled", RARE }
            }
        },
        ear = {
            size = {
                { "very long", UNCOMMON },
                { "long", COMMON },
                { "average", UNCOMMON },
                { "short", RARE },
                { "very short", VERY_RARE },
                { "very large", UNCOMMON },
                { "large", COMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", RARE },
                { "rounded", COMMON },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", RARE },
                { "floppy", RARE }
            }
        },
        tail = {
            length = {
                { "stubby", VERY_RARE },
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON },
                { "long", UNCOMMON },
                { "very long", RARE }
            },
            type = {
                { "whip", RARE },
                { "scruffy", UNCOMMON },
                { "fluffy", COMMON },
                { "wispy", UNCOMMON },
                { "tapered", RARE }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", UNCOMMON },
                { "scruffy fur", COMMON },
                { "wispy fur", UNCOMMON }
            }
        },
        neck_fluff = {
            { "mane instead of", VERY_RARE },
            { "large", COMMON },
            { "small", UNCOMMON },
            { "average", UNCOMMON },
            { "very large", RARE },
            { "very small", RARE },
            { "no", RARE },
            { "gel", EXTREMELY_RARE }
        }
    },
    scavenger = {
        prefix = true,
        id = "scavenger",
        head = {
            shape = {
                { "long muzzled", RARE },
                { "average muzzled", UNCOMMON },
                { "short muzzled", COMMON },
                { "slope muzzled", RARE },
                { "very short muzzled", UNCOMMON },
                { "pointed muzzled", VERY_RARE },
                { "wrinkle muzzled", RARE }
            }
        },
        ear = {
            size = {
                { "very long", RARE },
                { "long", UNCOMMON },
                { "average", COMMON },
                { "short", UNCOMMON },
                { "very short", RARE },
                { "very large", RARE },
                { "large", UNCOMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", COMMON },
                { "rounded", RARE },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", UNCOMMON },
                { "floppy", VERY_RARE }
            }
        },
        tail = {
            length = {
                { "stubby", RARE },
                { "very short", UNCOMMON },
                { "short", COMMON },
                { "average", UNCOMMON },
                { "long", RARE },
                { "very long", VERY_RARE }
            },
            type = {
                { "whip", RARE },
                { "scruffy", UNCOMMON },
                { "fluffy", UNCOMMON },
                { "wispy", COMMON },
                { "tapered", RARE }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", UNCOMMON },
                { "scruffy fur", UNCOMMON },
                { "wispy fur", RARE }
            }
        },
        neck_fluff = {
            { "mane instead of", COMMON },
            { "large", UNCOMMON },
            { "small", RARE },
            { "average", UNCOMMON },
            { "very large", RARE },
            { "very small", VERY_RARE },
            { "no", RARE },
            { "gel", EXTREMELY_RARE }
        }
    },
    bullistic = {
        prefix = true,
        id = "bullistic",
        head = {
            shape = {
                { "long muzzled", VERY_RARE },
                { "average muzzled", RARE },
                { "short muzzled", UNCOMMON },
                { "slope muzzled", RARE },
                { "very short muzzled", UNCOMMON },
                { "pointed muzzled", VERY_RARE },
                { "wrinkle muzzled", COMMON }
            }
        },
        ear = {
            size = {
                { "very long", VERY_RARE },
                { "long", RARE },
                { "average", UNCOMMON },
                { "short", COMMON },
                { "very short", UNCOMMON },
                { "very large", RARE },
                { "large", UNCOMMON },
                { "small", UNCOMMON },
                { "very small", RARE }
            },
            type = {
                { "pointed", RARE },
                { "rounded", RARE },
                { "notched", UNCOMMON },
                { "lop", RARE },
                { "sideways", VERY_RARE },
                { "floppy", COMMON }
            }
        },
        tail = {
            length = {
                { "stubby", VERY_RARE },
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON },
                { "long", UNCOMMON },
                { "very long", RARE }
            },
            type = {
                { "whip", UNCOMMON },
                { "scruffy", VERY_RARE },
                { "fluffy", VERY_RARE },
                { "wispy", VERY_RARE },
                { "tapered", COMMON }
            }
        },
        fur_skin = {
            type = {
                { "short fur", COMMON },
                { "long fur", RARE },
                { "scruffy fur", RARE },
                { "wispy fur", RARE }
            }
        },
        neck_fluff = {
            { "mane instead of", EXTREMELY_RARE },
            { "large", EXTREMELY_RARE },
            { "small", EXTREMELY_RARE },
            { "average", EXTREMELY_RARE },
            { "very large", EXTREMELY_RARE },
            { "very small", EXTREMELY_RARE },
            { "no", RARE },
            { "gel", COMMON }
        }
    }
}

config["ruffneck"] = {
    prefix = false,
    species = "ruffneck",
    morph = {
        {morphs.warrior, COMMON },
        {morphs.royal, RARE },
        {morphs.devil, UNCOMMON },
        {morphs.wild, RARE },
        {morphs.scavenger, UNCOMMON },
        {morphs.bullistic, VERY_RARE }
    },
    prefixed = {
        prefix = true,
        head = {
            size = "gen head size"
        },
        hair = {
            color = {
                { "light pink", RARE },
                { "pink", RARE },
                { "dark pink", RARE },
                { "light red", UNCOMMON },
                { "red", UNCOMMON },
                { "dark red", UNCOMMON },
                { "orange", RARE },
                { "light orange", RARE },
                { "dark orange", RARE },
                { "yellow", RARE },
                { "light yellow", RARE },
                { "dark yellow", RARE },
                { "light chartreuse", RARE },
                { "chartreuse", RARE },
                { "dark chartreuse", RARE },
                { "green", RARE },
                { "light green", RARE },
                { "dark green", RARE },
                { "blue", RARE },
                { "light blue", RARE },
                { "dark blue", RARE },
                { "light indigo", RARE },
                { "indigo", RARE },
                { "dark indigo", RARE },
                { "purple", RARE },
                { "light purple", RARE },
                { "dark purple", RARE },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", COMMON },
                { "light gray", COMMON },
                { "mid-light gray", COMMON },
                { "gray", COMMON },
                { "mid-dark gray", COMMON },
                { "dark gray", COMMON },
                { "black", COMMON },
                { "tan", COMMON },
                { "dark tan", COMMON },
                { "light tan", COMMON },
                { "light brown", COMMON },
                { "dark brown", COMMON },
                { "brown", COMMON }
            },
            length = "gen hair length",
            style = {
                { "straight", RARE },
                { "curly", RARE },
                { "fluffy", UNCOMMON },
                { "wavy", UNCOMMON },
                { "angular", RARE },
                { "wispy", COMMON },
                { "swirly", RARE },
                { "spiked", RARE },
                { "frizzy", UNCOMMON },
                { "braided", RARE },
                { "tied back", RARE },
                { "in a bun", RARE },
                { "pigtailed", RARE },
                { "styled", UNCOMMON }
            }
        },
        eye = {
            shape = "gen eye shape",
            color = {
                { "light pink", COMMON },
                { "pink", COMMON },
                { "dark pink", COMMON },
                { "light red", COMMON },
                { "red", COMMON },
                { "dark red", COMMON },
                { "orange", COMMON },
                { "light orange", COMMON },
                { "dark orange", COMMON },
                { "yellow", COMMON },
                { "light yellow", COMMON },
                { "dark yellow", COMMON },
                { "light chartreuse", COMMON },
                { "chartreuse", COMMON },
                { "dark chartreuse", COMMON },
                { "green", COMMON },
                { "light green", COMMON },
                { "dark green", COMMON },
                { "blue", COMMON },
                { "light blue", COMMON },
                { "dark blue", COMMON },
                { "light indigo", COMMON },
                { "indigo", COMMON },
                { "dark indigo", COMMON },
                { "purple", COMMON },
                { "light purple", COMMON },
                { "dark purple", COMMON },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", UNCOMMON },
                { "light gray", RARE },
                { "mid-light gray", RARE },
                { "gray", RARE },
                { "mid-dark gray", RARE },
                { "dark gray", RARE },
                { "black", UNCOMMON },
                { "tan", RARE },
                { "dark tan", RARE },
                { "light tan", RARE },
                { "light brown", RARE },
                { "dark brown", RARE },
                { "brown", RARE }
            }
        },
        pupil = {
            shape = "round"
        },
        teeth = {
            color = "white",
            style = "gen teeth style"
        },
        tongue = {
            color = "pink",
            style = "round"
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
        blood = {
            color = "red"
        },
        bones = {
            color = "white"
        },
        organ = {
            color = "red"
        },
        fur_skin = {
            color = {
                { "light pink", RARE },
                { "pink", RARE },
                { "dark pink", RARE },
                { "light red", UNCOMMON },
                { "red", UNCOMMON },
                { "dark red", UNCOMMON },
                { "orange", RARE },
                { "light orange", RARE },
                { "dark orange", RARE },
                { "yellow", RARE },
                { "light yellow", RARE },
                { "dark yellow", RARE },
                { "light chartreuse", RARE },
                { "chartreuse", RARE },
                { "dark chartreuse", RARE },
                { "green", RARE },
                { "light green", RARE },
                { "dark green", RARE },
                { "blue", RARE },
                { "light blue", RARE },
                { "dark blue", RARE },
                { "light indigo", RARE },
                { "indigo", RARE },
                { "dark indigo", RARE },
                { "purple", RARE },
                { "light purple", RARE },
                { "dark purple", RARE },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", COMMON },
                { "light gray", COMMON },
                { "mid-light gray", COMMON },
                { "gray", COMMON },
                { "mid-dark gray", COMMON },
                { "dark gray", COMMON },
                { "black", COMMON },
                { "tan", COMMON },
                { "dark tan", COMMON },
                { "light tan", COMMON },
                { "light brown", COMMON },
                { "dark brown", COMMON },
                { "brown", COMMON }
            }
        },
        deposits = {
            { {
                  type = {
                      { "gemstone", COMMON },
                      { "mineral", COMMON },
                      { "eastite", EXTREMELY_RARE },
                      { "diamond", RARE },
                      { "emerald", RARE },
                      { "lapis", RARE },
                      { "pearl", RARE },
                      { "charcoal", RARE },
                      { "coal", UNCOMMON },
                      { "pyrite", RARE },
                      { "iron", UNCOMMON },
                      { "copper", UNCOMMON },
                      { "ferrofluid", EXTREMELY_RARE },
                      { "glass", UNCOMMON },
                      { "porcelain", RARE },
                      { "magnet", VERY_RARE },
                      { "mica", RARE },
                      { "quartz", RARE },
                      { "amethyst", RARE },
                      { "jade", RARE },
                      { "gold", UNCOMMON },
                      { "silver", UNCOMMON },
                      { "platinum", UNCOMMON },
                      { "garnet", RARE },
                      { "marble", VERY_RARE },
                      { "pebble", RARE }
                  },
                  color = {
                      { "shaved", COMMON },
                      { "very small", UNCOMMON },
                      { "speckled", COMMON },
                      { "small", COMMON },
                      { "medium", COMMON },
                      { "large", COMMON },
                      { "very large", UNCOMMON },
                      { "chunky", RARE },
                      { "spiked", RARE },
                      { "hidden", RARE }
                  }
              }, COMMON },
            { "", UNCOMMON }
        },
        palette = "gen palette"
    }
}

for name,morph in pairs(morphs) do
  local morphed = {}
  for k,v in pairs(config["ruffneck"]) do
    morphed[k] = v
  end
  morphed.morph = morph
  config["ruffneck." .. name] = morphed
end
