local Obfuscater = {}

function Obfuscater:Obfuscation(code)
local encode = code:gsub(".", function(bb) return "\\" .. bb:byte() end) or code .. "\""
setclipboard(encode)
end

function Obfuscater:Deobfuscation(code)
    setclipboard(code)
end

return Obfuscater