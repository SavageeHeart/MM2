-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ========== SETCLIPBOARD ========== --
local YOUR_TIKTOK = "https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS"
local originalSetClipboard = setclipboard
getgenv().setclipboard = function(text)
    originalSetClipboard(YOUR_TIKTOK)
end
_G.setclipboard = getgenv().setclipboard
-- ============================================== --

-- ========== CARGAR WINDUI Y SCRIPT ========== --
task.spawn(function()
    -- Cargar WindUI Library con sistema de key
    local Wind = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"
    ))()
    
    -- ========== CREAR INTERFAZ PRINCIPAL CON KEY SYSTEM ========== --
    local Window = Wind:CreateWindow({
        Title = "Lizz Hub",
        Icon = "rbxassetid://10734950020",
        Author = "SavageeHeart",
        Folder = "LizzHub",
        Size = UDim2.fromOffset(580, 460),
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 170,
        KeySystem = true,
        Key = "Lizz",
        KeyLink = "https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS",
        KeyNote = "Follow TikTok to get the key!"
    })
    
    -- Ejecutar Duvanzin después de pasar el key system
    task.wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Duvanzin/MM2/main/script.lua"))()
    
    -- Función para cerrar la interfaz
    local function CloseHub()
        if Window then
            Window:Destroy()
        end
        getgenv().LizzHubLoaded = false
    end

    -- ========== HOME TAB ========== --
    local HomeTab = Window:Tab({
        Title = "Home",
        Icon = "home"
    })

    local HomeSection = HomeTab:Section({
        Title = "Welcome to Lizz Hub"
    })

    HomeSection:Label({
        Text = "TikTok: SavageeHeart"
    })

    HomeSection:Label({
        Text = "Current User: " .. LocalPlayer.Name
    })

    HomeSection:Label({
        Text = "Status: Connected ✓"
    })

    HomeSection:Button({
        Title = "Follow on TikTok",
        Desc = "Copy TikTok link to clipboard",
        Callback = function()
            setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
            Wind:Notification({
                Title = "TikTok",
                Description = "Link copied to clipboard!",
                Duration = 3
            })
        end
    })

    -- ========== MM2 TAB ========== --
    local MM2Tab = Window:Tab({
        Title = "MM2",
        Icon = "shield"
    })

    local MM2Section = MM2Tab:Section({
        Title = "Murder Mystery 2"
    })

    MM2Section:Label({
        Text = "Main scripts for MM2"
    })

    MM2Section:Button({
        Title = "Lizz Script",
        Desc = "Load the main MM2 script",
        Callback = function()
            Wind:Notification({
                Title = "Loading",
                Description = "Loading Lizz Script...",
                Duration = 2
            })
            loadstring(game:HttpGet('https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/loader.lua', true))()
        end
    })

    MM2Section:Button({
        Title = "Duvanzin Script",
        Desc = "Alternative MM2 script",
        Callback = function()
            Wind:Notification({
                Title = "Loading",
                Description = "Loading Duvanzin Script...",
                Duration = 2
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Duvanzin/MM2/main/script.lua"))()
        end
    })

    -- ========== GARDEN TAB ========== --
    local GardenTab = Window:Tab({
        Title = "Garden",
        Icon = "leaf"
    })

    local GardenSection = GardenTab:Section({
        Title = "Grow a Garden"
    })

    GardenSection:Label({
        Text = "Automation scripts for Garden game"
    })

    GardenSection:Button({
        Title = "Soluna Script",
        Desc = "Load Soluna automation script",
        Callback = function()
            Wind:Notification({
                Title = "Loading",
                Description = "Loading Soluna Script...",
                Duration = 2
            })
            loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
        end
    })

    -- ========== FORGE TAB ========== --
    local ForgeTab = Window:Tab({
        Title = "Forge",
        Icon = "hammer"
    })

    local ForgeSection = ForgeTab:Section({
        Title = "The Forge"
    })

    ForgeSection:Label({
        Text = "Scripts for The Forge game"
    })

    ForgeSection:Button({
        Title = "Chiyo Forge",
        Desc = "Load Chiyo automation script",
        Callback = function()
            Wind:Notification({
                Title = "Loading",
                Description = "Loading Chiyo Forge...",
                Duration = 2
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
        end
    })

    -- ========== HELP TAB ========== --
    local HelpTab = Window:Tab({
        Title = "Help",
        Icon = "help-circle"
    })

    local HelpSection = HelpTab:Section({
        Title = "Need Help?"
    })

    HelpSection:Label({
        Text = "If you experience issues:"
    })

    HelpSection:Label({
        Text = "• Your exploit must be up to date"
    })

    HelpSection:Label({
        Text = "• Run the hub only once per session"
    })

    HelpSection:Label({
        Text = "• Check if the game was recently updated"
    })

    local SupportSection = HelpTab:Section({
        Title = "Support & Suggestions"
    })

    SupportSection:Label({
        Text = "Want to suggest new games or scripts?"
    })

    SupportSection:Label({
        Text = "• Report broken scripts"
    })

    SupportSection:Label({
        Text = "• Share your own scripts"
    })

    SupportSection:Label({
        Text = "Your feedback helps improve Lizz Hub"
    })

    local CommunitySection = HelpTab:Section({
        Title = "Community"
    })

    CommunitySection:Label({
        Text = "Follow us on TikTok for:"
    })

    CommunitySection:Label({
        Text = "• Updates and news"
    })

    CommunitySection:Label({
        Text = "• Giveaways and events"
    })

    CommunitySection:Button({
        Title = "Follow on TikTok",
        Desc = "Copy TikTok link",
        Callback = function()
            setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
            Wind:Notification({
                Title = "TikTok",
                Description = "Link copied to clipboard!",
                Duration = 3
            })
        end
    })

    -- Notificación de carga completa
    Wind:Notification({
        Title = "Lizz Hub",
        Description = "Loaded successfully!",
        Duration = 4
    })

    print("Lizz Hub Loaded Successfully")
end)
