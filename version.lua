Citizen.CreateThread(function()
    function omg_framework_checker(err, response, headers)
        local data = json.decode(response)
        local get_data_file = LoadResourceFile(GetCurrentResourceName(), "version.json")
        local version_json = json.decode(get_data_file).version
        if tostring(version_json) ~= tostring(data.version) and tostring(version_json) < tostring(data.version) then
            -- Outdated
            print("^2------------------------OMG Information--------------------------------")
            print('' .. _L("startup") .. '')
            print('^2[^1' .. Config.server_name .. "^2] www.github.com/OMGFramework/omg_framework")
            print('' .. _L("startup2") .. '' .. version_json .. '')
			print('' .. _L("startup3") .. '' .. data.version .. '')
            print('' .. _L("settings") .. '' .. tostring(Config.locale) .. '')
            print('' .. _L("settings2") .. '' .. tostring(Config.debug) .. '')
            print("^2--------------------------------------------------------------------------")
        elseif tostring(version_json) > tostring(data.version) then
            -- Pre-Release
            print("^2--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print("^2--------------------------------------------------------------------------")
        else
            -- Updated
            print("^2--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print('' .. _L("startup2") .. '' .. data.version .. '')
            print('' .. _L("settings") .. '' .. tostring(Config.locale) .. '')
            print('' .. _L("settings2") .. '' .. tostring(Config.debug) .. '')
            print("^2--------------------------------------------------------------------------")
        end
    end
    PerformHttpRequest("https://omgframework.github.io/api/version.json", omg_framework_checker, "GET")
end)