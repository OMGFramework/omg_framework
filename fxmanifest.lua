fx_version 'cerulean'
games { 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'OMG Dev Team'
description 'A FiveM Framework for Multiple Gamemodes'
version '1.0.0'

files {
	'html/index.html',
    'html/js/script.js',
    'html/font/pricedown.ttf',
    'html/css/style.css',
	'html/icons/money.png',
	'html/icons/bank.png',
	'html/icons/dirtymoney.png',
	'html/icons/job.png'
}

server_scripts {
	'config.lua',
	'version.lua',
	'version',
	-- Core
    'server/server.lua',
	-- Locales
    'language/locales.lua',
    'language/en.lua'
}

client_scripts {
	'config.lua',
    'client/client.lua',
	'client/functions.lua',
	'client/testingcommands.lua',
	-- Locales
    'language/locales.lua',
    'language/en.lua'
}

dependencies {
	'fivem-mongodb'
}

ui_page('html/index.html')