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
    
    -- Cargar Fluent UI Library
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    
    -- ========== CREAR INTERFAZ PRINCIPAL ========== --
    local Window = Fluent:CreateWindow({
        Title = "Lizz Hub",
        SubTitle = "",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    -- Crear Tabs
    local Tabs = {
        Home = Window:AddTab({ Title = "Home", Icon = "home" }),
        MM2 = Window:AddTab({ Title = "MM2", Icon = "shield" }),
        Garden = Window:AddTab({ Title = "Garden", Icon = "leaf" }),
        Forge = Window:AddTab({ Title = "Forge", Icon = "hammer" }),
        Help = Window:AddTab({ Title = "Help", Icon = "help-circle" })
    }

    -- Función para cerrar la interfaz
    local function CloseHub()
        if Window then
            pcall(function()
                Window:Destroy()
            end)
        end
        getgenv().LizzHubLoaded = false
    end

    -- HOME TAB
    Tabs.Home:AddParagraph({
        Title = "Lizz Hub",
        Content = "TikTok: SavageeHeart\n\nWelcome to Lizz Hub!"
    })

    Tabs.Home:AddParagraph({
        Title = "User Info",
        Content = "Current user: " .. LocalPlayer.Name .. "\nStatus: Connected"
    })

    Tabs.Home:AddButton({
        Title = "Follow on TikTok",
        Description = "Copy TikTok link to clipboard",
        Callback = function()
            setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
            Fluent:Notify({
                Title = "TikTok",
                Content = "Link copied to clipboard!",
                Duration = 3
            })
        end
    })

    -- MM2 TAB
    Tabs.MM2:AddParagraph({
        Title = "Murder Mystery 2",
        Content = "Select a script to load"
    })

    Tabs.MM2:AddButton({
        Title = "Lizz Script",
        Description = "Load the main MM2 script",
        Callback = function()
            Fluent:Notify({
                Title = "Loading",
                Content = "Loading Lizz Script...",
                Duration = 2
            })
            task.spawn(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/loader.lua', true))()
                task.wait(1)
                CloseHub()
            end)
        end
    })

    -- GARDEN TAB
    Tabs.Garden:AddParagraph({
        Title = "Grow a Garden",
        Content = "Scripts for Grow a Garden game"
    })

    Tabs.Garden:AddButton({
        Title = "Soluna Script",
        Description = "Load Soluna automation script",
        Callback = function()
            Fluent:Notify({
                Title = "Loading",
                Content = "Loading Soluna Script...",
                Duration = 2
            })
            task.spawn(function()
                loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
                task.wait(1)
                CloseHub()
            end)
        end
    })

    -- FORGE TAB
    Tabs.Forge:AddParagraph({
        Title = "The Forge",
        Content = "Scripts for The Forge game"
    })

    Tabs.Forge:AddButton({
        Title = "Chiyo Forge",
        Description = "Load Chiyo automation script",
        Callback = function()
            Fluent:Notify({
                Title = "Loading",
                Content = "Loading Chiyo Forge...",
                Duration = 2
            })
            task.spawn(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
                task.wait(1)
                CloseHub()
            end)
        end
    })

    -- HELP TAB
    Tabs.Help:AddParagraph({
        Title = "Need Help?",
        Content = "If you experience issues with any script or the hub, make sure:\n\n• Your exploit is up to date\n• You run the hub only once per session\n\nMost issues happen when a game gets updated."
    })

    Tabs.Help:AddParagraph({
        Title = "Support & Suggestions",
        Content = "Want us to add more games or scripts?\n\n• Report broken scripts\n• Share your own scripts\n\nYour feedback helps improve Lizz Hub."
    })

    Tabs.Help:AddParagraph({
        Title = "Community",
        Content = "Follow us on TikTok for:\n• Updates and news\n• Giveaways and events"
    })

    Tabs.Help:AddButton({
        Title = "Follow on TikTok",
        Description = "Copy TikTok link to clipboard",
        Callback = function()
            setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
            Fluent:Notify({
                Title = "TikTok",
                Content = "Link copied to clipboard!",
                Duration = 3
            })
        end
    })

    -- Seleccionar la primera tab por defecto
    Window:SelectTab(1)
    
    -- Notificación de carga completa
    Fluent:Notify({
        Title = "Lizz Hub",
        Content = "Loaded Lizz HUB",
        Duration = 3
    })

    print("Lizz Hub Loaded")
end)
