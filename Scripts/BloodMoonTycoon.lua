local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Blood Moon Tycoon")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local AutoFarm = Gui:Page("AutoFarm")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

   local RequestUrl = module.GetRequetGameUrl()
   local BugUrl = module.GetBugUrl()

local filename = "DevilHub/BloodMoonTycoon - 961409234/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
rebirthgreen = false;
rebirthred = false;
rebirthblue = false;
rebirthyellow = false;
gunmods = false;
killzombies = false;
godmode = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/BloodMoonTycoon - 961409234");
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

function doRebirthGreen()
spawn(function()
while getgenv().Settings.rebirthgreen == true do
local A_1 = 121
local A_2 = game:GetService("Workspace").Tycoons["Lime green"]
local A_3 = 765329874
local Event = game:GetService("ReplicatedStorage").PlayerRebirthEvent
Event:FireServer(A_1, A_2, A_3)
wait(0.1)
end
end)
end

function doRebirthRed()
spawn(function()
while getgenv().Settings.rebirthred == true do
local A_1 = 121
local A_2 = game:GetService("Workspace").Tycoons["Really red"]
local A_3 = 765329874
local Event = game:GetService("ReplicatedStorage").PlayerRebirthEvent
Event:FireServer(A_1, A_2, A_3)
wait(0.1)
end
end)
end

function doRebirthBlue()
spawn(function()
while getgenv().Settings.rebirthblue == true do
local A_1 = 121
local A_2 = game:GetService("Workspace").Tycoons["Really blue"]
local A_3 = 765329874
local Event = game:GetService("ReplicatedStorage").PlayerRebirthEvent
Event:FireServer(A_1, A_2, A_3)
wait(0.1)
end
end)
end

function doRebirthYellow()
spawn(function()
while getgenv().Settings.rebirthyellow == true do
local A_1 = 121
local A_2 = game:GetService("Workspace").Tycoons["New Yeller"]
local A_3 = 765329874
local Event = game:GetService("ReplicatedStorage").PlayerRebirthEvent
Event:FireServer(A_1, A_2, A_3)
wait(0.1)
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
if tostring(a) == "StoredAmmo" and tostring(b) == "Value" then
	return math.huge;
end
if tostring(a) == "Ammo" and tostring(b) == "Value" then
	return math.huge;
end
return old_index(a, b);
end
while wait(1) do
for i,v in pairs(getgc(true)) do
if type(v) == 'table' then
if rawget(v, 'gunType') then
v.gunType.Semi = false
v.gunType.Auto = true
end end end end
end
end)
end

function doKillZombies()
spawn(function()
while getgenv().Settings.killzombies == true do
for i,v in pairs(workspace:children()) do
if v:findFirstChildOfClass("Humanoid") and v:findFirstChild("Head") and not game.Players:GetPlayerFromCharacter(v) then
game.ReplicatedStorage.DamageEvent:FireServer(v:findFirstChildOfClass("Humanoid"), v:findFirstChildOfClass("Humanoid").Health)
end
end
wait(0.1)
end
end)
end

function doGodMode()
spawn(function()
while getgenv().Settings.godmode == true do
game.ReplicatedStorage.DamageEvent:FireServer(game.Players.LocalPlayer.Character:WaitForChild("Humanoid"), -math.huge)
wait(1)
end
end)
end

local rebirthgreen = AutoFarm:Toggle("Lime green", function(v)
getgenv().Settings.rebirthgreen = v
Save()
if v then
doRebirthGreen()
end
end)

 local rebirthred AutoFarm:Toggle("Really red", function(v)
getgenv().Settings.rebirthred = v
Save()
if v then
doRebirthRed()
end
  end)

 local rebirthblue AutoFarm:Toggle("Really blue", function(v)
getgenv().Settings.rebirthblue = v
Save()
if v then
doRebirthBlue()
end
  end)

 local rebirthyellow AutoFarm:Toggle("Really yellow", function(v)
getgenv().Settings.rebirthyellow = v
Save()
if v then
doRebirthYellow()
    end
  end)
 
  
   local killzombies = AutoFarm:Toggle("Auto Kill Zombies", function(v)
    getgenv().Settings.killzombies = v
Save()
if v then
doKillZombies()
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

local godmode = LocalPlayer:Toggle("God Mode", function(v)
getgenv().Settings.godmode = v
Save()
if v then
doGodMode()
end
end)

local gunmods = LocalPlayer:Toggle("Mod Guns", function(v)
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

   LocalPlayer:Button("Infinite Ruby and Sapphire", function() 
   game.ReplicatedStorage.BuySapphireItemFunction:InvokeServer("AceExoSuitFrame",-math.huge)
   game.ReplicatedStorage.BuyItemFunction:InvokeServer("EmojiHatFrame",-math.huge)
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
if getgenv().Settings.rebirthgreen == true then
rebirthgreen:ChangeState(true)
end
if getgenv().Settings.rebirthred == true then
rebirthred:ChangeState(true)
end
if getgenv().Settings.rebirthblue == true then
rebirthblue:ChangeState(true)
end
if getgenv().Settings.rebirthyellow == true then
rebirthyellow:ChangeState(true)
end
if getgenv().Settings.gunmods == true then
gunmods:ChangeState(true)
end
if getgenv().Settings.killzombies == true then
killzombies:ChangeState(true)
end
if getgenv().Settings.godmode == true then
godmode:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
