
-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load Fluent UI (el más limpio y estético)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Window con configuración mejorada
local Window = Fluent:CreateWindow({
    Title = "Lizz Hub",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst", -- Tema morado/rosado hermoso
    MinimizeKey = nil -- Sin tecla, solo botón
})

-- Conectar botón flotante con Fluent
local isMinimized = false

-- Detectar cuando Fluent se minimiza
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local fluentGui = game:GetService("CoreGui"):FindFirstChild("Fluent")
            if fluentGui then
                -- Ocultar botones innecesarios (solo dejar minimizar)
                local topbar = fluentGui:FindFirstChild("Main", true)
                if topbar then
                    for _, child in pairs(topbar:GetDescendants()) do
                        if child:IsA("ImageButton") or child:IsA("TextButton") then
                            -- Solo mantener el botón de minimizar visible
                            if child.Name == "Minimize" or child.LayoutOrder == 2 then
                                child.Visible = true
                            else
                                child.Visible = false
                            end
                        end
                    end
                end
                
                local mainFrame = fluentGui:FindFirstChild("Main", true)
                if mainFrame and mainFrame.Visible == false and not isMinimized then
                    isMinimized = true
                    FloatingGui.Enabled = true
                elseif mainFrame and mainFrame.Visible == true and isMinimized then
                    isMinimized = false
                    FloatingGui.Enabled = false
                end
            end
        end)
    end
end)

-- Función para maximizar al hacer click en el botón flotante
FloatingButton.MouseButton1Click:Connect(function()
    pcall(function()
        local fluentGui = game:GetService("CoreGui"):FindFirstChild("Fluent")
        if fluentGui then
            local mainFrame = fluentGui:FindFirstChild("Main", true)
            if mainFrame then
                mainFrame.Visible = true
                FloatingGui.Enabled = false
                isMinimized = false
            end
        end
    end)
end)

-- Crear Tabs
local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    MM2 = Window:AddTab({ Title = "MM2", Icon = "shield" }),
    Garden = Window:AddTab({ Title = "Garden", Icon = "flower" }),
    Forge = Window:AddTab({ Title = "Forge", Icon = "hammer" }),
    Help = Window:AddTab({ Title = "Help", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Notificación
Fluent:Notify({
    Title = "Lizz Hub",
    Content = "Loaded successfully",
    Duration = 3
})

-- ==================== HOME TAB ====================
Tabs.Home:AddParagraph({
    Title = "Lizz Hub",
    Content = "This Universal Script Hub provides safe, stable, and optimized scripts for multiple popular Roblox games.\n\nTikTok: SavageeHeart"
})

Tabs.Home:AddParagraph({
    Title = "User Info",
    Content = "Current user: " .. LocalPlayer.Name .. "\nStatus: Connected"
})

Tabs.Home:AddButton({
    Title = "Follow on TikTok",
    Description = "Copy TikTok link",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Fluent:Notify({
            Title = "TikTok",
            Content = "Link copied to clipboard",
            Duration = 3
        })
    end
})

-- ==================== MM2 TAB ====================
Tabs.MM2:AddParagraph({
    Title = "Murder Mystery 2",
    Content = "Select a script to load for MM2"
})

Tabs.MM2:AddButton({
    Title = "Capybara Hub",
    Description = "Silent Aim/Knife, ESP",
    Callback = function()
        Fluent:Notify({
            Title = "Loading",
            Content = "Loading Capybara Hub",
            Duration = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
        end)
    end
})

Tabs.MM2:AddButton({
    Title = "Overdrive Hub",
    Description = "Silent Aim/Knife, ESP",
    Callback = function()
        Fluent:Notify({
            Title = "Loading",
            Content = "Loading Overdrive Hub",
            Duration = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
        end)
    end
})

-- ==================== GARDEN TAB ====================
Tabs.Garden:AddParagraph({
    Title = "Grow a Garden",
    Content = "Automation features for farming"
})

Tabs.Garden:AddButton({
    Title = "Soluna Script",
    Description = "Automation features",
    Callback = function()
        Fluent:Notify({
            Title = "Loading",
            Content = "Loading Soluna Script",
            Duration = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
        end)
    end
})

-- ==================== FORGE TAB ====================
Tabs.Forge:AddParagraph({
    Title = "The Forge",
    Content = "Quest automation and farming"
})

Tabs.Forge:AddButton({
    Title = "Chiyo Forge",
    Description = "Quest Automation, Auto Forge, Auto Sell",
    Callback = function()
        Fluent:Notify({
            Title = "Loading",
            Content = "Loading Chiyo Forge",
            Duration = 2
        })
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
        end)
    end
})

-- ==================== HELP TAB ====================
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
    Description = "Copy TikTok link",
    Callback = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Fluent:Notify({
            Title = "TikTok",
            Content = "Link copied to clipboard",
            Duration = 3
        })
    end
})

-- ==================== SETTINGS TAB ====================
local InterfaceSection = Tabs.Settings:AddSection("Interface")

Tabs.Settings:AddParagraph({
    Title = "UI Controls",
    Content = "Click the X button to minimize\nClick the floating button to maximize\n\nYou can drag the UI to reposition it"
})

print("Lizz Hub Loaded")
