local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - BloxFruit")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/BloxFruit - 2753915549/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
kill = false;
energy = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/BloxFruit - 2753915549");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

function getNear()
    local near;
    local nearr = math.huge

    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:WaitForChild("HumanoidRootPart", 0.1) and v:WaitForChild("Humanoid", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                if (game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - v:WaitForChild("HumanoidRootPart").Position).Magnitude < nearr then
                    near = v
                    nearr = (game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - v:WaitForChild("HumanoidRootPart").Position).Magnitude
                end
            end
        end
    end

    return near
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

function doEnergy()
spawn(function()
if getgenv().Settings.energy == true then
    local mt = getrawmetatable(game)
    local oldindex = mt.__index
    setreadonly(mt, false)
    mt.__index = newcclosure(function(a, b, c)
        if tostring(a) == "Energy" and tostring(b) == "Value" then
            return oldindex(a, b, 130)
        end
        return oldindex(a, b, c)
    end)
    game.Players.LocalPlayer.Character.Energy.Value = 130
end
end)
end

function doInfYield()
spawn(function()
if getgenv().Settings.infyield == true then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end
end)
end

function doKill()
spawn(function()
while getgenv().Settings.kill == true do
local nearest = getNear()
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v:WaitForChild("HumanoidRootPart", 0.1) and v:WaitForChild("Humanoid", 0.1) then
        if v:WaitForChild("Humanoid").Health ~= 0 then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = nearest:WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0,0,-5)
        end
    end
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

local kill = LocalPlayer:Toggle("Auto kill", function(v)
getgenv().Settings.kill = v
Save()
if v then
doKill()
end
end)

local energy = LocalPlayer:Toggle("Inf Energy", function(v)
getgenv().Settings.energy = v
Save()
if v then
doEnergy()
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
                    for i, v in pairs(Workspace.Characters[Plr.Name]:GetChildren()) do
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

local Request = request or syn.request
local clipboard = setclipboard or syn.write_clipboard

Misc:Button("Join the discord server", function()
	if clipboard then
		clipboard('https://discord.com/invite/esn6q3BbV2')
	end
	Request({
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
if getgenv().Settings.kill == true then
kill:ChangeState(true)
end
if getgenv().Settings.energy == true then
energy:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end