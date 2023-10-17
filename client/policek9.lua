print("^2RK^7-^2DogHouse v^41^7.^40 ^7- ^2Shop Script by ^1DarkStar^7")

local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)
local QBCore = exports['qb-core']:GetCoreObject()

PoliceLocations = {
    --Add your poly zone box locations and job name for each store and it will add it to the qb-target loop above
    { coords = vector3(379.0, -1634.44, 29.28), heading = 40.21, }, -- Davis PD
	{ coords = vector3(446.97, -999.95, 30.72), heading = 210.42, }, -- MRPD
	
}

local doghouse = {}
CreateThread(function()
	for k, v in pairs(PoliceLocations) do
		doghouse[#doghouse+1] = makeProp({ prop = `ch2_05c_b1_chophse`, coords = vec4(v.coords.x, v.coords.y, v.coords.z, v.heading)}, 1, 0)
	end
end)

 
AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for _, v in pairs(ped) do unloadModel(v) if IsModelAPed(GetEntityModel(v)) then DeletePed(v) else DeleteObject(v) end end
end)