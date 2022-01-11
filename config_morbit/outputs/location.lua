output = o["region"]
if o["zone"] then
    output = o["zone"] .. ", " .. output
end
if o["subzone"] then
    output = o["subzone"] .. ", " .. output
end
if o["city"] then
    output = o["city"] .. ", " .. output
end
return output
