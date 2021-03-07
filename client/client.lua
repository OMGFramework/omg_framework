local firstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn then
		TriggerServerEvent('OMG:spawn')
		firstSpawn = false
	end
end)

-- Spawn with a fake skin, just for now xD [WIP]
AddEventHandler("playerSpawned", function(spawn)
	local defaultModel = GetHashKey('mp_m_freemode_01')
	RequestModel(defaultModel)
	while not HasModelLoaded(defaultModel) do
		Citizen.Wait(10)
	end
	SetPlayerModel(PlayerId(), defaultModel)
	SetPedDefaultComponentVariation(PlayerPedId())
	SetModelAsNoLongerNeeded(defaultModel)
end)

Citizen.CreateThread(function()
	if Config.IPLs then
	RequestIpl('shr_int') -- Load vehicleshop
	RequestIpl("rc12b_default") -- Pillbox Hospital (hole in map)
	end
end)

RegisterCommand("coords", function(source , args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = false, args = {Config.server_name, "~r~X:~s~"..coords.x..", ~r~Y:~s~"..coords.y..", ~r~Z:~s~"..coords.z}})
end, false)