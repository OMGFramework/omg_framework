local serverStarting = true

RegisterServerEvent('OMG:spawn')
AddEventHandler('OMG:spawn', function()
    local source = source
    -- TODO: Load all player data from DB
    printf("Placing player on server")
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
	loadUser(source)
end)

AddEventHandler("onDatabaseConnect", function (databaseName)
    printf("^2[MongoDB] onDatabaseConnect | "..tostring(databaseName))
    serverStarting = false
end)