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
Header.Position = UDim2.new(0.825119257, 0, 0.778156996, 0)
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
MainFrame.Size = UDim2.new(0, 166, 0, 98)
MainFrame.ScrollBarThickness = 5
MainFrame.BorderSizePixel = 0

Instance.new("UICorner", MainFrame)

UIListLayout.Parent = MainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Changed:Connect(function()
	MainFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
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