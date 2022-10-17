local Obfuscater = {}

function Obfuscater:Obfuscate(code)
local encode = code:gsub(".", function(bb) return "\\" .. bb:byte() end) or code .. "\""
setclipboard(encode)
end

function Obfuscater:Deobfuscate(code)
    setclipboard(code)
end

return Obfuscater