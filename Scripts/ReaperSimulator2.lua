local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Reaper Simulator 2")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/ReaperSimulator2 - 4828705676/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
swing = false;
sell = false;
buyscythe = false;
buybackpack = false;
buyrank = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/ReaperSimulator2 - 4828705676");
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

function doSwing()
spawn(function()
while getgenv().Settings.swing == true do
    game:GetService("ReplicatedStorage").Remotes.Sheathe:FireServer("Scythe", true)    
    game:GetService("ReplicatedStorage").Remotes.ItemUsed:FireServer("Attack")
wait(0.1)
end
end)
end

function doSell()
spawn(function()
while getgenv().Settings.sell == true do
    firetouchinterest(game:GetService("Workspace").TouchParts.Sell.SellPart, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
    wait()
    firetouchinterest(game:GetService("Workspace").TouchParts.Sell.SellPart, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
wait(0.1)
end
end)
end

function doBuyScythe()
spawn(function()
while getgenv().Settings.buyscythe == true do
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.CenterHolder.Shop.InfoHolder.Main.ScytheInfo.BuyAllButton.MouseButton1Down)) do
v.Function()
end
wait(0.1)
end
end)
end

function doBuyBackpack()
spawn(function()
while getgenv().Settings.buybackpack == true do
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.CenterHolder.Shop.InfoHolder.Main.SatchelsInfo.BuyAllButton.MouseButton1Down)) do
v.Function()
end
wait(0.1)
end
end)
end

function doBuyRank()
spawn(function()
while getgenv().Settings.buyrank == true do
for i,v in pairs(getconnections(game:GetService("Players").givemedrinka.PlayerGui.Main.CenterHolder.Shop.MainHolder.Main.Ranks.UpgradeButton.MouseButton1Down)) do
v.Function()
end
wait(0.1)
end
end)
end

local swing = AutoFarm:Toggle("Auto Swing", function(v)
getgenv().Settings.swing = v
Save()
if v then
doSwing()
end
end)

local sell = AutoFarm:Toggle("Auto Sell", function(v)
getgenv().Settings.sell = v
Save()
if v then
doSell()
end
end)

local buyscythe = AutoFarm:Toggle("Autobuy Scythe", function(v)
getgenv().Settings.buyscythe = v
Save()
if v then
doBuyScythe()
end
end)

local buybackpack = AutoFarm:Toggle("Autobuy Satchel", function(v)
getgenv().Settings.buybackpack = v
Save()
if v then
doBuyBackpack()
end
end)

local buyrank = AutoFarm:Toggle("Autobuy Rank", function(v)
getgenv().Settings.buyrank = v
Save()
if v then
doBuyRank()
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
if getgenv().Settings.swing == true then
swing:ChangeState(true)
end
if getgenv().Settings.sell == true then
sell:ChangeState(true)
end
if getgenv().Settings.buyscythe == true then
buyscythe:ChangeState(true)
end
if getgenv().Settings.buybackpack == true then
buybackpack:ChangeState(true)
end
if getgenv().Settings.buyrank == true then
buyrank:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end