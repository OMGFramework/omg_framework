function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function getIdentifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiers(id)
    for k,v in ipairs(GetPlayerIdentifiers(id))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end
    return identifier, license, liveid, xblid, discord, playerip
end

function loadUser(id)
    local player = getIdentifier(id)
    printf(id, player, getIdentifiers(id))
    exports.mongodb:findOne({ collection="users", query = { identifier = player } }, function (success, result)
        if not success then
            printf("[MongoDB] Error in findOne: "..tostring(result))
            return
        end
        if #result > 0 then
            printf("[MongoDB] "..player.." is already created, loading data...")
            print(result, result[1].identifier, result[1].money)
        else
            printf("[MongoDB] "..player.." does not exist. Creating...")
            exports.mongodb:insertOne({ collection="users", document = { identifier = player, money = Config.default_player_money } }, function (success, result, insertedData)
                if not success then
                    printf("[MongoDB] Error in insertOne: "..tostring(result))
                    return
                end
                printf("[MongoDB] User created: "..tostring(insertedData[1]))
            end)
        end
    end)
end