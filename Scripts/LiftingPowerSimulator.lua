local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Lifting Power Simulator")

   local AutoFarm = Gui:Page("AutoFarm")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

   local RequestUrl = module.GetRequetGameUrl()
   local BugUrl = module.GetBugUrl()

   local Players = game.Players.LocalPlayer

local filename = "DevilHub/LiftingPowerSimulator - 9957252500/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
lift = false;
equipweight = false;
stage = false;
ascension = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/LiftingPowerSimulator - 9957252500");
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
        return oldnewindex(a, b, 2000)
    end
    return oldnewindex(a, b, c)
end)
     
while wait() do
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 2000
end
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

function doLift()
spawn(function()
if getgenv().Settings.lift == true then
game:GetService("RunService").RenderStepped:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") and v.Parent:FindFirstChildWhichIsA("Tool") then
			v.Parent:FindFirstChildWhichIsA("Tool"):Activate()
		end
	end
end)
end
end)
end

function doEquipWeight()
    spawn(function()
    while getgenv().Settings.equipweight == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if v.TextureId == "" then
	game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
end
end
    wait(0.1)
    end
    end)
    end

function doStage()
spawn(function()
while getgenv().Settings.stage == true do
local A_1 = "StageUp"
local Event = game:GetService("ReplicatedStorage").Remotes.RemoteFunction
Event:InvokeServer(A_1)
wait(0.1)
end
end)
end

function doAscension()
spawn(function()
while getgenv().Settings.ascension == true do
local A_1 = "Ascension"
local Event = game:GetService("ReplicatedStorage").Remotes.RemoteFunction
Event:InvokeServer(A_1)
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

local lift = AutoFarm:Toggle("Auto Lift", function(v)
getgenv().Settings.lift = v
Save()
if v then
doLift()
end
end)

local equipweight = AutoFarm:Toggle("Auto Equip Weight", function(v)
    getgenv().Settings.equipweight = v
    Save()
    if v then
    doEquipWeight()
    end
    end)

local stage = AutoFarm:Toggle("Auto Stage", function(v)
    getgenv().Settings.stage = v
    Save()
    if v then
    doStage()
    end
    end)

local ascension = AutoFarm:Toggle("Auto Ascension", function(v)
    getgenv().Settings.ascension = v
    Save()
    if v then
    doAscension()
    end
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
	if clipboard then
		clipboard('https://discord.com/invite/dYHag43eeU')
	end
	request({
		Url = 'http://127.0.0.1:6463/rpc?v=1',
		Method = 'POST',
		Headers = {
			['Content-Type'] = 'application/json',
			Origin = 'https://discord.com'
		},
		Body = game:GetService("HttpService"):JSONEncode({
			cmd = 'INVITE_BROWSER',
			nonce = game:GetService("HttpService"):GenerateGUID(false),
			args = {code = 'esn6q3BbV2'}
		})
	})
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
if getgenv().Settings.lift == true then
lift:ChangeState(true)
end
if getgenv().Settings.equipweight == true then
equipweight:ChangeState(true)
end
if getgenv().Settings.stage == true then
stage:ChangeState(true)
end
if getgenv().Settings.ascension == true then
ascension:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end