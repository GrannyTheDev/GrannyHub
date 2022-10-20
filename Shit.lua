if gethui then
	for i,v in pairs(gethui():GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "DarkLib" or v.Name == "Gui" or v.Name == "ScreenGui" or v.Name == "GamesGui" then
			v:Destroy()
		end
	end
elseif syn and syn.protect_gui then
	syn.protect_gui(DarkLib);
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "DarkLib" or v.Name == "Gui" or v.Name == "ScreenGui" or v.Name == "GamesGui" then
			v:Destroy()
		end
	end
else
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == "DarkLib" or v.Name == "Gui" or v.Name == "ScreenGui" or v.Name == "GamesGui" then
			v:Destroy()
		end
	end
end

repeat wait() until game and game:IsLoaded()
local Library = {}

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

function Library:CreateWindow(title)
	local DarkLib = Instance.new("ScreenGui")
	local Header = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabListen = Instance.new("UIListLayout")
	local CloseButton = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Pages = Instance.new("Folder")

	DarkLib.Name = "DarkLib"
	DarkLib.ResetOnSpawn = false

	if gethui then
		DarkLib.Parent = gethui();
	elseif syn and syn.protect_gui then
		syn.protect_gui(DarkLib);
		DarkLib.Parent = cloneref(game:GetService("CoreGui"))
	else
		DarkLib.Parent = cloneref(game:GetService("CoreGui"))
	end

	game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
		if not ok then 
			if current.KeyCode == Enum.KeyCode.RightAlt then 
				if DarkLib.Enabled == true then
					DarkLib.Enabled = false
				else
					DarkLib.Enabled = true
				end
			end
		end
	end)

	Header.Name = "Header"
	Header.Parent = DarkLib
	Header.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
	Header.BorderSizePixel = 0
	Header.Position = UDim2.new(0, 552, 0, 159)
	Header.Size = UDim2.new(0, 470, 0, 30)
	Header.Active = true
	Header.BackgroundTransparency = 1

	game:GetService("TweenService"):Create(Header, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
	
	local module = loadstring(game:HttpGet("https://grannythedev.github.io/GrannyHub/Modules/DragModule.lua"))()
	module:Drag(Header)

	Instance.new("UICorner", Header)

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Header
	MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0, 0, 0, 30)
	MainFrame.Size = UDim2.new(0, 470, 0, 280)
	MainFrame.BackgroundTransparency = 1

	game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()

	Instance.new("UICorner", MainFrame)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = MainFrame
	TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0, 10, 0, 10)
	TabHolder.Size = UDim2.new(0, 120, 0, 260)
	TabHolder.ScrollBarThickness = 5

	Instance.new("UICorner", TabHolder)

	TabListen.Name = "TabListen"
	TabListen.Parent = TabHolder
	TabListen.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabListen.SortOrder = Enum.SortOrder.LayoutOrder
	TabListen.Padding = UDim.new(0, 4)
	TabListen.Changed:Connect(function()
		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabListen.AbsoluteContentSize.Y)
	end)

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Header
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.94, 0, 0, 2)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.Text = utf8.char(10060)
	CloseButton.TextScaled = true
	CloseButton.TextWrapped = true
	CloseButton.MouseButton1Click:Connect(function()
		DarkLib:Destroy()
	end)

	Title.Name = "Title"
	Title.Parent = Header
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.016, 0,0, 0)
	Title.Size = UDim2.new(0, 255, 0, 32)
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 28.000
	Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextXAlignment = Enum.TextXAlignment.Left

	for i = 1,#title do
		game:GetService("CoreGui").DarkLib.Header.Title.Text = string.sub(title, 1, i)
		wait(0.05)
	end

	Pages.Name = "Pages"
	Pages.Parent = MainFrame

function Library:Edit(txt)
game.CoreGui.DarkLib.Header.Title.Text = txt
end

	local Page = {}

	function Page:Page(txt)
		local Container = Instance.new("ScrollingFrame")
		local PageButton = Instance.new("TextButton")
		local ListContainer = Instance.new("UIListLayout")

		PageButton.Name = txt
		PageButton.Parent = TabHolder
		PageButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		PageButton.BorderSizePixel = 0
		PageButton.Size = UDim2.new(0, 100, 0, 25)
		PageButton.Font = Enum.Font.SourceSansLight
		PageButton.Text = txt
		PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.TextSize = 22.000
		PageButton.MouseButton1Click:Connect(function()
			for i,v in next, Pages:GetChildren() do
				v.Visible = false
			end
			Container.Visible = true
			for i,v in next, TabHolder:GetChildren() do
				if v:IsA("TextButton") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}):Play()
				end
			end
			game:GetService("TweenService"):Create(PageButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 0, 255)}):Play()
		end)

		Instance.new("UICorner", PageButton)

		Container.Name = txt
		Container.Parent = Pages
		Container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Container.BorderSizePixel = 0
		Container.Position = UDim2.new(0, 140, 0, 10)
		Container.Size = UDim2.new(0, 320, 0, 260)
		Container.ScrollBarThickness = 5
		Container.ScrollBarImageColor3 = Color3.fromRGB(80, 0, 255)
		Container.Visible = false

		ListContainer.Parent = Container
		ListContainer.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListContainer.SortOrder = Enum.SortOrder.LayoutOrder
		ListContainer.Padding = UDim.new(0, 6)
		ListContainer.Changed:Connect(function()
			Container.CanvasSize = UDim2.new(0, 0, 0, ListContainer.AbsoluteContentSize.Y)
		end)

		for i,v in next, Pages:GetChildren() do
			v.Visible = false
		end
		Container.Visible = true
		for i,v in next, TabHolder:GetChildren() do
			if v:IsA("TextButton") then
				game:GetService("TweenService"):Create(v, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}):Play()
			end
		end
		game:GetService("TweenService"):Create(PageButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 0, 255)}):Play()

		local Elements = {}

		function Elements:Button(txt, callback)
			local ButtonFunction = {}
			local callback = callback or function() end

			local ButtonFrame = Instance.new("Frame")
			local Click = Instance.new("TextButton")
			local Touch = Instance.new("ImageLabel")

			ButtonFrame.Name = txt
			ButtonFrame.Parent = Container
			ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonFrame.BackgroundTransparency = 1.000
			ButtonFrame.BorderSizePixel = 0
			ButtonFrame.Size = UDim2.new(0, 300, 0, 35)

			Click.Name = "Click"
			Click.Parent = ButtonFrame
			Click.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(0, 300, 0, 35)
			Click.Font = Enum.Font.SourceSans
			Click.TextColor3 = Color3.fromRGB(255, 255, 255)
			Click.TextSize = 18.000
			Click.Text = txt or "Button"

			Touch.Name = "Touch"
			Touch.Parent = Click
			Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Touch.BackgroundTransparency = 1.000
			Touch.BorderSizePixel = 0
			Touch.Position = UDim2.new(0.899999976, 0, 0, 2)
			Touch.Size = UDim2.new(0, 40, 0, 32)
			Touch.Image = "rbxassetid://1013090763"

			Instance.new("UICorner", Click)

			Click.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
			function ButtonFunction:UpdateText(txt)
				Click.Text = txt or "NewText"
			end
			function ButtonFunction:Keybind(Bind)
				UIS.InputBegan:Connect(function(key, gameProcessedEvent)
					if key.KeyCode == Bind then
						pcall(callback)
					end
				end)
			end
			function ButtonFunction:Active()
				pcall(callback)
			end
			return ButtonFunction
		end
		function Elements:Slider(txt, min, max, callback)
			local SliderFunction = {}
			local SliderElement = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Val = Instance.new("TextLabel")
			local SliderBack = Instance.new("TextButton")
			local Slider = Instance.new("TextButton")
			local Click = Instance.new("TextButton")
			
			local callback = callback or function() end

			SliderElement.Name = txt
			SliderElement.Parent = Container
			SliderElement.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
			SliderElement.BorderSizePixel = 0
			SliderElement.Size = UDim2.new(0, 300, 0, 35)
			
			Instance.new("UICorner", SliderElement)
			
			Title.Name = "Title"
			Title.Parent = SliderElement
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.0633333325, 0, 0.257142872, 0)
			Title.Size = UDim2.new(0, 111, 0, 16)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left
			
			Click.Name = "Click"
			Click.Parent = SliderElement
			Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Click.BackgroundTransparency = 1.000
			Click.Size = UDim2.new(0, 300, 0, 35)
			Click.Font = Enum.Font.SourceSans
			Click.Text = ""
			Click.TextColor3 = Color3.fromRGB(0, 0, 0)
			Click.TextSize = 14.000

			Val.Name = "Val"
			Val.Parent = SliderElement
			Val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Val.BackgroundTransparency = 1.000
			Val.BorderSizePixel = 0
			Val.Position = UDim2.new(0.49666667, 0, 0.257142872, 0)
			Val.Size = UDim2.new(0, 31, 0, 16)
			Val.Font = Enum.Font.SourceSans
			Val.Text = "0"
			Val.TextColor3 = Color3.fromRGB(255, 255, 255)
			Val.TextSize = 18.000
			Val.TextWrapped = true

			SliderBack.Name = "SliderBack"
			SliderBack.Parent = SliderElement
			SliderBack.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
			SliderBack.Position = UDim2.new(0.633333325, 0, 0.371428579, 0)
			SliderBack.Size = UDim2.new(0, 90, 0, 12)
			SliderBack.Font = Enum.Font.SourceSans
			SliderBack.Text = ""
			SliderBack.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderBack.TextSize = 14.000

			Instance.new("UICorner", SliderBack)

			Slider.Name = "Slider"
			Slider.Parent = SliderElement
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BorderColor3 = Color3.fromRGB(255, 255, 255)
			Slider.Position = UDim2.new(0.633, 0,0.371, 0)
			Slider.Size = UDim2.new(0.027, 0,0.343, 0)
			Slider.Font = Enum.Font.SourceSans
			Slider.Text = ""
			Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider.TextSize = 14.000
			local mouse = game:GetService("Players").LocalPlayer:GetMouse()
			local Value
			Click.MouseButton1Down:Connect(function()
				game.TweenService:Create(Val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 0
				}):Play()
				Value = math.floor((((tonumber(max) - tonumber(min)) / 90) * Slider.AbsoluteSize.X) + tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				Slider:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, 90), 0, 11), "InOut", "Linear", 0.05, true)
				moveconnection = mouse.Move:Connect(function()
					Val.Text = Value
					Value = math.floor((((tonumber(max) - tonumber(min)) / 90) * Slider.AbsoluteSize.X) + tonumber(min))
					pcall(function()
						callback(Value)
					end)
					Slider:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, 90), 0, 11), "InOut", "Linear", 0.05, true)
				end)
				releaseconnection = UIS.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 90) * Slider.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						Val.Text = Value
						game.TweenService:Create(Val, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							TextTransparency = 1
						}):Play()
						Slider:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, 90), 0, 11), "InOut", "Linear", 0.05, true)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)	
			Instance.new("UICorner", Slider)

			function SliderFunction:ChangeText(txt)
				Title.Text = txt
			end

			return SliderFunction
		end
		function Elements:Box(txt, hint, callback)
			local boxFunction = {}
			local Box = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Input = Instance.new("TextBox")

			local callback = callback or function() end

			Box.Name = "Box"
			Box.Parent = Container
			Box.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
			Box.BorderSizePixel = 0
			Box.Size = UDim2.new(0, 300, 0, 35)

			Instance.new("UICorner", Box)

			Title.Name = "Title"
			Title.Parent = Box
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0, -5, 0, 0)
			Title.Size = UDim2.new(0, 128, 0, 33)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt or "box"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextWrapped = true

			Input.Name = "Input"
			Input.Parent = Box
			Input.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			Input.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(0, 150, 0, 8)
			Input.Size = UDim2.new(0, 124, 0, 21)
			Input.Font = Enum.Font.SourceSansSemibold
			Input.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			Input.PlaceholderText = hint or "hint"
			Input.Text = txt
			Input.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input.TextSize = 18.000
			Input.TextWrapped = true

			Instance.new("UICorner", Input)

			Input.FocusLost:Connect(function(EnterPressed)
				if not EnterPressed then 
					return
				else
					callback(Input.Text)
					wait(0.18)
					Input.PlaceholderText = hint
				end
			end)
			function boxFunction:ChangeText(txt)
				Input.Text = txt
			end
			return boxFunction
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
			ToggleElement.Parent = Container
			ToggleElement.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
			ToggleElement.BorderSizePixel = 0
			ToggleElement.Size = UDim2.new(0, 300, 0, 35)
			
			Click.Name = "Click"
			Click.Parent = ToggleElement
			Click.BackgroundColor3 = Color3.fromRGB(80, 0, 255)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(0, 300, 0, 35)
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
			Background.Position = UDim2.new(0, 230, 0, 10)
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
			Toggle.Position = UDim2.new(0, 260, 0, 10)
			Toggle.Size = UDim2.new(0, 20, 0, 20)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextScaled = true
			Toggle.TextSize = 14.000
			Toggle.TextWrapped = true

			Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

			local toggled = false
			Click.MouseButton1Down:Connect(function()
				if toggled == false then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(47, 203, 85)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 231, 0, 10)}):Play()
				elseif toggled == true then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 260, 0, 10)}):Play()
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
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 231, 0, 10)}):Play()
				elseif state == false then
					TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 260, 0, 10)}):Play()
				end
				toggled = not toggled
				pcall(callback, toggled)
			end
			function ToggleFunction:Keybind(Bind)
				UIS.InputBegan:Connect(function(key, gameProcessedEvent)
					if key.KeyCode == Bind then
						if toggled == false then
							TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(47, 203, 85)}):Play()
					        TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 231, 0, 10)}):Play()
				        elseif toggled == true then
					        TS:Create(Background, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(210, 210, 210)}):Play()
					        TS:Create(Toggle, TweenInfo.new(0.25), {Position = UDim2.new(0, 260, 0, 10)}):Play()
						end
						toggled = not toggled
						pcall(callback, toggled)
					end
				end)
			end
			return ToggleFunction
		end
		function Elements:Label(txt)
			local LabelFunction = {}
			local Button = Instance.new("Frame")
			local TextButton = Instance.new("TextLabel")

			Button.Name = txt
			Button.Parent = Container
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 300, 0, 35)

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(80, 0, 2557)
			TextButton.BorderSizePixel = 0
			TextButton.BackgroundTransparency = 1.000
			TextButton.Size = UDim2.new(0, 300, 0, 35)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 18.000
			TextButton.Text = txt or "Text"

			Instance.new("UICorner", TextButton)

			function LabelFunction:UpdateText(txt)
				TextButton.Text = txt or "NewText"
			end
			return LabelFunction
           end
		return Elements
	end
	return Page
end

return Library