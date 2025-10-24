-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r




ESX = exports["es_extended"]:getSharedObject()

local SavedClothes = {}
local Busy = false

local function Notify(type, msg)
    TriggerEvent('pruda_hud:notify', type, 'Kleidung', msg)
end

local function PlayAnim(dict, anim, duration)
    if Busy then return end
    Busy = true
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, duration, 48, 0, false, false, false)
    Wait(duration)
    ClearPedTasks(PlayerPedId())
    Busy = false
end

local function ToggleClothing(label, components, maleOff, femaleOff, anim)
    if Busy then return end
    TriggerEvent('skinchanger:getSkin', function(skin)
        local isMale = skin.sex == 0
        local off = isMale and maleOff or femaleOff

        if not SavedClothes[label] then SavedClothes[label] = {} end

        local alreadyOff = true
        for comp, _ in pairs(components) do
            if skin[comp] ~= off[comp] then
                alreadyOff = false
                break
            end
        end

        PlayAnim(anim.dict, anim.name, anim.time)

        if not alreadyOff then
            for comp, _ in pairs(components) do
                if skin[comp] ~= 0 and skin[comp] ~= -1 then
                    SavedClothes[label][comp] = skin[comp]
                end
            end
            TriggerEvent('skinchanger:loadClothes', skin, off)
            Notify('info', label .. ' ausgezogen.')
        else
            local hasClothes = false
            for _, value in pairs(SavedClothes[label]) do
                if value and value ~= 0 and value ~= -1 then
                    hasClothes = true
                    break
                end
            end
            if hasClothes then
                local restore = {}
                for comp, _ in pairs(components) do
                    restore[comp] = SavedClothes[label][comp] or skin[comp]
                end
                TriggerEvent('skinchanger:loadClothes', skin, restore)
                Notify('success', label .. ' angezogen.')
            else
                Notify('error', 'Keine gespeicherte Kleidung für ' .. label)
            end
        end
    end)
end

-- 👕 Oberteil (T-Shirt + Torso + Arme)
RegisterNetEvent('clothing:shirt', function()
    ToggleClothing(
        'Oberteil',
        { tshirt_1 = true, tshirt_2 = true, torso_1 = true, torso_2 = true, arms = true },
        { tshirt_1 = 15, tshirt_2 = 0, torso_1 = 15, torso_2 = 0, arms = 15 },       -- Mann
        { tshirt_1 = 15, tshirt_2 = 0, torso_1 = 15, torso_2 = 0, arms = 15 },       -- Frau 
        { dict = "clothingtie", name = "try_tie_neutral_a", time = 1000 }
    )
end)

-- 👖 Hose
RegisterNetEvent('clothing:pants', function()
    ToggleClothing(
        'Hose',
        { pants_1 = true, pants_2 = true },
        { pants_1 = 14, pants_2 = 0 },     -- Mann
        { pants_1 = 15, pants_2 = 0 },     -- Frau 
        { dict = "re@construction", name = "out_of_breath", time = 1000 }
    )
end)

-- 👟 Schuhe
RegisterNetEvent('clothing:shoes', function()
    ToggleClothing(
        'Schuhe',
        { shoes_1 = true, shoes_2 = true },
        { shoes_1 = 34, shoes_2 = 0 },     -- Mann
        { shoes_1 = 49, shoes_2 = 0 },     -- Frau 
        { dict = "random@domestic", name = "pickup_low", time = 800 }
    )
end)

-- 😷 Maske
RegisterNetEvent('clothing:mask', function()
    ToggleClothing(
        'Maske',
        { mask_1 = true, mask_2 = true },
        { mask_1 = 0, mask_2 = 0 },
        { mask_1 = 0, mask_2 = 0 },
        { dict = "misscommon@std_take_off_masks", name = "take_off_mask_ps", time = 1000 }
    )
end)

-- 🧢 Hut / Helm
RegisterNetEvent('clothing:hat', function()
    ToggleClothing(
        'Hut / Helm',
        { helmet_1 = true, helmet_2 = true },
        { helmet_1 = -1, helmet_2 = 0 },
        { helmet_1 = -1, helmet_2 = 0 },   -- Frau 
        { dict = "missheist_agency2ahelmet", name = "take_off_helmet_stand", time = 1000 }
    )
end)

-- 👓 Brille
RegisterNetEvent('clothing:glasses', function()
    ToggleClothing(
        'Brille',
        { glasses_1 = true, glasses_2 = true },
        { glasses_1 = 0, glasses_2 = 0 },
        { glasses_1 = 5, glasses_2 = 0 },  -- Frau 
        { dict = "clothingspecs", name = "try_glasses_positive_a", time = 1200 }
    )
end)

-- 💎 Ohrringe
RegisterNetEvent('clothing:ears', function()
    ToggleClothing(
        'Ohrringe',
        { ears_1 = true, ears_2 = true },
        { ears_1 = -1, ears_2 = 0 },
        { ears_1 = -1, ears_2 = 0 },       -- Frau 
        { dict = "mp_cp_stolen_tut", name = "b_think", time = 800 }
    )
end)

-- ⌚ Uhr
RegisterNetEvent('clothing:watch', function()
    ToggleClothing(
        'Uhr',
        { watches_1 = true, watches_2 = true },
        { watches_1 = -1, watches_2 = 0 },
        { watches_1 = -1, watches_2 = 0 }, -- Frau 
        { dict = "nmt_3_rcm-10", name = "cs_nigel_dual-10", time = 1000 }
    )
end)

-- 🔗 Armband
RegisterNetEvent('clothing:bracelet', function()
    ToggleClothing(
        'Armband',
        { bracelets_1 = true, bracelets_2 = true },
        { bracelets_1 = -1, bracelets_2 = 0 },
        { bracelets_1 = -1, bracelets_2 = 0 }, -- Frau 
        { dict = "nmt_3_rcm-10", name = "cs_nigel_dual-10", time = 1000 }
    )
end)

-- 🦺 Weste / Schutzweste
RegisterNetEvent('clothing:vest', function()
    ToggleClothing(
        'Weste',
        { bproof_1 = true, bproof_2 = true },
        { bproof_1 = 0, bproof_2 = 0 },
        { bproof_1 = 0, bproof_2 = 0 },   -- Frau 
        { dict = "clothingtie", name = "try_tie_neutral_a", time = 1000 }
    )
end)

-- 🧤 Handschuhe
RegisterNetEvent('clothing:gloves', function()
    ToggleClothing(
        'Handschuhe',
        { arms = true },
        { arms = 15 },
        { arms = 15 },                     -- Frau 
        { dict = "clothingtie", name = "try_tie_positive_a", time = 800 }
    )
end)
