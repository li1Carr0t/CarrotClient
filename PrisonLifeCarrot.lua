--[[
	Prison Life Open Source
	Script Discord @lil_jcarrot
	Version 0.6-V2
]]--



--[=====================================================]--
-- // *======*   Setup Script   *======* \\ --
--[=====================================================]--
_G.PopupStart = false
_G.ToggleUI = true
--[=====================================================]--
-- // *======*   Loadstring   *======* \\ --
--[=====================================================]--
local CarrotUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
--[=====================================================]--
-- // *======*   Function Gradient Color   *======* \\ --
--[=====================================================]--
function gradient(text, startColor, endColor)
    	local result = ""
	local length = #text
    	for i = 1, length do
        	local t = (i - 1) / math.max(length - 1, 1)
        	local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        	local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        	local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        	local char = text:sub(i, i)
        	result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    	end
    	return result
end
--[=====================================================]--
-- // *======*   Local Text   *======* \\ --
--[=====================================================]--
-- // Version Script \\ --
local VersionScript = "0.6-V2 - Open Source"
-- // Other Local Taxt \\ --
local TitleText = "" .. gradient("Carrot Client", Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275"))
local PatchScript = "" .. gradient("We are fixing it. Please wait a moment", Color3.fromHex("#BDC3C7"), Color3.fromHex("#2C3E50"))
local OPFeature = "" .. gradient("OP Feature", Color3.fromHex("#fc00ff"), Color3.fromHex("#00dbde"))
local PremiumText = "" .. gradient("Premium", Color3.fromHex("#F58A42"), Color3.fromHex("#C2F542"))
--[=====================================================]--
-- // *======*   Premission   *======* \\ --
--[=====================================================]--
local DevMode = false
local Confirmed = false
local PremiumMode = false
--[=====================================================]--
-- // *======*   Config Popup   *======* \\ --
--[=====================================================]--
if _G.PopupStart == true then
	CarrotUI:Popup({
		Title = "" .. gradient("Carrot | Loader", Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275")),
		Icon = "rbxassetid://5410949701",
		IconThemed = true,
		Content = "Welcome to " .. gradient("Carrot Loader", Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275")) .. "\nVersion : " .. gradient("" .. VersionScript, Color3.fromHex("#C89CF7"), Color3.fromHex("#F79CE8")) .. "\n⚠️ Script has key ⚠️",
		Buttons = {
        		{
            			Title = "" .. gradient("Cancel", Color3.fromHex("#E8774A"), Color3.fromHex("#FC0D0D")),
            			Callback = function() end,
            			Variant = "Secondary", -- // Primary, Secondary, Tertiary
        		},
			{
				Title = "" .. gradient("Premium Mode", Color3.fromHex("#0FFCCD"), Color3.fromHex("#0F37FC")),
				Icon = "gem",
				Callback = function() Confirmed = true PremiumMode = true end,
				Variant = "Tertiary",
			}
    		}
	})
	repeat wait() until Confirmed
end
--[=====================================================]--
-- // *======*   Window Setting + KeySystem   *======* \\ --
--[=====================================================]--
local Window = CarrotUI:CreateWindow({
	Title = "" .. gradient("Carrot Client", Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275")) .. "  🥕   |   " .. gradient("Anime Theme", Color3.fromHex("#C9FFBF"), Color3.fromHex("#FFAFBD")),
	Icon = "rbxassetid://5410949701",
    	IconThemed = true,
	Author = "Prison Life  " .. gradient("( Premium )", Color3.fromHex("#E813E4"), Color3.fromHex("#02FADD")),
    	Folder = "jcarot1_config",
    	Size = UDim2.fromOffset(600, 500),
    	Transparent = true,
    	Theme = "Dark",
    	User = { Enabled = true, Callback = function() print("clicked") end, Anonymous = true },
    	SideBarWidth = 200,
    	ScrollBarEnabled = true,
	Background = "rbxassetid://17778654821",
})
--[=====================================================]--
-- // *======*   Edit Toggle Ui   *======* \\ --
--[=====================================================]--
if _G.ToggleUI == true then
	Window:EditOpenButton({
		Title = "" .. gradient("Carrot Ui", Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275")),
		Icon = "carrot",
		CornerRadius = UDim.new(0,16),
    		StrokeThickness = 2,
    		Color = ColorSequence.new( Color3.fromHex("6F42F5"), Color3.fromHex("F54275") ),
    		Draggable = true,
	})
end
--[=====================================================]--
-- // *======*   Tabs   *======* \\ --
--[=====================================================]--
local Tabs = {}
	Tabs.InfoSection = Window:Section({ Title = "Home", Opened = true, })
	Tabs.InfoTab = Tabs.InfoSection:Tab({ Title = "About", Icon = "info" })
	Tabs.SettingsTab = Tabs.InfoSection:Tab({ Title = "Settings", Icon = "settings" })
	Tabs.ServerTab = Tabs.InfoSection:Tab({ Title = "Server", Icon = "server" })
	----------------------------------------------------------------------------
	Tabs.GeneralSection = Window:Section({ Title = "General", Opened = false, })
	Tabs.LocalPlayer = Tabs.GeneralSection:Tab({ Title = "LocalPlayer", Icon = "user-cog" })
	Tabs.ESP = Tabs.GeneralSection:Tab({ Title = "ESP", Icon = "eye" })
	Tabs.ItemTab = Tabs.GeneralSection:Tab({ Title = "Items", Icon = "package" })
	Tabs.CombatTab = Tabs.GeneralSection:Tab({ Title = "Combat", Icon = "swords" })		
	Tabs.TestTab = Tabs.GeneralSection:Tab({ Title = "Test Feature", Icon = "tool-case", Locked = true })
	Tabs.MusicTab = Tabs.GeneralSection:Tab({ Title = "Music", Icon = "music", Locked = true })
	Tabs.WorldTab = Tabs.GeneralSection:Tab({ Title = "World", Icon = "earth" })
--[=====================================================]--
-- // *======*   Updatelog Popup   *======* \\ --
--[=====================================================]--
-- // *======*   Config Updatelog Popup   *======* \\ --
local updatelog = false
-- // *======*   Script Load Popup   *======* \\ --
if updatelog == true then
	local UpDateTitle = "" .. gradient("Carrot | UpdateLog    " .. VersionScript, Color3.fromHex("#6F42F5"), Color3.fromHex("#F54275"))
	local UpDateContent = "ESP\n  [+] ESP Items\n\nAuto Edit Gun\n  [/] Fix MP5 FireRate ( Safe )\n\nScript By @el_e95 ( Developer )"
	WindUI:Popup({ Title = "" .. UpDateTitle, Icon = "rbxassetid://5410949701", IconThemed = true, Content = "" .. UpDateContent, Buttons = {{ Title = "🥕", Callback = function() end, Variant = "Primary", }} })
end
-- // *======*   Set Tab Info   *======* \\ --
Window:SelectTab(1)
--[=====================================================]--
-- // *======*   Info Section   *======** \\ --
--[=====================================================]--
Tabs.InfoTab:Paragraph({
	Title = "Welcome to " .. TitleText .. " | Prison Life",
	Desc = "Thank for using  " .. TitleText ..  " 🥕",
	Image = "https://tr.rbxcdn.com/180DAY-097cbe77d2a84172de33678330b4508e/420/420/Image/Webp/noFilter",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/24677.jpg",
	ThumbnailSize = 160
})
Tabs.InfoTab:Paragraph({
	Title = "Status",
	Desc = "Version : " .. VersionScript
})
Tabs.InfoTab:Section({ Title = "Credits" })
Tabs.InfoTab:Paragraph({
	Title = "Owner Script : @li1_Carr0t",
	Desc = "Developer : @el_e95 \nUi : WindUi \nStyle Ui on Amethyst [NextGen] Hub",
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/19868.jpg",
	ThumbnailSize = 200
})
--[=====================================================]--
-- // *======*   LocalPlayer   *======* \\ --
--[=====================================================]--
-- // *======*   Service LocalPlayer   *======* \\ --
game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local plr = Players.LocalPlayer
-- // *======*   Local Function LocalPlayer   *======* \\ --
local SitHere
local SetFov
-- // *======*   Config LocalPlayer   *======* \\ --
_G.WalkSpeedLoop = false
_G.JumpPowerHack = false
_G.InfiniteJump = false
getgenv().AntiVoid = true
_G.AntiJump = false
-- // *======*   LocalPlayer   *======* \\ --
Tabs.LocalPlayer:Paragraph({
	Title = "Player Config | Carrot Client 🥕",
	Image = "https://wallpapercave.com/wp/wp8756073.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/22219.jpg",
	ThumbnailSize = 150
})
Tabs.LocalPlayer:Toggle({
	Title = "WalkSpeed Loop",
	Desc = "Sprint / Set WalkSpeed 32",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.WalkSpeedLoop = Value
	end
})
Tabs.LocalPlayer:Toggle({
	Title = "JumpPower Hack",
	Desc = "Set JumpPower 65",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.JumpPowerHack = Value
	end
})
Tabs.LocalPlayer:Button({
	Title = "Sit Here",
	Desc = "Set Player Sit",
	Callback = function()
		SitHere()
	end
})
Tabs.LocalPlayer:Button({
	Title = "FOV Change",
	Desc = "Set Fov 80",
	Callback = function()
		SetFov()
	end
})
Tabs.LocalPlayer:Toggle({
	Title = "Infinite Jump",
	Desc = "You can jump like you flying",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.InfiniteJump = Value
	end
})
Tabs.LocalPlayer:Toggle({
	Title = "Anti Void",
	Desc = "Anti-Tool-Steal - Anti-Handle-Match Protection",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		getgenv().AntiVoid = Value
	end
})
Tabs.LocalPlayer:Toggle({
	Title = "Fast Jump",
	Desc = "Disabled AntiJump\n" .. PatchScript,
	Icon = "toggle-right",
	Locked = false,
	Callback = function(Value)
		_G.AntiJump = Value
	end
})
-- // *======*   Script LocalPlayer   *======* \\ --
-- // WalkSpeedLoop \\ --
spawn(function()
	while task.wait(0) do
		if _G.WalkSpeedLoop then
			pcall(function()
				game:GetService("Players")
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			end)
		end
	end
end)
-- // JumpPowerHack \\ --
spawn(function()
	while task.wait() do
		if _G.JumpPowerHack then
			pcall(function()
				game:GetService("Players")
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 65
			end)
		else
			pcall(function()
				game:GetService("Players")
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
			end)
		end
	end
end)
-- // Infinite Jump \\ --
spawn(function()
	UIS.JumpRequest:Connect(function()
    		if _G.InfiniteJump then
        	local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        		if hum then
            			hum:ChangeState("Jumping")
        		end
    		end
	end)
end)
-- // Sit Here Function \\ --
SitHere = function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
end
-- // Set Fov Function \\ --
SetFov = function()
	workspace.Camera.FieldOfView = 80
end
-- // Anti Void \\ --
spawn(function()
	local function toolMatch(Handle)
    		local allPlayers = Players:GetPlayers()
    		for i = 1, #allPlayers do
        		local Player = allPlayers[i]
        		if (Player == LocalPlayer) then continue end
        			local Character = Player.Character
        			local RightArm = Character:WaitForChild("Right Arm")
        			local RightGrip = RightArm:FindFirstChild("RightGrip")
        			if (RightGrip and RightGrip.Part1 == Handle) then
            				return Player
        			end
    			end
		end
	local function onCharacter(Character)
		local RightArm = Character:WaitForChild("Right Arm")
    		RightArm.ChildAdded:Connect(function(child)
        	if (child:IsA("Weld") and child.Name == "RightGrip" and getgenv().AntiVoid) then
            		local ConnectedHandle = child.Part1
            		local matched = toolMatch(ConnectedHandle)
            		if (matched) then
                		ConnectedHandle.Parent:Destroy()
                		print(matched, "just tried to void you lol!")
            		end
        	end
    	end)
end
	onCharacter(LocalPlayer.Character)
	LocalPlayer.CharacterAdded:Connect(onCharacter)
end)
-- // AntiJump \\ --
spawn(function()
	while task.wait() do
		if _G.AntiJump then
			local AntiJump = Players.LocalPlayer:FindFirstChild("AntiJump")
			pcall(function()
				if LocalPlayer.AntiJump.Enabled == true then
					AntiJump.Disabled = true
				else
					AntiJump.Enabled = true
				end
			end)
		end
	end
end)
--[=====================================================]--
-- // *======*   ESP   *======* \\ --
--[=====================================================]--
-- // *======*   Service ESP *======* \\ --
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local localPlayer = Players.LocalPlayer
local cam = workspace.CurrentCamera
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
-- // *======*   Config ESP   *======* \\ --
_G.ESPEnabled = false
_G.ESP3DEnabled = true
_G.ESPItem = false
_G.RainbowMode = false
-- // *======*   ESP   *======* \\ --
Tabs.ESP:Paragraph({
	Title = "ESP Section | Carrot Client 🥕",
	Image = "https://cdn.rafled.com/anime-icons/images/fju95JbbYmgJ7IJVqQHotwDBPYdhha8K.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/10028.jpg",
	ThumbnailSize = 150
})
Tabs.ESP:Toggle({
	Title = "ESP Name",
	Desc = "Show Username Player",
	Icon = "toggle-right",
	Locked = false,
	Callback = function(Value)
		_G.ESPName = Value
		-- Update existing ESPs
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer then
				if Value then
					createNameESP(plr)
					updateName(plr)
				else
					removeNameESP(plr)
				end
			end
		end
	end
})
Tabs.ESP:Toggle({
	Title = "Highlight ESP",
	Desc = "Color Team Check",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.ESP3DEnabled = Value
	end
})
Tabs.ESP:Toggle({
	Title = "ESP Items",
	Desc = "Find Item Drop on the map",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.ESPItem = Value
	end
})
Tabs.ESP:Toggle({
	Title = "Highlight Rainbow",
	Desc = "Change All Color Highlight to Rainbow",
	Icon = "toggle-right",
	Locked = false,
	Callback = function(Value)
		_G.RainbowMode = Value
	end
})
-- // *======*   Script ESP   *======* \\ --
-- // Rainbow Color \\ --
local function rainbow()
	return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end
-- // *======*   ESP Name + Optimize   *======* \\ --
-- // *======*   Optimize By @el_e95   *======* \\ --
--// Create Name ESP \\--
function createNameESP(plr)
	if plr == LocalPlayer then return end
	if not _G.ESPName then return end
	local char = plr.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	if head:FindFirstChild("NameESP") then return end
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "NameESP"
	billboard.Size = UDim2.new(0, 120, 0, 25)
	billboard.StudsOffset = Vector3.new(0, 2.5, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = head
	local text = Instance.new("TextLabel")
	text.Size = UDim2.fromScale(1, 1)
	text.BackgroundTransparency = 1
	text.TextScaled = false
	text.TextSize = 12
	text.Font = Enum.Font.SourceSansBold
	text.TextStrokeTransparency = 0
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.Text = plr.Name
	text.Parent = billboard
	updateName(plr)
end
--// Remove ESP \\--
function removeNameESP(plr)
	if plr == LocalPlayer then return end
	local char = plr.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local esp = head:FindFirstChild("NameESP")
	if esp then
		esp:Destroy()
	end
end
--// Update Name + Team Color \\--
function updateName(plr)
	if plr == LocalPlayer then return end
	local char = plr.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local gui = head:FindFirstChild("NameESP")
	if not gui then return end
	local label = gui:FindFirstChildOfClass("TextLabel")
	if not label then return end
	label.Text = plr.Name
	if plr.Team then
		if plr.Team.Name == "Guards" then
			label.TextColor3 = Color3.fromRGB(0, 102, 255)
		elseif plr.Team.Name == "Inmates" then
			label.TextColor3 = Color3.fromRGB(255, 153, 0)
		elseif plr.Team.Name == "Criminals" then
			label.TextColor3 = Color3.fromRGB(255, 0, 0)
		else
			label.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	else
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end
--// Setup Player \\--
function setupPlayer(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(0.3)
		if _G.ESPName then
			createNameESP(plr)
		else
			removeNameESP(plr)
		end
	end)
	plr:GetPropertyChangedSignal("Team"):Connect(function()
		updateName(plr)
	end)
end
--// Existing Players \\--
for _, plr in ipairs(Players:GetPlayers()) do
	setupPlayer(plr)
end
--// New Players \\--
Players.PlayerAdded:Connect(setupPlayer)
--// Safety: Remove ESP on respawn for self \\--
LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.2)
	local char = LocalPlayer.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local esp = head:FindFirstChild("NameESP")
	if esp then
		esp:Destroy()
	end
end)
-- // *======*   ESP Highligth + Optimize   *======* \\ --
-- // *======*   Optimize By @el_e95   *======* \\ --
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local UPDATE_RATE = 0.15 -- ANTI LAG

-- // Create Highlight \\ --
local function createHighlight(char)
	if not char then return end
	if char == localPlayer.Character then return end -- กันตัวเอง
	if char:FindFirstChild("Highlight") then return end

	local h = Instance.new("Highlight")
	h.Name = "Highlight"
	h.FillTransparency = 1
	h.OutlineTransparency = 0
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = char
end

-- // Remove Highlight \\ --
local function removeHighlight(char)
	if not char then return end
	local h = char:FindFirstChild("Highlight")
	if h then
		h:Destroy()
	end
end

-- // Team Check + Color \\ --
local function updateColor(plr)
	if plr == localPlayer then return end -- กันตัวเอง

	local char = plr.Character
	if not char then return end

	local h = char:FindFirstChild("Highlight")
	if not h then return end

	if _G.RainbowMode then
		h.OutlineColor = rainbow()
	else
		if plr.Team and plr.Team.Name == "Guards" then
			h.OutlineColor = Color3.fromRGB(0, 102, 255)
		elseif plr.Team and plr.Team.Name == "Inmates" then
			h.OutlineColor = Color3.fromRGB(255, 153, 0)
		elseif plr.Team and plr.Team.Name == "Criminals" then
			h.OutlineColor = Color3.fromRGB(255, 0, 0)
		end
	end
end

-- // When Character Added \\ --
local function onCharacterAdded(plr, char)
	if not _G.ESP3DEnabled then return end
	if plr == localPlayer then
		removeHighlight(char) -- กันกรณี Highlight ค้าง
		return
	end
	createHighlight(char)
end

-- // Existing Players \\ --
for _, plr in ipairs(Players:GetPlayers()) do
	plr.CharacterAdded:Connect(function(char)
		onCharacterAdded(plr, char)
	end)
end

-- // New Players \\ --
Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		onCharacterAdded(plr, char)
	end)
end)

-- // Update Loop \\ --
task.spawn(function()
	while true do
		task.wait(UPDATE_RATE)
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= localPlayer and plr.Character then
				if _G.ESP3DEnabled then
					createHighlight(plr.Character)
					updateColor(plr)
				else
					removeHighlight(plr.Character)
				end
			end
		end

		-- ล้าง Highlight ตัวเองทุกเฟรม (กันพลาด)
		if localPlayer.Character then
			removeHighlight(localPlayer.Character)
		end
	end
end)

-- // *======*   ESP Item   *======* \\ --
-- // *======*   Script By @el_e95   *======*\\ --
_G.ESPItem = _G.ESPItem or false
-- ใช้แค่ชื่อไอเทม ไม่ fix สีแล้ว
local ITEMS = {
	M9 = true,
	Hammer = true,
	["Key card"] = true,
	["Crude Knife"] = true
}
-- ===== Sound =====
local detectSound = Instance.new("Sound")
detectSound.Name = "ItemDetectSound"
detectSound.SoundId = "rbxassetid://17208361335" -- เปลี่ยนเสียงได้
detectSound.Volume = 1
detectSound.Parent = SoundService
-- ===== กันเสียงซ้ำ =====
local playedItems = {}
-- ===== helper =====
local function getPart(item)
	if item:IsA("Model") then
		return item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
	elseif item:IsA("BasePart") then
		return item
	end
end

local function playDetectSound(item)
	if playedItems[item] then return end
	playedItems[item] = true
	detectSound:Play()
	game.StarterGui:SetCore("SendNotification", {
	Title = "🥕 ESP ITEMS ☄️"; -- the title 
	Text = "✅ Found " .. item.Name .. " ⭐️"; -- what the text says 
	Duration = 3; -- how long the notification should in secounds
})
end

-- ===== ESP =====
local function addESP(item)
	if not _G.ESPItem then return end
	if item:FindFirstChild("ItemHighlight") then return end
	if not ITEMS[item.Name] then return end

	-- 🔊 Sound
	playDetectSound(item)

	-- Highlight
	local h = Instance.new("Highlight")
	h.Name = "ItemHighlight"
	h.Adornee = item
	h.FillTransparency = 0.6
	h.OutlineTransparency = 0
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = item

	-- Name
	local part = getPart(item)
	if not part then return end

	local gui = Instance.new("BillboardGui")
	gui.Name = "ItemNameGui"
	gui.Adornee = part
	gui.Size = UDim2.fromScale(4, 1)
	gui.StudsOffset = Vector3.new(0, 2.5, 0)
	gui.AlwaysOnTop = true

	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.fromScale(1, 1)
	txt.BackgroundTransparency = 1
	txt.Text = item.Name
	txt.TextStrokeTransparency = 0
	txt.TextScaled = false
	txt.TextSize = 8
	txt.Font = Enum.Font.GothamBold
	txt.Parent = gui

	gui.Parent = item
end

local function removeESP(item)
	local h = item:FindFirstChild("ItemHighlight")
	if h then h:Destroy() end

	local gui = item:FindFirstChild("ItemNameGui")
	if gui then gui:Destroy() end
end

-- ===== Refresh =====
local function refreshAll()
	for _, item in ipairs(Workspace:GetChildren()) do
		if ITEMS[item.Name] then
			if _G.ESPItem then
				addESP(item)
			else
				removeESP(item)
			end
		end
	end
end

-- ===== Events =====
Workspace.ChildAdded:Connect(function(item)
	if ITEMS[item.Name] and _G.ESPItem then
		task.defer(addESP, item)
	end
end)

Workspace.ChildRemoved:Connect(function(item)
	playedItems[item] = nil
	removeESP(item)
end)

-- ===== Rainbow =====
RunService.Heartbeat:Connect(function()
	if not _G.ESPItem then return end
	local color = rainbow() -- ใช้ฟังก์ชัน rainbow ของคุณ

	for _, item in ipairs(Workspace:GetChildren()) do
		local h = item:FindFirstChild("ItemHighlight")
		if h then
			h.FillColor = color
			h.OutlineColor = color
		end

		local gui = item:FindFirstChild("ItemNameGui")
		if gui then
			local txt = gui:FindFirstChildWhichIsA("TextLabel")
			if txt then
				txt.TextColor3 = color
			end
		end
	end
end)

-- ===== WindUI Toggle =====
task.spawn(function()
	local last = _G.ESPItem
	while true do
		if last ~= _G.ESPItem then
			last = _G.ESPItem
			refreshAll()
		end
		task.wait(0.3)
	end
end)
--[=====================================================]--
-- // *======*   Items   *======* \\ --
--[=====================================================]--
-- // *======*   Config Items   *======* \\ --
_G.PickupKeyCard = true
_G.PickupM9 = true
_G.PickupRem870 = true
_G.PickupAK47 = false
_G.PickupMP5 = false
_G.CrudeKnife = true
_G.Hammer = true
-------------------
_G.PickupM4A1 = false
_G.Shield = false
_G.RiotCloth = false
-------------------
_G.FAL = false
_G.C4 = false
_G.MafiaCloth = false
-------------------
_G.Breakfast = false
_G.Lunch = false
_G.Dinner = false
-------------------
-- // *======*   Items   *======* \\ --
Tabs.ItemTab:Paragraph({
	Title = "Items Section | Carrot Client 🥕",
	Image = "https://4kwallpapers.com/images/walls/thumbs_2t/13880.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/24223.jpg",
	ThumbnailSize = 150
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Key Card",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.PickupKeyCard = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup M9",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.PickupM9 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Remington 870",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.PickupRem870 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup AK-47",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.PickupAK47 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup MP5",
	Icon = "toggle-right",	
	Callback = function(Value)
		_G.PickupMP5 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Crude Knife",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.CrudeKnife = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Hammer",
	Icon = "toggle-right",
	Value = true,
	Callback = function(Value)
		_G.Hammer = Value
	end
})
Tabs.ItemTab:Section({ Title = "Riot Police" })
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup M4A1",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.PickupM4A1 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "AutoPickup Shield",
	Desc = "Auto Repair",
	Icon  = "toggle-right",
	Callback = function(Value)
		_G.Shield = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Riot Cloth",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.RiotCloth = Value
	end
})
Tabs.ItemTab:Section({ Title = "Mafia Criminal" })
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Fal",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.FAL = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup C4",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.C4 = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickuo Mafia Cloth",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.MafiaCloth = Value
	end
})
Tabs.ItemTab:Section({ Title = "Foods" })
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Breakfast",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.Breakfast = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Lunch",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.Lunch = Value
	end
})
Tabs.ItemTab:Toggle({
	Title = "Auto Pickup Dinner",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.Dinner = Value
	end
})
-- // *======*   Script Items   *======* \\ --
-- // Key Card \\ --
spawn(function()
	while task.wait() do
		if _G.PickupKeyCard then
			pcall(function()
				local args = {
    					[1] = workspace:FindFirstChild("Key card")
				}
				game:GetService("ReplicatedStorage").Remotes.GiverPressed:FireServer(unpack(args))
			end)
		end
	end
end)
-- // M9 \\ --
spawn(function()
	while task.wait() do
		if _G.PickupM9 then
			pcall(function()
				local args = {
    					[1] = workspace.M9
				}
				game:GetService("ReplicatedStorage").Remotes.GiverPressed:FireServer(unpack(args))
			end)
		end
	end
end)
-- // Remington 870 \\ --
spawn(function()
	while task.wait() do
		if _G.PickupRem870 then
			pcall(function()
				local args = {
					[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870"):FindFirstChild("Meshes/r870_2")
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // M4A1 \\ --
spawn(function()
	while task.wait() do
		if _G.PickupM4A1 then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.M4A1.Mesh
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // FAL \\ --
spawn(function()
	while task.wait() do
		if _G.FAL then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.FAL:FindFirstChild("Smooth Block Model")
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // AK-47 \\ --
spawn(function()
	while task.wait() do
		if _G.PickupAK47 then
			pcall(function()
				local args = {
					[1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47"):FindFirstChild("Meshes/AK47_7")
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // MP5 \\ --
spawn(function()
	while task.wait() do
		if _G.PickupMP5 then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.MP5:FindFirstChild("Meshes/MP5 (2)")
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Crude Knife \\ --
spawn(function()
	while task.wait() do
		if _G.CrudeKnife then
			pcall(function()
				local args = {
    					[1] = workspace:FindFirstChild("Crude Knife")
				}
				game:GetService("ReplicatedStorage").Remotes.GiverPressed:FireServer(unpack(args))
			end)
		end
	end
end)
-- // Hammer \\ --
spawn(function()
	while task.wait() do
		if _G.Hammer then
			pcall(function()
				local args = {
					[1] = workspace.Hammer
				}
				game:GetService("ReplicatedStorage").Remotes.GiverPressed:FireServer(unpack(args))
			end)
		end
	end
end)
-- // Breakfast \\ --
spawn(function()
	while task.wait() do
		if _G.Breakfast then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.Breakfast.ITEMPICKUP
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Lunch \\ --
spawn(function()
	while task.wait() do
		if _G.Lunch then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.Lunch.ITEMPICKUP
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Dinner \\ --
spawn(function()
	while task.wait() do
		if _G.Dinner then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver.Dinner.ITEMPICKUP
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Shield Riot \\ --
spawn(function()
	while task.wait() do
		if _G.Shield then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Riot Shield").ITEMPICKUP
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Cloth Riot \\ --
spawn(function()
	while task.wait() do
		if _G.RiotCloth then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.clothes:FindFirstChild("Riot Police").ITEMPICKUP
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // C4 \\ --
spawn(function()
	while task.wait() do
		if _G.C4 then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.giver:FindFirstChild("C4 Explosive").Explosive
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
-- // Mafia Cloth \\ --
spawn(function()
	while task.wait() do
		if _G.MafiaCloth then
			pcall(function()
				local args = {
    					[1] = workspace.Prison_ITEMS.clothes.Mafia:FindFirstChild("Meshes/vest (7)")
				}
				game:GetService("ReplicatedStorage").Remotes.InteractWithItem:InvokeServer(unpack(args))
			end)
		end
	end
end)
--[=====================================================]--
-- // *======*   Combat   *======* \\ --
--[=====================================================]--
-- // *======*   Service Combat *======* \\ --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
-- // *======*   Local Function Combat   *======* \\ --
local NoRecoil
local ModdedGun
-- // *======*   Config Combat   *======* \\ --
_G.ToggleKill = false
_G.AntiTaserEnabled = false
-- // *======*   Combat   *======* \\ --
Tabs.CombatTab:Paragraph({
	Title = "Combat Section | Carrot Client 🥕",
	Image = "https://wallpapercave.com/wp/wp8756131.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/22945.jpg",
	ThumbnailSize = 150
})
Tabs.CombatTab:Toggle({
	Title = "Killaura",
	Desc = "Kill Player Near you!" .. OPFeature,
	Callback = function(Value)
		_G.ToggleKill = Value
	end
})
Tabs.CombatTab:Button({
	Title = "No Recoil",
	Desc = "Remove Spread" .. OPFeature,
	Callback = function()
		NoRecoil()
	end
})
Tabs.CombatTab:Toggle({
	Title = "Anti Taser",
	Desc = "Delete PlayerTased Remote",
	Locked = true,
	Callback = function(Value)
		_G.AntiTaserEnabled = Value
	end
})
Tabs.CombatTab:Button({
	Title = "Modded Guns",
	Desc = "Make sure you aren't holding any guns\n" .. OPFeature,
	Callback = function()
		ModdedGun()
	end
})
Tabs.CombatTab:Toggle({
	Title = "Rainbow Gun",
	Desc = "Made Gun and Bullet Rainbow",
	Callback = function(Value)
		_G.RainbowGun = Value
		task.spawn(function()
        		while _G.RainbowGun do
        			if LocalPlayer.Character then
                			local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                			if tool then
                        			for _, v in pairs(tool:GetDescendants()) do
                            				if v:IsA("MeshPart") then
								v.TextureID = ""
								v.Material = Enum.Material.Neon
							end
                            				if v:IsA("Texture") or v:IsA("Decal") then
								v:Destroy()
							end
                            				if v:IsA("BasePart") then 
                              		  			v.Color = Color3.fromHSV(tick()%5/5, 1, 1) 
							end
                        			end
                    			end
                		end
                		RunService.RenderStepped:Wait()
            		end
		end)
	end
})
Tabs.CombatTab:Toggle({
	Title = "Ghost Gun",
	Desc = "Transparent Gun",
    	Callback = function(s)
        _G.GhostGun = s
        task.spawn(function()
        	while _G.GhostGun do
        		local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                		if tool then
                    			for _, v in pairs(tool:GetDescendants()) do
                        			if v:IsA("BasePart") then
                            				v.Transparency = 0.8
                        			end
                    			end
                		end
                		RunService.RenderStepped:Wait()
            		end
        	end)
    	end
})
-- // *======*   Script Combat   *======* \\ --
-- // Killaura \\ --
spawn(function()
	while task.wait() do
		if _G.ToggleKill then
			pcall(function()
				local Players = game:GetService("Players")
				local LocalPlayer = Players.LocalPlayer
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local remote = ReplicatedStorage:WaitForChild("meleeEvent")

				local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local hrp = character:WaitForChild("HumanoidRootPart")

				local closestPlayer = nil
				local closestDistance = math.huge
				local MAX_DISTANCE = 5 -- ระยะที่อนุญาต (ปรับได้)

				for _, plr in ipairs(Players:GetPlayers()) do
    					if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        					local targetHrp = plr.Character.HumanoidRootPart
        					local distance = (hrp.Position - targetHrp.Position).Magnitude

        					if distance < closestDistance and distance <= MAX_DISTANCE then
            						closestDistance = distance
            						closestPlayer = plr
        					end
    					end
				end
				if closestPlayer then
    					remote:FireServer(closestPlayer)
				end
			end)
		end
	end
end)
-- // No Recoil Function \\ --
NoRecoil = function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == "MP5" then
				v:SetAttribute("SpreadRadius", 0.0001)
				WindUI:Notify({
					Title = "No Recoil Gun",
					Content = "Set No Recoil " .. v.Name .. " Successfully",
					Duration = 4,
					Background = "rbxassetid://17778654821"
				})
			end
			if v.Name == "AK-47" then
				v:SetAttribute("SpreadRadius", 0.0001)
				WindUI:Notify({
					Title = "No Recoil Gun",
					Content = "Set No Recoil " .. v.Name .. " Successfully",
					Duration = 4,
					Background = "rbxassetid://17778654821"
				})
			end
			if v.Name == "M4A1" then
				v:SetAttribute("SpreadRadius", 0.0001)
				WindUI:Notify({
					Title = "No Recoil Gun",
					Content = "Set No Recoil " .. v.Name .. " Successfully",
					Duration = 4,
					Background = "rbxassetid://17778654821"
				})
			end
			if v.Name == "FAL" then
				v:SetAttribute("SpreadRadius", 0.0001)
				WindUI:Notify({
					Title = "No Recoli Gun",
					Contect = "Set No Recoil " .. v.Name .. " Successfully",
					Duration = 4,
					Background = "rbxassetid://17778654821"
				})
			end
		end
	end
end
-- // Modded Gun Function \\ --
ModdedGun = function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			v:SetAttribute("FireRate", 0)
			v:SetAttribute("SpreadRadius", 0)
			v:SetAttribute("Damage", 1000)
			v:SetAttribute("Range", 9e9)
			v:SetAttribute("AccurateRange", 9e9)
			if v.Name == "M9" then
				v:SetAttribute("AutoFire", true)
			end
			WindUI:Notify({
				Title = "Modded Gun",
				Content = "Modded " .. v.Name .. " Successfully",
				Duration = 4,
				Background = "rbxassetid://17778654821"
			})
		end
	end
end
--[=====================================================]--
-- // *======*   Gun Editor   *======* \\ --
--[=====================================================]--
-- // *======*   Service Gun Editor   *======* \\ --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack
-- // *======*   Local Function Gun Editor *======* \\ --
local ApplyEdit
-- // *======*   Gun Select   *======* \\ --
GunBackpack = {"None", "M9", "Remington 870", "M4A1","AK-47", "MP5"}
-- // *======*   Config Gun Editor   *======* \\ --
_G.GunSelect = nil
_G.DamageInput = nil
_G.MaxAmmoInput = nil
_G.SpreadRadiusInput = nil
_G.FireRateInput = nil
--_G.AutoFire = false
_G.ReloadTimeInput = nil
_G.RangeInput = nil
-- // *======*   Gun Editor   *======* \\ --
--[[
Tabs.GunEditTab:Paragraph({
	Title = "Gun Editor | Carrot Client 🥕",
	Image = "https://wallpapercave.com/wp/wp8756071.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/4193.jpg",
	ThumbnailSize = 150
})
Tabs.GunEditTab:Dropdown({
	Title = "Select Gun",
	Values = GunBackpack,
	Multi = false,
	AllowNone = true,
	Callback = function(option)
		_G.GunSelect = option
	end
})
Tabs.GunEditTab:Section({ Title = "Editor" })
Tabs.GunEditTab:Input({
	Title = "Damage",
	Locked = true,
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.DamageInput = input
	end
})
Tabs.GunEditTab:Input({
	Title = "MaxAmmo",
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.MaxAmmoInput = input
	end
})
Tabs.GunEditTab:Input({
	Title = "SpreadRadius",
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.SpreadRadiusInput = input
	end
})
Tabs.GunEditTab:Input({
	Title = "FireRate",
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.FireRateInput = input
	end
})
Tabs.GunEditTab:Toggle({
	Title = "AutoFire",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.AutoFire = Value
	end
})
Tabs.GunEditTab:Input({
	Title = "Reload Time",
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.ReloadTimeInput = input
	end
})
Tabs.GunEditTab:Input({
	Title = "Range",
	Value = "",
	Placeholder = "",
	Callback = function(input)
		_G.RangeInput = input
	end
})
Tabs.GunEditTab:Button({
	Title = "Apply",
	Callback = function()
		ApplyEdit()
	end
})
-- // *======*   Script Gun Editor   *======* \\ --
-- // Apply Edit \\ --
ApplyEdit = function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("Damage", _G.DamageInput)
				v:SetAttribute("MaxAmmo", _G.MaxAmmoInput)
				v:SetAttribute("CurrentAmmo", _G.MaxAmmoInput)
				v:SetAttribute("SpreadRadius", _G.SpreadRadiusInput)
				v:SetAttribute("FireRate", _G.FireRateInput)
				v:SetAttribute("ReloadTime", _G.ReloadTimeInput)
				v:SetAttribute("Range", _G.RangeInput)
				v:SetAttribute("AccurateRange", _G.RangeInput)
			end
		end
	end
end
-- // Damage \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("Damage", tonumber(_G.DamageInput))
			end
		end
	end
end)
-- // Max Ammo \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("MaxAmmo", tonumber(_G.MaxAmmoInput))
				v:SetAttribute("CurrentAmmo", tonumber(_G.MaxAmmoInput))
			end
		end
	end
end)
-- // SpreadRadius \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("SpreadRadius", tonumber(_G.SpreadRadiusInput))
			end
		end
	end
end)
-- // FireRate \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("FireRate", tonumber(_G.FireRateInput))
			end
		end
	end
end)
-- // AutoFire \\ --
spawn(function()
	while task.wait() do
		if _G.AutoFire then
			pcall(function()
				for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
					if v:GetAttribute("FireRate") ~= nil then
						if v.Name == _G.GunSelect then
							v:SetAttribute("AutoFire", true)
						end
					end
				end
			end)
		end
	end
end)
-- // Reload Time \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("ReloadTime", tonumber(_G.ReloadTimeInput))
			end
		end
	end
end)
-- // Range \\ --
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:GetAttribute("FireRate") ~= nil then
			if v.Name == _G.GunSelect then
				v:SetAttribute("Range", tonumber(_G.RangeInput))
				v:SetAttribute("AccurateRange", tonumber(_G.RangeInput))
			end
		end
	end
end) ]]--
--[=====================================================]--
-- // *======*   World   *======* \\ --
--[=====================================================]--
-- // *======*   Service World   *======* \\ --
game:GetService("Lighting")
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
-- // *======*   Config World   *======* \\ --
_G.FullBright = false
_G.RemoveFog = false
_G.RemoveShadow = false
_G.DisabledBloom = false
-- // *======*   Local Function World   *======* \\ --
local AntiLag
-- // *======*   World   *======* \\ --
Tabs.WorldTab:Paragraph({
	Title = "World Config | Carrot Client 🥕",
	Image = "https://icon-library.com/images/cool-anime-icon/cool-anime-icon-9.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/15720.jpg",
	ThumbnailSize = 150
})
Tabs.WorldTab:Button{
	Title = "Fast Mode",
	Desc = "Anti Lag",
	Callback = function()
		AntiLag()
	end	
}
Tabs.WorldTab:Toggle({
	Title = "FullBright",
	Desc = "Brightness Map",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.FullBright = Value
	end
})
Tabs.WorldTab:Toggle({
	Title = "Remove Fog",
	Desc = "No Fog",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.RemoveFog = Value
	end
})
Tabs.WorldTab:Toggle({
	Title = "Remove Shadow",
	Desc = "No Shadow",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.RemoveShadow = Value
	end
})
Tabs.WorldTab:Toggle({
	Title = "Disabled Bloom",
	Desc = "Disabled Bloom Effect",
	Icon = "toggle-right",
	Callback = function(Value)
		_G.DisabledBloom = Value
	end
})
-- // *======*   Script World   *======* \\ --
-- // AntiLag \\ --
AntiLag = function()
	local decalsyeeted = true
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
    		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        		v.Material = "Plastic"
        		v.Reflectance = 0
    		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        		v.Transparency = 1
    		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        		v.Lifetime = NumberRange.new(0)
    		elseif v:IsA("Explosion") then
        		v.BlastPressure = 1
        		v.BlastRadius = 1
    		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        		v.Enabled = false
    		elseif v:IsA("MeshPart") then
        		v.Material = "Plastic"
        		v.Reflectance = 0
        		v.TextureID = 10385902758728957
    		end
	end
	for i, e in pairs(l:GetChildren()) do
    		if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        		e.Enabled = false
    		end
	end
end
-- // Fullbright \\ --
spawn(function()
	while task.wait() do
		if _G.FullBright then
			pcall(function()
				game.Lighting.Brightness = 3
			end)
		else
			pcall(function()
				game.Lighting.Brightness = 1.6
			end)
		end
	end
end)
-- // RemoveFog \\ --
spawn(function()
	while task.wait() do
		if _G.RemoveFog then
			pcall(function()
				game.Lighting.FogStart = 9e9
				game.Lighting.FogEnd = 9e9
			end)
		else
			pcall(function()
				game.Lighting.FogStart = 600
				game.Lighting.FogEnd = 1600
			end)
		end
	end
end)
-- // RemoveShadow \\ --
spawn(function()
	while task.wait() do
		if _G.RemoveShadow then
			pcall(function()
				game.Lighting.GlobalShadows = false
			end)
		else
			pcall(function()
				game.Lighting.GlobalShadows = true
			end)
		end
	end
end)
-- // DisableBloom ( Effect ) \\ --
spawn(function()
	while task.wait() do
		if _G.DisabledBloom then
			pcall(function()
				game.Lighting.Bloom.Enabled = false
			end)
		else
			pcall(function()
				game.Lighting.Bloom.Enabled = true
			end)
		end
	end
end)
--[=====================================================]--
-- // *======*   Settings   *======* \\ --
--[=====================================================]--
-- // *======*   Service Settings   *======* \\ --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
-- // *======*   Local Function Settings   *======* -- \\
local UnlockFPS
local KorbloxFake
local VoiceChat
-- // *======*   Settings   *======* \\ --
Tabs.SettingsTab:Section({ Title = "Settings" })
Tabs.SettingsTab:Keybind({
	Title = "Keybind",
	Desc = "Toggle Open Ui For PC",
	Value = "V",
	Callback = function(v)
		Window:SetToggleKey(Enum.KeyCode[v])
	end
})
Tabs.SettingsTab:Button({
	Title = "Unlock FPS",
	Desc = "Unlock your FPS for more them",
	Callback = function()
		UnlockFPS()
	end
})
Tabs.SettingsTab:Button({
	Title = "Korblox",
	Desc = "Use Fake Korblox",
	Locked = true,
	Callback = function()
		KorbloxFake()
	end
})
Tabs.SettingsTab:Button({
	Title = "VC",
	Desc = "Join VoiceChat / Fix Disconnect VoiceChat",
	Callback = function()
		VoiceChat()
	end
})
-- // *======*   Script Settings   *======* \\ --
UnlockFPS = function()
	setfpscap(999999)
end
KorbloxFake = function()
	Character.RightLowerLeg.MeshId = "902942093"
	Character.RightLowerLeg.Transparency = "1"
	Character.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	Character.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	Character.RightFoot.MeshId = "902942089"
	Character.RightFoot.Transparency = "1"
end
VoiceChat = function()
	game:GetService("VoiceChatService"):joinVoice()
end
--[=====================================================]--
-- // *======*   Server   *======* \\ --
--[=====================================================]--
-- // *======*   Service Server   *======* \\ --
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId
local player = Players.LocalPlayer
-- // *======*   Local Function Server   *======* \\ --
local HopServer
local Rejoin
-- // *======*   Server   *======* \\ --
Tabs.ServerTab:Section({ Title = "Server" })
Tabs.ServerTab:Button({
	Title = "Rejoin",
	Callback = function()
		Rejoin()
	end
})
Tabs.ServerTab:Button({
	Title = "Hop Server",
	Callback = function()
		HopServer()
	end
})
-- // *======*   Script Server   *======* \\ --
HopServer = function()
	if player then
    		TeleportService:Teleport(PlaceId, player)
	end
end
Rejoin = function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end
--[=====================================================]--
-- // *======*   Config Auto Edit Gun   *======* \\ --
--[=====================================================]--
_G.EditGun = true
-- // *======*   Auto Edit Gun   *======* \\--
game:GetService("RunService").RenderStepped:Connect(function()
	if _G.EditGun then
		for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:GetAttribute("FireRate") ~= nil then
				pcall(function()
					if v.Name == "M4A1" then
						v:SetAttribute("SpreadRadius", 0.005)
						v:SetAttribute("FireRate",  0.08)
						v:SetAttribute("Range", 9e9)
						v:SetAttribute("AccurateRange", 9e9)
						v:SetAttribute("Damage", 25)
					end
				end)
				pcall(function()	
					if v.Name == "M9" then
						v:SetAttribute("SpreadRadius", 0.005)
						v:SetAttribute("AutoFire", true)
						v:SetAttribute("Range", 9e9)
						v:SetAttribute("AccurateRange", 9e9)
						v:SetAttribute("Damage", 25)
					end
				end)	
				pcall(function()
					if v.Name == "AK-47" then
						v:SetAttribute("SpreadRadius", 0.005)
						v:SetAttribute("FireRate", 0.086)
						v:SetAttribute("Range", 9e9)
						v:SetAttribute("AccurateRange", 9e9)
						v:SetAttribute("Damage", 25)
					end
				end)
				pcall(function()
					if v.Name == "MP5" then
						v:SetAttribute("SpreadRadius", 0.005)
						v:SetAttribute("FireRate", 0.089)
						v:SetAttribute("Range", 9e9)
						v:SetAttribute("AccurateRange", 9e9)
						v:SetAttribute("Damage", 25)
					end
				end)
				pcall(function()
					if v.Name == "FAL" then
						v:SetAttribute("SpreadRadius", 0.005)
						v:SetAttribute("FireRate", 0.085)
						v:SetAttribute("Range", 9e9)
						v:SetAttribute("AccurateRange", 9e9)
						v:SetAttribute("Damage", 25)
					end
				end)
			end
		end
	end
end)
--[=====================================================]--
-- // *======*   Test Feature   *======* \\ --
--[=====================================================]--
-- // *======*   Service Test Feature   *======* \\ --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
-- // *======*   Test Feature   *======* \\ --
Tabs.TestTab:Paragraph({
	Title = "Test Feature | Carrot Client 🥕",
	Image = "https://wallpapercave.com/wp/wp8756071.jpg",
	ImageSize = 42,
	Thumbnail = "https://4kwallpapers.com/images/walls/thumbs_3t/4193.jpg",
	ThumbnailSize = 150
})
--[=====================================================]--


















print("======================================================================")
print("======   *•••*   Prison Life  |  Script By @li1_Carr0t   *•••*  ======")
print("======             Version " .. VersionScript .. "              ======")
print("======   Loaded All Script Done! ✅  |  Script By @li1_Carr0t   ======")
print("======================================================================")
