local savedShirt = nil
local savedPants = nil
local savedJacket = nil
local savedChain = nil
local savedHair = nil
local savedShoes = nil
local savedBackpack = nil
local savedArms = nil
local savedMask = nil
local savedVest = nil
local savedDecal = nil
local savedHat = nil
local savedGlasses = nil
local savedEar = nil
local savedWatch = nil
local savedBracelet = nil

function debugPrint(message)
    if Config.Debug then
        print("[Behr_ClothingCommands] " .. message)
    end
end


function playClothingAnimation()

    local ped = PlayerPedId()
    local animDict = "clothingtie"
    local animName = "try_tie_positive_a"

    debugPrint("Starting shirt animation...")

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
    debugPrint("Playing shirt animation: " .. animName)

    Wait(600) -- Wait for animation to finish before toggling shirt
    debugPrint("Shirt animation complete.")
end


function toggleHat()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 0)
    local textureIndex = GetPedPropTextureIndex(ped, 0)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedHat = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 0)
        debugPrint("Hat removed.")
    elseif savedHat then
        SetPedPropIndex(ped, 0, savedHat.drawable, savedHat.texture, 2)
        savedHat = nil
        debugPrint("Hat restored.")
    else
        debugPrint("No saved hat to restore.")
    end
end

function toggleGlasses()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 1)
    local textureIndex = GetPedPropTextureIndex(ped, 1)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedGlasses = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 1)
        debugPrint("Glasses removed.")
    elseif savedGlasses then
        SetPedPropIndex(ped, 1, savedGlasses.drawable, savedGlasses.texture, 2)
        savedGlasses = nil
        debugPrint("Glasses restored.")
    else
        debugPrint("No saved glasses to restore.")
    end
end

function toggleEar()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 2)
    local textureIndex = GetPedPropTextureIndex(ped, 2)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedEar = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 2)
        debugPrint("Ear removed.")
    elseif savedEar then
        SetPedPropIndex(ped, 2, savedEar.drawable, savedEar.texture, 2)
        savedEar = nil
        debugPrint("Ear restored.")
    else
        debugPrint("No saved ear to restore.")
    end
end

function toggleWatch()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 6)
    local textureIndex = GetPedPropTextureIndex(ped, 6)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedWatch = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 6)
        debugPrint("Watch removed.")
    elseif savedWatch then
        SetPedPropIndex(ped, 6, savedWatch.drawable, savedWatch.texture, 2)
        savedWatch = nil
        debugPrint("Watch restored.")
    else
        debugPrint("No saved watch to restore.")
    end
end

function toggleBracelet()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 7)
    local textureIndex = GetPedPropTextureIndex(ped, 7)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedBracelet = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 7)
        debugPrint("Bracelet removed.")
    elseif savedBracelet then
        SetPedPropIndex(ped, 7, savedBracelet.drawable, savedBracelet.texture, 2)
        savedBracelet = nil
        debugPrint("Bracelet restored.")
    else
        debugPrint("No saved bracelet to restore.")
    end
end



function toggleDecal()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 10)
    local currentTexture = GetPedTextureVariation(ped, 10)

    playClothingAnimation()


    if currentDrawable ~= Config.NoDecal then
        savedDecal = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 10, Config.NoDecal, 0, 2)
    elseif savedDecal then
        SetPedComponentVariation(ped, 10, savedDecal.drawable, savedDecal.texture, 2)
        savedDecal = nil
    end
end

function toggleVest()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 9)
    local currentTexture = GetPedTextureVariation(ped, 9)

    playClothingAnimation()


    if currentDrawable ~= Config.NoVest then
        savedVest = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 9, Config.NoVest, 0, 2)
    elseif savedVest then
        SetPedComponentVariation(ped, 9, savedVest.drawable, savedVest.texture, 2)
        savedVest = nil
    end
end

function toggleMask()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 1)
    local currentTexture = GetPedTextureVariation(ped, 1)

    playClothingAnimation()


    if currentDrawable ~= Config.NoMask then
        savedMask = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 1, Config.NoMask, 0, 2)
    elseif savedMask then
        SetPedComponentVariation(ped, 1, savedMask.drawable, savedMask.texture, 2)
        savedMask = nil
    end
end

function toggleHair()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 2)
    local currentTexture = GetPedTextureVariation(ped, 2)

    playClothingAnimation()


    if currentDrawable ~= Config.NoHair then
        savedHair = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 2, Config.NoHair, 0, 2)
    elseif savedHair then
        SetPedComponentVariation(ped, 2, savedHair.drawable, savedHair.texture, 2)
        savedHair = nil
    end
end

function toggleArms()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 3)
    local currentTexture = GetPedTextureVariation(ped, 3)

    playClothingAnimation()


    if currentDrawable ~= Config.NoArms then
        savedArms = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 3, Config.NoArms, 0, 2)
    elseif savedArms then
        SetPedComponentVariation(ped, 3, savedArms.drawable, savedArms.texture, 2)
        savedArms = nil
    end
end

function togglePants()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 4)
    local currentTexture = GetPedTextureVariation(ped, 4)

    playClothingAnimation()


    if currentDrawable ~= Config.NoPants then
        savedPants = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 4, Config.NoPants, 0, 2)
    elseif savedPants then
        SetPedComponentVariation(ped, 4, savedPants.drawable, savedPants.texture, 2)
        savedPants = nil
    end
end

function toggleBackpack()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 5)
    local currentTexture = GetPedTextureVariation(ped, 5)

    playClothingAnimation()


    if currentDrawable ~= Config.NoBackpack then
        savedBackpack = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 5, Config.NoBackpack, 0, 2)
    elseif savedBackpack then
        SetPedComponentVariation(ped, 5, savedBackpack.drawable, savedBackpack.texture, 2)
        savedBackpack = nil
    end
end

function toggleShoes()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 6)
    local currentTexture = GetPedTextureVariation(ped, 6)

    playClothingAnimation()


    if currentDrawable ~= Config.NoShoes then
        savedShoes = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 6, Config.NoShoes, 0, 2)
    elseif savedShoes then
        SetPedComponentVariation(ped, 6, savedShoes.drawable, savedShoes.texture, 2)
        savedShoes = nil
    end
end

function toggleChain()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 7)
    local currentTexture = GetPedTextureVariation(ped, 7)

    playClothingAnimation()


    if currentDrawable ~= Config.NoChain then
        savedChain = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 7, Config.NoChain, 0, 2)
    elseif savedChain then
        SetPedComponentVariation(ped, 7, savedChain.drawable, savedChain.texture, 2)
        savedChain = nil
    end
end

function toggleShirt()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 8)
    local currentTexture = GetPedTextureVariation(ped, 8)

    playClothingAnimation()


    if currentDrawable ~= Config.NoShirt then
        savedShirt = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 8, Config.NoShirt, 0, 2)
    elseif savedShirt then
        SetPedComponentVariation(ped, 8, savedShirt.drawable, savedShirt.texture, 2)
        savedShirt = nil
    end
end

function toggleJacket()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 11)
    local currentTexture = GetPedTextureVariation(ped, 11)

    playClothingAnimation()


    if currentDrawable ~= Config.NoJacket then
        savedJacket = {
            drawable = currentDrawable,
            texture = currentTexture
        }
        SetPedComponentVariation(ped, 11, Config.NoJacket, 0, 2)
    elseif savedJacket then
        SetPedComponentVariation(ped, 11, savedJacket.drawable, savedJacket.texture, 2)
        savedJacket = nil
    end
end

if Config.ShirtCommandEnabled then
    RegisterCommand(Config.ShirtCommand, function()
        toggleShirt()
        debugPrint("Shirt toggled.")
    end, false)
else
    debugPrint("Shirt command is disabled in the configuration.")
end

if Config.JacketCommandEnabled then
    RegisterCommand(Config.JacketCommand, function()
        toggleJacket()
        debugPrint("Jacket toggled.")
    end, false)
else
    debugPrint("Jacket command is disabled in the configuration.")
end

if Config.BackpackCommandEnabled then
    RegisterCommand(Config.BackpackCommand, function()
        toggleBackpack()
        debugPrint("Backpack toggled.")
    end, false)
else
    debugPrint("Backpack command is disabled in the configuration.")
end

if Config.PantsCommandEnabled then
    RegisterCommand(Config.PantsCommand, function()
        togglePants()
        debugPrint("Pants toggled.")
    end, false)
else
    debugPrint("Pants command is disabled in the configuration.")
end

if Config.ArmsCommandEnabled then
    RegisterCommand(Config.ArmsCommand, function()
        toggleArms()
        debugPrint("Arms toggled.")
    end, false)
else
    debugPrint("Arms command is disabled in the configuration.")
end

if Config.ShoesCommandEnabled then
    RegisterCommand(Config.ShoesCommand, function()
        toggleShoes()
        debugPrint("Shoes toggled.")
    end, false)
else
    debugPrint("Shoes command is disabled in the configuration.")
end

if Config.ChainCommandEnabled then
    RegisterCommand(Config.ChainCommand, function()
        toggleChain()
        debugPrint("Chain toggled.")
    end, false)
else
    debugPrint("Chain command is disabled in the configuration.")
end


if Config.HairCommandEnabled then
    RegisterCommand(Config.HairCommand, function()
        toggleHair()
        debugPrint("Hair toggled.")
    end, false)
else
    debugPrint("Hair command is disabled in the configuration.")
end

if Config.MaskCommandEnabled then
    RegisterCommand(Config.MaskCommand, function()
        toggleMask()
        debugPrint("Mask toggled.")
    end, false)
else
    debugPrint("Mask command is disabled in the configuration.")
end

if Config.VestCommandEnabled then
    RegisterCommand(Config.VestCommand, function()
        toggleVest()
        debugPrint("Vest toggled.")
    end, false)
else
    debugPrint("Vest command is disabled in the configuration.")
end

if Config.DecalCommandEnabled then
    RegisterCommand(Config.DecalCommand, function()
        toggleDecal()
        debugPrint("Decal toggled.")
    end, false)
else
    debugPrint("Decal command is disabled in the configuration.")
end

if Config.HatCommandEnabled then
    RegisterCommand(Config.HatCommand, function()
        toggleHat()
        debugPrint("Hat toggled.")
    end, false)
else
    debugPrint("Hat command is disabled in the configuration.")
end

if Config.GlassesCommandEnabled then
    RegisterCommand(Config.GlassesCommand, function()
        toggleGlasses()
        debugPrint("Glasses toggled.")
    end, false)
else
    debugPrint("Glasses command is disabled in the configuration.")
end

if Config.EarCommandEnabled then
    RegisterCommand(Config.EarCommand, function()
        toggleEar()
        debugPrint("Ear toggled.")
    end, false)
else
    debugPrint("Ear command is disabled in the configuration.")
end

if Config.WatchCommandEnabled then
    RegisterCommand(Config.WatchCommand, function()
        toggleWatch()
        debugPrint("Watch toggled.")
    end, false)
else
    debugPrint("Watch command is disabled in the configuration.")
end

if Config.BraceletCommandEnabled then
    RegisterCommand(Config.BraceletCommand, function()
        toggleBracelet()
        debugPrint("Bracelet toggled.")
    end, false)
else
    debugPrint("Bracelet command is disabled in the configuration.")
end