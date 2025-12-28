-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Mercury UI (moderna, hermosa y estable)
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

-- Create GUI
local GUI = Mercury:Create{
    Name = "Lizz Hub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://www.tiktok.com/@savageeheart"
}

-- Notificación
GUI:Notification{
    Title = "Lizz Hub",
    Text = "Loaded successfully",
    Duration = 3,
    Callback = function() end
}

-- HOME TAB
local HomeTab = GUI:Tab{
    Name = "Home",
    Icon = "rbxassetid://8569322835"
}

HomeTab:Label{
    Text = "Welcome to Lizz Hub",
    Style = 1
}

HomeTab:Seperator()

HomeTab:Label{
    Text = "Lizz Hub",
    Style = 2
}

HomeTab:Label{
    Text = "This Universal Script Hub provides safe, stable, and optimized scripts for multiple popular Roblox games.",
    Style = 0
}

HomeTab:Label{
    Text = "TikTok: SavageeHeart",
    Style = 0
}

HomeTab:Seperator()

HomeTab:Label{
    Text = "User Info",
    Style = 2
}

HomeTab:Label{
    Text = "Current user: " .. LocalPlayer.Name,
    Style = 0
}

HomeTab:Label{
    Text = "Status: Connected",
    Style = 0
}

HomeTab:Seperator()

HomeTab:Button{
    Name = "Follow on TikTok",
    Description = "Copy TikTok link",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        GUI:Notification{
            Title = "TikTok",
            Text = "Link copied to clipboard!",
            Duration = 3
        }
    end
}

-- MM2 TAB
local MM2Tab = GUI:Tab{
    Name = "MM2",
    Icon = "rbxassetid://8569322835"
}

MM2Tab:Label{
    Text = "Murder Mystery 2",
    Style = 1
}

MM2Tab:Seperator()

MM2Tab:Button{
    Name = "Capybara Hub",
    Description = "Silent Aim/Knife, ESP",
    Callback = function()
        GUI:Notification{
            Title = "Loading",
            Text = "Loading Capybara Hub...",
            Duration = 2
        }
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
        end)
    end
}

MM2Tab:Button{
    Name = "Overdrive Hub",
    Description = "Silent Aim/Knife, ESP",
    Callback = function()
        GUI:Notification{
            Title = "Loading",
            Text = "Loading Overdrive Hub...",
            Duration = 2
        }
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
        end)
    end
}

-- GARDEN TAB
local GardenTab = GUI:Tab{
    Name = "Garden",
    Icon = "rbxassetid://8569322835"
}

GardenTab:Label{
    Text = "Grow a Garden",
    Style = 1
}

GardenTab:Seperator()

GardenTab:Button{
    Name = "Soluna Script",
    Description = "Automation features for farming",
    Callback = function()
        GUI:Notification{
            Title = "Loading",
            Text = "Loading Soluna Script...",
            Duration = 2
        }
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
        end)
    end
}

-- FORGE TAB
local ForgeTab = GUI:Tab{
    Name = "Forge",
    Icon = "rbxassetid://8569322835"
}

ForgeTab:Label{
    Text = "The Forge",
    Style = 1
}

ForgeTab:Seperator()

ForgeTab:Button{
    Name = "Chiyo Forge",
    Description = "Quest Automation, Auto Forge, Auto Sell",
    Callback = function()
        GUI:Notification{
            Title = "Loading",
            Text = "Loading Chiyo Forge...",
            Duration = 2
        }
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
        end)
    end
}

-- HELP TAB
local HelpTab = GUI:Tab{
    Name = "Help",
    Icon = "rbxassetid://8569322835"
}

HelpTab:Label{
    Text = "Support & Help",
    Style = 1
}

HelpTab:Seperator()

HelpTab:Label{
    Text = "Need Help?",
    Style = 2
}

HelpTab:Label{
    Text = "If you experience issues with any script or the hub, make sure:",
    Style = 0
}

HelpTab:Label{
    Text = "• Your exploit is up to date",
    Style = 0
}

HelpTab:Label{
    Text = "• You run the hub only once per session",
    Style = 0
}

HelpTab:Label{
    Text = "Most issues happen when a game gets updated.",
    Style = 0
}

HelpTab:Seperator()

HelpTab:Label{
    Text = "Support & Suggestions",
    Style = 2
}

HelpTab:Label{
    Text = "Want us to add more games or scripts?",
    Style = 0
}

HelpTab:Label{
    Text = "• Report broken scripts",
    Style = 0
}

HelpTab:Label{
    Text = "• Share your own scripts",
    Style = 0
}

HelpTab:Label{
    Text = "Your feedback helps improve Lizz Hub.",
    Style = 0
}

HelpTab:Seperator()

HelpTab:Label{
    Text = "Community",
    Style = 2
}

HelpTab:Label{
    Text = "Follow us on TikTok for:",
    Style = 0
}

HelpTab:Label{
    Text = "• Updates and news",
    Style = 0
}

HelpTab:Label{
    Text = "• Giveaways and events",
    Style = 0
}

HelpTab:Seperator()

HelpTab:Button{
    Name = "Follow on TikTok",
    Description = "Copy TikTok link",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        GUI:Notification{
            Title = "TikTok",
            Text = "Link copied to clipboard!",
            Duration = 3
        }
    end
}

print("Lizz Hub Loaded")
