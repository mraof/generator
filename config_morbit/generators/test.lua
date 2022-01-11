---
--- Created by mraof.
--- DateTime: 8/24/19 10:10 PM
---

after = { "common", "regions" }

-- Anything after -- are comments, and will be ignored when the config is loaded
-- Anywhere that a string (text in quotes) is used, you can put any other sort of generator
config["examples"] = { -- the config value itself is a SuperGenerator in this case, but it can be any kind of generator
    string = "string", -- The most basic type of generator, just returns its own value
    number = 5.5, -- Numbers return their own value
    bool = false, -- booleans (true/false values) also just return their own value
    super_generator = { -- returns all fields listed, fields can be any sort of generator
        prefix = false, -- whether to prefix the names of fields sub generators return with the name of the sub generator, defaults to false
        id = "Example SuperGenerator", -- Base field generator returns, will just be called whatever the parent adds as a prefix (field not required)
        meow = "meow",
        sub_generator = {
            id = "sub generator",
            sub_field = "sub field",
        }
    },
    list = {
        "List value 1",
        "List value 2",
        "List value 3",
    },
    weighted = { -- Generator that chooses from list based on rarity
        { "Common value 1", COMMON },
        { "Common value 2", COMMON },
        { "Uncommon value", UNCOMMON },
        { "Rare value", RARE },
        { "Very rare value", VERY_RARE },
        { "Extremely rare value", EXTREMELY_RARE },
    },
    reused_generator = "gen tcp", -- Strings that start with "gen " reuse generators defined before this one
    empty = "", -- Empty strings mean to not set the field, use in lists or weighted generators to make them optional
    lua_function = function()
        -- custom generator defined in lua, can return multiple fields the same way as a super generator, but the fields have to be strings, numbers or booleans
        return {
            id = random(1, 20),
            elf = "Elf" .. "Secrets"
        }
    end,
    prefix = true,
}

config["maybe hair"] = {
    prefix = true,
    hair = {
        { {
              length = "gen hair length",
              style = "gen hair style",
          }, COMMON },
        { "", COMMON }
    }
}

head_casing = {
    { {
          { "mechanical", COMMON },
          { {
                { "appliance", COMMON },
                { "blender", COMMON },
                { "microwave", COMMON },
            }, COMMON },
          { {
                { "robotic", COMMON },
                { "laser", COMMON },
                { "robot", COMMON },
                { "construct", COMMON },
            }, COMMON },
      }, COMMON },
    { {
          { "fragile", COMMON },
          { "glass", COMMON },
          { "soda can", COMMON },
          { "ceramic", COMMON },
      }, COMMON },
    { "custom", RARE }
}
config["head casing"] = head_casing

config["order test"] = "gen head casing"

local hair = {
  prefix = true,
  hair = {
    prefix = true,
    color = {
      "bus seat pattern",
      "translucent green",
      "orange"
    }
  }
}

config["post_gen test"] = {
  post_gen = true,
    "gen karacel",
    {
        species = "karacel",
        height = "towering",
        ["hair length"] = "floor-length",
        ["hair style"] = "gen hair style"
    },
    {
        prefix = true,
        tail2 = {
            length = "short",
            type = "faux"
        }
    },
    function()
        local changes = {}
        if o["hair length"] ~= "no" then
            changes["hair"] = hair
        end
        if o["species"] == "karacel" then
            changes["friend"] = "gen tcp"
        end
        return changes
    end
}

config["function test"] = function()
    local num = random(0, 5)
    if num == 0 then
        return "Meow"
    elseif num == 1 then
        return 3
    elseif num == 2 then
        return 1.1
    elseif num == 3 then
        return {name = "Grunge Wizard", profession = "struggling lumberjack"}
    elseif num == 4 then
        return false
    end
end


config["rude"] = function()
  if counter == nil then
    counter = 0
  end
  counter = counter + 1
  return {
    "gen rude",
    "gen rude",
    "gen rude",
    "gen rude",
    "gen rude",
    "gen rude",
    "gen rude",
    {counter = counter}}
end
