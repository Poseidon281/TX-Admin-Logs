fx_version 'cerulean'
game 'gta5'

name "TXAdmin-Logs"
description "Dit script is custom geschreven om TXADMIN naar Discord te loggen"
author "Senna"
version "1.2.0"
lua54 'yes'

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

dependencies {
    'es_extended'
}
