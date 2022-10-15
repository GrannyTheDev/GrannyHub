local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Rise of the Dead")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Teleport = Gui:Page("Teleport")

   local Misc = Gui:Page("Misc")

   local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local url = module.GetUrl()

local filename = "DevilHub/RiseoftheDead - 141084271/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
lightup = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/RiseoftheDead - 141084271");
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

while wait() do
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
end
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

function doLightUp()
spawn(function()
if getgenv().Settings.lightup == true then
while wait() do
    if not game.Players.LocalPlayer.Character:WaitForChild("Head"):FindFirstChild("PointLight") then
    local Light = Instance.new("PointLight", game.Players.LocalPlayer.Character:WaitForChild("Head"))
    Light.Brightness = 2
    Light.Range = 100
    end
    end
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

local lightup = LocalPlayer:Toggle("Light Up", function(v)
getgenv().Settings.lightup = v
Save()
if v then
doLightUp()
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

Teleport:Label("World TP")

Teleport:Button("Safehome", function()
    game:GetService("TeleportService"):Teleport(7021428831)
  end)

Teleport:Button("The Warehouse", function()
    game:GetService("TeleportService"):Teleport(464575687)
  end)

Teleport:Button("The Underground", function()
    game:GetService("TeleportService"):Teleport(480661072)
  end)

Teleport:Button("The Mall", function()
    game:GetService("TeleportService"):Teleport(4413486022)
  end)

Teleport:Button("The Residentials",  function()
    game:GetService("TeleportService"):Teleport(4718770953)
  end)

if game.PlaceId == 7021428831 then
Teleport:Label("Safehome location TP")

Teleport:Button("Home", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41, 3, -73)
  end)
end

if game.PlaceId == 464575687 then
Teleport:Label("The Warehouse Location TP")

Teleport:Button("Warehouse Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(18, 58, 2)
  end)

Teleport:Button("Sunday's Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(650, 58, -35)
  end)
end

if game.PlaceId == 480661072 then
Teleport:Label("The Underground Location TP")

Teleport:Button("Train Station Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(264, 10, -12)
  end)

Teleport:Button("Underbridge Community", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-94, 11, 294)
  end)
end

if game.PlaceId == 4413486022 then
Teleport:Label("The Mall Location TP")

Teleport:Button("Mall Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(737, 95, -676)
  end)

Teleport:Button("Clinic Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(520, 97, -1104)
  end)
end

if game.PlaceId == 4718770953 then
Teleport:Label("The Residentials Location TP")

Teleport:Button("Community Safehouse", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1167, 57, -74)
  end)
end

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
      Url = url,
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
if getgenv().Settings.lightup == true then
lightup:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
