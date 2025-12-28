-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables del Autofarmer
local AutoFarmEnabled = false
local AutoResetEnabled = false
local UndergroundFarmEnabled = false
local FarmSpeed = 1
local MinDelay = 0.5
local MaxDelay = 2
local Connection = nil
local UndergroundHeight = -50

-- Intentar cargar Rayfield con múltiples URLs
local Rayfield
local success = false

pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    success = true
end)

if not success then
    pcall(function()
        Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
        success = true
    end)
end

if not success then
    pcall(function()
        Rayfield = loadstring(game:HttpGet('https://pastebin.com/raw/XC3K6TdB'))()
        success = true
    end)
end

if not success or not Rayfield then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Error",
        Text = "Failed to load UI library.",
        Duration = 5
    })
    return
end

-- Función para obtener delay aleatorio
local function RandomDelay()
    return math.random(MinDelay * 100, MaxDelay * 100) / 100
end

-- Función para verificar si la bolsa está llena
local function IsBagFull()
    -- Verificar si el jugador tiene el límite de monedas (50 con VIP, 40 sin VIP)
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        local coinBag = playerGui:FindFirstChild("CoinBag") or playerGui:FindFirstChild("MainGUI")
        if coinBag then
            -- Buscar el texto de monedas para verificar si está lleno
            for _, obj in pairs(coinBag:GetDescendants()) do
                if obj:IsA("TextLabel") and obj.Text then
                    -- Verificar ambos límites: 50/50 (con VIP) o 40/40 (sin VIP)
                    if string.find(obj.Text, "50/50") or string.find(obj.Text, "40/40") or string.find(obj.Text, "Full") then
                        return true
                    end
                end
            end
        end
    end
    return false
end

-- Función para encontrar monedas
local function GetCoins()
    local coins = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("MeshPart") and obj.Name == "Coin" then
            local touch = obj:FindFirstChild("TouchInterest")
            if touch then
                table.insert(coins, obj)
            end
        end
    end
    return coins
end

-- Función para recolectar moneda usando firetouchinterest (método seguro)
local function CollectCoin(coin)
    local character = LocalPlayer.Character
    if not character or not coin or not coin.Parent then return false end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    pcall(function()
        -- Método 1: FireTouchInterest (más seguro)
        if coin:FindFirstChild("TouchInterest") then
            firetouchinterest(hrp, coin, 0)
            task.wait(0.1)
            firetouchinterest(hrp, coin, 1)
        end
    end)
    
    return true
end

-- Función para mover a posición subterránea
local function MoveUnderground()
    local character = LocalPlayer.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local currentPos = hrp.Position
    hrp.CFrame = CFrame.new(currentPos.X, UndergroundHeight, currentPos.Z)
end

-- Función principal del autofarmer (versión segura)
local function StartAutoFarm()
    if Connection then Connection:Disconnect() end
    
    Connection = RunService.Heartbeat:Connect(function()
        if not AutoFarmEnabled then return end
        
        -- Verificar si la bolsa está llena
        if IsBagFull() then
            Rayfield:Notify({
                Title = "Bag Full",
                Content = "Coin bag is full! Waiting for next round...",
                Duration = 3,
                Image = 4483362458
            })
            task.wait(5) -- Esperar antes de volver a verificar
            return
        end
        
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        -- Mover bajo tierra si está activado
        if UndergroundFarmEnabled then
            pcall(function()
                MoveUnderground()
            end)
        end
        
        local coins = GetCoins()
        
        if #coins > 0 then
            for _, coin in pairs(coins) do
                if coin and coin.Parent and AutoFarmEnabled then
                    -- Recolectar moneda de forma remota
                    CollectCoin(coin)
                    
                    -- Delay aleatorio entre monedas
                    local delay = RandomDelay() / FarmSpeed
                    task.wait(delay)
                end
            end
        end
    end)
end

-- Función para detener el autofarmer
local function StopAutoFarm()
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
end

-- Auto Reset al final de la ronda
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(2)
    if AutoResetEnabled and AutoFarmEnabled then
        StartAutoFarm()
    end
end)

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "Lizz Hub",
   LoadingTitle = "Lizz Hub",
   LoadingSubtitle = "",
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- HOME TAB
local HomeTab = Window:CreateTab("Home", 4483362458)
local HomeSection = HomeTab:CreateSection("Welcome to Lizz Hub")

HomeTab:CreateParagraph({Title = "Lizz Hub", Content = "TikTok: SavageeHeart"})

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
local MM2Section = MM2Tab:CreateSection("Murder Mystery 2 - Safe Autofarmer")

MM2Tab:CreateToggle({
   Name = "Auto Farm Coins (Safe Mode)",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
      AutoFarmEnabled = Value
      if Value then
         Rayfield:Notify({
            Title = "Auto Farm",
            Content = "Safe coin farming activated!",
            Duration = 3,
            Image = 4483362458
         })
         StartAutoFarm()
      else
         Rayfield:Notify({
            Title = "Auto Farm",
            Content = "Coin farming deactivated",
            Duration = 3,
            Image = 4483362458
         })
         StopAutoFarm()
      end
   end,
})

MM2Tab:CreateToggle({
   Name = "Underground Farm Mode",
   CurrentValue = false,
   Flag = "UndergroundToggle",
   Callback = function(Value)
      UndergroundFarmEnabled = Value
      Rayfield:Notify({
         Title = "Underground Mode",
         Content = Value and "Farming from underground enabled!" or "Underground mode disabled",
         Duration = 3,
         Image = 4483362458
      })
   end,
})

MM2Tab:CreateToggle({
   Name = "Auto Reset (End Round)",
   CurrentValue = false,
   Flag = "AutoResetToggle",
   Callback = function(Value)
      AutoResetEnabled = Value
      Rayfield:Notify({
         Title = "Auto Reset",
         Content = Value and "Auto reset enabled" or "Auto reset disabled",
         Duration = 3,
         Image = 4483362458
      })
   end,
})

MM2Tab:CreateSlider({
   Name = "Farm Speed Multiplier",
   Range = {0.5, 3},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 1,
   Flag = "FarmSpeedSlider",
   Callback = function(Value)
      FarmSpeed = Value
      Rayfield:Notify({
         Title = "Speed Changed",
         Content = "Farm speed: " .. Value .. "x",
         Duration = 2,
         Image = 4483362458
      })
   end,
})

MM2Tab:CreateSlider({
   Name = "Min Delay Between Coins",
   Range = {0.1, 2},
   Increment = 0.1,
   Suffix = "s",
   CurrentValue = 0.5,
   Flag = "MinDelaySlider",
   Callback = function(Value)
      MinDelay = Value
      if MinDelay > MaxDelay then
         MaxDelay = MinDelay + 0.5
      end
   end,
})

MM2Tab:CreateSlider({
   Name = "Max Delay Between Coins",
   Range = {0.5, 5},
   Increment = 0.1,
   Suffix = "s",
   CurrentValue = 2,
   Flag = "MaxDelaySlider",
   Callback = function(Value)
      MaxDelay = Value
      if MaxDelay < MinDelay then
         MinDelay = MaxDelay - 0.5
      end
   end,
})

local CoinCountLabel = MM2Tab:CreateLabel("Coins Available: 0")

MM2Tab:CreateButton({
   Name = "Refresh Coin Count",
   Callback = function()
      local coins = GetCoins()
      CoinCountLabel:Set("Coins Available: " .. #coins)
      Rayfield:Notify({
         Title = "Coin Count",
         Content = "Found " .. #coins .. " coins on the map!",
         Duration = 2,
         Image = 4483362458
      })
   end,
})

MM2Tab:CreateButton({
   Name = "Return to Surface",
   Callback = function()
      local character = LocalPlayer.Character
      if character and character:FindFirstChild("HumanoidRootPart") then
         local hrp = character.HumanoidRootPart
         hrp.CFrame = CFrame.new(hrp.Position.X, 5, hrp.Position.Z)
         Rayfield:Notify({
            Title = "Teleport",
            Content = "Returned to surface!",
            Duration = 2,
            Image = 4483362458
         })
      end
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

HelpTab:CreateParagraph({Title = "MM2 Safe Autofarmer Guide", Content = "How to use safely:\n\n1. Enable 'Auto Farm Coins'\n2. Toggle 'Underground Farm Mode' to hide\n3. Adjust delays (0.5-2s recommended)\n4. Use Speed Multiplier 1x-1.5x for safety\n\nUnderground mode makes you invisible while farming! The bot stops at 50/50 (with VIP) or 40/40 coins."})

HelpTab:CreateParagraph({Title = "Safety Tips", Content = "For maximum safety:\n\n• Use random delays (Min: 0.5s, Max: 2s)\n• Keep speed multiplier at 1x-1.5x\n• Enable underground mode\n• Stops at 50/50 or 40/40 coins automatically\n\nFarms regardless of your role (innocent/murderer/sheriff)!"})

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

print("Lizz Hub Loaded - Safe MM2 Autofarmer Ready")
