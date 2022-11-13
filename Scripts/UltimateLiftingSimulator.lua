local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Ultimate Lifting Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/UltimateLiftingSimulator - 2472820296/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
train = false;
rebirth = false;
equipweight = false;
equipsquat = false;
equipmedit = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/UltimateLiftingSimulator - 2472820296");
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
            return oldnewindex(a, b, 300)
        end
        return oldnewindex(a, b, c)
    end)
         
    game:GetService("RunService").Stepped:Connect(function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 300
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
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
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

function doTrain()
spawn(function()
while getgenv().Settings.train == true do
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") and v.Name ~= "Punch" then
        require(v.Module).Click()
    end
end
wait(0.1)
end
end)
end

function doRebirth()
spawn(function()
while getgenv().Settings.rebirth == true do
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.Frames.Rebirth.Roll.MouseButton1Down)) do
    v.Function()
end
wait(0.1)
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

function doEquipSquat()
spawn(function()
while getgenv().Settings.equipsquat == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v.Name == "Squat" then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
    end
end
wait(0.1)
end
end)
end

function doEquipMedit()
spawn(function()
while getgenv().Settings.equipmedit == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v.Name == "Meditate" then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
    end
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

local train = AutoFarm:Toggle("Auto Train", function(v)
getgenv().Settings.train = v
Save()
if v then
doTrain()
end
end)

--local equipweight = AutoFarm:Toggle("Auto Equip Weight", function(v)
--getgenv().Settings.equipweight = v
--Save()
--if v then
--doEquipWeight()
--end
--end)

local equipsquat = AutoFarm:Toggle("Auto Equip Squat", function(v)
getgenv().Settings.equipsquat = v
Save()
if v then
doEquipSquat()
end
end)

local equipmedit = AutoFarm:Toggle("Auto Equip Meditate", function(v)
getgenv().Settings.equipmedit = v
Save()
if v then
doEquipMedit()
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
if getgenv().Settings.train == true then
train:ChangeState(true)
end
if getgenv().Settings.rebirth == true then
rebirth:ChangeState(true)
end
--if getgenv().Settings.equipweight == true then
--equipweight:ChangeState(true)
--end
if getgenv().Settings.equipsquat == true then
equipsquat:ChangeState(true)
end
if getgenv().Settings.equipmedit == true then
equipmedit:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end