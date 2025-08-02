local savedClothing = {}

function debugPrint(message)
    if Config.Debug then
        print("[Behr_ClothingCommands] " .. message)
    end
end

function playClothingAnimation()

    local ped = PlayerPedId()
    local animDict = Config.AnimDict
    local animName = Config.AnimName

    debugPrint("Starting Clothing animation...")

    RequestAnimDict(animDict)
    local timeout = GetGameTimer() + 1000 -- 1 second max timeout

    while not HasAnimDictLoaded(animDict) do
        Wait(50)
        if GetGameTimer() > timeout then
            debugPrint("Animation dict failed to load: " .. animDict)
            return
        end
    end

    debugPrint("Animation dict loaded: " .. animDict)

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, 600, 48, 0, false, false, false)
    debugPrint("Playing Clothing animation: " .. animName)

    Wait(600) -- Wait for animation to finish before toggling Clothing
    debugPrint("Clothing animation complete.")
end

function isFreemodePed(ped)
    local model = GetEntityModel(ped)
    return model == GetHashKey("mp_m_freemode_01") or model == GetHashKey("mp_f_freemode_01")
end

function toggleProp(propIndex, slotName)
    local ped = PlayerPedId()
    if not isFreemodePed(ped) then return end

    local drawable = GetPedPropIndex(ped, propIndex)
    local texture = GetPedPropTextureIndex(ped, propIndex)

    playClothingAnimation()

    savedClothing[ped] = savedClothing[ped] or {}

    if drawable ~= -1 then
        savedClothing[ped][slotName] = { drawable = drawable, texture = texture }
        ClearPedProp(ped, propIndex)
        debugPrint(slotName .. " removed.")
    elseif savedClothing[ped][slotName] then
        local item = savedClothing[ped][slotName]
        SetPedPropIndex(ped, propIndex, item.drawable, item.texture, true)
        savedClothing[ped][slotName] = nil
        debugPrint(slotName .. " restored.")
    else
        debugPrint("No saved " .. slotName .. " to restore.")
    end
end

function toggleClothes(clothingIndex, slotName, configKeyMale, configKeyFemale, skipAnim)
    local ped = PlayerPedId()
    local maleHash = GetHashKey("mp_m_freemode_01")
    local femaleHash = GetHashKey("mp_f_freemode_01")
    local pedModel = GetEntityModel(ped)
    if not isFreemodePed(ped) then return end

    local currentDrawable = GetPedDrawableVariation(ped, clothingIndex)
    local currentTexture = GetPedTextureVariation(ped, clothingIndex)

    if not skipAnim then
        playClothingAnimation()
    end

    savedClothing[ped] = savedClothing[ped] or {}

    local noDrawable = nil
    if pedModel == maleHash then
        noDrawable = Config[configKeyMale]
    elseif pedModel == femaleHash then
        noDrawable = Config[configKeyFemale]
    end

    if not noDrawable then
        debugPrint("No config found for " .. slotName .. " fallback. Check config values.")
        return
    end

    if currentDrawable ~= noDrawable then
        savedClothing[ped][slotName] = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current " .. slotName .. " state: " .. tostring(currentDrawable) .. ", " .. tostring(currentTexture))
        SetPedComponentVariation(ped, clothingIndex, noDrawable, 0, 2)

        debugPrint("Set " .. slotName .. " to no-clothing for " .. (pedModel == maleHash and "male" or "female") .. " model.")
    elseif savedClothing[ped][slotName] then
        local item = savedClothing[ped][slotName]
        SetPedComponentVariation(ped, clothingIndex, item.drawable, item.texture, 2)
        savedClothing[ped][slotName] = nil

        debugPrint(slotName .. " restored.")
    else
        debugPrint("No saved " .. slotName .. " to restore.")
    end
end

function toggleTop()
    toggleClothes(11, "jacket", "NoJacketMale", "NoJacketFemale", false)
    toggleClothes(8, "shirt", "NoShirtMale", "NoShirtFemale", true)
    toggleClothes(3, "arms", "FullBodyMale", "FullBodyFemale", true)
end

-- Prop Commands
if Config.HatCommandEnabled then
    RegisterCommand("hat", function() toggleProp(0, "hat") end, false)
else
    debugPrint(Config.HatCommand .. " command is disabled in the configuration.")
end

if Config.GlassesCommandEnabled then
    RegisterCommand("glasses", function() toggleProp(1, "glasses") end, false)
else
    debugPrint(Config.GlassesCommand .. " command is disabled in the configuration.")
end

if Config.EarCommandEnabled then
    RegisterCommand("ear", function() toggleProp(2, "ear") end, false)
else
    debugPrint(Config.EarCommand .. " command is disabled in the configuration.")
end

if Config.WatchCommandEnabled then
    RegisterCommand("watch", function() toggleProp(6, "watch") end, false)
else
    debugPrint(Config.WatchCommand .. " command is disabled in the configuration.")
end

if Config.BraceletCommandEnabled then
    RegisterCommand("bracelet", function() toggleProp(7, "bracelet") end, false)
else
    debugPrint(Config.BraceletCommand .. " command is disabled in the configuration.")
end

-- Clothing Commands
if Config.MaskCommandEnabled then
    RegisterCommand(Config.MaskCommand, function() toggleClothes(1, "mask", "NoMaskMale", "NoMaskFemale") end, false)
else
    debugPrint(Config.MaskCommand .. " command is disabled in the configuration.")
end

if Config.HairCommandEnabled then
    RegisterCommand(Config.HairCommand, function() toggleClothes(2, "hair", "NoHairMale", "NoHairFemale") end, false)
else
    debugPrint(Config.HairCommand .. " command is disabled in the configuration.")
end

if Config.ArmsCommandEnabled then
    RegisterCommand(Config.ArmsCommand, function() toggleClothes(3, "arms", "FullBodyMale", "FullBodyFemale") end, false)
else
    debugPrint(Config.ArmsCommand .. " command is disabled in the configuration.")
end

if Config.PantsCommandEnabled then
    RegisterCommand(Config.PantsCommand, function() toggleClothes(4, "pants", "NoPantsMale", "NoPantsFemale") end, false)
else
    debugPrint(Config.PantsCommand .. " command is disabled in the configuration.")
end

if Config.BackpackCommandEnabled then
    RegisterCommand(Config.BackpackCommand, function() toggleClothes(5, "backpack", "NoBackpackMale", "NoBackpackFemale") end, false)
else
    debugPrint(Config.BackpackCommand .. " command is disabled in the configuration.")
end

if Config.ShoesCommandEnabled then
    RegisterCommand(Config.ShoesCommand, function() toggleClothes(6, "shoes", "NoShoesMale", "NoShoesFemale") end, false)
else
    debugPrint(Config.ShoesCommand .. " command is disabled in the configuration.")
end

if Config.ChainCommandEnabled then
    RegisterCommand(Config.ChainCommand, function() toggleClothes(7, "chain", "NoChainMale", "NoChainFemale") end, false)
else
    debugPrint(Config.ChainCommand .. " command is disabled in the configuration.")
end

if Config.ShirtCommandEnabled then
    RegisterCommand(Config.ShirtCommand, function() toggleClothes(8, "shirt", "NoShirtMale", "NoShirtFemale") end, false)
else
    debugPrint(Config.ShirtCommand .. " command is disabled in the configuration.")
end

if Config.VestCommandEnabled then
    RegisterCommand(Config.VestCommand, function() toggleClothes(9, "vest", "NoVestMale", "NoVestFemale") end, false)
else
    debugPrint(Config.VestCommand .. " command is disabled in the configuration.")
end

if Config.DecalCommandEnabled then
    RegisterCommand(Config.DecalCommand, function() toggleClothes(10, "decal", "NoDecalMale", "NoDecalFemale") end, false)
else
    debugPrint(Config.DecalCommand .. " command is disabled in the configuration.")
end

if Config.JacketCommandEnabled then
    RegisterCommand(Config.JacketCommand, function() toggleClothes(11, "jacket", "NoJacketMale", "NoJacketFemale") end, false)
else
    debugPrint(Config.JacketCommand .. " command is disabled in the configuration.")
end

if Config.TopCommandEnabled then
    RegisterCommand(Config.TopCommand, function() toggleTop() end, false)
else
    debugPrint(Config.TopCommand .. " command is disabled in the configuration.")
end

if Config.ClothingMenuCommandEnabled then
    RegisterCommand(Config.ClothingMenuCommand, function(source, args, rawCommand)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openUI",
            debug = Config.Debug
        })
    end, false)
end

RegisterNUICallback("closeUI", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("toggleClothing", function(data, cb)
    local slot = data.slot

    -- Props
    if slot == "hat" then
        toggleProp(0, "hat")
    elseif slot == "glasses" then
        toggleProp(1, "glasses")
    elseif slot == "ear" then
        toggleProp(2, "ear")
    elseif slot == "watch" then
        toggleProp(6, "watch")
    elseif slot == "bracelet" then
        toggleProp(7, "bracelet")
    -- Clothing
    elseif slot == "mask" then
        toggleClothes(1, "mask", "NoMaskMale", "NoMaskFemale")
    elseif slot == "hair" then
        toggleClothes(2, "hair", "NoHairMale", "NoHairFemale")
    elseif slot == "arms" then
        toggleClothes(3, "arms", "FullBodyMale", "FullBodyFemale")
    elseif slot == "pants" then
        toggleClothes(4, "pants", "NoPantsMale", "NoPantsFemale")
    elseif slot == "backpack" then
        toggleClothes(5, "backpack", "NoBackpackMale", "NoBackpackFemale")
    elseif slot == "shoes" then
        toggleClothes(6, "shoes", "NoShoesMale", "NoShoesFemale")
    elseif slot == "chain" then
        toggleClothes(7, "chain", "NoChainMale", "NoChainFemale")
    elseif slot == "shirt" then
        toggleClothes(8, "shirt", "NoShirtMale", "NoShirtFemale")
    elseif slot == "vest" then
        toggleClothes(9, "vest", "NoVestMale", "NoVestFemale")
    elseif slot == "decal" then
        toggleClothes(10, "decal", "NoDecalMale", "NoDecalFemale")
    elseif slot == "jacket" then
        toggleClothes(11, "jacket", "NoJacketMale", "NoJacketFemale")
    elseif slot == "top" then
        toggleTop()
    else
        debugPrint("Unknown clothing slot: " .. tostring(slot))
    end

    cb("ok")
end)



if Config.Debug then
    CreateThread(function()
        while true do
            -- Minimal activity just to register in ResMon
            Wait(500) -- 0.5 second interval
        end
    end)
end