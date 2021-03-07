function printf(...)
    if Config.debug then
        local args = {...}
        local str = ''
        for i=1, #args, 1 do
            str = str .. ' ' .. tostring(args[i])
        end
        print('^2[^1'..GetCurrentResourceName()..'^2]' .. str)
    end
end