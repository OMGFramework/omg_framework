Citizen.CreateThread(function()
    function _omg_framework_checker(err, response, headers)
        local data = json.decode(response)
        local get_data_file = LoadResourceFile(GetCurrentResourceName(), "version.json")
        local version_json = json.decode(get_data_file).version
        if tostring(version_json) ~= tostring(data.version) and tostring(version_json) < tostring(data.version) then
            print("^2------------------------OMG Information--------------------------------")
            print('' .. _L("startup") .. '')
            print('^2[^1' .. omg_framework._sufix .. "^2] https://github.com/dev-omg")
            print('' .. _L("startup2") .. '' .. version_json .. '')
			print('' .. _L("startup3") .. '' .. data.version .. '')
            print('' .. _L("settings") .. '' .. tostring(omg_framework._language) .. '')
            print('' .. _L("settings2") .. '' .. tostring(omg_framework._display_logs) .. '')
            print("^2--------------------------------------------------------------------------")
        elseif tostring(version_json) > tostring(data.version) then
            print("^2--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print("^2--------------------------------------------------------------------------")
        else
            print("^2--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print('' .. _L("startup2") .. '' .. data.version .. '')
            print('' .. _L("settings") .. '' .. tostring(omg_framework._language) .. '')
            print('' .. _L("settings2") .. '' .. tostring(omg_framework._display_logs) .. '')
            print("^2--------------------------------------------------------------------------")
        end
        SetTimeout(600000, _request_check_fivem_core_http)
    end
    function _request_check_fivem_core_http()
        PerformHttpRequest("https://pastebin.com/raw/PWgev2cp", _omg_framework_checker, "GET")
    end
    _request_check_fivem_core_http()
end)