local decoder = {}

function decoder.decode(code, detected)
    if detected == "base64" then
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        code = code:gsub('[^'..b..'=]', '')
        return (code:gsub('.', function(x)
            if x == '=' then return '' end
            local r,f='',(b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r
        end):gsub('%d%d%d%d%d%d%d%d', function(x)
            return string.char(tonumber(x,2))
        end))
    end
    return code
end

return decoder
