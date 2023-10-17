local QBCore = exports['qb-core']:GetCoreObject()
local debugCheck=true
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

RegisterNetEvent('pet-menu:client:Menu:Close', function()
	emptyHands(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)		
	exports['qb-menu']:closeMenu()
end)
local time = 1000
function loadModel(model) if not HasModelLoaded(model) then
	if debugCheck then 
		print("^5Debug^7: ^3loadModel^7(): ^2Loading Model^7: '^6"..model.."^7'") 
	end
		while not HasModelLoaded(model) do
			if time > 0 then 
				time = time - 1 
				RequestModel(model)
			else 
				time = 1000 
				print("^5Debug^7: ^3loadModel^7(): ^2Timed out loading model ^7'^6"..model.."^7'") 
				break
			end
			Wait(10)
		end
	end
end

function emptyHands(playerPed, dpemote)
	if dpemote ~= nil then TriggerEvent('animations:client:EmoteCommandStart', {"c"}) ClearPedTasks(playerPed)
	else ClearPedTasks(playerPed) end
	for k, v in pairs(GetGamePool('CObject')) do
		for _, model in pairs({`prop_sponge_01`, `prop_weld_torch`, `prop_rag_01`, `prop_fib_clipboard`, `v_ind_cs_toolbox4`, `p_amb_clipboard_01`, `ng_proc_spraycan01b`}) do
			if GetEntityModel(v) == model then
				if IsEntityAttachedToEntity(playerPed, v) then
					unloadModel(model)
					DeleteObject(v)
					DetachEntity(v, 0, 0)
					SetEntityAsMissionEntity(v, true, true)
					Wait(100)
					DeleteEntity(v)
				end
			end
		end
	end
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or 0, synced or 0, 0)
    SetEntityHeading(prop, data.coords.w-180.0)
    FreezeEntityPosition(prop, freeze or 0)
    if debugCheck then print("^5Debug^7: ^6Prop ^2Created ^7: '^6"..prop.."^7'") end
    return prop
end


function unloadModel(model) if debugCheck then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end
function loadAnimDict(dict)	if not HasAnimDictLoaded(dict) then if debugCheck then print("^5Debug^7: ^2Loading Anim Dictionary^7: '^6"..dict.."^7'") end while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end end
function unloadAnimDict(dict) if debugCheck then print("^5Debug^7: ^2Removing Anim Dictionary^7: '^6"..dict.."^7'") end RemoveAnimDict(dict) end
function loadPtfxDict(dict)	if not HasNamedPtfxAssetLoaded(dict) then if debugCheck then print("^5Debug^7: ^2Loading Ptfx Dictionary^7: '^6"..dict.."^7'") end while not HasNamedPtfxAssetLoaded(dict) do RequestNamedPtfxAsset(dict) Wait(5) end end end
function unloadPtfxDict(dict) if debugCheck then print("^5Debug^7: ^2Removing Ptfx Dictionary^7: '^6"..dict.."^7'") end RemoveNamedPtfxAsset(dict) end