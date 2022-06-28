let needs = "species";

config["rhai examples"] = #{
    string: "string",
    number: 5.5,
    bool: false,
    super_generator: #{
        prefix: false,
        id: "Example SuperGenerator",
        meow: "meow",
        sub_generator: #{
            id: "sub generator",
            sub_field: "sub field",
        }
    },
    list: [
        "List value 1",
        "List value 2",
        "List value 3",
    ],
    weighted: Weighted([
        [ "Common value 1", COMMON ],
        [ "Common value 2", COMMON ],
        [ "Uncommon value", UNCOMMON ],
        [ "Rare value", RARE ],
        [ "Very rare value", VERY_RARE ],
        [ "Extremely rare value", EXTREMELY_RARE ],
    ]),
    reused_generator: "gen tcp",
    empty: "",
    rhai_function: || #{
        id: rng.random(1, 20),
        elf: "Elf" + "Secrets"
    },
    prefix: true,
};

let a = 1;
let meow = a + "meow";

let hair = #{
    prefix: true,
    hair: #{
        prefix: true,
        color: [
            "bus seat pattern",
            "translucent green",
            "orange"
        ]
    }
};

config["rhai post_gen test"] = Post([
    "gen karacel",
    #{
        species: "karacel",
        height: "towering",
        "hair length": "floor-length",
        "hair style": "gen hair style"
    },
    #{
        prefix: true,
        tail2: #{
            length: "short",
            type: "faux"
        }
    },
        |o| {
            let changes = #{};
            changes["meow"] = meow;
            if o["hair length"] != "no" {
                changes["hair"] = hair;
            }
            if o["species"] == "karacel" {
                changes["friend"] = "gen tcp";
            }
            changes
        }
]);

config["recursive nightmare"] = |o| {
    if rng.random(0,10000) < 9998 {"gen recursive nightmare"}
    else {"Wops"}
}
