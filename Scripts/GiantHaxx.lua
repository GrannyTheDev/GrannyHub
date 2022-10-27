local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Giant Simulator")

local AutoFarm = Window:Page("AutoFarm")

local Teleport = Window:Page("Teleport")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/AutoCollectOrb.lua"))()

local filename = "DevilHub/GiantHaxx - 2986677229/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
FarmOrbs = false;
autoclicker = false;
rebirth = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/GiantHaxx - 2986677229");
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
while getgenv().Settings.speed == true do
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
wait()
end
end)
end
function doRebirth()
    spawn(function()
    while getgenv().Settings.rebirth == true do
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.RebirthRequest:InvokeServer()
    wait()
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

function doAutoClicker()
spawn(function()
if getgenv().Settings.autoclicker == true then
local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;

mt.__index = function(a, b)
if tostring(a) == "6789463" and tostring(b) == "Value" then
	return true;
end
return old_index(a, b);
end
game.Players.LocalPlayer.PlayerGui.ClientData.passes["6789463"].Value = true
end
end)
end
  
  local FarmObs = AutoFarm:Toggle("AutoFarm Orbs", function(v)
      getgenv().Settings.FarmOrbs = v
      Save()
  end)

  local autoclicker = AutoFarm:Toggle("Unlock AutoClicker", function(v)
      getgenv().Settings.autoclicker = v
      Save()
	  if v then
	  doAutoClicker()
	  end
  end)

  local rebirth = AutoFarm:Toggle("Auto Rebirth", function(v)
    getgenv().Settings.rebirth = v
    Save()
    if v then
        doRebirth()
    end
  end)

    AutoFarm:Toggle("Auto Kill Demon King", function(v)
	getgenv().demon = v
	while true do
	if not getgenv().demon then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "DemonKing" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Toggle("Auto Kill Borock", function(v)
	getgenv().borock = v
	while true do
	if not getgenv().borock then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "Borock" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Toggle("Auto Kill Gnomes", function(v)
	getgenv().gnome = v
	while true do
	if not getgenv().gnome then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "Gnome" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Button("Mass Upgrade Skills", function()
	  while wait(0.1) do
	  game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.MassUpgradeSkills:InvokeServer()
	  end
  end)

  AutoFarm:Button("OP Quest", function()
	for i = 50, 250 do
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.StartQuestRequest
	Event:InvokeServer()
	wait()
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.EndQuestRequest
	Event:InvokeServer()
    end
  end)

    AutoFarm:Button("Golden Eggs", function()
	for i,v in pairs(game.Workspace:GetChildren())do
		if v.Name == "Egg" then
			v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
			end
		end
  end)
  
    pcall(function() 
    if getgenv().mainLoop then
        getgenv().mainLoop:Disconnect();
    end;
end);
getgenv().mainLoop = stepped:Connect(function()
    if not character or (character and not (character:FindFirstChild('HumanoidRootPart') and character:FindFirstChild('Humanoid'))) then return end;
    
    if getgenv().Settings.FarmOrbs then
        task.spawn(function()
            replicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer();
            wait(0.65);
            replicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer();
        end);
    
        local node = getANode();
        if node then
            tween(character.HumanoidRootPart, client:DistanceFromCharacter(node.Position) / 2500, { CFrame = node.CFrame + Vector3.new(math.random(2, 5), 1, 0) }, Enum.EasingStyle.Linear);
        end;
    end;
end);
  
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

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

Teleport:Button("Tp to Castle", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(77, -256, -369))
end)

Teleport:Button("Tp to OutSide Castle", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(-692, -249, -399))
end)

Teleport:Button("Tp to Hopsalot", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(-692, -249, -399))
end)

Teleport:Button("Tp to Mayan", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(19676, -37, -1689))
end)

Teleport:Button("Tp to Egypt", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(14476, -31, -2233))
end)

Teleport:Button("Tp to Cyber City", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(11072, 676, -1964))
end)

Teleport:Button("Tp to Winter", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(6752, 259, -1665))
end)

Teleport:Button("Tp to Borock", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(2069, -239, 2227))
end)

Teleport:Button("Tp to Borock", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(2069, -239, 2227))
end)

Teleport:Button("Tp to Demon King", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(2069, -239, 2227))
end)

Teleport:Button("Tp to Temple", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(2614, 199, -1398))
end)

Teleport:Button("Tp to Under water Atlantis", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(17669, 535, -3925))
end)

Teleport:Button("Tp to Above water Atlantis", function()
module:Tween(TweenInfo.new(0.2), CFrame.new(17558, 569, -3846))
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
if getgenv().Settings.FarmOrbs == true then
FarmObs:ChangeState(true)
end
if getgenv().Settings.autoclicker == true then
autoclicker:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
