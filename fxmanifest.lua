fx_version 'cerulean'
game 'gta5'

name "behr_clothingcommands"
description "Commands to toggle clothing"
author "Behr"
version '1.2.7'

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

export 'toggleShirt'       -- exports['behr_clothingcommands']:toggleShirt()
export 'toggleJacket'      -- exports['behr_clothingcommands']:toggleJacket()
export 'togglePants'       -- exports['behr_clothingcommands']:togglePants()
export 'toggleShoes'       -- exports['behr_clothingcommands']:toggleShoes()
export 'toggleHat'         -- exports['behr_clothingcommands']:toggleHat()
export 'toggleGlasses'     -- exports['behr_clothingcommands']:toggleGlasses()
export 'toggleBackpack'    -- exports['behr_clothingcommands']:toggleBackpack()
export 'toggleWatch'       -- exports['behr_clothingcommands']:toggleWatch()
export 'toggleBracelet'    -- exports['behr_clothingcommands']:toggleBracelet()
export 'toggleChain'       -- exports['behr_clothingcommands']:toggleChain()
export 'toggleMask'        -- exports['behr_clothingcommands']:toggleMask()
export 'toggleHair'        -- exports['behr_clothingcommands']:toggleHair()
export 'toggleArms'        -- exports['behr_clothingcommands']:toggleArms()
export 'toggleVest'        -- exports['behr_clothingcommands']:toggleVest()
export 'toggleDecal'       -- exports['behr_clothingcommands']:toggleDecal()
export 'toggleEar'         -- exports['behr_clothingcommands']:toggleEar()