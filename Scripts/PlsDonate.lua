local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Pls Donate")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

   local RequestUrl = module.GetRequetGameUrl()
   local BugUrl = module.GetBugUrl()

local filename = "DevilHub/PlsDonate - 8737602449/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
chatspam = false;
text = "";
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/PlsDonate - 8737602449");
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
    loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/GrannyCmd.lua"))()
end
end)
end

function doChatSpam()
spawn(function()
while getgenv().Settings.chatspam == true do
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(getgenv().Settings.text), "All")
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

local text = LocalPlayer:Box("Chat Message", "Input the chat message", function(msg)
getgenv().Settings.text = msg
Save()
end)

local chatspam = LocalPlayer:Toggle("Enable Chat spam", function(v)
getgenv().Settings.chatspam = v
Save()
if v then
doChatSpam()
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
if getgenv().Settings.chatspam == true then
chatspam:ChangeState(true)
end
text:ChangeText(tostring(getgenv().Settings.text))

for i,v in pairs(getgenv().Settings) do
print(i,v)
end