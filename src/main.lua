local decoder = require("decoder")
local detector = require("detector")
local core = require("core")

local input_file = io.open("../input.lua", "r")
if not input_file then
    print("Errore: input.lua non trovato")
    os.exit(1)
end
local code = input_file:read("*all")
input_file:close()

local detected = detector.detect(code)
local deobf = decoder.decode(code, detected)
local cleaned = core.clean(deobf)

local output_file = io.open("../dump/output.lua", "w")
output_file:write(cleaned)
output_file:close()

print("Script deoffuscato salvato in dump/output.lua")
