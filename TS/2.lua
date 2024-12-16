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


    function typing(text,type_Name)
        local chuoi_ky_tu	=	text
        local chuoi_ky_tu_len	=	string.len(chuoi_ky_tu)	+1
        local Check1 = false
        local Check2 = false
        local Check3 = true
        --if type_Name == "number" then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(45, 1285) end
        repeat
        local a= math.random(-15,15) + math.random(-150,150)/100
        mSleep(1)
        local b= math.random(-15,15) + math.random(-160,150)/100
        mSleep(1)
        local c= math.random(-15,15) + math.random(-150,140)/100
        mSleep(1)
        local d= math.random(-15,15) + math.random(-155,148)/100
        mSleep(1)
        --if math.random(1,6) == 4 then mSleep(math.random(500,1400)+math.random(-200,200)/100) end
        if not(Check1) == Check2 then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) end
        local	ky_tu	=	tostring(string.sub(chuoi_ky_tu,1,1))	
        if tonumber(ky_tu) ~= nil and Check3 then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35, 1090); Check3 = false end
        local ky_tu_thu_hai = tostring(string.sub(chuoi_ky_tu,2,2))
    
            if tonumber(ky_tu) ~= nil then Check1 = true else Check1 = false end
            if tonumber(ky_tu_thu_hai) ~= nil then Check2 = true else Check2 = false end
    
        Check3 = false
        if ky_tu == ("q") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(30 +d,765+c) end
        if ky_tu == ("w") then mSleep(math.random(50,109)+math.random(-200,200)/100) Tap(95 +b,765+c) end
        if ky_tu == ("e") then mSleep(math.random(40,100)+math.random(-200,200)/100) Tap(160+c,765+b) end
        if ky_tu == ("r") then mSleep(math.random(40,103)+math.random(-200,200)/100) Tap(225+a,765+b) end
        if ky_tu == ("t") then mSleep(math.random(40,100)+math.random(-200,200)/100) Tap(288+d,765+a) end
        if ky_tu == ("y") then mSleep(math.random(40,100)+math.random(-200,200)/100) Tap(350+c,765+a) end
        if ky_tu == ("u") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(415+a,765+b) end
        if ky_tu == ("i") then mSleep(math.random(44,100)+math.random(-200,200)/100) Tap(480+b,765+c) end
        if ky_tu == ("o") then mSleep(math.random(43,101)+math.random(-200,200)/100) Tap(545+c,765+a) end
        if ky_tu == ("p") then mSleep(math.random(42,100)+math.random(-200,200)/100) Tap(610+d,765+b) end
        if ky_tu == ("a") then mSleep(math.random(49,107)+math.random(-200,200)/100) Tap(65 +b,875+c) end
        if ky_tu == ("s") then mSleep(math.random(48,100)+math.random(-200,200)/100) Tap(130+c,875+a) end
        if ky_tu == ("d") then mSleep(math.random(47,104)+math.random(-200,200)/100) Tap(192+a,875+b) end
        if ky_tu == ("f") then mSleep(math.random(46, 89)+math.random(-200,200)/100) Tap(255+b,875+c) end
        if ky_tu == ("g") then mSleep(math.random(45, 86)+math.random(-200,200)/100) Tap(320+c,875+a) end
        if ky_tu == ("h") then mSleep(math.random(40, 80)+math.random(-200,200)/100) Tap(385+d,875+b) end
        if ky_tu == ("j") then mSleep(math.random(40, 90)+math.random(-200,200)/100) Tap(450+b,875+c) end
        if ky_tu == ("k") then mSleep(math.random(40, 90)+math.random(-200,200)/100) Tap(512+c,875+a) end
        if ky_tu == ("l") then mSleep(math.random(40, 92)+math.random(-200,200)/100) Tap(575+a,875+c) end
        if ky_tu == ("z") then mSleep(math.random(51, 90)+math.random(-200,200)/100) Tap(127+b,980+c) end
        if ky_tu == ("x") then mSleep(math.random(49, 90)+math.random(-200,200)/100) Tap(192+c,980+a) end
        if ky_tu == ("c") then mSleep(math.random(48, 90)+math.random(-200,200)/100) Tap(255+a,980+d) end
        if ky_tu == ("v") then mSleep(math.random(47, 92)+math.random(-200,200)/100) Tap(320+d,980+a) end
        if ky_tu == ("b") then mSleep(math.random(46, 90)+math.random(-200,200)/100) Tap(385+c,980+b) end
        if ky_tu == ("n") then mSleep(math.random(45, 90)+math.random(-200,200)/100) Tap(448+a,980+c) end
        if ky_tu == ("m") then mSleep(math.random(44, 91)+math.random(-200,200)/100) Tap(510+b,980+c) end
        if ky_tu == ("Q") then mSleep(math.random(43, 93)+math.random(-200,200)/100) Tap(42+d, 985+b) mSleep (math.random(50,100)+math.random(-200,200)/100) Tap(30 +a,765+c)  end
        if ky_tu == ("W") then mSleep(math.random(42, 90)+math.random(-200,200)/100) Tap(42+a, 985+d) mSleep (math.random(50,103)+math.random(-200,200)/100) Tap(95 +d,765+a) end
        if ky_tu == ("E") then mSleep(math.random(41, 96)+math.random(-200,200)/100) Tap(42+b, 985+c) mSleep (math.random(50, 91)+math.random(-200,200)/100) Tap(160+c,765+b) end
        if ky_tu == ("R") then mSleep(math.random(40, 90)+math.random(-200,200)/100) Tap(42+c, 985+a) mSleep (math.random(50, 92)+math.random(-200,200)/100) Tap(225+a,765+b) end
        if ky_tu == ("T") then mSleep(math.random(56, 99)+math.random(-200,200)/100) Tap(42+a, 985+b) mSleep (math.random(50, 93)+math.random(-200,200)/100) Tap(288+b,765+a) end
        if ky_tu == ("Y") then mSleep(math.random(50, 97)+math.random(-200,200)/100) Tap(42+b, 985+a) mSleep (math.random(50, 94)+math.random(-200,200)/100) Tap(350+d,765+a) end
        if ky_tu == ("U") then mSleep(math.random(50, 98)+math.random(-200,200)/100) Tap(42+c, 985+d) mSleep (math.random(50, 95)+math.random(-200,200)/100) Tap(415+a,765+b) end
        if ky_tu == ("I") then mSleep(math.random(50, 90)+math.random(-200,200)/100) Tap(42+a, 985+d) mSleep (math.random(50, 96)+math.random(-200,200)/100) Tap(480+b,765+c) end
        if ky_tu == ("O") then mSleep(math.random(52,101)+math.random(-200,200)/100) Tap(42+b, 985+a) mSleep (math.random(50, 97)+math.random(-200,200)/100) Tap(545+c,765+b) end
        if ky_tu == ("P") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+c, 985+a) mSleep (math.random(50, 98)+math.random(-200,200)/100) Tap(610+d,765+b) end
        if ky_tu == ("A") then mSleep(math.random(50,103)+math.random(-200,200)/100) Tap(42+a, 985+b) mSleep (math.random(50, 99)+math.random(-200,200)/100) Tap(65 +b,875+c) end
        if ky_tu == ("S") then mSleep(math.random(51,100)+math.random(-200,200)/100) Tap(42+d, 985+a) mSleep (math.random(45, 90)+math.random(-200,200)/100) Tap(130+c,875+a) end
        if ky_tu == ("D") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+c, 985+d) mSleep (math.random(45, 90)+math.random(-200,200)/100) Tap(192+d,875+c) end
        if ky_tu == ("F") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+a, 985+c) mSleep (math.random(45,107)+math.random(-200,200)/100) Tap(255+b,875+c) end
        if ky_tu == ("G") then mSleep(math.random(50,102)+math.random(-200,200)/100) Tap(42+b, 985+a) mSleep (math.random(45,100)+math.random(-200,200)/100) Tap(320+c,875+b) end
        if ky_tu == ("H") then mSleep(math.random(53,108)+math.random(-200,200)/100) Tap(42+c, 985+b) mSleep (math.random(45,107)+math.random(-200,200)/100) Tap(385+a,875+b) end
        if ky_tu == ("J") then mSleep(math.random(50,87)+math.random(-200,200)/100)  Tap(42+a, 985+d) mSleep (math.random(45,100)+math.random(-200,200)/100) Tap(450+d,875+c) end
        if ky_tu == ("K") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+b, 985+a) mSleep (math.random(45,108)+math.random(-200,200)/100) Tap(512+c,875+a) end
        if ky_tu == ("L") then mSleep(math.random(50,109)+math.random(-200,200)/100) Tap(42+d, 985+b) mSleep (math.random(45,100)+math.random(-200,200)/100) Tap(575+a,875+b) end
        if ky_tu == ("Z") then mSleep(math.random(50,86)+math.random(-200,200)/100)  Tap(42+a, 985+c) mSleep (math.random(45,100)+math.random(-200,200)/100) Tap(127+b,980+c) end
        if ky_tu == ("X") then mSleep(math.random(51,107)+math.random(-200,200)/100) Tap(42+b, 985+a) mSleep (math.random(45,102)+math.random(-200,200)/100) Tap(192+c,980+a) end
        if ky_tu == ("C") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+c, 985+d) mSleep (math.random(45,110)+math.random(-200,200)/100) Tap(255+d,980+b) end
        if ky_tu == ("V") then mSleep(math.random(50,106)+math.random(-200,200)/100) Tap(42+a, 985+b) mSleep (math.random(45, 85)+math.random(-200,200)/100) Tap(320+b,980+c) end
        if ky_tu == ("B") then mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(42+d, 985+c) mSleep (math.random(45, 87)+math.random(-200,200)/100) Tap(385+c,980+a) end
        if ky_tu == ("N") then mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(42+c, 985+a) mSleep (math.random(45, 96)+math.random(-200,200)/100) Tap(448+a,980+b) end
        if ky_tu == ("M") then mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(42+a, 985+b) mSleep (math.random(45, 76)+math.random(-200,200)/100) Tap(510+b,980+a) end	
        if ky_tu == ("1") then mSleep(math.random(51, 92)+math.random(-200,200)/100) Tap(30 +d, 765+a)  end
        if ky_tu == ("2") then mSleep(math.random(52, 95)+math.random(-200,200)/100) Tap(95 +a, 765+b)   end
        if ky_tu == ("3") then mSleep(math.random(53, 98)+math.random(-200,200)/100) Tap(160+b, 765+a)   end  
        if ky_tu == ("4") then mSleep(math.random(54, 95)+math.random(-200,200)/100) Tap(225+d, 765+b)   end  
        if ky_tu == ("5") then mSleep(math.random(55, 94)+math.random(-200,200)/100) Tap(288+a, 765+c)   end
        if ky_tu == ("6") then mSleep(math.random(56, 95)+math.random(-200,200)/100) Tap(350+b, 765+a)   end
        if ky_tu == ("7") then mSleep(math.random(57, 95)+math.random(-200,200)/100) Tap(415+c, 765+b)   end  
        if ky_tu == ("8") then mSleep(math.random(58, 99)+math.random(-200,200)/100) Tap(480+a, 765+c)   end  
        if ky_tu == ("9") then mSleep(math.random(59, 95)+math.random(-200,200)/100) Tap(545+d, 765+a)   end  
        if ky_tu == ("0") then mSleep(math.random(51, 97)+math.random(-200,200)/100) Tap(610+c, 765+b)   end 
        if ky_tu == ("@") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50,95)+math.random(-200,200)/100) Tap(545+a,875+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)  end
        if ky_tu == (".") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(51, 97)+math.random(-200,200)/100) Tap(140+a,980+c) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)  end
        if ky_tu == (",") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(51, 97)+math.random(-200,200)/100) Tap(230+a,980+c) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)  end
        if ky_tu == ("!") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50,100)+math.random(-200,200)/100) Tap(410+d,980+a) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b) 	end
        if ky_tu == ("$") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(40+a,980+b) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(415+c,875+a) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)	end
        if ky_tu == ("?") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(320+a,980+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b) 	end
        if ky_tu == ("|") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(40+a,980+b) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(160+a,870+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)	end
        if ky_tu == ("-") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(30+a,875+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)	end
        if ky_tu == ("_") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(40+a,980+b) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(30+a,875+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)	end
        if ky_tu == ("#") then mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+a, 1090+c) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(40+a,980+b) mSleep(math.random(50, 95)+math.random(-200,200)/100) Tap(288+a,766+b) mSleep(math.random(40,102)+math.random(-200,200)/100) Tap(35+c, 1090+b)	end
        if ky_tu == (" ") then mSleep(math.random(52, 95)+math.random(-200,200)/100) Tap(315+d,1090+d)      end		
        if ky_tu == ("") then break end
        mSleep(100)
        chuoi_ky_tu_len	=	chuoi_ky_tu_len - 1
        chuoi_ky_tu	=	string.sub(chuoi_ky_tu,2,chuoi_ky_tu_len)
        if	chuoi_ky_tu_len	==	0	then break end
        until 1 == 2
    end	
    
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
            typing(key,"pass")
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
        local url = "https://ytb.ishoperp.com/api/app/ytbshare/next-detail/6666"
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
        local InfoWifi = findColorsClick(31487,580,250,600,400,15,true, true,3,15,"note")
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
            local Proxy = findColorsClick(0,480,915,580,1100,10,true, true,10,10,"note")
            if Proxy[1] ~= -1 then
                mSleep(1000)
                local Off = findColorsClick(31487,560,280,620,400,10,true, true,5,-100,"note")
                if Off[1] ~= -1 then
                    mSleep(500)
                    local Save = findColorsClick(31487,540,50,620,110,10,true, true,10,10,"note")
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
        local InputMail = findColorsClick(7632757,65,580,75,800,15,true, true,140+ran_x-rd,60+rd+rd2,"note")
        if InputMail[1] ~= -1  then
            mSleep(math.random(2000,2500)+math.random(-100,100)/100)
            status, strDomain, strPass = GetDomain()
            if status then
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
                    mSleep(math.random(3000,4000)+math.random(-100,100)/100)
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
                        Tap(60,1010)
                        mSleep(500)
                        local Agree = findColorsClick(743376,240,850,600,1000,5,true, true,30+rd+rd2,20+rd,"note")
                        mSleep(500)
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
    





function RespringData()
    closeApp("*",1)
    os.execute("killall -9 SpringBoard")
    os.execute("su mobile -c uicache");	
    	--respring()
	mSleep(5000)
	flag = true;
	repeat 
	   	flag = deviceIsLock()
    	if flag then
    		unlockDevice()
    		pressHomeKey(0)	
        	mSleep(1500)
        	pressHomeKey(1)
    	end	
	until flag
	mSleep(1000)
    init("0","0")
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
function WIPEAPP()
    closeApp("com.apple.mobilesafari");	
    closeApp("com.apple.AppStore");
    closeApp("com.apple.Preferences");
    closeApp("*",1)
    clearCookies()
    clearPasteboard()
    clearKeyChain("com.apple.AppStore");
    clearAllKeyChains()
    os.execute("su mobile -c uicache");
        io.popen("echo alpine | sudo -u root -S killall -9 MobileSafari");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/MobileSoftwareUpdate/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Logs/*.log");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/logs/*.log*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/logs/AppleSupport/*.log");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/logs/CrashReporter/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/root/.bash_history");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/db/diagnostics/shutdown.log");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/root/Library/Logs/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Downloads/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Caches/Snapshots/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Caches/com.apple.Safari.SafeBrowsing/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Caches/com.apple.WebKit.Networking/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Caches/com.apple.WebKit.WebContent/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/com.apple.WebKit/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/CrashReporter/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Logs/AppleSupport/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Logs/CrashReporter/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Recents/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/Safari/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/SafariSafeBrowsing/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/WebClips/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Library/WebKit/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /var/mobile/Media/Downloads/*");
        io.popen("echo alpine | sudo -u root -S rm -rf /private/var/mobile/Library/Caches/com.apple.mobilesafari");
        io.popen("echo alpine | sudo -u root -S rm -rf /private/var/mobile/Library/Caches/Safari");
        io.popen("echo alpine | sudo -u root -S rm /private/var/mobile/Library/Cookies/Cookies.binarycookies");
        io.popen("echo alpine | sudo -u root -S rm /private/var/root/Library/Cookies/Cookies.binarycookies");
        io.popen("echo alpine | sudo -u root -S killall -9 pasted");
        io.popen("echo alpine | sudo -u root -S killall -9 pasteboardd");
        io.popen("echo alpine | sudo -u root -S launchctl unload -w /System/Library/LaunchDaemons/com.apple.UIKit.pasteboardd.plist");
        io.popen("echo alpine | sudo -u root -S launchctl unload -w /System/Library/LaunchDaemons/com.apple.pasteboard.pasted.plist");
	os.execute("rm -rf ~/Library/Caches/com.apple.Safari;")
    os.execute("rm -rf ~/Library/Caches/com.apple.WebKit.PluginProcess;")
    os.execute("rm -rf ~/Library/Cookies/Cookies.binarycookies;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.Safari.LSSharedFileList.plist;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.Safari.RSS.plist;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.Safari.plist;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.WebFoundation.plist;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.WebKit.PluginHost.plist;")
    os.execute("rm -rf ~/Library/Preferences/com.apple.WebKit.PluginProcess.plist;")
    os.execute("rm -rf ~/Library/PubSub/Database;")
    os.execute("rm -rf ~/Library/Saved/Application/ State/com.apple.Safari.savedState")
	os.execute("rm -rf /private/var/mobile/Library/Safari/*")
    os.execute("rm -rf /var/mobile/Library/Safari/*")
	os.execute("rm -rf /var/mobile/Library/com.apple.nsurlsessiond-launchd/*")
	os.execute("rm -rf /var/mobile/Library/com.apple.nsurlsessiond-launchd/*")
	os.execute("rm -rf /var/mobile/Library/Caches/com.apple.AppleAccount/fsCachedData")
	os.execute("rm -rf /var/mobile/Library/Caches/*")
	os.execute("rm -rf /var/mobile/Library/Mail/*")
	os.execute("rm -rf /var/mobile/Library/Logs/*")
	os.execute("rm -rf /User/Library/Caches/*")
    os.execute("rm -rf /private/var/tmp/*");
    mSleep(10)
    os.execute("rm -rf /var/mobile/Library/ConfigurationProfiles/*")
    os.execute("rm -rf /var/mobile/Library/CloudKit/*")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.accountsettings.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.celestial.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.commerce.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.identityservicesd.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.ids.service.com.apple.madrid.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.imagent.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.itunesstored.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.Maps.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.storeagent.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.mobilemeaccounts.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.accountsd.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.security.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.ids.plist")
    os.execute("rm -rf /var/mobile/Library/Preferences/com.apple.icloud.searchpartyd.plist")
    os.execute("rm -rf /private/var/mobile/Library/Caches/com.apple.MobileAsset.UserFonts")
    os.execute("rm -rf /private/var/mobile/Library/Caches/com.apple.icloud.fmipserver")
    os.execute("rm -rf /private/var/mobile/Library/Cookies/com.apple.appstore.binarycookies")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.storebookmarks.plist")
    os.execute("rm -rf /private/var/mobile/Library/CloudKit/CloudKitMetadata*")
    os.execute("rm -rf /private/var/mobile/Library/CloudKit/com.apple.cloudd.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.cloudkit.sync.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.cloudkit.pcs.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.cloudkit.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.security.cloudkeychainproxy3.keysToRegister")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.security.idsidentityd.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.AppStore.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.AppleAccountUI.plist")
    os.execute("rm -rf /private/var/mobile/Library/Preferences/com.apple.storeServices.plist")
    mSleep(10) 
    os.execute("rm -rf //private/var/mobile/Library/.umeng/*")
    os.execute("rm -rf //private/var/mobile/Library/Caches/*")
    os.execute("rm -rf //private/var/mobile/Library/com.apple.iTunesCloud/*")
    os.execute("rm -rf //private/var/mobile/Library/com.apple.itunesstored/*")
    os.execute("rm -rf //private/var/mobile/Library/com.apple.nsurlsessiond/*")
    os.execute("rm -rf //private/var/mobile/Library/com.apple.nsurlsessiond-launchd/*")
    os.execute("rm -rf //private/var/mobile/Library/Passes/*")
    os.execute("rm -rf //private/var/mobile/Library/Safari/*")
    ts.dborder("/var/mobile/Library/Accounts/Accounts3.sqlite","DELETE FROM ZACCOUNT");
    ts.dborder("/var/mobile/Library/Accounts/Accounts3.sqlite","DELETE FROM ZACCOUNTPROPERTY");  
    mSleep(5)
    clear('/private/var/mobile/Library/Safari/')
    mSleep(5)
    clear('private/var/db/lsd/com.apple.lsdidentifiers.plist')
    clear('private/var/mobile/Library/Caches/com.apple.itunesstored/fsCachedData');
    mSleep(5)
    clear('private/var/mobile/Library/WebKit/');
    clear('private/var/mobile/Library/Caches/com.apple.UIKit.pboard');
    mSleep(5)
    clear("/private/var/mobile/Containers/Data/Application")
    clear("/private/var/mobile/Containers/Shared/AppGroup")
    clear("/private/var/mobile/Media/TouchSprite/log")
    mSleep(5)
end 


function main()
    local a = math.random(15,30)
    for i=1,a do
        toast("Đợi tool",s)
        mSleep(20000)
    end
end


