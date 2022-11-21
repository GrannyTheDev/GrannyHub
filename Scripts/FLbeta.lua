local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - FL beta")

local LocalPlayer = Window:Page("LocalPlayer")

local Teleport = Window:Page("Teleport")

local Misc = Window:Page("Misc")

function getchar()
	for i,v in pairs(game.Workspace:GetChildren()) do
		if v.Name == game.Players.LocalPlayer.Name then
			return v.HumanoidRootPart
		end
	end
	return nil
end

function Tween(Time, pos)
	game:GetService("TweenService"):Create(getchar(), Time, {CFrame = pos}):Play()
end

local filename = "DevilHub/flbeta - 5104202731/Config.json"

getgenv().Settings = {
	speed = false;
	jump = false;
	infyield = false;
	antiafk = false;
	autorob = false;
}

function Save()
	local json;
	local HttpService = game:GetService("HttpService");
	if (writefile) then
		json = HttpService:JSONEncode(getgenv().Settings);
		makefolder("DevilHub");
		makefolder("DevilHub/flbeta - 5104202731");
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
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end
	end)
end

function doAutoRob()
	spawn(function()
		while getgenv().Settings.autorob == true do
                    for i,v in pairs(workspace.crimObjects:GetDescendants()) do
                       if v:IsA("ClickDetector") then
                           fireclickdetector(v)
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
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetChildren()) do
				if v:IsA("LocalScript") and v.Name == "afkEnable" then
					v:Destroy()
				end
			end
		end
	end)
end

Teleport:Button("Bank", function()
	Tween(TweenInfo.new(0.1), CFrame.new(6366, 24, 73))
end)

Teleport:Button("StudRac", function()
	Tween(TweenInfo.new(0.1), CFrame.new(3351, 23, -341))
end)

Teleport:Button("WaterPark", function()
	Tween(TweenInfo.new(0.1), CFrame.new(5195, 133, 3481))
end)

Teleport:Button("Sunset Performance", function()
	Tween(TweenInfo.new(0.1), CFrame.new(6985, 23, -46))
end)

Teleport:Button("Fintech", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8773, 27, -2729))
end)

Teleport:Button("LHS Hospital", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9054, 23, -4634))
end)

Teleport:Button("Starblocks", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9529, 23, -4102))
end)

Teleport:Button("Police Station", function()
	Tween(TweenInfo.new(0.1), CFrame.new(5822, 23, 639))
end)

Teleport:Button("Fire Station", function()
	Tween(TweenInfo.new(0.1), CFrame.new(7146, 23, 273))
end)

Teleport:Button("Sussy's Mechanic Shop", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9109, 23, -1402))
end)

Teleport:Button("CVC Pharmacy", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9560, 23, -846))
end)

Teleport:Button("Automart", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9128, 23, -885))
end)

Teleport:Button("Bublix", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8792, 23, -669))
end)

Teleport:Button("Vorzen", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8911, 23, -327))
end)

Teleport:Button("Mirage", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8773, 23, 983))
end)

Teleport:Button("Dealership", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8940, 25, 3089))
end)

Teleport:Button("McBloxxer's", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9573, 23, 1206))
end)

Teleport:Button("Car Wash", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9568, 23, 980))
end)

Teleport:Button("Dippin Donuts", function()
	Tween(TweenInfo.new(0.1), CFrame.new(9636, 23, 715))
end)

Teleport:Button("Jeff's Pizza", function()
	Tween(TweenInfo.new(0.1), CFrame.new(8519, 23, -609))	
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

local autorob = LocalPlayer:Toggle("AutoRob", function(v)
	getgenv().Settings.autorob = v
	Save()
	if v then
		doAutoRob()
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

local antiafk = Misc:Toggle("Anti Afk + Anti Job Afk", function(v)
	getgenv().Settings.antiafk = v
	Save()
	if v then
		doAntiAfk()
	end
end)

local Request = request or syn.request

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
if getgenv().Settings.autorob == true then
	autorob:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
	print(i,v)
end
