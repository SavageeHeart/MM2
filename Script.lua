-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Kavo UI (se minimiza como botón flotante)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create Window
local Window = Library.CreateLib("Lizz Hub", "BloodTheme")

-- ==================== HOME TAB ====================
local HomeTab = Window:NewTab("Home")
local HomeSection = HomeTab:NewSection("Welcome to Lizz Hub")

HomeSection:NewLabel("Lizz Hub")
HomeSection:NewLabel("This Universal Script Hub provides")
HomeSection:NewLabel("safe, stable, and optimized scripts")
HomeSection:NewLabel("for multiple popular Roblox games.")
HomeSection:NewLabel(" ")
HomeSection:NewLabel("TikTok: SavageeHeart")

local UserSection = HomeTab:NewSection("User Info")
UserSection:NewLabel("User: " .. LocalPlayer.Name)
UserSection:NewLabel("Status: Connected")
UserSection:NewButton("Follow on TikTok", "Copy TikTok link", function()
    setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
    game.StarterGui:SetCore("SendNotification", {
        Title = "TikTok",
        Text = "Link copied to clipboard!",
        Duration = 3
    })
end)

-- ==================== MM2 TAB ====================
local MM2Tab = Window:NewTab("MM2")
local MM2Section = MM2Tab:NewSection("Murder Mystery 2")

MM2Section:NewLabel("Select a script to load for MM2")

MM2Section:NewButton("Capybara Hub", "Silent Aim/Knife, ESP", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "Loading Capybara Hub...",
        Duration = 2
    })
    task.spawn(function()
        task.wait(0.5)
        loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
    end)
end)

MM2Section:NewButton("Overdrive Hub", "Silent Aim/Knife, ESP", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "Loading Overdrive Hub...",
        Duration = 2
    })
    task.spawn(function()
        task.wait(0.5)
        loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
    end)
end)

-- ==================== GARDEN TAB ====================
local GardenTab = Window:NewTab("Garden")
local GardenSection = GardenTab:NewSection("Grow a Garden")

GardenSection:NewLabel("Automation features for farming")

GardenSection:NewButton("Soluna Script", "Automation features", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "Loading Soluna Script...",
        Duration = 2
    })
    task.spawn(function()
        task.wait(0.5)
        loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
    end)
end)

-- ==================== FORGE TAB ====================
local ForgeTab = Window:NewTab("Forge")
local ForgeSection = ForgeTab:NewSection("The Forge")

ForgeSection:NewLabel("Quest automation and farming")

ForgeSection:NewButton("Chiyo Forge", "Auto Forge, Auto Sell", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Loading",
        Text = "Loading Chiyo Forge...",
        Duration = 2
    })
    task.spawn(function()
        task.wait(0.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
    end)
end)

-- ==================== HELP TAB ====================
local HelpTab = Window:NewTab("Help")
local HelpSection1 = HelpTab:NewSection("Need Help?")

HelpSection1:NewLabel("If you experience issues with any")
HelpSection1:NewLabel("script or the hub, make sure:")
HelpSection1:NewLabel(" ")
HelpSection1:NewLabel("• Your exploit is up to date")
HelpSection1:NewLabel("• You run the hub only once")
HelpSection1:NewLabel(" ")
HelpSection1:NewLabel("Most issues happen when a game")
HelpSection1:NewLabel("gets updated.")

local HelpSection2 = HelpTab:NewSection("Support & Suggestions")

HelpSection2:NewLabel("Want us to add more games or scripts?")
HelpSection2:NewLabel(" ")
HelpSection2:NewLabel("• Report broken scripts")
HelpSection2:NewLabel("• Share your own scripts")
HelpSection2:NewLabel(" ")
HelpSection2:NewLabel("Your feedback helps improve Lizz Hub.")

local CommunitySection = HelpTab:NewSection("Community")

CommunitySection:NewLabel("Follow us on TikTok for:")
CommunitySection:NewLabel("• Updates and news")
CommunitySection:NewLabel("• Giveaways and events")

CommunitySection:NewButton("Follow on TikTok", "Copy TikTok link", function()
    setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
    game.StarterGui:SetCore("SendNotification", {
        Title = "TikTok",
        Text = "Link copied to clipboard!",
        Duration = 3
    })
end)

print("Lizz Hub Loaded")
