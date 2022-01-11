use generator::lua::LuaHandler;
use rlua::Lua;
use generator::GeneratorHandler;
use rand::rngs::StdRng;
use rand::SeedableRng;
use std::rc::Rc;

fn main() {
    let mut rng = StdRng::from_rng(rand::thread_rng()).unwrap();
    let mut generator = GeneratorHandler::new();
    let lua = Rc::new(Lua::new());
    generator.add_handler(Box::new(LuaHandler::new("config_morbit", lua)));
    generator.add("tcp", Rc::new("Funny guy"));
    generator.load("test");
    generator.load("species");
    let generated = generator.generate("examples", &mut rng);
    println!("{:#?}", generated);
    let generated = generator.generate("post_gen test", &mut rng);
    println!("{:#?}", generated);
    let generated = generator.generate("function test", &mut rng);
    println!("{:#?}", generated);
    let generated = generator.generate("rude", &mut rng);
    println!("{:#?}", generated);
}
