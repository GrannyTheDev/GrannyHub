local PrestigeInfo = Instance.new("TextLabel")
local PrestigeCounter = Instance.new("TextLabel")
local GainInfo = Instance.new("TextLabel")
local GainCounter = Instance.new("TextLabel")
local Dragger = Instance.new("Frame")
local Gui = Instance.new("ScreenGui")

Gui.Name = "Gui"
Gui.ResetOnSpawn = false

if gethui then
     Gui.Parent = gethui()
elseif syn and syn.protect_gui then
     syn.protect_gui(Gui)
     Gui.Parent = cloneref(game:GetService("CoreGui"))
else
     Gui.Parent = cloneref(game:GetService("CoreGui"))
end

Dragger.Name = "Dragger"
Dragger.Active = true
Dragger.Parent = Gui
Dragger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dragger.BackgroundTransparency = 1.000
Dragger.Position = UDim2.new(0, 30, 0, 170)
Dragger.Size = UDim2.new(0, 200, 0, 100)

PrestigeInfo.Name = "PrestigeInfo"
PrestigeInfo.Parent = Dragger
PrestigeInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PrestigeInfo.BackgroundTransparency = 1.000
PrestigeInfo.Position = UDim2.new(0, 0, 0, 0)
PrestigeInfo.Size = UDim2.new(0, 109, 0, 71)
PrestigeInfo.Font = Enum.Font.SourceSans
PrestigeInfo.Text = "Prestige:"
PrestigeInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
PrestigeInfo.TextScaled = true
PrestigeInfo.TextSize = 48.000
PrestigeInfo.TextWrapped = true

PrestigeCounter.Name = "PrestigeCounter"
PrestigeCounter.Parent = Dragger
PrestigeCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PrestigeCounter.BackgroundTransparency = 1.000
PrestigeCounter.Position = UDim2.new(0, 120, 0, 13)
PrestigeCounter.Size = UDim2.new(0, 109, 0, 50)
PrestigeCounter.Font = Enum.Font.SourceSansLight
PrestigeCounter.Text = ""
PrestigeCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
PrestigeCounter.TextScaled = true
PrestigeCounter.TextSize = 48.000
PrestigeCounter.TextWrapped = true
PrestigeCounter.TextXAlignment = 0

GainInfo.Name = "GainInfo"
GainInfo.Parent = Dragger
GainInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GainInfo.BackgroundTransparency = 1.000
GainInfo.Position = UDim2.new(0, -3, 0, 35)
GainInfo.Size = UDim2.new(0, 100, 0, 71)
GainInfo.Font = Enum.Font.SourceSans
GainInfo.Text = "Gain:"
GainInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
GainInfo.TextScaled = true
GainInfo.TextSize = 48.000
GainInfo.TextWrapped = true

GainCounter.Name = "GainCounter"
GainCounter.Parent = Dragger
GainCounter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GainCounter.BackgroundTransparency = 1.000
GainCounter.Position = UDim2.new(0, 120, 0, 50)
GainCounter.Size = UDim2.new(0, 109, 0, 50)
GainCounter.Font = Enum.Font.SourceSansLight
GainCounter.Text = ""
GainCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
GainCounter.TextScaled = true
GainCounter.TextSize = 14.000
GainCounter.TextWrapped = true
GainCounter.TextXAlignment = 0

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/DragModule.lua"))()
module:Drag(Dragger)

cp = 0

local plr = game.Players.LocalPlayer
while wait() do
	PrestigeCounter.Text = plr.leaderstats.Prestige.Value..""
	if cp ~= plr.leaderstats["Burp points"].Value then
		GainCounter.Text = "+"..plr.leaderstats["Burp points"].Value - cp..""
		cp = plr.leaderstats["Burp points"].Value
	end
end
