-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Orion Library (moderna y hermosa)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = "Lizz Hub",
    HidePremium = true,
    SaveConfig = false,
    IntroEnabled = false,
    Icon = "rbxassetid://4483345998"
})

-- Notificación
OrionLib:MakeNotification({
    Name = "Lizz Hub",
    Content = "Loaded successfully",
    Image = "rbxassetid://4483345998",
    Time = 3
})

-- HOME TAB
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local HomeSection = HomeTab:AddSection({
    Name = "Welcome to Lizz Hub"
})

HomeTab:AddParagraph("Lizz Hub", "This Universal Script Hub provides safe, stable, and optimized scripts for multiple popular Roblox games.\n\nTikTok: SavageeHeart")

HomeTab:AddParagraph("User Info", "Current user: " .. LocalPlayer.Name .. "\nStatus: Connected")

HomeTab:AddButton({
    Name = "Follow on TikTok",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        OrionLib:MakeNotification({
            Name = "TikTok",
            Content = "Link copied to clipboard!",
            Time = 3
        })
    end    
})

-- MM2 TAB
local MM2Tab = Window:MakeTab({
    Name = "MM2",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MM2Section = MM2Tab:AddSection({
    Name = "Murder Mystery 2"
})

MM2Tab:AddButton({
    Name = "Capybara Hub",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Loading",
            Content = "Loading Capybara Hub...",
            Time = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
        end)
    end    
})

MM2Tab:AddButton({
    Name = "Overdrive Hub",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Loading",
            Content = "Loading Overdrive Hub...",
            Time = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
        end)
    end    
})

-- GARDEN TAB
local GardenTab = Window:MakeTab({
    Name = "Garden",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local GardenSection = GardenTab:AddSection({
    Name = "Grow a Garden"
})

GardenTab:AddButton({
    Name = "Soluna Script",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Loading",
            Content = "Loading Soluna Script...",
            Time = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
        end)
    end    
})

-- FORGE TAB
local ForgeTab = Window:MakeTab({
    Name = "Forge",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local ForgeSection = ForgeTab:AddSection({
    Name = "The Forge"
})

ForgeTab:AddButton({
    Name = "Chiyo Forge",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Loading",
            Content = "Loading Chiyo Forge...",
            Time = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
        end)
    end    
})

-- HELP TAB
local HelpTab = Window:MakeTab({
    Name = "Help",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local HelpSection = HelpTab:AddSection({
    Name = "Support & Help"
})

HelpTab:AddParagraph("Need Help?", "If you experience issues with any script or the hub, make sure:\n\n• Your exploit is up to date\n• You run the hub only once per session\n\nMost issues happen when a game gets updated.")

HelpTab:AddParagraph("Support & Suggestions", "Want us to add more games or scripts?\n\n• Report broken scripts\n• Share your own scripts\n\nYour feedback helps improve Lizz Hub.")

HelpTab:AddParagraph("Community", "Follow us on TikTok for:\n• Updates and news\n• Giveaways and events")

HelpTab:AddButton({
    Name = "Follow on TikTok",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        OrionLib:MakeNotification({
            Name = "TikTok",
            Content = "Link copied to clipboard!",
            Time = 3
        })
    end    
})

-- Init
OrionLib:Init()

print("Lizz Hub Loaded")
