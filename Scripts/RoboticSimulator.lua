local lib = loadstring(game:HttpGet("https://speedster.glitch.me/Libs/DarkLib.lua", true))()

local Window = lib:CreateWindow("DevilHub".." - Robotic Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/RoboticSimulator - 1953438140/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
rebirth = false;
attack = false;
collect = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/RoboticSimulator - 1953438140");
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
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 1000
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
loadstring(game:HttpGet('https://pastebin.com/raw/KHZ8pYx9'))()
end
end)
end

function doRebirth()
spawn(function()
while getgenv().Settings.rebirth == true do
wait(0.1)
local Event = game:GetService("ReplicatedStorage").Functions.Rebirth
Event:InvokeServer()
end
end)
end

AutoFarm:Button("Get Twitter Rewards", function()
	local Codes = {"r0b0t", "FreeXP", "X10XPBOOST"}
	for i = 1,#Codes do
		local A_1 = Codes[i]
		local Event = game:GetService("ReplicatedStorage").Functions.CheckCode
		Event:InvokeServer(A_1)
	end
end)

function doAttack()
spawn(function()
while getgenv().Settings.attack == true do
		local Event = game:GetService("ReplicatedStorage").Functions.Attack
		Event:InvokeServer(1)
wait(0.1)
end
end)
end

function doCollect()
spawn(function()
while getgenv().Settings.collect == true do
        for i,v in pairs(game.Workspace.Crystals:GetChildren()) do
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumananoidRootPart, 1) 
        wait(0.1)
        firetouchinterest(v, game.Players.LocalPlayer.Character.HumananoidRootPart, 0)
        end
    wait(0.1)
end
end)
end

local rebirth = AutoFarm:Toggle("Auto Rebirth", function(v)
getgenv().Settings.rebirth = v
Save()
if v then
doRebirth()
end
end)

local attack = AutoFarm:Toggle("Auto Attack", function(v)
getgenv().Settings.attack = v
Save()
if v then
doAttack()
end
end)

local collect = AutoFarm:Toggle("Auto Collect Crystals", function(v)
getgenv().Settings.collect = v
Save()
if v then
doCollect()
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

LocalPlayer:Toggle("Noclip", function(v)
	local Workspace = game:GetService("Workspace")
	local CoreGui = game:GetService("CoreGui")
	local Players = game:GetService("Players")
	local Plr = Players.LocalPlayer

	if v then
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end end end)
	else
		Stepped:Disconnect()
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
if getgenv().Settings.rebirth == true then
rebirth:ChangeState(true)
end
if getgenv().Settings.attack == true then
attack:ChangeState(true)
end
if getgenv().Settings.collect == true then
collect:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
  print(i,v)
end