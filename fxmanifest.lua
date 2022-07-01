fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Treifa'
description 'Bipper sapeur pompier FiveM'
version '1.0.0'

ui_page "web/index.html"

files {
    "web/index.html",
    "web/style.css",
    "web/index.js",
    "web/assets/*.png",
    "web/assets/*.mp3",
}

shared_script "config.lua"

client_scripts "client.lua"

server_scripts "server.lua"