  local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()


--Sense ESP Settings
Sense.teamSettings.enemy.enabled = true
Sense.teamSettings.enemy.box = true
Sense.teamSettings.enemy.boxColor[1] = Color3.new(0, 0.25, 0.75)
Sense.teamSettings.enemy.chams = true
Sense.teamSettings.enemy.chamsFillColor = Color3.new(1, 0.250980, 0.250980)
Sense.teamSettings.enemy.healthText = true
Sense.teamSettings.enemy.healthBar = true
Sense.teamSettings.enemy.healthyColor = Color3.new(0,1,0)

local CustomTheme = {
    TextColor = Color3.fromRGB(210, 220, 210),
    
    Background = Color3.fromRGB(10, 15, 12),
    Topbar = Color3.fromRGB(15, 25, 20),
    Shadow = Color3.fromRGB(5, 8, 6),
    
    NotificationBackground = Color3.fromRGB(12, 18, 15),
    NotificationActionsBackground = Color3.fromRGB(220, 230, 225),
    
    TabBackground = Color3.fromRGB(15, 20, 17),
    TabStroke = Color3.fromRGB(40, 60, 50),
    TabBackgroundSelected = Color3.fromRGB(25, 40, 32),
    TabTextColor = Color3.fromRGB(160, 170, 165),
    SelectedTabTextColor = Color3.fromRGB(230, 240, 235),
    
    ElementBackground = Color3.fromRGB(20, 25, 22),
    ElementBackgroundHover = Color3.fromRGB(25, 30, 27),
    SecondaryElementBackground = Color3.fromRGB(18, 23, 20),
    ElementStroke = Color3.fromRGB(30, 40, 35),
    SecondaryElementStroke = Color3.fromRGB(28, 35, 31),
    
    SliderBackground = Color3.fromRGB(25, 35, 30),
    SliderProgress = Color3.fromRGB(40, 80, 60),
    SliderStroke = Color3.fromRGB(45, 90, 67),
    
    ToggleBackground = Color3.fromRGB(18, 23, 20),
    ToggleEnabled = Color3.fromRGB(40, 100, 70),
    ToggleDisabled = Color3.fromRGB(50, 60, 55),
    ToggleEnabledStroke = Color3.fromRGB(50, 120, 85),
    ToggleDisabledStroke = Color3.fromRGB(60, 70, 65),
    ToggleEnabledOuterStroke = Color3.fromRGB(30, 45, 37),
    ToggleDisabledOuterStroke = Color3.fromRGB(25, 30, 27),
    
    DropdownSelected = Color3.fromRGB(25, 30, 27),
    DropdownUnselected = Color3.fromRGB(20, 25, 22),
    
    InputBackground = Color3.fromRGB(20, 25, 22),
    InputStroke = Color3.fromRGB(30, 40, 35),
    PlaceholderColor = Color3.fromRGB(100, 110, 105)
    }

local Window = Rayfield:CreateWindow({
    Name = "Vexxis Alpha",
    LoadingTitle = "Initializing...",
    LoadingSubtitle = "by Thrinyxt",
    Theme = CustomTheme,
    ConfigurationSaving = {
    Enabled = true,
    FolderName = nil,
    FileName = "Vexxis"
    },
    Discord ={
        Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
        Invite = "uusn8yjs2z", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true,
    KeySettings = {
        Title = "Vexxis Alpha",
        Subtitle = "Key .gg/uusn8yjs2z",
        Note = "This Hub Is In Pre-Alpha Stage Not Recommended",
        Key = "Cat"
    }
})


--Tabs
local GameScirpts = Window:CreateTab("Game Scripts")
local Universal = Window:CreateTab("Universal Scripts", 6035067748)
local PlayerTab = Window:CreateTab("Player", 76766945566598)
local Tab3 = Window:CreateTab("Other", 6035067748)
local Settings = Window:CreateTab("Settings", "settings")


local function IfWalkspeedErrors(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end

local function IfJumpPowerErrors(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
end

local function PlayerGravity()
    workspace.Gravity = 196.2
end

local function IfPlayerGravityErrors(Value)
    workspace.Gravity = Value
end


function GetShortenedPlrFromName(name)
    name = string.lower(tostring(name))
 
    if not game:GetService("Players"):FindFirstChild("me") and name == "me" or game:GetService("Players"):FindFirstChild("me") and game:GetService("Players"):FindFirstChild("me").ClassName ~= "Player" and name == "me" then
        return {player}
    end
    if not game:GetService("Players"):FindFirstChild("all") and name == "all" or game:GetService("Players"):FindFirstChild("all") and game:GetService("Players"):FindFirstChild("all").ClassName ~= "Player" and name == "all" then
        return game:GetService("Players"):GetPlayers()
    end
    if not game:GetService("Players"):FindFirstChild("others") and name == "others" or game:GetService("Players"):FindFirstChild("others") and game:GetService("Players"):FindFirstChild("others").ClassName ~= "Player" and name == "others" then
        name = game:GetService("Players"):GetPlayers()
        for i, v in pairs(name) do
            if v == player then
                table.remove(name, i)
            end
        end
        return name
    end
 
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.lower(string.sub(v.DisplayName, 1, #name)) == name or string.lower(string.sub(v.Name, 1, #name)) == name then
            return {v}
        end
    end
 
    return nil
end


PlayerTab:CreateSection("This is my first Script ||| https://github.com/thrinyxt")

PlayerTab:CreateInput({
    Name = "Player Speed(Leave Blank For Default)",
    PlaceholderText = "Enter Speed Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        if Value ~= "" then
            if Players.LocalPlayer.Character.Humanoid.WalkSpeed == Value then
                Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            else
                IfWalkspeedErrors(Value)
            end
        else
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    
    end
})

PlayerTab:CreateInput({
    Name = "Jump Power(Leave Blank For Default)",
    PlaceholderText = "Enter Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        if Value ~= "" then
            if Players.LocalPlayer.Character.Humanoid.JumpPower == Value then
                Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            else
                IfJumpPowerErrors(Value)
            end
        else
            Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
        
    end
})

PlayerTab:CreateInput({
    Name = "FOV(default Is 70)",  
    PlaceholderText = "FOV",
   RemoveTextAfterFocusLost = false,
   Callback = function(Value)
        local Camera = workspace.CurrentCamera
        Camera.FieldOfView = Value
   end,
})

PlayerTab:CreateSlider({
    Name = "Health",  
       Range = {1, 100},
       Increment = 1,
       Suffix = "%",
       CurrentValue = 100,
       Flag = "Slider2",
       Callback = function(Value)
            Players.LocalPlayer.Character.Humanoid.Health = Value
       end,
})
PlayerTab:CreateInput({
    Name = "Gravity",
    PlaceholderText = "Enter Value Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        if workspace.Gravity == Value then
            workspace.Gravity = Value
        else
            IfPlayerGravityErrors(Value)
        end
    end
})

PlayerTab:CreateButton({
    Name = "Reset Gravity",
    Desc = "Press",
    Callback = function()
        if workspace.Gravity == workspace.Gravity then
            workspace.Gravity = 196.2
        else 
            PlayerGravity()
        end
    end,
})

PlayerTab:CreateButton({
    Name = "Respawn",
    Desc = "Press",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
    end,
})

PlayerTab:CreateInput({
    Name = "Player TP",
    PlaceholderText = "Username(can be half)",
    RemoveTextAfterFocusLost = false,
    Callback = function(Value)
        if type(GetShortenedPlrFromName(Value)) == type({}) then
            for i,Player in GetShortenedPlrFromName(Value) do
                if Player.Character.HumanoidRootPart ~= nil then 
                    print("Teleported to", Player.DisplayName)
                player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
                end
            end
    end
})



Universal:CreateButton({
    Name = "Infinite Yield",
    Desc = "Press",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

Universal:CreateButton({
    Name = "User Creation: Chat Bypasser",
    Desc = "Press",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1price/usercreation/refs/heads/main/UserCreation.lua", true))()
    end
})

Universal:CreateButton({
    Name = "Nameless Admin",
    Desc = "Press",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
    end,
})

Universal:CreateButton({
    Name = "SystemBroken",
    Desc = "Press",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end,
})

local toogleEsp = PlayerTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value == true then
            Sense.Load()
        else
            Sense.Unload()
        end
    end
})



Tab3:CreateSlider({
    Name = "Time Of day",
    Range = {0, 24},
    Increment = 1,
    Suffix = "",
    CurrentValue = 12,
    Flag = "Slider1",
    Callback = function(Value)
        game.Lighting.ClockTime = Value
    end,
})

local Player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local IsInfJumping = false

local function infiniteJump()
    if IsInfJumping then
        Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    else
        return
    end 
end


PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        IsInfJumping = Value
        if Value then
            UserInputService.JumpRequest:Connect(infiniteJump)
        end
    end

})

local CanNoclip = false
local player = game.Players.LocalPlayer

PlayerTab:CreateToggle({
Name = "NoClip",
CurrentValue = false,
Callback = function(Value)
CanNoclip = Value
end
})

function NoClipping()
if not player.Character then return end
for _, child in pairs(player.Character:GetDescendants()) do
if child:IsA("BasePart") then
child.CanCollide = CanNoclip
end
end
end

game:GetService("RunService").Stepped:Connect(NoClipping)

GameScirpts:CreateButton({
    Name = "Murder Mystery 2",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "Murder Mystery 2 isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})

GameScirpts:CreateButton({
    Name = "Evade",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "Evade isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "BrookHaven",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "BrookHaven isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "The Strongest BattleGround",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "The Strongest BattleGround isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "BedWars",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "BedWars isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "Adopt Me",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "Adopt Me isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "Work At A Pizza Place",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "Work At A Pizza Place isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})
GameScirpts:CreateButton({
    Name = "Tower Of Hell",
    Callback = function()
        Rayfield:Notify({
            Title = "Not Implemented Yet",
            Content = "Tower Of Hell isn't Created Yet Sorry",
            Duration = 6.5,
            Image = "shield-alert",
            })
    end
})



--[[local ColorPicker = PlayerTab:CreateColorPicker({
    Name = "Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place every time the color picker is moved/changed
        -- The variable (Value) is a Color3fromRGB value based on which color is selected
    end
})--]]

Rayfield:LoadConfiguration()
