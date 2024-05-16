local tweenservice = game:GetService("TweenService")
local userinputservice = game:GetService("UserInputService")
local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil
	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
		UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
		object.Position = pos
	end
	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position
				
				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)
	topbarobject.InputChanged:Connect(
		function(input)
			if
			input.UserInputType == Enum.UserInputType.MouseMovement or
			input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)
	userinputservice.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end
local Library = {
	Lib = function(keytoggle)
		local DolceLib = Instance.new("ScreenGui")
		local Back = Instance.new("Frame")
		local Left = Instance.new("Frame")
		local Logo = Instance.new("ImageLabel")
		local LeftBack = Instance.new("Frame")
		local ScrollingList = Instance.new("ScrollingFrame")
		local ScrollLaOut = Instance.new("UIListLayout")
		local UICorner = Instance.new("UICorner")
		local UICorner_2 = Instance.new("UICorner")
		local Line = Instance.new("Frame")
		local Line2 = Instance.new("Frame")
		local Right = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local ToggleLeft = Instance.new("TextButton")
		local UICorner_4 = Instance.new("UICorner")
		
		MakeDraggable(Right,Back)
		
		local ToggleDelay = false
		userinputservice.InputBegan:Connect(function(key,chat)
			if not chat and key.KeyCode == keytoggle and ToggleDelay == false then
				ToggleDelay = true
				if Back.Visible == true then
					tweenservice:Create(Back,TweenInfo.new(0.3),{Size=UDim2.new(0,0,0,0)}):Play()
					delay(0.3,function()
						Back.Visible = false
					end)
				else
					Back.Visible = true
					tweenservice:Create(Back,TweenInfo.new(0.3),{Size=UDim2.new(0,700,0,400)}):Play()
				end
				wait(0.5)
				ToggleDelay = false
			end
		end)

		local NotifiFrame = Instance.new("Frame")
		local NotifiList = Instance.new("UIListLayout")
		
		NotifiFrame.Name = "NotifiFrame"
		NotifiFrame.Parent = DolceLib
		NotifiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifiFrame.BackgroundTransparency = 1.000
		NotifiFrame.Position = UDim2.new(0.0123239439, 0, 0, 0)
		NotifiFrame.Size = UDim2.new(0, 200, 0, 550)
		NotifiFrame.ZIndex = 10
		
		NotifiList.Name = "NotifiList"
		NotifiList.Parent = NotifiFrame
		NotifiList.SortOrder = Enum.SortOrder.LayoutOrder
		NotifiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
		NotifiList.Padding = UDim.new(0, 5)
		
		DolceLib.Name = "DolceLib"
		DolceLib.Parent = game:GetService("CoreGui")
		DolceLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
		Back.Name = "Back"
		Back.Parent = DolceLib
		Back.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		Back.BackgroundTransparency = 1.000
		Back.ClipsDescendants = true
		Back.Position = UDim2.new(0.191901416, 0, 0.185243323, 0)
		Back.Size = UDim2.new(0, 700, 0, 400)

		Left.Name = "Left"
		Left.Parent = Back
		Left.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
		Left.BorderSizePixel = 0
		Left.ClipsDescendants = true
		Left.Size = UDim2.new(0, 150, 0, 400)

		Logo.Name = "Logo"
		Logo.Parent = Left
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.BorderSizePixel = 0
		Logo.Position = UDim2.new(0.166666672, 0, 0.0450000018, 0)
		Logo.Size = UDim2.new(0, 100, 0, 100)
		Logo.Image = "rbxassetid://13006865676"

		LeftBack.Name = "LeftBack"
		LeftBack.Parent = Left
		LeftBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftBack.BackgroundTransparency = 1.000
		LeftBack.Position = UDim2.new(0, 0, 0.294999987, 0)
		LeftBack.Size = UDim2.new(0, 150, 0, 282)

		ScrollingList.Name = "ScrollingList"
		ScrollingList.Parent = LeftBack
		ScrollingList.Active = true
		ScrollingList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingList.BackgroundTransparency = 1.000
		ScrollingList.BorderSizePixel = 0
		ScrollingList.Position = UDim2.new(0.0466666669, 0, 0.113475174, 0)
		ScrollingList.Size = UDim2.new(0, 143, 0, 250)
		ScrollingList.ScrollBarThickness = 2

		ScrollLaOut.Name = "ScrollLaOut"
		ScrollLaOut.Parent = ScrollingList
		ScrollLaOut.SortOrder = Enum.SortOrder.LayoutOrder
		ScrollLaOut.Padding = UDim.new(0, 15)

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Left

		UICorner_2.CornerRadius = UDim.new(0, 3)
		UICorner_2.Parent = Back

		Line.Name = "Line"
		Line.Parent = Back
		Line.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		Line.BorderSizePixel = 0
		Line.ClipsDescendants = true
		Line.Position = UDim2.new(0.214285716, 0, 0, 0)
		Line.Size = UDim2.new(0, 3, 0, 400)

		Line2.Name = "Line2"
		Line2.Parent = Back
		Line2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		Line2.BorderSizePixel = 0
		Line2.ClipsDescendants = true
		Line2.Position = UDim2.new(0.218571424, 0, 0.132499993, 0)
		Line2.Size = UDim2.new(0, 547, 0, 3)
		Line2.ZIndex = 2

		Right.Name = "Right"
		Right.Parent = Back
		Right.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		Right.BorderSizePixel = 0
		Right.Position = UDim2.new(0.218571424, 0, 0, 0)
		Right.Size = UDim2.new(0, 547, 0, 400)

		UICorner_3.CornerRadius = UDim.new(0, 3)
		UICorner_3.Parent = Right

		ToggleLeft.Name = "ToggleLeft"
		ToggleLeft.Parent = Back
		ToggleLeft.BackgroundColor3 = Color3.fromRGB(195, 0, 0)
		ToggleLeft.BorderSizePixel = 0
		ToggleLeft.Position = UDim2.new(0.257142872, 0, 0.0250000004, 0)
		ToggleLeft.Size = UDim2.new(0, 107, 0, 31)
		ToggleLeft.Font = Enum.Font.SourceSansBold
		ToggleLeft.Text = "- Menu"
		ToggleLeft.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleLeft.TextSize = 22.000
		ToggleLeft.TextWrapped = true

		UICorner_4.CornerRadius = UDim.new(0, 3)
		UICorner_4.Parent = ToggleLeft

		local BackStroke = Instance.new("UIStroke",Back)
		BackStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		BackStroke.Color = Color3.fromRGB(195, 0, 0)
		BackStroke.Thickness = 3

		ScrollingList.CanvasSize = UDim2.new(0, 0, 0,ScrollLaOut.AbsoluteContentSize.Y)
		ScrollLaOut:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingList.CanvasSize = UDim2.new(0, 0, 0,ScrollLaOut.AbsoluteContentSize.Y)
		end)

		local ToggTwenling, ToggleTwDb = false, false

		ToggleLeft.MouseButton1Click:Connect(function()
			if ToggTwenling == false then
				ToggTwenling = true
				if ToggleTwDb == false then
					ToggleTwDb = true
					BackStroke.Thickness = 0
					ToggleLeft.Text = "+ Menu"
					tweenservice:Create(Line,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
					tweenservice:Create(Left,TweenInfo.new(0.3),{Size=UDim2.new(0,0,0,400),Position=UDim2.new(0.214,0,0,0)}):Play()
				else
					ToggleTwDb = false
					ToggleLeft.Text = "- Menu"
					tweenservice:Create(Line,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play()
					tweenservice:Create(Left,TweenInfo.new(0.3),{Size=UDim2.new(0,150,0,400),Position=UDim2.new(0,0,0,0)}):Play()
					delay(0.3,function()
						BackStroke.Thickness = 3
					end)
				end
				wait(0.5)
				ToggTwenling = false
			end
		end)

		local FirstPAGE = false
		local ListOfPage = {}
		local ListOfButton = {}

		return{
			Group = function(GrupNem)
				local GroupTemp = Instance.new("Frame")
				local GrupName = Instance.new("TextLabel")
				local GroupLayOut = Instance.new("UIListLayout")

				GroupTemp.Name = "GroupTemp"
				GroupTemp.Parent = ScrollingList
				GroupTemp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GroupTemp.BackgroundTransparency = 1.000
				GroupTemp.ClipsDescendants = true
				GroupTemp.Size = UDim2.new(0, 143, 0, 66)

				GrupName.Name = "GrupName"
				GrupName.Parent = GroupTemp
				GrupName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GrupName.BackgroundTransparency = 1.000
				GrupName.BorderSizePixel = 0
				GrupName.Size = UDim2.new(0, 143, 0, 10)
				GrupName.Font = Enum.Font.SourceSansBold
				GrupName.Text = GrupNem or "Group"
				GrupName.TextColor3 = Color3.fromRGB(255, 255, 255)
				GrupName.TextSize = 14.000
				GrupName.TextTransparency = 0.600
				GrupName.TextXAlignment = Enum.TextXAlignment.Left

				GroupLayOut.Name = "GroupLayOut"
				GroupLayOut.Parent = GroupTemp
				GroupLayOut.SortOrder = Enum.SortOrder.LayoutOrder
				GroupLayOut.Padding = UDim.new(0, 3)

				GroupTemp.Size = UDim2.new(0, 143, 0,GroupLayOut.AbsoluteContentSize.Y)
				GroupLayOut:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					GroupTemp.Size = UDim2.new(0, 143, 0,GroupLayOut.AbsoluteContentSize.Y)
				end)

				return {
					Page = function(PageNAME, ImgId)
						local IsFirstPage = false
						if FirstPAGE == false then FirstPAGE = true; IsFirstPage = true end

						local SampleTab = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local TabName = Instance.new("TextLabel")
						local TabLine = Instance.new("Frame")
						local SelectionParrent = Instance.new("ScrollingFrame")
						local UIListLayout = Instance.new("UIListLayout")
						local Search = Instance.new("ImageButton")
						local SearchBox = Instance.new("TextBox")
						local UICorner_2 = Instance.new("UICorner")

						SampleTab.Name = "SampleTab"
						SampleTab.Parent = Right
						SampleTab.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
						SampleTab.BorderColor3 = Color3.fromRGB(27, 42, 53)
						SampleTab.BorderSizePixel = 0
						SampleTab.Position = UDim2.new(0.0219378434, 0, 0.175290704, 0)
						SampleTab.Size = UDim2.new(0, 519, 0, 315)
						SampleTab.Visible = IsFirstPage
						table.insert(ListOfPage, SampleTab)

						local pageStroke = Instance.new("UIStroke",SampleTab)
						pageStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						pageStroke.Color = Color3.fromRGB(195, 0, 0)
						pageStroke.Thickness = 1

						UICorner.CornerRadius = UDim.new(0, 6)
						UICorner.Parent = SampleTab

						TabName.Name = "TabName"
						TabName.Parent = SampleTab
						TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TabName.BackgroundTransparency = 1.000
						TabName.BorderSizePixel = 0
						TabName.Position = UDim2.new(0.0289017335, 0, 0, 0)
						TabName.Size = UDim2.new(0, 491, 0, 27)
						TabName.Font = Enum.Font.SourceSansBold
						TabName.Text = PageNAME or "Page"
						TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
						TabName.TextSize = 20.000
						TabName.TextTransparency = 0.200
						TabName.TextXAlignment = Enum.TextXAlignment.Left
						TabName.TextYAlignment = Enum.TextYAlignment.Bottom

						TabLine.Name = "TabLine"
						TabLine.Parent = SampleTab
						TabLine.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
						TabLine.BorderSizePixel = 0
						TabLine.ClipsDescendants = true
						TabLine.Position = UDim2.new(0.0289017335, 0, 0.0857142881, 0)
						TabLine.Size = UDim2.new(0, 491, 0, 2)
						TabLine.ZIndex = 2

						SelectionParrent.Name = "SelectionParrent"
						SelectionParrent.Parent = SampleTab
						SelectionParrent.Active = true
						SelectionParrent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SelectionParrent.BackgroundTransparency = 1.000
						SelectionParrent.BorderColor3 = Color3.fromRGB(27, 42, 53)
						SelectionParrent.BorderSizePixel = 0
						SelectionParrent.Position = UDim2.new(0.0289017335, 0, 0.152011842, 0)
						SelectionParrent.Size = UDim2.new(0, 491, 0, 258)
						SelectionParrent.ScrollBarThickness = 2

						UIListLayout.Parent = SelectionParrent
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.Padding = UDim.new(0, 3)

						Search.Name = "Search"
						Search.Parent = SampleTab
						Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Search.BackgroundTransparency = 1.000
						Search.BorderSizePixel = 0
						Search.Position = UDim2.new(0.916924357, 0, -0.190845311, 0)
						Search.Size = UDim2.new(0, 30, 0, 30)
						Search.Image = "rbxassetid://6031154871"

						SearchBox.Name = "SearchBox"
						SearchBox.Parent = SampleTab
						SearchBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
						SearchBox.BorderSizePixel = 0
						SearchBox.Position = UDim2.new(0.626204252, 0, -0.190845311, 0)
						SearchBox.Size = UDim2.new(0, 150, 0, 30)
						SearchBox.Font = Enum.Font.SourceSansBold
						SearchBox.PlaceholderText = "You can search any thing here!"
						SearchBox.Text = ""
						SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
						SearchBox.TextScaled = false
						SearchBox.TextSize = 14.000
						SearchBox.TextWrapped = true

						UICorner_2.CornerRadius = UDim.new(0, 30)
						UICorner_2.Parent = SearchBox

						local PageButtonTemp = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local PageImg = Instance.new("ImageLabel")
						local OpenPage = Instance.new("TextButton")

						PageButtonTemp.Name = "PageButtonTemp"
						PageButtonTemp.Parent = GroupTemp
						PageButtonTemp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						PageButtonTemp.BackgroundTransparency = 1
						PageButtonTemp.BorderSizePixel = 0
						PageButtonTemp.Position = UDim2.new(0, 0, 0.129999995, 0)
						PageButtonTemp.Size = UDim2.new(0, 134, 0, 25)

						UICorner.Parent = PageButtonTemp

						PageImg.Name = "PageImg"
						PageImg.Parent = PageButtonTemp
						PageImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						PageImg.BackgroundTransparency = 1.000
						PageImg.BorderSizePixel = 0
						PageImg.Position = UDim2.new(0.0447761193, 0, 0.0799999982, 0)
						PageImg.Size = UDim2.new(0, 20, 0, 20)
						PageImg.Image = ImgId or "rbxassetid://6022668883"
						PageImg.ImageColor3 = Color3.fromRGB(195, 0, 0)

						OpenPage.Name = "OpenPage"
						OpenPage.Parent = PageButtonTemp
						OpenPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						OpenPage.BackgroundTransparency = 1.000
						OpenPage.BorderSizePixel = 0
						OpenPage.Position = UDim2.new(0.25373134, 0, 0, 0)
						OpenPage.Size = UDim2.new(0, 100, 0, 25)
						OpenPage.Font = Enum.Font.SourceSansBold
						OpenPage.Text = PageNAME or "Page"
						OpenPage.TextColor3 = Color3.fromRGB(255, 255, 255)
						OpenPage.TextSize = 14.000
						OpenPage.TextTransparency = 0.100
						OpenPage.TextXAlignment = Enum.TextXAlignment.Left
						table.insert(ListOfButton, PageButtonTemp)

						SelectionParrent.CanvasSize = UDim2.new(0, 0, 0,UIListLayout.AbsoluteContentSize.Y)
						UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
							SelectionParrent.CanvasSize = UDim2.new(0, 0, 0,UIListLayout.AbsoluteContentSize.Y)
						end)

						local SearchingN = false

						Search.MouseButton1Click:Connect(function()
							if SearchingN == false then
								SearchingN = true
								tweenservice:Create(Search,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(195, 0, 0)}):Play()
								wait(0.5)
								SearchingN = false
							end
						end)
						spawn(function()
							while wait() do
								if SearchBox.Text == "" then
									for i,v in pairs(SelectionParrent:GetChildren()) do
										if v:IsA("Frame") then
											v.Visible = true
										end
									end
								else
									for i,v in pairs(SelectionParrent:GetChildren()) do
										if v:IsA("Frame") then
											if string.find(string.upper(SearchBox.Text),string.upper(v.Name))
												or string.find(string.upper(v.Name),string.upper(SearchBox.Text)) then
												v.Visible = true
											else
												v.Visible = false
											end
										end
									end
								end
							end
						end)
						if IsFirstPage then
							PageButtonTemp.BackgroundTransparency=0.9
						end
						OpenPage.MouseEnter:Connect(function()
							--tweenservice:Create(PageButtonTemp,TweenInfo.new(0.3),{BackgroundTransparency=0.9}):Play()
						end)
						OpenPage.MouseLeave:Connect(function()
							--tweenservice:Create(PageButtonTemp,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
						end)
						OpenPage.MouseButton1Click:Connect(function()
							for i,v in pairs(ListOfPage) do
								v.Visible = false
							end
							for i,v in pairs(ListOfButton) do
								tweenservice:Create(v,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
							end
							tweenservice:Create(PageButtonTemp,TweenInfo.new(0.3),{BackgroundTransparency=0.9}):Play()
							SampleTab.Visible = true
						end)

						return {
							Label = function(labelText)
								local LabelFrame = Instance.new("Frame")
								local labelWrite = Instance.new("TextLabel")

								LabelFrame.Name = "LabelFrame"
								LabelFrame.Parent = SelectionParrent
								LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								LabelFrame.BackgroundTransparency = 1.000
								LabelFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								LabelFrame.BorderSizePixel = 0
								LabelFrame.Size = UDim2.new(0, 490, 0, 30)

								labelWrite.Name = labelText or "labelWrite"
								labelWrite.Parent = LabelFrame
								labelWrite.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								labelWrite.BackgroundTransparency = 1.000
								labelWrite.BorderSizePixel = 0
								labelWrite.Position = UDim2.new(0, 0, 0, 0)
								labelWrite.Size = UDim2.new(0, 472, 0, 30)
								labelWrite.Font = Enum.Font.SourceSansBold
								labelWrite.Text = labelText or "This is Label!"
								labelWrite.TextColor3 = Color3.fromRGB(255, 255, 255)
								labelWrite.TextSize = 16.000
								labelWrite.TextTransparency = 0.500
								return {
									SetLabel = function(NewTextLb)
										labelWrite.Name = NewTextLb
										labelWrite.Text = NewTextLb
									end,
								}
							end,
							Button = function(buttonText,func)
								local ButtonFrame = Instance.new("Frame")
								local ClickBtn = Instance.new("TextButton")
								local ButtonUICorner = Instance.new("UICorner")

								ButtonFrame.Name = buttonText
								ButtonFrame.Parent = SelectionParrent
								ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ButtonFrame.BackgroundTransparency = 1.000
								ButtonFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								ButtonFrame.BorderSizePixel = 0
								ButtonFrame.Size = UDim2.new(0, 490, 0, 30)

								ClickBtn.Name = "ClickBtn"
								ClickBtn.Parent = ButtonFrame
								ClickBtn.BackgroundColor3 = Color3.fromRGB(116, 113, 130)
								ClickBtn.Position = UDim2.new(0, 0, 0.0666666701, 0)
								ClickBtn.Size = UDim2.new(0, 472, 0, 25)
								ClickBtn.Font = Enum.Font.SourceSansBold
								ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
								ClickBtn.TextSize = 16.000
								ClickBtn.TextTransparency = 0.400
								ClickBtn.TextWrapped = true
								ClickBtn.Text = buttonText
								ClickBtn.AutoButtonColor = true

								ButtonUICorner.CornerRadius = UDim.new(0, 3)
								ButtonUICorner.Name = "ButtonUICorner"
								ButtonUICorner.Parent = ClickBtn

								ClickBtn.MouseEnter:Connect(function()
									tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0)}):Play()
								end)
								ClickBtn.MouseLeave:Connect(function()
									tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130)}):Play()
								end)
								ClickBtn.MouseButton1Click:Connect(function()
									func()
								end)
							end,
							Toggle = function(TggleName,normal,islocked,toggleinfo,func)
								local ToggleFrame = Instance.new("Frame")
								local ToggleName = Instance.new("TextLabel")
								local Toggle = Instance.new("TextButton")
								local UICorner = Instance.new("UICorner")
								local Frame = Instance.new("Frame")
								local UICorner_2 = Instance.new("UICorner")
								local Locked = Instance.new("Frame")
								local UICorner_3 = Instance.new("UICorner")
								local Lockimg = Instance.new("ImageLabel")
								local Info = Instance.new("ImageButton")

								ToggleFrame.Name = TggleName
								ToggleFrame.Parent = SelectionParrent
								ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ToggleFrame.BackgroundTransparency = 1.000
								ToggleFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								ToggleFrame.BorderSizePixel = 0
								ToggleFrame.Size = UDim2.new(0, 490, 0, 30)

								ToggleName.Name = "ToggleName"
								ToggleName.Parent = ToggleFrame
								ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ToggleName.BackgroundTransparency = 1.000
								ToggleName.BorderSizePixel = 0
								ToggleName.Size = UDim2.new(0, 367, 0, 30)
								ToggleName.Font = Enum.Font.SourceSansBold
								ToggleName.Text = " "..TggleName
								ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
								ToggleName.TextSize = 16.000
								ToggleName.TextTransparency = 0.500
								ToggleName.TextXAlignment = Enum.TextXAlignment.Left

								Toggle.Name = "Toggle"
								Toggle.Parent = ToggleFrame
								Toggle.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
								Toggle.Position = UDim2.new(0.869387746, 0, 0.233333349, 0)
								Toggle.Size = UDim2.new(0, 47, 0, 15)
								Toggle.AutoButtonColor = false
								Toggle.Font = Enum.Font.SourceSans
								Toggle.Text = ""
								Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
								Toggle.TextSize = 14.000

								UICorner.CornerRadius = UDim.new(0, 60)
								UICorner.Parent = Toggle

								Frame.Parent = Toggle
								Frame.BackgroundColor3 = Color3.fromRGB(116, 113, 130)
								Frame.Position = UDim2.new(0, 0, -0.0670000017, 0)
								Frame.Size = UDim2.new(0, 17, 0, 17)
								Frame.ZIndex = 2

								UICorner_2.CornerRadius = UDim.new(0, 60)
								UICorner_2.Parent = Frame

								Locked.Name = "Locked"
								Locked.Parent = ToggleFrame
								Locked.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
								Locked.BackgroundTransparency = 0.300
								Locked.BorderColor3 = Color3.fromRGB(27, 42, 53)
								Locked.BorderSizePixel = 0
								Locked.Size = UDim2.new(0, 490, 0, 30)
								Locked.Visible = false
								Locked.ZIndex = 2

								UICorner_3.Parent = Locked

								Lockimg.Name = "Lockimg"
								Lockimg.Parent = Locked
								Lockimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Lockimg.BackgroundTransparency = 1.000
								Lockimg.BorderSizePixel = 0
								Lockimg.Position = UDim2.new(0.471428573, 0, -0.0333333351, 0)
								Lockimg.Size = UDim2.new(0, 30, 0, 30)
								Lockimg.Image = "rbxassetid://6031082533"
								Lockimg.ImageTransparency = 0.200

								Info.Name = "Info"
								Info.Parent = ToggleFrame
								Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Info.BackgroundTransparency = 1.000
								Info.BorderSizePixel = 0
								Info.Position = UDim2.new(0.963959217, 0, 0.199666664, 0)
								Info.Size = UDim2.new(0, 17, 0, 17)
								Info.Image = "rbxassetid://6031104648"
								Info.ImageTransparency = 0.200

								local ToggleInfo = Instance.new("TextLabel")
								ToggleInfo.Name = TggleName
								ToggleInfo.Parent = SelectionParrent
								ToggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ToggleInfo.BackgroundTransparency = 1.000
								ToggleInfo.BorderSizePixel = 0
								ToggleInfo.ClipsDescendants = true
								ToggleInfo.Position = UDim2.new(0, 0, 0.383720934, 0)
								ToggleInfo.Size = UDim2.new(0, 473, 0, 0)
								ToggleInfo.Font = Enum.Font.SourceSansBold
								ToggleInfo.Text = "      "..toggleinfo
								ToggleInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
								ToggleInfo.TextSize = 15.000
								ToggleInfo.TextTransparency = 0.600
								ToggleInfo.TextXAlignment = Enum.TextXAlignment.Left
								ToggleInfo.TextYAlignment = Enum.TextYAlignment.Top

								local Comeback = normal
								if Comeback == true then
									tweenservice:Create(Frame,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0),Position=UDim2.new(0.7, 0,-0.067, 0)}):Play()
									func(Comeback)
								end
								if islocked == true then
									Locked.Visible = true
								else
									local infotwen, infodb = false, false
									Info.MouseButton1Click:Connect(function()
										if infotwen == false then
											infotwen = true
											if infodb == false then
												infodb = true
												tweenservice:Create(ToggleInfo,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 15)}):Play()
												tweenservice:Create(Info,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(195, 0, 0)}):Play()
											else
												infodb = false
												tweenservice:Create(ToggleInfo,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 0)}):Play()
												tweenservice:Create(Info,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
											end
											wait(0.5)
											infotwen = false
										end
									end)
									Toggle.MouseButton1Click:Connect(function()
										if Comeback == false then
											Comeback = true
											tweenservice:Create(Frame,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0),Position=UDim2.new(0.7, 0,-0.067, 0)}):Play()
											func(Comeback)
										else
											Comeback = false
											tweenservice:Create(Frame,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130),Position=UDim2.new(0, 0,-0.067, 0)}):Play()
											func(Comeback)
										end
									end)
									return {
										SetToggle = function(NewTG)
											if NewTG == true then
												Comeback = true
												tweenservice:Create(Frame,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0),Position=UDim2.new(0.7, 0,-0.067, 0)}):Play()
												func(Comeback)
											else
												Comeback = false
												tweenservice:Create(Frame,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130),Position=UDim2.new(0, 0,-0.067, 0)}):Play()
												func(Comeback)
											end
										end,
									}
								end
							end,
							Textbox = function(textboxname,textboxholder,func)
								local TextboxFrame = Instance.new("Frame")
								local TextboxName = Instance.new("TextLabel")
								local TextBox = Instance.new("TextBox")
								local UICorner = Instance.new("UICorner")
								local UICorner_2 = Instance.new("UICorner")

								TextboxFrame.Name = textboxname
								TextboxFrame.Parent = SelectionParrent
								TextboxFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
								TextboxFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								TextboxFrame.BorderSizePixel = 0
								TextboxFrame.Position = UDim2.new(0, 0, 0.62412113, 0)
								TextboxFrame.Size = UDim2.new(0, 473, 0, 60)

								TextboxName.Name = "TextboxName"
								TextboxName.Parent = TextboxFrame
								TextboxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextboxName.BackgroundTransparency = 1.000
								TextboxName.BorderSizePixel = 0
								TextboxName.Size = UDim2.new(0, 182, 0, 30)
								TextboxName.Font = Enum.Font.SourceSansBold
								TextboxName.Text = " "..textboxname
								TextboxName.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextboxName.TextSize = 16.000
								TextboxName.TextTransparency = 0.500
								TextboxName.TextXAlignment = Enum.TextXAlignment.Left

								TextBox.Parent = TextboxFrame
								TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								TextBox.BorderSizePixel = 0
								TextBox.Position = UDim2.new(0.00990640558, 0, 0.5, 0)
								TextBox.Size = UDim2.new(0, 457, 0, 24)
								TextBox.Font = Enum.Font.SourceSansBold
								TextBox.PlaceholderText = textboxholder
								TextBox.Text = ""
								TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextBox.TextSize = 16.000
								TextBox.TextTransparency = 0.400
								TextBox.TextWrapped = true

								UICorner.CornerRadius = UDim.new(0, 3)
								UICorner.Parent = TextBox

								UICorner_2.CornerRadius = UDim.new(0, 3)
								UICorner_2.Parent = TextboxFrame

								TextBox.FocusLost:Connect(function()
									func(TextBox.Text)
								end)
							end,

							Keybind = function(keybindname,keybindgoc,func)

								local KeybindFrame = Instance.new("Frame")
								local KeybindName = Instance.new("TextLabel")
								local TextButton = Instance.new("TextButton")

								KeybindFrame.Name = keybindname
								KeybindFrame.Parent = SelectionParrent
								KeybindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								KeybindFrame.BackgroundTransparency = 1.000
								KeybindFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								KeybindFrame.BorderSizePixel = 0
								KeybindFrame.Size = UDim2.new(0, 490, 0, 30)

								KeybindName.Name = "KeybindName"
								KeybindName.Parent = KeybindFrame
								KeybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								KeybindName.BackgroundTransparency = 1.000
								KeybindName.BorderSizePixel = 0
								KeybindName.Size = UDim2.new(0, 187, 0, 30)
								KeybindName.Font = Enum.Font.SourceSansBold
								KeybindName.Text = " "..keybindname
								KeybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
								KeybindName.TextSize = 16.000
								KeybindName.TextTransparency = 0.500
								KeybindName.TextXAlignment = Enum.TextXAlignment.Left

								TextButton.Parent = KeybindFrame
								TextButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
								TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
								TextButton.BorderSizePixel = 0
								TextButton.Position = UDim2.new(0.814448893, 0, 0.175999954, 0)
								TextButton.Size = UDim2.new(0, 74, 0, 18)
								TextButton.Font = Enum.Font.SourceSansBold
								TextButton.Text = keybindgoc.Name
								TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
								TextButton.TextScaled = true
								TextButton.TextSize = 14.000
								TextButton.TextTransparency = 0.400
								TextButton.TextWrapped = true

								TextButton.MouseButton1Click:Connect(function()
									TextButton.Text = "..."
									local abc
									abc = userinputservice.InputBegan:Connect(function(key,chat)
										if not chat and key.UserInputType == Enum.UserInputType.Keyboard then
											TextButton.Text = key.KeyCode.Name
											func(key.KeyCode)
											abc:Disconnect()
										end
									end)
								end)
							end,

							Dropdown = function(dropdownName,dropdownDefault,dropdownList,func)
								local DropdownFrame = Instance.new("Frame")
								local DropName = Instance.new("TextLabel")
								local OpenDrop = Instance.new("ImageButton")

								DropdownFrame.Name = dropdownName
								DropdownFrame.Parent = SelectionParrent
								DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropdownFrame.BackgroundTransparency = 1.000
								DropdownFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								DropdownFrame.BorderSizePixel = 0
								DropdownFrame.Size = UDim2.new(0, 490, 0, 30)

								DropName.Name = "DropName"
								DropName.Parent = DropdownFrame
								DropName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropName.BackgroundTransparency = 1.000
								DropName.BorderSizePixel = 0
								DropName.Size = UDim2.new(0, 367, 0, 30)
								DropName.Font = Enum.Font.SourceSansBold
								DropName.Text = " "..dropdownName..": "..dropdownDefault
								DropName.TextColor3 = Color3.fromRGB(255, 255, 255)
								DropName.TextSize = 16.000
								DropName.TextTransparency = 0.500
								DropName.TextXAlignment = Enum.TextXAlignment.Left

								OpenDrop.Name = "OpenDrop"
								OpenDrop.Parent = DropdownFrame
								OpenDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								OpenDrop.BackgroundTransparency = 1.000
								OpenDrop.BorderSizePixel = 0
								OpenDrop.Position = UDim2.new(0.939469397, 0, 0.13333334, 0)
								OpenDrop.Size = UDim2.new(0, 17, 0, 18)
								OpenDrop.Image = "rbxassetid://6035047391"
								OpenDrop.ImageTransparency = 0.200

								local DropdownFrame2 = Instance.new("ScrollingFrame")
								local DropList = Instance.new("UIListLayout")

								DropdownFrame2.Name = dropdownName
								DropdownFrame2.Parent = SelectionParrent
								DropdownFrame2.Active = true
								DropdownFrame2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
								DropdownFrame2.BorderSizePixel = 0
								DropdownFrame2.Position = UDim2.new(0, 0, 0.600775182, 0)
								DropdownFrame2.Size = UDim2.new(0, 473, 0, 0)
								DropdownFrame2.ScrollBarThickness = 0

								DropList.Name = "DropList"
								DropList.Parent = DropdownFrame2
								DropList.SortOrder = Enum.SortOrder.LayoutOrder
								DropList.Padding = UDim.new(0, 1)

								local dropTw,dropDb = false, false

								DropdownFrame2.CanvasSize = UDim2.new(0, 0, 0,DropList.AbsoluteContentSize.Y)
								DropList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
									DropdownFrame2.CanvasSize = UDim2.new(0, 0, 0,DropList.AbsoluteContentSize.Y)
								end)

								OpenDrop.MouseButton1Click:Connect(function()
									if dropTw == false then
										dropTw = true
										if dropDb == false then
											dropDb = true
											DropdownFrame2.ScrollBarThickness = 2
											tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(195, 0, 0),Rotation=45}):Play()
											tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 100)}):Play()
										else
											dropDb = false
											DropdownFrame2.ScrollBarThickness = 0
											tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 0)}):Play()
											tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255),Rotation=0}):Play()
										end
										wait(0.5)
										dropTw = false
									end
								end)
								for i,v in pairs(dropdownList) do
									local ClickBtn = Instance.new("TextButton")
									local UICorner = Instance.new("UICorner")

									ClickBtn.Name = "ClickBtn"
									ClickBtn.Parent = DropdownFrame2
									ClickBtn.BackgroundColor3 = Color3.fromRGB(116, 113, 130)
									ClickBtn.Size = UDim2.new(0, 472, 0, 25)
									ClickBtn.Font = Enum.Font.SourceSansBold
									ClickBtn.Text = "      "..v
									ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
									ClickBtn.TextSize = 16.000
									ClickBtn.TextTransparency = 0.400
									ClickBtn.TextWrapped = true
									ClickBtn.TextXAlignment = Enum.TextXAlignment.Left

									UICorner.CornerRadius = UDim.new(0, 3)
									UICorner.Parent = ClickBtn

									ClickBtn.MouseEnter:Connect(function()
										tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0)}):Play()
									end)
									ClickBtn.MouseLeave:Connect(function()
										tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130)}):Play()
									end)
									ClickBtn.MouseButton1Click:Connect(function()
										if ClickBtn ~= nil then
											dropDb = false
											DropName.Text = " "..dropdownName..": "..v
											DropdownFrame2.ScrollBarThickness = 0
											tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 0)}):Play()
											tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255),Rotation=0}):Play()
											func(v)
										end
									end)
								end
								return {
									Refresh = function(NewList)
										for i,v in pairs(DropdownFrame2:GetChildren()) do
											if v.Name == "ClickBtn" then
												v:Destroy()
											end
										end
										for i,v in pairs(NewList) do
											local ClickBtn = Instance.new("TextButton")
											local UICorner = Instance.new("UICorner")

											ClickBtn.Name = "ClickBtn"
											ClickBtn.Parent = DropdownFrame2
											ClickBtn.BackgroundColor3 = Color3.fromRGB(116, 113, 130)
											ClickBtn.Size = UDim2.new(0, 472, 0, 25)
											ClickBtn.Font = Enum.Font.SourceSansBold
											ClickBtn.Text = "      "..v
											ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
											ClickBtn.TextSize = 16.000
											ClickBtn.TextTransparency = 0.400
											ClickBtn.TextWrapped = true
											ClickBtn.TextXAlignment = Enum.TextXAlignment.Left

											UICorner.CornerRadius = UDim.new(0, 3)
											UICorner.Parent = ClickBtn

											ClickBtn.MouseEnter:Connect(function()
												tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0)}):Play()
											end)
											ClickBtn.MouseLeave:Connect(function()
												tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130)}):Play()
											end)
											ClickBtn.MouseButton1Click:Connect(function()
												if ClickBtn ~= nil then
													dropDb = false
													DropName.Text = " "..dropdownName..": "..v
													DropdownFrame2.ScrollBarThickness = 0
													tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 0)}):Play()
													tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255),Rotation=0}):Play()
													func(v)
												end
											end)
										end
									end,
								}
							end,
							MultiDropdown = function(dropdownName,dropdownDefault,dropdownList,func)
								local DropdownFrame = Instance.new("Frame")
								local DropName = Instance.new("TextLabel")
								local OpenDrop = Instance.new("ImageButton")

								DropdownFrame.Name = dropdownName
								DropdownFrame.Parent = SelectionParrent
								DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropdownFrame.BackgroundTransparency = 1.000
								DropdownFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
								DropdownFrame.BorderSizePixel = 0
								DropdownFrame.Size = UDim2.new(0, 490, 0, 30)

								DropName.Name = "DropName"
								DropName.Parent = DropdownFrame
								DropName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropName.BackgroundTransparency = 1.000
								DropName.BorderSizePixel = 0
								DropName.Size = UDim2.new(0, 367, 0, 30)
								DropName.Font = Enum.Font.SourceSansBold
								DropName.Text = " "..dropdownName..": "..dropdownDefault
								DropName.TextColor3 = Color3.fromRGB(255, 255, 255)
								DropName.TextSize = 16.000
								DropName.TextTransparency = 0.500
								DropName.TextXAlignment = Enum.TextXAlignment.Left

								OpenDrop.Name = "OpenDrop"
								OpenDrop.Parent = DropdownFrame
								OpenDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								OpenDrop.BackgroundTransparency = 1.000
								OpenDrop.BorderSizePixel = 0
								OpenDrop.Position = UDim2.new(0.939469397, 0, 0.13333334, 0)
								OpenDrop.Size = UDim2.new(0, 17, 0, 18)
								OpenDrop.Image = "rbxassetid://6035047391"
								OpenDrop.ImageTransparency = 0.200

								local DropdownFrame2 = Instance.new("ScrollingFrame")
								local DropList = Instance.new("UIListLayout")

								DropdownFrame2.Name = dropdownName
								DropdownFrame2.Parent = SelectionParrent
								DropdownFrame2.Active = true
								DropdownFrame2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
								DropdownFrame2.BorderSizePixel = 0
								DropdownFrame2.Position = UDim2.new(0, 0, 0.600775182, 0)
								DropdownFrame2.Size = UDim2.new(0, 473, 0, 0)
								DropdownFrame2.ScrollBarThickness = 0

								DropList.Name = "DropList"
								DropList.Parent = DropdownFrame2
								DropList.SortOrder = Enum.SortOrder.LayoutOrder
								DropList.Padding = UDim.new(0, 1)

								local dropTw,dropDb = false, false

								DropdownFrame2.CanvasSize = UDim2.new(0, 0, 0,DropList.AbsoluteContentSize.Y)
								DropList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
									DropdownFrame2.CanvasSize = UDim2.new(0, 0, 0,DropList.AbsoluteContentSize.Y)
								end)

								OpenDrop.MouseButton1Click:Connect(function()
									if dropTw == false then
										dropTw = true
										if dropDb == false then
											dropDb = true
											DropdownFrame2.ScrollBarThickness = 2
											tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(195, 0, 0),Rotation=45}):Play()
											tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 100)}):Play()
										else
											dropDb = false
											DropdownFrame2.ScrollBarThickness = 0
											tweenservice:Create(DropdownFrame2,TweenInfo.new(0.3),{Size = UDim2.new(0, 473, 0, 0)}):Play()
											tweenservice:Create(OpenDrop,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255),Rotation=0}):Play()
										end
										wait(0.5)
										dropTw = false
									end
								end)
								local FolderCat = Instance.new("Folder",DolceLib)
								for i,v in pairs(dropdownList) do
									local ClickBtn = Instance.new("TextButton")
									local UICorner = Instance.new("UICorner")

									ClickBtn.Name = "ClickBtn"
									ClickBtn.Parent = DropdownFrame2
									ClickBtn.BackgroundColor3 = Color3.fromRGB(116, 113, 130)
									ClickBtn.Size = UDim2.new(0, 472, 0, 25)
									ClickBtn.Font = Enum.Font.SourceSansBold
									ClickBtn.Text = "      "..v
									ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
									ClickBtn.TextSize = 16.000
									ClickBtn.TextTransparency = 0.400
									ClickBtn.TextWrapped = true
									ClickBtn.TextXAlignment = Enum.TextXAlignment.Left

									UICorner.CornerRadius = UDim.new(0, 3)
									UICorner.Parent = ClickBtn


									ClickBtn.MouseButton1Click:Connect(function()
										if ClickBtn ~= nil then
											if FolderCat:FindFirstChild(tostring(v)) then
												FolderCat[tostring(v)]:Destroy()
												tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(116, 113, 130)}):Play()
											else
												local ez = Instance.new("BoolValue",FolderCat)
												ez.Name = tostring(v)
												tweenservice:Create(ClickBtn,TweenInfo.new(0.3),{BackgroundColor3 = Color3.fromRGB(195, 0, 0)}):Play()
											end
											local to_text = ""
											if #FolderCat:GetChildren() == 1 then
												to_text = to_text..FolderCat:FindFirstChildOfClass("BoolValue").Name
											else
												for e,g in pairs(FolderCat:GetChildren()) do
													if e == 1 then
														to_text = to_text..g.Name
													else
														to_text = to_text..", "..g.Name
													end
												end
											end
											DropName.Text = " "..dropdownName..": "..to_text
											local tablRt = {}
											for e,g in pairs(FolderCat:GetChildren()) do
												table.insert(tablRt, g.Name)
											end
											func(tablRt)
										end
									end)
								end
							end,

							Slider = function(slidername,min,mid,max,func)
								local SliderFrame = Instance.new("Frame")
								local SliderName = Instance.new("TextLabel")
								local Fill = Instance.new("Frame")
								local TextButton = Instance.new("TextButton")
								local UICorner = Instance.new("UICorner")
								local SliderVal = Instance.new("TextLabel")
								local UICorner_2 = Instance.new("UICorner")
								local UICorner_3 = Instance.new("UICorner")

								SliderFrame.Name = slidername
								SliderFrame.Parent = SelectionParrent
								SliderFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
								SliderFrame.BorderColor3 = Color3.fromRGB(17, 17, 17)
								SliderFrame.BorderSizePixel = 0
								SliderFrame.Position = UDim2.new(0, 0, 0.635478675, 0)
								SliderFrame.Size = UDim2.new(0, 473, 0, 50)

								SliderName.Name = "SliderName"
								SliderName.Parent = SliderFrame
								SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								SliderName.BackgroundTransparency = 1.000
								SliderName.BorderSizePixel = 0
								SliderName.Position = UDim2.new(0, 0, -0.0199999996, 0)
								SliderName.Size = UDim2.new(0, 193, 0, 30)
								SliderName.Font = Enum.Font.SourceSansBold
								SliderName.Text = " "..slidername
								SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
								SliderName.TextSize = 16.000
								SliderName.TextTransparency = 0.500
								SliderName.TextXAlignment = Enum.TextXAlignment.Left

								Fill.Name = "Fill"
								Fill.Parent = SliderFrame
								Fill.BackgroundColor3 = Color3.fromRGB(33, 74, 95)
								Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
								Fill.BorderSizePixel = 0
								Fill.Position = UDim2.new(0.0224490669, 0, 0.792350471, 0)
								Fill.Size = UDim2.new(0, 452, 0, 3)

								TextButton.Parent = Fill
								TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
								TextButton.BackgroundColor3 = Color3.fromRGB(195, 0, 0)
								TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.BorderSizePixel = 0
								TextButton.Position = UDim2.new(0, 0, 0.5, 0)
								TextButton.Size = UDim2.new(0, 10, 0, 10)
								TextButton.Font = Enum.Font.SourceSans
								TextButton.Text = ""
								TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextButton.TextSize = 14.000

								UICorner.CornerRadius = UDim.new(0, 60)
								UICorner.Parent = TextButton

								SliderVal.Name = "SliderVal"
								SliderVal.Parent = SliderFrame
								SliderVal.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
								SliderVal.BorderSizePixel = 0
								SliderVal.Position = UDim2.new(0.645338058, 0, 0.0956835896, 0)
								SliderVal.Size = UDim2.new(0, 158, 0, 24)
								SliderVal.Font = Enum.Font.SourceSansBold
								SliderVal.Text = mid
								SliderVal.TextColor3 = Color3.fromRGB(255, 255, 255)
								SliderVal.TextScaled = true
								SliderVal.TextSize = 16.000
								SliderVal.TextTransparency = 0.500
								SliderVal.TextWrapped = true

								UICorner_2.CornerRadius = UDim.new(0, 3)
								UICorner_2.Parent = SliderVal

								UICorner_3.CornerRadius = UDim.new(0, 3)
								UICorner_3.Parent = SliderFrame

								local Dragging = false
								TextButton.MouseButton1Down:Connect(function()
									Dragging = true
								end)

								--TextButton.Position = UDim2.new(1/100*(mid/min*max/100),0,0.5,0)

								userinputservice.InputChanged:Connect(function()
									if Dragging then
										local MousePos = userinputservice:GetMouseLocation()+Vector2.new(0,36)
										local RelPos = MousePos-Fill.AbsolutePosition
										local Precent = math.clamp(RelPos.X/Fill.AbsoluteSize.X,0,1)
										TextButton.Position = UDim2.new(Precent,0,0.5,0)
										local count =  math.round(max/100*(Precent*100),0)
										SliderVal.Text = count
										func(count)
									end
								end)

								userinputservice.InputEnded:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 then
										Dragging = false
									end
								end)
							end,
						}
					end,
				}
			end,
			Notifi = function(tittle,text,thoigian)
				local NotiBack = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")
				local TabName = Instance.new("TextLabel")
				local Label = Instance.new("TextLabel")

				if thoigian < 2 then
					thoigian = 2
				end

				NotiBack.Name = "NotiBack"
				NotiBack.Parent = NotifiFrame
				NotiBack.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				NotiBack.BorderColor3 = Color3.fromRGB(27, 42, 53)
				NotiBack.BorderSizePixel = 0
				NotiBack.ClipsDescendants = true
				NotiBack.Position = UDim2.new(0, 0, 0.871589065, 0)
				NotiBack.Size = UDim2.new(0, 0, 0, 80)
				tweenservice:Create(NotiBack,TweenInfo.new(0.3),{Size=UDim2.new(0, 200, 0, 80)}):Play()

				UICorner.CornerRadius = UDim.new(0, 3)
				UICorner.Parent = NotiBack

				ImageLabel.Parent = NotiBack
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0.0299999993, 0, 0.075000003, 0)
				ImageLabel.Size = UDim2.new(0, 25, 0, 25)
				ImageLabel.Image = "rbxassetid://6023426923"
				ImageLabel.ImageTransparency = 0.200

				TabName.Name = "TabName"
				TabName.Parent = NotiBack
				TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TabName.BackgroundTransparency = 1.000
				TabName.BorderSizePixel = 0
				TabName.Position = UDim2.new(0.188901678, 0, 0.0625, 0)
				TabName.Size = UDim2.new(0, 145, 0, 27)
				TabName.Font = Enum.Font.SourceSansBold
				TabName.Text = tittle
				TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
				TabName.TextSize = 20.000
				TabName.TextTransparency = 0.200
				TabName.TextXAlignment = Enum.TextXAlignment.Left

				Label.Name = "Label"
				Label.Parent = NotiBack
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.BorderSizePixel = 0
				Label.Position = UDim2.new(0.0889016688, 0, 0.400000006, 0)
				Label.Size = UDim2.new(0, 165, 0, 40)
				Label.Font = Enum.Font.SourceSansBold
				Label.Text = text
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 15.000
				Label.TextTransparency = 0.200
				Label.TextXAlignment = Enum.TextXAlignment.Left
				Label.TextYAlignment = Enum.TextYAlignment.Top

				game.Debris:AddItem(NotiBack, thoigian)
				wait(thoigian-0.3)
				tweenservice:Create(NotiBack,TweenInfo.new(0.3),{Size=UDim2.new(0, 0, 0, 80)}):Play()
			end,
		}
	end,
}

local lib = Library.Lib(Enum.KeyCode.LeftControl)
local Main = lib.Group("Main")
local Misc = lib.Group("Misc")
local MainPage = Main.Page("Main", "rbxassetid://6026568198")
local MiscPage = Misc.Page("Misc", "rbxassetid://6026568198")
local grup2 = lib.Group("Credit")
local page3 = grup2.Page("HoHo Hub", "rbxassetid://10334578493")

MainPage.Label("Auto Parry")
page3.Label("discord.gg/hohohub")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remote = ReplicatedStorage:WaitForChild("Remote")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Balls = workspace:WaitForChild("Balls")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local RewardsList = LocalPlayer.PlayerGui.PlaytimeRewards.PlaytimeRewards.Page.List.RewardsList:GetChildren()
local VUser = game:GetService("VirtualInputManager")

function PressKey(code)
	VUser:SendKeyEvent(true, code, false, game)
    VUser:SendKeyEvent(false, code, false, game)
end

function Parry()
    keypress(Enum.KeyCode.F)
end

function Ability()
    keypress(Enum.KeyCode.Q)
end

function parry()
    local stuffs = {}
    for i, v in pairs(Players:GetPlayers()) do
        if not v ~= Player then
            if v.Character then
                if v.Character:FindFirstChild("HumanoidRootPart") then
                    stuffs[tostring(v.UserId)] = game.workspace.CurrentCamera:WorldToScreenPoint(v.Character.PrimaryPart.Position)
                end
            end
        end
    end
    Remotes:WaitForChild("ParryAttempt"):FireServer("NaN", game.workspace.CurrentCamera.CFrame, stuffs, {
        game.workspace.CurrentCamera.ViewportSize.X / 2,
        game.workspace.CurrentCamera.ViewportSize.Y / 2
    })
end

function parry2()
	Remotes.ParryButtonPress:Fire()
end

getgenv().keypress = PressKey
-- Parry = parry2

_G.HohoSetting = {
    AutoParry = false,
    AutoAbility = false,
    ParryMode = "Legit",
    InsaneModeRange = 35,
    CameraBall = false,
    AutoClaimRewards = true
}

MainPage.Toggle("Auto Parry", _G.HohoSetting.AutoParry, false, "Toggle Auto Parry Feature", function(state)
    _G.HohoSetting.AutoParry = state
end)

MainPage.Toggle("Auto Use Abilities", _G.HohoSetting.AutoAbility, false, "Toggle Auto Use Abilities Feature", function(state)
    _G.HohoSetting.AutoAbility = state
end)

MainPage.Toggle("Change Camera Subject to Ball", _G.HohoSetting.CameraBall, false, "Toggle Camera to Follow The Ball Feature", function(state)
    _G.HohoSetting.CameraBall = state
	if state == false then
		workspace.CurrentCamera.CameraSubject = char.Humanoid
	end
end)

MainPage.Dropdown("Choose Auto Parry Mode", _G.HohoSetting.ParryMode, {"Legit", "Lunatic"}, function(mode)
    _G.HohoSetting.ParryMode = mode
end)

MainPage.Slider("Lunatic Mode Range", 5, _G.HohoSetting.InsaneModeRange, 50, function(range)
    _G.HohoSetting.InsaneModeRange = range
end)

MiscPage.Toggle("Enable Parry Counter", LocalPlayer.PlayerGui.ParryCounter.Enabled, false, "Toggle Parry Counter GUI", function(state)
    LocalPlayer.PlayerGui.ParryCounter.Enabled = state
end)

MiscPage.Toggle("Auto Claim Playtime Rewards", _G.HohoSetting.AutoClaimRewards, false, "Toggle Auto Claim Playtime Rewards Feature", function(state)
    _G.HohoSetting.AutoClaimRewards = state
end)

Balls.ChildAdded:Connect(function(Ball)
    if _G.HohoSetting.AutoParry == true then
        if not Ball:GetAttribute("realBall") == true then
            return
        end

	-- game:GetService("RunService"):Set3dRenderingEnabled(false)
        local OldPosition, OldTick = Ball.Position, tick()

        Ball:GetPropertyChangedSignal("Position"):Connect(function()
            local char = Player.Character
            if _G.HohoSetting.CameraBall == true then
                workspace.CurrentCamera.CameraSubject = Ball
            else
                workspace.CurrentCamera.CameraSubject = char.Humanoid
            end
            if _G.HohoSetting.ParryMode == "Lunatic" then
                char:MoveTo(Ball.Position + Vector3.new(
                        math.random(-_G.HohoSetting.InsaneModeRange, _G.HohoSetting.InsaneModeRange),
                        math.random(-_G.HohoSetting.InsaneModeRange, _G.HohoSetting.InsaneModeRange),
                        math.random(-_G.HohoSetting.InsaneModeRange, _G.HohoSetting.InsaneModeRange)))
            end
            if char:FindFirstChild("Highlight") or Ball.BrickColor == BrickColor.new("Persimmon") then
                if _G.HohoSetting.AutoAbility == true then
                    Ability()
				end
                local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
                local Velocity = (OldPosition - Ball.Position).Magnitude
                if (Distance / Velocity) <= 10 or _G.HohoSetting.ParryMode == "Lunatic" then
                    Parry()
                end
            end

            if (tick() - OldTick >= 1.75 / workspace:GetRealPhysicsFPS()) then
                OldTick, OldPosition = tick(), Ball.Position
            end
        end)
    end
end)

spawn(function()
    while true do
        if _G.HohoSetting.AutoClaimRewards == true then
            for i = 1, 6, 1 do
				Packages["_Index"]["sleitnick_net@0.1.0"].net["RF/ClaimPlaytimeReward"]:InvokeServer(i)
			end
            for i = 1, 8, 1 do
				Remote.RemoteFunction:InvokeServer("ClaimNewDailyLoginReward", i)
			end
        end
		wait(15)
    end
end)

lib.Notifi("Script Loaded!", "discord.gg/hohohub", 3)
lib.Notifi("Developer", "Discord: godo_clown", 3)

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    VUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

if setfflag then
	setfflag("AbuseReportScreenshot", "False")
	setfflag("AbuseReportScreenshotPercentage", "0")
end

