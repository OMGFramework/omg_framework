Locales = {}

function _(str, ...)
    if Locales[Config.locale] ~= nil then
        if Locales[Config.locale][str] ~= nil then
            return string.format(Locales[Config.locale][str], ...)
        else
            return 'Translation [' .. Config.locale .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. Config.locale .. '] does not exist'
    end
end

function _L(str, ...)
    return tostring(_(str, ...):gsub("^%l", string.upper))
end