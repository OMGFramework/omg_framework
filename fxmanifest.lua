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

shared_scripts {
    'shared.lua',
	'config.lua',
    'locales/locales.lua',
    'locales/en.lua'
}

server_scripts {
    -- Version
	'version.lua',
	'version',
    -- Server
    'server/server_export.lua',
    'server/server.lua',
}

client_scripts {
    -- Client
    'client/client.lua',
	'client/functions.lua',
	'client/testingcommands.lua',
}

server_exports {
    'getIdentifiant',
    'getIdentifier',
    'createUser'
}

ui_page('html/index.html')