-- ESX Radialmenu – Reworked Edition
-- Copyright (C) 2025 SV-Coding (San Andreas V Scripts)
-- Lizenziert unter GPLv3: https://www.gnu.org/licenses/gpl-3.0.html
-- Discord Support: https://discord.gg/AX5arD3r

ESX = exports["es_extended"]:getSharedObject()
PlayerData = {}

CreateThread(function()
    while not ESX do
        Wait(100)
        ESX = exports["es_extended"]:getSharedObject()
    end
    while not ESX.GetPlayerData().job do
        Wait(100)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("esx:playerLoaded", function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("esx:setJob", function(job)
    if type(PlayerData) ~= "table" then
        PlayerData = {}
    end
    PlayerData.job = job
end)


Config = {}

Config.MenuItems = {
    {
        id = "inventory",
        title = "Inventar",
        icon = "box",
        items = {
            { id = "openinv", title = "Inventar öffnen", icon = "box-open", type = "cmd", event = "inventory", shouldClose = true },
            { id = "hotbar", title = "Hotbar", icon = "grip-horizontal", type = "cmd", event = "hotbar", shouldClose = true }
        }
    },
    {
        id = "documents",
        title = "Dokumente",
        icon = "id-card",
        items = {
            { id = "id_card", title = "ID Karte", icon = "id-card", type = "cmd", event = "+id_card", shouldClose = true },
            { id = "driverlicense", title = "Führerschein", icon = "car", type = "cmd", event = "+driverlicense", shouldClose = true },
            { id = "boat_card", title = "Bootsschein", icon = "ship", type = "cmd", event = "+boatlicense", shouldClose = true },
            { id = "fly_card", title = "Flugschein", icon = "helicopter", type = "cmd", event = "+flyinglicense", shouldClose = true },
            { id = "weapon_card", title = "Waffenschein", icon = "gun", type = "cmd", event = "+weaponlicense", shouldClose = true }
        }
    },
    {
        id = "clothing",
        title = "Kleidung",
        icon = "tshirt",
        items = {
            { id = "shirt", title = "Oberteil", icon = "tshirt", type = "client", event = "clothing:shirt", shouldClose = true },
            { id = "pants", title = "Hose", icon = "user", type = "client", event = "clothing:pants", shouldClose = true },
            { id = "shoes", title = "Schuhe", icon = "shoe-prints", type = "client", event = "clothing:shoes", shouldClose = true },
            {
                id = "extras",
                title = "Extras",
                icon = "star",
                items = {
                    { id = "mask", title = "Maske", icon = "theater-masks", type = "client", event = "clothing:mask", shouldClose = true },
                    { id = "hat", title = "Hut / Helm", icon = "hard-hat", type = "client", event = "clothing:hat", shouldClose = true },
                    { id = "glasses", title = "Brille", icon = "glasses", type = "client", event = "clothing:glasses", shouldClose = true },
                    { id = "ears", title = "Ohrringe", icon = "circle", type = "client", event = "clothing:ears", shouldClose = true },
                    { id = "watch", title = "Uhr", icon = "clock", type = "client", event = "clothing:watch", shouldClose = true },
                    { id = "bracelet", title = "Armband", icon = "link", type = "client", event = "clothing:bracelet", shouldClose = true },
                    { id = "vest", title = "Weste", icon = "shield-alt", type = "client", event = "clothing:vest", shouldClose = true },
                    { id = "gloves", title = "Handschuhe", icon = "hand-paper", type = "client", event = "clothing:gloves", shouldClose = true }
                }
            }
        }
    },
    {
        id = "emotes",
        title = "Emotes",
        icon = "smile",
        items = {
            { id = "sit", title = "Sitzen", icon = "chair", type = "client", event = "emote:sit", shouldClose = true },
            { id = "pushup", title = "Liegestütze", icon = "dumbbell", type = "client", event = "emote:pushup", shouldClose = true },
            { id = "situp", title = "Situps", icon = "user", type = "client", event = "emote:situp", shouldClose = true },
            { id = "dance", title = "Tanzen", icon = "music", type = "client", event = "emote:dance", shouldClose = true },
            { id = "wave", title = "Winken", icon = "hand-paper", type = "client", event = "emote:wave", shouldClose = true },
            { id = "facepalm", title = "Facepalm", icon = "meh", type = "client", event = "emote:facepalm", shouldClose = true },
            { id = "stop", title = "Emote stoppen", icon = "ban", type = "client", event = "emote:stop", shouldClose = true }
        }
    },
    {
        id = "admin",
        title = "Admin",
        icon = "user-shield",
        items = {
            { id = "fgm", title = "Fiveguard", icon = "shield-alt", type = "cmd", event = "fgm", shouldClose = true },
            { id = "dv", title = "Fahrzeug löschen", icon = "car-crash", type = "cmd", event = "dv", shouldClose = true },
            { id = "tx", title = "TxAdmin", icon = "terminal", type = "cmd", event = "tx", shouldClose = true },
            { id = "aduty", title = "Admin Duty", icon = "user-ninja", type = "cmd", event = "aduty", shouldClose = true },
            { id = "v", title = "Unsichtbar", icon = "eye-slash", type = "cmd", event = "v", shouldClose = true }
        },
        adminOnly = true
    }
}

Config.Commands = {
    ["+id_card"] = { Func = function() TriggerEvent("vms_document:showMyDocument", "id_card") end },
    ["+driverlicense"] = { Func = function() TriggerEvent("vms_document:showMyDocument", "id_drive") end },
    ["+weaponlicense"] = { Func = function() TriggerEvent("vms_document:showMyDocument", "id_weapon") end },
    ["+boatlicense"] = { Func = function() TriggerEvent("vms_document:showMyDocument", "id_boat") end },
    ["+flyinglicense"] = { Func = function() TriggerEvent("vms_document:showMyDocument", "id_fly") end }
}
