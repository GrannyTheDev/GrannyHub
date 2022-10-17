local Obfuscater = {}

function Obfuscation(code)
local encode = code:gsub(".", function(bb) return "\\" .. bb:byte() end) or code .. "\""
setclipboard(code)
end

function Deobfuscation(code)
    setclipboard(code)
end

Obfuscater.Obfuscate = Obfuscation()
Obfuscater.Deobfuscate = Deobfuscation()

return Obfuscater