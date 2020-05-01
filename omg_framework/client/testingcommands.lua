RegisterCommand("clearchat", function() 
    TriggerEvent('chat:clear')
    SystemNotification("Chat Clear", "SYSTEM")
end)

RegisterCommand("revive", function()
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player)
    SetEntityHealth(player, 100)
	SetEntityCoords(player, coords.x, coords.y, coords.z)
end)

RegisterCommand("skin", function() 
    local ped = PlayerId()
	local model = GetHashKey("player_one")
	RequestModel(model)
	while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
	SetPlayerModel(ped, model)
	SetModelAsNoLongerNeeded(model)
end)

RegisterCommand("suicide", function()
    local player = GetPlayerPed(-1)
    RequestAnimDict('mp_suicide')
    while not HasAnimDictLoaded('mp_suicide') do Wait(0) end
    TaskPlayAnim(player, 'mp_suicide', 'pill', 8.0, 1.0, 5000, 0, 1, true, true, true)
    Wait(4600)
    SetEntityHealth(player, 0)
end)

RegisterCommand("giveweapons", function()
    local player = GetPlayerPed(-1)
	GiveWeaponToPed(player, "WEAPON_KNIFE", 1000, false, true)
	GiveWeaponToPed(player, "WEAPON_PISTOL", 1000, false, true)
	GiveWeaponToPed(player, "WEAPON_RPG", 1000, false, true)
	GiveWeaponToPed(player, "WEAPON_SMG", 1000, false, true)
	GiveWeaponToPed(player, "WEAPON_MINIGUN", 1000, false, true)
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	 end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      --(https://pastebin.com/8EuSv2r1)
      RemoveAllPickupsOfType(0xDF711959) -- Carbine rifle
      RemoveAllPickupsOfType(0xF9AFB48F) -- Pistol
      RemoveAllPickupsOfType(0xA9355DCD) -- Pumpshotgun
    end
end)]]--

RegisterCommand('car', function(source, args, rawCommand)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.5))
    local veh = args[1]
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 10000 then
				Notification ("~r~Impossible spawn vehicle", "Mechanic")
                break
            end
        end
        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+10, 1, 0)
		Notification ("Vehicle ~g~spawned~s~", "Mechanic")
    end)
end)

RegisterCommand('dv', function(source, args, rawCommand)
local distanceToCheck = 5.0
    local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )
            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
                if ( DoesEntityExist( vehicle ) ) then 
					Notification ("~r~Impossible delete this vehicle", "Mechanic")
                else 
					Notification ("Vehicle ~r~deleted~s~", "Mechanic")
                end 
            else 
				Notification ("You might be inside the car", "Mechanic")
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
                if ( DoesEntityExist( vehicle ) ) then 
					Notification ("~r~Impossible delete this vehicle", "Mechanic")
                else 
					Notification ("Vehicle ~r~deleted~s~", "Mechanic")
                end 
            else 
				Notification ("You might be near the car", "Mechanic")
            end 
        end 
    end 
end )

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

RegisterCommand('fix', function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		Notification ("Vehicle repaired", "Mechanic")
	else
		SystemNotification ("You might be inside the vehicle", "SYSTEM")
	end
end)

RegisterCommand('clear', function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		Notification ("Vehicle cleaned", "Mechanic")
	else
		SystemNotification ("You might be inside the vehicle", "SYSTEM")
	end
end)

function Notification(message,title)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, title)
    DrawNotification(false, true)
end

function SystemNotification(message,title)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_MP_FM_CONTACT", "CHAR_MP_FM_CONTACT", true, 1, title)
    DrawNotification(false, true)
end