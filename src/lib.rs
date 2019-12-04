use std::any::Any;
use std::cell::Cell;
use std::collections::{BTreeMap, HashMap, HashSet};
use std::fs::{File, read_dir};
use std::io::Read;
use std::rc::Rc;

use rand::Rng;
use rand::rngs::StdRng;
use rand::seq::SliceRandom;
use rlua::{Function, Lua, Table, Value};

pub type Generated = BTreeMap<String, String>;
type GenRc = Rc<dyn Generator>;

pub trait Generator: Any {
    fn generate(&self, rng: &mut StdRng) -> Generated;
    /// Returns new generator with another generator added, usually (always?) a SuperGenerator
    /// Might replace this with just a method that returns `Option<SuperGenerator>` in the future?
    fn with_generator(self: Rc<Self>, other_name: &str, other: Rc<dyn Generator>) -> Rc<SuperGenerator>
        where Self: Sized
    {
        let mut generator = SuperGenerator::new(true);
        generator.add("", self);
        generator.add(other_name, other);
        Rc::new(generator)
    }
}

impl<G> Generator for &'static G
    where G: Generator + ?Sized
{
    fn generate(&self, rng: &mut StdRng) -> Generated {
        (**self).generate(rng)
    }
}

impl<G> Generator for Vec<G>
    where G: Generator + Sized
{
    fn generate(&self, rng: &mut StdRng) -> Generated {
        self.choose(rng).unwrap().generate(rng)
    }
}

impl<G> Generator for Rc<G>
    where G: Generator + ?Sized
{
    fn generate(&self, rng: &mut StdRng) -> Generated {
        (**self).generate(rng)
    }
}

impl Generator for str {
    fn generate(&self, _: &mut StdRng) -> Generated {
        let mut map = Generated::new();
        map.insert("".to_string(), self.to_string());
        map
    }
}

impl Generator for String {
    fn generate(&self, _: &mut StdRng) -> Generated {
        let mut map = Generated::new();
        map.insert("".to_string(), self.clone());
        map
    }
}

impl Generator for tcpgen::TCPList {
    fn generate(&self, _rng: &mut StdRng) -> Generated {
        let mut map = Generated::new();
        let tcp = self.gen();
        for (i, (category, t)) in tcp.types.into_iter().enumerate() {
            map.insert(format!("Category {}", i), category.to_string());
            map.insert(format!("Type {}", i), t);
        }
        for (i, (modifier, tier)) in tcp.modifiers.into_iter().enumerate() {
            map.insert(format!("Modifier Tier {}", i), tier.to_string());
            map.insert(format!("Modifier {}", i), modifier);
        }
        for (i, (anomaly, tier)) in tcp.anomalies.into_iter().enumerate() {
            map.insert(format!("Anomaly Tier {}", i), tier.to_string());
            map.insert(format!("Anomaly {}", i), anomaly);
        }
        for (i, condition) in tcp.conditions.into_iter().enumerate() {
            map.insert(format!("Condition {}", i), condition);
        }
        map.insert("Designer".to_string(), tcp.designer.to_string());
        map.insert("species".to_string(), "tcp".to_string());
        map
    }
}

#[derive(Clone)]
pub struct SuperGenerator {
    generators: BTreeMap<String, Rc<dyn Generator>>,
    prefix: bool,
}

impl SuperGenerator {
    pub fn new(prefix: bool) -> SuperGenerator {
        SuperGenerator {
            generators: BTreeMap::new(),
            prefix,
        }
    }

    pub fn add(&mut self, name: &str, generator: Rc<dyn Generator>) {
        self.generators.insert(name.to_string(), generator);
    }
}

impl Generator for SuperGenerator {
    fn generate(&self, rng: &mut StdRng) -> Generated {
        let mut map = BTreeMap::new();
        for (name, generator) in &self.generators {
            //println!("{}", name);
            let generated = generator.generate(rng);
            for (key, mut value) in generated {
                let key = {
                    if key.starts_with('_') {
                        if !value.starts_with(']') {
                            value = format!("]{}", value);
                        }
                        key[1..].to_string()
                    } else if key.is_empty() {
                        name.clone()
                    } else if self.prefix && !value.starts_with(']') {
                        format!("{} {}", name, key)
                    } else {
                        if value.starts_with(']') {
                            value = value[1..].to_string();
                        }
                        key
                    }
                };

                if map.get(&key).map_or(true, |value: &String| !value.starts_with(']')) {
                    map.insert(key, value);
                }
            }
        }
        map
    }
    fn with_generator(self: Rc<Self>, other_name: &str, other: Rc<dyn Generator>) -> Rc<SuperGenerator> {
        let mut new = (*self).clone();
        new.add(other_name, other);
        Rc::new(new)
    }
}

pub struct WeightedGenerator {
    generators: Vec<Rc<dyn Generator>>,
    weights: Vec<u32>,
}

impl WeightedGenerator {
    pub fn new() -> WeightedGenerator {
        WeightedGenerator {
            generators: vec![],
            weights: vec![],
        }
    }

    pub fn add(&mut self, generator: Rc<dyn Generator>, weight: u32) {
        self.generators.push(generator);
        self.weights.push(weight);
    }
}

impl Default for WeightedGenerator {
    fn default() -> Self {
        WeightedGenerator::new()
    }
}

impl Generator for WeightedGenerator {
    fn generate(&self, rng: &mut StdRng) -> Generated {
        use rand::distributions::WeightedIndex;
        let i = rng.sample(WeightedIndex::new(&self.weights).unwrap());
        self.generators[i].generate(rng)
    }
}

struct LuaFunction {
    lua: Rc<Lua>,
    name: String,
}

impl Generator for LuaFunction {
    fn generate(&self, rng: &mut StdRng) -> Generated {
        let mut generated: Generated = self.lua.context(|lua| {
            let mut rng = rng.clone();
            let function = lua.create_function_mut(move |_, (low, high): (u64, u64)| Ok(rng.gen_range(low, high))).unwrap();
            lua.globals().set("random", function).unwrap();

            let function = lua.named_registry_value::<_, rlua::Function>(&self.name);
            function.unwrap().call(()).unwrap()
        });
        if let Some(id) = generated.remove("id") {
            generated.insert("".to_string(), id);
        }
        generated
    }
}

struct PostGenerator {
    lua: Rc<Lua>,
    generators: HashMap<String, GenRc>,
    sequence: Vec<GenRc>,
}

impl Generator for PostGenerator {
    fn generate(&self, rng: &mut StdRng) -> BTreeMap<String, String> {
        let mut o = BTreeMap::new();
        let offset = self.lua.context(|lua| {
            let v: Value = lua.globals().get("post_o").unwrap();
            let old_o: Value = lua.globals().get("o").unwrap();
            match v {
                Value::Table(table) => {
                    let offset = table.len().unwrap() + 1;
                    table.set(offset, old_o).unwrap();
                    offset
                }
                Value::Nil => {
                    lua.globals().set("post_o", HashMap::<String, Value>::new()).unwrap();
                    0
                }
                value => panic!("Invalid lua value for PostGenerator: {:?}", value)
            }
        });

        for generator in &self.sequence {
            self.lua.context(|lua| {
                lua.globals().set("o", o.clone()).unwrap();
            });
            let mut generated = generator.generate(rng);
            for (key, value) in generated.iter().filter(|(_k, v)| v.starts_with("gen ")).map(|(k, v)| (k.clone(), v[4..].to_string())).collect::<Vec<_>>() {
                if let Some(generator) = self.generators.get(&value) {
                    generated.remove(&key);
                    for (k, v) in generator.generate(rng) {
                        if k == "" {
                            generated.insert(key.clone(), v);
                        } else {
                            generated.insert(format!("{} {}", key, k), v);
                        }
                    }
                } else {
                    println!("No such generator: \"{}\" in {:?}", key, self.generators.keys().collect::<Vec<_>>());
                }
            }
            o.append(&mut generated);
        }

        self.lua.context(|lua| {
            if offset == 0 {
                lua.globals().set("post_o", Value::Nil).unwrap();
                lua.globals().set("o", Value::Nil).unwrap();
            } else {
                let table: Table = lua.globals().get("post_o").unwrap();
                let old_o: Value = table.get(offset).unwrap();
                lua.globals().set("o", old_o).unwrap();
                table.set(offset, Value::Nil).unwrap();
            }
        });
        o
    }
}

pub struct GeneratorHandler {
    lua: Rc<Lua>,
    path: String,
    generators: HashMap<String, GenRc>,
    loaded: HashSet<String>,
}

impl GeneratorHandler {
    pub fn new(path: &str, lua: Rc<Lua>) -> GeneratorHandler {
        let generators: HashMap<String, GenRc> = HashMap::new();
        lua.context(|lua| {
            lua.globals().set("COMMON", 100).unwrap();
            lua.globals().set("UNCOMMON", 20).unwrap();
            lua.globals().set("RARE", 10).unwrap();
            lua.globals().set("VERY_RARE", 5).unwrap();
            lua.globals().set("EXTREMELY_RARE", 1).unwrap();
        });
        GeneratorHandler {
            lua,
            path: path.to_string(),
            generators,
            loaded: HashSet::new(),
        }
    }

    pub fn load(&mut self, filename: &str) {
        if self.loaded.contains(filename) {
            return;
        }
        println!("Loading {}", filename);
        use regex::Regex;
        let source = {
            let mut source = String::new();
            let _ = File::open(format!("{}/generators/{}.lua", self.path, filename)).unwrap().read_to_string(&mut source).unwrap();
            source
        };
        let re = Regex::new(r"after\s*=\s*\{.*?}").unwrap();
        if let Some(mat) = re.find(&source) {
            let after: Vec<String> = self.lua.context(|lua| {
                lua.load(mat.as_str()).exec().unwrap();
                lua.globals().get("after").unwrap()
            });
            for f in after {
                self.load(&f)
            }
        }

        let state = &self.lua;
        let generators = &mut self.generators;

        state.context(|lua| {
            lua.load("config = {}").exec().unwrap();
            lua.load(&source).exec().unwrap();
            let config: HashMap<String, Value> = lua.globals().get("config").expect("No config table");
            for (key, value) in config {
                //println!("key {}", key);
                generators.insert(key, into_generator(state, lua, value, generators));
            }
        });
        println!("Loaded");
    }

    pub fn get(&self, key: &str) -> Option<&GenRc> {
        self.generators.get(key)
    }

    pub fn insert(&mut self, key: String, generator: GenRc) {
        self.generators.insert(key, generator);
    }
}

thread_local! {
    static REGISTRY_COUNTER: Cell<u32> = Cell::new(0);
}

fn into_generator<'lua>(state: &Rc<Lua>, lua: rlua::Context<'lua>, value: Value<'lua>, generators: &HashMap<String, GenRc>) -> GenRc {
    match value {
        Value::Boolean(b) => Rc::new(b.to_string()),
        Value::Integer(i) => Rc::new(i.to_string()),
        Value::Number(n) => Rc::new(n.to_string()),
        Value::String(s) => {
            let string = s.to_str().expect("Invalid string");
            if string.starts_with("gen ") {
                generators.get(&string[4..]).unwrap_or_else(|| panic!("No such generator: \"{}\"", &string[4..])).clone()
            } else {
                Rc::new(string.to_string())
            }
        }
        Value::Table(table) => {
            if table.contains_key("generators").unwrap() || table.get("post_gen").unwrap() {
                let mut post_generators = HashMap::new();
                if let Ok(subtable) = table.get::<_, Table>("generators") {
                    for pair in subtable.pairs() {
                        let (key, value): (String, Value) = pair.unwrap();
                        post_generators.insert(key, into_generator(state, lua, value, generators));
                    }
                }
                let mut sequence = Vec::new();
                for result in table.sequence_values() {
                    sequence.push(into_generator(state, lua, result.unwrap(), generators));
                }
                let generator = PostGenerator {
                    lua: state.clone(),
                    generators: post_generators,
                    sequence
                };
                Rc::new(generator)
            } else if table.contains_key(1).unwrap() {
                //Weighted generator
                if if let Ok(subtable) = table.get::<_, Table>(1) {
                    subtable.contains_key(2).unwrap()
                } else {
                    false
                } {
                    let mut generator = WeightedGenerator::new();
                    for value in table.sequence_values::<Table>() {
                        let table = value.unwrap();
                        //println!("{} {:?} {:?}", i, table.get::<_, Value>(1), table.get::<_, Value>(2));
                        generator.add(into_generator(state, lua, table.get::<_, Value>(1).unwrap(), generators), table.get(2).expect("Weight is not integer"));
                    }
                    Rc::new(generator)
                } else {
                    let mut generator: Vec<GenRc> = Vec::new();
                    for value in table.sequence_values::<Value>() {
                        generator.push(into_generator(state, lua, value.unwrap(), generators));
                    }
                    Rc::new(generator)
                }
            } else {
                let mut generator = SuperGenerator::new(table.get("prefix").unwrap_or(false));
                for pair in table.pairs::<String, Value>() {
                    let (mut key, value) = pair.unwrap();
                    if key == "id" {
                        key = "".to_string();
                    }
                    if key != "prefix" {
                        //println!("{}", key);
                        generator.add(&key, into_generator(state, lua, value, generators))
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
        _ => Rc::new("Not supported")
    }
}

#[derive(Clone)]
pub struct OutputHandler {
    lua: Rc<Lua>,
    path: String,
    outputs: HashMap<String, String>,
}

impl OutputHandler {
    pub fn new(path: &str, lua: Rc<Lua>) -> OutputHandler {
        lua.context(|lua| {
            use inflector::Inflector;
            let plural = lua.create_function(|_, (count, s): (String, String)| {
                if count != "one" && count != "1" {
                    Ok(s.to_plural())
                } else {
                    Ok(s)
                }
            }).unwrap();
            lua.globals().set("plural", plural).unwrap();
            let cap_first = lua.create_function(|_, s: String| Ok(s.to_sentence_case())).unwrap();
            lua.globals().set("cap_first", cap_first).unwrap();
        });
        let mut outputs = OutputHandler {
            lua,
            path: path.to_string(),
            outputs: Default::default(),
        };
        for file in read_dir(format!("{}/outputs", path)).unwrap() {
            let name = file.unwrap().path().file_name().unwrap().to_string_lossy().to_string();
            println!("Loading output {}", name);
            if name.ends_with(".lua") {
                outputs.load(&name[..name.len() - 4]);
            }
        }
        outputs
    }

    pub fn load(&mut self, filename: &str) {
        if self.outputs.contains_key(filename) {
            return;
        }
        let source = {
            let mut source = format!("function {}(o)\n", filename);
            let _ = File::open(format!("{}/outputs/{}.lua", self.path, filename)).unwrap().read_to_string(&mut source).unwrap();
            source += "\nend";
            source
        };

        let state = &self.lua;
        let outputs = &mut self.outputs;

        state.context(|lua| {
            lua.load(&source).exec().unwrap();
            let output = lua.globals().get::<_, Function>(filename).unwrap();

            let counter = REGISTRY_COUNTER.with(|c| c.get());
            let name = format!("func{}", counter);
            REGISTRY_COUNTER.with(|c| c.set(counter + 1));
            lua.set_named_registry_value(&name, output).unwrap();
            outputs.insert(filename.to_string(), name);
        });
    }

    pub fn format(&self, name: &str, o: Generated) -> String {
        let o: Generated = o.into_iter().filter(|(_, v)| !v.is_empty()).collect();
        self.lua.context(|lua| {
            let functions: HashMap<String, Function> = self.outputs.iter().map(|(key, value)| (key.clone(), lua.named_registry_value(value).unwrap())).collect();
            lua.globals().set("outputs", functions).expect("Failed to set output functions");
            let registry_name = self.outputs.get(name).unwrap();
            let function: Function = lua.named_registry_value(registry_name).unwrap();
            function.call(o).unwrap()
        })
    }
}

#[cfg(test)]
mod tests {
    use std::collections::BTreeMap;
    use std::rc::Rc;

    use rlua::Lua;

    use crate::OutputHandler;

    #[test]
    fn basic() {}

    #[test]
    fn load_output() {
        let lua = Rc::new(Lua::new());
        let mut o = BTreeMap::new();
        o.insert("eats".to_string(), "eggs".to_string());
        let mut outputs = OutputHandler::new("config", lua);
        outputs.load("tcp");
        outputs.load("obj");

        println!("{}", outputs.format("tcp", o.clone()));
        println!("{}", outputs.format("obj", o.clone()));
    }
}
