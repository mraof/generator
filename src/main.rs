use std::collections::BTreeMap;
use std::rc::Rc;

use rand::SeedableRng;
use rand::rngs::StdRng;
use rlua::Lua;

use generator::{Generator, GeneratorHandler, OutputHandler};

fn main() {
    let mut rng = StdRng::from_seed(rand::random());
    let lua = Rc::new(Lua::new());

    let mut generators = GeneratorHandler::new("config", lua.clone());
    generators.insert("tcp".to_string(), Rc::new(tcpgen::TCPList::new("/home/mraof/github/tcpgen")));
    generators.load("species");
    generators.load("test");

    let mut outputs = OutputHandler::new("config", lua);
    outputs.load("tcp");
    outputs.load("obj");

    let tcp_types = {
        let mut tcp_types = BTreeMap::new();
        tcp_types.insert("Abstract".to_string(), "[Abstract]".to_string());
        tcp_types.insert("Body".to_string(), "[Body]".to_string());
        tcp_types.insert("Creature".to_string(), "[Creature]".to_string());
        tcp_types.insert("Food".to_string(), "[Food]".to_string());
        tcp_types.insert("Form".to_string(), "[Form]".to_string());
        tcp_types.insert("Machine".to_string(), "[Machine]".to_string());
        tcp_types.insert("Nature".to_string(), "[Nature]".to_string());
        tcp_types.insert("Storage".to_string(), "[Storage]".to_string());
        tcp_types.insert("Weapon".to_string(), "[Weapon]".to_string());
        tcp_types
    };

    for _ in 0..100 {
        let generator = generators.get("character").unwrap();
        let mut generated = generator.generate(&mut rng);
/*
        for (key, value) in generated.iter()
            .filter(|(_, value)| !value.is_empty()) {
            println!("{}: {}", key, value);
        }
*/
        generated.append(&mut tcp_types.clone());
        println!("{}", outputs.format("character", generated));
    }
}


