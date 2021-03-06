fx_version 'cerulean'
games { 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'OMG Dev Team'
description 'A FiveM Framework for Multiple Gamemodes'
version '1.0.0'

server_scripts {
	'config.lua',
	'version.lua',
    'server/server.lua',
}

client_scripts {
	'config.lua',
    'client/client.lua',
	'client/functions.lua',
	'client/testingcommands.lua',
}

dependencies {
	'fivem-mongodb'
}