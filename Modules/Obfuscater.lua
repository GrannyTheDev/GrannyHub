local Obfuscater = {}

function Obfuscation(code)
local thing = [[
code
]]
local encode = thing:gsub(".", function(bb) return "\\" .. bb:byte() end) or thing .. "\""
setclipboard(code)
end

function Deobfuscation(code)
    setclipboard(code)
end

Obfuscater.Obfuscate = Obfuscation()
Obfuscater.Deobfuscate = Deobfuscation()

return Obfuscater