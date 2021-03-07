local serverStarting = true

RegisterServerEvent('OMG:spawn')
AddEventHandler('OMG:spawn', function()
    local source = source
    --loadUser(source)
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local source = source
    if serverStarting then
        deferrals.defer()
        Wait(1)
        deferrals.update(string.format(Config.server_name.." is starting, please wait :)"))
    else
        loadUser(source)
        printf('New user | '..playerName)
    end
end)

RegisterCommand("test", function(source , args, rawCommand)
	--loadUser(source)
    saveUser(source)
end, false)

AddEventHandler("onDatabaseConnect", function (databaseName)
    printf("^2[MongoDB] onDatabaseConnect | "..tostring(databaseName))
    serverStarting = false
end)

RegisterServerEvent('OMG:saveUser')
AddEventHandler('OMG:saveUser', function(data)
    local source = source
    saveUser(source, data)
end)

-- TODO: Save players every Citizen.Wait(10 * 60 * 1000)
Citizen.CreateThread(function()
    local players = GetNumPlayerIndices()
	while true do
		Citizen.Wait(10 * 60 * 1000)
        for i=1, players, 1 do
            --saveUser(players)
            print(players)
            players = players-1
        end
        printf("Saving "..players.." players")
	end
end)