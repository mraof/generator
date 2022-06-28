fn height(rng) {
    let inches = rng.random(0,11);
    let feet = rng.random(4,8);
    feet + "'" + inches
}
let height = || height(rng);

config["unnamed species 1"] = Post([
    #{
        height: height,
        color: [
            "orange",
            "blue",
            "white",
            "black",
            "red",
            "green",
            "mauve",
            "cyan",
        ]
    },
    #{
        output: |o| "This " + o["color"] + "-furred creature is " + o["height"] + " tall"
    },
])
