-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Intentar cargar Rayfield con múltiples URLs
local Rayfield
local success = false

-- Intento 1: Sirius
pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    success = true
end)

-- Intento 2: GitHub oficial
if not success then
    pcall(function()
        Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
        success = true
    end)
end

-- Intento 3: Pastebin backup
if not success then
    pcall(function()
        Rayfield = loadstring(game:HttpGet('https://pastebin.com/raw/XC3K6TdB'))()
        success = true
    end)
end

if not success or not Rayfield then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Error",
        Text = "Failed to load UI library. Try another executor.",
        Duration = 5
    })
    return
end

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "Lizz Hub",
   LoadingTitle = "Lizz Hub",
   LoadingSubtitle = "Loading",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- HOME TAB
local HomeTab = Window:CreateTab("Home", 4483362458)
local HomeSection = HomeTab:CreateSection("Welcome to Lizz Hub")

HomeTab:CreateParagraph({Title = "Lizz Hub", Content = "This Universal Script Hub provides safe, stable, and optimized scripts for multiple popular Roblox games.\n\nTikTok: SavageeHeart"})

HomeTab:CreateParagraph({Title = "User Info", Content = "Current user: " .. LocalPlayer.Name .. "\nStatus: Connected"})

HomeTab:CreateButton({
   Name = "Follow on TikTok",
   Callback = function()
      setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
      Rayfield:Notify({
         Title = "TikTok",
         Content = "Link copied to clipboard!",
         Duration = 3,
         Image = 4483362458
      })
   end,
})

-- MM2 TAB
local MM2Tab = Window:CreateTab("MM2", 4483362458)
local MM2Section = MM2Tab:CreateSection("Murder Mystery 2")

MM2Tab:CreateButton({
   Name = "Capybara Hub",
   Callback = function()
      Rayfield:Notify({
         Title = "Loading",
         Content = "Loading Capybara Hub",
         Duration = 2,
         Image = 4483362458
      })
      task.spawn(function()
         task.wait(0.5)
         loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
      end)
   end,
})

MM2Tab:CreateButton({
   Name = "Overdrive Hub",
   Callback = function()
      Rayfield:Notify({
         Title = "Loading",
         Content = "Loading Overdrive Hub",
         Duration = 2,
         Image = 4483362458
      })
      task.spawn(function()
         task.wait(0.5)
         loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
      end)
   end,
})

-- GARDEN TAB
local GardenTab = Window:CreateTab("Garden", 4483362458)
local GardenSection = GardenTab:CreateSection("Grow a Garden")

GardenTab:CreateButton({
   Name = "Soluna Script",
   Callback = function()
      Rayfield:Notify({
         Title = "Loading",
         Content = "Loading Soluna Script",
         Duration = 2,
         Image = 4483362458
      })
      task.spawn(function()
         task.wait(0.5)
         loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
      end)
   end,
})

-- FORGE TAB
local ForgeTab = Window:CreateTab("Forge", 4483362458)
local ForgeSection = ForgeTab:CreateSection("The Forge")

ForgeTab:CreateButton({
   Name = "Chiyo Forge",
   Callback = function()
      Rayfield:Notify({
         Title = "Loading",
         Content = "Loading Chiyo Forge",
         Duration = 2,
         Image = 4483362458
      })
      task.spawn(function()
         task.wait(0.5)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
      end)
   end,
})

-- HELP TAB
local HelpTab = Window:CreateTab("Help", 4483362458)
local HelpSection = HelpTab:CreateSection("Support & Help")

HelpTab:CreateParagraph({Title = "Need Help?", Content = "If you experience issues with any script or the hub, make sure:\n\n• Your exploit is up to date\n• You run the hub only once per session\n\nMost issues happen when a game gets updated."})

HelpTab:CreateParagraph({Title = "Support & Suggestions", Content = "Want us to add more games or scripts?\n\n• Report broken scripts\n• Share your own scripts\n\nYour feedback helps improve Lizz Hub."})

HelpTab:CreateParagraph({Title = "Community", Content = "Follow us on TikTok for:\n• Updates and news\n• Giveaways and events"})

HelpTab:CreateButton({
   Name = "Follow on TikTok",
   Callback = function()
      setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
      Rayfield:Notify({
         Title = "TikTok",
         Content = "Link copied to clipboard!",
         Duration = 3,
         Image = 4483362458
      })
   end,
})

Rayfield:Notify({
   Title = "Lizz Hub",
   Content = "Loaded successfully!",
   Duration = 3,
   Image = 4483362458
})

print("Lizz Hub Loaded")
