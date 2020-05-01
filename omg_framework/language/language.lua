Locales = {}

function _(str, ...)
    if Locales[omg_framework._language] ~= nil then
        if Locales[omg_framework._language][str] ~= nil then
            return string.format(Locales[omg_framework._language][str], ...)
        else
            return 'Translation [' .. omg_framework._language .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. omg_framework._language .. '] does not exist'
    end
end

function _L(str, ...)
    return tostring(_(str, ...):gsub("^%l", string.upper))
end