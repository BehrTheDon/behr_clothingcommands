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


function toggleHat()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local propIndex = GetPedPropIndex(ped, 0)
    local textureIndex = GetPedPropTextureIndex(ped, 0)

    playClothingAnimation()


    if propIndex ~= -1 then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].hat = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 0)
        debugPrint("Hat removed.")
    elseif savedClothing[ped] and savedClothing[ped].hat then
        SetPedPropIndex(ped, 0, savedClothing[ped].hat.drawable, savedClothing[ped].hat.texture, true)
        savedClothing[ped].hat = nil
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
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].glasses = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 1)
        debugPrint("Glasses removed.")
    elseif savedClothing[ped] and savedClothing[ped].glasses then
        SetPedPropIndex(ped, 1, savedClothing[ped].glasses.drawable, savedClothing[ped].glasses.texture, true)
        savedClothing[ped].glasses = nil
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
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].ear = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 2)
        debugPrint("Ear removed.")
    elseif savedClothing[ped] and savedClothing[ped].ear then
        SetPedPropIndex(ped, 2, savedClothing[ped].ear.drawable, savedClothing[ped].ear.texture, true)
        savedClothing[ped].ear = nil
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
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].watch = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 6)
        debugPrint("Watch removed.")
    elseif savedClothing[ped] and savedClothing[ped].watch then
        SetPedPropIndex(ped, 6, savedClothing[ped].watch.drawable, savedClothing[ped].watch.texture, true)
        savedClothing[ped].watch = nil
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
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].bracelet = {
            drawable = propIndex,
            texture = textureIndex
        }
        ClearPedProp(ped, 7)
        debugPrint("Bracelet removed.")
    elseif savedClothing[ped] and savedClothing[ped].bracelet then
        SetPedPropIndex(ped, 7, savedClothing[ped].bracelet.drawable, savedClothing[ped].bracelet.texture, true)
        savedClothing[ped].bracelet = nil
        debugPrint("Bracelet restored.")
    else
        debugPrint("No saved bracelet to restore.")
    end
end


function toggleTop()
    local ped = PlayerPedId()
    local maleHash = GetHashKey("mp_m_freemode_01")
    local femaleHash = GetHashKey("mp_f_freemode_01")
    local pedModel = GetEntityModel(ped)

    if pedModel ~= maleHash and pedModel ~= femaleHash then return end

    local currentDrawableShirt = GetPedDrawableVariation(ped, 8)
    local currentTextureShirt = GetPedTextureVariation(ped, 8)
    local currentDrawableJacket = GetPedDrawableVariation(ped, 11)
    local currentTextureJacket = GetPedTextureVariation(ped, 11)
    local currentDrawableArms = GetPedDrawableVariation(ped, 3)
    local currentTextureArms = GetPedTextureVariation(ped, 3)

    playClothingAnimation()

    if (pedModel == maleHash and currentDrawableJacket ~= Config.NoTopJacketMale)
    or (pedModel == femaleHash and currentDrawableJacket ~= Config.NoTopJacketFemale) then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].top = {
            drawableShirt = currentDrawableShirt,
            textureShirt = currentTextureShirt,
            drawableJacket = currentDrawableJacket,
            textureJacket = currentTextureJacket,
            drawableArms = currentDrawableArms,
            textureArms = currentTextureArms
        }

        debugPrint("Saving current top state: " .. tostring(savedClothing[ped].top.drawableShirt) .. ", " .. tostring(savedClothing[ped].top.textureShirt)  .. ", " .. tostring(savedClothing[ped].top.drawableJacket) .. ", " .. tostring(savedClothing[ped].top.textureJacket) .. ", " .. tostring(savedClothing[ped].top.drawableArms) .. ", " .. tostring(savedClothing[ped].top.textureArms))

        if pedModel == maleHash then
            SetPedComponentVariation(ped, 8, Config.NoTopShirtMale, 0, 2)
            SetPedComponentVariation(ped, 11, Config.NoTopJacketMale, 0, 2)
            SetPedComponentVariation(ped, 3, Config.FullBodyMale, 0, 2)

            debugPrint("Set top for male model.")
        elseif pedModel == femaleHash then
            SetPedComponentVariation(ped, 8, Config.NoTopShirtFemale, 0, 2)
            SetPedComponentVariation(ped, 11, Config.NoTopJacketFemale, 0, 2)
            SetPedComponentVariation(ped, 3, Config.FullBodyFemale, 0, 2)

            debugPrint("Set top for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].top then
        SetPedComponentVariation(ped, 8, savedClothing[ped].top.drawableShirt, savedClothing[ped].top.textureShirt, 2)
        SetPedComponentVariation(ped, 11, savedClothing[ped].top.drawableJacket, savedClothing[ped].top.textureJacket, 2)
        SetPedComponentVariation(ped, 3, savedClothing[ped].top.drawableArms, savedClothing[ped].top.textureArms, 2)
        savedClothing[ped].top = nil

        debugPrint("Top restored.")
    end
end

function toggleMask()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 1)
    local currentTexture = GetPedTextureVariation(ped, 1)

    playClothingAnimation()


    if currentDrawable ~= Config.NoMaskMale and currentDrawable ~= Config.NoMaskFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].mask = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current mask state: " .. tostring(savedClothing[ped].mask.drawable) .. ", " .. tostring(savedClothing[ped].mask.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 1, Config.NoMaskMale, 0, 2)

            debugPrint("Set mask for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 1, Config.NoMaskFemale, 0, 2)

            debugPrint("Set mask for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].mask then
        SetPedComponentVariation(ped, 1, savedClothing[ped].mask.drawable, savedClothing[ped].mask.texture, 2)
        savedClothing[ped].mask = nil

        debugPrint("Mask restored.")
    end
end

function toggleHair()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 2)
    local currentTexture = GetPedTextureVariation(ped, 2)

    playClothingAnimation()


    if currentDrawable ~= Config.NoHairMale and currentDrawable ~= Config.NoHairFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].hair = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current hair state: " .. tostring(savedClothing[ped].hair.drawable) .. ", " .. tostring(savedClothing[ped].hair.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 2, Config.NoHairMale, 0, 2)

            debugPrint("Set hair for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 2, Config.NoHairFemale, 0, 2)

            debugPrint("Set hair for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].hair then
        SetPedComponentVariation(ped, 2, savedClothing[ped].hair.drawable, savedClothing[ped].hair.texture, 2)
        savedClothing[ped].hair = nil

        debugPrint("Hair restored.")
    end
end

function toggleArms()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 3)
    local currentTexture = GetPedTextureVariation(ped, 3)

    playClothingAnimation()


    if currentDrawable ~= Config.NoArmsMale and currentDrawable ~= Config.NoArmsFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].arms = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current arms state: " .. tostring(savedClothing[ped].arms.drawable) .. ", " .. tostring(savedClothing[ped].arms.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 3, Config.NoArmsMale, 0, 2)

            debugPrint("Set arms for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 3, Config.NoArmsFemale, 0, 2)

            debugPrint("Set arms for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].arms then
        SetPedComponentVariation(ped, 3, savedClothing[ped].arms.drawable, savedClothing[ped].arms.texture, 2)
        savedClothing[ped].arms = nil

        debugPrint("Arms restored.")
    end
end

function togglePants()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 4)
    local currentTexture = GetPedTextureVariation(ped, 4)

    playClothingAnimation()


    if currentDrawable ~= Config.NoPantsMale and currentDrawable ~= Config.NoPantsFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].pants = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current pants state: " .. tostring(savedClothing[ped].pants.drawable) .. ", " .. tostring(savedClothing[ped].pants.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 4, Config.NoPantsMale, 0, 2)

            debugPrint("Set pants for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 4, Config.NoPantsFemale, 0, 2)

            debugPrint("Set pants for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].pants then
        SetPedComponentVariation(ped, 4, savedClothing[ped].pants.drawable, savedClothing[ped].pants.texture, 2)
        savedClothing[ped].pants = nil

        debugPrint("Pants restored.")
    end
end

function toggleBackpack()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 5)
    local currentTexture = GetPedTextureVariation(ped, 5)

    playClothingAnimation()


    if currentDrawable ~= Config.NoBackpackMale and currentDrawable ~= Config.NoBackpackFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].backpack = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current backpack state: " .. tostring(savedClothing[ped].backpack.drawable) .. ", " .. tostring(savedClothing[ped].backpack.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 5, Config.NoBackpackMale, 0, 2)

            debugPrint("Set backpack for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 5, Config.NoBackpackFemale, 0, 2)

            debugPrint("Set backpack for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].backpack then
        SetPedComponentVariation(ped, 5, savedClothing[ped].backpack.drawable, savedClothing[ped].backpack.texture, 2)
        savedClothing[ped].backpack = nil

        debugPrint("Backpack restored.")
    end
end

function toggleShoes()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 6)
    local currentTexture = GetPedTextureVariation(ped, 6)

    playClothingAnimation()


    if currentDrawable ~= Config.NoShoesMale and currentDrawable ~= Config.NoShoesFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].shoes = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current shoes state: " .. tostring(savedClothing[ped].shoes.drawable) .. ", " .. tostring(savedClothing[ped].shoes.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 6, Config.NoShoesMale, 0, 2)

            debugPrint("Set shoes for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 6, Config.NoShoesFemale, 0, 2)

            debugPrint("Set shoes for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].shoes then
        SetPedComponentVariation(ped, 6, savedClothing[ped].shoes.drawable, savedClothing[ped].shoes.texture, 2)
        savedClothing[ped].shoes = nil

        debugPrint("Shoes restored.")
    end
end

function toggleChain()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 7)
    local currentTexture = GetPedTextureVariation(ped, 7)

    playClothingAnimation()


    if currentDrawable ~= Config.NoChainMale and currentDrawable ~= Config.NoChainFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].chain = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current chain state: " .. tostring(savedClothing[ped].chain.drawable) .. ", " .. tostring(savedClothing[ped].chain.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 7, Config.NoChainMale, 0, 2)

            debugPrint("Set chain for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 7, Config.NoChainFemale, 0, 2)

            debugPrint("Set chain for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].chain then
        SetPedComponentVariation(ped, 7, savedClothing[ped].chain.drawable, savedClothing[ped].chain.texture, 2)
        savedClothing[ped].chain = nil

        debugPrint("Chain restored.")
    end
end

function toggleShirt()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 8)
    local currentTexture = GetPedTextureVariation(ped, 8)

    playClothingAnimation()


    if currentDrawable ~= Config.NoShirtMale and currentDrawable ~= Config.NoShirtFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].shirt = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current shirt state: " .. tostring(savedClothing[ped].shirt.drawable) .. ", " .. tostring(savedClothing[ped].shirt.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 8, Config.NoShirtMale, 0, 2)

            debugPrint("Set shirt for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 8, Config.NoShirtFemale, 0, 2)

            debugPrint("Set shirt for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].shirt then
        SetPedComponentVariation(ped, 8, savedClothing[ped].shirt.drawable, savedClothing[ped].shirt.texture, 2)
        savedClothing[ped].shirt = nil

        debugPrint("Shirt restored.")
    end
end

function toggleVest()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 9)
    local currentTexture = GetPedTextureVariation(ped, 9)

    playClothingAnimation()


    if currentDrawable ~= Config.NoVestMale and currentDrawable ~= Config.NoVestFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].vest = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current vest state: " .. tostring(savedClothing[ped].vest.drawable) .. ", " .. tostring(savedClothing[ped].vest.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 9, Config.NoVestMale, 0, 2)

            debugPrint("Set vest for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 9, Config.NoVestFemale, 0, 2)

            debugPrint("Set vest for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].vest then
        SetPedComponentVariation(ped, 9, savedClothing[ped].vest.drawable, savedClothing[ped].vest.texture, 2)
        savedClothing[ped].vest = nil

        debugPrint("Vest restored.")
    end
end

function toggleDecal()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 10)
    local currentTexture = GetPedTextureVariation(ped, 10)

    playClothingAnimation()


    if currentDrawable ~= Config.NoDecalMale and currentDrawable ~= Config.NoDecalFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].decal = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current decal state: " .. tostring(savedClothing[ped].decal.drawable) .. ", " .. tostring(savedClothing[ped].decal.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 10, Config.NoDecalMale, 0, 2)

            debugPrint("Set decal for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 10, Config.NoDecalFemale, 0, 2)

            debugPrint("Set decal for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].decal then
        SetPedComponentVariation(ped, 10, savedClothing[ped].decal.drawable, savedClothing[ped].decal.texture, 2)
        savedClothing[ped].decal = nil

        debugPrint("Decal restored.")
    end
end

function toggleJacket()
    local ped = PlayerPedId()
    local pedModel = GetEntityModel(ped)

    if pedModel ~= GetHashKey("mp_m_freemode_01") and pedModel ~= GetHashKey("mp_f_freemode_01") then return end

    local currentDrawable = GetPedDrawableVariation(ped, 11)
    local currentTexture = GetPedTextureVariation(ped, 11)

    playClothingAnimation()


    if currentDrawable ~= Config.NoJacketMale and currentDrawable ~= Config.NoJacketFemale then
        savedClothing[ped] = savedClothing[ped] or {}
        savedClothing[ped].jacket = {
            drawable = currentDrawable,
            texture = currentTexture
        }

        debugPrint("Saving current jacket state: " .. tostring(savedClothing[ped].jacket.drawable) .. ", " .. tostring(savedClothing[ped].jacket.texture))

        if pedModel == GetHashKey("mp_m_freemode_01") then
            SetPedComponentVariation(ped, 11, Config.NoJacketMale, 0, 2)

            debugPrint("Set jacket for male model.")
        elseif pedModel == GetHashKey("mp_f_freemode_01") then
            SetPedComponentVariation(ped, 11, Config.NoJacketFemale, 0, 2)

            debugPrint("Set jacket for female model.")
        end
    elseif savedClothing[ped] and savedClothing[ped].jacket then
        SetPedComponentVariation(ped, 11, savedClothing[ped].jacket.drawable, savedClothing[ped].jacket.texture, 2)
        savedClothing[ped].jacket = nil

        debugPrint("Jacket restored.")
    end
end

if Config.ShirtCommandEnabled then
    RegisterCommand(Config.ShirtCommand, function()
        toggleShirt()
        debugPrint("Shirt toggled.")
    end, false)
else
    debugPrint(Config.ShirtCommand .. " command is disabled in the configuration.")
end

if Config.JacketCommandEnabled then
    RegisterCommand(Config.JacketCommand, function()
        toggleJacket()
        debugPrint("Jacket toggled.")
    end, false)
else
    debugPrint(Config.JacketCommand .. " command is disabled in the configuration.")
end

if Config.BackpackCommandEnabled then
    RegisterCommand(Config.BackpackCommand, function()
        toggleBackpack()
        debugPrint("Backpack toggled.")
    end, false)
else
    debugPrint(Config.BackpackCommand .. " command is disabled in the configuration.")
end

if Config.PantsCommandEnabled then
    RegisterCommand(Config.PantsCommand, function()
        togglePants()
        debugPrint("Pants toggled.")
    end, false)
else
    debugPrint(Config.PantsCommand .. " command is disabled in the configuration.")
end

if Config.ArmsCommandEnabled then
    RegisterCommand(Config.ArmsCommand, function()
        toggleArms()
        debugPrint("Arms toggled.")
    end, false)
else
    debugPrint(Config.ArmsCommand .. " command is disabled in the configuration.")
end

if Config.ShoesCommandEnabled then
    RegisterCommand(Config.ShoesCommand, function()
        toggleShoes()
        debugPrint("Shoes toggled.")
    end, false)
else
    debugPrint(Config.ShoesCommand .. " command is disabled in the configuration.")
end

if Config.ChainCommandEnabled then
    RegisterCommand(Config.ChainCommand, function()
        toggleChain()
        debugPrint("Chain toggled.")
    end, false)
else
    debugPrint(Config.ChainCommand .. " command is disabled in the configuration.")
end


if Config.HairCommandEnabled then
    RegisterCommand(Config.HairCommand, function()
        toggleHair()
        debugPrint("Hair toggled.")
    end, false)
else
    debugPrint(Config.HairCommand .. " command is disabled in the configuration.")
end

if Config.MaskCommandEnabled then
    RegisterCommand(Config.MaskCommand, function()
        toggleMask()
        debugPrint("Mask toggled.")
    end, false)
else
    debugPrint(Config.MaskCommand .. " command is disabled in the configuration.")
end

if Config.VestCommandEnabled then
    RegisterCommand(Config.VestCommand, function()
        toggleVest()
        debugPrint("Vest toggled.")
    end, false)
else
    debugPrint(Config.VestCommand .. " command is disabled in the configuration.")
end

if Config.DecalCommandEnabled then
    RegisterCommand(Config.DecalCommand, function()
        toggleDecal()
        debugPrint("Decal toggled.")
    end, false)
else
    debugPrint(Config.DecalCommand .. " command is disabled in the configuration.")
end

if Config.HatCommandEnabled then
    RegisterCommand(Config.HatCommand, function()
        toggleHat()
        debugPrint("Hat toggled.")
    end, false)
else
    debugPrint(Config.HatCommand .. " command is disabled in the configuration.")
end

if Config.GlassesCommandEnabled then
    RegisterCommand(Config.GlassesCommand, function()
        toggleGlasses()
        debugPrint("Glasses toggled.")
    end, false)
else
    debugPrint(Config.GlassesCommand .. " command is disabled in the configuration.")
end

if Config.EarCommandEnabled then
    RegisterCommand(Config.EarCommand, function()
        toggleEar()
        debugPrint("Ear toggled.")
    end, false)
else
    debugPrint(Config.EarCommand .. " command is disabled in the configuration.")
end

if Config.WatchCommandEnabled then
    RegisterCommand(Config.WatchCommand, function()
        toggleWatch()
        debugPrint("Watch toggled.")
    end, false)
else
    debugPrint(Config.WatchCommand .. " command is disabled in the configuration.")
end

if Config.BraceletCommandEnabled then
    RegisterCommand(Config.BraceletCommand, function()
        toggleBracelet()
        debugPrint("Bracelet toggled.")
    end, false)
else
    debugPrint(Config.BraceletCommand .. " command is disabled in the configuration.")
end

if Config.TopCommandEnabled then
    RegisterCommand(Config.TopCommand, function()
        toggleTop()
        debugPrint("Top toggled.")
    end, false)
else
    debugPrint(Config.TopCommand .. " command is disabled in the configuration.")
end