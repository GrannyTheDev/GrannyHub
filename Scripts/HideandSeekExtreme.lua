local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/GrannyHub/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Hide and Seek Extreme")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "DevilHub/HideandseekExtreme - 205224386/Config.json"

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
makefolder("DevilHub/HideandseekExtreme - 205224386");
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

function doEsp()
spawn(function()
    local Players = game:GetService("Players")
    game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Settings.esp == true then
        game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso"):FindFirstChild("HideBox").Transparency = 1
        for i,v in pairs(game.Players:GetChildren()) do
            for a,b in pairs(game.Players:GetChildren()) do
            if b.Name == game.Players.LocalPlayer.Name then
            if b.Character:FindFirstChild("UpperTorso") then
            if v:IsA("Player") and v.Character:FindFirstChild("UpperTorso") then
            if v.Character:FindFirstChild("Glue") then
                if v.Character:FindFirstChild("UpperTorso"):FindFirstChild("SeekBox") == nil then
                    local box = Instance.new("BoxHandleAdornment", v.Character:FindFirstChild("UpperTorso"))
                    box.Name = "SeekBox"
                    box.Size = v.Character:FindFirstChild("UpperTorso").Size
                    box.Adornee = v.Character:FindFirstChild("UpperTorso")
                    box.ZIndex = 5
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.fromRGB(255, 0, 25)
    
                    local at0 = Instance.new("Attachment", b.Character:FindFirstChild("UpperTorso"))
                    local at1 = Instance.new("Attachment", v.Character:FindFirstChild("UpperTorso"))
                    local beam = Instance.new("Beam", b.Character)
                    beam.Name = "SeekBeam"
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
end
            end
    
        for i,v in pairs(game.Players:GetChildren()) do
            for a,b in pairs(game.Players:GetChildren()) do
            if b.Name == game.Players.LocalPlayer.Name then
            if b.Character:FindFirstChild("UpperTorso") then
            if v:IsA("Player") and v.Character:FindFirstChild("UpperTorso") then
                if not v.Character:FindFirstChild("Glue") then
                if v.Character:FindFirstChild("UpperTorso"):FindFirstChild("HideBox") == nil then
                    local box = Instance.new("BoxHandleAdornment", v.Character:FindFirstChild("UpperTorso"))
                    box.Name = "HideBox"
                    box.Size = v.Character:FindFirstChild("UpperTorso").Size
                    box.Adornee = v.Character:FindFirstChild("UpperTorso")
                    box.ZIndex = 5
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.fromRGB(0, 170, 255)
    
                    local at0 = Instance.new("Attachment", b.Character:FindFirstChild("UpperTorso"))
                    local at1 = Instance.new("Attachment", v.Character:FindFirstChild("UpperTorso"))
                    local beam = Instance.new("Beam", b.Character)
                    beam.Name = "HideBeam"
                    beam.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255), Color3.fromRGB(0, 170, 255))
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
    end
    end

    for i,v in pairs(game.Players:GetChildren()) do
        for a,b in pairs(game.Players:GetChildren()) do
        if b.Name == game.Players.LocalPlayer.Name then
        v.CharacterAdded:Connect(function()
        if b.Character:FindFirstChild("UpperTorso") then
        if v:IsA("Player") and v.Character:FindFirstChild("UpperTorso") then
        if v.Character:FindFirstChild("Glue") then
            if v.Character:FindFirstChild("UpperTorso"):FindFirstChild("SeekBox") == nil then
                local box = Instance.new("BoxHandleAdornment", v.Character:FindFirstChild("UpperTorso"))
                box.Name = "SeekBox"
                box.Size = v.Character:FindFirstChild("UpperTorso").Size
                box.Adornee = v.Character:FindFirstChild("UpperTorso")
                box.ZIndex = 5
                box.AlwaysOnTop = true
                box.Color3 = Color3.fromRGB(255, 0, 25)

                local at0 = Instance.new("Attachment", b.Character:FindFirstChild("UpperTorso"))
                local at1 = Instance.new("Attachment", v.Character:FindFirstChild("UpperTorso"))
                local beam = Instance.new("Beam", b.Character)
                beam.Name = "SeekBeam"
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
end
end

    for i,v in pairs(game.Players:GetChildren()) do
        for a,b in pairs(game.Players:GetChildren()) do
        if b.Name == game.Players.LocalPlayer.Name then
        v.CharacterAdded:Connect(function()
        if b.Character:FindFirstChild("UpperTorso") then
        if v:IsA("Player") and v.Character:FindFirstChild("UpperTorso") then
            if not v.Character:FindFirstChild("Glue") then
            if v.Character:FindFirstChild("UpperTorso"):FindFirstChild("HideBox") == nil then
                local box = Instance.new("BoxHandleAdornment", v.Character:FindFirstChild("UpperTorso"))
                box.Name = "HideBox"
                box.Size = v.Character:FindFirstChild("UpperTorso").Size
                box.Adornee = v.Character:FindFirstChild("UpperTorso")
                box.ZIndex = 5
                box.AlwaysOnTop = true
                box.Color3 = Color3.fromRGB(0, 170, 255)

                local at0 = Instance.new("Attachment", b.Character:FindFirstChild("UpperTorso"))
                local at1 = Instance.new("Attachment", v.Character:FindFirstChild("UpperTorso"))
                local beam = Instance.new("Beam", b.Character)
                beam.Name = "HideBeam"
                beam.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255), Color3.fromRGB(0, 170, 255))
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
end
end
end)
    
game:GetService("RunService").RenderStepped:Connect(function()
if getgenv().Settings.esp == false then
for i,v in pairs(game.Players:GetChildren()) do
            local char = v.Character or v.CharacterAdded:Wait()
            if v:IsA("Player") and char:FindFirstChild("UpperTorso") then
            if char:FindFirstChild("UpperTorso"):FindFirstChild("SeekBox") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("SeekBeam") ~= nil and char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment") ~= nil then
                char:FindFirstChild("UpperTorso"):FindFirstChild("SeekBox"):Destroy()
                game.Players.LocalPlayer.Character:FindFirstChild("SeekBeam"):Destroy()
                char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment"):Destroy()
            end
            if char:FindFirstChild("UpperTorso"):FindFirstChild("HideBox") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HideBeam") ~= nil and char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment") ~= nil then
                char:FindFirstChild("UpperTorso"):FindFirstChild("HideBox"):Destroy()
                game.Players.LocalPlayer.Character:FindFirstChild("HideBeam"):Destroy()
                char:FindFirstChild("UpperTorso"):FindFirstChild("Attachment"):Destroy()
            end
        end
    end
end
end)
end)
end

local esp = LocalPlayer:Toggle("Esp", function(v)
getgenv().Settings.esp = v
Save()
if v then
doEsp()
end
end)

LocalPlayer:Button("Collect all coins", function()
    for i,v in pairs(game:GetService("Workspace").GameObjects:GetChildren()) do
        firetouchinterest(v, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 1)
        wait()
        firetouchinterest(v, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), 0)
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