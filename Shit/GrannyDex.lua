if gethui then
     for i,v in pairs(gethui():GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyDe" or v.Name == "Gui" or v.Name == "ScreenGui" then
		v:Destroy()
	  end
     end
elseif syn and syn.unprotect_gui then
     for i,v in pairs(game.CoreGui:GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyDex" then
                syn.unprotect_gui(v)
          end
          if v:IsA("ScreenGui") and v.Name == "GrannyDex" or v.Name == "Gui" or v.Name == "ScreenGui" then
                v:Destroy()
	  end
     end
else
     for i,v in pairs(game.CoreGui:GetChildren()) do
	  if v:IsA("ScreenGui") and v.Name == "GrannyDex" or v.Name == "Gui" or v.Name == "ScreenGui" then
		v:Destroy()
	  end
     end
end

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))()
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua", true))()
    
    getgenv().Bypassed_Dex = game:GetObjects("rbxassetid://11333502943")[1]
    
    local charset = {}
    for i = 48,  57 do table.insert(charset, string.char(i)) end
    for i = 65,  90 do table.insert(charset, string.char(i)) end
    for i = 97, 122 do table.insert(charset, string.char(i)) end
    function RandomCharacters(length)
        if length > 0 then
            return RandomCharacters(length - 1) .. charset[math.random(1, #charset)]
        else
            return ""
        end
    end
    
    Bypassed_Dex.Name = "GrannyDex"
    if gethui then
        Bypassed_Dex.Parent = gethui();
    elseif syn and syn.protect_gui then
        syn.protect_gui(Bypassed_Dex);
        Bypassed_Dex.Parent = cloneref(game:GetService("CoreGui"))
    else
        Bypassed_Dex.Parent = cloneref(game:GetService("CoreGui"))
    end
    
    local function Load(Obj, Url)
        local function GiveOwnGlobals(Func, Script)
            local Fenv = {}
            local RealFenv = {script = Script}
            local FenvMt = {}
            function FenvMt:__index(b)
                if RealFenv[b] == nil then
                    return getfenv()[b]
                else
                    return RealFenv[b]
                end
            end
            function FenvMt:__newindex(b, c)
                if RealFenv[b] == nil then
                    getfenv()[b] = c
                else
                    RealFenv[b] = c
                end
            end
            setmetatable(Fenv, FenvMt)
            setfenv(Func, Fenv)
            return Func
        end
        
        local function LoadScripts(Script)
            if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
                task.spawn(GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script))
            end
            for _,v in ipairs(Script:GetChildren()) do
                LoadScripts(v)
            end
        end
        
        LoadScripts(Obj)
    end
    
    Load(Bypassed_Dex)
