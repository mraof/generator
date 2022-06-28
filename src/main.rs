use generator::lua::LuaHandler;
use generator::rhai_config::RhaiHandler;
use generator::GeneratorHandler;
use rand::rngs::StdRng;
use rand::SeedableRng;
use rlua::Lua;
use std::rc::Rc;

fn main() {
    let mut rng = StdRng::from_rng(rand::thread_rng()).unwrap();
    //let mut rng = StdRng::from_seed([0u8; 32]);
    let mut generator = GeneratorHandler::new();
    generator.add_handler(Box::new(RhaiHandler::new("config")));
    let lua = Rc::new(Lua::new());
    generator.add_handler(Box::new(LuaHandler::new("config_morbit", lua)));
    generator.add("hardcoded", Rc::new("Funny guy"));
    //generator.load("test");
    generator.load("rngtest");
    generator.load("species");

    let tests = vec![
        //"examples",
        //"post_gen test",
        //"function test",
        //"rude",
        //"hardcoded",
        //"rhai examples",
        //"rhai post_gen test",
        //"recursive nightmare",
        "unnamed species 1",
    ];

    for test in tests {
        let generated = generator.generate(test, &mut rng);
        println!("{}: {:#?}", test, generated);
    }
}
