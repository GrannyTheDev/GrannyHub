local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Innovation Arctic Base")

local LocalPlayer = Window:Page("LocalPlayer")

local Teleport = Window:Page("Teleport")

local CoreStats = Window:Page("Core Stats")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/InnovationArcticBase - 1033860623/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
btnspam = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/InnovationArcticBase - 1033860623");
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

function doBtnSpam()
spawn(function()
while getgenv().Settings.btnspam == true do
fireclickdetector(game:GetService("Workspace").ZeroGravRoom.ControlPanel.Buttons["1"].Button.ClickDetector)
fireclickdetector(game:GetService("Workspace").ZeroGravRoom.ControlPanel.Buttons["2"].Button.ClickDetector)
fireclickdetector(game:GetService("Workspace").ZeroGravRoom.ControlPanel.Buttons["3"].Button.ClickDetector)
fireclickdetector(game:GetService("Workspace").ZeroGravRoom.ControlPanel.Buttons["4"].Button.ClickDetector)
wait(0.1)
end
end)
end

LocalPlayer:Button("Equip Hazmat Suit", function()
firetouchinterest(game:GetService("Workspace").SuitGiver.Giver, game.Players.LocalPlayer.Character.Head, 1)
wait()
firetouchinterest(game:GetService("Workspace").SuitGiver.Giver, game.Players.LocalPlayer.Character.Head, 0)
end)

LocalPlayer:Button("Remove Hazmat Suit", function()
firetouchinterest(game:GetService("Workspace").SuitRemover.Remover, game.Players.LocalPlayer.Character.Head, 1)
wait()
firetouchinterest(game:GetService("Workspace").SuitRemover.Remover, game.Players.LocalPlayer.Character.Head, 0)
end)

local btnspam = LocalPlayer:Toggle("Click Zero Gravity Button", function(v)
getgenv().Settings.btnspam = v
Save()
if v then
doBtnSpam()
end
end)

LocalPlayer:Button("Click Secret Button", function()
fireclickdetector(game:GetService("Workspace").MemeButton.Button.ClickDetector)
end)

LocalPlayer:Button("Open Quarantine Door", function()
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["1"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["2"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["3"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["4"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["5"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["6"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["7"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["8"].ClickDetector)
    fireclickdetector(game.Workspace.Flibble.KeyPad.Keys["9"].ClickDetector) 
end)

LocalPlayer:Toggle("Disable all cooling systems", function(v)
getgenv().meltdown = v
while true do
if not getgenv().meltdown then return end
wait()
fireclickdetector(game:GetService("Workspace").Core.Pump1Buttons["0"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.Pump2Buttons["0"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["0"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["0"].ClickDetector)
end
end)

LocalPlayer:Toggle("Enable all cooling systems", function(v)
getgenv().EnableCooling = v
while true do
if not getgenv().EnableCooling then return end
wait()
fireclickdetector(game:GetService("Workspace").Core.Pump1Buttons["2"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.Pump2Buttons["2"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["4"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["4"].ClickDetector)
end
end)
    

LocalPlayer:Toggle("Turn On Pumps", function(v)
if v == true then
fireclickdetector(game:GetService("Workspace").Core.Pump1Buttons["2"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.Pump2Buttons["2"].ClickDetector)
elseif v == false then
fireclickdetector(game:GetService("Workspace").Core.Pump1Buttons["0"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.Pump2Buttons["0"].ClickDetector)
end
end)

LocalPlayer:Toggle("Turn On Cooling Fan", function(v)
if v == true then
fireclickdetector(game:GetService("Workspace").Core.FanButtons["4"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["4"].ClickDetector)
elseif v == false then
fireclickdetector(game:GetService("Workspace").Core.FanButtons["0"].ClickDetector)
fireclickdetector(game:GetService("Workspace").Core.FanButtons["0"].ClickDetector)
end
end)

LocalPlayer:Button("Open Manipulation Door", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.PowerLever.Lever.ClickPart.ClickDetector)
end)

LocalPlayer:Button("Increase character Height", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.HeightUp.ClickDetector)
end)

LocalPlayer:Button("Decrease character Height", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.HeightDown.ClickDetector)
end)

LocalPlayer:Button("Increase character Width", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.WidthUp.ClickDetector)
end)

LocalPlayer:Button("Decrease character Width", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.WidthDown.ClickDetector)
end)

LocalPlayer:Button("Increase Head Size", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.HeadUp.ClickDetector)
end)

LocalPlayer:Button("Decrease Head Size", function()
fireclickdetector(game:GetService("Workspace").ResizeMachine.HeadDown.ClickDetector)
end)

LocalPlayer:Button("Bring back all energy cores", function()
for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
if v.Name == "EnergyCore" then
firetouchinterest(v.Center, game.Players.LocalPlayer.Character.Head, 1)
wait()
firetouchinterest(v.Center, game.Players.LocalPlayer.Character.Head, 0)
end
end
for i,v in pairs(game:GetService("Workspace").Bunker.Cores:GetChildren()) do
firetouchinterest(v.Hitbox, game.Players.LocalPlayer.Character.Head, 1)
wait()
firetouchinterest(v.Hitbox, game.Players.LocalPlayer.Character.Head, 0)
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

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

Teleport:Button("Outside Base", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-410, 135, 86))
end)

Teleport:Button("Shop", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-291, 6, 43))
end)

Teleport:Button("Genetics & Mutation room", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(92, -0, -313))
end)

Teleport:Button("Train Station", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-144, 6, -273))
end)

Teleport:Button("Storage Room A", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-33, 6, -280))
end)

Teleport:Button("Special Manipulator Control Panel", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(129, 6, -5))
end)

Teleport:Button("Zero Gravity Room", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-188, 8, -357))
end)

Teleport:Button("Meteor Crystal Lab", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-269, 8, -146))
end)

Teleport:Button("Reception & Surface", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-215, 8, -67))
end)

Teleport:Button("Top Secret Bunker", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(500, 6, -362))
end)

Teleport:Button("Coolant Control Room", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(98, 6, -615))
end)

Teleport:Button("Core Control Room", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(127, 59, -743))
end)

Teleport:Button("Transmogrifier", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(29, 13, -679))
end)

Teleport:Button("Turbo Pump Room", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(282, -17, -621))
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

CoreStats:Label("--------Core Temp--------")
local CoreTemp = CoreStats:Label("Temp: "..game:GetService("Workspace").Core.Screen1.SurfaceGui.TempReadout.Text)
CoreStats:Label("--------System Components--------")
local Pump1 = CoreStats:Label("Pump1 is ")
local Pump2 = CoreStats:Label("Pump2 is ")
CoreStats:Label("--------Funds--------")
local Funds = CoreStats:Label("Funds: "..game.Players.LocalPlayer.leaderstats.Funds.Value)

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
if getgenv().Settings.btnspam == true then
btnspam:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end

while wait() do
CoreTemp:UpdateText("Temp: "..game:GetService("Workspace").Core.Screen1.SurfaceGui.TempReadout.Text)
if game:GetService("Workspace").InnovationDataScreen.Screen.SurfaceGui.Pump1Speed.Text == "Pump 1 RPM: 0 RPM" then
Pump1:UpdateText("Pump1 is Off")
else
Pump1:UpdateText("Pump1 is On")
end
if game:GetService("Workspace").InnovationDataScreen.Screen.SurfaceGui.Pump2Speed.Text == "Pump 2 RPM: 0 RPM" then
Pump2:UpdateText("Pump2 is Off")
else
Pump2:UpdateText("Pump2 is On")
end
Funds:UpdateText("Funds: "..game.Players.LocalPlayer.leaderstats.Funds.Value)
end