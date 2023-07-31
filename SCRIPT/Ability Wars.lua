local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "YAKUZA | Ability Wars [PREMIUM-VERSION] By driverzuisk#0000", HidePremium = false, SaveConfig = false})

--UI Tabs
local MAIN_TAB = Window:MakeTab({
	Name = "MAIN",
	Icon = "rbxassetid://7539983773",
	PremiumOnly = false
})

local MISC_TAB = Window:MakeTab({
	Name = "MISC",
	Icon = "rbxassetid://484211948",
	PremiumOnly = false
})

-- UI Configs
getgenv().aurareach = math.huge

local ANTI_VOID = Instance.new("Part")
ANTI_VOID.Parent = workspace
ANTI_VOID.Anchored = true
ANTI_VOID.Transparency = 0
ANTI_VOID.Position = Vector3.new(65, 15, -10)
ANTI_VOID.Size = Vector3.new(2800,1,2800)
ANTI_VOID.CanCollide = true

 -- UI Buttons
MAIN_TAB:AddToggle({
	Name = "PUNCH | [AURA]",
	Default = false,
	Callback = function(bool)
		getgenv().saura = bool

      while getgenv().saura do
         task.wait(2)
      for i,v in pairs(game:GetService("Players"):GetChildren()) do
         if v.Character["Right Arm"]:FindFirstChild("SelectionBox") == nil and v ~= game.Players.LocalPlayer then
         local target = v.Character.HumanoidRootPart
         local mag = (target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
         if getgenv().aurareach > mag then
         local args = {
         [1] = workspace:WaitForChild(target.Parent.Name),
         [2] = Vector3.new(target.Position),
         [3] = 0,
         [4] = game:GetService("Players"):WaitForChild(target.Parent.Name).Character:FindFirstChild("Torso")
         }

         game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("Punch"):FireServer(unpack(args))
      end
         end
            end
               end
	               end    
})

MAIN_TAB:AddSlider({
	Name = "PUNCH AURA | [REACH]",
	Min = 0,
	Max = math.huge,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "REACH",
	Callback = function(val)
      getgenv().aurareach = val
	end    
})

MAIN_TAB:AddToggle({
	Name = "ANTI | [TOMBER DANS LE VIDE]",
	Default = false,
	Callback = function(bool)
		ANTI_VOID.CanCollide = bool
	end    
})

MAIN_TAB:AddSlider({
	Name = "MARCHE | [VITESSE]",
	Min = 20,
	Max = 50,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WS",
	Callback = function(val)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = val
   end
})

MAIN_TAB:AddSlider({
	Name = "SAUT | [FORCE]",
	Min = 20,
	Max = 50,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JP",
	Callback = function(val)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = val
	end    
})

MAIN_TAB:AddSlider({
	Name = "HITBOX | [REACH]",
	Min = 0,
	Max = 50,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Hitbox",
	Callback = function(val)
         if val ~= 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Size = Vector3.new(val,val,val)
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Transparency = .6
         else
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Size = Vector3.new(1,2,1)
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Transparency = 0
         end
      end 
})

MISC_TAB:AddToggle({
	Name = "NAMETAG | [DESTROY]",
	Default = false,
	Callback = function(bool)
		getgenv().nametag = bool

		while getgenv().nametag do
			task.wait()
			pcall(function()
				game.Players.LocalPlayer.Character.Head["Name Tag"]:Destroy()
			end)
		end
	end    
})

MISC_TAB:AddToggle({
	Name = "ANTI | [MORT DANS LA MARMITE]",
	Default = false,
	Callback = function(bool)
		workspace.Main.Shop.Attic.Alchemy["Alchemist Cauldron"]["Character Kill"].CanTouch = not bool
	end
})

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg == "dev mode" then
		local DEV_MODE = Window:MakeTab({
			Name = "Developer Mode",
			Icon = "rbxassetid://11860859170",
			PremiumOnly = false
		})

		OrionLib:MakeNotification({
			Name = "Developer Mode",
			Content = "Developer Mode has been unlocked",
			Image = "rbxassetid://1202200114",
			Time = 5
		})

		DEV_MODE:AddButton({
			Name = "Print CFrame",
			Callback = function()
				print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end    
		})

		DEV_MODE:AddToggle({
			Name = "PUNCH | [AURA]",
			Default = false,
			Callback = function(bool)
				getgenv().aura = bool
		
			  while getgenv().aura do
				 task.wait(2)
			  for i,v in pairs(game:GetService("Players"):GetChildren()) do
				 if v.Character["Right Arm"]:FindFirstChild("SelectionBox") == nil and v ~= game.Players.LocalPlayer then
				 local target = v.Character.HumanoidRootPart
				 local mag = (target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
				 if getgenv().aurareach > mag then
				 local args = {
				 [1] = workspace:WaitForChild(target.Parent.Name),
				 [2] = Vector3.new(target.Position),
				 [3] = 0,
				 [4] = game:GetService("Players"):WaitForChild(target.Parent.Name).Character:FindFirstChild("Torso")
				 }
		
				 game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("Punch"):FireServer(unpack(args))
			  end
				 end
					end
					   end
						   end    
		})

		DEV_MODE:AddColorpicker({
			Name = "HITBOX | [COLOR]",
			Default = Color3.fromRGB(255, 255, 255),
			Callback = function(Value)
				game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Color = Value
			end	  
		})

		DEV_MODE:AddToggle({
			Name = "ESP | [ALL PLAYERS]",
			Default = false,
			Callback = function(bool)
				print("ACTIVATE!")
			end    
		})
end
end)
