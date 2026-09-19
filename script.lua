--//========================================================
--// VINIX019 PANEL
--//========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

--========================================================
-- CONFIG
--========================================================

local Config = {
	OpenKey = Enum.KeyCode.RightShift,

	ESP = {
		Enabled = false,
		Box = false,
		Name = false,
		Distance = false,
		Health = false,
		Line = false,
		Skeleton = false,
		TeamCheck = false,
	},

	Aim = {
		Enabled = false,
		FOV = 180,
		Target = "Head",
	},

	RMB = false,
}

--========================================================
-- CORES
--========================================================

local Colors = {
	Background = Color3.fromRGB(5, 7, 10),
	Panel = Color3.fromRGB(10, 13, 18),
	Panel2 = Color3.fromRGB(18, 22, 28),

	Blue = Color3.fromRGB(70, 155, 255),
	BlueDark = Color3.fromRGB(35, 95, 175),

	White = Color3.fromRGB(235, 240, 245),
	Gray = Color3.fromRGB(145, 155, 165),
	DarkGray = Color3.fromRGB(55, 62, 70),

	Red = Color3.fromRGB(255, 70, 70),
	Green = Color3.fromRGB(70, 220, 120),
	Yellow = Color3.fromRGB(255, 205, 70),
}

--========================================================
-- GUI
--========================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "VINIX019_PANEL"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 50
Gui.Parent = PlayerGui

--========================================================
-- FUNÇÕES
--========================================================

local function Corner(Object, Radius)
	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0, Radius or 7)
	C.Parent = Object
	return C
end

local function Stroke(Object, Color, Thickness, Transparency)
	local S = Instance.new("UIStroke")
	S.Color = Color or Colors.Blue
	S.Thickness = Thickness or 1
	S.Transparency = Transparency or 0
	S.Parent = Object
	return S
end

local function Tween(Object, Time, Properties)
	return TweenService:Create(
		Object,
		TweenInfo.new(
			Time,
			Enum.EasingStyle.Quart,
			Enum.EasingDirection.Out
		),
		Properties
	)
end

local function Label(Parent, Text, Size, Position)
	local L = Instance.new("TextLabel")
	L.BackgroundTransparency = 1
	L.Text = Text
	L.Size = Size
	L.Position = Position
	L.Font = Enum.Font.GothamMedium
	L.TextSize = 13
	L.TextColor3 = Colors.White
	L.TextXAlignment = Enum.TextXAlignment.Left
	L.Parent = Parent
	return L
end

--========================================================
-- MAIN
--========================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(720, 430)
Main.Position = UDim2.new(.5, -360, .5, -215)

-- SEM FUNDO AZUL COBRINDO A FOTO
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 1

Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

Corner(Main, 10)
Stroke(Main, Color3.fromRGB(45, 55, 70), 1)

--========================================================
-- FOTO DE FUNDO
--========================================================

local BackgroundImage = Instance.new("ImageLabel")
BackgroundImage.Name = "PanelPhoto"
BackgroundImage.Size = UDim2.fromScale(1, 1)
BackgroundImage.Position = UDim2.fromScale(0, 0)
BackgroundImage.AnchorPoint = Vector2.new(0, 0)

BackgroundImage.BackgroundTransparency = 1

--========================================================
-- ID DA NOVA FOTO
--========================================================

BackgroundImage.Image = "rbxassetid://76763283211369"

-- FOTO MAIS VISÍVEL
BackgroundImage.ImageTransparency = 0.08
BackgroundImage.ImageColor3 = Color3.fromRGB(255, 255, 255)

BackgroundImage.ScaleType = Enum.ScaleType.Crop

-- Fica atrás de absolutamente tudo
BackgroundImage.ZIndex = 0
BackgroundImage.Parent = Main

--========================================================
-- OVERLAY ESCURO
--========================================================

local BackgroundOverlay = Instance.new("Frame")
BackgroundOverlay.Name = "PhotoOverlay"
BackgroundOverlay.Size = UDim2.fromScale(1, 1)
BackgroundOverlay.Position = UDim2.fromScale(0, 0)

BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(3, 5, 8)

-- BEM TRANSPARENTE
BackgroundOverlay.BackgroundTransparency = 0.72

BackgroundOverlay.BorderSizePixel = 0
BackgroundOverlay.ZIndex = 1
BackgroundOverlay.Parent = Main

--========================================================
-- TOP BAR
--========================================================

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 65)
Top.BackgroundColor3 = Color3.fromRGB(6, 9, 13)
Top.BackgroundTransparency = 0.48
Top.BorderSizePixel = 0
Top.ZIndex = 3
Top.Parent = Main

Corner(Top, 10)

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, -30, 0, 1)
TopLine.Position = UDim2.new(0, 15, 1, -1)
TopLine.BackgroundColor3 = Colors.Blue
TopLine.BackgroundTransparency = .15
TopLine.BorderSizePixel = 0
TopLine.ZIndex = 4
TopLine.Parent = Top

--========================================================
-- FOTO DO JOGADOR
--========================================================

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.fromOffset(42, 42)
Avatar.Position = UDim2.fromOffset(14, 11)
Avatar.BackgroundColor3 = Colors.Panel2
Avatar.BackgroundTransparency = .15

Avatar.Image =
	"rbxthumb://type=AvatarHeadShot&id="
	.. LocalPlayer.UserId
	.. "&w=420&h=420"

Avatar.ZIndex = 5
Avatar.Parent = Top

Corner(Avatar, 21)
Stroke(Avatar, Colors.Blue, 1)

--========================================================
-- TITULO
--========================================================

local Title = Label(
	Top,
	"VINIX019",
	UDim2.fromOffset(300, 25),
	UDim2.fromOffset(68, 9)
)

Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.ZIndex = 5

local Subtitle = Label(
	Top,
	"PRIVATE SHOOTING PANEL",
	UDim2.fromOffset(300, 20),
	UDim2.fromOffset(69, 34)
)

Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 9
Subtitle.TextColor3 = Colors.Gray
Subtitle.ZIndex = 5

--========================================================
-- CLOSE
--========================================================

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(35, 35)
Close.Position = UDim2.new(1, -48, 0, 15)
Close.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
Close.BackgroundTransparency = .15
Close.Text = "×"
Close.TextColor3 = Colors.Gray
Close.Font = Enum.Font.GothamBold
Close.TextSize = 22
Close.AutoButtonColor = false
Close.ZIndex = 5
Close.Parent = Top

Corner(Close, 7)
Stroke(Close, Colors.DarkGray, 1)

Close.MouseEnter:Connect(function()
	Tween(Close, .12, {
		BackgroundColor3 = Color3.fromRGB(120, 35, 40),
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
end)

Close.MouseLeave:Connect(function()
	Tween(Close, .12, {
		BackgroundColor3 = Color3.fromRGB(25, 30, 38),
		TextColor3 = Colors.Gray
	}):Play()
end)

--========================================================
-- SIDEBAR
--========================================================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.fromOffset(150, 355)
Sidebar.Position = UDim2.fromOffset(10, 70)
Sidebar.BackgroundColor3 = Color3.fromRGB(7, 10, 14)
Sidebar.BackgroundTransparency = .48
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 3
Sidebar.Parent = Main

Corner(Sidebar, 8)
Stroke(Sidebar, Color3.fromRGB(40, 50, 62), 1)

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -16, 1, -16)
TabContainer.Position = UDim2.fromOffset(8, 8)
TabContainer.BackgroundTransparency = 1
TabContainer.ZIndex = 4
TabContainer.Parent = Sidebar

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 8)
TabLayout.Parent = TabContainer

local Tabs = {}

local function CreateTab(Text)
	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1, 0, 0, 48)
	Button.BackgroundColor3 = Colors.Panel2
	Button.BackgroundTransparency = .35

	Button.Text = Text
	Button.TextColor3 = Colors.Gray
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 12
	Button.TextXAlignment = Enum.TextXAlignment.Left

	Button.AutoButtonColor = false
	Button.ZIndex = 5
	Button.Parent = TabContainer

	Corner(Button, 7)
	Stroke(Button, Colors.DarkGray, 1, .25)

	local Padding = Instance.new("UIPadding")
	Padding.PaddingLeft = UDim.new(0, 16)
	Padding.Parent = Button

	Button.MouseEnter:Connect(function()
		if not Button:GetAttribute("Selected") then
			Tween(Button, .15, {
				BackgroundColor3 = Color3.fromRGB(27, 34, 43),
				TextColor3 = Colors.White
			}):Play()
		end
	end)

	Button.MouseLeave:Connect(function()
		if not Button:GetAttribute("Selected") then
			Tween(Button, .15, {
				BackgroundColor3 = Colors.Panel2,
				TextColor3 = Colors.Gray
			}):Play()
		end
	end)

	Button.MouseButton1Down:Connect(function()
		Tween(Button, .08, {
			Size = UDim2.new(1, -4, 0, 46)
		}):Play()
	end)

	Button.MouseButton1Up:Connect(function()
		Tween(Button, .1, {
			Size = UDim2.new(1, 0, 0, 48)
		}):Play()
	end)

	Tabs[Text] = Button

	return Button
end

local ESPTab = CreateTab("ESP")
local CombatTab = CreateTab("COMBAT")
local ConfigTab = CreateTab("CONFIG")

--========================================================
-- CONTENT
--========================================================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -175, 1, -75)
Content.Position = UDim2.fromOffset(165, 70)

Content.BackgroundColor3 = Color3.fromRGB(7, 10, 14)
Content.BackgroundTransparency = .48

Content.BorderSizePixel = 0
Content.ZIndex = 3
Content.Parent = Main

Corner(Content, 8)
Stroke(Content, Color3.fromRGB(40, 50, 62), 1)

local Pages = {}

local function CreatePage(Name)
	local Page = Instance.new("ScrollingFrame")

	Page.Name = Name
	Page.Size = UDim2.new(1, -20, 1, -20)
	Page.Position = UDim2.fromOffset(10, 10)

	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0

	Page.ScrollBarThickness = 3
	Page.ScrollBarImageColor3 = Colors.Blue

	Page.CanvasSize = UDim2.new(0, 0, 0, 0)
	Page.Visible = false

	Page.ZIndex = 4
	Page.Parent = Content

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0, 8)
	Layout.Parent = Page

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.new(
			0,
			0,
			0,
			Layout.AbsoluteContentSize.Y + 15
		)
	end)

	Pages[Name] = Page

	return Page
end

local ESPPage = CreatePage("ESP")
local CombatPage = CreatePage("COMBAT")
local ConfigPage = CreatePage("CONFIG")

--========================================================
-- TOGGLE
--========================================================

local function CreateToggle(Parent, Text, Default, Callback)

	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1, -4, 0, 46)
	Frame.BackgroundColor3 = Colors.Panel2
	Frame.BackgroundTransparency = .35

	Frame.BorderSizePixel = 0
	Frame.ZIndex = 5
	Frame.Parent = Parent

	Corner(Frame, 7)
	Stroke(Frame, Colors.DarkGray, 1, .35)

	local TextLabel = Label(
		Frame,
		Text,
		UDim2.new(1, -80, 1, 0),
		UDim2.fromOffset(13, 0)
	)

	TextLabel.ZIndex = 6

	local Toggle = Instance.new("TextButton")

	Toggle.Size = UDim2.fromOffset(42, 22)
	Toggle.Position = UDim2.new(1, -55, .5, -11)

	Toggle.BackgroundColor3 = Colors.DarkGray
	Toggle.Text = ""
	Toggle.AutoButtonColor = false
	Toggle.ZIndex = 6
	Toggle.Parent = Frame

	Corner(Toggle, 20)

	local Dot = Instance.new("Frame")

	Dot.Size = UDim2.fromOffset(16, 16)
	Dot.Position = UDim2.fromOffset(3, 3)

	Dot.BackgroundColor3 = Color3.fromRGB(210, 215, 220)
	Dot.BorderSizePixel = 0
	Dot.ZIndex = 7
	Dot.Parent = Toggle

	Corner(Dot, 20)

	local Enabled = Default

	local function Update()

		if Enabled then

			Tween(Toggle, .18, {
				BackgroundColor3 = Colors.Blue
			}):Play()

			Tween(Dot, .18, {
				Position = UDim2.fromOffset(23, 3)
			}):Play()

		else

			Tween(Toggle, .18, {
				BackgroundColor3 = Colors.DarkGray
			}):Play()

			Tween(Dot, .18, {
				Position = UDim2.fromOffset(3, 3)
			}):Play()

		end

	end

	Update()

	Toggle.MouseButton1Click:Connect(function()

		Enabled = not Enabled

		Update()

		if Callback then
			Callback(Enabled)
		end

	end)

	return Frame
end

--========================================================
-- TITULOS
--========================================================

local function PageTitle(Parent, Text)

	local TitleObject = Label(
		Parent,
		Text,
		UDim2.new(1, 0, 0, 32),
		UDim2.new()
	)

	TitleObject.Font = Enum.Font.GothamBold
	TitleObject.TextSize = 15
	TitleObject.TextColor3 = Colors.Blue
	TitleObject.ZIndex = 6

	return TitleObject
end

--========================================================
-- ESP PAGE
--========================================================

PageTitle(ESPPage, "ESP SETTINGS")

CreateToggle(
	ESPPage,
	"ESP",
	Config.ESP.Enabled,
	function(Value)
		Config.ESP.Enabled = Value
	end
)

CreateToggle(
	ESPPage,
	"Box",
	Config.ESP.Box,
	function(Value)
		Config.ESP.Box = Value
	end
)

CreateToggle(
	ESPPage,
	"Nome",
	Config.ESP.Name,
	function(Value)
		Config.ESP.Name = Value
	end
)

CreateToggle(
	ESPPage,
	"Distância",
	Config.ESP.Distance,
	function(Value)
		Config.ESP.Distance = Value
	end
)

CreateToggle(
	ESPPage,
	"Barra de vida",
	Config.ESP.Health,
	function(Value)
		Config.ESP.Health = Value
	end
)

CreateToggle(
	ESPPage,
	"ESP Line",
	Config.ESP.Line,
	function(Value)
		Config.ESP.Line = Value
	end
)

CreateToggle(
	ESPPage,
	"Skeleton",
	Config.ESP.Skeleton,
	function(Value)
		Config.ESP.Skeleton = Value
	end
)

CreateToggle(
	ESPPage,
	"Team Check",
	Config.ESP.TeamCheck,
	function(Value)
		Config.ESP.TeamCheck = Value
	end
)

--========================================================
-- COMBAT
--========================================================

PageTitle(CombatPage, "COMBAT / AIM LOCK")

CreateToggle(
	CombatPage,
	"Aim Lock",
	Config.Aim.Enabled,
	function(Value)
		Config.Aim.Enabled = Value
	end
)

--========================================================
-- TARGET
--========================================================

local TargetFrame = Instance.new("Frame")
TargetFrame.Size = UDim2.new(1, -4, 0, 52)
TargetFrame.BackgroundColor3 = Colors.Panel2
TargetFrame.BackgroundTransparency = .35
TargetFrame.BorderSizePixel = 0
TargetFrame.ZIndex = 5
TargetFrame.Parent = CombatPage

Corner(TargetFrame, 7)

local TargetLabel = Label(
	TargetFrame,
	"ALVO DA MIRA",
	UDim2.fromOffset(150, 52),
	UDim2.fromOffset(13, 0)
)

TargetLabel.ZIndex = 6

local TargetButton = Instance.new("TextButton")

TargetButton.Size = UDim2.fromOffset(155, 34)
TargetButton.Position = UDim2.new(1, -168, .5, -17)

TargetButton.BackgroundColor3 = Color3.fromRGB(24, 30, 38)
TargetButton.Text = "Head"
TargetButton.TextColor3 = Colors.White
TargetButton.Font = Enum.Font.GothamMedium
TargetButton.TextSize = 12

TargetButton.AutoButtonColor = false
TargetButton.ZIndex = 6
TargetButton.Parent = TargetFrame

Corner(TargetButton, 6)
Stroke(TargetButton, Colors.DarkGray, 1)

local Targets = {
	"Head",
	"Torso",
	"HumanoidRootPart"
}

local TargetIndex = 1

TargetButton.MouseButton1Click:Connect(function()

	TargetIndex += 1

	if TargetIndex > #Targets then
		TargetIndex = 1
	end

	Config.Aim.Target = Targets[TargetIndex]
	TargetButton.Text = Config.Aim.Target

end)

--========================================================
-- RMB INFO
--========================================================

local RMBInfo = Instance.new("Frame")

RMBInfo.Size = UDim2.new(1, -4, 0, 48)
RMBInfo.BackgroundColor3 = Color3.fromRGB(15, 24, 34)
RMBInfo.BackgroundTransparency = .20

RMBInfo.BorderSizePixel = 0
RMBInfo.ZIndex = 5
RMBInfo.Parent = CombatPage

Corner(RMBInfo, 7)
Stroke(RMBInfo, Colors.Blue, 1, .4)

local RMBText = Label(
	RMBInfo,
	"AIM LOCK: SEGURE O RMB (BOTÃO DIREITO) PARA TRAVAR",
	UDim2.new(1, -20, 1, 0),
	UDim2.fromOffset(12, 0)
)

RMBText.TextColor3 = Colors.Blue
RMBText.Font = Enum.Font.GothamBold
RMBText.TextSize = 10
RMBText.ZIndex = 6

--========================================================
-- FOV
--========================================================

local FOVFrame = Instance.new("Frame")

FOVFrame.Size = UDim2.new(1, -4, 0, 80)
FOVFrame.BackgroundColor3 = Colors.Panel2
FOVFrame.BackgroundTransparency = .35

FOVFrame.BorderSizePixel = 0
FOVFrame.ZIndex = 5
FOVFrame.Parent = CombatPage

Corner(FOVFrame, 7)

local FOVLabel = Label(
	FOVFrame,
	"FOV",
	UDim2.fromOffset(100, 28),
	UDim2.fromOffset(13, 7)
)

FOVLabel.ZIndex = 6

local FOVValue = Label(
	FOVFrame,
	tostring(Config.Aim.FOV),
	UDim2.fromOffset(80, 28),
	UDim2.new(1, -93, 0, 7)
)

FOVValue.TextXAlignment = Enum.TextXAlignment.Right
FOVValue.TextColor3 = Colors.Blue
FOVValue.ZIndex = 6

local Slider = Instance.new("TextButton")

Slider.Size = UDim2.new(1, -26, 0, 8)
Slider.Position = UDim2.fromOffset(13, 53)

Slider.BackgroundColor3 = Colors.DarkGray
Slider.Text = ""
Slider.AutoButtonColor = false
Slider.ZIndex = 6
Slider.Parent = FOVFrame

Corner(Slider, 10)

local Fill = Instance.new("Frame")

Fill.Size = UDim2.new(
	Config.Aim.FOV / 500,
	0,
	1,
	0
)

Fill.BackgroundColor3 = Colors.Blue
Fill.BorderSizePixel = 0
Fill.ZIndex = 7
Fill.Parent = Slider

Corner(Fill, 10)

local SliderDragging = false

local function UpdateFOV()

	local Mouse = UserInputService:GetMouseLocation()

	local X = math.clamp(
		Mouse.X - Slider.AbsolutePosition.X,
		0,
		Slider.AbsoluteSize.X
	)

	local Percent = X / Slider.AbsoluteSize.X

	Config.Aim.FOV = math.floor(
		50 + Percent * 450
	)

	FOVValue.Text = tostring(Config.Aim.FOV)

	Fill.Size = UDim2.new(
		Percent,
		0,
		1,
		0
	)

end

Slider.MouseButton1Down:Connect(function()

	SliderDragging = true
	UpdateFOV()

end)

UserInputService.InputChanged:Connect(function(Input)

	if SliderDragging then

		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			UpdateFOV()
		end

	end

end)

UserInputService.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		SliderDragging = false
	end

end)

--========================================================
-- CONFIG
--========================================================

PageTitle(ConfigPage, "CONFIGURATION")

local KeyFrame = Instance.new("Frame")

KeyFrame.Size = UDim2.new(1, -4, 0, 60)
KeyFrame.BackgroundColor3 = Colors.Panel2
KeyFrame.BackgroundTransparency = .35

KeyFrame.BorderSizePixel = 0
KeyFrame.ZIndex = 5
KeyFrame.Parent = ConfigPage

Corner(KeyFrame, 7)

local KeyLabel = Label(
	KeyFrame,
	"TECLA DO PAINEL",
	UDim2.fromOffset(170, 60),
	UDim2.fromOffset(13, 0)
)

KeyLabel.ZIndex = 6

local KeyButton = Instance.new("TextButton")

KeyButton.Size = UDim2.fromOffset(155, 35)
KeyButton.Position = UDim2.new(1, -168, .5, -17)

KeyButton.BackgroundColor3 = Color3.fromRGB(24, 30, 38)
KeyButton.Text = Config.OpenKey.Name
KeyButton.TextColor3 = Colors.White
KeyButton.Font = Enum.Font.GothamBold
KeyButton.TextSize = 11

KeyButton.AutoButtonColor = false
KeyButton.ZIndex = 6
KeyButton.Parent = KeyFrame

Corner(KeyButton, 6)
Stroke(KeyButton, Colors.DarkGray, 1)

local WaitingKey = false

KeyButton.MouseButton1Click:Connect(function()

	if WaitingKey then
		return
	end

	WaitingKey = true
	KeyButton.Text = "PRESSIONE UMA TECLA..."

	local Connection

	Connection = UserInputService.InputBegan:Connect(function(Input, Processed)

		if Processed then
			return
		end

		if Input.UserInputType == Enum.UserInputType.Keyboard then

			Config.OpenKey = Input.KeyCode
			KeyButton.Text = Input.KeyCode.Name

			WaitingKey = false

			Connection:Disconnect()

		end

	end)

end)

--========================================================
-- PAGINAS
--========================================================

local function SelectPage(Name)

	for PageName, Page in pairs(Pages) do
		Page.Visible = PageName == Name
	end

	for TabName, Button in pairs(Tabs) do

		local Selected = TabName == Name

		Button:SetAttribute("Selected", Selected)

		if Selected then

			Tween(Button, .18, {
				BackgroundColor3 = Colors.BlueDark,
				TextColor3 = Colors.White
			}):Play()

		else

			Tween(Button, .18, {
				BackgroundColor3 = Colors.Panel2,
				TextColor3 = Colors.Gray
			}):Play()

		end

	end

end

ESPTab.MouseButton1Click:Connect(function()
	SelectPage("ESP")
end)

CombatTab.MouseButton1Click:Connect(function()
	SelectPage("COMBAT")
end)

ConfigTab.MouseButton1Click:Connect(function()
	SelectPage("CONFIG")
end)

SelectPage("ESP")

--========================================================
-- DRAG
--========================================================

local Dragging = false
local DragStart
local StartPosition

Top.InputBegan:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then

		Dragging = true
		DragStart = Input.Position
		StartPosition = Main.Position

	end

end)

Top.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = false
	end

end)

UserInputService.InputChanged:Connect(function(Input)

	if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then

		local Delta = Input.Position - DragStart

		Main.Position = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)

	end

end)

--========================================================
-- ESP
--========================================================

local ESPObjects = {}

--========================================================
-- TEAM CHECK
--========================================================

local function IsEnemy(Player)

	if Player == LocalPlayer then
		return false
	end

	if not Config.ESP.TeamCheck then
		return true
	end

	if LocalPlayer.Team == nil or Player.Team == nil then
		return true
	end

	return LocalPlayer.Team ~= Player.Team

end

--========================================================
-- SKELETON
--========================================================

local SkeletonConnections = {

	-- R15
	{"Head", "UpperTorso"},
	{"UpperTorso", "LowerTorso"},

	{"UpperTorso", "LeftUpperArm"},
	{"LeftUpperArm", "LeftLowerArm"},
	{"LeftLowerArm", "LeftHand"},

	{"UpperTorso", "RightUpperArm"},
	{"RightUpperArm", "RightLowerArm"},
	{"RightLowerArm", "RightHand"},

	{"LowerTorso", "LeftUpperLeg"},
	{"LeftUpperLeg", "LeftLowerLeg"},
	{"LeftLowerLeg", "LeftFoot"},

	{"LowerTorso", "RightUpperLeg"},
	{"RightUpperLeg", "RightLowerLeg"},
	{"RightLowerLeg", "RightFoot"},

	-- R6
	{"Head", "Torso"},
	{"Torso", "Left Arm"},
	{"Torso", "Right Arm"},
	{"Torso", "Left Leg"},
	{"Torso", "Right Leg"},
}

local function CreateSkeletonLine(Folder)

	local Line = Instance.new("Frame")

	Line.Name = "Bone"
	Line.AnchorPoint = Vector2.new(.5, .5)

	Line.BackgroundColor3 = Colors.Blue
	Line.BorderSizePixel = 0

	Line.Size = UDim2.fromOffset(0, 2)
	Line.Visible = false

	Line.ZIndex = 25
	Line.Parent = Folder

	Corner(Line, 3)

	return Line

end

local function GetScreenPosition(Part)

	if not Part then
		return nil, false
	end

	local Position, Visible = Camera:WorldToViewportPoint(
		Part.Position
	)

	if not Visible or Position.Z <= 0 then
		return nil, false
	end

	return Vector2.new(
		Position.X,
		Position.Y
	), true

end

local function UpdateBone(Line, PartA, PartB)

	local PosA, VisibleA = GetScreenPosition(PartA)
	local PosB, VisibleB = GetScreenPosition(PartB)

	if not VisibleA or not VisibleB then
		Line.Visible = false
		return
	end

	local Delta = PosB - PosA
	local Length = Delta.Magnitude

	if Length <= 1 then
		Line.Visible = false
		return
	end

	local Center = (PosA + PosB) / 2

	Line.Visible = true

	Line.Size = UDim2.fromOffset(
		Length,
		2
	)

	Line.Position = UDim2.fromOffset(
		Center.X,
		Center.Y
	)

	Line.Rotation = math.deg(
		math.atan2(
			Delta.Y,
			Delta.X
		)
	)

end

--========================================================
-- CREATE ESP
--========================================================

local function CreateESP(Player)

	if ESPObjects[Player] then
		return ESPObjects[Player]
	end

	local Folder = Instance.new("Folder")
	Folder.Name = "ESP_" .. Player.Name
	Folder.Parent = Gui

	-- BOX
	local Box = Instance.new("Frame")

	Box.BackgroundTransparency = 1
	Box.BorderSizePixel = 0
	Box.Visible = false

	Box.ZIndex = 20
	Box.Parent = Folder

	local BoxStroke = Instance.new("UIStroke")
	BoxStroke.Color = Colors.Blue
	BoxStroke.Thickness = 1
	BoxStroke.Parent = Box

	-- NAME
	local Name = Instance.new("TextLabel")

	Name.BackgroundTransparency = 1
	Name.TextColor3 = Color3.new(1, 1, 1)

	Name.Font = Enum.Font.GothamBold
	Name.TextSize = 12
	Name.TextStrokeTransparency = .5

	Name.Visible = false
	Name.ZIndex = 21
	Name.Parent = Folder

	-- DISTANCE
	local Distance = Instance.new("TextLabel")

	Distance.BackgroundTransparency = 1
	Distance.TextColor3 = Colors.Gray

	Distance.Font = Enum.Font.Gotham
	Distance.TextSize = 10
	Distance.TextStrokeTransparency = .5

	Distance.Visible = false
	Distance.ZIndex = 21
	Distance.Parent = Folder

	-- HEALTH BACK
	local HealthBack = Instance.new("Frame")

	HealthBack.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	HealthBack.BorderSizePixel = 0

	HealthBack.Visible = false
	HealthBack.ZIndex = 20
	HealthBack.Parent = Folder

	-- HEALTH
	local Health = Instance.new("Frame")

	Health.BackgroundColor3 = Colors.Green
	Health.BorderSizePixel = 0

	Health.AnchorPoint = Vector2.new(0, 1)
	Health.ZIndex = 21
	Health.Parent = HealthBack

	-- LINE
	local Line = Instance.new("Frame")

	Line.AnchorPoint = Vector2.new(.5, .5)
	Line.BackgroundColor3 = Colors.Blue
	Line.BorderSizePixel = 0

	Line.Visible = false
	Line.ZIndex = 20
	Line.Parent = Folder

	Corner(Line, 3)

	-- SKELETON
	local SkeletonFolder = Instance.new("Folder")
	SkeletonFolder.Name = "Skeleton"
	SkeletonFolder.Parent = Folder

	local SkeletonLines = {}

	for Index = 1, #SkeletonConnections do
		SkeletonLines[Index] = CreateSkeletonLine(SkeletonFolder)
	end

	ESPObjects[Player] = {

		Folder = Folder,

		Box = Box,
		Name = Name,
		Distance = Distance,

		HealthBack = HealthBack,
		Health = Health,

		Line = Line,

		SkeletonFolder = SkeletonFolder,
		SkeletonLines = SkeletonLines,
	}

	return ESPObjects[Player]

end

--========================================================
-- HIDE SKELETON
--========================================================

local function HideSkeleton(Data)

	if not Data or not Data.SkeletonLines then
		return
	end

	for _, Line in ipairs(Data.SkeletonLines) do
		Line.Visible = false
	end

end

--========================================================
-- REMOVE ESP
--========================================================

local function RemoveESP(Player)

	local Data = ESPObjects[Player]

	if Data then

		if Data.Folder then
			Data.Folder:Destroy()
		end

		ESPObjects[Player] = nil

	end

end

Players.PlayerRemoving:Connect(RemoveESP)

--========================================================
-- UPDATE SKELETON
--========================================================

local function UpdateSkeleton(Data, Character)

	if not Config.ESP.Skeleton then
		HideSkeleton(Data)
		return
	end

	if not Data.SkeletonLines then
		return
	end

	for Index, Connection in ipairs(SkeletonConnections) do

		local PartA = Character:FindFirstChild(Connection[1])
		local PartB = Character:FindFirstChild(Connection[2])

		local Line = Data.SkeletonLines[Index]

		if PartA and PartB then

			UpdateBone(
				Line,
				PartA,
				PartB
			)

		else

			Line.Visible = false

		end

	end

end

--========================================================
-- HIDE ESP
--========================================================

local function HideESP(Data)

	Data.Box.Visible = false
	Data.Name.Visible = false
	Data.Distance.Visible = false
	Data.HealthBack.Visible = false
	Data.Line.Visible = false

	HideSkeleton(Data)

end

--========================================================
-- UPDATE ESP
--========================================================

local function UpdateESP()

	for _, Player in ipairs(Players:GetPlayers()) do

		if Player == LocalPlayer then
			continue
		end

		local Data = CreateESP(Player)

		local Character = Player.Character

		local Humanoid = Character
			and Character:FindFirstChildOfClass("Humanoid")

		local Root = Character
			and Character:FindFirstChild("HumanoidRootPart")

		local Valid =
			Config.ESP.Enabled
			and IsEnemy(Player)
			and Character
			and Humanoid
			and Root
			and Humanoid.Health > 0

		if not Valid then

			HideESP(Data)
			continue

		end

		local RootPos, OnScreen =
			Camera:WorldToViewportPoint(
				Root.Position
			)

		if not OnScreen or RootPos.Z <= 0 then

			HideESP(Data)
			continue

		end

		-- SKELETON
		UpdateSkeleton(
			Data,
			Character
		)

		-- HEAD
		local Head = Character:FindFirstChild("Head")

		local HeadPos

		if Head then

			HeadPos = Camera:WorldToViewportPoint(
				Head.Position + Vector3.new(0, .3, 0)
			)

		else

			HeadPos = Camera:WorldToViewportPoint(
				Root.Position + Vector3.new(0, 2.5, 0)
			)

		end

		local LegPos = Camera:WorldToViewportPoint(
			Root.Position - Vector3.new(0, 3, 0)
		)

		local Height = math.abs(
			HeadPos.Y - LegPos.Y
		)

		local Width = Height * .55

		-- BOX
		Data.Box.Visible = Config.ESP.Box

		Data.Box.Size = UDim2.fromOffset(
			Width,
			Height
		)

		Data.Box.Position = UDim2.fromOffset(
			RootPos.X - Width / 2,
			HeadPos.Y
		)

		-- NAME
		Data.Name.Visible = Config.ESP.Name

		Data.Name.Size = UDim2.fromOffset(
			Width + 100,
			18
		)

		Data.Name.Position = UDim2.fromOffset(
			RootPos.X - (Width + 100) / 2,
			HeadPos.Y - 20
		)

		Data.Name.Text = Player.DisplayName

		-- DISTANCE
		local MyRoot =
			LocalPlayer.Character
			and LocalPlayer.Character:FindFirstChild(
				"HumanoidRootPart"
			)

		local DistanceValue = 0

		if MyRoot then

			DistanceValue = math.floor(
				(MyRoot.Position - Root.Position).Magnitude
			)

		end

		Data.Distance.Visible = Config.ESP.Distance

		Data.Distance.Size = UDim2.fromOffset(
			Width + 100,
			16
		)

		Data.Distance.Position = UDim2.fromOffset(
			RootPos.X - (Width + 100) / 2,
			LegPos.Y + 2
		)

		Data.Distance.Text =
			tostring(DistanceValue) .. "m"

		-- HEALTH
		Data.HealthBack.Visible = Config.ESP.Health

		Data.HealthBack.Size = UDim2.fromOffset(
			4,
			Height
		)

		Data.HealthBack.Position = UDim2.fromOffset(
			RootPos.X - Width / 2 - 7,
			HeadPos.Y
		)

		local HP = math.clamp(
			Humanoid.Health / Humanoid.MaxHealth,
			0,
			1
		)

		Data.Health.Size = UDim2.new(
			1,
			0,
			HP,
			0
		)

		if HP > .6 then

			Data.Health.BackgroundColor3 = Colors.Green

		elseif HP > .3 then

			Data.Health.BackgroundColor3 = Colors.Yellow

		else

			Data.Health.BackgroundColor3 = Colors.Red

		end

		-- LINE
		Data.Line.Visible = Config.ESP.Line

		local StartX =
			Camera.ViewportSize.X / 2

		local StartY = 20

		local EndX = RootPos.X
		local EndY = RootPos.Y

		local DX = EndX - StartX
		local DY = EndY - StartY

		local Length = math.sqrt(
			DX * DX + DY * DY
		)

		local Angle = math.deg(
			math.atan2(DY, DX)
		)

		Data.Line.Size = UDim2.fromOffset(
			Length,
			1
		)

		Data.Line.Position = UDim2.fromOffset(
			StartX + DX / 2,
			StartY + DY / 2
		)

		Data.Line.Rotation = Angle

	end

end

--========================================================
-- FOV
--========================================================

local FOVCircle = Instance.new("Frame")

FOVCircle.Name = "FOV"
FOVCircle.AnchorPoint = Vector2.new(.5, .5)

FOVCircle.Position = UDim2.fromScale(.5, .5)

FOVCircle.BackgroundTransparency = 1

FOVCircle.Size = UDim2.fromOffset(
	Config.Aim.FOV * 2,
	Config.Aim.FOV * 2
)

FOVCircle.Visible = false
FOVCircle.ZIndex = 20
FOVCircle.Parent = Gui

Corner(FOVCircle, 999)

local FOVStroke = Instance.new("UIStroke")

FOVStroke.Color = Colors.Blue
FOVStroke.Thickness = 1
FOVStroke.Transparency = .35
FOVStroke.Parent = FOVCircle

--========================================================
-- TARGET PART
--========================================================

local function GetTargetPart(Character)

	if not Character then
		return nil
	end

	if Config.Aim.Target == "Head" then

		return Character:FindFirstChild("Head")

	elseif Config.Aim.Target == "Torso" then

		return Character:FindFirstChild("UpperTorso")
			or Character:FindFirstChild("Torso")

	elseif Config.Aim.Target == "HumanoidRootPart" then

		return Character:FindFirstChild(
			"HumanoidRootPart"
		)

	end

end

--========================================================
-- CLOSEST TARGET
--========================================================

local function GetClosestTarget()

	local Closest = nil
	local ClosestDistance = Config.Aim.FOV

	local Center = Vector2.new(
		Camera.ViewportSize.X / 2,
		Camera.ViewportSize.Y / 2
	)

	for _, Player in ipairs(Players:GetPlayers()) do

		if Player == LocalPlayer then
			continue
		end

		if not IsEnemy(Player) then
			continue
		end

		local Character = Player.Character

		if not Character then
			continue
		end

		local Humanoid =
			Character:FindFirstChildOfClass(
				"Humanoid"
			)

		if not Humanoid or Humanoid.Health <= 0 then
			continue
		end

		local Part = GetTargetPart(Character)

		if not Part then
			continue
		end

		local Position, Visible =
			Camera:WorldToViewportPoint(
				Part.Position
			)

		if not Visible or Position.Z <= 0 then
			continue
		end

		local ScreenPosition = Vector2.new(
			Position.X,
			Position.Y
		)

		local Distance =
			(ScreenPosition - Center).Magnitude

		if Distance <= ClosestDistance then

			ClosestDistance = Distance
			Closest = Part

		end

	end

	return Closest

end

--========================================================
-- RMB
--========================================================

UserInputService.InputBegan:Connect(function(Input, Processed)

	if Processed then
		return
	end

	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Config.RMB = true
	end

end)

UserInputService.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Config.RMB = false
	end

end)

--========================================================
-- OPEN / CLOSE
--========================================================

local PanelOpen = true

local function OpenPanel()

	PanelOpen = true

	Main.Visible = true

	Main.Size = UDim2.fromOffset(
		680,
		400
	)

	Tween(Main, .22, {
		Size = UDim2.fromOffset(
			720,
			430
		)
	}):Play()

end

local function ClosePanel()

	PanelOpen = false

	local Animation = Tween(
		Main,
		.18,
		{
			Size = UDim2.fromOffset(
				680,
				400
			)
		}
	)

	Animation:Play()

	Animation.Completed:Connect(function()

		if not PanelOpen then
			Main.Visible = false
		end

	end)

end

Close.MouseButton1Click:Connect(function()
	ClosePanel()
end)

UserInputService.InputBegan:Connect(function(
	Input,
	Processed
)

	if Processed then
		return
	end

	if Input.KeyCode == Config.OpenKey then

		if Main.Visible then
			ClosePanel()
		else
			OpenPanel()
		end

	end

end)

--========================================================
-- LOOP
--========================================================

RunService.RenderStepped:Connect(function()

	-- ESP
	UpdateESP()

	-- FOV
	FOVCircle.Size = UDim2.fromOffset(
		Config.Aim.FOV * 2,
		Config.Aim.FOV * 2
	)

	FOVCircle.Visible =
		Config.Aim.Enabled
		and Config.RMB

	-- AIM LOCK
	if Config.Aim.Enabled
		and Config.RMB then

		local Target = GetClosestTarget()

		if Target then

			Camera.CFrame = CFrame.lookAt(
				Camera.CFrame.Position,
				Target.Position
			)

		end

	end

end)

--========================================================
-- FINAL
--========================================================

print("[VINIX019] PANEL CARREGADO")
print("[VINIX019] Skeleton: OFF")
print("[VINIX019] Background ID: 87035631235932")
