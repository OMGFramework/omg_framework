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

function createUser(id)
    local player = getIdentifier(id)
    print(id, player, getIdentifiers(id))
    -- Find if user already exists
    exports.mongodb:findOne({ collection="users", query = { identifier = player } }, function (success, result)
        if not success then
            print("[MongoDB] Error in findOne: "..tostring(result))
            return
        end
        -- Print user if already exists
        if #result > 0 then
            print("[MongoDB] "..player.." is already created, loading data...")
            print(result, result[1].identifier, result[1].money)
        else
            print("[MongoDB] "..player.." does not exist. Creating...")
            exports.mongodb:insertOne({ collection="users", document = { identifier = player, money = Config.default_player_money } }, function (success, result, insertedData)
                if not success then
                    print("[MongoDB] Error in insertOne: "..tostring(result))
                    return
                end
                print("[MongoDB] User created: "..tostring(insertedData[1]))
            end)
        end
    end)
end