local Workspace
Workspace = game:GetService("Workspace")
local Players
Players = game:GetService("Players")
local ReplicatedStorage
ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui
CoreGui = game:GetService("CoreGui")
local RunService
RunService = game:GetService("RunService")
local HttpService
HttpService = game:GetService("HttpService")
local PathfindingService
PathfindingService = game:GetService("PathfindingService")
local VirtualInputManager
VirtualInputManager = game:GetService("VirtualInputManager")
local TextChatService
TextChatService = game:GetService("TextChatService")
local UserInputService
UserInputService = game:GetService("UserInputService")
local Lighting
Lighting = game:GetService("Lighting")
local Stats
Stats = game:GetService("Stats")
local request_
local request_2 = request or http_request or http and http.request

if request_2 then
	request_ = request_2
else
	request_ = syn and syn.request
end

local forsakenFK
local genv = nil

pcall(function()
	genv = typeof(getgenv) == "function" and getgenv() or nil
end)

forsakenFK = genv and genv.ForsakenFK or {}

if genv and not genv.ForsakenFK then
	genv.ForsakenFK = forsakenFK
end

if not forsakenFK.__version then
	forsakenFK.__version = "1.0-slim"
	local localPlayer = Players.LocalPlayer

	forsakenFK.make = function(arg, arg2, parent)
		local instance = Instance.new(arg)
		local children = arg2 and arg2.Children

		if arg2 then
			for k, v in pairs(arg2) do
				if k ~= "Children" then
					pcall(function()
						instance[k] = v
					end)
				end
			end
		end

		if children then
			for _, child in ipairs(children) do
				child.Parent = instance
			end
		end

		if parent then
			instance.Parent = parent
		end

		return instance
	end

	local tbl = { [0] = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.Code, Enum.Font.RobotoMono }
	local v = nil

	local function createScreenGui()
		if v and v.Parent then
			return v
		end
		local hui = nil

		pcall(function()
			if gethui then
				hui = gethui()
			end
		end)

		local flag = not hui

		if flag then
			pcall(function()
				hui = game:GetService("CoreGui")
			end)
		end

		if flag then
			pcall(function()
				local localPlayer2 = Players.LocalPlayer or localPlayer
				hui = localPlayer2 and localPlayer2:WaitForChild("PlayerGui", 5) or nil
			end)
		end

		if flag then
			return nil
		end
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "FK_TextTags"
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		pcall(function()
			screenGui.DisplayOrder = 100
		end)

		screenGui.Parent = hui
		v = screenGui
		return screenGui
	end

	forsakenFK.textTag = function()
		local v2 = createScreenGui()
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.AutomaticSize = Enum.AutomaticSize.XY
		textLabel.Size = UDim2.new(0, 0, 0, 0)
		textLabel.Font = Enum.Font.Code
		textLabel.TextSize = 14
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextStrokeTransparency = 0
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextWrapped = false
		textLabel.Text = ""
		textLabel.Visible = false

		if v2 then
			textLabel.Parent = v2
		end

		local flag = true
		local vector2 = Vector2.new(0, 0)

		local function fn()
			textLabel.AnchorPoint = Vector2.new(flag and 0.5 or 0, flag and 0.5 or 0)
			textLabel.Position = UDim2.new(0, vector2.X, 0, vector2.Y)
		end

		fn()

		return setmetatable({
			Remove = function()
				pcall(function()
					textLabel:Destroy()
				end)
			end,
			Destroy = function()
				pcall(function()
					textLabel:Destroy()
				end)
			end,
		}, { __index = function(...) end, __newindex = function(...) end })
	end

	local tbl2 = {}
	local tbl3 = {}

	local function fn(arg, arg2, arg3)
		task.spawn(function()
			while true do
				local players = Workspace:FindFirstChild("Players")
				local v2 = players and players:FindFirstChild(arg)

				if v2 then
					local function fn2(child)
						if child:IsA("Model") and not arg3[child] then
							arg3[child] = true
							table.insert(arg2, child)
						end
					end

					local function fn3(child)
						arg3[child] = nil

						for i = #arg2, 1, -1 do
							if arg2[i] == child then
								table.remove(arg2, i)
							end
						end
					end

					local connection = v2.ChildAdded:Connect(fn2)
					local connection2 = v2.ChildRemoved:Connect(fn3)
					local flag = false

					local connection3 = players.ChildRemoved:Connect(function(child)
						if child == v2 then
							flag = true
						end
					end)

					for _, child in ipairs(v2:GetChildren()) do
						fn2(child)
					end

					while v2.Parent and not flag do
						task.wait(1)
					end

					connection:Disconnect()
					connection2:Disconnect()
					connection3:Disconnect()

					for i = #arg2, 1, -1 do
						arg3[arg2[i]] = nil
						table.remove(arg2, i)
					end
				end

				task.wait(1)
			end
		end)
	end

	fn("Killers", tbl2, 
