resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'BTCtest'

version '2.0.0'



server_scripts {
	'@es_extended/locale.lua',
	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'client/client.lua'
}

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/notif.mp3'
    -- 'html/reset.css'
}
ui_page "html/index.html"
