local core = {}

function core.clean(code)
    code = code:gsub("[ \t]+", " ")
    code = code:gsub("\n+", "\n")
    return code
end

return core
