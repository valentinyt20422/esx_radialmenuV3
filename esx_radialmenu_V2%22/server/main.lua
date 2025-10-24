-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r


ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('esx_radialmenu:getGroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local g = xPlayer and xPlayer.getGroup() or 'user'
    cb(g)
end)

RegisterServerEvent('qb-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('qb-radialmenu:trunk:client:Door', -1, plate, door, open)
end)
