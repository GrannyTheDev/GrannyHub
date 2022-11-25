local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Treasure Quest")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/TreasureQuest - 2960777560/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
farmmobs = false;
autostart = false;
collectchests = false;
dailyrewards = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/TreasureQuest - 2960777560");
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
    if not game:GetService("ReplicatedStorage").Dungeon.Assets then
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
    elseif game:GetService("ReplicatedStorage").Dungeon.Assets then
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 60
    end
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

function doDailyRewards()
spawn(function()
while getgenv().Settings.dailyrewards == true do
firetouchinterest(game:GetService("Workspace").Lobby.Random.TreasureReward, game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
wait(0.1)
firetouchinterest(game:GetService("Workspace").Lobby.Random.TreasureReward, game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
wait(0.1)
end
end)
end

function doAutoStart()
    spawn(function()
    if getgenv().Settings.autostart == true then
        game:GetService("ReplicatedStorage").Dungeon.Remotes.StartDungeon:FireServer()
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Model") and v.Name == "FinishRoom" then
            firetouchinterest(v:WaitForChild("Hitbox"):WaitForChild("Part"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
            wait(0.1)
            firetouchinterest(v:WaitForChild("Hitbox"):WaitForChild("Part"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
        end
        end
    end
    end)
end

function doCollectChests()
    spawn(function()
    while getgenv().Settings.collectchests == true do
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Folder") and v.Name == "Chests" then
            firetouchinterest(v:WaitForChild("Chest"):WaitForChild("Hitbox"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 1)
            wait(0.1)
            firetouchinterest(v:WaitForChild("Chest"):WaitForChild("Hitbox"), game.Players.LocalPlayer.Character:WaitForChild("Head"), 0)
    end
    end
    wait(0.1)
    end
    end)
end


local farmmobs = AutoFarm:Toggle("AutoFarm Mobs", function(v)
getgenv().Settings.farmmobs = v
Save()
end)

local client = game.Players.LocalPlayer;
local character = client.Character or client.CharacterAdded:Wait();
client.CharacterAdded:Connect(function(char)
    character = char;
end);
    pcall(function() 
    if getgenv().mainLoop then
        getgenv().mainLoop:Disconnect();
    end;
end);
		local function tween(obj, time, ...)
        local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(time), ...);
        tween:Play();
	    return tween;
	    end
getgenv().mainLoop = game:GetService("RunService").stepped:Connect(function()
if not character or (character and not (character:FindFirstChild('HumanoidRootPart') and character:FindFirstChild('Humanoid'))) then return end;

if getgenv().Settings.farmmobs then
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA("Humanoid") and v.Name == "EvilHumanoid" then
        if v.Parent:WaitForChild("EvilHumanoid").Health ~= 0 then
        if game.PlaceId ~= 2960777560 then
        local mob = v.Parent:WaitForChild("HumanoidRootPart")
        tween(character:WaitForChild("HumanoidRootPart"), client:DistanceFromCharacter(mob.Position) / 40, { CFrame = mob.CFrame + Vector3.new(math.random(2, 5), 1, 0) }, Enum.EasingStyle.Linear);
        if not game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
        local vel = Instance.new("BodyVelocity", game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
        vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        vel.P = 1500
        end
                    Clip = false
                    wait(0.1)
                        if Clip == false and game:GetService("Players").LocalPlayer.Character ~= nil then
                            for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                                if child:IsA("BasePart") and child.CanCollide == true then
                                    child.CanCollide = false
                                end
                            end
                        end
	    require(game:GetService("Players").LocalPlayer.PlayerScripts.Shared.Client.CombatController):BasicAttack()
end
end
end
end
end
end)

local autostart = AutoFarm:Toggle("Auto Start Dungeon", function(v)
    getgenv().Settings.autostart = v
    Save()
    if v then
    doAutoStart()
    end
end)

local collectchests = AutoFarm:Toggle("Auto Collect Chests", function(v)
    getgenv().Settings.collectchests = v
    Save()
    if v then
    doCollectChests()
    end
end)

local dailyrewards = AutoFarm:Toggle("Auto Collect Daily Rewards", function(v)
    getgenv().Settings.dailyrewards = v
    Save()
    if v then
    doDailyRewards()
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

local Request = request or syn.request
local clipboard = setclipboard or syn.write_clipboard

Misc:Button("Join the discord server", function()
	if clipboard then
		clipboard('https://discord.com/invite/dYHag43eeU')
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
if getgenv().Settings.farmmobs == true then
farmmobs:ChangeState(true)
end
if getgenv().Settings.autostart == true then
autostart:ChangeState(true)
end
if getgenv().Settings.collectchests == true then
collectchests:ChangeState(true)
end
if getgenv().Settings.dailyrewards == true then
dailyrewards:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
