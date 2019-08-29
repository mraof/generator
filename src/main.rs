use std::rc::Rc;

use rand::{Rng, SeedableRng};
use rand::rngs::StdRng;
use rlua::Lua;

use generator::{Generator, GeneratorHandler};

fn main() {
    let mut rng = StdRng::from_seed(rand::random());
    let lua = Rc::new(Lua::new());
    lua.context(|lua| {
        let mut rng = rng.clone();
        let function = lua.create_function_mut(move |_, (low, high): (u64, u64)| Ok(rng.gen_range(low, high))).unwrap();
        lua.globals().set("random", function).unwrap();
        lua.globals().set("COMMON", 100).unwrap();
        lua.globals().set("UNCOMMON", 20).unwrap();
        lua.globals().set("RARE", 10).unwrap();
        lua.globals().set("VERY_RARE", 5).unwrap();
        lua.globals().set("EXTREMELY_RARE", 1).unwrap();
    });

    let mut generators = GeneratorHandler::new(lua.clone());
    generators.insert("tcpgen".to_string(), Rc::new(tcpgen::TCPList::new("/home/mraof/github/tcpgen")));
    generators.load("test");
    generators.load("species");

    for _ in 0..10 {
        let generator = generators.get("karacel").unwrap();
        let generated = generator.generate(&mut rng);
        for (key, value) in generated.into_iter()
            .map(|(key, value)| (key, if value.starts_with(']') { value[1..].to_string() } else { value }))
            .filter(|(_, value)| !value.is_empty()) {
            println!("{}: {}", key, value);
        }
    }
}
