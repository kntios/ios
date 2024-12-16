init(0) 
require "TSLib"
local ts=require("ts")
local json=ts.json
local cjson = ts.json


function httpsYTB()
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/file-body/6"
    mSleep(math.random(1000,6000))
    status_resp, header_resp,body_resp = ts.httpGet(url, header_send, body_send)
    if status_resp == 200 and (string.find(body_resp,"message")==nil) then 
        local bool = writeFileString(userPath().."/lua/Youtube.lua",body_resp,"w") 
        if bool then
            require("Youtube")
            clear("/private/var/mobile/Media/TouchSprite/log")
            local statusProxy,ip,port = AddProxy()
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