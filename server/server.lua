AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
end)

AddEventHandler("onDatabaseConnect", function (databaseName)
    print("[MongoDB][omg_framework] onDatabaseConnect: "..tostring(databaseName))
end)