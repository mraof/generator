config["dopple"] = {
    prefix = false,
    species = "dopple",
    morph = {
        { {
              prefix = true,
              id = "standard",
          }, COMMON }
    },
    prefixed = {
        prefix = true,
        head = {
            size = "gen head size",
            shape = {
                { "flat muzzled", COMMON },
                { "short muzzled", COMMON },
                { "round", COMMON },
                { "rodent-like", COMMON },
                { "angular", COMMON }
            }
        },
        hair = {
            color = {
                { "light pink", RARE },
                { "pink", RARE },
                { "dark pink", RARE },
                { "light red", RARE },
                { "red", RARE },
                { "dark red", RARE },
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
                { "horror black", EXTREMELY_RARE },
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
            length = {
                {{ id = "no", _style = "", _color = ""}, COMMON},
                { "buzzed", RARE },
                { "very short", UNCOMMON },
                { "short", COMMON },
                { "medium", UNCOMMON },
                { "long", RARE },
                { "very long", VERY_RARE },
                { "floor length", EXTREMELY_RARE }
            },
            style = {
                { "straight", RARE },
                { "curly", COMMON },
                { "fluffy", COMMON },
                { "swirly", COMMON },
                { "angular", UNCOMMON },
                { "wispy", COMMON },
                { "wavy", RARE },
                { "spiked", UNCOMMON },
                { "frizzy", UNCOMMON },
                { "braided", UNCOMMON },
                { "tied back", UNCOMMON },
                { "in a bun", UNCOMMON },
                { "pigtailed", UNCOMMON },
                { "styled", COMMON }
            }
        },
        eye = {
            shape = "gen eye shape",
            color = {
                { "light pink", VERY_RARE },
                { "pink", VERY_RARE },
                { "dark pink", VERY_RARE },
                { "light red", VERY_RARE },
                { "red", VERY_RARE },
                { "dark red", VERY_RARE },
                { "orange", VERY_RARE },
                { "light orange", VERY_RARE },
                { "dark orange", VERY_RARE },
                { "yellow", COMMON },
                { "light yellow", UNCOMMON },
                { "dark yellow", UNCOMMON },
                { "light chartreuse", VERY_RARE },
                { "chartreuse", VERY_RARE },
                { "dark chartreuse", VERY_RARE },
                { "green", VERY_RARE },
                { "light green", VERY_RARE },
                { "dark green", VERY_RARE },
                { "blue", VERY_RARE },
                { "light blue", VERY_RARE },
                { "dark blue", VERY_RARE },
                { "light indigo", VERY_RARE },
                { "indigo", VERY_RARE },
                { "dark indigo", VERY_RARE },
                { "purple", VERY_RARE },
                { "light purple", VERY_RARE },
                { "dark purple", VERY_RARE },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", VERY_RARE },
                { "light gray", VERY_RARE },
                { "mid-light gray", VERY_RARE },
                { "gray", VERY_RARE },
                { "mid-dark gray", VERY_RARE },
                { "dark gray", VERY_RARE },
                { "black", VERY_RARE },
                { "tan", VERY_RARE },
                { "dark tan", VERY_RARE },
                { "light tan", VERY_RARE },
                { "light brown", VERY_RARE },
                { "dark brown", VERY_RARE },
                { "brown", VERY_RARE }
            }
        },
        iris = {
            color = {
                { "light pink", VERY_RARE },
                { "pink", VERY_RARE },
                { "dark pink", VERY_RARE },
                { "light red", UNCOMMON },
                { "red", COMMON },
                { "dark red", UNCOMMON },
                { "orange", VERY_RARE },
                { "light orange", VERY_RARE },
                { "dark orange", VERY_RARE },
                { "yellow", VERY_RARE },
                { "light yellow", VERY_RARE },
                { "dark yellow", VERY_RARE },
                { "light chartreuse", VERY_RARE },
                { "chartreuse", VERY_RARE },
                { "dark chartreuse", VERY_RARE },
                { "green", VERY_RARE },
                { "light green", VERY_RARE },
                { "dark green", VERY_RARE },
                { "blue", VERY_RARE },
                { "light blue", VERY_RARE },
                { "dark blue", VERY_RARE },
                { "light indigo", VERY_RARE },
                { "indigo", VERY_RARE },
                { "dark indigo", VERY_RARE },
                { "purple", VERY_RARE },
                { "light purple", VERY_RARE },
                { "dark purple", VERY_RARE },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", VERY_RARE },
                { "light gray", VERY_RARE },
                { "mid-light gray", VERY_RARE },
                { "gray", VERY_RARE },
                { "mid-dark gray", VERY_RARE },
                { "dark gray", VERY_RARE },
                { "black", VERY_RARE },
                { "tan", VERY_RARE },
                { "dark tan", VERY_RARE },
                { "light tan", VERY_RARE },
                { "light brown", VERY_RARE },
                { "dark brown", VERY_RARE },
                { "brown", VERY_RARE }
            }
        },
        pupil = {
            shape = {
                { "dot", COMMON },
                { "faded", COMMON },
                { "slit", COMMON },
                { "star shaped", RARE },
                { "heart shaped", RARE },
                { "diamond shaped", RARE },
                { "cross shaped", RARE },
                { "branded", VERY_RARE }
            }
        },
        teeth = {
            color = {
                { "white", COMMON },
                { "yellow tinted", COMMON }
            },
            style = {
                { "prominent front", COMMON },
                { "crooked", COMMON },
                { "prominent canine", COMMON },
                { "standard", COMMON }
            }
        },
        tongue = {
            color = "pink",
            style = "round"
        },
        ear = {
            size = "gen ear size",
            type = {
                { "long + floppy", COMMON },
                { "short + pointed", COMMON },
                { "long + round", COMMON },
                { "short + round", COMMON }
            }
        },
        ["facial hair"] = {
            { {
                  style = {
                      { "light scruff", COMMON },
                      { "moustache", COMMON },
                      { "scruff + moustache", COMMON },
                      { "heavy scruff", COMMON },
                      { "big moustache", RARE }
                  }
              }, RARE },
            { "", COMMON }
        },
        ["belly panels"] = {
            style = {
                { "singular", COMMON },
                { "double", COMMON },
                { "transparent", RARE }
            },
            color = {
                { "light pink", RARE },
                { "pink", VERY_RARE },
                { "dark pink", RARE },
                { "light red", RARE },
                { "red", VERY_RARE },
                { "dark red", RARE },
                { "orange", VERY_RARE },
                { "light orange", RARE },
                { "dark orange", RARE },
                { "yellow", VERY_RARE },
                { "light yellow", RARE },
                { "dark yellow", RARE },
                { "light chartreuse", RARE },
                { "chartreuse", VERY_RARE },
                { "dark chartreuse", RARE },
                { "green", VERY_RARE },
                { "light green", RARE },
                { "dark green", RARE },
                { "blue", VERY_RARE },
                { "light blue", RARE },
                { "dark blue", RARE },
                { "light indigo", RARE },
                { "indigo", VERY_RARE },
                { "dark indigo", RARE },
                { "purple", VERY_RARE },
                { "light purple", RARE },
                { "dark purple", RARE },
                { "horror black ", EXTREMELY_RARE },
                { "pure white ", VERY_RARE },
                { "white", RARE },
                { "light gray", COMMON },
                { "mid-light gray", COMMON },
                { "gray", RARE },
                { "mid-dark gray", COMMON },
                { "dark gray", COMMON },
                { "black", RARE },
                { "tan", RARE },
                { "dark tan", COMMON },
                { "light tan", COMMON },
                { "light brown", COMMON },
                { "dark brown", COMMON },
                { "brown", RARE }
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
        hips = {
            { "wide", COMMON },
            { "average", UNCOMMON },
            { "straight", RARE },
            { "slender", VERY_RARE }
        },
        leg = {
            length = "gen leg length",
            size = {
                { "thin", RARE },
                { "average", UNCOMMON },
                { "thick", COMMON },
                { "muscular", VERY_RARE }
            }
        },
        feet = "gen feet",
        tail = {
            length = {
                { "very short", RARE },
                { "short", UNCOMMON },
                { "average", COMMON }
            },
            type = {
                { "cotton ball", COMMON },
                { "swirl", COMMON },
                { "pinecone", COMMON },
                { "no", COMMON }
            }
        },
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
                { "light red", RARE },
                { "red", RARE },
                { "dark red", RARE },
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
                { "horror black", EXTREMELY_RARE },
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
            type = {
                { "long fur", RARE },
                { "short fur", COMMON },
                { "messy fur", UNCOMMON },
                { "prickly fur", UNCOMMON }
            }
        },
        palette = "gen palette"
    }
}
