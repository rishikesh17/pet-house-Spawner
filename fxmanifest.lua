name "pet-house-Spawner"
author "DarkStar"
version "v1.0"
description "Pet House Prop Script"
fx_version "cerulean"
game "gta5"
lua54 'yes'

dependencies { 'qb-input', 'qb-menu', 'qb-target','bzzz_doghouse_convert' }

client_scripts { 'client/policek9.lua' }

--server_scripts { '@oxmysql/lib/MySQL.lua', 'server/server.lua', }

shared_scripts { 'shared/config.lua', 'shared/functions.lua' }



data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_doghouse_convert.ytyp'