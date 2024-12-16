init(0) 
require "TSLib"
local ts=require("ts")
local json=ts.json
math.randomseed(os.time())
setVolumeLevel(0)
--setBacklightLevel(math.random(0,60)/100)
mSleep(500)
    local FullID = readFile(userPath() .. "/lua/Aliasld.txt")
    local strFullID = FullID[1]
	local FullID = strSplit(strFullID,"|")
    local ID_Domain = FullID[1]
    local ID_Proxy = FullID[2]
    local ID_KeyName = FullID[3]

function Tap(x,y)
	tap(x,y,{["ms"]=math.random(35,90)+math.random(-200,200)/100,["index"] = math.random(1,9)})
    mSleep(math.random(10,70)+math.random(-200,200)/100)
end

function isVietnameseQuick(text)
    for i = 1, #text do
        local charCode = utf8.codepoint(text, i, i)
        -- Kiểm tra nếu mã Unicode của ký tự lớn hơn 127 (vượt khỏi ASCII tiêu chuẩn)
        if charCode > 127 then
            return false
        end
    end
    return true
end


function input(key)
    if isVietnameseQuick(key) and ocrText(233,1062,445,1120,0) == "space" then
        --typing(key,"pass")
        inputText(key)
    else
        inputText(key)
    end
end

function usleep(x)
	mSleep(x/1000)
end

function findColorsClick(color,x,y,x1,y1,maxRetry,isPass, isClick,dentaX,dentaY,note)
  local res_x
  local res_y
    local retryCount = 0   
    local result = {}
    repeat 
        if note ~= "note" then
            toast(note)
        end
        if retryCount >=maxRetry then
            if isPass then
                break
            else
                run()
            end
        end
        res_x,res_y = findColorInRegionFuzzy(color, 100, x,y,x1,y1) 
        mSleep(500)
        retryCount = retryCount + 1	
    until (res_x ~= -1) and (res_y ~= -1)
    if isClick then
          result[1] = res_x
          result[2] = res_y
          local x = res_x+dentaX
          local y = res_y+dentaY
			    mSleep(math.random(400,600))
          tap(x,y,{["ms"]=math.random(15,50),["index"] = math.random(1,9)})
          mSleep(16);
    end
	result[1] = res_x
    result[2] = res_y
    return result
end

function readState()
    local file = io.open(userPath() .. "/lua/statefile.txt", "r")
    if file then
        local state = file:read("*a")
        file:close()
        local result = strSplit(state, "|")
        if #result >= 2 then
            return result[1] == "true", result[2]
        else
            
            return result[1] == "true", 30  
        end
    else
        return false,30
    end
end

function writeState(state)
    local file = io.open(userPath() .. "/lua/statefile.txt", "w")
    file:write(tostring(state))
    file:close()
end

function readSave()
    local file = io.open(userPath() .. "/lua/save.txt", "r")
    if file then
        local state = file:read("*a")
        file:close()
        return state == "true"
    else
        return false
    end
end

function SearchVideo(str)
    if (str) then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w %-%_%.%~])",
            function(c) return string.format("%%%02X", string.byte(c)) end)
        str = string.gsub(str, " ", "+")
        openURL("youtube://www.youtube.com/results?search_query=" .. str)
        return true
    end
    return false
end

function httpGetCommon(url)
    status_resp, header_resp,body_resp = ts.httpGet(url, header_send, body_send)
    if status_resp ==200 then
        --dialog("OK")
        return body_resp,status_resp
    else
       return "",status_resp
    end    
end
function httpsGetCommon(url)
    status_resp, header_resp,body_resp = ts.httpsGet(url, header_send, body_send)
    if status_resp ==200 then
        --dialog("OK")
        return body_resp,status_resp
    else
       return "",status_resp
    end    
end

function GetProxy()
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/"..ID_Proxy
    local response = {}
    for i=1,20 do
        toast("Get Proxy")
        mSleep(math.random(1000,2200))
        local Result,status = httpGetCommon(url)
        if status==200 and (string.find(Result,"error")==nil) then 
            local fulldata = strSplit(Result,":"); 
            return true,fulldata[1],fulldata[2] 
        end
        mSleep(math.random(5000,10000))
    end
	return false,1,1
end

function GetVideo()
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/"..ID_KeyName
    local response = {}
    for i=1,20 do
        toast("Get Name Video")
        mSleep(math.random(1000,2200))
        local Result,status = httpGetCommon(url)
        if status==200 and (string.find(Result,"validationErrors")==nil) then 
            return true, Result
        end
        mSleep(math.random(5000,10000))
    end
	return false,1
end
function GetDomain()
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/9999"
    local response = {}
    for i=1,20 do
        toast("Get Domain")
        mSleep(math.random(1000,2200))
        local Result,status = httpGetCommon(url)
        if status==200 and (string.find(Result,"validationErrors")==nil) then 
            local fulldata = strSplit(Result,"|"); 
            return true,fulldata[1],fulldata[2] 
        end
        mSleep(math.random(5000,10000))
    end
	return false,1
end

function surf_Down(x_res,y_res,option)
	local res_x = math.random(-35,35)+math.random(-150,150)/100
	local res_y = math.random(-10,30)+math.random(-150,180)/100
	local finger = math.random(-1,7)
	local pic = math.random(1,2)
	touchDown(2+finger, x_res+res_x, y_res+res_y);
    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
    touchMove(2+finger, x_res+1.04+res_x+math.random(-100,100)/100, y_res-12.38+res_y+math.random(-500,500)/100);
    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
    touchMove(2+finger, x_res+1.04+res_x+math.random(-100,100)/100, y_res-31.84+res_y+math.random(-800,800)/100);
    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
	
	local x = x_res+1.04+res_x
	local y = y_res-31.84+res_y
	
    local move
    if option == "short" then
        move = math.random(4,6)
    else
	    move = math.random(6,10)
    end
	for i=1,move do
		if pic == 1 then
			x=x+math.random(250,450)/100
		else
			x=x-math.random(250,450)/100
		end
		y = y - math.random(3000,5000)/100
        touchMove(2+finger, x, y);
        usleep(math.random(16000,16600)+ math.random(-100,100)/100);
	end
	
	local move2 = math.random(2,4)
	for i=1,move2 do
		if pic == 1 then
			x=x+math.random(100,200)/100
		else
			x=x-math.random(100,200)/100
		end
		y = y - math.random(250,600)/100
        touchMove(2+finger, x, y);
        usleep(math.random(16200,16800)+ math.random(-100,100)/100);
	end
		
    touchMove(2+finger, x+math.random(-80,80)/100, y);
    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
    touchUp(2+finger, x+math.random(-80,80)/100, y-math.random(100,300)/100);
	mSleep(math.random(700,900)+math.random(-100,100)/100)
end

function surf_Up(x_res,y_res,option)
    local res_x = math.random(-35,35)+math.random(-150,150)/100
	local res_y = math.random(-10,30)+math.random(-150,180)/100
    local finger = math.random(-1,7)
    local pic = math.random(1,2)
    touchDown(2+finger, x_res+res_x, y_res+res_y)
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(2+finger, x_res+1.04+res_x+math.random(-100,100)/100, y_res+12.38+res_y+math.random(-500,500)/100)
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(2+finger, x_res+1.04+res_x+math.random(-100,100)/100, y_res+31.84+res_y+math.random(-800,800)/100)
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    
    local x = x_res + 1.04 + res_x
    local y = y_res + 31.84 + res_y
    
    local move
    if option == "short" then
        move = math.random(4,6)
    else
        move = math.random(6,10)
    end
    for i = 1, move do
        if pic == 1 then
            x = x + math.random(250,450)/100
        else
            x = x - math.random(250,450)/100
        end
        y = y + math.random(3000,5000)/100
        touchMove(2+finger, x, y)
        usleep(math.random(16000,16600) + math.random(-100,100)/100)
    end
    
    local move2 = math.random(2,4)
    for i = 1, move2 do
        if pic == 1 then
            x = x + math.random(100,200)/100
        else
            x = x - math.random(100,200)/100
        end
        y = y + math.random(250,600)/100
        touchMove(2+finger, x, y)
        usleep(math.random(16200,16800) + math.random(-100,100)/100)
    end
    
    touchMove(2+finger, x + math.random(-80,80)/100, y)
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchUp(2+finger, x + math.random(-80,80)/100, y + math.random(100,300)/100)
    mSleep(math.random(700,900) + math.random(-100,100)/100)
end

function OffProxy()
    openURL("prefs:root=WIFI")
    mSleep(2500)
    local InfoWifi = findColorsClick(31487,680,250,700,400,15,true, true,3,15,"note")
    if InfoWifi[1] ~= -1 then
        mSleep(2000)
        for i=1,2 do 
            touchDown(6, 306.83, 769.42);
            usleep(16504.50);
            touchMove(6, 325.12, 653.92);
            usleep(0.00);
            touchMove(6, 325.12, 653.92);
            usleep(16409.71);
            touchMove(6, 384.04, 484.73);
            usleep(0.00);
            touchMove(6, 384.04, 484.73);
            usleep(16771.92);
            touchUp(6, 388.11, 480.67);
            usleep(0.00);
            touchUp(6, 388.11, 480.67);
            mSleep(2000)
        end
        local Proxy = findColorsClick(0,610,1150,700,1300,10,true, true,10,10,"note")
        if Proxy[1] ~= -1 then
            mSleep(1000)
            local Off = findColorsClick(31487,670,300,720,400,10,true, true,5,-100,"note")
            if Off[1] ~= -1 then
                mSleep(500)
                local Save = findColorsClick(31487,630,60,700,110,10,true, true,10,10,"note")
                mSleep(1000)
                Tap(576,85)
                mSleep(2000)
            end
        end
    end
end

function Log_Domain()
    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100
    local strDomain
    local strPass
    local status
    local InputMail = findColorsClick(7632757,65,640,80,800,15,true, true,140+ran_x-rd,60+rd+rd2,"note")
    if InputMail[1] ~= -1  then
        mSleep(math.random(2000,2500)+math.random(-100,100)/100)
        status, strDomain, strPass = GetDomain()
        if status then
            inputText(strDomain)
            mSleep(math.random(1200,2000)+math.random(-100,100)/100)
            Tap(655-rd-rd2,1280+rd-rd2)
            mSleep(math.random(3000,4000)+math.random(-100,100)/100)
            local InputPass = findColorsClick(7632757,65,650,80,820,200,true, true,140+ran_x-rd,60+rd+rd2,"note")
            if InputPass[1] ~= -1  then
                mSleep(math.random(2000,2500)+math.random(-100,100)/100)
                inputText(strPass)
                mSleep(math.random(1200,2000)+math.random(-100,100)/100)
                Tap(655-rd+rd2,1280+rd+rd2)
                mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                local savePass = findColorsClick(31487,300,780,500,1250,2,true, true,0,0,"note")
                local CheckLoad
                local CheckOpenApp
                for i=1,100 do 
                    CheckLoad = findColorsClick(15286837,60,150,120,230,1,true, false,0,0,"note")    ---load agree
                    CheckOpenApp = findColorsClick(16711731,20,50,80,100,1,true, false,0,0,"note")
                    if CheckLoad[1] ~= -1 or CheckOpenApp[1] ~= -1  then break end
                end
                if CheckLoad[1] ~= -1 then
                    mSleep(3000)
                    for i=1,6 do 
                        touchDown(1, 311.90, 677.22);
                        usleep(16416.75);
                        touchMove(1, 314.95, 642.78);
                        usleep(16470.58);
                        touchMove(1, 315.97, 591.11);
                        usleep(16738.75);
                        touchMove(1, 325.12, 522.20);
                        usleep(16676.33);
                        touchMove(1, 344.42, 447.23);
                        usleep(16650.33);
                        touchMove(1, 370.84, 358.09);
                        usleep(16776.67);
                        touchMove(1, 403.35, 274.00);
                        usleep(16321.75);
                        touchUp(1, 407.41, 269.94);
                        mSleep(math.random(800,1200)+math.random(-100,100)/100)
                    end
                    mSleep(2000)
                    Tap(60,1140)
                    mSleep(500)
                    local Agree = findColorsClick(743376,240,1020,650,1230,5,true, true,30+rd+rd2,20+rd,"note")
                    mSleep(500)
                    CheckOpenApp = findColorsClick(16711731,20,50,80,100,200,true, false,0,0,"note")
                end
                if CheckOpenApp[1] ~= -1  then
                    mSleep(8000)
                    local saveVideo = findColorsClick(15921906,530,750,532,1180,15,true, true,-rd,rd2,"note")
                    if saveVideo[1] ~= -1  then
                        mSleep(2000)
                        local ON = findColorsClick(417748,540,1000,620,1220,15,true, true,0,0,"note")
                        mSleep(math.random(500,600)+math.random(-100,100)/100)
                        mSleep(8000)
                    end
                end
            end
        else
            dialog("Hết Mail",10)
        end
    end
end


function main()
    local deviceTime = os.time()

    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100
    local strVideo
    closeApp("com.google.ios.youtube")
    mSleep(3000)
    local OffTB = findColorsClick(31487,150,400,520,860,1,true, true,2,3,"note")
    runApp("com.google.ios.youtube")
    mSleep(6000)
    local CheckOpenApp
    for i=1,30 do
        if getColor(280,5)==1714737 or getColor(300,450)==1714737 then
            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
            Tap(320-rd+rd2,1015)
            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
        end
        CheckOpenApp = findColorsClick(16711731,20,50,80,100,1,true, false,0,0,"note")
        if CheckOpenApp[1] ~= -1  then break end
        if getColor(10,86) == 10066329 then
            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
            local No_error = findColorsClick(4359669,220,580,650,1000,1,true, true,5,5,"note")
            local Allow = findColorsClick(31487,220,580,650,1000,1,true, true,30-rd+rd2,0,"note")
        else 
            local signin = findColorsClick(417748,372,880,374,920,1,true, false,ran_x2-rd2,30+rd,"note")
            if signin[1] ~= -1  then
                openURL("XoaInfo://SetOffProxy")
                mSleep(10000)
                runApp("com.google.ios.youtube")
                mSleep(4000)
                local signin = findColorsClick(417748,372,880,374,920,30,true, true,ran_x2-rd2,30+rd,"note")
                if signin[1] ~= -1  then
                    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                    local continue = findColorsClick(31487,420,740,560,830,100,true, true,30-rd+rd2,0,"note")
                    if continue[1] ~= -1  then
                        mSleep(5000)
                        local checkMail
                        for i=1,15 do
                            checkMail = findColorsClick(7632757,65,630,80,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                            if checkMail[1] ~= -1  then break end
                            Tap(590,280)
                            mSleep(500)
                        end
                        if checkMail[1] ~= -1  then
                            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
                            Log_Domain()
                        end
                    end
                end
            end
        end
    end
    if CheckOpenApp[1] ~= -1  then
        mSleep(math.random(3000,4000)+math.random(-100,100)/100)
        Tap(675+rd,1275+rd2)
        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
        local switch_acc
        for i=1,40 do  --- không lấy từ 0
            if i % 10 == 0 then
                Tap(675+rd,1275-rd2)
                mSleep(math.random(2000,3000)+math.random(-100,100)/100)
            end
            switch_acc = findColorsClick(986895,125,340,170,380,1,true, true,ran_x-rd,rd,"note")
            if switch_acc[1] ~= -1 then
                mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                break
            end
            local Check_Log = findColorsClick(417748,350,960,360,1080,1,true, false,rd+rd2,30-rd2,"note")
            if Check_Log[1] ~= -1 then
                openURL("XoaInfo://SetOffProxy")
                mSleep(10000)
                runApp("com.google.ios.youtube")
                mSleep(math.random(5000,6000)+math.random(-100,100)/100)
                local Check_Log = findColorsClick(417748,350,960,360,1080,20,true, true,rd+rd2,30-rd2,"note")
                local continue = findColorsClick(31487,420,740,560,830,100,true, true,30-rd+rd2,0,"note")
                if continue[1] ~= -1  then
                    mSleep(5000)
                    local checkMail
                    for i=1,15 do
                        checkMail = findColorsClick(7632757,65,630,80,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                        if checkMail[1] ~= -1  then break end
                        Tap(590,280)
                        mSleep(500)
                    end
                    if checkMail[1] ~= -1  then
                        mSleep(math.random(1500,2000)+math.random(-100,100)/100)
                        Log_Domain()
                        closeApp("com.google.ios.youtube")
                        return
                    end
                end
            end
        end
        if switch_acc[1] ~= -1 then
            local CheckMail
            for i=1,200 do
                mSleep(500)
                toast("Check mail")
                --CheckMail = findColorsClick(417748,74,230,75,480,1,true, false,0,0,"note")  ---Tap lại nếu lỗi mạng
                CheckMail = findColorsClick(417748,660,260,730,430,1,true, false,0,0,"note")
                if i%30 == 0  then 
                    local loadmail = findColorsClick(10133670,40,245,120,340,1,true, false,0,0,"note")
                    if loadmail[1] == -1 and CheckMail[1] == -1 then 
                        Tap(245-ran_x2+rd,290+rd2) 
                        mSleep(2000)
                    end
                end
                if CheckMail[1] ~= -1 then break end
            end
            if CheckMail[1] ~= -1 then
                for i=1,3 do
                    local re_x = math.random(-50,50)+math.random(-100,100)/100
                    local re_y = math.random(-30,50)+math.random(-100,100)/100
                    touchDown(2, 337.30+re_x, 593.13+re_y);
                    usleep(math.random(33000,33600)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 573.88+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 546.52+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 497.90+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 331.21+re_x, 418.88+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 349.50+re_x, 325.65+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchUp(2, 353.56+re_x, 321.61+re_y);
                    mSleep(math.random(800,1200)+math.random(-100,100)/100)
                end
                mSleep(math.random(3000,4500)+math.random(-100,100)/100)
                local Check1 = findColorsClick(6316128,150,290,380,660,200,true, false,0,0,"note")    --- Vuốt lên lại hiện full mail
                if Check1[1] ~= -1 then
                    local re_x = math.random(-50,50)+math.random(-100,100)/100
                    local re_y = math.random(-30,50)+math.random(-100,100)/100
                    touchDown(2, 337.30+re_x, 593.13+re_y);
                    usleep(math.random(33000,33600)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 573.88+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 546.52+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 329.18+re_x, 497.90+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 331.21+re_x, 418.88+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchMove(2, 349.50+re_x, 325.65+re_y);
                    usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                    touchUp(2, 353.56+re_x, 321.61+re_y);
                    mSleep(math.random(800,1200)+math.random(-100,100)/100)
                end
                mSleep(math.random(2000,3500)+math.random(-100,100)/100)
                --local CheckFullMail = findColorsClick(6710886,150,815,380,840,50,true, false,0,0,"note")
                --if CheckFullMail[1] ~= -1 then
                local FullDomain = findColorsClick(417748,600,130,730,400,1,true, false,0,0,"note")
                --local FullDomain2 = findColorsClick(15066597,600,160,730,280,1,true, false,0,0,"note")  -- doi voi man 6g,6s
                --if FullDomain[1] ~= -1 or FullDomain2[1] ~= -1 then
                if FullDomain[1] ~= -1 then
                    toast("Chưa Full Mail",1)
                    mSleep(1000)
                    openURL("XoaInfo://SetOffProxy")
                    mSleep(10000)
                    runApp("com.google.ios.youtube")
                    mSleep(6000)

                    local y_acc
                    local point = findMultiColorInRegionFuzzyExt(986895, "986895", 100,130,220,210,1330)
                    if #point ~= 0 then  
                        local maxYPoint = point[1] 
                        for var = 2, #point do 
                            if point[var].y > maxYPoint.y then  -- Thay đổi điều kiện để tìm max y
                                maxYPoint = point[var]
                            end
                        end
                        y_acc = maxYPoint.y
                    end
                    mSleep(math.random(500,1000)+math.random(-100,100)/100)
                    Tap(240-rd-rd2,y_acc-170+rd2)
                    mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                    local continue = findColorsClick(31487,420,740,560,830,100,true, true,30-rd+rd2,0,"note")
                    if continue[1] ~= -1  then
                        mSleep(5000)
                        local checkMail
                        for i=1,15 do
                            checkMail = findColorsClick(7632757,65,630,80,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                            if checkMail[1] ~= -1  then break end
                            Tap(590,280)
                            mSleep(500)
                        end
                        if checkMail[1] ~= -1  then
                            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
                            Log_Domain()
                        end
                    end
                    closeApp("com.google.ios.youtube")
                    mSleep(1500)
                    return
                end
---------------------------------------------------------------------------------------
                local CheckFullMail
                for i=1,200 do 
                    CheckFullMail = findColorsClick(10133670,40,950,120,1050,1,true, false,0,0,"note")
                    if CheckFullMail[1] == -1 then break end
                end
                if CheckFullMail[1] == -1 then
                    mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                    local reCheckOpenApp
                    for i=0,100 do
                        if i%10 == 0 then
                            Tap(230+rd-rd2,990-rd)
                            mSleep(math.random(5000,10000)+math.random(-100,100)/100)
                        end
                        mSleep(500)
                        reCheckOpenApp = findColorsClick(16711731,20,50,80,100,1,true, false,0,0,"note")
                        if reCheckOpenApp[1] ~= -1  then break end
                    end

                    --local ErrorProxy = findColorsClick(6710886,74,230,75,400,1,true, false,0,0,"note")
                    --if ErrorProxy[1] ~= -1 then
                    --    if getColor(74,ErrorProxy[2]+12)==16777215 and getColor(74,ErrorProxy[2]+42)==6710886 and getColor(62,ErrorProxy[2]+42)==1677215 then 
                    --        Tap(200-rd-rd2,790+rd)
                    --        mSleep(3000)
                    --    end
                    --end
                    --local reCheckFullMail = findColorsClick(6710886,150,815,380,830,120,true, false,0,0,"note")
                    --Tap(200+rd-rd2,790-rd)
                    --mSleep(math.random(4000,6000)+math.random(-100,100)/100)
                    --local reCheckOpenApp = findColorsClick(16711731,45,50,65,100,100,true, false,0,0,"note")
                    if reCheckOpenApp[1] ~= -1  then
                        rd = math.random(-4,4) + math.random(-150,150)/100
	                    ran_x = math.random(-50,80) + math.random(-150,150)/100
	                    rd2 = math.random(-4,4) + math.random(-100,100)/100
	                    ran_x2 = math.random(-49,79) + math.random(-100,100)/100
                        mSleep(1000)
                        openURL("youtube://www.youtube.com/feed/history")
                        mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                        --local checkHistory = findColorsClick(986895,570,60,600,100,60,true, false,0,5,"note")
                        local checkHistory = findColorsClick(6316128,100,260,200,330,150,true, false,0,5,"note")
                        mSleep(2000)
                        local OnHistory = findColorsClick(417748,350,960,360,1120,2,true, true,15+rd2,20-rd,"note")
                        if OnHistory[1] ~= -1 then 
                            mSleep(3000)
                            local ON = findColorsClick(417748,540,1000,620,1220,15,true, true,0,0,"note")
                            mSleep(math.random(500,600)+math.random(-100,100)/100)
                            Tap(565,1070)
                            mSleep(8000)
                        end
                        local CheckVideo = findColorsClick(3355443,410,450,520,740,2,true, false,0,0,"note")
                        if CheckVideo[1] ~= -1 then  --- Có video lịch sử xem
                            for i=1,2 do
                                local optionHistory = findColorsClick(986895,670,60,710,100,30,true, true,0,5,"note")
                                if optionHistory[1] ~= -1 then
                                    mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                                    local clearAll = findColorsClick(986895,240,1140,400,1210,50,true, true,ran_x2+rd2,5-rd2,"note")
                                    if clearAll[1] ~= -1 then
                                        mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                                        local clearWatch = findColorsClick(417748,455,950,550,1180,10,true, true,ran_x-rd-rd2,math.random(200,500)/100,"note")
                                        mSleep(3000)
                                        surf_Up(350,680,"long")
                                        mSleep(4000)
                                        CheckVideo = findColorsClick(3355443,350,450,500,640,2,true, false,0,0,"note")
                                        if CheckVideo[1] == -1 then break end
                                    end
                                end
                            end
                        end
                    end
                    local DoneHistory = findColorsClick(3355443,180,350,300,415,20,true, false,0,0,"check clear done")
                    if true then
                        rd = math.random(-4,4) + math.random(-150,150)/100
	                    ran_x = math.random(-50,80) + math.random(-150,150)/100
	                    rd2 = math.random(-4,4) + math.random(-100,100)/100
	                    ran_x2 = math.random(-49,79) + math.random(-100,100)/100
                        Tap(48+rd,83+rd2)
                        mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                        local CheckOpenApp = findColorsClick(16711731,20,50,80,100,1,true, false,0,0,"note")
                        if CheckOpenApp[1] == -1  then
                            toast("Mở lại app")
                            closeApp("com.google.ios.youtube")
                            mSleep(2000)
                            runApp("com.google.ios.youtube")
                            mSleep(6000)
                        end
                        local status_Video
                        status_Video,strVideo = GetVideo()
                        if status_Video then 
                            local searchVideo = findColorsClick(986895,670,50,715,100,40,true, true,10+rd2,math.random(100,500)/100,"note")
                            if searchVideo[1] ~= -1  then
                                mSleep(math.random(500,1500)+math.random(-100,100)/100)
                                input(strVideo)
                                mSleep(math.random(1000,1500)+math.random(-100,100)/100)
                                local Find = findColorsClick(31487,645,1245,660,1300,20,true, true,rd+rd2,40-rd2+rd,"note")
                            else
                                return
                            end

                            --SearchVideo(strVideo)
                            mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                            local loadvideo = findColorsClick(986895,680,300,720,1200,80,true, false,0,0,"note")
                            local option = findColorsClick(986895,670,60,690,100,40,true, true,2,5,"note")
                            if option[1] ~= -1 then 
                                mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                                local search_Filter = findColorsClick(986895,170,1145,280,1200,30,true, true,80-rd+rd2,5-rd,"note")
                                if search_Filter[1] ~= -1 then 
                                    mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                    local upload_Date = findColorsClick(986895,640,200,680,460,40,true, true,-400-rd-rd2,90+rd,"note")
                                    if upload_Date[1] ~= -1 then 
                                        mSleep(math.random(1000,2000)+math.random(-100,100)/100)
                                        Tap(40+rd2,84-rd)
                                        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                        local CheckVideo
                                        for i=1,60 do
                                            local No_Video = findColorsClick(4595886,300,480,440,650,1,true, false,0,0,"note")
                                            CheckVideo = findColorsClick(986895,680,300,720,1000,1,true, false,0,0,"note")
                                            if CheckVideo[1] ~= -1 then 
                                                break 
                                            elseif No_Video[1] ~= -1 then 
                                                toast("No Video",3)
                                                mSleep(1000)
                                                closeApp("com.google.ios.youtube")
                                                mSleep(3000)
                                                return
                                            end
                                        end
                                        if CheckVideo[1] ~= -1 then
                                            mSleep(4000)
                                            local openVideo = findColorsClick(986895,680,300,720,1000,1,true, true,-300-ran_x2+rd2,rd2+rd,"note")
                                            mSleep(math.random(2000,4000)+math.random(-100,100)/100)
                                            local CheckBegin = findColorsClick(986895,120,550,250,1000,100,true, false,0,0,"note")
                                            for i=1,3 do
                                                local CheckLoadVD = findColorsClick(16711731,0,300,2,700,60,true, false,0,0,"note")
                                                if CheckLoadVD[1] == -1 then  
                                                    local error1 = findColorsClick(7289299,260,550,360,700,1,true, false,0,0,"note")
                                                    local error2 = findColorsClick(417748,355,1110,356,1170,1,true, false,0,0,"note")
                                                    if error1[1] ~= -1 and error2[1] ~= -1 then 
                                                        toast("Error Network",3)
                                                        mSleep(1000)
                                                        closeApp("com.google.ios.youtube")
                                                        mSleep(3000)
                                                        return
                                                    else
                                                        local offADS = findColorsClick(16777215,720,330,722,800,1,true, true,-75,-75,"Skip ADS 1")
                                                    end
                                                end
                                                local Point_White = findColorsClick(16777215,28,410,30,440,10,true, false,0,0,"note")
                                                if Point_White[1] ~= -1 then 
                                                    local y_VD
                                                    local status_VD = true
                                                    for i=100,500,50 do
                                                        if getColor(i,Point_White[2]) ~= 16777215 then status_VD = false end
                                                    end
                                                    if status_VD then
                                                        local percent = math.random(78,83)
                                                        y_VD = Point_White[2]-2
                                                        local time = 1
                                                        local ran_Time = math.random(65,80)
                                                        local action = math.random(1,3)
                                                        local time_action = math.random(18,40)
                                                        local surf = math.random(45,70)
                                                        local x_set = 1
                                                        local x_des = 100
                                                        if getColor(x_set,y_VD) == 16498733 then
                                                            mSleep(15000)
                                                            toast("Skip ADS 2")
                                                            local offADS = findColorsClick(16777215,720,330,749,800,1,true, true,-75,-75,"note")
                                                        end
                                                        for i=1,ran_Time do
                                                            if i%3 == 0 then
                                                                for i= x_set, x_des do
                                                                    local co = getColor(i,y_VD)
                                                                    if co < 16700000 and co ~= 16498733 then
                                                                        x_set = i 
                                                                        x_des = x_des + i
                                                                        break
                                                                    end
                                                                    mSleep(3)
                                                                end

                                                                if getColor(x_set,y_VD) == 16498733 then
                                                                    mSleep(15000)
                                                                    toast("Skip ADS 3")
                                                                    local offADS = findColorsClick(16777215,720,330,749,800,1,true, true,-75,-75,"note")
                                                                    x_VD = 10
                                                                end

                                                                time = math.ceil(x_set/750*100)
                                                                toast("Đang xem "..time.."% / "..percent.."%")
                                                            end
                                                            mSleep(6500)
                                                            if time > percent then break end
                                                        end
                                                        
                                                        if math.random(1,3) == 1 then
                                                            local re_x = math.random(-100,100)+math.random(-100,100)/100
                                                            local re_y = math.random(-10,40)+math.random(-100,100)/100
                                                            touchDown(7, 316.98 + re_x, 92.63 + re_y);
                                                            usleep(math.random(40000,45000)+ math.random(-100,100)/100);
                                                            touchMove(7, 318.01 + re_x, 96.69 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 318.01 + re_x, 114.92 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 318.01 + re_x, 149.37 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 315.97 + re_x, 200.03 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 314.95 + re_x, 258.80 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 313.94 + re_x, 332.76 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 313.94 + re_x, 399.62 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchMove(7, 314.95 + re_x, 460.41 + re_y);
                                                            usleep(math.random(16200,16800)+ math.random(-100,100)/100);
                                                            touchUp(7, 319.02 + re_x, 464.46 + re_y);
                                                            mSleep(math.random(3000,4000)+math.random(-100,100)/100)
    
                                                            local aac = math.random(-500,500)/100
                                                            touchDown(8, 389 + aac, 950 + aac);
                                                            usleep(99726.21);
                                                            touchUp(8, 389 + aac, 950 + aac);
                                                            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                                        end

                                                        if math.random(1,2) == 1 then
                                                            mSleep(1000)
                                                            pressHomeKey(0);    
                                                            pressHomeKey(1);
                                                            mSleep(20)
                                                            pressHomeKey(0);    
                                                            pressHomeKey(1);
                                                            mSleep(1500)
                                                            for i=1,4 do 
                                                                touchDown(3, 493.70, 729.43);
                                                                usleep(17657.54);
                                                                touchMove(3, 488.56, 709.07);
                                                                usleep(16818.79);
                                                                touchMove(3, 487.53, 685.65);
                                                                usleep(16655.67);
                                                                touchMove(3, 487.53, 641.86);
                                                                usleep(16629.08);
                                                                touchMove(3, 488.56, 569.58);
                                                                usleep(16693.88);
                                                                touchMove(3, 511.14, 480.99);
                                                                usleep(16683.12);
                                                                touchUp(3, 533.72, 392.43);
                                                                mSleep(800)
                                                            end
                                                        end
                                                        toast("End",3)
                                                        mSleep(math.random(3000,4000)+math.random(-100,100)/100)

                                                        closeApp("com.google.ios.youtube")
                                                        mSleep(3000)
                                                        os.execute("su mobile -c uicache");
                                                        clearCookies()
                                                        return
                                                    end
                                                end
                                            end
                                        end
                                        local ran_Time = math.random(60,65)    -- th ko xem duoc video
                                        for i=1,ran_Time do
                                            mSleep(math.random(6400,6500))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function clear(path)
    function getAllFilesInDirectory(directory)
        local files = {}
        local command = 'find "' .. directory .. '" -type f 2>/dev/null' 
        local handle = io.popen(command)
        if handle then
            for file in handle:lines() do
                if file ~= nil and file ~= "" then
                    table.insert(files, file)
                end
            end
            handle:close()
        end
        return files
    end
    function getAllDirectories(directory)
        local directories = {}
        local command = 'find "' .. directory .. '" -mindepth 1 -type d 2>/dev/null | sort -r' 
        local handle = io.popen(command)
        if handle then
            for dir in handle:lines() do
                if dir ~= nil and dir ~= "" then
                    table.insert(directories, dir)
                end
            end
            handle:close()
        end
        return directories
    end
    function deleteFilesAndDirectories(directory)
        local command = 'rm -rf "' .. directory .. '" 2>/dev/null'
        os.execute(command)
    end
    local folderPath = path
    local files = getAllFilesInDirectory(folderPath)
    for _, fileName in ipairs(files) do
        os.remove(fileName)
    end
    local directories = getAllDirectories(folderPath)
    for _, dirName in ipairs(directories) do
        deleteFilesAndDirectories(dirName)
    end
end


