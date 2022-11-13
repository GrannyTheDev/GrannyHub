local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Prison Life")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/PrisonLife - 155615604/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
gunmods = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/PrisonLife - 155615604");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

workspace.Remote.TeamEvent:FireServer("Medium stone grey")

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

function doGunMods()
spawn(function()
while getgenv().Settings.gunmods == true do
    for i,v in pairs(getgc(true)) do
		if type(v) == 'table' then
			if rawget(v, 'MaxAmmo') then
				v.AutoFire = true
				v.FireRate = 0.1
				v.MaxAmmo = math.huge
				v.CurrentAmmo = math.huge
				v.StoredAmmo = math.huge
                v.Damage = 100
            end
        end
    end
    wait(1)
end
end)
end

LocalPlayer:Button("Get Guns", function()
    for i,v in pairs(game:GetService("Workspace")["Prison_ITEMS"].giver:GetChildren()) do
        if v.Name == "Remington 870" or v.Name == "AK-47" or v.Name == "M9" then
            game:GetService("Workspace").Remote.ItemHandler:InvokeServer(v["ITEMPICKUP"])
        end
    end
end)

getgenv().plr = ""

LocalPlayer:Box("Player Name", "Input Player Name", function(v)
   getgenv().plr = v
end)

local killplr = LocalPlayer:Toggle("Auto Kill Player", function(v)
    mainRemotes = game.ReplicatedStorage
    meleeRemote = mainRemotes['meleeEvent']
    local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()
    
    function getRoot(char)
        local rootPart = char:WaitForChild('HumanoidRootPart', 0.1) or char:WaitForChild('Torso', 0.1) or char:WaitForChild('UpperTorso', 0.1)
        return rootPart
    end
    
    function getHum(hum)
        local humItem = hum:WaitForChild('Humanoid', 0.1)
        return humItem
    end
    
    repeat wait() until getRoot(game.Players.LocalPlayer.Character)
    getgenv().kill = v
    while true do
    if not getgenv().kill then return end
    wait(0.1)
    for i,v in pairs(game.Teams:GetChildren()) do
    if v.Name ~= "Neutral" then
    for i,v in pairs (game:GetService('Players'):GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
    if v.Name == getgenv().plr then
    if getRoot(v.Character) and getHum(v.Character) then
    if getHum(v.Character).Health ~= 0 then
    if getHum(game.Players.LocalPlayer.Character).Sit == true then
    getHum(game.Players.LocalPlayer.Character):ChangeState("Jumping")
    end
    module:Tween(TweenInfo.new(0.1), getRoot(v.Character).CFrame)
    meleeRemote:FireServer(v)
    end
    end
    end
    end
    end
end
end
end
end)

local autokill = LocalPlayer:Toggle("Auto Kill", function(v)
    mainRemotes = game.ReplicatedStorage
    meleeRemote = mainRemotes['meleeEvent']
    local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()
    
    function getRoot(char)
        local rootPart = char:WaitForChild('HumanoidRootPart', 0.1) or char:WaitForChild('Torso', 0.1) or char:WaitForChild('UpperTorso', 0.1)
        return rootPart
    end
    
    function getHum(hum)
        local humItem = hum:WaitForChild('Humanoid', 0.1)
        return humItem
    end
    
    repeat wait() until getRoot(game.Players.LocalPlayer.Character)
    getgenv().kill = v
    while true do
    if not getgenv().kill then return end
    wait(0.1)
    for i,v in pairs(game.Teams:GetChildren()) do
    if v.Name ~= "Neutral" then
    for i,v in pairs (game:GetService('Players'):GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
    if getRoot(v.Character) and getHum(v.Character) then
    if getHum(v.Character).Health ~= 0 then
    if getHum(game.Players.LocalPlayer.Character).Sit == true then
    getHum(game.Players.LocalPlayer.Character):ChangeState("Jumping")
    end
    module:Tween(TweenInfo.new(0.1), getRoot(v.Character).CFrame)
    meleeRemote:FireServer(v)
    end
    end
    end
    end
    end
    end
    end
end)

autokill:Keybind(Enum.KeyCode.K)

local gunmods = LocalPlayer:Toggle("GunMods", function(v)
getgenv().Settings.gunmods = v
Save()
if v then
doGunMods()
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
if getgenv().Settings.gunmods == true then
gunmods:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end