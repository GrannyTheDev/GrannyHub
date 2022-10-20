local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Mad City")

   local AutoFarm = Gui:Page("AutoFarm")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

   local RequestUrl = module.GetRequetGameUrl()
   local BugUrl = module.GetBugUrl()

   local Players = game.Players.LocalPlayer

local filename = "DevilHub/WorldZero - 2727067538/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
autokill = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/WorldZero - 2727067538");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

function doAutoKill()
    spawn(function()
        local plr = game.Players.LocalPlayer
        local class = game.Players.LocalPlayer.Character.Properties.Class.Value
        local Classes = {
            ["Swordmaster"] = {"Swordmaster1", "Swordmaster2", "Swordmaster3", "Swordmaster4", "Swordmaster5", "Swordmaster6", "CrescentStrike1", "CrescentStrike2", "CrescentStrike3", "Leap"};
            ["Mage"]  = {"Mage1", "ArcaneBlastAOE", "ArcaneBlast", "ArcaneWave1", "ArcaneWave2", "ArcaneWave3", "ArcaneWave4", "ArcaneWave5", "ArcaneWave6", "ArcaneWave7", "ArcaneWave8", "ArcaneWave9"};
            ["Defender"] = {"Defender1", "Defender2", "Defender3", "Defender4", "Defender5", "Groundbreaker", "Spin1", "Spin2", "Spin3", "Spin4", "Spin5"};
            ["DualWielder"] = {"DualWield1", "DualWield2", "DualWield3", "DualWield4", "DualWield5", "DualWield6", "DualWield7", "DualWield8", "DualWield9", "DualWield10", "DashStrike", "CrossSlash1", "CrossSlash2", "CrossSlash3", "CrossSlash4"};
            ["Guardian"] = {"Guardian1", "Guardian2", "Guardian3", "Guardian4", "SlashFury1", "SlashFury2", "SlashFury3", "SlashFury4", "SlashFury5", "SlashFury6", "SlashFury7", "SlashFury8", "SlashFury9", "SlashFury10", "SlashFury11", "SlashFury12", "SlashFury13", "RockSpikes1", "RockSpikes2", "RockSpikes3"};
            ["IcefireMage"] = {"IcefireMage1", "IcySpikes1", "IcySpikes2", "IcySpikes3", "IcySpikes4", "IcefireMageFireballBlast", "IcefireMageFireball", "LightningStrike1", "LightningStrike2", "LightningStrike3", "LightningStrike4", "LightningStrike5", "IcefireMageUltimateFrost", "IcefireMageUltimateMeteor1"};
            ["Berserker"] = {"Berserker1", "Berserker2", "Berserker3", "Berserker4", "Berserker5", "Berserker6", "AggroSlam", "GigaSpin1", "GigaSpin2", "GigaSpin3", "GigaSpin4", "GigaSpin5", "GigaSpin6", "GigaSpin7", "GigaSpin8", "Fissure1", "Fissure2", "FissureErupt1", "FissureErupt2", "FissureErupt3", "FissureErupt4", "FissureErupt5"};
            ["Paladin"] = {"Paladin1", "Paladin2", "Paladin3", "Paladin4", "LightThrust1", "LightThrust2", "LightPaladin1", "LightPaladin2"};
            ["MageOfLight"] = {"MageOfLight", "MageOfLightBlast"};
            ["Demon"] = {"Demon1", "Demon4", "Demon7", "Demon10", "Demon13", "Demon16", "Demon19", "Demon22", "Demon25", "DemonDPS1", "DemonDPS2", "DemonDPS3", "DemonDPS4", "DemonDPS5", "DemonDPS6", "DemonDPS7", "DemonDPS8", "DemonDPS9", "ScytheThrowDPS1", "ScytheThrowDPS2", "ScytheThrowDPS3", "DemonLifeStealDPS", "DemonSoulDPS1", "DemonSoulDPS2", "DemonSoulDPS3"};
            ["Dragoon"] = {"Dragoon1", "Dragoon2", "Dragoon3", "Dragoon4", "Dragoon5", "Dragoon6"};
            ["Archer"] = {"Archer"};
        };
        
        local cl = Classes[class]
        function closest()
            local Character = plr.Character
            local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            if not (Character or HumanoidRootPart) then return end
            
            local TargetDistance,Target = math.huge
            
            for i,v in next, workspace.Mobs:GetChildren() do
                if v:FindFirstChild("Collider") then
                    local mag = (HumanoidRootPart.Position - v.Collider.Position).magnitude
                    if mag < TargetDistance and mag <= 10 and v.HealthProperties.Health.Value > 0 then
                        TargetDistance = mag
                        Target = v
                    end
                end
            end
            return Target
        end
        local ind = 0
        repeat task.wait(0.1)
            c = closest()
            if c then
                ind = ind + 1
                game:GetService("ReplicatedStorage").Shared.Combat.Attack:FireServer(cl[ind],c.Collider.Position, c.Collider.Position - plr.Character.HumanoidRootPart.Position)
                print((plr.Character.HumanoidRootPart.Position - c.Collider.Position).magnitude)
                task.wait(_G.cooldown)
                if ind >= #cl then
                    ind = 0
                end
            end
            for i,v in next, workspace.Mobs:GetChildren() do
                if v:FindFirstChild("Collider") then
                    module:Tween(TweenInfo.new(0.2), v.Collider.Position)
                end
            end
        until plr.Character.Humanoid.Health <= 0 and getgenv().Settings.autokill == false
    end)
end

function doSpeed()
spawn(function()
if getgenv().Settings.speed == true then
    local gmt = getrawmetatable(game)
    local oldIndex = gmt.__namecall
    setreadonly(gmt, false)
    
    gmt.__namecall = newcclosure(function(Self, ...)
    local method = getnamecallmethod()
    if Self == game.Players.LocalPlayer and tostring(method) == "Kick" then
       return
    end
    return oldIndex(Self, ...)
    end)
    
    local oldnewindex
    oldnewindex = hookmetamethod(game, "__newindex", function(a, b, c)
        if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
            return oldnewindex(a, b, 100)
        end
        return oldnewindex(a, b, c)
    end)
         
    game:GetService("RunService").Stepped:Connect(function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
    end)
end
end)
end

function doJump()
spawn(function()
if getgenv().Settings.jump == true then
game:GetService("UserInputService").JumpRequest:connect(function()
game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
end)
end
end)
end

function doInfYield()
spawn(function()
if getgenv().Settings.infyield == true then
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end
end)
end

function doAntiAfk()
spawn(function()
if getgenv().Settings.antiafk == true then
    local VirtualUser = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
end)
end

local autokill = AutoFarm:Toggle("Autokill", function(v)
getgenv().Settings.autokill = v
Save()
if v then
doAutoKill()
end
end)

local speed = LocalPlayer:Toggle("WalkSpeed", function(v)
getgenv().Settings.speed = v
Save()
if v then
doSpeed()
end
end)

local jump = LocalPlayer:Toggle("Infinite Jump", function(v)
getgenv().Settings.jump = v
Save()
if v then
doJump()
end
end)

Misc:Button("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

local infyield = Misc:Toggle("Infinite Yield", function(v)
getgenv().Settings.infyield = v
Save()
if v then
doInfYield()
end
end)

local antiafk = Misc:Toggle("Anti Afk", function(v)
getgenv().Settings.antiafk = v
Save()
if v then
doAntiAfk()
end
end)

Misc:Button("Join the discord server", function()
	setclipboard("https://discord.com/invite/esn6q3BbV2")
end)

Misc:Box("Request games", "Type a game name here", function(msg)
    request({
        Url = RequestUrl,
        Method = "POST",
        Headers = {
             ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({content = msg.."\n".. "userID: "..game:GetService("Players").LocalPlayer.UserId.."\n".. "Username: "..game:GetService("Players").LocalPlayer.Name.."\n".. "Displayname: "..game:GetService("Players").LocalPlayer.DisplayName.."\n"})
    })
    end)
    
    Misc:Box("Report Bugs", "Type the bug here", function(msg)
        request({
            Url = BugUrl,
            Method = "POST",
            Headers = {
                 ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({content = msg.."\n".. "userID: "..game:GetService("Players").LocalPlayer.UserId.."\n".. "Username: "..game:GetService("Players").LocalPlayer.Name.."\n".. "Displayname: "..game:GetService("Players").LocalPlayer.DisplayName.."\n"})
        })
        end)

Load()
if getgenv().Settings.speed == true then
speed:ChangeState(true)
end
if getgenv().Settings.jump == true then
jump:ChangeState(true)
end
if getgenv().Settings.infyield == true then
infyield:ChangeState(true)
end
if getgenv().Settings.antiafk == true then
antiafk:ChangeState(true)
end
if getgenv().Settings.autokill == true then
autokill:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end