-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r




ESX = exports["es_extended"]:getSharedObject()
local inRadialMenu = false

RegisterNetEvent("esx:playerLoaded", function(xPlayer) ESX.PlayerData = xPlayer end)
RegisterNetEvent("esx:setJob", function(job) ESX.PlayerData.job = job end)

for k, v in pairs(Config.Commands) do
    RegisterCommand(k, v.Func, false)
end

RegisterCommand('_rad', function()
    if not IsPauseMenuActive() and not inRadialMenu then
        openRadial(true)
        SetCursorLocation(0.5, 0.5)
    end
end, false)
RegisterKeyMapping('_rad', 'Open Radial Menu', 'keyboard', 'OEM_3')

function openRadial(bool)
    local items = {}
    ESX.TriggerServerCallback('esx_radialmenu:getGroup', function(group)
        for _, v in pairs(Config.MenuItems) do
            if not v.adminOnly or (v.adminOnly and group == 'admin') then
                table.insert(items, v)
            end
        end
        SetNuiFocus(bool, bool)
        SendNUIMessage({ action = "ui", radial = bool, items = items })
        inRadialMenu = bool
    end)
end

function closeRadial(bool)
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

RegisterNUICallback('closeRadial', function() closeRadial(false) end)

RegisterNUICallback('selectItem', function(data)
    local item = data.itemData
    if item.type == 'client' then
        TriggerEvent(item.event, item)
    elseif item.type == 'server' then
        TriggerServerEvent(item.event, item)
    elseif item.type == 'cmd' then
        ExecuteCommand(item.event)
    end
end)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    TriggerEvent('pruda_hud:notify', 'error', 'Info', 'Keine Personen in der Nähe.')
end)

RegisterNetEvent('emote:sit', function() ExecuteCommand("e sit") end)
RegisterNetEvent('emote:pushup', function() ExecuteCommand("e pushup") end)
RegisterNetEvent('emote:situp', function() ExecuteCommand("e situp") end)
RegisterNetEvent('emote:handsup', function() ExecuteCommand("e handsup") end)
RegisterNetEvent('emote:dance', function() exports["rpemotes-reborn"]:EmoteCommandStart("dance") end)
RegisterNetEvent('emote:wave', function() exports["rpemotes-reborn"]:EmoteCommandStart("wave") end)
RegisterNetEvent('emote:facepalm', function() exports["rpemotes-reborn"]:EmoteCommandStart("facepalm") end)
RegisterNetEvent('emote:stop', function() exports["rpemotes-reborn"]:EmoteCancel(true) end)
