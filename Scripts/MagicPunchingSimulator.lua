local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Magic Punching Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local _Stats = Window:Page("Stats")

local Misc = Window:Page("Misc")

local filename = "DevilHub/MagicPunchingSimulator - 10182167049/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
strength = false;
damage = false;
health = false;
_speed = false;
killbandit = false;
killbanditking = false;
killeliteglobin = false;
killcastleguard = false;
killknight = false;
killenchantedknight = false;
autorejoin = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/MagicPunchingSimulator - 10182167049");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
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
	end
	end)
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

function doStrength()
spawn(function()
while getgenv().Settings.strength == true do
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UpgradeMultiplier:InvokeServer("Power")
wait(0.1)
end
end)
end

function doDamage()
spawn(function()
while getgenv().Settings.damage == true do
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UpgradeMultiplier:InvokeServer("Damage")
wait(0.1)
end
end)
end

function doHealth()
spawn(function()
while getgenv().Settings.health == true do
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UpgradeMultiplier:InvokeServer("Health")
wait(0.1)
end
end)
end

function _doSpeed()
spawn(function()
while getgenv().Settings._speed == true do
game:GetService("ReplicatedStorage").Events.RemoteFunctions.UpgradeMultiplier:InvokeServer("WalkSpeed")
wait(0.1)
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

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

function doKillBandit()
spawn(function()
while getgenv().Settings.killbandit == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.Bandits:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
wait(0.1)
end
end)
end

function doKillBanditKing()
spawn(function()
while getgenv().Settings.killbanditking == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.BanditKings:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
wait(0.1)
end
end)
end

function doKillEliteGlobin()
spawn(function()
while getgenv().Settings.killeliteglobin == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.EliteGoblins:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
wait(0.1)
end
end)
end

function doKillCastleGuard()
spawn(function()
while getgenv().Settings.killcastleguard == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.CastleGuards:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
wait(0.1)
end
end)
end

function doKillKnight()
spawn(function()
while getgenv().Settings.killknight == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.Knights:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
end
wait(0.1)
end
end)
end

function doKillEnchantedKnight()
spawn(function()
while getgenv().Settings.killenchantedknight == true do
    for i,v in pairs(game:GetService("Workspace").EnemiesAndSpawns.EnchantedKnights:GetChildren()) do
        if v:WaitForChild("Humanoid", 0.1) or v:WaitForChild("HumanoidRootPart", 0.1) then
            if v:WaitForChild("Humanoid").Health ~= 0 then
                module:Tween(TweenInfo.new(0.1), v:WaitForChild("HumanoidRootPart").CFrame)
                game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
            end
        end
    end
wait(0.1)
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

local killbandit = AutoFarm:Toggle("Autokill bandits", function(v)
getgenv().Settings.killbandit = v
Save()
if v then
    doKillBandit()
end
end)

local killbanditking = AutoFarm:Toggle("Autokill banditking", function(v)
getgenv().Settings.killbanditking = v
Save()
if v then
    doKillBanditKing()
end
end)

local killeliteglobin = AutoFarm:Toggle("Autokill eliteglobin", function(v)
getgenv().Settings.killeliteglobin = v
Save()
if v then
    doKillEliteGlobin()
end
end)

local killcastleguard = AutoFarm:Toggle("Autokill castleguard", function(v)
getgenv().Settings.killcastleguard = v
Save()
if v then
    doKillCastleGuard()
end
end)

local killknight = AutoFarm:Toggle("Autokill knight", function(v)
getgenv().Settings.killknight = v
Save()
if v then
    doKillKnight()
end
end)

local killenchantedknight = AutoFarm:Toggle("Autokill enchantedknight", function(v)
getgenv().Settings.killenchantedknight = v
Save()
if v then
    doKillEnchantedKnight()
end
end)

local strength = AutoFarm:Toggle("Auto Upgrade Strength", function(v)
getgenv().Settings.strength = v
Save()
if v then
doStrength()
end
end)

local damage = AutoFarm:Toggle("Auto Upgrade Damage", function(v)
getgenv().Settings.damage = v
Save()
if v then
doDamage()
end
end)

local health = AutoFarm:Toggle("Auto Upgrade Health", function(v)
getgenv().Settings.health = v
Save()
if v then
doHealth()
end
end)

local _speed = AutoFarm:Toggle("Auto Upgrade Speed", function(v)
getgenv().Settings._speed = v
Save()
if v then
_doSpeed()
end
end)

LocalPlayer:Button("Teleport to SafeZone", function()
    module:Tween(TweenInfo.new(0.2), CFrame.new(-11, 3, 4))
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

Misc:Button("Show Upgrade UI", function()
    firetouchinterest(game:GetService("Workspace").SpawnObjects.UpgradeButton.UpgradeBox, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
    wait()
    firetouchinterest(game:GetService("Workspace").SpawnObjects.UpgradeButton.UpgradeBox, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
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

_Stats:Label("--------Player Stats--------")
local PlayerKills = _Stats:Label("Player Kills: "..game:GetService("Players").LocalPlayer.PlayerKills.Value)
local NPCKills = _Stats:Label("NPC Kills: "..game:GetService("Players").LocalPlayer.NPCKills.Value)

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
if getgenv().Settings.strength == true then
strength:ChangeState(true)
end
if getgenv().Settings.damage == true then
damage:ChangeState(true)
end
if getgenv().Settings.health == true then
health:ChangeState(true)
end
if getgenv().Settings._speed == true then
_speed:ChangeState(true)
end
if getgenv().Settings.killbandit == true then
killbandit:ChangeState(true)
end
if getgenv().Settings.killbanditking == true then
killbanditking:ChangeState(true)
end
if getgenv().Settings.killeliteglobin == true then
killeliteglobin:ChangeState(true)
end
if getgenv().Settings.killcastleguard == true then
killcastleguard:ChangeState(true)
end
if getgenv().Settings.killknight == true then
killknight:ChangeState(true)
end
if getgenv().Settings.killenchantedknight == true then
killenchantedknight:ChangeState(true)
end
if getgenv().Settings.autorejoin == true then
autorejoin:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end

while wait() do
    PlayerKills:UpdateText("Player Kills: "..game:GetService("Players").LocalPlayer.PlayerKills.Value)
    NPCKills:UpdateText("NPC Kills: "..game:GetService("Players").LocalPlayer.NPCKills.Value)
end    