if game:GetService("CoreGui"):FindFirstChild("ui") then
    game:GetService("CoreGui"):FindFirstChild("ui"):Destroy()
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end) -- anti afk

local lib = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/VapeUI.lua"))()

local win = lib:Window("GrannyHub - Shadovis Rpg", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local mainTab = win:Tab("Main Tab")
local LocalPlayer = win:Tab("LocalPlayer")
local Misc = win:Tab("Misc")

getgenv().AutoFarm = nil
getgenv().selectedNPC = nil
getgenv().selectedEvent = nil
getgenv().killAura = nil
getgenv().infCube = nil
getgenv().autoReb = nil
getgenv().infHeal = nil
getgenv().FarmDistance = 7
getgenv().FarmMeth = "Below"

local lp = game.Players.LocalPlayer
local char = lp.Character

setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")

local function getNPCbyLVL()
    local t = {}

    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and not table.find(t, v.Name) then
            table.insert(t, v.Name)
        end
    end

    table.sort(t, function(a, s)
        local a1 = tonumber(string.match(a, "%d+"))
        local b1 = tonumber(string.match(s, "%d+"))

        return a1 < b1
    end)
    
    return t
end

mainTab:Dropdown("Select NPC", getNPCbyLVL(), function(t)
    getgenv().selectedNPC = t
end)

mainTab:Toggle("Auto Farm", false, function(t)
    getgenv().AutoFarm = t

    game:GetService('RunService').Stepped:connect(function()
        if getgenv().AutoFarm then
            lp.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end)

    while getgenv().AutoFarm do task.wait()
        if not char:IsDescendantOf(lp.Character.Parent) or not char:FindFirstChild("HumanoidRootPart") or not char then char = lp.Character wait(0.5) end

        for i, v in pairs(game.Workspace.NPCs:GetChildren()) do
            if v:IsA("Model") and v.Name:match(getgenv().selectedNPC) and v:FindFirstChild("HumanoidRootPart") then
                if v:WaitForChild("Humanoid").Health > 0 then
                    if getgenv().FarmMeth == "Above" then
                        lp.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,tonumber(getgenv().FarmDistance),0), v:FindFirstChild("HumanoidRootPart").Position)
                    else
                        lp.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,-tonumber(getgenv().FarmDistance),0), v:FindFirstChild("HumanoidRootPart").Position)
                    end
                end
            end
        end
    end
end)

mainTab:Slider("Distance From NPC", 1, 50, 7, function(t)
    getgenv().FarmDistance = t
end)

mainTab:Dropdown("Farm Method", {"Above", "Below"}, function(t)
    getgenv().FarmMeth = t
end)

function getAttackTool()
    local tool

    for i,v in pairs(lp.Character:WaitForChild("Equipment"):GetChildren()) do
        if v:FindFirstChild("DmgPoint") then
            tool = v
        end
    end

    return tool
end

local events = {
    ["Slash Event - Swords"] = "SlashEvent",
    ["Slam Event - Mallets"] = "SlamEvent",
    ["Joust Hurt - Lance"] = "JoustHurt"
}

mainTab:Dropdown("Attack Event", {"Slash Event - Swords","Slam Event - Mallets","Joust Hurt - Lance"}, function(t)
    getgenv().selectedEvent = t
end)

mainTab:Toggle("Kill Aura", false, function(t)
    getgenv().killAura = t

    while getgenv().killAura do task.wait(.1)
        if not char:IsDescendantOf(lp.Character.Parent) or not char:FindFirstChild("HumanoidRootPart") or not char then char = lp.Character wait(0.5) end

        for i, v in pairs(game.Workspace.NPCs:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                if (lp.Character:WaitForChild("HumanoidRootPart").Position - v:WaitForChild("HumanoidRootPart").Position).magnitude <= 100 and v:WaitForChild("Humanoid").Health > 0 then
                    local args = {
                        ["Attack"] = {
                            [1] = "Input",
                            [2] = tostring(getAttackTool()),
                            [3] = math.random(),
                            [4] = tostring(events[getgenv().selectedEvent]),
                            [5] = v:WaitForChild("HumanoidRootPart")
                        },
                        ["InstantSkills"] = {
                            ["First"] = {
                                [1] = "Input",
                                [2] = "Elemental BurstBlade of Winds",
                                [3] = 7,
                                [4] = "Spellcraft"
                            },
                            ["Second"] = {
                                [1] = "Input",
                                [2] = "Blade of Winds",
                                [3] = 10,
                                [4] = "Stride"
                            }
                        }
                    }
                    
                    lp.Character:WaitForChild("Combat").RemoteEvent:FireServer(unpack(args.Attack))

                    if tostring(getAttackTool()) == "Blade of Winds" then
                        for i, v in next, (args.InstantSkills) do
                            lp.Character:WaitForChild("Combat").RemoteEvent:FireServer(unpack(v))
                        end
                    end
                    task.wait(.1)
                end
            end
        end
    end
end)

mainTab:Button("Collect all Cubits", function(t)
    for i,v in pairs(game:GetService("Workspace")["Client Cubits"]:GetChildren()) do
        if v:IsA("MeshPart") then
            if v:FindFirstChildWhichIsA("ProximityPrompt") then
                fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt"), 1)
            end
        end
    end
end)

mainTab:Toggle("Auto Rebirth", false, function(t)
    getgenv().autoReb = t

    while getgenv().autoReb do task.wait(.4)
        local args = {
            [1] = "Rebirth"
        }
        
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end
end)

mainTab:Toggle("Inf Heal [Semi God Mode]", false, function(t)
    getgenv().infHeal = t

    game:GetService("RunService").Stepped:connect(function()
        if getgenv().infHeal then
            if not char:IsDescendantOf(lp.Character.Parent) or not char:FindFirstChild("HumanoidRootPart") or not char then char = lp.Character wait(0.5) end

            for i, v in pairs(game.Workspace.Fountains.Fountain:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Parent, 1)
                end
            end
        end
    end)
end)

mainTab:Button("Remove Effects", function()
    while task.wait() do
        for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if v.Name == "Darkfire Ring" then
                v:Destroy()
            end
        end
        
        if game:GetService("Workspace"):FindFirstChild("Projectiles") then
            game:GetService("Workspace"):FindFirstChild("Projectiles"):Destroy()
        end
    end    
end)

LocalPlayer:Button("WalkSpeed", function()
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
end)

LocalPlayer:Button("Infinite Jump", function()
game:GetService("UserInputService").JumpRequest:Connect(function()
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")		
end)
end)

LocalPlayer:Toggle("Noclip", function(v)
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

Misc:Button("Rejoin", function()
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

Misc:Button("Anti Afk", function()
loadstring(game:HttpGet("https://pastebin.com/raw/KHZ8pYx9"))()
         for i,v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "ScreenGui" then
                v.Enabled = false
            end
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