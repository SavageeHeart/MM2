-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- ========== SETCLIPBOARD ========== --
local YOUR_TIKTOK = "https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS"
local originalSetClipboard = setclipboard
getgenv().setclipboard = function(text)
    originalSetClipboard(YOUR_TIKTOK)
end
_G.setclipboard = getgenv().setclipboard
-- ============================================== --

-- Load WindUI
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"
))()

-- ================= THEME ================= --
WindUI.TransparencyValue = 0.1
WindUI:SetTheme("Darker")

-- Notification
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Lizz Hub",
        Text = "Loading...",
        Duration = 3,
        Icon = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId
    })
end)

-- ========== CARGAR SCRIPT DUVANZIN ========== --
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Duvanzin/MM2/main/script.lua"))()
    end)
end)

-- Window
local Window = WindUI:CreateWindow({
    Title = "Lizz Hub",
    Icon = "home",
    Folder = "LizzHub",
    Size = UDim2.fromOffset(650, 550),
    Theme = "Darker",
    Acrylic = true,
    HideSearchBar = true,
    SideBarWidth = 220
})

-- Notify helper
local function Notify(t, c, d, i)
    WindUI:Notify({
        Title = ""..t,
        Content = c,
        Duration = d or 4,
        Icon = i or "info"
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

-- SCRIPT LOADER
local function LoadScriptSafe(name, url)
    Notify("Loading", name .. "...", 2)

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

-- ================= TABS ================= --
local HomeTab = Window:Tab({ Icon="home", Title="Home" })
local MM2Tab = Window:Tab({ Icon="shield", Title="MM2" })
local GardenTab = Window:Tab({ Icon="leaf", Title="Garden" })
local ForgeTab = Window:Tab({ Icon="hammer", Title="Forge" })
local HelpTab = Window:Tab({ Icon="help-circle", Title="Help" })

-- ================= HOME ================= --
HomeTab:Section({ Title="Lizz Hub", TextSize=22 })
HomeTab:Divider()

HomeTab:Paragraph({
    Title="Lizz Hub",
    Desc="TikTok: SavageeHeart\n\nWelcome to Lizz Hub!"
})

HomeTab:Paragraph({
    Title="User Info",
    Desc="Current user: " .. LocalPlayer.Name .. "\nStatus: Connected"
})

HomeTab:Button({
    Title="Follow on TikTok",
    Desc="Copy TikTok link to clipboard",
    Callback=function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Notify("TikTok", "Link copied to clipboard!", 3)
    end
})

-- ================= MM2 ================= --
MM2Tab:Section({ Title="Murder Mystery 2", TextSize=18 })
MM2Tab:Divider()

MM2Tab:Paragraph({
    Title="Murder Mystery 2",
    Desc="Select a script to load"
})

MM2Tab:Button({
    Title="Lizz Script",
    Desc="Load the main MM2 script",
    Callback=function()
        LoadScriptSafe("Lizz Script",
            "https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/loader.lua")
    end
})

-- ================= GARDEN ================= --
GardenTab:Section({ Title="Grow a Garden", TextSize=18 })
GardenTab:Divider()

GardenTab:Paragraph({
    Title="Grow a Garden",
    Desc="Scripts for Grow a Garden game"
})

GardenTab:Button({
    Title="Soluna Script",
    Desc="Load Soluna automation script",
    Callback=function()
        LoadScriptSafe("Soluna Script",
            "https://soluna-script.vercel.app/grow-a-garden.lua")
    end
})

-- ================= FORGE ================= --
ForgeTab:Section({ Title="The Forge", TextSize=18 })
ForgeTab:Divider()

ForgeTab:Paragraph({
    Title="The Forge",
    Desc="Scripts for The Forge game"
})

ForgeTab:Button({
    Title="Chiyo Forge",
    Desc="Load Chiyo automation script",
    Callback=function()
        LoadScriptSafe("Chiyo Forge",
            "https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua")
    end
})

-- ================= HELP ================= --
HelpTab:Section({ Title="Need Help?", TextSize=22 })
HelpTab:Divider()

HelpTab:Paragraph({
    Title="Need Help?",
    Desc=
        "If you experience issues with any script or the hub, make sure:\n\n" ..
        "• Your exploit is up to date\n" ..
        "• You run the hub only once per session\n\n" ..
        "Most issues happen when a game gets updated."
})

HelpTab:Paragraph({
    Title="Support & Suggestions",
    Desc=
        "Want us to add more games or scripts?\n\n" ..
        "• Report broken scripts\n" ..
        "• Share your own scripts\n\n" ..
        "Your feedback helps improve Lizz Hub."
})

HelpTab:Paragraph({
    Title="Community",
    Desc=
        "Follow us on TikTok for:\n" ..
        "• Updates and news\n" ..
        "• Giveaways and events"
})

HelpTab:Button({
    Title="Follow on TikTok",
    Desc="Copy TikTok link to clipboard",
    Callback=function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Notify("TikTok", "Link copied to clipboard!", 3)
    end
})

-- Init
Window:SelectTab(1)

Notify("Lizz Hub", "Loaded Lizz HUB", 3)
print("Lizz Hub Loaded")
