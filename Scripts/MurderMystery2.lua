local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Murder Mystery 2")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/MurderMystery2 - 142823291/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
esp = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("DevilHub");
makefolder("DevilHub/MurderMystery2 - 142823291");
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

function doEsp()
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Settings.esp == true then
        local Players = game:GetService("Players")
        
        for i, Plr in pairs(Players:GetPlayers()) do
            for i, Bp in pairs(Plr:GetChildren()) do
                if Bp.Name == "Backpack" then
                    if Bp:FindFirstChild("Gun") ~= nil then
                        if Bp.Parent.Character:FindFirstChild("UpperTorso"):FindFirstChild("SherifBox") == nil then
                            local box = Instance.new("BoxHandleAdornment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            box.Name = "SherifBox"
                            box.Size = Bp.Parent.Character:FindFirstChild("UpperTorso").Size
                            box.Adornee = Bp.Parent.Character:FindFirstChild("UpperTorso")
                            box.ZIndex = 5
                            box.AlwaysOnTop = true
                            box.Color3 = Color3.fromRGB(0, 50, 255)
                                
                            local at0 = Instance.new("Attachment", game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso"))
                            local at1 = Instance.new("Attachment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            local beam = Instance.new("Beam", game.Players.LocalPlayer.Character)
                            beam.Name = "SherifBeam"
                            beam.Color = ColorSequence.new(Color3.fromRGB(0, 50, 255), Color3.fromRGB(0, 50, 255))
                            beam.FaceCamera = true
                            beam.Width0 = 0.2
                            beam.Width1 = 0.2
                            beam.Attachment0 = at0
                            beam.Attachment1 = at1
                        end
                    end
                end
            end
        end
        for i, Plr in pairs(Players:GetPlayers()) do
            for i, Bp in pairs(Plr:GetChildren()) do
                if Bp.Name == "Backpack" then
                    if Bp:FindFirstChild("Knife") ~= nil then
                        if Bp.Parent.Character:FindFirstChild("UpperTorso"):FindFirstChild("MurderBox") == nil then
                            local box = Instance.new("BoxHandleAdornment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            box.Name = "MurderBox"
                            box.Size = Bp.Parent.Character:FindFirstChild("UpperTorso").Size
                            box.Adornee = Bp.Parent.Character:FindFirstChild("UpperTorso")
                            box.ZIndex = 5
                            box.AlwaysOnTop = true
                            box.Color3 = Color3.fromRGB(255, 0, 25)
                            
                            local at0 = Instance.new("Attachment", game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso"))
                            local at1 = Instance.new("Attachment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            local beam = Instance.new("Beam", game.Players.LocalPlayer.Character)
                            beam.Name = "MurderBeam"
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 25), Color3.fromRGB(255, 0, 25))
                            beam.FaceCamera = true
                            beam.Width0 = 0.2
                            beam.Width1 = 0.2
                            beam.Attachment0 = at0
                            beam.Attachment1 = at1
                        end
                    end
                end
            end
        end
        for i, Plr in pairs(Players:GetPlayers()) do
            Plr.CharacterAdded:Connect(function()
            for i, Bp in pairs(Plr:GetChildren()) do
                if Bp.Name == "Backpack" then
                    if Bp:FindFirstChild("Knife") ~= nil then
                        if Bp.Parent.Character:FindFirstChild("UpperTorso"):FindFirstChild("MurderBox") == nil then
                            local box = Instance.new("BoxHandleAdornment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            box.Name = "MurderBox"
                            box.Size = Bp.Parent.Character:FindFirstChild("UpperTorso").Size
                            box.Adornee = Bp.Parent.Character:FindFirstChild("UpperTorso")
                            box.ZIndex = 5
                            box.AlwaysOnTop = true
                            box.Color3 = Color3.fromRGB(255, 0, 25)
                            
                            local at0 = Instance.new("Attachment", game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso"))
                            local at1 = Instance.new("Attachment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            local beam = Instance.new("Beam", game.Players.LocalPlayer.Character)
                            beam.Name = "MurderBeam"
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 25), Color3.fromRGB(255, 0, 25))
                            beam.FaceCamera = true
                            beam.Width0 = 0.2
                            beam.Width1 = 0.2
                            beam.Attachment0 = at0
                            beam.Attachment1 = at1
                        end
                    end
                end
            end
        end)
    end
        for i, Plr in pairs(Players:GetPlayers()) do
            Plr.CharacterAdded:Connect(function()
            for i, Bp in pairs(Plr:GetChildren()) do
                if Bp.Name == "Backpack" then
                    if Bp:FindFirstChild("Gun") ~= nil then
                        if Bp.Parent.Character:FindFirstChild("UpperTorso"):FindFirstChild("SherifBox") == nil then
                            local box = Instance.new("BoxHandleAdornment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            box.Name = "SherifBox"
                            box.Size = Bp.Parent.Character:FindFirstChild("UpperTorso").Size
                            box.Adornee = Bp.Parent.Character:FindFirstChild("UpperTorso")
                            box.ZIndex = 5
                            box.AlwaysOnTop = true
                            box.Color3 = Color3.fromRGB(0, 50, 255)
                                
                            local at0 = Instance.new("Attachment", game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso"))
                            local at1 = Instance.new("Attachment", Bp.Parent.Character:FindFirstChild("UpperTorso"))
                            local beam = Instance.new("Beam", game.Players.LocalPlayer.Character)
                            beam.Name = "SherifBeam"
                            beam.Color = ColorSequence.new(Color3.fromRGB(0, 50, 255), Color3.fromRGB(0, 50, 255))
                            beam.FaceCamera = true
                            beam.Width0 = 0.2
                            beam.Width1 = 0.2
                            beam.Attachment0 = at0
                            beam.Attachment1 = at1
                        end
                    end
                end
            end
        end)
        end
    end
end)
        
        
game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Settings.esp == false then
    for i,v in pairs(game.Players:GetChildren()) do
                local char = v.Character or v.CharacterAdded:Wait()
                if v:IsA("Player") and char:FindFirstChild("UpperTorso") then
                if char:FindFirstChild("UpperTorso"):FindFirstChild("MurderBox") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("MurderBeam") ~= nil and char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment") ~= nil then
                    char:FindFirstChild("UpperTorso"):FindFirstChild("MurderBox"):Destroy()
                    game.Players.LocalPlayer.Character:FindFirstChild("MurderBeam"):Destroy()
                    char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment"):Destroy()
                end
                if char:FindFirstChild("UpperTorso"):FindFirstChild("SherifBox") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("SherifBeam") ~= nil and char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment") ~= nil then
                    char:FindFirstChild("UpperTorso"):FindFirstChild("SherifBox"):Destroy()
                    game.Players.LocalPlayer.Character:FindFirstChild("SherifBeam"):Destroy()
                    char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment"):Destroy()
                end
            end
        end
    end
end)
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

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/Teleport.lua"))()

LocalPlayer:Button("Teleport to Serif", function()
for i, Plr in pairs(game.Players:GetPlayers()) do
    for i, Bp in pairs(Plr:GetChildren()) do
        if Bp.Name == "Backpack" or Bp.Name == "Character" then
            if Bp:FindFirstChild("Gun") ~= nil then
                module:Tween(TweenInfo.new(0.2), Bp.Parent.Character.HumanoidRootPart.CFrame)
            end
        end
    end
end
end)

LocalPlayer:Button("Teleport to Murder", function()
for i, Plr in pairs(game.Players:GetPlayers()) do
    for i, Bp in pairs(Plr:GetChildren()) do
        if Bp.Name == "Backpack" or Bp.Name == "Character" then
            if Bp:FindFirstChild("Knife") ~= nil then
                module:Tween(TweenInfo.new(0.2), Bp.Parent.Character.HumanoidRootPart.CFrame)
            end
        end
    end
end
end)

local esp = LocalPlayer:Toggle("Esp", function(v)
getgenv().Settings.esp = v
Save()
if v then
doEsp()
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
if getgenv().Settings.esp == true then
esp:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end