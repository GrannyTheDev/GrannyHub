local Obfuscater = {}

function Obfuscation(code)
local thing = [[
code
]]
local encode = thing:gsub(".", function(bb) return "\\" .. bb:byte() end) or thing .. "\""
return encode
end

function Deobfuscation(code)
    return code
end

Obfuscater.Obfuscate = Obfuscation()
Obfuscater.Deobfuscate = Deobfuscation()

return Obfuscater