-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r




RegisterServerEvent('qb-radialmenu:server:RemoveBrancard')
AddEventHandler('qb-radialmenu:server:RemoveBrancard', function(PlayerPos, BrancardObject)
    TriggerClientEvent('qb-radialmenu:client:RemoveBrancardFromArea', -1, PlayerPos, BrancardObject)
end)

RegisterServerEvent('qb-radialmenu:Brancard:BusyCheck')
AddEventHandler('qb-radialmenu:Brancard:BusyCheck', function(id, type)
    local MyId = source
    TriggerClientEvent('qb-radialmenu:Brancard:client:BusyCheck', id, MyId, type)
end)

RegisterServerEvent('qb-radialmenu:server:BusyResult')
AddEventHandler('qb-radialmenu:server:BusyResult', function(IsBusy, OtherId, type)
    TriggerClientEvent('qb-radialmenu:client:Result', OtherId, IsBusy, type)
end)