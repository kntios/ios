require("tsnet")
tb = {
    opts = {
        save = userPath().."/lua/1.lua"
    }
}
status,header,content = http.get("https://kieunhutrung1.github.io/ios/TS/1.lua",tb)
if status == 200 then
    dialog("ok")
    else
    dialog("cane")
end