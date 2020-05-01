local firstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn == true then
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

RegisterNetEvent('OMG:initializeinfo')
AddEventHandler('OMG:initializeinfo', function(money,dirtymoney,bankbalance)

	SendNUIMessage({
		initialise = true,
		money = money,
		dirtymoney = dirtymoney,
		bankbalanceinfo = bankbalance
	})

end)

RegisterNetEvent('OMG:bankbalance')
AddEventHandler('OMG:bankbalance', function(rslt)

	SendNUIMessage({
		bankbalanceinfo = rslt
	})

end)

RegisterNetEvent('OMG:dirtymoney')
AddEventHandler('OMG:dirtymoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rlst
	})

end)

RegisterNetEvent('OMG:money')
AddEventHandler('OMG:money', function(rslt)

	SendNUIMessage({
		moneyinfo = rslt
	})

end)

RegisterNetEvent('OMG:rmvMoney')
AddEventHandler('OMG:rmvMoney', function(rslt)

	SendNUIMessage({
		rmvMoney = rslt
	})

end)

RegisterNetEvent('OMG:addMoney')
AddEventHandler('OMG:addMoney', function(rslt)

	SendNUIMessage({
		addMoney = rslt
	})

end)

RegisterNetEvent('OMG:rmvBank')
AddEventHandler('OMG:rmvBank', function(rslt)

	SendNUIMessage({
		rmvBank = rslt
	})

end)

RegisterNetEvent('OMG:addBank')
AddEventHandler('OMG:addBank', function(rslt)

	SendNUIMessage({
		addBank = rslt
	})

end)

RegisterNetEvent('OMG:removeMoneyForBank')
AddEventHandler('OMG:removeMoneyForBank', function(rslt)

	SendNUIMessage({
		rmvMoneyForBank = rslt
	})

end)

RegisterNetEvent('OMG:removeBankForMoney')
AddEventHandler('OMG:removeBankForMoney', function(rslt)

	SendNUIMessage({
		rmvBankForMoney = rslt
	})

end)


RegisterNetEvent('OMG:addDirtyMoney')
AddEventHandler('OMG:addDirtyMoney', function(rslt)

	SendNUIMessage({
		addDirtyMoney = rslt
	})

end)


RegisterNetEvent('OMG:rmvDirtyMoney')
AddEventHandler('OMG:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		rmvDirtyMoney = rslt
	})

end)


RegisterNetEvent('OMG:setDirtyMoney')
AddEventHandler('OMG:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rslt
	})

end)

Citizen.CreateThread(function()
	if omg_framework._IPLs then
	RequestIpl('shr_int') -- Load vehicleshop
	RequestIpl("rc12b_default") -- Pillbox Hospital (hole in map)
	end
end)