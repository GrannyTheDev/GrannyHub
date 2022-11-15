if get_hidden_gui or gethui then
	local hiddenUI = get_hidden_gui or gethui
	for i,v in pairs(hiddenUI():GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyHub" then
			v:Destroy()
		end
	end
elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyHub" then
			syn.unprotect_gui(v)
			v:Destroy()
		end
	end
else
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "GrannyHub" then
			v:Destroy()
		end
	end
end

local Library = {}

function Library:CreateWindow(txt)
	local GrannyHub = Instance.new("ScreenGui")
	local Header = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local Min = Instance.new("TextButton")
	local Container = Instance.new("Frame")
	local TabList = Instance.new("UIListLayout")
	local TabFrame = Instance.new("ScrollingFrame")
	local Dragui = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TS = game:GetService("TweenService")

	GrannyHub.Name = "GrannyHub"
	GrannyHub.ResetOnSpawn = false

	if get_hidden_gui or gethui then
		local hiddenUI = get_hidden_gui or gethui
		GrannyHub.Parent = hiddenUI()
	elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
		syn.protect_gui(GrannyHub)
		GrannyHub.Parent = cloneref(game:GetService("CoreGui"))
	else
		GrannyHub.Parent = cloneref(game:GetService("CoreGui"))
	end

	game:GetService("UserInputService").InputBegan:Connect(function(current, ok) 
		if not ok then 
			if current.KeyCode == Enum.KeyCode.RightAlt then 
				if GrannyHub.Enabled == true then
					GrannyHub.Enabled = false
				else
					GrannyHub.Enabled = true
				end
			end
		end
	end)

	Header.Name = "Header"
	Header.Parent = GrannyHub
	Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Header.Position = UDim2.new(0.368839413, 0, 0.336177468, 0)
	Header.Size = UDim2.new(0, 349, 0, 34)
	Header.Active = true

	Instance.new("UICorner", Header)

	Dragui.Name = "Dragui"
	Dragui.Parent = GrannyHub
	Dragui.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Dragui.Position = UDim2.new(0.496744126, 0, 0.512048185, 0)
	Dragui.Size = UDim2.new(0, 64, 0, 51)
	Dragui.Font = Enum.Font.SourceSansBold
	Dragui.Text = "Open"
	Dragui.TextColor3 = Color3.fromRGB(255, 255, 255)
	Dragui.TextScaled = true
	Dragui.TextSize = 14.000
	Dragui.TextWrapped = true
	Dragui.Visible = false
	Dragui.MouseButton1Click:Connect(function()
		Header.Visible = true
		Dragui.Visible = false
	end)

	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Dragui

	local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/DragModule.lua"))()
	module:Drag(Header)
	module:Drag(Dragui)

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Header
	MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	MainFrame.Position = UDim2.new(-0.00078803557, 0, 0.983236432, 0)
	MainFrame.Size = UDim2.new(0, 349, 0, 141)

	Instance.new("UICorner", MainFrame)

	Title.Name = "Title"
	Title.Parent = Header
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.186246425, 0, -0.0294117648, 0)
	Title.Size = UDim2.new(0, 200, 0, 34)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = txt
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextWrapped = true

	Close.Name = "Close"
	Close.Parent = Header
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.903, 0, 0, 0)
	Close.Size = UDim2.new(0, 34, 0, 33)
	Close.Font = Enum.Font.SourceSansBold
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextScaled = true
	Close.TextSize = 14.000
	Close.TextWrapped = true
	Close.MouseButton1Click:Connect(function()
		GrannyHub:Destroy()
	end)

	Min.Name = "Min"
	Min.Parent = Header
	Min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Min.BackgroundTransparency = 1.000
	Min.BorderSizePixel = 0
	Min.Position = UDim2.new(0.805, 0, -0.029, 0)
	Min.Size = UDim2.new(0, 34, 0, 33)
	Min.Font = Enum.Font.SourceSansBold
	Min.Text = "-"
	Min.TextColor3 = Color3.fromRGB(255, 255, 255)
	Min.TextScaled = true
	Min.TextSize = 14.000
	Min.TextWrapped = true
	Min.MouseButton1Down:Connect(function()
		Header.Visible = false
		Dragui.Visible = true
	end)

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Container.Position = UDim2.new(0.208381012, 0, -0.00257862709, 0)
	Container.Size = UDim2.new(0, 276, 0, 141)

	Instance.new("UICorner", Container)

	TabList.Name = "TabList"
	TabList.Parent = TabFrame
	TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabList.SortOrder = Enum.SortOrder.LayoutOrder
	TabList.Padding = UDim.new(0, 5)
	TabList.Changed:Connect(function()
		TabFrame.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y + 10)
	end)

	TabFrame.Name = "TabFrame"
	TabFrame.Parent = MainFrame
	TabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	TabFrame.Position = UDim2.new(0.021, 0, 0.05, 0)
	TabFrame.Size = UDim2.new(0, 65, 0, 128)
	TabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabFrame.ScrollBarThickness = 5
	TabFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	TabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	TabFrame.BorderSizePixel = 0

	Instance.new("UICorner", TabFrame)

	local Page = {}

	function Page:Page(txt)
		local TabButton = Instance.new("TextButton")
		local Page = Instance.new("ScrollingFrame")
		local PageList = Instance.new("UIListLayout")

		Page.Name = txt
		Page.Parent = Container
		Page.Active = true
		Page.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.022, 0, 0.05, 0)
		Page.Size = UDim2.new(0, 264, 0, 128)
		Page.CanvasSize = UDim2.new(0, 0, 0, 0)
		Page.ScrollBarThickness = 5
		Page.ScrollingDirection = Enum.ScrollingDirection.Y
		Page.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
		Page.BorderSizePixel = 0

		PageList.Name = "PageList"
		PageList.Parent = Page
		PageList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		PageList.SortOrder = Enum.SortOrder.LayoutOrder
		PageList.Padding = UDim.new(0, 5)
		PageList.Changed:Connect(function()
			Page.CanvasSize = UDim2.new(0, 264, 0, PageList.AbsoluteContentSize.Y + 10)
		end)

		TabButton.Name = txt
		TabButton.Parent = TabFrame
		TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		TabButton.Position = UDim2.new(0.0958904102, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 58, 0, 26)
		TabButton.Font = Enum.Font.SourceSansBold
		TabButton.Text = txt
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextScaled = true
		TabButton.TextSize = 14.000
		TabButton.TextWrapped = true
		TabButton.TextTransparency = 0.3
		TabButton.MouseButton1Click:Connect(function()
			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Page.Visible = true
			for i,v in next, TabFrame:GetChildren() do
				if v:IsA("TextButton") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
				end
			end
			game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.2), {TextTransparency = 0.3}):Play()
		end)

		for i,v in next, Container:GetChildren() do
			if v:IsA("ScrollingFrame") then
				v.Visible = false
			end
		end
		Page.Visible = true
		for i,v in next, TabFrame:GetChildren() do
			if v:IsA("TextButton") then
				game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
			end
		end
		game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.2), {TextTransparency = 0.3}):Play()

		Instance.new("UICorner", TabButton)

		local Elements = {}

		function Elements:Button(txt, callback)
			local ButtonFunction = {}
			local ButtonElement = Instance.new("Frame")
			local Click = Instance.new("TextButton")
			local Title = Instance.new("TextLabel")
			callback = callback or function() end

			ButtonElement.Name = txt
			ButtonElement.Parent = Page
			ButtonElement.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ButtonElement.BorderSizePixel = 0
			ButtonElement.Position = UDim2.new(0.0430107526, 0, 0, 0)
			ButtonElement.Size = UDim2.new(0, 224, 0, 35)

			Instance.new("UICorner", ButtonElement)

			Title.Name = "Title"
			Title.Parent = ButtonElement
			Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Title.BorderSizePixel = 0
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0430107526, 0, 0, 0)
			Title.Size = UDim2.new(0, 100, 0, 35)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Click.Name = "Click"
			Click.Parent = ButtonElement
			Click.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Click.BackgroundTransparency = 1.000
			Click.Position = UDim2.new(-0.0227272734, 0, 0, 0)
			Click.Size = UDim2.new(0, 224, 0, 26)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextColor3 = Color3.fromRGB(255, 255, 255)
			Click.TextScaled = true
			Click.TextSize = 14.000
			Click.TextWrapped = true
			Click.MouseButton1Click:Connect(function()
				pcall(callback)
			end)

			ButtonElement.MouseMoved:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)
			ButtonElement.MouseLeave:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)

			Instance.new("UICorner", ButtonElement)

			function ButtonFunction:Active()
				pcall(callback)
			end
			function ButtonFunction:Keybind(bind)
				game:GetService("UserInputService").InputBegan:Connect(function(current, ok) 
					if not ok then 
						if current.KeyCode == bind then
							pcall(callback)
						end
					end
				end)
			end
		end

		function Elements:Label(txt)	
			local LabelFunction = {}
			local TextButton = Instance.new("TextLabel")
			TextButton.Name = txt
			TextButton.Parent = Page
			TextButton.BackgroundTransparency = 1
			TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextButton.Position = UDim2.new(-0.0227272734, 0, 0, 0)
			TextButton.Size = UDim2.new(0, 224, 0, 26)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.Text = txt
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextScaled = true
			TextButton.TextSize = 14.000
			TextButton.TextWrapped = true
			TextButton.TextXAlignment = Enum.TextXAlignment.Left

			TextButton.MouseMoved:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)
			TextButton.MouseLeave:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)

			function LabelFunction:UpdateText(txt)
				TextButton.Text = txt
			end
			return LabelFunction
		end
		function Elements:Toggle(txt, callback)
			local ToggleFunction = {}

			local callback = callback or function() end

			local ToggleElement = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Background = Instance.new("TextButton")
			local Toggle = Instance.new("TextButton")
			local Click = Instance.new("TextButton")

			ToggleElement.Name = txt
			ToggleElement.Parent = Page
			ToggleElement.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ToggleElement.BorderSizePixel = 0
			ToggleElement.Size = UDim2.new(0, 224, 0, 35)

			Click.Name = "Click"
			Click.Parent = ToggleElement
			Click.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(0, 224, 0, 35)
			Click.BackgroundTransparency = 1
			Click.Text = ""

			Instance.new("UICorner", ToggleElement)

			Title.Name = "Title"
			Title.Parent = ToggleElement
			Title.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
			Title.BorderSizePixel = 0
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0430107526, 0, 0, 0)
			Title.Size = UDim2.new(0, 100, 0, 35)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt or "Label"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Background.Name = "Background"
			Background.Parent = ToggleElement
			Background.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
			Background.BorderSizePixel = 0
			Background.Position = UDim2.new(0, 170, 0, 10)
			Background.Size = UDim2.new(0, 50, 0, 20)
			Background.Font = Enum.Font.SourceSans
			Background.Text = ""
			Background.TextColor3 = Color3.fromRGB(255, 255, 255)
			Background.TextScaled = true
			Background.TextSize = 14.000
			Background.TextWrapped = true

			Instance.new("UICorner", Background).CornerRadius = UDim.new(1, 0)

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleElement
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0, 200, 0, 10)
			Toggle.Size = UDim2.new(0, 20, 0, 20)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextScaled = true
			Toggle.TextSize = 14.000
			Toggle.TextWrapped = true

			Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
			local toggled = false
			Title.MouseMoved:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)
			Title.MouseLeave:Connect(function()
				TS:Create(Title, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(250, 0, 0)}):Play()
			end)
			Click.MouseButton1Down:Connect(function()
				if toggled == false then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(47, 203, 85)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 170, 0, 10)}):Play()
				elseif toggled == true then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 200, 0, 10)}):Play()
				end
				toggled = not toggled
				pcall(callback, toggled)
			end)
			function ToggleFunction:UpdateText(txt)
				Title.Text = txt
			end
			function ToggleFunction:ChangeState(state)
				if state == true then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(47, 203, 85)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 170, 0, 10)}):Play()
				elseif state == false then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 200, 0, 10)}):Play()
				end
				toggled = not toggled
				pcall(callback, toggled)
			end
			function ToggleFunction:Keybind(Bind)
				game:GetService("UserInputService").InputBegan:Connect(function(current, ok) 
					if not ok then 
						if current.KeyCode == Bind then
							if toggled == false then
								TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(47, 203, 85)}):Play()
								TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 170, 0, 10)}):Play()
							elseif toggled == true then
								TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
								TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 200, 0, 10)}):Play()
							end
							toggled = not toggled
							pcall(callback, toggled)
						end
					end
				end)
			end
			function Elements:Box(txt, hint, callback)
				local BoxFunction = {}
				local BoxElement = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local Box = Instance.new("TextBox")
				callback = callback or function() end

				BoxElement.Name = txt
				BoxElement.Parent = Page
				BoxElement.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				BoxElement.BorderSizePixel = 0
				BoxElement.Position = UDim2.new(0.0909090936, 0, 0, 0)
				BoxElement.Size = UDim2.new(0, 224, 0, 26)

				UICorner.Parent = BoxElement

				Title.Name = "Title"
				Title.Parent = BoxElement
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0.0430107117, 0, 0, 0)
				Title.Size = UDim2.new(0, 100, 0, 26)
				Title.Font = Enum.Font.SourceSans
				Title.Text = txt
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextScaled = true
				Title.TextSize = 14.000
				Title.TextWrapped = true
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Box.Name = "Box"
				Box.Parent = BoxElement
				Box.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
				Box.Position = UDim2.new(0.651785731, 0, 0, 0)
				Box.Size = UDim2.new(0, 80, 0, 26)
				Box.Font = Enum.Font.SourceSans
				Box.Text = ""
				Box.PlaceholderText = hint
				Box.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
				Box.TextColor3 = Color3.fromRGB(0, 0, 0)
				Box.TextSize = 14.000
				Box.FocusLost:Connect(function(enterPressed)
					if not enterPressed then
						return
					else
						callback(Box.Text)
						wait(0.18)
						Box.Text = txt
						Box.PlaceholderText = txt
					end
				end)

				Instance.new("UICorner", Box)

				function BoxFunction:ChangeText(txt)
					Box.Text = txt
				end
				function BoxFunction:ChangeTitle(txt)
					Title.Text = txt
				end
				return BoxFunction
			end
			return ToggleFunction
		end
		return Elements
	end
	return Page
end
return Library
