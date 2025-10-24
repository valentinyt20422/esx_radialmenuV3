
-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r





local trunkBusy = {}

RegisterServerEvent('qb-trunk:server:setTrunkBusy')
AddEventHandler('qb-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

ESX.RegisterServerCallback('qb-trunk:server:getTrunkBusy', function(source, cb, plate)
    if trunkBusy[plate] then
        cb(true)
    end
    cb(false)
end)

RegisterServerEvent('qb-trunk:server:KidnapTrunk')
AddEventHandler('qb-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('qb-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

--QBCore.Commands.Add("getintrunk", "Get In Trunk", {}, false, function(source, args)
RegisterCommand("getintrunk", function(source, args, rawCommand)    
    TriggerClientEvent('qb-trunk:client:GetIn', source)
end)

RegisterCommand("putintrunk", function(source, args, rawCommand) 
    TriggerClientEvent('qb-trunk:server:KidnapTrunk', source)
end)

