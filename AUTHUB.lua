local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local Chest = false
local Standard = false
local Event = false
local Meteors = false
local Debris = false
local Shards = false

function grabItem(item)
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    
    if item ~= nil then
        if item:IsA("Mesh") or item:IsA("Part") then
            plr.Character.HumanoidRootPart.CFrame = item.CFrame + Vector3.new(0,3,0)
            task.wait(.25)
            mag = (char.HumanoidRootPart.Position - item.Position).Magnitude
            if mag < 5 then
                for i,v in pairs(item:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                    end
                end
            end
        elseif item:IsA("Model") then
            plr.Character.HumanoidRootPart.CFrame = item.PrimaryPart.CFrame + Vector3.new(0,3,0)
            task.wait(.25)
            mag = (char.HumanoidRootPart.Position - item.PrimaryPart.Position).Magnitude
            if mag < 5 then
                for i,v in pairs(item:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                    end
                end
            end
        end
    end
end

local UI = Material.Load({
	Title = "AUT:AU Item Collecter by Nexus#5174",
	Style = 3,
	SizeX = 350,
	SizeY = 250,
	Theme = "Dark",
	ColorOverrides = {
        MainFrame = Color3.new(0.521569, 1, 0.6),
        Minimise = Color3.new(1,1,1),
        MinimiseAccent = Color3.new(1,1,1),
        Maximise = Color3.new(1,0,0),
        MaximiseAccent = Color3.new(0.521569, 1, 0.6),
        NavBar = Color3.new(1,1,1),
        NavBarAccent = Color3.new(0.286275, 1, 0.45098),
        TitleBar = Color3.new(0.286275, 1, 0.45098),
        TitleBarAccent = Color3.new(1,1,1),
        Banner = Color3.new(1,1,1),
        BannerAccent = Color3.new(0,0,0),
        Content = Color3.new(1,1,1),
        Button = Color3.new(0.207843, 0.901961, 0.313725),
        ButtonAccent = Color3.new(1,1,1),
        ChipSet = Color3.new(0.207843, 0.901961, 0.313725),
        ChipSetAccent = Color3.new(1,1,1),
        DataTable = Color3.new(0.207843, 0.901961, 0.313725),
        DataTableAccent = Color3.new(1,1,1),
        Slider = Color3.new(0.207843, 0.901961, 0.313725),
        SliderAccent = Color3.new(1,1,1),
        Toggle = Color3.new(0,0,0),
        ToggleAccent = Color3.new(0.207843, 0.901961, 0.313725),
        Dropdown = Color3.new(0.207843, 0.901961, 0.313725),
        DropdownAccent = Color3.new(1,1,1),
        ColorPicker = Color3.new(0.207843, 0.901961, 0.313725),
        ColorPickerAccent = Color3.new(1,1,1),
        TextField = Color3.new(1,1,1),
        TextFieldAccent = Color3.new(0,0,0),
	}
})

local IC = UI.New({
	Title = "Item Collecter"
})

local M = UI.New({
	Title = "Misc"
})

spawn(function()
    while wait() do
        for i,v in pairs(workspace.ItemSpawns["Chests"]:GetChildren()) do
            if Chests then
                if #v:GetChildren() > 1 then
                    grabItem(v)
                    wait(.25)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(workspace.ItemSpawns["Sand Debris"]:GetChildren()) do
            if Debris then
                if #v:GetChildren() > 0 then
                    grabItem(v)
                    wait(3.15)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(workspace.ItemSpawns["Meteors"]:GetChildren()) do
            if Meteors then
                if #v:GetChildren() > 1 then
                    grabItem(v)
                    wait(2)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(workspace.ItemSpawns["StandardItems"]:GetChildren()) do
            if Standard then
                if #v:GetChildren() > 0 then
                    grabItem(v)
                    wait(.25)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(workspace.ItemSpawns["EventItems"]:GetChildren()) do
            if Event then
                if #v:GetChildren() > 2 then
                    grabItem(v)
                    wait(.25)
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(workspace["Shards"]:GetChildren()) do
            if Shards then
                if #v:GetChildren() > 0 then
                    grabItem(v.HumanoidRootPart)
                    wait(.25)
                end
            end
        end
    end
end)

local DT = IC.DataTable({
	Text = "Chipping away",
	Callback = function(ChipSet)
		table.foreach(ChipSet, function(Option, Value)
            if Option == "Standard Items" then
                Standard = Value
            elseif Option == "Event Items" then
                Event = Value
            elseif Option == "Sand Debris" then
                Debris = Value
            elseif Option == "Meteors" then
                Meteors = Value
            elseif Option == "Chests" then
                Chests = Value
            elseif Option == "Shards" then
                Shards = Value
            end
		end)
	end,
	Options = {
		["Standard Items"]  = {
	      Enabled = false,
		    Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Items that spawn around the map naturally."
					})
				end
		    }
		},
		["Event Items"] = {
		    Enabled = false,
		    Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Items/currency used for events."
					})
				end
		    }
		},
		["Meteors"] = {
		    Enabled = false,
		    Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Meteors, used for gaining stands. (gives arrows)"
					})
				end
		    }
		},
		["Sand Debris"] = {
		    Enabled = false,
		    Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Sand Debris, gives corpse parts."
					})
				end
		    }
		},
		["Chests"] = {
			Enabled = false,
			Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Chests, that spawn around the map & such. (Not Astral Chests)"
					})
				end
			}
		},
		["Shards"] = {
			Enabled = false,
			Menu = {
				Information = function(self)
					UI.Banner({
						Text = "Shards, Used for obtaining P//S (Planet Shaper)"
					})
				end
			}
		},
	}
})

local Invis = M.Button({
    Text = "Invisibility",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        
        if not workspace:FindFirstChild("Platform") then
            if workspace.Map.Layout:FindFirstChild("Collisions") then
                workspace.Map.Layout.Collisions:Destroy()
            end
            
            local platform = Instance.new("Part")
            platform.Parent = workspace
            platform.Name = "Platform"
            platform.Size = Vector3.new(40,1,40)
            platform.Position = Vector3.new(86.13, -475.41, -1155.14)
            platform.Anchored = true
            
            char.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0,3,0)
            wait(.1)
            char.HumanoidRootPart.RootJoint:Destroy()
        else
            char.HumanoidRootPart.CFrame = workspace.Platform.CFrame + Vector3.new(0,3,0)
            wait(.1)
            char.HumanoidRootPart.RootJoint:Destroy()
        end
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "This turns you invisible!"
            })
        end
    }
})
