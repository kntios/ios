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
        local Allow = findColorsClick(31487,360,630,540,900,1,true, true,30-rd+rd2,0,"note")
        if CheckOpenApp[1] ~= -1  then break end
    end

    if CheckOpenApp[1] ~= -1  then
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
        local view_Suggestion = true    ----- full đề xuất
        local view_Chanel_search = false
        if math.random(1,2) == 1 then
            view_Chanel = true
        end
        if math.random(1,5) == 4 then
            view_Chanel_search = true
        end

        if math.random(1,100) < 46 then
            view_Suggestion = true
        end 
        local status_Video = false


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
                                local ae = math.random(1,3)
                                for i=1,ae do
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

function GetProxy()
    local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/"..ID_Proxy
    local response = {}
    for i=1,20 do
        toast("Get Proxy")
        mSleep(math.random(1000,2200))
        local Result,status = httpGetCommon(url)
        if status==200 and (string.find(Result,"error")==nil) then 
            return true,Result
        end
        mSleep(math.random(5000,10000))
    end
    return false,1,1
end
function AddProxy()
    local ip
    local port
    local user
    local pass
    local statusProxy
    local Proxy
    Proxy = readFile(userPath().."/lua/ProxyV6.txt") 
    if Proxy then 
        if #Proxy > 4 then
            toast("Lấy Proxy")
            local V4 = Proxy[1]
            table.remove(Proxy, 1)
            table.insert(Proxy, V4)
            local bool = writeFile(userPath().."/lua/ProxyV6.txt",Proxy,"w",0)
            mSleep(500)
            if not bool then bool = writeFile(userPath().."/lua/ProxyV6.txt",Proxy,"w",0) end
            local fulldata = strSplit(V4,":"); 
            ip = fulldata[1]
            port = fulldata[2]
            statusProxy = true
        else
            statusProxy = false
        end
    end
    if not statusProxy then
        statusProxy,Proxy = GetProxy()  
        local bool = writeFileString(userPath().."/lua/ProxyV6.txt",Proxy.."\n","a")
        local fulldata = strSplit(Proxy,":"); 
        ip = fulldata[1]
        port = fulldata[2]
    end
    if ip ~= nil then
        return true,ip,port
    end

end