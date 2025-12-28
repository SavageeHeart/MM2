-- TEST SIMPLE DE WINDUI
print("=== INICIANDO TEST ===")

-- Cargar WindUI
print("1. Cargando WindUI...")
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"))()
end)

if not success then
    print("❌ ERROR al cargar WindUI:", result)
    return
end

print("✅ WindUI cargado!")
local WindUI = result

-- Crear ventana simple
print("2. Creando ventana...")
local windowSuccess, window = pcall(function()
    return WindUI:CreateWindow({
        Title = "TEST",
        Size = UDim2.fromOffset(500, 400)
    })
end)

if not windowSuccess then
    print("❌ ERROR al crear ventana:", window)
    return
end

print("✅ Ventana creada!")

-- Crear tab
print("3. Creando tab...")
local tab = window:Tab({ Title = "Test" })
print("✅ Tab creado!")

-- Agregar botón
tab:Button({
    Title = "Funciona!",
    Callback = function()
        print("✅ EL HUB FUNCIONA PERFECTAMENTE!")
    end
})

print("=== TEST COMPLETADO - Si ves una ventana, WindUI funciona ===")
