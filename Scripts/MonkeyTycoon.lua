local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Monkey Tycoon")

   local AutoFarm = Gui:Page("AutoFarm")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")
   
local filename = "DevilHub/MonkeyTycoon - 11400511154/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
sell = false;
UpgradeRate = false;
BuyMonkeys = false;
AutoMerge = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/MonkeyTycoon - 11400511154");
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

function doSell()
spawn(function()
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings.sell == true then
        if debounce then
            return
        end
        debounce = true
        wait(0.1)
        for i,v in pairs(game.Workspace.Drops:GetChildren()) do
            firetouchinterest(game.Players.LocalPlayer.Character.HARVESTER, v, 1)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HARVESTER, v, 0)
        end
        for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
            if v.Name == "DepositButton" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 1)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 0)
            end
        end
        debounce = false
    end
end)
end)
end

function doUpgradeRate()
spawn(function()
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings.UpgradeRate == true then
        if debounce then
            return
        end
        debounce = true
        wait(1)
        for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
            if v.Name == "BuySpeed" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 1)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 0)
            end
        end
        debounce = false
    end
end)
end)
end

function doBuyMonkeys()
spawn(function()
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings.BuyMonkeys == true then
        if debounce then
            return
        end
        debounce = true
        wait(1)
        for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
            if v.Name == "BuyDropper5" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 1)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 0)
            end
        end
        debounce = false
    end
end)
end)
end

function doAutoMerge()
spawn(function()
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings.AutoMerge == true then
        if debounce then
            return
        end
        debounce = true
        wait(1)
        for i,v in pairs(game.Workspace.Plots:GetDescendants()) do
            if v.Name == "MergeButton" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 1)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Button, 0)
            end
        end
        debounce = false
    end
end)
end)
end
local AutoMerge = AutoFarm:Toggle("Auto Merge Monkeys", function(v)
getgenv().Settings.AutoMerge = v
Save()
if v then
doAutoMerge()
end
end)

local BuyMonkeys = AutoFarm:Toggle("AutoBuy Monkeys", function(v)
getgenv().Settings.BuyMonkeys = v
Save()
if v then
doBuyMonkeys()
end
end)

local UpgradeRate = AutoFarm:Toggle("Auto Upgrade Money Rate", function(v)
getgenv().Settings.UpgradeRate = v
Save()
if v then
doUpgradeRate()
end
end)

local sell = AutoFarm:Toggle("AutoSell", function(v)
getgenv().Settings.sell = v
Save()
if v then
doSell()
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
if getgenv().Settings.sell == true then
sell:ChangeState(true)
end
if getgenv().Settings.UpgradeRate == true then
UpgradeRate:ChangeState(true)
end
if getgenv().Settings.BuyMonkeys == true then
BuyMonkeys:ChangeState(true)
end
if getgenv().Settings.AutoMerge == true then
AutoMerge:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end