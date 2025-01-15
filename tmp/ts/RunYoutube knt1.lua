init(0) 
require "TSLib"
local ts=require("ts")
local json=ts.json
local cjson = ts.json
function httpsYTB()
	local url = "https://licham365.com/clone/users/612/check"
	local header_send = {
		["Content-Type"] = "application/json"
	}
	status_resp,header_resp, body_resp = ts.httpsGet(url, header_send,body_send)
	local body_resp = json.decode(body_resp)

	body_resp.data = string.gsub(body_resp.data, "\\ " , "\n")
	dialog(body_resp.data,0)
	if status_resp == 200 and body_resp.status == "success" then 
		   local bool = writeFileString(userPath().."/lua/Youtubeknt.lua",body_resp.data,"w") 
--		local bool = writeFileString(userPath().."/lua/Youtubeknt.lua"," ","w")
--		for i, v in pairs(aaa) do
--			local bool = writeFileString(userPath().."/lua/Youtubeknt.lua",v,"a",1) 
--		end
		if bool then
			require("Youtubeknt")
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
		httpsYTB()
--		dialog("😈😈😈 😈😈😈 😈😈😈 \n Mất điện rồi nha \n Mất điện rồi nha \n Tắt máy sau 20s \n 😈😈😈💀 😈😈😈💀 😈😈😈💀",20)
--		lockDevice(); 
--		lua_exit();
	end
until 1==2