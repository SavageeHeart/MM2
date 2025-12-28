-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- ========== SETCLIPBOARD ========== --
local YOUR_TIKTOK = "https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS"
local originalSetClipboard = setclipboard

getgenv().setclipboard = function(text)
    if text == YOUR_TIKTOK then
        originalSetClipboard(text)
    end
end
_G.setclipboard = getgenv().setclipboard
-- ============================================== --


-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Load WindUI
print("Cargando WindUI...")
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"
))()
print("WindUI cargado!")

-- ================= THEME ================= --
WindUI.TransparencyValue = 0.1
WindUI:SetTheme("Purple")

-- Notification
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Lizz Hub",
        Text = "Loading...",
        Duration = 3,
        Icon = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId
    })
end)

-- Window
print("Creando ventana...")
local Window = WindUI:CreateWindow({
    Title = "Lizz Hub",
    Icon = "heart",
    Folder = "LizzHub",
    Size = UDim2.fromOffset(650, 550),
    Theme = "Purple",
    Acrylic = false,
    HideSearchBar = true,
    SideBarWidth = 220,
    BackgroundImage = "rbxassetid://15471251231",
    BackgroundImageTransparency = 0.85
})
print("Ventana creada!")

-- Notify helper
local function Notify(t, c, d, i)
    WindUI:Notify({
        Title = ""..t,
        Content = c,
        Duration = d or 4,
        Icon = i or "heart"
    })
end

local function SafeDestroyWindow()
    if Window then
        pcall(function()
            Window:Destroy()
        end)
        Window = nil
    end
end


-- SCRIPT LOADER MEJORADO
local function LoadScriptSafe(name, url)
    Notify("Loading", name .. "...⏳", 2)

    task.spawn(function()
        local ok, err = pcall(function()
            SafeDestroyWindow()
            
            pcall(function()
                getgenv().WindUI = nil
            end)
            
            task.wait(0.5)
            loadstring(game:HttpGet(url))()
        end)

        if not ok then
            pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = "Error loading " .. name,
                    Text = tostring(err),
                    Duration = 6
                })
            end)
            
            getgenv().LizzHubLoaded = false
        end
    end)
end

-- ALTERNATIVA: Loader SIN cerrar el hub
local function LoadScriptKeepHub(name, url)
    Notify("Loading", name .. " (Background)...⏳", 2)

    task.spawn(function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)

        if not ok then
            Notify("Error", "Failed to load " .. name, 5, "alert-triangle")
            pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = "Error loading " .. name,
                    Text = tostring(err),
                    Duration = 6
                })
            end)
        else
            Notify("Success", name .. " loaded!", 3, "check")
        end
    end)
end

-- ================= TABS ================= --
print("Creando tabs...")
local HomeTab      = Window:Tab({ Icon="home", Title="Home" })
local MM2Tab       = Window:Tab({ Icon="swords", Title="MM2" })
local GardenTab    = Window:Tab({ Icon="sprout", Title="Garden" })
local ForgeTab     = Window:Tab({ Icon="pickaxe", Title="Forge" })
local HelpTab      = Window:Tab({ Icon="heart", Title="Help" })
print("Tabs creados!")

-- ================= HOME ================= --
HomeTab:Section({ Title="Welcome to Lizz Hub", TextSize=22 })
HomeTab:Divider()

HomeTab:Paragraph({
    Title="Lizz Hub",
    Desc=
        "This Universal Script Hub provides safe, stable, and optimized " ..
        "scripts for multiple popular Roblox games.\n\n" ..
        "Main features:\n" ..
        "Verified and tested scripts\n" ..
        "Frequent updates\n" ..
        "Compatible with most executors\n\n" ..
        "TikTok: SavageeHeart"
})

HomeTab:Paragraph({
    Title="User Info",
    Desc=
        "Current user:\n" ..
        LocalPlayer.Name .. "\n" ..
        "Status: Connected"
})

HomeTab:Button({
    Title="Follow on TikTok",
    Desc="Follow us for updates",
    Callback=function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Notify("TikTok","Link copied to clipboard",3)
    end
})


-- ================= MM2 ================= --
MM2Tab:Section({ Title="Murder Mystery 2", TextSize=18 })
MM2Tab:Divider()

MM2Tab:Button({
    Title="Capybara Hub (Keep Open)",
    Desc  = "Silent Aim/Knife, ESP - Hub stays open",
    Callback=function()
        LoadScriptSafe("Capybara Hub",
            "https://pastebin.com/raw/3Pvr5Pfy")
    end
})

MM2Tab:Button({
    Title="Overdrive Hub (Keep Open)",
    Desc  = "Silent Aim/Knife, ESP - Hub stays open",
    Callback=function()
        LoadScriptSafe("Overdrive Hub",
            "https://api.overdrivehub.xyz/v1/auth")
    end
})

-- ================= GARDEN ================= --
GardenTab:Section({ Title="Grow a Garden", TextSize=18 })
GardenTab:Divider()

GardenTab:Button({
    Title="Soluna Script",
    Desc  = "Automation features for farming",
    Callback=function()
        LoadScriptSafe("Soluna Garden",
            "https://soluna-script.vercel.app/grow-a-garden.lua")
    end
})

-- ================= FORGE ================= --
ForgeTab:Section({ Title="The Forge", TextSize=18 })
ForgeTab:Divider()

ForgeTab:Button({
    Title="Chiyo Forge",
    Desc  = "Quest Automation, Auto Forge, Auto Sell and more",
    Callback=function()
        LoadScriptSafe("Chiyo Forge",
            "https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua")
    end
})

-- ================= HELP ================= --
HelpTab:Section({ Title="Support & Help", TextSize=22 })
HelpTab:Divider()

HelpTab:Paragraph({
    Title="Need Help?",
    Desc=
        "If you experience issues with any script or the hub, make sure:\n\n" ..
        "Your exploit is up to date\n" ..
        "You run the hub only once per session\n\n" ..
        "Most issues happen when a game gets updated."
})

HelpTab:Paragraph({
    Title="Support & Suggestions",
    Desc=
        "Want us to add more games or scripts?\n\n" ..
        "Report broken scripts\n" ..
        "Share your own scripts\n\n" ..
        "Your feedback helps improve Lizz Hub."
})

HelpTab:Paragraph({
    Title="Community",
    Desc=
        "Follow us on TikTok for:\n" ..
        "Updates and news\n" ..
        "Giveaways and events"
})

HelpTab:Button({
    Title="Follow on TikTok",
    Desc="Follow us for updates",
    Callback=function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Notify("TikTok","Link copied to clipboard",3)
    end
})

-- Init
Window:SelectTab(1)
Window:UnlockAll()

print("Lizz Hub Loaded")
