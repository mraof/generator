use rand::prelude::SliceRandom;
use rand::rngs::StdRng;
use rand::Rng;
use std::cell::RefCell;
use std::collections::BTreeMap;
use std::collections::HashMap;
use std::collections::HashSet;
use std::rc::Rc;

pub type Generated = BTreeMap<String, String>;
type GenRc = Rc<dyn Generator>;
type Generators = HashMap<String, GenRc>;

///Either `generate` or `generate_with` need to be implemented, default implementations for both use the other
pub trait Generator {
    fn generate(&self, rng: &mut StdRng, generators: &Generators) -> Generated {
        self.generate_with(rng, generators, &Generated::new())
    }

    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        _existing: &Generated,
    ) -> Generated {
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

    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
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

    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
        (**self).generate_with(rng, generators, existing)
    }
}

impl<G> Generator for Vec<G>
where
    G: Generator,
{
    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
        self.choose(rng)
            .unwrap()
            .generate_with(rng, generators, existing)
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

thread_local! {
    static DEPTH: RefCell<u32> = RefCell::new(0);
}

impl Generator for String {
    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
        let string = self.to_string();
        if let Some(name) = string.strip_prefix("gen ") {
            if let Some(generator) = generators.get(name) {
                let mut current_depth = 0;
                DEPTH.with(|depth| {
                    *depth.borrow_mut() += 1;
                    current_depth = *depth.borrow();
                });
                if current_depth > 1000 {
                    let mut map = Generated::new();
                    map.insert(
                        "".to_string(),
                        format!("Max recursion depth reached with generator {}", name),
                    );
                    return map;
                }

                let generated = generator.generate_with(rng, generators, existing);

                DEPTH.with(|depth| {
                    *depth.borrow_mut() += 1;
                });
                generated
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
    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
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

tostring_gen!(i8, i16, i32, i64, u8, u16, u32, u64, f32, f64, bool, char);

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
    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
        let mut map = Generated::new();
        for (name, generator) in &self.generators {
            let generated = generator.generate_with(rng, generators, existing);
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
    fn generate_with(
        &self,
        rng: &mut StdRng,
        generators: &Generators,
        existing: &Generated,
    ) -> Generated {
        use rand::distributions::WeightedIndex;
        let i = rng.sample(WeightedIndex::new(&self.weights).unwrap());
        self.generators[i].generate_with(rng, generators, existing)
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
            println!("{:?}", map);
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
        self.generate_with(name, rng, &Generated::new())
    }

    pub fn generate_with(&self, name: &str, rng: &mut StdRng, existing: &Generated) -> Generated {
        let mut generated = Generated::new();
        if let Some(generator) = self.generators.get(name) {
            generated.append(&mut generator.generate_with(rng, &self.generators, existing));
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
                        generator.generate_with(rng, &self.generators, existing)
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
pub mod rhai_config {
    use crate::GenRc;
    use crate::Generated;
    use crate::Generator;
    use crate::Generators;
    use crate::Handler;
    use crate::PostGenerator;
    use crate::SuperGenerator;
    use crate::WeightedGenerator;
    use rand::rngs::StdRng;
    use rand::Rng;
    use rand::SeedableRng;
    use rhai::def_package;
    use rhai::packages::Package;
    use rhai::packages::StandardPackage;
    use rhai::plugin::combine_with_exported_module;
    use rhai::plugin::export_module;
    use rhai::Array;
    use rhai::Dynamic;
    use rhai::Engine;
    use rhai::EvalAltResult;
    use rhai::EvalContext;
    use rhai::FnPtr;
    use rhai::Map;
    use rhai::Module;
    use rhai::Position;
    use rhai::Scope;
    use rhai::AST;
    use std::cell::RefCell;
    use std::collections::HashMap;
    use std::path::Path;
    use std::rc::Rc;

    #[export_module]
    mod generator_module {
        pub const COMMON: i64 = 100;
        pub const UNCOMMON: i64 = 20;
        pub const RARE: i64 = 10;
        pub const VERY_RARE: i64 = 5;
        pub const EXTREMELY_RARE: i64 = 5;
    }

    def_package! {
        pub GeneratorPackage(module) {
            StandardPackage::init(module);
            module.set_custom_type::<Weighted>("Weighted");
            module.set_custom_type::<Post>("Post");
            module.set_custom_type::<RhaiRng>("Rng");
            module.set_native_fn("Weighted", Weighted::new);
            module.set_native_fn("Post", |array| Ok(Post::new(array)));
            module.set_native_fn("random", RhaiRng::random);
            combine_with_exported_module!(module, "generator_module", generator_module);
        }
    }

    pub struct RhaiHandler {
        path: String,
        engine: Engine,
    }

    impl RhaiHandler {
        pub fn new(path: &str) -> RhaiHandler {
            let generator_package = GeneratorPackage::new();
            let mut engine = Engine::new_raw();
            engine.register_global_module(generator_package.as_shared_module());
            engine.on_var(on_var);
            RhaiHandler {
                path: path.to_string(),
                engine,
            }
        }
    }

    impl Handler for RhaiHandler {
        fn dependencies(&self, filename: &str) -> Vec<String> {
            let filename = format!("{}/generators/{}.rhai", self.path, filename);
            if !Path::new(&filename).exists() {
                return vec![];
            }
            let ast = self
                .engine
                .compile_file(filename.clone().into())
                .unwrap_or_else(|e| panic!("{} failed to compile: {}", filename, e));
            let vec = ast
                .iter_literal_variables(false, true)
                .find(|(name, _, _)| *name == "needs")
                .map(|(_, _, value)| {
                    if let Some(array) = value.clone().try_cast::<Array>() {
                        array
                            .into_iter()
                            .filter_map(|v| v.try_cast::<String>())
                            .collect()
                    } else if let Some(string) = value.clone().try_cast::<String>() {
                        vec![string]
                    } else {
                        vec![]
                    }
                })
                .unwrap_or_else(|| Vec::new());
            vec
        }
        fn load(&self, filename: &str) -> Option<HashMap<String, GenRc>> {
            let filename = format!("{}/generators/{}.rhai", self.path, filename);
            if !Path::new(&filename).exists() {
                return None;
            }
            let mut scope = Scope::new();
            scope.set_value("config", Map::new());
            //TODO This is a temporary value why is this the rng being used always
            scope.push_constant(
                "rng",
                RhaiRng(Rc::new(RefCell::new(StdRng::from_seed([0; 32])))),
            );
            let ast = self
                .engine
                .compile_file(filename.clone().into())
                .unwrap_or_else(|e| panic!("{} failed to compile: {}", filename, e));
            self.engine
                .eval_ast_with_scope(&mut scope, &ast)
                .unwrap_or_else(|e| panic!("{} failed to run: {}", filename, e));
            let config = scope
                .get_value::<Map>("config")
                .expect("config variable is invalid");
            let mut map = HashMap::new();
            let generator_package = GeneratorPackage::new();
            for (key, value) in config {
                map.insert(
                    key.to_string(),
                    into_generator(&generator_package, value, &ast),
                );
            }
            Some(map)
        }
    }

    fn on_var(
        name: &str,
        _index: usize,
        context: EvalContext,
    ) -> Result<Option<Dynamic>, Box<EvalAltResult>> {
        match name {
            "rng" => context.scope().get_value("rng").map(Some).ok_or_else(|| {
                EvalAltResult::ErrorVariableNotFound("rng".to_string(), Position::NONE).into()
            }),
            _ => Ok(None),
        }
    }

    fn into_generator(package: &GeneratorPackage, value: Dynamic, ast: &AST) -> GenRc {
        match value.type_name() {
            "string" => Rc::new(value.cast::<String>()),
            "u8" => Rc::new(value.cast::<u8>()),
            "u16" => Rc::new(value.cast::<u16>()),
            "u32" => Rc::new(value.cast::<u32>()),
            "u64" => Rc::new(value.cast::<u64>()),
            "i8" => Rc::new(value.cast::<i8>()),
            "i16" => Rc::new(value.cast::<i16>()),
            "i32" => Rc::new(value.cast::<i32>()),
            "i64" => Rc::new(value.cast::<i64>()),
            "f32" => Rc::new(value.cast::<f32>()),
            "f64" => Rc::new(value.cast::<f64>()),
            "bool" => Rc::new(value.cast::<bool>()),
            "char" => Rc::new(value.cast::<char>()),
            "()" => Rc::new(()),
            "array" => {
                let array = value.cast::<Array>();
                let gen = array
                    .into_iter()
                    .map(|e| into_generator(package, e, ast))
                    .collect::<Vec<GenRc>>();
                Rc::new(gen)
            }
            "map" => {
                let mut map = value.cast::<Map>();
                let prefix = map
                    .remove("prefix")
                    .map(|v| v.as_bool().unwrap())
                    .unwrap_or(false);
                let mut gen = SuperGenerator::new(prefix);
                for (key, value) in map {
                    gen.add(&key.to_string(), into_generator(package, value, ast));
                }
                Rc::new(gen)
            }
            "generator::rhai_config::Post" => {
                let post = value.cast::<Post>();
                let mut gen = PostGenerator::new();
                for value in post.0 {
                    gen.add(into_generator(package, value, ast));
                }
                Rc::new(gen)
            }
            "generator::rhai_config::Weighted" => {
                let weighted = value.cast::<Weighted>();
                let mut gen = WeightedGenerator::new();
                for (value, weight) in weighted.0 {
                    gen.add(into_generator(package, value, ast), weight as u32)
                }
                Rc::new(gen)
            }
            "Fn" => {
                let pointer = value.cast::<FnPtr>();
                let curried: Vec<Dynamic> = pointer.curry().iter().cloned().collect();
                let fn_name = pointer.fn_name();
                let mut argument = false;
                let functions = ast.clone_functions_only_filtered(|_, _, script, name, _params| {
                    fn_name == name || (!name.starts_with("anon$") && script)
                });
                let params = functions.iter_functions().next().unwrap().params;
                let diff = params.len() - curried.len();
                if diff == 1 {
                    argument = true
                }
                if diff > 1 {
                    panic!("Too many parameters: {:?}", params);
                }
                let mut engine = Engine::new_raw();
                engine.register_global_module(package.as_shared_module());
                engine.on_var(on_var);
                let gen = RhaiFunction {
                    engine,
                    name: fn_name.to_string(),
                    ast: functions,
                    curried,
                    argument,
                };
                Rc::new(gen)
            }
            t => Rc::new(format!("Unsupported type {}", t)),
        }
    }

    #[derive(Debug, Clone)]
    struct Post(Array);

    impl Post {
        pub fn new(values: Array) -> Post {
            Post(values)
        }
    }

    #[derive(Debug, Clone)]
    struct Weighted(Vec<(Dynamic, i64)>);

    impl Weighted {
        pub fn new(values: Array) -> Result<Weighted, Box<EvalAltResult>> {
            let mut vec = Vec::with_capacity(values.len());
            for (i, v) in values.into_iter().enumerate() {
                if let Some(mut pair) = v.try_cast::<Array>() {
                    if pair.len() != 2 {
                        return Err(format!(
                            "Element {} in weighted generator had a length of {}, should be a pair",
                            i,
                            pair.len()
                        )
                        .into());
                    }
                    if let Some(weight) = pair.remove(1).try_cast::<i64>() {
                        vec.push((pair.remove(0), weight));
                    } else {
                        return Err(format!(
                            "Element {} in weighted generator had a non integer weight",
                            i
                        )
                        .into());
                    }
                } else {
                    return Err(
                        format!("Element {} in weighted generator was not an array", i).into(),
                    );
                }
            }
            Ok(Weighted(vec))
        }
    }

    #[derive(Debug, Clone)]
    struct RhaiRng(Rc<RefCell<StdRng>>);

    impl RhaiRng {
        pub fn random(&mut self, min: i64, max: i64) -> Result<i64, Box<EvalAltResult>> {
            Ok(self.0.borrow_mut().gen_range(min..=max))
        }
    }

    pub struct RhaiFunction {
        engine: Engine,
        name: String,
        ast: AST,
        curried: Vec<Dynamic>,
        argument: bool,
    }

    impl Generator for RhaiFunction {
        fn generate_with(
            &self,
            rng: &mut StdRng,
            generators: &Generators,
            existing: &Generated,
        ) -> Generated {
            let package = GeneratorPackage::new();
            let mut scope = Scope::new();
            //scope.push_constant("rng", );
            let mut arguments = self.curried.clone();
            if let Some(curried_rng) = arguments
                .iter_mut()
                .find(|a| a.type_name() == "generator::rhai_config::RhaiRng")
            {
                *curried_rng =
                    Dynamic::from(RhaiRng(Rc::new(RefCell::new(StdRng::from_seed(rng.gen())))));
            }
            if self.argument {
                println!("o: {:?}", existing);
                arguments.push(existing.clone().into());
            }
            let returned = self
                .engine
                .call_fn(&mut scope, &self.ast, &self.name, arguments)
                .expect("Failed to run rhai function");
            into_generator(&package, returned, &self.ast).generate_with(rng, generators, existing)
        }
    }
}

#[cfg(feature = "rlua")]
pub mod lua {
    use crate::GenRc;
    use crate::Generated;
    use crate::Generator;
    use crate::Generators;
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
                if table.get("post_gen").unwrap() {
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

        fn generate_with(
            &self,
            rng: &mut StdRng,
            generators: &Generators,
            existing: &Generated,
        ) -> Generated {
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
