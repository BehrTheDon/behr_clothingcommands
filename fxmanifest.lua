fx_version 'cerulean'
game 'gta5'

name "behr_clothingcommands"
description "Commands to toggle clothing"
author "Behr"
version '1.3.0'

lua54 'yes'

shared_scripts {
	'shared/config.lua'
}

client_scripts {
	'client/client.lua'
}

server_scripts {
	'server/server.lua'
}

ui_page 'web/index.html'

files {
	'web/index.html',
	'web/style.css',
	'web/script.js'
}


export 'toggleTop'
export 'toggleProp'
export 'toggleClothes'