use rand::prelude::SliceRandom;
use rand::rngs::StdRng;
use rand::Rng;
use std::collections::BTreeMap;
use std::collections::HashMap;
use std::collections::HashSet;
use std::rc::Rc;

pub type Generated = BTreeMap<String, String>;
type GenRc = Rc<dyn Generator>;
type Generators = HashMap<String, GenRc>;

pub trait Generator {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated;
    fn generate_with(&self, rng: &mut StdRng, generators: &Generators, _existing: &Generated) -> Generated {
        self.generate(rng, generators)
    }
}

impl<G> Generator for &G
where
    G: Generator + ?Sized,
{
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        (*self).generate(rng, generators)
    }

    fn generate_with(&self, rng: &mut StdRng, generators: &Generators, existing: &Generated) -> Generated {
        (*self).generate_with(rng, generators, existing)
    }
}

impl<G> Generator for Rc<G>
where
    G: Generator + ?Sized,
{
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        (**self).generate(rng, generators)
    }

    fn generate_with(&self, rng: &mut StdRng, generators: &Generators, existing: &Generated) -> Generated {
        (**self).generate_with(rng, generators, existing)
    }
}

impl<G> Generator for Vec<G>
where
    G: Generator,
{
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        self.choose(rng).unwrap().generate(rng, generators)
    }
}

impl Generator for () {
    fn generate(&self, _: &mut StdRng, _generators: &Generators) -> Generated {
        Generated::new()
    }
}

impl Generator for Generated {
    fn generate(&self, _: &mut StdRng, _generators: &Generators) -> Generated {
        self.clone()
    }
}

impl Generator for String {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        let string = self.to_string();
        if let Some(name) = string.strip_prefix("gen ") {
            if let Some(generator) = generators.get(name) {
                generator.generate(rng, generators)
            } else {
                let mut map = Generated::new();
                map.insert("".to_string(), format!("Missing generator: {}", name));
                map
            }
        } else {
            let mut map = Generated::new();
            map.insert("".to_string(), string);
            map
        }
    }
}

impl Generator for str {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        self.to_string().generate(rng, generators)
    }
}

//Maybe remove strings that can start with gen from using this macro to make it simple again
macro_rules! tostring_gen {
    ($($x:ty),+) => {
        $(
            impl Generator for $x {
                fn generate(&self, _: &mut StdRng, _: &Generators) -> Generated {
                        let mut map = Generated::new();
                        map.insert("".to_string(), self.to_string());
                        map
                }
            }
        )+
    }
}

tostring_gen!(i8, i16, i32, i64, u8, u16, u32, u64, f32, f64, bool);

pub struct SuperGenerator {
    generators: BTreeMap<String, GenRc>,
    prefix: bool,
}

impl SuperGenerator {
    pub fn new(prefix: bool) -> SuperGenerator {
        SuperGenerator {
            generators: BTreeMap::new(),
            prefix,
        }
    }

    pub fn add(&mut self, name: &str, generator: GenRc) {
        self.generators.insert(name.to_string(), generator);
    }
}

impl Generator for SuperGenerator {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        let mut map = Generated::new();
        for (name, generator) in &self.generators {
            let generated = generator.generate(rng, generators);
            for (key, mut value) in generated {
                let key = {
                    if key.is_empty() {
                        name.clone()
                    } else if let Some(new_key) = key.strip_prefix('_') {
                        if !value.starts_with(']') {
                            value = format!("]{}", value);
                        }
                        new_key.to_string()
                    } else if self.prefix && !value.starts_with(']') {
                        format!("{} {}", name, key)
                    } else {
                        if value.starts_with(']') {
                            value = value[1..].to_string();
                        }
                        key
                    }
                };

                if map.get(&key).map_or(true, |v: &String| !v.starts_with(']')) {
                    map.insert(key, value);
                }
            }
        }
        map
    }
}

#[derive(Default)]
pub struct WeightedGenerator {
    generators: Vec<GenRc>,
    weights: Vec<u32>,
}

impl WeightedGenerator {
    pub fn new() -> WeightedGenerator {
        Default::default()
    }

    pub fn add(&mut self, generator: GenRc, weight: u32) {
        self.generators.push(generator);
        self.weights.push(weight);
    }
}

impl Generator for WeightedGenerator {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        use rand::distributions::WeightedIndex;
        let i = rng.sample(WeightedIndex::new(&self.weights).unwrap());
        self.generators[i].generate(rng, generators)
    }
}

//Rename OrderedGenerator or SequentialGenerator?
#[derive(Default)]
pub struct PostGenerator {
    sequence: Vec<GenRc>,
}

impl PostGenerator {
    pub fn new() -> PostGenerator {
        Default::default()
    }

    pub fn add(&mut self, generator: GenRc) {
        self.sequence.push(generator);
    }
}

impl Generator for PostGenerator {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        let mut map = Generated::new();
        for generator in &self.sequence {
            let mut generated = generator.generate_with(rng, generators, &map);
            map.append(&mut generated);
        }
        map
    }
}

#[derive(Default)]
pub struct GeneratorHandler {
    handlers: Vec<Box<dyn Handler>>,
    generators: HashMap<String, GenRc>,
    loaded: HashSet<String>,
    loading: HashSet<String>,
}

impl GeneratorHandler {
    pub fn new() -> GeneratorHandler {
        Default::default()
    }

    pub fn add_handler(&mut self, handler: Box<dyn Handler>) {
        self.handlers.push(handler);
    }

    pub fn add(&mut self, name: &str, generator: GenRc) {
        self.generators.insert(name.to_string(), generator);
    }

    pub fn load(&mut self, filename: &str) {
        println!("loading {}", filename);
        if self.loaded.contains(filename) {
            return;
        }
        if !self.loading.insert(filename.to_string()) {
            panic!(
                "Circular dependencies while loading {}: {:#?}",
                filename, self.loading
            );
        }
        let mut deps = Vec::new();
        for handler in &self.handlers {
            deps.extend(handler.dependencies(filename));
        }
        for dep in deps {
            self.load(&dep);
        }
        for handler in &self.handlers {
            handler.load(filename).map(|g| self.generators.extend(g));
        }
        self.loading.remove(filename);
    }

    pub fn generate(&self, name: &str, rng: &mut StdRng) -> Generated {
        let mut generated = Generated::new();
        if let Some(generator) = self.generators.get(name) {
            generated.append(&mut generator.generate(rng, &self.generators));
        } else {
            generated.insert("".to_string(), format!("Missing generator: {}", name));
        }
        let mut to_generate: BTreeMap<String, String> = BTreeMap::new();
        loop {
            for (key, value) in &generated {
                if let Some(name) = value.strip_prefix("gen ") {
                    to_generate.insert(key.to_string(), name.to_string());
                }
            }
            if to_generate.is_empty() {
                break;
            } else {
                for (prefix, name) in &to_generate {
                    let sub_generated = if let Some(generator) = self.generators.get(name) {
                        generator.generate(rng, &self.generators)
                    } else {
                        let mut generated = Generated::new();
                        generated.insert("".to_string(), format!("Missing generator: {}", name));
                        generated
                    };
                    generated.remove(prefix);
                    for (k, v) in sub_generated {
                        let key = if prefix.is_empty() {
                            k
                        } else if k.is_empty() {
                            prefix.clone()
                        } else {
                            format!("{} {}", prefix, k)
                        };
                        generated.insert(key, v);
                    }
                }
                to_generate.clear();
            }
        }
        generated
    }
}

pub trait Handler {
    fn dependencies(&self, filename: &str) -> Vec<String>;
    fn load(&self, filename: &str) -> Option<HashMap<String, GenRc>>;
}

#[cfg(feature = "rhai")]
pub mod rhai {
    pub struct RhaiFunction {}
}

#[cfg(feature = "rlua")]
pub mod lua {
    use crate::Generators;
use crate::GenRc;
    use crate::Generated;
    use crate::Generator;
    use crate::Handler;
    use crate::PostGenerator;
    use crate::SuperGenerator;
    use crate::WeightedGenerator;
    use rand::prelude::SliceRandom;
    use rand::rngs::StdRng;
    use rand::Rng;
    use rand::SeedableRng;
    use regex::Regex;
    use rlua::Context;
    use rlua::Function;
    use rlua::Lua;
    use rlua::Value;
    use std::cell::Cell;
    use std::collections::HashMap;
    use std::fs::File;
    use std::io::Read;
    use std::rc::Rc;
    use walkdir::WalkDir;

    thread_local! {
        static REGISTRY_COUNTER: Cell<u32> = Cell::new(0);
    }

    pub struct LuaHandler {
        path: String,
        lua: Rc<Lua>,
    }

    impl LuaHandler {
        pub fn new(path: &str, lua: Rc<Lua>) -> LuaHandler {
            lua.context(|lua| {
                let dir_files = lua
                    .create_function_mut(move |_, dir: String| {
                        let files: Vec<_> = WalkDir::new(&dir)
                            .sort_by_file_name()
                            .contents_first(true)
                            .min_depth(1)
                            .into_iter()
                            .filter_map(|e| e.ok())
                            .filter(|e| e.file_type().is_file())
                            .filter_map(|e| e.path().to_str().map(ToString::to_string))
                            .collect();
                        Ok(files)
                    })
                    .unwrap();
                let trim = lua
                    .create_function(|_, s: String| Ok(s.trim().to_string()))
                    .unwrap();
                lua.globals().set("COMMON", 100).unwrap();
                lua.globals().set("UNCOMMON", 20).unwrap();
                lua.globals().set("RARE", 10).unwrap();
                lua.globals().set("VERY_RARE", 5).unwrap();
                lua.globals().set("EXTREMELY_RARE", 1).unwrap();
                lua.globals().set("dir_files", dir_files).unwrap();
                lua.globals().set("trim", trim).unwrap();
            });
            LuaHandler {
                path: path.to_string(),
                lua: lua.clone(),
            }
        }
    }

    impl Handler for LuaHandler {
        fn dependencies(&self, filename: &str) -> Vec<String> {
            if let Ok(mut f) = File::open(format!("{}/generators/{}.lua", self.path, filename)) {
                let mut source = String::new();
                f.read_to_string(&mut source).unwrap();
                let re = Regex::new(r"after\s*=\s*\{.*?}").unwrap();
                if let Some(m) = re.find(&source) {
                    self.lua.context(|lua| {
                        lua.load(m.as_str()).exec().unwrap();
                        lua.globals().get("after").unwrap()
                    })
                } else {
                    vec![]
                }
            } else {
                vec![]
            }
        }

        fn load(&self, filename: &str) -> Option<HashMap<String, GenRc>> {
            let source = File::open(format!("{}/generators/{}.lua", self.path, filename))
                .map(|mut f| {
                    let mut source = String::new();
                    f.read_to_string(&mut source).unwrap();
                    source
                })
                .ok()?;
            let mut generators = HashMap::new();
            let state = &self.lua;
            state.context(|lua| {
                lua.load(include_str!("config.lua")).exec().unwrap();
                lua.load(&source).exec().expect(filename);
                if let Ok((mut config, config_order)) =
                    lua.globals()
                        .get("config")
                        .and_then(|c: HashMap<String, Value>| {
                            lua.globals()
                                .get("config_order")
                                .and_then(|o: Vec<String>| Ok((c, o)))
                        })
                {
                    for key in config_order {
                        if let Some(value) = config.remove(&key) {
                            generators.insert(key, into_generator(state, lua, value));
                        } else {
                            println!("key {} was missing from config", key);
                        }
                    }
                }
            });
            Some(generators)
        }
    }

    fn into_generator<'lua>(state: &Rc<Lua>, lua: Context<'lua>, value: Value<'lua>) -> GenRc {
        match value {
            Value::Boolean(b) => Rc::new(b),
            Value::Integer(i) => Rc::new(i),
            Value::Number(n) => Rc::new(n),
            Value::String(s) => {
                let string = s.to_str().unwrap_or("Invalid string");
                Rc::new(string.to_string())
            }
            Value::Nil => Rc::new(()),
            Value::Table(table) => {
                //Do I actually need the generators field anymore?
                if table.contains_key("generators").unwrap() || table.get("post_gen").unwrap() {
                    let mut generator = PostGenerator::new();
                    for value in table.sequence_values() {
                        generator.add(into_generator(state, lua, value.unwrap()));
                    }
                    Rc::new(generator)
                } else if table.contains_key(1u32).unwrap() {
                    let list: Vec<Value> = table
                        .sequence_values::<Value>()
                        .map(|v| v.unwrap())
                        .collect();
                    let weighted = !list.iter().any(|v| match v {
                        Value::Table(t) => {
                            t.contains_key(3u32).unwrap() || t.get::<u32, u32>(2).is_err()
                        }
                        _ => true,
                    });
                    if weighted {
                        let mut generator = WeightedGenerator::new();
                        for value in list {
                            if let Value::Table(table) = value {
                                generator.add(
                                    into_generator(state, lua, table.get(1u32).unwrap()),
                                    table.get(2u32).unwrap(),
                                );
                            }
                        }
                        Rc::new(generator)
                    } else {
                        Rc::new(
                            list.into_iter()
                                .map(|v| into_generator(state, lua, v))
                                .collect::<Vec<GenRc>>(),
                        )
                    }
                } else {
                    let mut generator = SuperGenerator::new(table.get("prefix").unwrap_or(false));
                    for pair in table.pairs::<String, Value>() {
                        let (mut key, value) = pair.unwrap();
                        if key == "id" {
                            key = "".to_string();
                        }
                        if key != "prefix" {
                            generator.add(&key, into_generator(state, lua, value))
                        }
                    }
                    Rc::new(generator)
                }
            }
            Value::Function(f) => {
                let counter = REGISTRY_COUNTER.with(|c| c.get());
                let name = format!("func{}", counter);
                REGISTRY_COUNTER.with(|c| c.set(counter + 1));
                lua.set_named_registry_value(&name, f).unwrap();
                Rc::new(LuaFunction {
                    lua: state.clone(),
                    name,
                })
            }
            _ => Rc::new("Not supported"),
        }
    }

    pub struct LuaFunction {
        lua: Rc<Lua>,
        name: String,
    }

    impl Generator for LuaFunction {
        fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
            let state = &self.lua;
            state.context(|lua| {
                let random = {
                    let mut rng = StdRng::from_seed(rng.gen());
                    lua.create_function_mut(move |_, (low, high): (u64, u64)| {
                        Ok(rng.gen_range(low..=high))
                    })
                    .unwrap()
                };
                let choose = {
                    let mut rng = StdRng::from_seed(rng.gen());
                    lua.create_function_mut(move |_, list: Vec<String>| {
                        Ok(list.choose(&mut rng).unwrap().clone())
                    })
                    .unwrap()
                };
                let choose_multiple = {
                    let mut rng = StdRng::from_seed(rng.gen());
                    lua.create_function_mut(move |_, (list, amount): (Vec<String>, usize)| {
                        Ok(list
                            .choose_multiple(&mut rng, amount)
                            .cloned()
                            .collect::<Vec<_>>())
                    })
                    .unwrap()
                };
                lua.globals().set("random", random).unwrap();
                lua.globals().set("choose", choose).unwrap();
                lua.globals()
                    .set("choose_multiple", choose_multiple)
                    .unwrap();

                let function = lua.named_registry_value::<_, Function>(&self.name);
                let v: Value = function.unwrap().call(()).unwrap();
                let generator = into_generator(state, lua, v);
                generator.generate(rng, generators)
            })
        }

        fn generate_with(&self, rng: &mut StdRng, generators: &Generators, existing: &Generated) -> Generated {
            self.lua.context(|lua| {
                lua.globals().set("o", existing.clone()).unwrap();
            });

            let generated = self.generate(rng, generators);

            self.lua.context(|lua| {
                lua.globals().set("o", Value::Nil).unwrap();
            });
            generated
        }
    }
}
