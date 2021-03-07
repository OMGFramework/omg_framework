RegisterServerEvent('OMG:spawn')
AddEventHandler('OMG:spawn', function()
    local source = source
    createUser(source)
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local source = source
    local player = _server_get_player_data_info(source)
    if player[1] == nil then
        creation_utilisateur(source)

        if Config.Debug == true then
            print('' .. _L("new_user") .. '| '..playerName..'')
        end

    end
end)

RegisterCommand("test", function(source , args, rawCommand)
	createUser(source)
end)