init(0) 
require "TSLib"
require("tsnet")
local ts=require("ts")
local json=ts.json
local cjson = ts.json
function httpsYTB()
tb = {
    opts = {
        save = userPath().."/lua/Youtube.lua"
    }
}
status,header,content = http.get("https://kieunhutrung1.github.io/ios/TS/1.lua",tb)
    if status == 200  then 
            require("Youtube")
            clear("/private/var/mobile/Media/TouchSprite/log")
            local statusProxy,ip,port = GetProxy()
            if statusProxy then 
                openURL("XoaInfo://SetUpProxy?proxyadd="..ip.."&port="..port.."&type=http")
                mSleep(8000)
                closeApp("com.ienthach.XoaInfo")
                mSleep(1000)
    
                    main()
                    --RespringData()
                    mSleep(1500)
                    pressHomeKey(0);    
                    pressHomeKey(1);
                    mSleep(1500)
                    pressHomeKey(0);     
                    pressHomeKey(1);
                    mSleep(1500)
            end    
    else
        openURL("XoaInfo://SetOffProxy")
        mSleep(8000)
        setAirplaneMode(true)
        mSleep(3000)
        setAirplaneMode(false)
        mSleep(20000)
    end
   
end


repeat
    package.loaded["Youtube"] = nil
    local pin = batteryStatus(); 
    if pin.charging == 1 then
        httpsYTB()
    else
        dialog("😈😈😈 😈😈😈 😈😈😈 \n Mất điện rồi nha \n Mất điện rồi nha \n Tắt máy sau 20s \n 😈😈😈💀 😈😈😈💀 😈😈😈💀",20)
        lockDevice(); 
        lua_exit();
    end
until 1==2