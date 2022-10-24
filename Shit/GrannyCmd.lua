if gethui then
	for i,v in pairs(gethui():GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
			v:Destroy()
		end
	end
elseif syn and syn.unprotect_gui then
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
			syn.unprotect_gui(v)
			v:Destroy()
		end
	end
else
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
			v:Destroy()
		end
	end
end

local GrannyCmd = Instance.new("ScreenGui")
local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local close = Instance.new("TextButton")
local MainFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local HoverGui = Instance.new("Frame")

GrannyCmd.Name = "GrannyCmd"
GrannyCmd.ResetOnSpawn = false

if gethui then
	GrannyCmd.Parent = gethui();
elseif syn and syn.protect_gui then
	syn.protect_gui(GrannyCmd);
	GrannyCmd.Parent = cloneref(game:GetService("CoreGui"))
else
	GrannyCmd.Parent = cloneref(game:GetService("CoreGui"))
end

Header.Name = "Header"
Header.Parent = GrannyCmd
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Header.Position = UDim2.new(0.843, 0, 0.597, 0)
Header.Size = UDim2.new(0, 166, 0, 30)

local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/DragModule.lua"))()
module:Drag(Header)

Instance.new("UICorner", Header)

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, -0.0200002026, 0)
Title.Size = UDim2.new(0, 127, 0, 27)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "GrannyCmd"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

close.Archivable = false
close.Name = "close"
close.Parent = Header
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.000
close.BorderSizePixel = 0
close.Position = UDim2.new(0.765060246, 0, -0.0333333351, 0)
close.Size = UDim2.new(0, 38, 0, 27)
close.Font = Enum.Font.SourceSansBold
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
close.MouseButton1Click:Connect(function()
	if gethui then
		for i,v in pairs(gethui():GetChildren()) do
			if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
				v:Destroy()
			end
		end
	elseif syn and syn.unprotect_gui then
		for i,v in pairs(game.CoreGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
				syn.unprotect_gui(v)
				v:Destroy()
			end
		end
	else
		for i,v in pairs(game.CoreGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Name == "GrannyCmd" then
				v:Destroy()
			end
		end
	end
end)

MainFrame.Name = "MainFrame"
MainFrame.Parent = Header
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0, 0, 0.815, 0)
MainFrame.Size = UDim2.new(0, 166, 0, 0)
MainFrame.ScrollBarThickness = 5
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

HoverGui.Name = "HoverGui"
HoverGui.Parent = Header
HoverGui.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
HoverGui.Position = UDim2.new(0, 0, 0, 0)
HoverGui.Size = UDim2.new(0, 166, 0, 180)
HoverGui.BackgroundTransparency = 1

HoverGui.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 166, 0, 150)}):Play()
end)

HoverGui.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 166, 0, 0)}):Play()
end)

Instance.new("UICorner", MainFrame)

if MainFrame.Size == UDim2.new(0, 166, 0, 0) then
	MainFrame.ScrollBarImageTransparency = 1
else
	MainFrame.ScrollBarImageTransparency = 0
end

MainFrame:GetPropertyChangedSignal("Size"):Connect(function()
	if MainFrame.Size == UDim2.new(0, 166, 0, 0) then
		MainFrame.ScrollBarImageTransparency = 1
	else
		MainFrame.ScrollBarImageTransparency = 0
	end
end)

UIListLayout.Parent = MainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Changed:Connect(function()
	MainFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

function CreateButton(txt, callback)
	local Button = Instance.new("TextButton")
	local callback = callback or function() end
	Button.Name = txt
	Button.Parent = MainFrame
	Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Button.Position = UDim2.new(-0.102409638, 0, 0, 0)
	Button.Size = UDim2.new(0, 144, 0, 21)
	Button.Font = Enum.Font.SourceSansBold
	Button.Text = txt
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextWrapped = true
	Button.MouseButton1Click:Connect(function()
		pcall(callback)
	end)

	Instance.new("UICorner", Button)
end

CreateButton("Join discord server", function()
	if setclipboard then
		setclipboard("https://discord.gg/esn6q3BbV2")
		MainFrame["Join discord server"].Text = "Copied"
		wait(1)
		MainFrame["Join discord server"].Text = "Join discord server"
	else
		MainFrame["Join discord server"].Text = "Your exploit has missing functions"
		wait(1)
		MainFrame["Join discord server"].Text = "Join discord server"
	end
end)

CreateButton("GrannyHub", function()
	loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/GrannyHub.lua"))()
end)

CreateButton("GrannyDex", function()
	loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Shit/GrannyDex.lua"))()
end)

CreateButton("WalkSpeed", function()
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
end)

CreateButton("Inf Jump", function()
	game:GetService("UserInputService").JumpRequest:Connect(function()
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")		
	end)
end)

getgenv().Noclip = false

CreateButton("Noclip", function()
	local Workspace = game:GetService("Workspace")
	local CoreGui = game:GetService("CoreGui")
	local Players = game:GetService("Players")
	local Plr = Players.LocalPlayer
	getgenv().Noclip = true
	Stepped = game:GetService("RunService").Stepped:Connect(function()
		if getgenv().Noclip == true then
			for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end)

CreateButton("Clip", function()
	local Workspace = game:GetService("Workspace")
	local CoreGui = game:GetService("CoreGui")
	local Players = game:GetService("Players")
	local Plr = Players.LocalPlayer
	getgenv().Noclip = false
	Stepped = game:GetService("RunService").Stepped:Connect(function()
		if getgenv().Noclip == true then
			for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)
end)

CreateButton("Disable all purchase prompts", function()
	game.CoreGui:WaitForChild("PurchasePrompt").Enabled = false
end)

CreateButton("Enable all purchase prompts", function()
	game.CoreGui:WaitForChild("PurchasePrompt").Enabled = true
end)

CreateButton("Rejoin", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

CreateButton("Anti Afk", function()
	local VirtualUser = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end)