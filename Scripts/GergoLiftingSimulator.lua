local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Gergo's Lifting Simulator")

   local AutoFarm = Gui:Page("AutoFarm")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Misc = Gui:Page("Misc")
   
local filename = "DevilHub/GergoLiftingSimulator - 11479042514/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
lift = false;
buyweight = false;
buystage = false;
sell = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/GergoLiftingSimulator - 11479042514");
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
            return oldnewindex(a, b, 500)
        end
        return oldnewindex(a, b, c)
    end)
         
    game:GetService("RunService").Stepped:Connect(function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 500
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

function doLift()
spawn(function()
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if getgenv().Settings.lift == true then
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") then
        v:Activate()
    end
end
debounce = false
end
end)
end)
end

function doBuyWeight()
spawn(function()
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if getgenv().Settings.buyweight == true then
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Weights.Frame.Scrollables.LSweights:GetChildren()) do
    if v:IsA("Frame") and v:FindFirstChildWhichIsA("ImageLabel").Name ~= "ImageLabel" then
        game:GetService("ReplicatedStorage").BuyWeight:FireServer(v:FindFirstChildWhichIsA("ImageLabel").Name)
    end
end
debounce = false
end
end)
end)
end

function doBuyStage()
spawn(function()
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if getgenv().Settings.buystage == true then
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Stages.Frame.Scrollables.Stages:GetChildren()) do
    if v:IsA("Frame") and v:FindFirstChildWhichIsA("ImageLabel").Name ~= "ImageLabel" then
        game:GetService("ReplicatedStorage").BuyStage:FireServer(v:FindFirstChildWhichIsA("ImageLabel").Name)
    end
end
debounce = false
end
end)
end)
end

function doSell()
spawn(function()
local debounce = false
game:GetService("RunService").Heartbeat:Connect(function()
if getgenv().Settings.sell == true then
if debounce then
    return
end
debounce = true
wait(0.1)
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Settingsbutton.Sure.yes.MouseButton1Click)) do
    v.Function()
end
debounce = false
end
end)
end)
end

local lift = AutoFarm:Toggle("Auto Lift", function(v)
getgenv().Settings.lift = v
Save()
if v then
doLift()
end
end)

local sell = AutoFarm:Toggle("Auto Sell", function(v)
getgenv().Settings.sell = v
Save()
if v then
doSell()
end
end)

local buyweight = AutoFarm:Toggle("Autobuy Weight", function(v)
getgenv().Settings.buyweight = v
Save()
if v then
doBuyWeight()
end
end)

local buystage = AutoFarm:Toggle("Autobuy Stage", function(v)
getgenv().Settings.buystage = v
Save()
if v then
doBuyStage()
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
		clipboard('https://discord.com/invite/esn6q3BbV2')
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
if getgenv().Settings.lift == true then
lift:ChangeState(true)
end
if getgenv().Settings.sell == true then
sell:ChangeState(true)
end
if getgenv().Settings.buyweight == true then
buyweight:ChangeState(true)
end
if getgenv().Settings.buystage == true then
buystage:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
