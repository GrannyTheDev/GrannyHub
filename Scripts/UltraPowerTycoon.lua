local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Ultra Power Tycoon")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/UltraPowerTycoon - 8146731988/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
collect = false;
buybuttons = false;
prompt = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/UltraPowerTycoon - 8146731988");
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
game:GetService("RunService").RenderStepped:Connect(function()
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100
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

function doPrompt()
spawn(function()
while getgenv().Settings.prompt == true do
game.CoreGui:WaitForChild("PurchasePrompt").Enabled = false
wait(0.1)
end
end)
end

function doBuyButtons()
spawn(function()
while getgenv().Settings.buybuttons == true do
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(workspace.Tycoons:GetChildren()) do
    if v:WaitForChild("isim").Value == game.Players.LocalPlayer.Name then
    for i,k in pairs(v:GetDescendants()) do
    if k.Name == "Touch" then
    if k.Parent.Name ~= "ShopModel" then
        firetouchinterest(k, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
        wait()
        firetouchinterest(k, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
    end
end
end
end
end
debounce = false
end)
wait(2)
end
end)
end
    

function doCollect()
spawn(function()
while getgenv().Settings.collect == true do
for i,v in pairs(workspace.Tycoons:GetChildren()) do
if v.isim.Value == game.Players.LocalPlayer.Name then
firetouchinterest(v.CashRegister.Ching, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
wait()
firetouchinterest(v.CashRegister.Ching, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
end
end
wait(0.1)
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

local buybuttons = AutoFarm:Toggle("Autobuy all buttons", function(v)
getgenv().Settings.buybuttons = v
Save()
if v then
doBuyButtons()
end
end)

local collect = AutoFarm:Toggle("Auto Collect Cash", function(v)
getgenv().Settings.collect = v
Save()
if v then
doCollect()
end
end)

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

local tpbase = LocalPlayer:Button("Teleport to base", function()
for i,v in pairs(workspace.Tycoons:GetChildren()) do
    if v.isim.Value == game.Players.LocalPlayer.Name then
        module:Tween(TweenInfo.new(0.2), v.Camera2.CFrame)
    end
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

local prompt = Misc:Toggle("Disable Prompt", function(v)
getgenv().Settings.prompt = v
Save()
if v then
doPrompt()
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
if getgenv().Settings.collect == true then
collect:ChangeState(true)
end
if getgenv().Settings.prompt == true then
prompt:ChangeState(true)
end
if getgenv().Settings.buybuttons == true then
buybuttons:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end