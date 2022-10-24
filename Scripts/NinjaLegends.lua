local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Ninja Legends")

local AutoFarm = Window:Page("AutoFarm")

local Teleport = Window:Page("Teleport")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/NinjaLegends - 3956818381/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
swing = false;
infjump = false;
sell = false;
buysword = false;
buybelt = false;
buyrank = false;
buyskill = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/NinjaLegends - 3956818381");
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
game:GetService("RunService").RenderStepped:Connect(function()
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100
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
    loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/GrannyCmd.lua"))()
end
end)
end

function doThrow()
spawn(function()
while getgenv().Settings.throw == true do
fireclickdetector(game:GetService("Workspace").RadioMountain.Factory.BarrelGiver.Button.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(367, 34, -396)
wait(0.1)
end
end)
end

function doInfjump()
spawn(function()
if getgenv().Settings.infjump == true then
local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
    
mt.__index = function(a, b)
    if tostring(a) == "multiJumpCount" and tostring(b) == "Value" then
        return math.huge;
    end
        return old_index(a, b);
    end
end
end)
end

function doSwing()
spawn(function()
while getgenv().Settings.swing == true do
game:GetService("Players").hvmjhjhhi.ninjaEvent:FireServer("swingKatana")
wait(0.1)
end
end)
end

function doSell()
spawn(function()
while getgenv().Settings.sell == true do
firetouchinterest(game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
wait(0.1)
firetouchinterest(game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
wait(0.1)
end
end)
end

function doBuySword()
spawn(function()
while getgenv().Settings.buysword == true do
local a = game:GetService("ReplicatedStorage").Weapons:GetChildren()
for i = 1,#a do
local A_1 = "buyAllSwords"
local A_2 = a[i]
local Event = game:GetService("Players").LocalPlayer.ninjaEvent
Event:FireServer(A_1, A_2)
end
wait(0.1)
end
end)
end

function doBuyBelt()
spawn(function()
while getgenv().Settings.buybelt == true do
local a = game:GetService("ReplicatedStorage").Belts:GetChildren()
for i = 1,#a do
local A_1 = "buyAllBelts"
local A_2 = a[i]
local Event = game:GetService("Players").LocalPlayer.ninjaEvent
Event:FireServer(A_1, A_2)
end
wait(0.1)
end
end)
end

function doBuyRank()
spawn(function()
while getgenv().Settings.buyrank == true do
local a = game:GetService("ReplicatedStorage").Ranks:GetChildren()
for i = 1,#a do
local A_1 = "buyRank"
local A_2 = a[i]
local Event = game:GetService("Players").LocalPlayer.ninjaEvent
Event:FireServer(A_1, A_2)
end
wait(0.1)
end
end)
end

function doBuySkill()
spawn(function()
while getgenv().Settings.buyskill == true do
local a = game:GetService("ReplicatedStorage").Ranks:GetChildren()
for i = 1,#a do
local A_1 = "buyAllSkills"
local A_2 = a[i]
local Event = game:GetService("Players").LocalPlayer.ninjaEvent
Event:FireServer(A_1, A_2)
end
wait(0.1)
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

local sell = AutoFarm:Toggle("Auto Sell", function(v)
getgenv().Settings.sell = v
Save()
if v then
doSell()
end
end)

local swing = AutoFarm:Toggle("Auto Swing Katana", function(v)
getgenv().Settings.swing = v
Save()
if v then
doSwing()
end
end)

local buysword = AutoFarm:Toggle("Auto Buy Swords", function(v)
getgenv().Settings.buysword = v
Save()
if v then
doBuySword()
end
end)

local buybelt = AutoFarm:Toggle("Auto Buy Belts", function(v)
getgenv().Settings.buybelt = v
Save()
if v then
doBuyBelt()
end
end)

local buyskill = AutoFarm:Toggle("Auto Buy Skills", function(v)
getgenv().Settings.buyskill = v
Save()
if v then
doBuySkill()
end
end)

local buyrank = AutoFarm:Toggle("Auto Buy Ranks", function(v)
getgenv().Settings.buyrank = v
Save()
if v then
doBuyRank()
end
end)

LocalPlayer:Button("Unlock all islands", function()
    for i,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        if v:IsA("MeshPart") then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
            wait()
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        end
    end
end)

local infjump = LocalPlayer:Toggle("Infinite multi jump", function(v)
getgenv().Settings.infjump = v
Save()
if v then
doInfjump()
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
if getgenv().Settings.infjump == true then
infjump:ChangeState(true)
end
if getgenv().Settings.swing == true then
swing:ChangeState(true)
end
if getgenv().Settings.sell == true then
sell:ChangeState(true)
end
if getgenv().Settings.buysword == true then
buysword:ChangeState(true)
end
if getgenv().Settings.buybelt == true then
buybelt:ChangeState(true)
end
if getgenv().Settings.buyrank == true then
buyrank:ChangeState(true)
end
if getgenv().Settings.buyskill == true then
buyskill:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end