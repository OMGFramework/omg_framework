function GetIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function GetIdentifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = GetIdentifiant(identifiers)
    return player
end

RegisterServerEvent("OMG:save_position")
AddEventHandler("OMG:save_position", function(LastPosX, LastPosY, LastPosZ, LastPosH)
    local source = source
    local player = GetIdentifier(source)
    local lastPosition = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. ", " .. LastPosH .. "}"
    MySQL.Async.execute("UPDATE player_account SET `player_position` = @player_position WHERE player_identifier = @username", { ['@username'] = player, ['@player_position'] = lastPosition })
    if omg_framework._display_logs == true then
        print('' .. _L("position_save") .. ' - ' .. _L("user") .. '' .. player .. ' - '..lastPosition)
		TriggerClientEvent("OMG:notification", source, "~g~Position Saved")
    end
end)

RegisterServerEvent("OMG:SpawnPlayer")
AddEventHandler("OMG:SpawnPlayer", function()
    local source = source
    local player = GetIdentifier(source)
    local player_data = MySQL.Sync.fetchAll('SELECT * FROM player_account WHERE player_identifier = @player_identifier', {
        ["@player_identifier"] = player
    })
    if player_data[1].player_first_spawn == 'first_spawn' then
        if omg_framework._player_first_spawn_location ~= "" then
            local ToSpawnPos = json.decode(omg_framework._player_first_spawn_location)
            local PosX = ToSpawnPos[1]
            local PosY = ToSpawnPos[2]
            local PosZ = ToSpawnPos[3]
            local PosH = ToSpawnPos[4]
            TriggerClientEvent("OMG:spawn_last_position", source, 0, PosX, PosY, PosZ)

            if omg_framework._display_logs == true then
                print('' .. _L("new_spawn_user") .. ' | ' .. player)
            end

        end
        MySQL.Async.execute("UPDATE player_account SET player_first_spawn = @player_first_spawn", { ["@player_first_spawn"] = 'not_first_spawn', })
    else
        MySQL.Async.fetchAll("SELECT * FROM player_account WHERE player_identifier = @username", { ['@username'] = player }, function(result)
            if (result) then
                for k, v in ipairs(result) do
                    if v.player_position ~= "" then
                        local ToSpawnPos = json.decode(v.player_position)
                        local PosX = ToSpawnPos[1]
                        local PosY = ToSpawnPos[2]
                        local PosZ = ToSpawnPos[3]
                        local PosH = ToSpawnPos[4]
                        TriggerClientEvent("OMG:spawn_last_position", source, 1, PosX, PosY, PosZ)
                        if omg_framework._display_logs == true then
                            print('' .. _L("user_reconnect") .. ' | '..player..' ' .. _L("user_reconnect2") .. '')
                        end
                    end
                end
            end
        end)
    end
end)