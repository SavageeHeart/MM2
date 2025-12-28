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

-- ========== PANTALLA DE CARGA ========== --
local LoadingScreen = Instance.new("ScreenGui")
local LoadingFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local StatusText = Instance.new("TextLabel")

LoadingScreen.Name = "LizzHubLoading"
LoadingScreen.Parent = game.CoreGui
LoadingScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

LoadingFrame.Parent = LoadingScreen
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame.Size = UDim2.new(0, 400, 0, 150)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = LoadingFrame

Title.Parent = LoadingFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 30)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "LIZZ HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 32

StatusText.Parent = LoadingFrame
StatusText.BackgroundTransparency = 1
StatusText.Position = UDim2.new(0, 0, 0, 90)
StatusText.Size = UDim2.new(1, 0, 0, 30)
StatusText.Font = Enum.Font.Gotham
StatusText.Text = "Loading Lizz Script"
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.TextSize = 16

-- ========== CARGAR SCRIPT DUVANZIN ========== --
task.spawn(function()
    task.wait(0.3)
    
    -- Cargar el script de Duvanzin
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Duvanzin/MM2/main/script.lua"))()
    end)
    
    task.wait(1)
    
    -- Cerrar pantalla de carga
    LoadingScreen:Destroy()
    
    -- Cargar WindUI Library
    local Wind = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"
    ))()
    
    -- ========== CREAR INTERFAZ PRINCIPAL ========== --
    local Window = Wind:CreateWindow({
        Title = "Lizz Hub",
        Icon = "rbxassetid://10734950020",
        Author = "SavageeHeart",
        Folder = "LizzHub",
        Size = UDim2.fromOffset(580, 460),
        KeySystem = false,
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 170,
    })
    
    -- Función para cerrar la interfaz
    local function CloseHub()
        if Window then
            pcall(function()
                Window:Destroy()
            end)
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
        Text = "Status: Connected"
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
        Text = "Select a script to load"
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
            task.spawn(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/loader.lua', true))()
                task.wait(1)
                CloseHub()
            end)
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
        Text = "Scripts for Grow a Garden game"
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
            task.spawn(function()
                loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
                task.wait(1)
                CloseHub()
            end)
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
            task.spawn(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
                task.wait(1)
                CloseHub()
            end)
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
        Text = "If you experience issues with any script or the hub, make sure:"
    })

    HelpSection:Label({
        Text = "• Your exploit is up to date"
    })

    HelpSection:Label({
        Text = "• You run the hub only once per session"
    })

    HelpSection:Label({
        Text = "Most issues happen when a game gets updated."
    })

    local SupportSection = HelpTab:Section({
        Title = "Support & Suggestions"
    })

    SupportSection:Label({
        Text = "Want us to add more games or scripts?"
    })

    SupportSection:Label({
        Text = "• Report broken scripts"
    })

    SupportSection:Label({
        Text = "• Share your own scripts"
    })

    SupportSection:Label({
        Text = "Your feedback helps improve Lizz Hub."
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

    -- Notificación de carga completa
    Wind:Notification({
        Title = "Lizz Hub",
        Description = "Loaded successfully!",
        Duration = 3
    })

    print("Lizz Hub Loaded")
end)
