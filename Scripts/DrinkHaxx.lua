loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/SafePlace.lua"))()
loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/AutoEquipDrink.lua"))()

function Tween(Time, Pos)
game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, Time, {CFrame = Pos}):Play()
end

local library = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit.lua"))()

local DrinkHaxx = library:CreateWindow("GrannyHub - ".. "DrinkHaxx")

local AutoFarm = DrinkHaxx:Page("AutoFarm")

local Drink = DrinkHaxx:Page("Drink")

local LocalPlayer = DrinkHaxx:Page("LocalPlayer")

local Stats = DrinkHaxx:Page("Stats")

local Teleport = DrinkHaxx:Page("Teleport")

local Pets = DrinkHaxx:Page("Pets")

local Misc = DrinkHaxx:Page("Misc")

local filename = "DevilHub/DrinkHaxx - 1747207098/Config.json"

getgenv().Settings = {
antiafk = false;
infyield = false;
speed = false;
jump = false;
antikick = false;
prompt = false;
prestige = false;
equipdrink = false;
automine = false;
collect = false;
nightmode = false;
starterdrink = false;
seconddrink = false;
thirddrink = false;
fourthdrink = false;
fifthdrink = false;
sixthdrink = false;
seventhdrink = false;
eighthdrink = false;
ninthdrink = false;
atomicdrink = false;
omegaburpjuice = false;
thunderfizz = false;
autorejoin = false;
zoomlength = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/DrinkHaxx - 1747207098");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
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
while wait() do
game.Players.LocalPlayer.PlayerGui:WaitForChild("AntiAutoclick").Enabled = false
end
end
end)
end

function doPrompt()
spawn(function()
if getgenv().Settings.prompt == true then
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
game.CoreGui:WaitForChild("PurchasePrompt").Enabled = false
debounce = false
end)
end
end)
end

function doPrestige()
spawn(function()
while getgenv().Settings.prestige == true do
game.ReplicatedStorage.RemoteEvents.PrestigeEvent:FireServer()
wait(2.5)
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

function doAutoRejoin()
	spawn(function()
	if getgenv().Settings.autorejoin == true then
		game:WaitForChild("CoreGui")
        game:WaitForChild("Players")

         while true do wait()
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            pcall(game:GetService("TeleportService"):Teleport(game.PlaceId))
    end
end)
end
while game.Players.LocalPlayer.leaderstats.Prestige.Value == 0 do
loadstring(game:HttpGet("https://pastebin.com/raw/T6gN29gv"))()
wait(0.5)
end
	end
	end)
	end

function doEquipDrink()
spawn(function()
if getgenv().Settings.equipdrink == true then
local debounce = false
game:GetService("RunService").RenderStepped:Connect(function()
if debounce then
    return
end
debounce = true
wait(1)
AutoEquipDrink()
debounce = false
end)
end
end)
end

function doAutoMine()
spawn(function()
if getgenv().Settings.automine == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(0.1)
local plr = game.Players.LocalPlayer
local char = plr.Character
char.Pickaxe.Mine:FireServer()
debounce = false
end)
elseif getgenv().Settings.automine == false then
	Stepped:Disconnect() 
end
end)
end

function doCollect()
spawn(function()
while getgenv().Settings.collect == true do
local plr = game.Players.LocalPlayer
local char = plr.Character
for i,v in pairs(game.Workspace.Diamonds:GetChildren()) do
    firetouchinterest(v, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
    wait(0.1)
    firetouchinterest(v, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
end
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

game:GetService("RunService").RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1000
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
	loadstring(game:HttpGet("https://pastebin.com/raw/KHZ8pYx9"))()
         for i,v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "ScreenGui" then
                v.Enabled = false
            end
        end
end
end)
end

function doStarterDrink()
spawn(function()
if getgenv().Settings.starterdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Starter Drink")
debounce = false
end)
elseif getgenv().Settings.starterdrink == false then
	Stepped:Disconnect() 
end
end)
end

function doSecondDrink()
spawn(function()
if getgenv().Settings.seconddrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Second Drink")
debounce = false
end)
elseif getgenv().Settings.seconddrink == false then
	Stepped:Disconnect() 
end
end)
end

function doThirdDrink()
spawn(function()
if getgenv().Settings.thirddrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Third Drink")
debounce = false
end)
elseif getgenv().Settings.thirddrink == false then
	Stepped:Disconnect()
end
end)
end

function doFourthDrink()
spawn(function()
if getgenv().Settings.fourthdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Fourth Drink")
debounce = false
end)
elseif getgenv().Settings.fourthdrink == false then
	Stepped:Disconnect() 
end
end)
end

function BuyPet(name)
for i,v in pairs(game.ReplicatedStorage.RemoteEvents:GetChildren()) do
if v.Name == "PetPurchase" then
v:InvokeServer(name)
end
end
end

function doFifthDrink()
spawn(function()
if getgenv().Settings.fifthdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Fifth Drink")
debounce = false
end)
elseif getgenv().Settings.fifthdrink == false then
	Stepped:Disconnect()
end
end)
end

function doSixthDrink()
spawn(function()
if getgenv().Settings.sixthdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Sixth Drink")
debounce = false
end)
elseif getgenv().Settings.sixthdrink == false then
	Stepped:Disconnect() 
end
end)
end

function doSeventhDrink()
spawn(function()
if getgenv().Settings.seventhdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Seventh Drink")
debounce = false
end)
elseif getgenv().Settings.seventhdrink == false then
	Stepped:Disconnect()
end
end)
end

function doEighthDrink()
spawn(function()
if getgenv().Settings.eighthdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Eighth Drink")
debounce = false
end)
elseif getgenv().Settings.eighthdrink == false then
	Stepped:Disconnect()
end
end)
end

function doNinthDrink()
spawn(function()
if getgenv().Settings.ninthdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Ninth Drink")
debounce = false
end)
elseif getgenv().Settings.ninthdrink == false then
	Stepped:Disconnect()
end
end)
end

function doAtomicDrink()
spawn(function()
if getgenv().Settings.atomicdrink == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Atomic Drink")
debounce = false
end)
elseif getgenv().Settings.atomicdrink == false then
	Stepped:Disconnect()
end
end)
end

function doOmegaBurpJuice()
spawn(function()
if getgenv().Settings.omegaburpjuice == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Omega Burp Juice")
debounce = false
end)
elseif getgenv().Settings.omegaburpjuice == false then
	Stepped:Disconnect()
end
end)
end

function doThunderFizz()
spawn(function()
if getgenv().Settings.thunderfizz == true then
local debounce = false
local Stepped = game:GetService("RunService").Heartbeat:Connect(function()
if debounce then
    return
end
debounce = true
wait(2.34)
game.ReplicatedStorage.RemoteEvents.DrinkEvent:FireServer("Thunder Fizz")
debounce = false
end)
elseif getgenv().Settings.thunderfizz == false then
	Stepped:Disconnect()
end
end)
end

local pets = {"Small Blue", "Small Red", "Blue", "Purple", "Green", "Orange", "Winged Blue", "Winged Purple", "Winged Green", "Winged Orange", "Fire", "Flower", "Wizard", "Vampire", "Cool Dude", "Rainbow", "Triplet", "Radioactive", "Volcanic",  "Cyborg"}
for i = 1,#pets do
Pets:Button(pets[i], function()
BuyPet(pets[i])
end)
end

local prestige = AutoFarm:Toggle("Auto Prestige", function(v)
getgenv().Settings.prestige = v
Save()
if v then
doPrestige()
end
end)

local equipdrink = AutoFarm:Toggle("Auto Equip Drink", function(v)
getgenv().Settings.equipdrink = v
Save()
if v then
doEquipDrink()
end
end)

local automine = AutoFarm:Toggle("Auto Mine", function(v)
getgenv().Settings.automine = v
Save()
if v then
doAutoMine()
end
end)

local collect = AutoFarm:Toggle("Auto Collect Gem", function(v)
getgenv().Settings.collect = v
Save()
if v then
doCollect()
end
end)

local starterdrink = Drink:Toggle("Auto Drink Starter Drink", function(v)
getgenv().Settings.starterdrink = v
Save()
if v then
doStarterDrink()
end
end)

local seconddrink = Drink:Toggle("Auto Drink Second Drink", function(v)
getgenv().Settings.seconddrink = v
Save()
if v then
doSecondDrink()
end
end)

local thirddrink = Drink:Toggle("Auto Drink Third Drink", function(v)
getgenv().Settings.thirddrink = v
Save()
if v then
doThirdDrink()
end
end)

local fourthdrink = Drink:Toggle("Auto Drink Fourth Drink", function(v)
getgenv().Settings.fourthdrink = v
Save()
if v then
doFourthDrink()
end
end)

local fifthdrink = Drink:Toggle("Auto Drink Fifth Drink", function(v)
getgenv().Settings.fifthdrink = v
Save()
if v then
doFifthDrink()
end
end)

local sixthdrink = Drink:Toggle("Auto Drink Sixth Drink", function(v)
getgenv().Settings.sixthdrink = v
Save()
if v then
doSixthDrink()
end
end)

local seventhdrink = Drink:Toggle("Auto Drink Seventh Drink", function(v)
getgenv().Settings.seventhdrink = v
Save()
if v then
doSeventhDrink()
end
end)

local eighthdrink = Drink:Toggle("Auto Drink Eighth Drink", function(v)
getgenv().Settings.eighthdrink = v
Save()
if v then
doEighthDrink()
end
end)

local ninthdrink = Drink:Toggle("Auto Drink Ninth Drink", function(v)
getgenv().Settings.ninthdrink = v
Save()
if v then
doNinthDrink()
end
end)

local atomicdrink = Drink:Toggle("Auto Drink Atomic Drink", function(v)
getgenv().Settings.atomicdrink = v
Save()
if v then
doAtomicDrink()
end
end)

local omegaburpjuice = Drink:Toggle("Auto Drink Omega Burp Juice", function(v)
getgenv().Settings.omegaburpjuice = v
Save()
if v then
doOmegaBurpJuice()
end
end)

local thunderfizz = Drink:Toggle("Auto Drink Thunder Fizz", function(v)
getgenv().Settings.thunderfizz = v
Save()
if v then
doThunderFizz()
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

LocalPlayer:Button("Sit", function()
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local hum = char:FindFirstChild("Humanoid")
	
	hum.Sit = not hum.Sit
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

local noclip = LocalPlayer:Toggle("Noclip", function(v)
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

noclip:Keybind(Enum.KeyCode.LeftAlt)

LocalPlayer:Button("Next Music Track", function()
game:GetService("Players").LocalPlayer.SkipMusicTrackEvent:Fire()
end)

Teleport:Button("Fav Spot", function()
    Tween(TweenInfo.new(0.2), CFrame.new(-55, 26, 107))
end)

Teleport:Button("Safe Zone", function()
    Tween(TweenInfo.new(0.2), game:GetService("Workspace").SpawnLocation.CFrame)
end)

Teleport:Button("Pet Shop", function()
    Tween(TweenInfo.new(0.2), CFrame.new(311, 52, 103))
end)

Teleport:Button("Disco Island", function()
    Tween(TweenInfo.new(0.2), CFrame.new(63, 48, 636))
end)

Teleport:Button("Cloud One", function()
    Tween(TweenInfo.new(0.2), CFrame.new(296, 566, 689))
end)

Teleport:Button("Cloud Second", function()
    Tween(TweenInfo.new(0.2), CFrame.new(-1224, 557, -318))
end)

Teleport:Button("Small Island", function()
    Tween(TweenInfo.new(0.2), CFrame.new(-1108, 69, -778))
end)

Teleport:Button("Second Island", function()
    Tween(TweenInfo.new(0.2), CFrame.new(-1074, 47, 19))
end)

Teleport:Button("Sky Island", function()
    Tween(TweenInfo.new(0.2), CFrame.new(2132, 1456, -1034))
end)

Teleport:Button("Safe Place", function()
    Tween(TweenInfo.new(0.2), CFrame.new(505, 87, -5226))
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

local autorejoin = Misc:Toggle("Auto Rejoin", function(v)
getgenv().Settings.autorejoin = v
Save()
if v then
doAutoRejoin()
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
if getgenv().Settings.antiafk == true then
antiafk:ChangeState(true)
end
if getgenv().Settings.infyield == true then
infyield:ChangeState(true)
end
if getgenv().Settings.speed == true then
speed:ChangeState(true)
end
if getgenv().Settings.jump == true then
jump:ChangeState(true)
end
if getgenv().Settings.antikick == true then
antikick:ChangeState(true)
end
if getgenv().Settings.prompt == true then
prompt:ChangeState(true)
end
if getgenv().Settings.prestige == true then
prestige:ChangeState(true)
end
if getgenv().Settings.equipdrink == true then
equipdrink:ChangeState(true)
end
if getgenv().Settings.automine == true then
automine:ChangeState(true)
end
if getgenv().Settings.collect == true then
collect:ChangeState(true)
end
if getgenv().Settings.nightmode == true then
nightmode:ChangeState(true)
end
if getgenv().Settings.starterdrink == true then
starterdrink:ChangeState(true)
end
if getgenv().Settings.seconddrink == true then
seconddrink:ChangeState(true)
end
if getgenv().Settings.thirddrink == true then
thirddrink:ChangeState(true)
end
if getgenv().Settings.fourthdrink == true then
fourthdrink:ChangeState(true)
end
if getgenv().Settings.fifthdrink == true then
fifthdrink:ChangeState(true)
end
if getgenv().Settings.sixthdrink == true then
sixthdrink:ChangeState(true)
end
if getgenv().Settings.seventhdrink == true then
seventhdrink:ChangeState(true)
end
if getgenv().Settings.eighthdrink == true then
eighthdrink:ChangeState(true)
end
if getgenv().Settings.ninthdrink == true then
ninthdrink:ChangeState(true)
end
if getgenv().Settings.atomicdrink == true then
atomicdrink:ChangeState(true)
end
if getgenv().Settings.omegaburpjuice == true then
omegaburpjuice:ChangeState(true)
end
if getgenv().Settings.thunderfizz == true then
thunderfizz:ChangeState(true)
end
if getgenv().Settings.autorejoin == true then
autorejoin:ChangeState(true)
end
if getgenv().Settings.zoomlength == true then
zoomlength:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end

local PrestigeCounter = Stats:Label("Prestige: "..game.Players.LocalPlayer.leaderstats.Prestige.Value)
local GainCounter = Stats:Label("Gain")

cp = 0

local plr = game.Players.LocalPlayer
while wait() do
	PrestigeCounter.Text = plr.leaderstats.Prestige.Value..""
	if cp ~= plr.leaderstats["Burp points"].Value then
		GainCounter:UpdateText("Gain: "..plr.leaderstats["Burp points"].Value - cp.."")
		cp = plr.leaderstats["Burp points"].Value
	end
end
