init(0) 
require "TSLib"
local ts=require("ts")
local json=ts.json
math.randomseed(os.time())
setVolumeLevel(0)

    local FullID = readFile(userPath() .. "/lua/Aliasld.txt")
    local strFullID = FullID[1]
	local FullID = strSplit(strFullID,"|")
    local ID_Domain = FullID[1]
    local ID_Proxy = FullID[2]
    local ID_KeyName = FullID[3]
    local ID_Channel = FullID[4]



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

function GetVideo(id)
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/"..id
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
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/"..ID_Domain
    local response = {}
    for i=1,20 do
        toast("Get Domain")
        mSleep(math.random(1000,2200))
        local Result,status = httpGetCommon(url)
        if status==200 and (string.find(Result,"validationErrors")==nil) then 
            local fulldata = strSplit(Result,"|"); 
            return true,fulldata[1],fulldata[2],fulldata[3] 
        end
        mSleep(math.random(5000,10000))
    end
	return false,1
end

function surf_Down(x_res,y_res,option)
	local res_x = math.random(-35,35)+math.random(-150,150)/100
	local res_y = math.random(-50,70)+math.random(-150,180)/100
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
	mSleep(math.random(600,800)+math.random(-100,100)/100)
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
function surf_Long()
	local res_x = math.random(-35,35)+math.random(-150,150)/100
	local res_y = math.random(-10,30)+math.random(-150,180)/100
    local min_x = math.random(-150,150)/100
    local min_y = math.random(-600,600)/100
	local finger = math.random(6,9)
	local pic = math.random(1,2)

    touchDown(finger, 344.42+res_x, 822.10+res_y);
    usleep(math.random(46000,50000) + math.random(-100,100)/100)
    touchMove(finger, 335.27+res_x, 788.66+res_y+min_y);
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(finger, 335.27+res_x, 758.28+res_y);
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(finger, 339.34+res_x+min_x, 708.63+res_y+min_y);
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(finger, 355.60+res_x+min_x, 645.81+res_y);
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchMove(finger, 370.84+res_x, 580.97+res_y+min_y);
    usleep(math.random(16200,16800) + math.random(-100,100)/100)
    touchUp(finger, 374.90+res_x, 570.93+res_y);
    mSleep(math.random(1400,1600) + math.random(-100,100)/100)
end

function Log_Domain()
    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100
    local strDomain
    local strPass
    local strMailkp
    local status
    status, strDomain, strPass, strMailkp = GetDomain()
    if status then
        if string.find(strDomain,"gmail.com") == nil then
            openURL("XoaInfo://SetOffProxy")
            mSleep(9000)
            runApp("com.google.ios.youtube")
            mSleep(5000)
        end
        local InputMail = findColorsClick(7632757,65,580,75,800,15,true, true,140+ran_x-rd,60+rd+rd2,"note")
        if InputMail[1] ~= -1  then
            mSleep(math.random(2000,2500)+math.random(-100,100)/100)        
            inputText(strDomain)
            mSleep(math.random(1200,2000)+math.random(-100,100)/100)
            Tap(560-rd-rd2,1090+rd-rd2)
            mSleep(math.random(3000,4000)+math.random(-100,100)/100)
            local InputPass = findColorsClick(7632757,65,580,75,800,200,true, true,140+ran_x-rd,60+rd+rd2,"note")
            if InputPass[1] ~= -1  then
                mSleep(math.random(2000,2500)+math.random(-100,100)/100)
                inputText(strPass)
                mSleep(math.random(1200,2000)+math.random(-100,100)/100)
                Tap(560-rd+rd2,1090+rd+rd2)
                mSleep(math.random(3500,4500)+math.random(-100,100)/100)
                local savePass = findColorsClick(31487,280,780,350,1000,2,true, true,0,0,"note")
                local CheckLoad
                local CheckOpenApp
                for i=1,100 do 
                    CheckLoad = findColorsClick(15286837,60,150,120,230,1,true, false,0,0,"note")    ---load agree
                    CheckOpenApp = findColorsClick(16711680,20,50,65,100,1,true, false,0,0,"note")
                    if CheckLoad[1] ~= -1 or CheckOpenApp[1] ~= -1  then break end
                end
                if CheckLoad[1] ~= -1 then
                    mSleep(3000)
                    for i=1,4 do 
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
                        mSleep(math.random(1000,1500)+math.random(-100,100)/100)
                    end
                    local Confirm
                    local Agree
                    for i=1,10 do 
                        Confirm = findColorsClick(743376,50,720,85,840,1,true, false,200+ran_x-rd,10+rd,"note")
                        Agree = findColorsClick(743376,240,850,600,1000,1,true, false,30+rd+rd2,20+rd,"note")
                        if Confirm[1] ~= -1 or Agree[1] ~= -1 then break end
                    end
                    if Confirm[1] ~= -1  then
                        Confirm = findColorsClick(743376,50,720,85,840,4,true, true,200+ran_x-rd,10+rd,"note")
                        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                        local InputMail = findColorsClick(7632757,230,860,250,1030,200,true, true,80+ran_x-rd,55+rd+rd2,"note")
                        if InputMail[1] ~= -1  then
                            mSleep(math.random(2000,2500)+math.random(-100,100)/100)
                            inputText(strMailkp)
                            mSleep(math.random(1200,2000)+math.random(-100,100)/100)
                            local Done = findColorsClick(743376,495,490,510,660,10,true, true,rd2,20+rd,"note")
                            if Done[1] == -1  then
                                Tap(560-rd-rd2,1090+rd-rd2)
                            end
                            mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                        end
                    end
                    if Agree[1] ~= -1  then
                        mSleep(2000)
                        Tap(60,1010)
                        mSleep(500)
                        local Agree = findColorsClick(743376,240,850,600,1000,4,true, true,30+rd+rd2,20+rd,"note")
                        mSleep(500)
                    end

                    CheckOpenApp = findColorsClick(16711680,20,50,65,100,200,true, false,0,0,"note")
                end
                if CheckOpenApp[1] ~= -1  then
                    mSleep(8000)
                    local saveVideo = findColorsClick(15987699,430,930,480,960,15,true, true,-rd,rd2,"note")
                    if saveVideo[1] ~= -1  then
                        mSleep(2000)
                        local ON = findColorsClick(417748,480,860,550,1010,15,true, true,0,0,"note")
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
    for i=1,40 do
        if getColor(280,5)==1714737 or getColor(300,450)==1714737 then
            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
            Tap(320-rd+rd2,1015)
            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
        end
        if getColor(247,55)==8355711 then
            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
            local No_error = findColorsClick(4359669,290,650,460,750,1,true, true,5,5,"note")
            local No_error2 = findColorsClick(31487,290,650,460,750,1,true, true,5,5,"note")
            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
        end
        CheckOpenApp = findColorsClick(16711680,20,50,65,100,1,true, false,0,0,"note")
        if CheckOpenApp[1] == -1 and i>10 and getColor(315,765) == 15132390 then 
            local signin = findColorsClick(417748,318,780,319,900,1,true, false,ran_x2-rd2,30+rd,"note")
            if signin[1] ~= -1  then
                mSleep(4000)
                local signin = findColorsClick(417748,318,780,319,900,30,true, true,ran_x2-rd2,30+rd,"note")
                if signin[1] ~= -1  then
                    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                    local continue = findColorsClick(31487,360,630,540,900,100,true, true,30-rd+rd2,0,"note")
                    if continue[1] ~= -1  then
                        local checkMail
                        for i=1,15 do
                            checkMail = findColorsClick(7632757,65,580,75,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                            if checkMail[1] ~= -1  then break end
                            Tap(525,200)
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
        local Allow = findColorsClick(31487,360,630,540,900,1,true, true,30-rd+rd2,0,"note")
        if CheckOpenApp[1] ~= -1  then break end
    end

    if CheckOpenApp[1] ~= -1  then
        mSleep(math.random(3000,4000)+math.random(-100,100)/100)
        Tap(584+rd,80+rd2)
        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
        local Manage_Mail
        for i=1,40 do  --- không lấy từ 0
            if i % 10 == 0 then
                Tap(584+rd,80-rd2)
                mSleep(math.random(2000,3000)+math.random(-100,100)/100)
            end
            Manage_Mail = findColorsClick(417748,155,150,250,330,1,true, true,100+ran_x-rd,-50+rd,"note")
            if Manage_Mail[1] ~= -1 then
                mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                break
            end
            local Check_Log = findColorsClick(417748,300,710,330,810,1,true, false,rd+rd2,30-rd2,"note")
            if Check_Log[1] ~= -1 then
                mSleep(math.random(4000,5000)+math.random(-100,100)/100)
                local Check_Log = findColorsClick(417748,300,710,330,810,20,true, true,rd+rd2,30-rd2,"note")
                mSleep(6000)
                local continue
                for i=1,30 do
                    continue = findColorsClick(31487,360,630,540,900,1,true, true,30-rd+rd2,0,"note")
                    local reCheck = findColorsClick(6316128,20,140,60,225,1,true, true,200-rd+rd2,120-rd,"note")
                    if continue[1] ~= -1 then break end
                    if reCheck[1] ~= -1 then return end
                end
                if continue[1] ~= -1  then
                    local checkMail
                    for i=1,15 do
                        checkMail = findColorsClick(7632757,65,580,75,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                        if checkMail[1] ~= -1  then break end
                        Tap(525,200)
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
        if Manage_Mail[1] ~= -1 then
            local CheckMail
            for i=1,200 do
                mSleep(500)
                toast("Check mail")
                --CheckMail = findColorsClick(417748,74,230,75,480,1,true, false,0,0,"note")  ---Tap lại nếu lỗi mạng
                CheckMail = findColorsClick(417748,560,260,600,430,1,true, false,0,0,"note")
                if i%30 == 0  then 
                    local loadmail = findColorsClick(10133670,40,245,120,340,1,true, false,0,0,"note")
                    if loadmail[1] == -1 and CheckMail[1] == -1 then 
                        Tap(245-ran_x2+rd,286+rd2) 
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
                local Check1 = findColorsClick(6710886,150,290,380,660,200,true, false,0,0,"note")    --- Vuốt lên lại hiện full mail
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
                local FullDomain = findColorsClick(417748,200,130,620,400,1,true, false,0,0,"note")
                if FullDomain[1] ~= -1 then
                    toast("Chưa Full Mail",1)
                    mSleep(3000) 

                    local y_acc
                    local point = findMultiColorInRegionFuzzyExt(986895, "986895", 100,130,220,210,1130)
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
                    local continue = findColorsClick(31487,360,630,540,900,100,true, true,30-rd+rd2,0,"note")
                    if continue[1] ~= -1  then
                        local checkMail
                        for i=1,16 do
                            checkMail = findColorsClick(7632757,65,580,75,800,10,true, false,140+ran_x-rd,60+rd+rd2,"note")
                            if checkMail[1] ~= -1  then break end
                            Tap(525,200)
                            mSleep(500)
                        end
                        if checkMail[1] ~= -1  then
                            mSleep(math.random(1500,2000)+math.random(-100,100)/100)
                            Tap(525,200)
                            mSleep(500)
                            Log_Domain()
                        end
                    end
                    closeApp("com.google.ios.youtube")
                    mSleep(1500)
                    return
                end

                local CheckFullMail
                for i=1,200 do 
                    CheckFullMail = findColorsClick(10133670,40,762,120,860,1,true, false,0,0,"note")
                    if CheckFullMail[1] == -1 then break end
                end
                if CheckFullMail[1] == -1 then
                    mSleep(math.random(2000,3000)+math.random(-100,100)/100)

                    local reCheckOpenApp
                    for i=0,100 do
                        if i%10 == 0 then
                            Tap(200+rd-rd2,790-rd)
                            mSleep(math.random(5000,10000)+math.random(-100,100)/100)
                        end
                        mSleep(500)
                        reCheckOpenApp = findColorsClick(16711680,20,50,65,100,1,true, false,0,0,"note")
                        if reCheckOpenApp[1] ~= -1  then break end
                    end

                    if reCheckOpenApp[1] ~= -1  then
                        rd = math.random(-4,4) + math.random(-150,150)/100
	                    ran_x = math.random(-50,80) + math.random(-150,150)/100
	                    rd2 = math.random(-4,4) + math.random(-100,100)/100
	                    ran_x2 = math.random(-49,79) + math.random(-100,100)/100
                        mSleep(1000)
                        openURL("youtube://www.youtube.com/feed/history")
                        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                        --local checkHistory = findColorsClick(986895,570,60,600,100,60,true, false,0,5,"note")
                        local checkHistory = findColorsClick(3355443,100,60,140,100,150,true, false,0,5,"note")
                        mSleep(2000)
                        local OnHistory = findColorsClick(417748,280,820,350,1000,2,true, true,15+rd2,20-rd,"note")
                        if OnHistory[1] ~= -1 then 
                            mSleep(3000)
                            local ON = findColorsClick(417748,480,860,550,1010,15,true, true,0,0,"note")
                            mSleep(math.random(500,600)+math.random(-100,100)/100)
                            Tap(512,970)
                            mSleep(8000)
                        end
                        local CheckVideo = findColorsClick(3355443,180,260,300,300,2,true, false,0,0,"note")
                        if CheckVideo[1] == -1 then  --- Có video lịch sử xem
                            for i=1,2 do
                                local optionHistory = findColorsClick(986895,570,60,600,100,30,true, true,0,5,"note")
                                if optionHistory[1] ~= -1 then
                                    mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                                    local clearAll = findColorsClick(986895,240,940,400,1020,50,true, true,ran_x2+rd2,5-rd2,"note")
                                    if clearAll[1] ~= -1 then
                                        mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                                        local clearWatch = findColorsClick(417748,490,845,550,1050,1,true, true,-50+rd-rd2,2,"clear history")
                                        mSleep(math.random(3000,4000))
                                        local res_x = math.random(-35,35)+math.random(-150,150)/100
                                        local res_y = math.random(-10,30)+math.random(-150,180)/100
                                        local min_x = math.random(-80,80)/100
                                        local min_y = math.random(-600,600)/100
                                        local finger = math.random(6,9)
                                        touchDown(finger, 336.29+res_x, 491.82+res_y);
                                        usleep(math.random(46000,50000) + math.random(-100,100)/100)
                                        touchMove(finger, 336.29+res_x, 523.23+res_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchMove(finger, 336.29+res_x, 558.69+res_y+min_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchMove(finger, 336.29+res_x, 610.35+res_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchMove(finger, 334.26+res_x+min_x, 668.10+res_y+min_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchMove(finger, 333.24+res_x, 728.89+res_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchMove(finger, 333.24+res_x, 785.63+res_y);
                                        usleep(math.random(16200,16800) + math.random(-100,100)/100)
                                        touchUp(finger, 330.20+res_x, 789.68+res_y);
                                        mSleep(3000)
                                        local CheckVideo = findColorsClick(3355443,180,260,300,300,2,true, false,0,0,"note")
                                        if CheckVideo[1] ~= -1 then break end
                                    end
                                end
                            end
                        end
                    end
                    local DoneHistory = findColorsClick(3355443,180,260,300,300,15,true, false,0,0,"check clear done")
                    if true then
                        rd = math.random(-4,4) + math.random(-150,150)/100
	                    ran_x = math.random(-50,80) + math.random(-150,150)/100
	                    rd2 = math.random(-4,4) + math.random(-100,100)/100
	                    ran_x2 = math.random(-49,79) + math.random(-100,100)/100
                        Tap(48+rd,83+rd2)
                        mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                        local CheckOpenApp = findColorsClick(16711680,20,50,65,100,10,true, false,0,0,"note")
                        if CheckOpenApp[1] == -1  then
                            toast("Mở lại app")
                            closeApp("com.google.ios.youtube")
                            mSleep(2000)
                            runApp("com.google.ios.youtube")
                            mSleep(6000)
                        end

                        local view_Chanel = false
                        local view_Suggestion = false
                        local view_Chanel_search = false
                        if math.random(1,2) == 1 then
                            view_Chanel = true
                        end
                        if math.random(1,3) == 2 then    --- chỉnh lại 20% nếu dùng view đề xuất
                            view_Chanel_search = true
                        end

                        if math.random(1,100) < 46 then
                            view_Suggestion = true
                        end 
                        local status_Video = false

                        view_Suggestion = false; --- không chạy đề xuất
                        if view_Suggestion then
                            status_Video,strVideo = GetVideo(ID_Channel)
                            if status_Video then
                                local fulldata = strSplit(strVideo,"|"); 
                                Suggestion(fulldata[2])
                            end
                        else
                            if view_Chanel_search then
                                status_Video,strVideo = GetVideo(ID_Channel)
                                if status_Video then
                                    local fulldata = strSplit(strVideo,"|"); 
                                    Chanel_search(fulldata[1])
                                end
                            else
                                status_Video,strVideo = GetVideo(ID_KeyName)
                                if status_Video then 
                                    local searchVideo = findColorsClick(986895,465,30,520,90,40,true, true,10+rd2,math.random(0,200)/100,"note")
                                    if searchVideo[1] ~= -1  then
                                        mSleep(math.random(500,1500)+math.random(-100,100)/100)
                                        input(strVideo)
                                        mSleep(math.random(1000,1500)+math.random(-100,100)/100)
                                        local Find = findColorsClick(31487,560,1050,580,1100,20,true, true,rd+rd2,40-rd2+rd,"note")
                                    else
                                        return
                                    end
                                    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
                                    local loadvideo = findColorsClick(986895,540,300,620,900,80,true, false,0,0,"note")
                                    local option = findColorsClick(986895,550,60,595,100,40,true, true,0,5,"note")
                                    if option[1] ~= -1 then 
                                        mSleep(math.random(1500,2500)+math.random(-100,100)/100)
                                        local search_Filter = findColorsClick(986895,170,945,280,1000,30,true, true,80+rd+rd2,5-rd,"note")
                                        if search_Filter[1] ~= -1 then 
                                            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                            local upload_Date = findColorsClick(986895,540,200,560,460,40,true, true,-400-rd-rd2,90+rd,"note")
                                            if true then
                                                mSleep(math.random(1000,2000)+math.random(-100,100)/100)
                                                Tap(40+rd2,84-rd)
                                                mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                                local CheckVideo
                                                for i=1,60 do
                                                    local No_Video = findColorsClick(4595886,300,400,400,560,1,true, false,0,0,"note")
                                                    CheckVideo = findColorsClick(986895,570,300,595,900,1,true, false,0,0,"note")
                                                    --CheckChanel = findColorsClick(986895,595,125,620,1000,1,true, false,0,0,"note")
                                                    if CheckVideo[1] ~= -1 then --or CheckChanel[1] ~= -1 then 
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
                                                    local openVideo = findColorsClick(986895,570,300,595,950,1,true, true,-280-ran_x2+rd2,rd2+rd,"note")
                                                    if openVideo[1] ~= -1 then
                                                        StartView()   ---------------------
                                                        if view_Chanel then
                                                            local Channel = findColorsClick(986895,611,470,612,830,1,true, true,-485-ran_x2+rd2,10+rd,"note")  --- theo subscribe
                                                            if Channel[1] ~= -1 then
                                                                mSleep(7000)
                                                                local Check = findColorsClick(6710886,180,125,580,210,40,true, false,0,10+rd,"Check Channel")
                                                                mSleep(3000)
                                                                touchDown(7, 575.05, 635.69);
                                                                usleep(49970.21);
                                                                touchMove(7, 543.55, 638.72);
                                                                usleep(16759.75);
                                                                touchMove(7, 497.83, 647.84);
                                                                usleep(16205.62);
                                                                touchMove(7, 434.84, 663.04);
                                                                usleep(16515.38);
                                                                touchUp(7, 368.80, 677.22);
                                                                mSleep(2500)
                                                                local ab = math.random(1,25) 
                                                                for i=1,ab do
                                                                    local bc = math.random(1,3)
                                                                    if bc == 1 then
                                                                        surf_Down(300,830,"short")
                                                                    end
                                                                    if bc == 2 then 
                                                                        surf_Down(300,830,"long")
                                                                    end
                                                                    if bc == 3 then
                                                                        surf_Long()
                                                                    end
                                                                end
                                                                local openVideo = findColorsClick(986895,600,425,620,820,1,true, true,-280-ran_x2+rd2,rd2+rd,"note")
                                                                if openVideo[1] == -1 then
                                                                    tap(376-ran_x2,600+ran_x)
                                                                end
                                                                StartView()
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
                                                
                        touchDown(8, 625.85, 1000.41);
                        usleep(99726.21);
                        touchUp(8, 625.85, 1000.41);
                        mSleep(math.random(500,1000)+math.random(-100,100)/100)
                                                
                        toast("End",3)
                        mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                                                
                        closeApp("com.google.ios.youtube")
                        mSleep(3000)
                    end
                end
            end
        end
    end
end

function Suggestion(strChannel_sug)
    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100

    local searchVideo = findColorsClick(986895,465,30,520,90,40,true, true,10+rd2,math.random(0,200)/100,"note")
    if searchVideo[1] ~= -1  then
        mSleep(math.random(500,1500)+math.random(-100,100)/100)
        input(strChannel_sug)
        mSleep(math.random(1000,1500)+math.random(-100,100)/100)
        local Find = findColorsClick(31487,560,1050,580,1100,20,true, true,rd+rd2,40-rd2+rd,"note")
    else
        return
    end
    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
    local loadvideo = findColorsClick(986895,540,300,620,900,80,true, false,0,0,"note")
    local option = findColorsClick(986895,550,60,595,100,40,true, true,0,5,"note")
    if option[1] ~= -1 then 
        mSleep(math.random(1500,2500)+math.random(-100,100)/100)
        local search_Filter = findColorsClick(986895,170,945,280,1000,30,true, true,80+rd+rd2,5-rd,"note")
        if search_Filter[1] ~= -1 then 
            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
            local Chanel = findColorsClick(986895,540,590,560,850,40,true, true,-400-rd-rd2,183+rd,"note")
            if true then
                mSleep(math.random(1000,2000)+math.random(-100,100)/100)
                Tap(40+rd2,84-rd)
                mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                local CheckChanel
                for i=1,60 do
                    local No_Video = findColorsClick(4595886,300,400,400,560,1,true, false,0,0,"note")
                    CheckChanel = findColorsClick(986895,595,125,620,1000,1,true, false,0,0,"note")
                    --CheckChanel = findColorsClick(986895,595,125,620,1000,1,true, false,0,0,"note")
                    if CheckChanel[1] ~= -1 then --or CheckChanel[1] ~= -1 then 
                        break 
                    elseif No_Video[1] ~= -1 then 
                        toast("No Video",3)
                        mSleep(1000)
                        closeApp("com.google.ios.youtube")
                        mSleep(3000)
                        return
                    end
                end
                if CheckChanel[1] ~= -1 then
                    mSleep(4000)
                    local openChanel = findColorsClick(986895,595,125,620,1000,1,true, true,-280-ran_x2+rd2,40+rd,"note")
                    if openChanel[1] ~= -1 then
                        mSleep(7000)
                        local Check = findColorsClick(6710886,180,125,580,210,40,true, false,0,10+rd,"Check Channel")
                        mSleep(3000)
                        touchDown(7, 575.05, 635.69);
                        usleep(49970.21);
                        touchMove(7, 543.55, 638.72);
                        usleep(16759.75);
                        touchMove(7, 497.83, 647.84);
                        usleep(16205.62);
                        touchMove(7, 434.84, 663.04);
                        usleep(16515.38);
                        touchUp(7, 368.80, 677.22);
                        mSleep(2000)
                        local ab = math.random(1,15) 
                        for i=1,ab do
                            local bc = math.random(1,3)
                            if bc == 1 then
                                surf_Down(300,830,"short")
                            end
                            if bc == 2 then 
                                surf_Down(300,830,"long")
                            end
                            if bc == 3 then
                                surf_Long()
                            end
                        end
                        local openVideo = findColorsClick(986895,600,425,620,820,1,true, true,-280-ran_x2+rd2,rd2+rd,"note")
                        if openVideo[1] == -1 then
                            tap(376-ran_x2,600+ran_x)
                        end                        
                    
                        if openVideo[1] ~= -1 then
                            local CheckLoadVD = findColorsClick(16711680,0,300,2,700,50,true, false,0,0,"note")
                            mSleep(math.random(6000,12000))
                            local point_zoom = findColorsClick(986895,25,375,40,650,15,true, true,300+rd+rd2,30+rd,"note")
                            if point_zoom[1] ~= -1 then
                                mSleep(math.random(3000,4000))
                                local more = findColorsClick(6316128,520,965,600,1100,5,true, true,rd2,5,"note")
                                if more[1] == -1 then
                                    Tap(520,1030)
                                    mSleep(2000)
                                end
                                mSleep(math.random(3000,4000))
                                local ae = math.random(1,5)
                                for i=1,5 do
                                    surf_Down(570,950,"long")
                                    mSleep(math.random(1000,1500))
                                end
                                local y_vid_min = 750
                                local y_vid_max = 800
                                local point = findMultiColorInRegionFuzzyExt(16711680, "16711680", 100,50,500,130,1110)
                                if #point ~= 0 then  
                                    local maxYPoint = point[1] 
                                    for var = 2, #point do 
                                        if point[var].y > maxYPoint.y then  -- Thay đổi điều kiện để tìm max y
                                            maxYPoint = point[var]
                                        end
                                    end
                                    y_vid_max = maxYPoint.y
                                    local minYPoint = point[1] 
                                    for var = 2, #point do 
                                        if point[var].y < minYPoint.y then  
                                            minYPoint = point[var]
                                        end
                                    end
                                    y_vid_min = minYPoint.y
                                end
                                for i=1,3 do
                                    Tap(135+rd+rd2,math.random(y_vid_min,y_vid_max)-rd)
                                    mSleep(5000)
                                    --local CheckBegin = findColorsClick(986895,120,550,250,1000,100,true, false,0,0,"note")
                                    --local check_Sub = findColorsClick(986895,611,590,612,830,20,true, false,-485-ran_x2+rd2,10+rd,"check video")
                                    --if check_Sub[1] ~= -1 then
                                    local check = StartView()
                                    if check then break end
                                        --break
                                    --end
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end
function Chanel_search(strChannel)
    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100

    local searchVideo = findColorsClick(986895,465,30,520,90,40,true, true,10+rd2,math.random(0,200)/100,"note")
    if searchVideo[1] ~= -1  then
        mSleep(math.random(500,1500)+math.random(-100,100)/100)
        input(strChannel)
        mSleep(math.random(1000,1500)+math.random(-100,100)/100)
        local Find = findColorsClick(31487,560,1050,580,1100,20,true, true,rd+rd2,40-rd2+rd,"note")
    else
        return
    end
    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
    local loadvideo = findColorsClick(986895,540,300,620,900,80,true, false,0,0,"note")
    local option = findColorsClick(986895,550,60,595,100,40,true, true,0,5,"note")
    if option[1] ~= -1 then 
        mSleep(math.random(1500,2500)+math.random(-100,100)/100)
        local search_Filter = findColorsClick(986895,170,945,280,1000,30,true, true,80+rd+rd2,5-rd,"note")
        if search_Filter[1] ~= -1 then 
            mSleep(math.random(2000,3000)+math.random(-100,100)/100)
            local Chanel = findColorsClick(986895,540,590,560,850,40,true, true,-400-rd-rd2,183+rd,"note")
            if true then
                mSleep(math.random(1000,2000)+math.random(-100,100)/100)
                Tap(40+rd2,84-rd)
                mSleep(math.random(2000,3000)+math.random(-100,100)/100)
                local CheckChanel
                for i=1,60 do
                    local No_Video = findColorsClick(4595886,300,400,400,560,1,true, false,0,0,"note")
                    CheckChanel = findColorsClick(986895,595,125,620,1000,1,true, false,0,0,"note")
                    --CheckChanel = findColorsClick(986895,595,125,620,1000,1,true, false,0,0,"note")
                    if CheckChanel[1] ~= -1 then --or CheckChanel[1] ~= -1 then 
                        break 
                    elseif No_Video[1] ~= -1 then 
                        toast("No Video",3)
                        mSleep(1000)
                        closeApp("com.google.ios.youtube")
                        mSleep(3000)
                        return
                    end
                end
                if CheckChanel[1] ~= -1 then
                    mSleep(4000)
                    local openChanel = findColorsClick(986895,595,125,620,1000,1,true, true,-280-ran_x2+rd2,40+rd,"note")
                    if openChanel[1] ~= -1 then
                        mSleep(7000)
                        local Check = findColorsClick(6710886,180,125,580,210,40,true, false,0,10+rd,"Check Channel")
                        mSleep(3000)
                        touchDown(7, 575.05, 635.69);
                        usleep(49970.21);
                        touchMove(7, 543.55, 638.72);
                        usleep(16759.75);
                        touchMove(7, 497.83, 647.84);
                        usleep(16205.62);
                        touchMove(7, 434.84, 663.04);
                        usleep(16515.38);
                        touchUp(7, 368.80, 677.22);
                        mSleep(2000)
                        local ab = math.random(1,30) 
                        for i=1,ab do
                            local bc = math.random(1,3)
                            if bc == 1 then
                                surf_Down(300,830,"short")
                            end
                            if bc == 2 then 
                                surf_Down(300,830,"long")
                            end
                            if bc == 3 then
                                surf_Long()
                            end
                        end
                        local openVideo = findColorsClick(986895,600,425,620,820,1,true, true,-280-ran_x2+rd2,rd2+rd,"note")
                        if openVideo[1] == -1 then
                            tap(376-ran_x2,600+ran_x)
                        end                        
                    
                        if openVideo[1] ~= -1 then
                            mSleep(3000)
                            StartView()
                        end
                    end
                end
            end
        end
    end 
end

function StartView()
    local rd = math.random(-4,4) + math.random(-150,150)/100
	local ran_x = math.random(-50,80) + math.random(-150,150)/100
	local rd2 = math.random(-4,4) + math.random(-100,100)/100
	local ran_x2 = math.random(-49,79) + math.random(-100,100)/100
    mSleep(math.random(1000,2000)+math.random(-100,100)/100)
    local CheckBegin = findColorsClick(986895,120,550,250,1000,100,true, false,0,0,"note")
    for i=1,3 do
        local CheckLoadVD = findColorsClick(16711680,0,300,2,700,60,true, false,0,0,"note")
        if CheckLoadVD[1] == -1 then  
            local error1 = findColorsClick(7289299,230,550,280,700,1,true, false,0,0,"note")
            local error2 = findColorsClick(417748,300,960,305,1050,1,true, false,0,0,"note")
            if error1[1] ~= -1 and error2[1] ~= -1 then 
                toast("Error Network",3)
                mSleep(1000)
                closeApp("com.google.ios.youtube")
                mSleep(3000)
                return true
            else
                local offADS = findColorsClick(16777215,638,330,639,420,1,true, true,-60,-105,"Skip ADS")
            end
        end
        local Point_White = findColorsClick(16777215,5,300,10,700,20,true, false,0,0,"note")
        if Point_White[1] ~= -1 then 
            local y_VD
            local status_VD = true
            for i=100,500,50 do
                if getColor(i,Point_White[2]) ~= 16777215 then status_VD = false end
            end
            if status_VD then
                local percent = math.random(75,83)
                local x_VD
                y_VD = Point_White[2]-4
                local time = 1
                local ran_Time = math.random(70,76)
                local action = math.random(1,3)
                local time_action = math.random(18,40)
                local surf = math.random(45,70)
                for i=1,ran_Time do
                    if i%3 == 0 then
                        local point = findMultiColorInRegionFuzzyExt(16711680, "16711680", 100,0,y_VD,639,y_VD+1)
                        if #point ~= 0 then  
                            local maxXPoint = point[1] 
                            for var = 2, #point do 
                                if point[var].x > maxXPoint.x then
                                    maxXPoint = point[var]
                                end
                            end
                            x_VD = maxXPoint.x
                        else
                            mSleep(15000)
                            toast("Skip ADS")
                            local offADS = findColorsClick(16777215,638,330,639,420,1,true, true,-60,-105,"note")
                            mSleep(5000)
                            Point_White = findColorsClick(16777215,5,300,10,700,2,true, false,0,0,"note")
                            if Point_White[1] ~= -1 then
                                y_VD = Point_White[2]-4
                            end
                            x_VD = 10
                        end

                        time = math.ceil(x_VD/640*100)
                        toast("Đang xem "..time.."% / "..percent.."%")
                    end
                    mSleep(6500)
                    if time > percent then break end
                end
                return true
            end
        end
    end
    return false
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