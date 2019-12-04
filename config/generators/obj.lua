after = { "common" }

config["obj"] = {
    prefix = false,
    morph = {
        {{
             prefix = true,
             id = "bird",
             arm = {
                 id = {
                     { "bird", COMMON},
                     {{
                          {"sparrow", COMMON},
                          {"budgie",COMMON},
                          {"seagull",RARE},
                          {"hawk",COMMON},
                          {"falcon",COMMON},
                          {"hummingbird",RARE},
                          {"duck",COMMON},
                          {"chicken",COMMON},
                          {"featherless",EXTREMELY_RARE}
                      }, COMMON}
                 },
                 term = "wings"
             },
         }, COMMON},
        {{
             prefix = true,
             id = "bat",
             arm = {
                 id = {
                     { "bat", COMMON},
                     {{
                          {"cloak", COMMON},
                      }, COMMON}
                 },
                 term = "wings"
             },
         }, UNCOMMON},
        {{
             prefix = true,
             id = "bug",
             arm = {
                 id = {
                     { "bug", COMMON},
                     {{
                          {"beetle", COMMON},
                          {"bee",COMMON},
                          {"butterfly",COMMON},
                          {"dragonfly",COMMON},
                          {"moth",COMMON},
                          {"mantis scythes instead of",VERY_RARE},
                      }, COMMON}
                 },
                 term = "wings"
             },
         }, UNCOMMON},
        {{
             prefix = true,
             id = "aquatic",
             arm = {
                 id = {
                     { "aquatic", COMMON},
                     {{
                          {"dolphin", COMMON},
                          {"whale",COMMON},
                          {"seal",COMMON},
                          {"sea lion",COMMON},
                          {"fish",COMMON},
                          {"shark",COMMON},
                          {"squid tentacles instead of",VERY_RARE},
                          {"octopus tentacles instead of",VERY_RARE},
                      }, COMMON}
                 },
                 term = "fins"
             },
         }, VERY_RARE},
        {{
             prefix = true,
             id = "mammal",
             arm = {
                 id = {
                     { "standard", COMMON},
                     {{
                          {"paw", COMMON},
                          {"claw", COMMON},
                          {"digging", RARE},
                          {"padded", UNCOMMON},
                          {"taloned", UNCOMMON},
                      }, COMMON}
                 },
                 term = "hands"
             },
         }, UNCOMMON}
    },
    prefixed = {
        prefix = true,
        hair = {
            {{
                 length = "gen hair length",
                 style = "gen hair style",
             }, EXTREMELY_RARE},
            {"", COMMON}
        },
        eye = {
            {{
                 shape = "gen eye shape",
                 color = {
                     {"light pink",COMMON}, {"pink",COMMON}, {"dark pink",COMMON}, {"light red",COMMON}, {"red",COMMON}, {"dark red",COMMON}, {"orange",COMMON}, {"light orange",COMMON}, {"dark orange",COMMON}, {"yellow",COMMON}, {"light yellow",COMMON}, {"dark yellow",COMMON}, {"light chartreuse",COMMON}, {"chartreuse",COMMON}, {"dark chartreuse",COMMON}, {"green",COMMON}, {"light green",COMMON}, {"dark green",COMMON}, {"blue",COMMON}, {"light blue",COMMON}, {"dark blue",COMMON}, {"light indigo",COMMON}, {"indigo",COMMON}, {"dark indigo",COMMON}, {"purple",COMMON}, {"light purple",COMMON}, {"dark purple",COMMON}, {"horror black",EXTREMELY_RARE}, {"pure white",VERY_RARE}, {"white",COMMON}, {"light gray",COMMON}, {"mid-light gray",COMMON}, {"gray",COMMON}, {"mid-dark gray",COMMON}, {"dark gray",COMMON}, {"black",COMMON}, {"tan",COMMON}, {"dark tan",COMMON}, {"light tan",COMMON}, {"light brown",COMMON}, {"dark brown",COMMON}, {"brown",COMMON}
                 }
             }, EXTREMELY_RARE},
            {"", COMMON}
        },
        ear = {
            {{
                 size = "gen ear size",
                 type = {"pointed", COMMON},
                 {"lop",COMMON},
                 {"floppy",COMMON},
                 {"curled",COMMON},
                 {"folded",COMMON},
                 {"downwards",COMMON},
                 {"sideways",COMMON},
                 {"spiky",VERY_RARE},
                 {"fin",VERY_RARE},
                 {"horn",VERY_RARE}
             }, EXTREMELY_RARE},
            {"", COMMON}
        },
        weight = {
            {"thin",RARE},
            {"sleek",UNCOMMON},
            {"average",COMMON},
            {"soft",COMMON},
            {"chubby",COMMON},
            {"fat",COMMON}
        },
        height = "gen height",
        teeth = {
            {"jack o lantern", COMMON}, {"wavy",UNCOMMON}, {"square",UNCOMMON}, {"bumpy",UNCOMMON}, {"stretchy",VERY_RARE}, {"straight line",RARE}
        },
        tongue = {
            {"slime", COMMON}, {"long slime",UNCOMMON}, {"pointed slime",UNCOMMON}, {"forked slime",RARE}
        },
        build = "gen build",
        scale = "gen scale",
        neck = "gen neck",
        shoulders = "gen shoulders",
        chest = "gen chest",
        bust = {
            {"flat", RARE},
            {"small",COMMON},
            {"medium",COMMON},
            {"large",COMMON}
        },
        arm = {
            length = "gen arm length",
            size = {
                {"very small", RARE},
                {"small",UNCOMMON},
                {"average",COMMON},
                {"large",UNCOMMON},
                {"very large",RARE}
            }
        },
        hand = {""},
        hips = {
            {"wide", COMMON},
            {"average",UNCOMMON},
            {"straight",UNCOMMON},
            {"slender",UNCOMMON}
        },
        leg = {
            length = "gen leg length",
            size = {
                {"thin", COMMON},
                {"average",COMMON},
                {"thick",COMMON},
                {"muscular",RARE}
            }
        },
        feet = "OBJ",
        fur_skin = {
            color = {
                {"light pink",COMMON}, {"pink",COMMON}, {"dark pink",COMMON}, {"light red",COMMON}, {"red",COMMON}, {"dark red",COMMON}, {"orange",COMMON}, {"light orange",COMMON}, {"dark orange",COMMON}, {"yellow",COMMON}, {"light yellow",COMMON}, {"dark yellow",COMMON}, {"light chartreuse",COMMON}, {"chartreuse",COMMON}, {"dark chartreuse",COMMON}, {"green",COMMON}, {"light green",COMMON}, {"dark green",COMMON}, {"blue",COMMON}, {"light blue",COMMON}, {"dark blue",COMMON}, {"light indigo",COMMON}, {"indigo",COMMON}, {"dark indigo",COMMON}, {"purple",COMMON}, {"light purple",COMMON}, {"dark purple",COMMON}, {"horror black",EXTREMELY_RARE}, {"pure white",VERY_RARE}, {"white",COMMON}, {"light gray",COMMON}, {"mid-light gray",COMMON}, {"gray",COMMON}, {"mid-dark gray",COMMON}, {"dark gray",COMMON}, {"black",COMMON}, {"tan",COMMON}, {"dark tan",COMMON}, {"light tan",COMMON}, {"light brown",COMMON}, {"dark brown",COMMON}, {"brown",COMMON}
            },
            type = {
                {"moist skin", COMMON},
                {"bumpy skin",COMMON},
                {"slimy skin",COMMON},
                {"coarse skin",UNCOMMON},
                {"smooth skin",UNCOMMON},
                {"dry skin",RARE},
                {"cracked skin",VERY_RARE},
                {"patchy covered skin",VERY_RARE}
            }
        },
        palette = "gen palette",
        head_casing = {
            { {
                  { "toy", COMMON },
                  { {
                        {"doll", COMMON},
                        {"puppet", COMMON},
                        {"teddy bear", COMMON},
                        {"rc car", COMMON},
                        {"building block", COMMON},
                        {"stuffed animal", COMMON},
                        {"action figure", COMMON},
                        {"globe", COMMON},
                        {"yoyo", COMMON},
                        {"drinky bird", COMMON},
                        {"toy clown", COMMON},
                        {"jack in the box", COMMON},
                        {"toy train", COMMON},
                        {"ornament", COMMON},
                        {"bounce house", COMMON},
                        {"kite", COMMON},
                        {"coloring book", COMMON},
                        {"crayons", COMMON},
                        {"pencil", COMMON},
                        {"fishbowl", COMMON},
                        {"sports equipment", COMMON},
                        {"ball", COMMON},
                        {"board games", COMMON},
                        {"tops", COMMON},
                        {"trading cards", COMMON},
                        {"book", COMMON},
                        {"morbit jenga", COMMON},
                        {"morbit rubix cube", COMMON},
                        {"videogame controller", COMMON},
                        {"videogame system", COMMON},
                        {"finger trap", COMMON},
                        {"joystick", COMMON},
                        {"marble maze", COMMON},
                        {"designer toy", COMMON},
                        {"playset", COMMON},
                        {"dollhouse", COMMON},
                        {"ping pong ball", COMMON},
                        {"ping pong paddle", COMMON},
                        {"pet toy", COMMON},
                        {"rattle", COMMON},
                        {"baby blanket", COMMON},
                        {"blanket", COMMON},
                        {"pillow", COMMON},
                        {"balloon", COMMON},
                        {"ball in a cup", COMMON},
                        {"rubber duck", COMMON},
                        {"nut cracker", COMMON},
                        {"matryoshka doll", COMMON},
                        {"wheel", COMMON},
                        {"chemistry set", COMMON},
                        {"beaker", COMMON},
                        {"fidget spinner", EXTREMELY_RARE},
                        {"juggling clubs", COMMON},
                        {"juggling balls", COMMON},
                        {"glow in the dark star", COMMON},
                        {"pogs", COMMON},
                        {"skateboard", COMMON},
                        {"scooter", COMMON},
                        {"bike", COMMON},
                        {"toy sword", COMMON},
                        {"real sword", COMMON},
                        {"water pistol", COMMON},
                        {"morbit nerf gun", COMMON},
                        {"bow and arrow", COMMON},
                        {"sock puppet", COMMON}
                    }, COMMON },

              }, COMMON
            },
            { {
                  { "simple", COMMON },
                  { {
                        {"square", COMMON},
                        {"rectangle", COMMON},
                        {"clamshell", COMMON},
                        {"pocket", COMMON},
                        {"hemisphere", COMMON},
                        {"hourglass", COMMON},
                        {"snowman shaped", UNCOMMON},
                        {"abstract", UNCOMMON},
                        {"revolved solid", UNCOMMON},
                        {"letters", RARE},
                        {"numbers", RARE},
                        {"ziggurat", RARE},
                        {"tower", RARE},
                        {"bizarre shapes", RARE},
                        {"unknowable shapes", RARE},
                        {"shifting shapes", RARE},
                        {"mobius strip", RARE},
                        {"torus", RARE}
                    }, COMMON },

              }, COMMON
            },
            { {
                  { "custom", COMMON },
                  { {
                        {"homemade", COMMON},
                        {"designer", COMMON},
                        {"mass produced", COMMON},
                        {"other species inspired", COMMON}
                    }, COMMON },

              }, RARE
            },
            { {
                  { "inorganic", COMMON },
                  { {
                        {"plastic", COMMON},
                        {"rubber", COMMON},
                        {"moldable", COMMON},
                        {"leather", COMMON},
                        {"sandpaper", COMMON},
                        {"stone", COMMON},
                        {"velvet", COMMON},
                        {"crushed glass", COMMON},
                        {"stained glass", COMMON},
                        {"metal", COMMON},
                        {"fly paper", COMMON},
                        {"wax", COMMON},
                        {"clay", COMMON},
                        {"modeling clay", COMMON},
                        {"diamond", COMMON},
                        {"wire", COMMON},
                        {"mesh", COMMON}
                    }, COMMON },

              }, COMMON
            },
            { {
                  { "misc", COMMON },
                  { {
                        {"sphere", COMMON},
                        {"cube", COMMON},
                        {"pyramid", COMMON},
                        {"tetrahedron", COMMON},
                        {"cylinder", COMMON},
                        {"prism", COMMON},
                        {"orb", COMMON},
                        {"cone", COMMON},
                        {"disk", COMMON},
                        {"obelisk", COMMON},
                        {"circle", COMMON},
                        {"triangle", COMMON},
                        {"light bulb", COMMON},
                        {"neon sign", COMMON},
                        {"snowglobe", COMMON},
                        {"glitter jar", COMMON},
                        {"soap", COMMON},
                        {"fidget cube", COMMON},
                        {"bottle", COMMON},
                        {"flask", COMMON},
                        {"fountain", COMMON},
                        {"birdbath", COMMON},
                        {"painting", COMMON},
                        {"sign", COMMON},
                        {"billboard", COMMON},
                        {"mirror", COMMON},
                        {"crate", COMMON},
                        {"bowl", COMMON},
                        {"cheese grater", COMMON},
                        {"knife", COMMON},
                        {"gun", COMMON},
                        {"wind chime", COMMON},
                        {"music box", COMMON},
                        {"kazoo", COMMON},
                        {"taser", COMMON},
                        {"stapler", COMMON},
                        {"staple remover", COMMON},
                        {"bear trap", COMMON}
                    }, COMMON },

              }, RARE
            },
            { {
                  { "mechanical", COMMON },
                  { {
                        {"appliance", COMMON},
                        { {
                              {"blender", COMMON},
                              {"microwave", COMMON},
                              {"can opener", COMMON},
                              {"stovetop", COMMON},
                              {"toaster", COMMON},
                              {"dishwasher", COMMON},
                              {"refrigerator", COMMON},
                              {"freezer", COMMON}
                          }, COMMON },
                    }, COMMON },
                  { {
                        {"electronic", COMMON},
                        { {
                              {"television", COMMON},
                              {"radio", COMMON},
                              {"computer", COMMON},
                              {"solar panel", COMMON},
                              {"wind turbine", COMMON},
                              {"camera", COMMON},
                              {"microphone", COMMON},
                              {"speakers", COMMON},
                              {"clock", COMMON},
                              {"security camera", COMMON},
                              {"webcam", COMMON}
                          }, COMMON },
                    }, COMMON },
                  { {
                        {"robotic", COMMON},
                        { {
                              {"laser", COMMON},
                              {"robot", COMMON},
                              {"construct", COMMON}
                          }, COMMON },
                    }, COMMON },

              }, COMMON
            },
            { {
                  { "fragile", COMMON },
                  { {
                        {"glass", COMMON},
                        {"soda can", COMMON},
                        {"ceramic", COMMON},
                        {"paper", COMMON},
                        {"cardboard", COMMON},
                        {"wax paper", COMMON},
                        {"bubble", COMMON},
                        {"jar", COMMON},
                        {"window", COMMON},
                        {"origami", COMMON},
                        {"papercraft", COMMON},
                        {"sandcastle", COMMON},
                        {"haystack", COMMON},
                        {"glass ornament", COMMON},
                        {"vase", COMMON},
                        {"veiled", COMMON},
                        {"polyester stuffing", COMMON},
                        {"fabric", COMMON},
                        {"ice cube", COMMON}
                    }, COMMON },

              }, COMMON
            },
            { {
                  { "organic", COMMON },
                  { {
                        {"vine", COMMON},
                        {"flower", COMMON},
                        {"bush", COMMON},
                        {"wood", COMMON},
                        {"fungus", COMMON},
                        {"flesh", RARE},
                        {"maw", VERY_RARE},
                        {"teeth", VERY_RARE},
                        {"fur", UNCOMMON},
                        {"plant", COMMON},
                        {"food", RARE},
                        {"slime", COMMON},
                        {"crystal", COMMON},
                        {"toxic crystal", COMMON},
                        {"another person’s head", VERY_RARE},
                        {"taxidermy", RARE},
                        {"liquid", COMMON},
                        {"river", COMMON},
                        {"water", COMMON},
                        {"lava", COMMON},
                        {"koi pond", COMMON},
                        {"scales", COMMON},
                        {"feathers", COMMON},
                        {"fur", COMMON},
                        {"egg", COMMON},
                        {"egg yolk", RARE},
                        {"marimo", COMMON},
                        {"moss", COMMON},
                        {"lichen", COMMON},
                        {"leaves", COMMON}
                    }, COMMON },

              }, RARE
            },
            { {
                  { "bizarre", COMMON },
                  { {
                        {"hologram", EXTREMELY_RARE},
                        {"lizard", EXTREMELY_RARE},
                        {"cake", COMMON},
                        {"sticker", COMMON},
                        {"cloud", COMMON},
                        {"nested", COMMON},
                        {"horror", EXTREMELY_RARE},
                        {"scrap", EXTREMELY_RARE},
                        {"shred", EXTREMELY_RARE},
                        {"masked", COMMON},
                        {"costumed", COMMON},
                        {"weather/space", COMMON},
                        {"mist", UNCOMMON},
                        {"smog", UNCOMMON},
                        {"sun", UNCOMMON},
                        {"star", UNCOMMON},
                        {"sun", UNCOMMON},
                        {"moon", UNCOMMON},
                        {"meteor", UNCOMMON},
                        {"constellation", UNCOMMON},
                        {"void", UNCOMMON},
                        {"castle", COMMON},
                        {"drug", COMMON},
                        {"pill bottle", COMMON},
                        {"dimensional", COMMON},
                        {"door", COMMON},
                        {"wireframe", COMMON},
                        {"polygonal", COMMON},
                        {"3d model", COMMON},
                        {"portal", COMMON},
                        {"code", COMMON},
                        {"program", COMMON},
                        {"bong", COMMON},
                        {"low poly", COMMON},
                        {"mimic", COMMON},
                        {"shapeshifter", COMMON},
                        {"steam", COMMON},
                        {"vibrating", COMMON},
                        {"cigarette", COMMON},
                        {"vape", COMMON},
                        {"vape cloud", COMMON},
                        {"booze bottle", COMMON},
                        {"an entire animal", COMMON},
                        {"acid", COMMON},
                        {"haunted house", COMMON},
                        {"house", COMMON},
                        {"factory", COMMON},
                        {"tcp", COMMON},
                        {"pocket home", COMMON},
                        {"tape dispenser", COMMON},
                        {"dream", COMMON},
                        {"stardust", COMMON}
                    }, COMMON },

              }, VERY_RARE
            }
        }
    }
}
