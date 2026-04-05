local detector = {}

function detector.detect(code)
    if code:find("[A-Za-z0-9+/]+=*") then
        return "base64"
    end
    return "plain"
end

return detector
