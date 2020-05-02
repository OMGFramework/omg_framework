AddEventHandler('onMySQLReady', function()
    config = {
        player_money = omg_framework._default_player_money,
        player_bank_balance = omg_framework._default_player_bank_balance,
        player_dirty_money = omg_framework._default_player_dirty_money,
		player_job = omg_framework._default_player_job
    }
end)

playerInfoMoney = {}

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dumpinitializeinfo(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

RegisterServerEvent('OMG:spawn')
AddEventHandler('OMG:spawn', function()
    local source = source
    local player = _server_get_player_data_info(source)
    if player[1] ~= nil then
        TriggerClientEvent('OMG:initializeinfo', source, player[1].player_money, player[1].player_dirty_money, player[1].player_bank_balance, player[1].player_job)
    end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local source = source
    local player = _server_get_player_data_info(source)
    if player[1] == nil then
        creation_utilisateur(source)

        if omg_framework._display_logs == true then
            print('' .. _L("new_user") .. '| '..playerName..'')
        end

    end
end)