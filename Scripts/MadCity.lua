local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Mad City")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")
   
   local Players = game.Players.LocalPlayer

local filename = "DevilHub/MadCity - 1224212277/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/MadCity - 1224212277");
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
    loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/GrannyCmd.lua"))()
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

for i,v in pairs(getgenv().Settings) do
print(i,v)
end