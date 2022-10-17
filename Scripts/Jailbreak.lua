local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Jailbreak")
    
   local LocalPlayer = Gui:Page("Player")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

   local RequestUrl = module.GetRequetGameUrl()
   local BugUrl = module.GetBugUrl()

local filename = "DevilHub/Jailbreak - 606849621/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
vehiclespeed = false;
shiftlock = false;
ragroll = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/Jailbreak - 606849621");
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
        
  while wait() do
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
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

function doVehicleSpeed()
spawn(function()
if getgenv().Settings.vehiclespeed == true then
loadstring(game:HttpGet("https://pastebin.com/raw/CVfDBveC"))()
end
end)
end

function doShiftLock()
spawn(function()
if getgenv().Settings.shiftlock == true then
game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
end
end)
end

function doRagroll()
spawn(function()
if getgenv().Settings.ragroll == true then
require(game:GetService("ReplicatedStorage").Module.AlexRagdoll).Ragdoll = function() return wait(9e9) end
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

local vehiclespeed = LocalPlayer:Toggle("Vehicle Speed", function(v)
getgenv().Settings.vehiclespeed = v
Save()
if v then
doVehicleSpeed()
end
end)

local shiftlock = LocalPlayer:Toggle("Enable ShiftLock", function(v)
getgenv().Settings.shiftlock = v
Save()
if v then
doShiftLock()
end
end)

local ragroll = LocalPlayer:Toggle("No Ragroll", function(v)
getgenv().Settings.ragroll = v
Save()
if v then
doRagroll()
end
end)

LocalPlayer:Button("Get Guns", function()
for i,v in pairs(workspace.Givers:GetDescendants()) do
if v:IsA("ClickDetector") then
if v.Parent.Item.Value == "Pistol" then
fireclickdetector(v)
end
if v.Parent.Item.Value == "Shotgun" then
fireclickdetector(v)
end
if v.Parent.Item.Value == "RifleSWAT" then
fireclickdetector(v)
end
end
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
if getgenv().Settings.vehiclespeed == true then
vehiclespeed:ChangeState(true)
end
if getgenv().Settings.shiftlock == true then
shiftlock:ChangeState(true)
end
if getgenv().Settings.ragroll == true then
ragroll:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
