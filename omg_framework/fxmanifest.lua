fx_version 'adamant'

game 'gta5'

description 'OMG Framework'

version '1.0.0'

files {
	-- HUD
	'html/index.html',
    'html/js/script.js',
    'html/font/pricedown.ttf',
    'html/css/style.css',
	'html/icons/money.png',
	'html/icons/bank.png',
	'html/icons/dirtymoney.png',
	'html/icons/logo.png',
	-- Loadingscreen
    'loading/index.html',
    'loading/style.css',
	'loading/logo.png',
	'loading/music.mp3',
	'loading/script.js'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'version.lua',
	'version',
	-- Core
    'server/core/server.lua',
    'server/core/server_export.lua',
	-- Locale
    'server/player/player_position/server_position.lua',
	-- Locale
    'language/language.lua',
    'language/english.lua',
    'language/portuguese.lua'
}

client_scripts {
	'config.lua',
	-- Core
    'client/core/client.lua',
	'client/functions.lua',
	'client/testingcommands.lua',
	-- Player
    'client/player/player_position/client_position.lua',
	-- Locale
    'language/language.lua',
    'language/english.lua',
    'language/portuguese.lua'
}

server_exports {
    'getIdentifier',
    '_player_get_identifier',
    '_server_get_player_data_info',
    '_server_get_player_all_money',
    '_server_refrech_player_money',
    '_player_remove_money',
    '_player_add_money',
    '_player_add_bank_money',
    '_player_remove_bank_money',
    '_player_remove_money',
    '_player_remove_dirty_money',
    '_player_set_dirty_money',
    '_player_remove_money_for_bank',
    '_player_remove_bank_for_money',
    'save_player_position'
}

dependencies {
	'mysql-async'
}

ui_page('html/index.html')

loadscreen ('loading/index.html')