local firstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn == true then
		print('OMG:spawn')
		firstSpawn = false
	end
end)

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn == true then
		local defaultModel = GetHashKey('mp_m_freemode_01')
		RequestModel(defaultModel)
		while not HasModelLoaded(defaultModel) do
			Citizen.Wait(100)
		end
		SetPlayerModel(PlayerId(), defaultModel)
		SetPedDefaultComponentVariation(PlayerPedId())
		SetModelAsNoLongerNeeded(defaultModel)
	end
end)

Citizen.CreateThread(function()
	if Config.IPLs then
	RequestIpl('shr_int') -- Load vehicleshop
	RequestIpl("rc12b_default") -- Pillbox Hospital (hole in map)
	end
end)