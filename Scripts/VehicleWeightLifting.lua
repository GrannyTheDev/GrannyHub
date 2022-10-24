if gethui then
	for i,v in pairs(gethui():GetChildren()) do
	     if v:IsA("ScreenGui") and v.Name == "Gui" then
		 v:Destroy()
	     end
	end
elseif syn and syn.unprotect_gui then
	for i,v in pairs(game.CoreGui:GetChildren()) do
	     if v:IsA("ScreenGui") and v.Name == "Gui" then
                 syn.unprotect_gui(v)
                 v:Destroy()
	     end
	end
else
	for i,v in pairs(game.CoreGui:GetChildren()) do
	     if v:IsA("ScreenGui") and v.Name == "Gui" then
		 v:Destroy()
	     end
        end
end

local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Gui = Library:CreateWindow("GrannyHub".." - Vehicle Weight Lifting")

local Farming = Gui:Page("AutoFarm")

local Teleport = Gui:Page("Teleport")

local LocalPlayer = Gui:Page("LocalPlayer")

local Pets = Gui:Page("Pets")

local Misc = Gui:Page("Misc")

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Webhook.lua"))()

local RequestUrl = module.GetRequetGameUrl()
local BugUrl = module.GetBugUrl()

local Module = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Modules/Teleport.lua"))()

function BuyPet(EggName)
	spawn(function()
		local A_1 = EggName
		local Event = game:GetService("ReplicatedStorage").Remotes.BuyEgg
		Event:InvokeServer(A_1)
		local Event = game:GetService("ReplicatedStorage").Remotes.SkipHatching
		Event:InvokeServer()
		local Event = game:GetService("ReplicatedStorage").Remotes.HatchEgg
		Event:InvokeServer()
	end)
end

local filename = "DevilHub/VehicleWeightLifting - 5182200788/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
antikick = false;
autoprestige = false;
autolift = false;
equipvehicle = false;
autohatch = false;
prompt = false;
automine = false;
killzombies = false;
zone = "";
nightmode = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/VehicleWeightLifting - 5182200788");
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
            return oldnewindex(a, b, 800)
        end
        return oldnewindex(a, b, c)
    end)
    
game:GetService("RunService").RenderStepped:Connect(function()
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 800
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
	loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/GrannyCmd.lua"))()
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

function doAutoHatch()
spawn(function()
while getgenv().Settings.autohatch == true do
BuyPet("Normal")
wait(0.1)
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

function doAntiKick()
spawn(function()
if getgenv().Settings.antikick == true then
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	local protect = newcclosure or protect_function

	setreadonly(mt, false)
	mt.__namecall = protect(function(self, ...)
		local method = getnamecallmethod()
		if method == "Kick" then
			wait(9e9)
			return
		end
		return old(self, ...)
	end)
	hookfunction(game.Players.LocalPlayer.Kick,protect(function() wait(9e9) end))
end
end)
end

function doAutoPrestige()
spawn(function()
while getgenv().Settings.autoprestige == true do
game:GetService("ReplicatedStorage").Remotes.Prestige:InvokeServer()
wait(0.1)
end
end)
end

function doAutoMine()
spawn(function()
while getgenv().Settings.automine == true do
local Players = game:GetService("Players")
  local player = Players:FindFirstChildOfClass("Player")
  if player and player.Character then
      local tool = Players.LocalPlayer.Character:FindFirstChild("Punch")
      if tool then
          tool:Activate()
      end
    end
for i,v in pairs(game.Workspace.SpawnedGems:GetChildren()) do
if v.Name == getgenv().Settings.zone and v:WaitForChild("Main", 0.1) then
Module:Tween(TweenInfo.new(0.1), v:WaitForChild("Main").CFrame)
end
end
wait(0.1)
end
end)
end

function doKillZombies()
spawn(function()
while getgenv().Settings.killzombies == true do
local Players = game:GetService("Players")
  local player = Players:FindFirstChildOfClass("Player")
  if player and player.Character then
      local tool = Players.LocalPlayer.Character:FindFirstChild("Punch")
      if tool then
          tool:Activate()
      end
    end
for i,v in pairs(game.Workspace.PunchableCharacters:GetChildren()) do
if v.Name == "Mystical Spirit" and v:WaitForChild("HumanoidRootPart", 0.1) and v:WaitForChild("Humanoid", 0.1) then
if v:WaitForChild("Humanoid").Health ~= 0 then
Module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
end
end
end
wait(0.1)
end
end)
end

function doAutoLift()
spawn(function()
if getgenv().Settings.autolift == true then
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") and v.Parent:WaitForChild("Vehicle", 0.1):WaitForChild("Server", 0.1):WaitForChild("Lift", 0.1) then
			v:WaitForChild("Server"):WaitForChild("Lift"):FireServer()
		end
	end
debounce = false
end)
end
end)
end

function doEquipVehicle()
spawn(function()
while getgenv().Settings.equipvehicle == true do
if game.Players.LocalPlayer.mode.Value == "normal" and getgenv().Settings.killzombies == false then
    wait(0.1)
    if not game.Players.LocalPlayer.Backpack:FindFirstChild("Vehicle") then
        if not game.Players.LocalPlayer.Character:FindFirstChild("Vehicle") then
				if not game.Players.LocalPlayer.Character:FindFirstChild("Vehicle") then
					game.Players.LocalPlayer.Character:BreakJoints()
				end
			end
                end
    local Players = game:GetService("Players")
		local player = Players:FindFirstChildOfClass("Player")
		if player and player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local tool = Players.LocalPlayer.Backpack:FindFirstChild("Vehicle")
				if tool then
					humanoid:EquipTool(tool)
				end
			end
		end
end
if getgenv().Settings.killzombies == true then
    local Players = game:GetService("Players")
		local player = Players:FindFirstChildOfClass("Player")
		if player and player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local tool = Players.LocalPlayer.Backpack:FindFirstChild("Punch")
				if tool then
					humanoid:EquipTool(tool)
				end
			end
		end
  end
if game.Players.LocalPlayer.mode.Value == "mining" then
   local Players = game:GetService("Players")
		local player = Players:FindFirstChildOfClass("Player")
		if player and player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local tool = Players.LocalPlayer.Backpack:FindFirstChild("Punch")
				if tool then
					humanoid:EquipTool(tool)
				end
			end
		end
end
wait(0.1)
end
end)
end

Teleport:Button("Safe Zone", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(333, 29, 215))
end)

Teleport:Button("Leaderboard", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(241, 29, -130))
end)

Teleport:Button("Mine", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(152, 31, -158))
end)

Teleport:Button("King of the Hill", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(-2297, 649, 153))
end)

Teleport:Button("Desert World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(-20654, 28, 1621))
end)

Teleport:Button("Ice World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(-4756, 28, 11584))
end)

Teleport:Button("Sugar World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(6408, 28, 11788))
end)

Teleport:Button("Crystal World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(3499, 28, -15621))
end)

Teleport:Button("Volcano World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(-9505, 120, -10518))
end)

Teleport:Button("Jungle World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(13668, 125, -3872))
end)

Teleport:Button("Mystical World", function()
    Module:Tween(TweenInfo.new(0.1), CFrame.new(-48672, 2279, 21746))
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

local nightmode = LocalPlayer:Toggle("Night Mode", function(v)
getgenv().Settings.nightmode = v
Save()
if v then
doNightModeOn()
elseif not v then
doNightModeOff()
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

local autoprestige = Farming:Toggle("Auto Prestige", function(v)
getgenv().Settings.autoprestige = v
Save()
if v then
doAutoPrestige()
end
end)

local autolift = Farming:Toggle("Auto Lift", function(v)
getgenv().Settings.autolift = v
Save()
if v then
doAutoLift()
end
end)

local killzombies = Farming:Toggle("Auto kill Zombies", function(v)
getgenv().Settings.killzombies = v
Save()
if v then
doKillZombies()
end
end)

local automine = Farming:Toggle("Auto Mine", function(v)
getgenv().Settings.automine = v
Save()
if v then
doAutoMine()
end
end)

local zone = Farming:Box("Zone Number", "Input Zone Number", function(v)
getgenv().Settings.zone = v
Save()
end)

local equipvehicle = Farming:Toggle("Auto Equip Vehicle", function(v)
getgenv().Settings.equipvehicle = v
Save()
if v then
doEquipVehicle()
end
end)

local autohatch = Pets:Toggle("Auto Hatch", function(v)
getgenv().Settings.autohatch = v
Save()
if v then
doAutoHatch()
end
end)

Pets:Button("Buy Normal Egg", function()
	BuyPet("Normal")
end)

Pets:Button("Buy Exotic Egg", function()
	BuyPet("Exotic")
end)

Pets:Button("Buy Jungle Egg", function()
	BuyPet("Jungle")
end)

Pets:Button("Buy Evil Egg", function()
	BuyPet("Evil")
end)

Pets:Button("Buy Mystic Egg", function()
	BuyPet("Mystic")
end)

Pets:Button("Buy Midnight Egg", function()
	BuyPet("Midnight")
end)

Pets:Button("Buy Moonglow Egg", function()
	BuyPet("Moonglow")
end)

Pets:Button("Buy Sunfire Egg", function()
	BuyPet("Sunfire")
end)

Pets:Button("Buy Crystal Egg", function()
	BuyPet("Crystal")
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

local antikick = Misc:Toggle("Anti Kick", function(v)
getgenv().Settings.antikick = v
Save()
if v then
doAntiKick()
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
if getgenv().Settings.antikick == true then
antikick:ChangeState(true)
end
if getgenv().Settings.autoprestige == true then
autoprestige:ChangeState(true)
end
if getgenv().Settings.autolift == true then
autolift:ChangeState(true)
end
if getgenv().Settings.equipvehicle == true then
equipvehicle:ChangeState(true)
end
if getgenv().Settings.autohatch == true then
autohatch:ChangeState(true)
end
if getgenv().Settings.prompt == true then
prompt:ChangeState(true)
end
if getgenv().Settings.automine == true then
automine:ChangeState(true)
end
if getgenv().Settings.killzombies == true then
killzombies:ChangeState(true)
end
if getgenv().Settings.nightmode == true then
nightmode:ChangeState(true)
end
zone:ChangeText(getgenv().Settings.zone)

for i,v in pairs(getgenv().Settings) do
print(i,v)
end

local Counter = Instance.new("TextLabel")
local Dragger = Instance.new("Frame")
local Gui = Instance.new("ScreenGui")

Gui.Name = "Gui"
Gui.ResetOnSpawn = false

if gethui then
     Gui.Parent = gethui()
elseif syn and syn.protect_gui then
     syn.protect_gui(Gui)
     Gui.Parent = cloneref(game:GetService("CoreGui"))
else
     Gui.Parent = cloneref(game:GetService("CoreGui"))
end

Dragger.Name = "Dragger"
Dragger.Parent = Gui
Dragger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dragger.BackgroundTransparency = 1.000
Dragger.Position = UDim2.new(0, 80, 0, 40)
Dragger.Size = UDim2.new(0, 300, 0, 300)

Counter.Parent = Dragger
Counter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Counter.BackgroundTransparency = 1.000
Counter.Position = UDim2.new(0, game:GetService("Players").LocalPlayer.PlayerGui.Main.OpenTopMenu.Position.X, 0, game:GetService("Players").LocalPlayer.PlayerGui.Main.OpenTopMenu.Position.Y)
Counter.Size = UDim2.new(0, 200, 0, 60)
Counter.Font = Enum.Font.SourceSans
Counter.Text = ""
Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
Counter.TextScaled = false
Counter.TextSize = 35.000
Counter.TextWrapped = true

local Module = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Modules/DragModule.lua"))()
Module:Drag(Counter)

local plr = game.Players.LocalPlayer
while wait() do
	Counter.Text = "Prestige: "..plr.leaderstats.Prestige.Value
end
