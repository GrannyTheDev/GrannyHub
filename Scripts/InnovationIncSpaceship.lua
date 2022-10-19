local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Innovation Inc. Spaceship")

local LocalPlayer = Window:Page("LocalPlayer")

local Teleport = Window:Page("Teleport")

local Misc = Window:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local filename = "DevilHub/InnovationIncSpaceship - 331811267/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/InnovationIncSpaceship - 331811267");
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

local Module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

Teleport:Label("World")

Teleport:Button("Tp to Spaceship", function()
game:GetService("TeleportService"):Teleport(331811267)
end)

Teleport:Label("Locations")

Teleport:Button("Front Control Panel", function()
    Module:Tp(game:GetService("Workspace").SteeringWheel.Clickparts1.CFrame - Vector3.new(0, 0, 5))
end)

Teleport:Button("Cloning Lab", function()
    Module:Tp(game:GetService("Workspace").Firetouch1.CFrame - Vector3.new(0, 0, 10))
end)

Teleport:Button("Escape Pods", function()
    Module:Tp(game:GetService("Workspace").Floor.CFrame - Vector3.new(0, -5, 0))
end)

Teleport:Button("Biology Lab", function()
    Module:Tp(game:GetService("Workspace").GlassPok.CFrame - Vector3.new(-3, 5, 10))
end)

Teleport:Button("Teleportion Lab", function()
    Module:Tp(game:GetService("Workspace").Knop.CFrame - Vector3.new(12, 0, 0))
end)

Teleport:Button("Spaceship Control Panel", function()
    Module:Tp(game:GetService("Workspace").SafeguardMeltGlass.CFrame - Vector3.new(0, 0, 10))
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

LocalPlayer:Button("Equip Space suit", function()
    firetouchinterest(game:GetService("Workspace")["Space Suit"].MorphButton, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace")["Space Suit"].MorphButton, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
end)

LocalPlayer:Button("Equip Hazmat suit", function()
    firetouchinterest(game:GetService("Workspace").HazmatGivers.Model2.Touch, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace").HazmatGivers.Model2.Touch, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
end)

LocalPlayer:Button("Electricity", function()
    firetouchinterest(game:GetService("Workspace").Loosewire, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace").Loosewire, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
end)

LocalPlayer:Toggle("Enable All Cooling Systems", function(v)
getgenv().enable = v
while true do
if not getgenv().enable then return end
wait(0.1)
if game:GetService("Workspace").Coolantcont1.Line.HingeConstraint.TargetAngle == 0 and game:GetService("Workspace").Coolantcont2.Line.HingeConstraint.TargetAngle == 0 then
fireclickdetector(game:GetService("Workspace").Coolantcont1.Button.ClickDetector)
fireclickdetector(game:GetService("Workspace").Coolantcont2.Button.ClickDetector)
end
if game:GetService("Workspace").Coolant.Button.BrickColor == BrickColor.new("Tr. Red") then
fireclickdetector(game:GetService("Workspace").Coolant.Button.ClickDetector)
end
if game:GetService("Workspace").DischargeControls.Light1.BrickColor == BrickColor.new("Bright red") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button1.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light2.BrickColor == BrickColor.new("Bright red") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button2.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light3.BrickColor == BrickColor.new("Bright red") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button3.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light4.BrickColor == BrickColor.new("Bright red") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button4.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light5.BrickColor == BrickColor.new("Bright red") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button5.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").coolinglight.Aan.Material == Enum.Material.SmoothPlastic then
fireclickdetector(game:GetService("Workspace").coolinglight.Button.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol1.Onoff.Value == false then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol1.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol2.Onoff.Value == false then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol2.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol3.Onoff.Value == false then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol3.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Screen3.SurfaceGui.Frame.Door.ImageColor3 == Color3.fromRGB(79, 159, 0) then
fireclickdetector(game:GetService("Workspace").Doorcontrol.Open2.ClickDetector)
end
end
end)

LocalPlayer:Toggle("Disable All Cooling Systems", function(v)
getgenv().disable = v
while true do
if not getgenv().disable then return end
wait(0.1)
if game:GetService("Workspace").Coolantcont1.Line.HingeConstraint.TargetAngle >= 1 and game:GetService("Workspace").Coolantcont2.Line.HingeConstraint.TargetAngle >= 1 then
fireclickdetector(game:GetService("Workspace").Coolantcont1.Button.ClickDetector)
fireclickdetector(game:GetService("Workspace").Coolantcont2.Button.ClickDetector)
end
if game:GetService("Workspace").Coolant.Button.BrickColor == BrickColor.new("Moss") then
fireclickdetector(game:GetService("Workspace").Coolant.Button.ClickDetector)
end
if game:GetService("Workspace").DischargeControls.Light1.BrickColor == BrickColor.new("Shamrock") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button1.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light2.BrickColor == BrickColor.new("Shamrock") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button2.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light3.BrickColor == BrickColor.new("Shamrock") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button3.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light4.BrickColor == BrickColor.new("Shamrock") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button4.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").DischargeControls.Light5.BrickColor == BrickColor.new("Shamrock") then
fireclickdetector(game:GetService("Workspace").DischargeControls.Button5.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").coolinglight.Aan.Material == Enum.Material.Neon then
fireclickdetector(game:GetService("Workspace").coolinglight.Button.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol1.Onoff.Value == true then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol1.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol2.Onoff.Value == true then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol2.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Fancontrols.Fancontrol3.Onoff.Value == true then
fireclickdetector(game:GetService("Workspace").Fancontrols.Fancontrol3.Clicker.ClickDetector)
end
wait(0.5)
if game:GetService("Workspace").Screen3.SurfaceGui.Frame.Door.ImageColor3 == Color3.fromRGB(255, 0, 0) then
fireclickdetector(game:GetService("Workspace").Doorcontrol.Open2.ClickDetector)
end
end
end)

LocalPlayer:Button("Fix Engines", function()
    fireclickdetector(game:GetService("Workspace").Engine.Engines1.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines2.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines7.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines5.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines3.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines4.Part.Part.ClickDetector)
    fireclickdetector(game:GetService("Workspace").Engines6.Part.Part.ClickDetector)
end)

LocalPlayer:Button("Refuel Tank", function()
    firetouchinterest(game:GetService("Workspace").Jerrygiver, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace").Jerrygiver, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace").RefuelHitbox, game.Players.LocalPlayer.Character:WaitForChild("Jerrycan").Handle, 1)
    wait(0.1)
    firetouchinterest(game:GetService("Workspace").RefuelHitbox, game.Players.LocalPlayer.Character:WaitForChild("Jerrycan").Handle, 0)
end)

local NoclipBtn = LocalPlayer:Toggle("Noclip", function(v)
    if v == true then
        local Noclipping = nil
        Clip = false
        wait(0.1)
        local function NoclipLoop()
            if Clip == false and game:GetService("Players").LocalPlayer.Character ~= nil then
                for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == true then
                        child.CanCollide = false
                    end
                end
            end
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    elseif v == false then
        if Noclipping then
            Noclipping:Disconnect()
        end
        Clip = true
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

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
