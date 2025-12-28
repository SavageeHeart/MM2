
-- Anti doble ejecución
if getgenv().LizzHubLoaded then return end
getgenv().LizzHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

print("Cargando Lizz Hub...")

-- Load Wally UI (simple, bonita y 100% funcional)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua"))()

print("UI cargada!")

-- Create Window
local Window = Library:CreateWindow({
    Title = 'Lizz Hub',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

print("Ventana creada!")

-- Tabs
local Tabs = {
    Home = Window:AddTab('Home'),
    MM2 = Window:AddTab('MM2'),
    Garden = Window:AddTab('Garden'),
    Forge = Window:AddTab('Forge'),
    Help = Window:AddTab('Help'),
    Settings = Window:AddTab('Settings')
}

print("Tabs creadas!")

-- HOME TAB
local HomeGroup = Tabs.Home:AddLeftGroupbox('Welcome to Lizz Hub')
HomeGroup:AddLabel('Lizz Hub')
HomeGroup:AddLabel('This Universal Script Hub provides')
HomeGroup:AddLabel('safe, stable, and optimized scripts')
HomeGroup:AddLabel('for multiple popular Roblox games.')
HomeGroup:AddLabel('')
HomeGroup:AddLabel('TikTok: SavageeHeart')

local UserGroup = Tabs.Home:AddRightGroupbox('User Info')
UserGroup:AddLabel('User: ' .. LocalPlayer.Name)
UserGroup:AddLabel('Status: Connected')
UserGroup:AddDivider()
UserGroup:AddButton({
    Text = 'Follow on TikTok',
    Func = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Library:Notify('TikTok link copied to clipboard!', 3)
    end
})

-- MM2 TAB
local MM2Group = Tabs.MM2:AddLeftGroupbox('Murder Mystery 2')
MM2Group:AddLabel('Select a script to load for MM2')
MM2Group:AddDivider()

MM2Group:AddButton({
    Text = 'Capybara Hub',
    Func = function()
        Library:Notify('Loading Capybara Hub...', 2)
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://pastebin.com/raw/3Pvr5Pfy"))()
        end)
    end,
    Tooltip = 'Silent Aim/Knife, ESP'
})

MM2Group:AddButton({
    Text = 'Overdrive Hub',
    Func = function()
        Library:Notify('Loading Overdrive Hub...', 2)
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://api.overdrivehub.xyz/v1/auth"))()
        end)
    end,
    Tooltip = 'Silent Aim/Knife, ESP'
})

-- GARDEN TAB
local GardenGroup = Tabs.Garden:AddLeftGroupbox('Grow a Garden')
GardenGroup:AddLabel('Automation features for farming')
GardenGroup:AddDivider()

GardenGroup:AddButton({
    Text = 'Soluna Script',
    Func = function()
        Library:Notify('Loading Soluna Script...', 2)
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua"))()
        end)
    end,
    Tooltip = 'Automation features'
})

-- FORGE TAB
local ForgeGroup = Tabs.Forge:AddLeftGroupbox('The Forge')
ForgeGroup:AddLabel('Quest automation and farming')
ForgeGroup:AddDivider()

ForgeGroup:AddButton({
    Text = 'Chiyo Forge',
    Func = function()
        Library:Notify('Loading Chiyo Forge...', 2)
        task.spawn(function()
            task.wait(0.5)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))()
        end)
    end,
    Tooltip = 'Quest Automation, Auto Forge, Auto Sell'
})

-- HELP TAB
local HelpGroup1 = Tabs.Help:AddLeftGroupbox('Need Help?')
HelpGroup1:AddLabel('If you experience issues with any')
HelpGroup1:AddLabel('script or the hub, make sure:')
HelpGroup1:AddLabel('')
HelpGroup1:AddLabel('• Your exploit is up to date')
HelpGroup1:AddLabel('• You run the hub only once')
HelpGroup1:AddLabel('')
HelpGroup1:AddLabel('Most issues happen when a game')
HelpGroup1:AddLabel('gets updated.')

local HelpGroup2 = Tabs.Help:AddRightGroupbox('Support & Suggestions')
HelpGroup2:AddLabel('Want us to add more games or scripts?')
HelpGroup2:AddLabel('')
HelpGroup2:AddLabel('• Report broken scripts')
HelpGroup2:AddLabel('• Share your own scripts')
HelpGroup2:AddLabel('')
HelpGroup2:AddLabel('Your feedback helps improve Lizz Hub.')

local CommunityGroup = Tabs.Help:AddLeftGroupbox('Community')
CommunityGroup:AddLabel('Follow us on TikTok for:')
CommunityGroup:AddLabel('• Updates and news')
CommunityGroup:AddLabel('• Giveaways and events')
CommunityGroup:AddDivider()
CommunityGroup:AddButton({
    Text = 'Follow on TikTok',
    Func = function()
        setclipboard("https://www.tiktok.com/@savageeheart?_r=1&_t=ZP-92acisSYJzS")
        Library:Notify('TikTok link copied to clipboard!', 3)
    end
})

-- SETTINGS TAB
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('LizzHub')
ThemeManager:ApplyToTab(Tabs.Settings)

local MenuGroup = Tabs.Settings:AddLeftGroupbox('Menu')
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'End',
    NoUI = true,
    Text = 'Menu keybind'
})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetTheme('Purple')

Library:OnUnload(function()
    print('Lizz Hub unloaded!')
end)

Library:Notify('Lizz Hub loaded successfully!', 3)

print("Lizz Hub Loaded")
