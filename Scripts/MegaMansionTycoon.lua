local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Mega Mansion Tycoon")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/MegaMansionTycoon - 8328351891/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
autocollect = false;
buybuttons = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/MegaMansionTycoon - 8328351891");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

function plr()
for i,v in pairs(game.Workspace["Zednov's Tycoon Kit"].Tycoons:GetChildren()) do
    if v.Owner.Value == game.Players.LocalPlayer then
        return v
    end
end
return nil
end


function doAutoCollect()
spawn(function()
while getgenv().Settings.autocollect == true do
firetouchinterest(plr().Essentials.Giver, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
wait()
firetouchinterest(plr().Essentials.Giver, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
wait(0.1)
end
end)
end

function doSpeed()
spawn(function()
while getgenv().Settings.speed == true do
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
wait()
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

function doBuyButtons()
spawn(function()
if getgenv().Settings.buybuttons == true then
    game:GetService("Players").LocalPlayer.PlayerGui.UI:WaitForChild("Store"):Destroy()
end
while getgenv().Settings.buybuttons == true do
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(plr().Buttons:GetDescendants()) do
    if v.Name == "TouchInterest" then
        firetouchinterest(v.Parent, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
        wait()
        firetouchinterest(v.Parent, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
    end
end
debounce = false
end)
wait(2)
end
end)
end

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

LocalPlayer:Button("Teleport to base", function()
    module:Tween(TweenInfo.new(0.2), plr().Essentials.Spawn.CFrame)
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

local buybuttons = AutoFarm:Toggle("Autobuy all buttons", function(v)
getgenv().Settings.buybuttons = v
Save()
if v then
doBuyButtons()
end
end)

local autocollect = AutoFarm:Toggle("Auto Collect Cash", function(v)
getgenv().Settings.autocollect = v
Save()
if v then
doAutoCollect()
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
if getgenv().Settings.autocollect == true then
autocollect:ChangeState(true)
end
if getgenv().Settings.buybuttons == true then
buybuttons:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
