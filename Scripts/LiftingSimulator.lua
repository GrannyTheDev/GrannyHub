local Folder = Instance.new("Folder")
Folder.Name = "SafePlace"
Folder.Parent = workspace
local MainPart = Instance.new("Part")
MainPart.Name = "MainPart"
MainPart.Parent = Folder
MainPart.Anchored = true
MainPart.Position = Vector3.new(291, 1000, 1657)
MainPart.Size = Vector3.new(2048, 5, 2048)
MainPart.CanCollide = true

local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Lifting Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/LiftingSimulator - 3652625463/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
autolift = false;
autosell = false;
buyweight = false;
buydna = false;
buybody = false;
autorejoin = false;
zoomlength = false;
nightmode = false;
prompt = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/LiftingSimulator - 3652625463");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

function doAutoSell()
spawn(function()
while getgenv().Settings.autosell == true do
local args = 
{
[1] = "SellMuscle"
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(args)
wait(0.5)
end
end)
end

function doAutoLift()
spawn(function()
while getgenv().Settings.autolift == true do
local args = 
{
[1] = "GainMuscle"
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(args)
wait(0.1)
end
end)
end

function doBuyWeight()
spawn(function()
while getgenv().Settings.buyweight == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Main_Gui"]["UpgradeInfo_Frame"].PageList.Page01:GetChildren()) do
if v:IsA("ImageButton") then
for i = 1,149 do
local A_1 = 
{
	[1] = "BuyItem", 
	[2] = "Income_Item", 
	[3] = v.Name, 
	[4] = i
}
local Event = game:GetService("ReplicatedStorage").RemoteEvent
Event:FireServer(A_1)
end
end
wait(2.5)
end
end
end)
end

function doBuyDna()
spawn(function()
while getgenv().Settings.buydna == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Main_Gui"]["UpgradeInfo_Frame"].PageList.Page02:GetChildren()) do
if v:IsA("ImageButton") then
for i = 1,78 do
local A_1 = 
{
	[1] = "BuyItem", 
	[2] = "Bag_Item", 
	[3] = v.Name, 
	[4] = i
}
local Event = game:GetService("ReplicatedStorage").RemoteEvent
Event:FireServer(A_1)
end
end
wait(2.5)
end
end
end)
end

function doBuyBody()
spawn(function()
while getgenv().Settings.buybody == true do
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["Main_Gui"]["UpgradeInfo_Frame"].PageList.Page03:GetChildren()) do
if v:IsA("ImageButton") then
for i = 1,30 do
local A_1 = 
{
	[1] = "BuyItem", 
	[2] = "Rebirth_Item", 
	[3] = v.Name, 
	[4] = i
}
local Event = game:GetService("ReplicatedStorage").RemoteEvent
Event:FireServer(A_1)
end
end
wait(2.5)
end
end
end)
end

function doAutoRejoin()
	spawn(function()
	while getgenv().Settings.autorejoin == true do
		game:WaitForChild("CoreGui")
        game:WaitForChild("Players")
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            pcall(game:GetService("TeleportService"):Teleport(game.PlaceId))
        end
    end)
wait(0.1)
end
end)
end

function doSpeed()
spawn(function()
if getgenv().Settings.speed == true then
    local oldnewindex
    oldnewindex = hookmetamethod(game, "__newindex", function(a, b, c)
        if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
            return oldnewindex(a, b, 1000)
        end
        return oldnewindex(a, b, c)
    end)
    
    while wait() do
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 1000
    end
end
end)
end

function doPrompt()
spawn(function()
while getgenv().Settings.prompt == true do
game.CoreGui:WaitForChild("PurchasePrompt").Enabled = false
wait(0.1)
end
end)
end

function doZoomLength()
spawn(function()
while getgenv().Settings.zoomlength == true do
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
wait(0.1)
end
end)
end

function doNightModeOn()
spawn(function()
if getgenv().Settings.nightmode == true then
game.Lighting.TimeOfDay = "00:00:00"
end
end)
end
		
function doNightModeOff()
spawn(function()
if getgenv().Settings.nightmode == false then
game.Lighting.TimeOfDay = "12:00:00"
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

local autolift = AutoFarm:Toggle("Auto lift", function(v)
getgenv().Settings.autolift = v
Save()
if v then
doAutoLift()
end
end)

local autosell = AutoFarm:Toggle("Auto sell", function(v)
getgenv().Settings.autosell = v
Save()
if v then
doAutoSell()
end
end)

local buyweight = AutoFarm:Toggle("Auto buy weights", function(v)
getgenv().Settings.buyweight = v
Save()
if v then
doBuyWeight()
end
end)

local buydna = AutoFarm:Toggle("Auto buy Dna", function(v)
getgenv().Settings.buydna = v
Save()
if v then
doBuyDna()
end
end)

local buybody = AutoFarm:Toggle("Auto buy Body Alter", function(v)
getgenv().Settings.buybody = v
Save()
if v then
doBuyBody()
end
end)

LocalPlayer:Button("Teleport to safeplace", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291, 1100, 1657)
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

local sit = LocalPlayer:Toggle("Sit", function(v)
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local hum = char:WaitForChild("Humanoid")
	
	hum.Sit = v
end)

local nightmode = LocalPlayer:Toggle("Night mode", function(v)
getgenv().Settings.nightmode = v
Save()
if v then
doNightModeOn()
elseif not v then
doNightModeOff()
end
end)

local zoomlength = LocalPlayer:Toggle("Infinite Zoom Length", function(v)
getgenv().Settings.zoomlength = v
Save()
if v then
doZoomLength()
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

local prompt = Misc:Toggle("Disable Purchase Prompts", function(v)
getgenv().Settings.prompt = v
Save()
if v then
doPrompt()
end
end)

local autorejoin = Misc:Toggle("Auto Rejoin", function(v)
getgenv().Settings.autorejoin = v
Save()
if v then
doAutoRejoin()
end
end)

Misc:Button("Show Shop Gui", function()
game:GetService("Players").LocalPlayer.PlayerGui["Main_Gui"]["UpgradeMenu_Frame"].Visible = true
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
if getgenv().Settings.autolift == true then
autolift:ChangeState(true)
end
if getgenv().Settings.autosell == true then
autosell:ChangeState(true)
end
if getgenv().Settings.buyweight == true then
buyweight:ChangeState(true)
end
if getgenv().Settings.buydna == true then
buydna:ChangeState(true)
end
if getgenv().Settings.buybody == true then
buybody:ChangeState(true)
end
if getgenv().Settings.autorejoin == true then
autorejoin:ChangeState(true)
end
if getgenv().Settings.zoomlength == true then
zoomlength:ChangeState(true)
end
if getgenv().Settings.nightmode == true then
nightmode:ChangeState(true)
end
if getgenv().Settings.prompt == true then
prompt:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
