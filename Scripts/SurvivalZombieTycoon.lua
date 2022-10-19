local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Survival Zombie Tycoon")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/SurvivalZombieTycoon - 28382335/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
gunmods = false;
autoclick = false;
infstamina = false;
sell = false;
energy = false;
rebirth = false;
buybuttons = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/SurvivalZombieTycoon - 28382335");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

function doSpeed()
spawn(function()
if getgenv().Settings.speed == true then
local oldnewindex
oldnewindex = hookmetamethod(game, "__newindex", function(a, b, c)
	if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
		return oldnewindex(a, b, 100)
	end
	    return oldnewindex(a, b, c)
	end)
end
while wait() do
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
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

function doGunMods()
spawn(function()
if getgenv().Settings.gunmods == true then
local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;

mt.__index = function(a, b)
if tostring(a) == "MaxAmmo" and tostring(b) == "Value" then
	return math.huge;
end
if tostring(a) == "ReservedBullets" and tostring(b) == "Value" then
	return math.huge;
end
return old_index(a, b);
end
end
end)
end

function doAutoClick()
spawn(function()
while getgenv().Settings.autoclick == true do
for i,v in pairs(game.Workspace.Tycoons.Spawned:GetChildren()) do
	if v.Configuration.Owner.Value == game.Players.LocalPlayer then
		fireclickdetector(v.Objects.Floor1.Begin:WaitForChild("Begin", 0.1):WaitForChild("DropMachine1", 0.1):WaitForChild("ClickPart", 0.1):WaitForChild("ClickDetector", 0.1))
	end
end
wait()
end
end)
end

function doBuyButtons()
spawn(function()
if getgenv().Settings.buybuttons == true then
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(game:GetService("Workspace").Tycoons.Spawned:GetChildren()) do
    if v.Configuration.Owner.Value == game.Players.LocalPlayer then
        for i,k in pairs(v.Buttons:GetDescendants()) do
            if k.Name == "TouchPart" then
                firetouchinterest(k, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
                wait()
                firetouchinterest(k, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
            end
        end
    end
end
debounce = false
end)
end
end)
end
    

function doInfStamina()
spawn(function()
if getgenv().Settings.infstamina == true then
local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;

mt.__index = function(a, b)
if tostring(a) == "Stamina" and tostring(b) == "Value" then
	return math.huge;
end
return old_index(a, b);
end
end
end)
end

function doSell()
spawn(function()
while getgenv().Settings.sell == true do
	for i,v in pairs(game.Workspace.Tycoons.Spawned:GetChildren()) do
	if v.Configuration.Owner.Value == game.Players.LocalPlayer then
      firetouchinterest(v.Objects.Floor1.Begin.Begin:WaitForChild("CashCollector"):WaitForChild("TouchPart"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 1) 
      wait(0.1)
      firetouchinterest(v.Objects.Floor1.Begin.Begin:WaitForChild("CashCollector"):WaitForChild("TouchPart"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
	end
end
wait(0.1)
end
end)
end

function doEnergy()
spawn(function()
while getgenv().Settings.energy == true do
	for i,v in pairs(game.Workspace.Tycoons.Spawned:GetChildren()) do
	if v.Configuration.Owner.Value == game.Players.LocalPlayer then
      firetouchinterest(v.Objects.Floor1.Generators:WaitForChild("EnergySet"):WaitForChild("EnergyCollector"):WaitForChild("TouchPart"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
      wait(0.1)
      firetouchinterest(v.Objects.Floor1.Generators:WaitForChild("EnergySet"):WaitForChild("EnergyCollector"):WaitForChild("TouchPart"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
	end
end
wait(0.1)
end
end)
end

function doRebirth()
spawn(function()
while getgenv().Settings.rebirth == true do
game.ReplicatedStorage.RemoteEvents.Rebirth:FireServer()
wait(0.1)
end
end)
end

local buybuttons = AutoFarm:Toggle("Autobuy all buttons", function(v)
getgenv().Settings.buybuttons = v
Save()
if v then
doBuyButtons()
end
end)

local autoclick = AutoFarm:Toggle("Auto Click", function(v)
getgenv().Settings.autoclick = v
Save()
if v then
doAutoClick()
end
end)

local sell = AutoFarm:Toggle("Auto Collect Cash", function(v)
getgenv().Settings.sell = v
Save()
if v then
doSell()
end
end)

local energy = AutoFarm:Toggle("Auto Collect Energy", function(v)
getgenv().Settings.energy = v
Save()
if v then
doEnergy()
end
end)

local rebirth = AutoFarm:Toggle("Auto Rebirth", function(v)
getgenv().Settings.rebirth = v
Save()
if v then
doRebirth()
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

local infstamina = LocalPlayer:Toggle("Infinite Stamina", function(v)
getgenv().Settings.infstamina = v
Save()
if v then
doInfStamina()
end
end)

local gunmods = LocalPlayer:Toggle("GunMods", function(v)
getgenv().Settings.gunmods = v
Save()
if v then
doGunMods()
end
end)

local NoclipBtn = LocalPlayer:Toggle("Noclip", function(v)
    local Workspace = game:GetService("Workspace")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local Plr = Players.LocalPlayer
    
                if v == true then
    Stepped = game:GetService("RunService").Stepped:Connect(function()
                    for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                    v.CanCollide = false
                    end end end)
                elseif v == false then
                    Stepped:Disconnect()
    end
    end)

    NoclipBtn:Keybind(Enum.KeyCode.LeftAlt)

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
if getgenv().Settings.gunmods == true then
gunmods:ChangeState(true)
end
if getgenv().Settings.autoclick == true then
autoclick:ChangeState(true)
end
if getgenv().Settings.infstamina == true then
infstamina:ChangeState(true)
end
if getgenv().Settings.sell == true then
sell:ChangeState(true)
end
if getgenv().Settings.energy == true then
energy:ChangeState(true)
end
if getgenv().Settings.rebirth == true then
rebirth:ChangeState(true)
end
if getgenv().Settings.buybuttons == true then
buybuttons:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
