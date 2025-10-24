-----------------------------------
-- ESX Radialmenu Reworked for ESX
-- Voll kompatibel mit ESX Legacy, pruda_hud, QS, VMS, etc.
-----------------------------------

shared_script '@SV-Core/ai_module_fg-obfuscated.lua'
shared_script '@Script-Main/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'

author "valentinyt22"
description 'QB-RadialMenu REWORKED FOR ESX with Admin, Emotes, VMS Documents & Notify'
version '2.0.0'
lua54 "yes"

-----------------------------------
-- NUI
-----------------------------------
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/css/main.css',
    'html/js/main.js',
    'html/js/RadialMenu.js'
}


-----------------------------------
-- Shared / Config
-----------------------------------
shared_scripts {
    '@es_extended/imports.lua',  -- aktiv für ESX Legacy
    'config.lua'
}

-----------------------------------
-- Client
-----------------------------------
client_scripts {
    'client/main.lua',       -- Radialmenu-Logik
    'client/clothing.lua',   -- Kleidung / Umziehen
    'client/trunk.lua',      -- Kofferraum-Interaktion
    'client/brancard.lua'    -- Brancard / Trage
}

-----------------------------------
-- Server
-----------------------------------
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'server/trunk.lua',
    'server/brancard.lua'
}
