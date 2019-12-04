USED=$(grep -oe 'o\["[[:alnum:]_ ]*"' $1 | sed 's/^o//'|sed 's/"$/"] = true,/')

echo "local used = {
$USED
Abstract = true,
Body = true,
Form = true,
    Creature = true,
    Food = true,
    Machine = true,
    Nature = true,
    Storage = true,
    Weapon = true,
}


for k,v in pairs(o) do
    if not used[k] then
        print(k .. \" \" .. v)
    end
end
"
