local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Prison Life")

local LocalPlayer = Window:Page("LocalPlayer")

local Teleport = Window:Page("Teleport")

local Admin = Window:Page("Admin")

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

local location = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.1)
local A_1 = game.Players.LocalPlayer
local A_2 = "Really Black"
local Event = game:GetService("Workspace").Remote.loadchar
Event:InvokeServer(A_1, A_2)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location

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

Teleport:Button("Outside of prison", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(451.6684265136719, 98.0399169921875, 2216.338134765625)
end)
Teleport:Button("Prison Yard", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(736.4671630859375, 97.99992370605469, 2517.583740234375)
end)
Teleport:Button("Kitchen", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(906.641845703125, 99.98993682861328, 2237.67333984375)
end)
Teleport:Button("Prison Cells", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.5551147460938, 99.98998260498047, 2441.700927734375)
end)
Teleport:Button("Surveilance Room", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795.251953125, 99.98998260498047, 2327.720703125)
end)
Teleport:Button("Break Room", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(800.0896606445312, 99.98998260498047, 2266.71630859375)
end)
Teleport:Button("Police Armory", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(837.2889404296875, 99.98998260498047, 2270.99658203125)
end)
Teleport:Button("Police Room", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.5386352539062, 99.98998260498047, 2320.604248046875)
end)
Teleport:Button("Cafeteria", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.994873046875, 99.98993682861328, 2325.73095703125)
end)
Teleport:Button("Criminal Base Inside", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.8451538085938, 109.32379150390625, 2053.11376953125)
end)

Admin:Label("Admin Commands")
Admin:Label(":rank player - gives player commands")
Admin:Label(":kill player - kills player")
Admin:Label(":sa player - spam arrest player")
Admin:Label(":crim player - makes player criminal")
Admin:Label(":bring player - brings player")
Admin:Label(":goto player - makes you go to player")
Admin:Label(":void player - voids player")
Admin:Label(":key player - gives player keycard")
Admin:Label(":cuffs player - gives player handcuffs")
Admin:Label(":trap player - traps player")
Admin:Label(":yard player - brings player to yard")
Admin:Label(":base player - brings player to criminal base")
Admin:Label(":prison player - brings player to prison")
Admin:Label(":lk - loopkills player")
Admin:Label(":aura - gives player kill aura")
Admin:Label(":virus - makes anyone who touch player dies")
Admin:Label(":oof - kills everyone")
Admin:Label(":spike - lag spike")
Admin:Label(":bspike - big lag spike")
Admin:Label(":lag - lags the server")
Admin:Label(":crash - crashes the server")
Admin:Label(":tk player - teleport you to player and kills them")
Admin:Label(":ltk player - loops tpkill")
Admin:Label(":logs - prints all used cmds")

local mod = LocalPlayer:Button("Mod Knife and Hammer", function()
mainRemotes = game.ReplicatedStorage
meleeRemote = mainRemotes['meleeEvent']
mouse = game.Players.LocalPlayer:GetMouse()
punching = false
cooldown = false
 
function punch()
cooldown = true
local part = Instance.new("Part", game.Players.LocalPlayer.Character)
part.Transparency = 1
part.Size = Vector3.new(5, 2, 3)
part.CanCollide = false
local w1 = Instance.new("Weld", part)
w1.Part0 = game.Players.LocalPlayer.Character.Torso
w1.Part1 = part
w1.C1 = CFrame.new(0,0,2)
part.Touched:connect(function(hit)
if game.Players:FindFirstChild(hit.Parent.Name) then
local plr = game.Players:FindFirstChild(hit.Parent.Name) 
if plr.Name ~= game.Players.LocalPlayer.Name then
part:Destroy()
 
for i = 1,100 do
meleeRemote:FireServer(plr)
end
end
end
end)
 
wait(1)
cooldown = false
part:Destroy()
end

mouse.KeyDown:connect(function(key)
if cooldown == false then
if key:lower() == "f" then
punch()
end
end
end)

mainRemotes = game.ReplicatedStorage
meleeRemote = mainRemotes['meleeEvent']

    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") or v.Name == "Hammer" then
            for i,k in pairs(game:GetService('Players'):GetChildren()) do
                if k.Name ~= game.Players.LocalPlayer.Name then
                    v.Activated:Connect(function()
                        for i = 1,100 do
                            meleeRemote:FireServer(k)
                        end
                    end)
                end
            end
        end
    end

    mainRemotes = game.ReplicatedStorage
    meleeRemote = mainRemotes['meleeEvent']

    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") or v.Name == "Crude Knife" then
            for i,k in pairs(game:GetService('Players'):GetChildren()) do
                if k.Name ~= game.Players.LocalPlayer.Name then
                    v.Activated:Connect(function()
                        for i = 1,100 do
                            meleeRemote:FireServer(k)
                        end
                    end)
                end
            end
        end
    end
end)

local KillAura = LocalPlayer:Toggle("Kill Aura (Keybind: Q)", function(v)
    getgenv().killaura = v
    while true do
    if not getgenv().killaura then return end
    wait()
    mainRemotes = game.ReplicatedStorage
    meleeRemote = mainRemotes['meleeEvent']
    for i,v in pairs (game:GetService('Players'):GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            meleeRemote:FireServer(v)
        end
    end
end
end)

KillAura:Keybind(Enum.KeyCode.Q)

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

while wait(0.1) do
    if game.Players.LocalPlayer.Character.Humanoid.Health <= 15 then
        local location = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        local A_1 = game.Players.LocalPlayer.Name
        local A_2 = "Really Black"
        local Event = game:GetService("Workspace").Remote.loadchar
        Event:InvokeServer(A_1, A_2)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
    end
end

mod:Activate()

repeat wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife"))()