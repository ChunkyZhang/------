
flyFlag = {
   }
--地图信息
Maps = {
    ['宝象国']  = {max_x=160, max_y=120,FXF = true},
    ['建邺城']  = {max_x=288, max_y=144,FXF = true},
    ['朱紫国']  = {max_x=192, max_y=120,FXF = true,FXQ =true },
    ['长安城']  = {max_x=550, max_y=280,FXF = true,FXQ =true },
    ['长寿村']  = {max_x=160, max_y=210,FXF = true,FXQ =true },
    ['傲来国']  = {max_x=224, max_y=151,FXF = true,FXQ =true },
    ['西梁女国'] = {max_x=164,max_y=124,FXF = true},

    ['地府']    = {max_x=160,max_y=120},
    ['化生寺']  =  {max_x=128,max_y=96},
    ['东海湾']  =  {max_x=120,max_y=120,encounter = true},
    ['女儿村']  =  {max_x=128,max_y=144},
    ['花果山']  =  {max_x=160,max_y=120,encounter = true},
    ['狮驼岭']  =  {max_x=132,max_y=99, encounter = true},
    ['普陀山']  =  {max_x=96, max_y=72, encounter = true},
    ["五庄观"]  =  {max_x=100,max_y=75},
    ['麒麟山']  =  {max_x=191,max_y=143,encounter = true},
    ['墨家村']  =  {max_x=96, max_y=168},
    ['盘丝岭']  =  {max_x=200,max_y=150 ,encounter = true},
    ['北俱芦洲'] = {max_x=228, max_y=170,encounter = true},
    ['江南野外'] = {max_x=160, max_y=120,encounter = true},
    ['长寿郊外'] = {max_x=190, max_y=168,encounter = true},
    ['大唐境外'] = {max_x=636, max_y=120,encounter = true},
    ['大唐国境'] = {max_x=352, max_y=336,encounter = true},
    ['大唐官府'] = {max_x=165, max_y=104,},
------------------------以下建筑内地图----},
    ['长安酒店'] =  {max_x=67, max_y=67},
    ['建邺布店'] =  {max_x=44, max_y=32},
    ['傲来国客栈'] ={max_x=58, max_y=39},
    ['傲来国药店'] ={max_x=60, max_y=60},
    ['傲来国布店'] ={max_x=58, max_y=58},
    ['长安杂货店'] ={max_x=44, max_y=44},
    ['建邺杂货店'] ={max_x=48, max_y=48},
    ['长寿村当铺'] ={max_x=36, max_y=36},
    ['长寿村酒店'] ={max_x=55, max_y=55},
    ['长安国子监'] ={max_x=80, max_y=80},
    ['长安酒店二楼']={max_x=64,max_y=40},
    ['傲来客栈二楼']={max_x=61,max_y=61},

}
--传送点
portals = {
   ["地府"]  ={type ='circle',from='大唐国境', x= 48,y= 330},
   ["普陀山"]={type ='NPC', from='大唐国境',x= 221,y= 62},
   ["东海湾"]={type ='NPC', from='傲来国',x= 168 ,y= 16},
   ["墨家村"]={type ='NPC',from= '大唐境外',x= 238,y= 112},
   ["化生寺"]={type ='circle',from='长安城',x= 510 ,y= 274},
   ["麒麟山"]={type ='circle',from='朱紫国',x= 3 ,y= 112},
   ["狮驼岭"]={type ='circle',from='大唐境外',x= 4 ,y= 50},
   ["五庄观"]={type ='circle',from='大唐境外',x= 636 ,y= 78},
   ["女儿村"]={type ='circle',from='傲来国',x=4,y= 142},
   ["花果山"]={type ='circle',from='傲来国',x=219,y=143},
   ["北俱芦洲"]={type ='NPC', from='花果山',x= 28 ,y= 98},
   ["盘丝岭"]={type ='circle',from='大唐境外',x= 528 ,y= 115},
   ["长寿郊外"]={type ='circle',from='长寿村',x= 147,y= 5},
   ["大唐国境"]={{type ='circle',from='长安城',x= 1,y= 3,tx= 337,ty=146},{type ='NPC',from='长安城',x= 284,y= 41,tx= 82,ty=250}},
   ["大唐境外"]={{type ='circle',from='朱紫国',x= 1,y= 3,tx= 7,ty= 62},{type ='circle',from='大唐国境',x= 4 ,y= 77,tx=630,ty= 100}},
   ["江南野外"]={type ='circle',from='长安城',x= 544 ,y= 4},
   ["长安酒店"]={type ='circle',from='长安城',x=467,y=170},
   ["傲来国客栈"]={type ='circle',from='傲来国',x=179,y=30},
   ["傲来国服饰店"]={type ='circle',from='傲来国',x=51,y=42},
   ["傲来国药店"]={type ='circle',from='傲来国',x=28,y=75},
   ["长寿村当铺"]={type ='circle',from='长寿村',x=14,y=128},
   ["长寿村酒馆"]={type ='circle',from='长寿村',x=111,y=150},
   ["李记布庄"]={type ='circle',from='建邺城',x=171,y=36},{x=13,y=6},
   ["东升货站"]={type ='circle',from='建邺城',x=115,y=120},{x=25,y= 5 },
   ["潮音洞"]={type ='circle',from='普陀山',x=115,y=120},
   ["南北杂货店"]={type ='circle',from='长安城',x= 537,y=125},
   ["长安酒店二楼"]={type ='circle',from='长安酒店',x=35 ,y=35},{x= 37,y=31},
   ["傲来国客栈二楼"]={type ='circle',from='傲来国客栈',x=35 ,y=35},{x=35,y=9},
}

flyRoute ={
     
}


--npc信息
NPCInfo = {
    ['罗道人'] = {map = '长安城',x = 257 , y=42},
    ['酒楼老板'] = {map ='长安酒店',x = 45,y = 21},
    ['超级巫医'] = {map ='傲来国',x = 44,y =28 },
    ['西梁仓库'] = {map = '西梁女国',x = 101,y = 35},
    ['宝石商人'] = {map = '长安城',x=499,y=141},
    ['杂货店老板'] = {map ='长安杂货店', position= {869,252,921,392}},
    ['天台仓库管理员']  ={map ='长安城',x=348,y=244},
    ['建邺城仓库管理员']={map ='建邺城', x=54,y=32},
    ['傲来国仓库管理员']={map ='傲来国', x=146,y=99},
    ['长寿村仓库管理员']={map ='长寿村', x=107,y=61},
    ['朱紫国仓库管理员']={map ='朱紫国', x=126,y=90},
    ['宝象国仓库管理员']={map ='宝象国', x=110,y=75},
    ['西梁女国仓库管理员']={map = '西梁女国',x= 96, y=31}
}

---跑图函数
---@param m string
---@param to_x number
---@param to_y number
---@param set table {hide_exit = 取消出口, deviation = 允许偏移距离 }
function go_map(m,to_x,to_y,set,currentMap)
    mLog('前往:'..m..to_x..','..to_y)
    local currentMap = currentMap or getCurrentMap()
    local cx,cy = getCurrentCoords()
    local set = set or {}
    local distance =  math.sqrt(math.abs(to_x-cx) ^2+ math.abs(to_y-cy)^2)
    if set.deviation and (distance < set.deviation) and currentMap == m then
        return true
    end
    if Maps[m].encounter and os.time()-SYXTIME >1680 then
        useSYS()
    end

    if currentMap ~= m  then    -- 当前不在目标地图或者在长安城
        if Maps[m].enter[1].type == 'FXF' then  -- 使用飞行符到达
            useFXF(m)
        elseif  Maps[m].enter[1].type == 'FXQ' then  -- 使用飞行旗到达
            useFXQ(m,to_x,to_y)
        elseif m=='大唐境外' then   -- 大唐境外两种入口
            if to_x<450 then
                go_map('朱紫国', 5, 5, {deviation = 10},currentMap)
                randomClick(10, w-150,10)
            else
                go_map('大唐国境',8,77,{deviation = 8,hide_exit=false},currentMap)
                randomClick(10,w/2,10)
            end
            waitArrival(m)
        elseif m=='大唐国境' then     -- 大唐国境两种入口
            if to_x<180 then
                useFXQ('长安城', 283, 40)
                find_驿站老板()
            else
                useFXQ('长安城', 14, 4)
                randomClick(10, w-100,10)
            end
            waitArrival(m)
        else  -- 其他不能直达场景
            local tm, tx, ty =Maps[m].enter[1].map, Maps[m].enter[1].enter_x ,Maps[m].enter[1].enter_y
            go_map(tm, Maps[m].enter[1].x, Maps[m].enter[1].y,{deviation = 8},currentMap)
            local cx,cy = getCurrentCoords()
            local sx,sy = coords2ScreenXY(tm,cx,cy)
            local tsx,tsy = sx + (tx-cx)*PP, sy -(ty-cy)*PP
            randomClick(tsx,tsy)
            if Maps[m].enter[1].type =='NPC' then
                if m=='墨家村' then
                    mLog('点击对话3')
                    TClick(point["对话选项3"])
                else
                    mLog('点击对话2')
                    TClick(point["对话选项2"])
                end
            end
        end
    end

    local cx,cy = getCurrentCoords()
    if to_y== 0 and to_y ==0  then
        return true
    end
    local distance =  math.sqrt(math.abs(to_x-cx) ^2+ math.abs(to_y-cy)^2)
    if set.deviation and (distance < set.deviation) then
        return true
    else
        if Maps[m].inhouse then
            tapScreen2Coords(to_x, to_y,m)
        else
            tapCoords(to_x,to_y,set.hide_exit,m)
        end
        waitStop()
        cx,cy = getCurrentCoords()
        if getCurrentMap() == m and math.abs(cx - to_x)<3 and math.abs(cy - to_y)<3 then
            mLog('到达:'..m..to_x..','..to_y)
            return true
        end
    end
    mLog('未能到达:'..m..to_x..','..to_y)
    return false
end

---跑图
---@param map any
---@param x any
---@param y any
function go(map,x,y)
    if Maps[map].enter then
        
    end

end




---获取当前地图
---@return string
function getCurrentMap()
    local map_rect =  {90,23,191,46}
    local currentMap =  ocrByDict(mapDict,map_rect,'232529,222428', 90)
    return currentMap
end

---获取当前坐标
---@return number
---@return number
function getCurrentCoords()
    local function getCommaX()
        local y = 72
        local x1,x2 = 121,157
        if SCALE then
            y = math.floor( y*scale_y+0.5)
            x1,x2 = math.floor(x1*scale_x+0.5), math.floor(x2*scale_x+0.5)
        end
        for i = x1, x2, 1 do
            if isColor(i,y,0xe5e9eb,90) then
                return i
            end
        end
        return false
    end
    local CommaX = getCommaX()
    if CommaX==false then
        return 0,0
    end
    if SCALE then
        CommaX = math.floor(CommaX/scale_x+0.5)
    end
    local x =  ocrByDict(coordsDict, {89,53,CommaX,73},'DCE2E5,231D1A',90):gsub("%D+", "")
    local y =  ocrByDict(coordsDict, {CommaX,53,180,73},'DCE2E5,231D1A',90):gsub("%D+", "")
    return tonumber(x),tonumber(y)
end


---使用飞行旗
---@param toMap string
---@param x number
---@param y number
function useFXQ(toMap, x, y)
    if #flyFlag == 0 then
        recordFlyFlag()
    end
    local x1,y1,x2,y2 =table.unpack(rect.mapRect[toMap])
    if use(item[hcq..'合成旗']) then
        local red_t = fmcAllByTableInRect(view["飞行旗定位点"],{miss =20,rect ={x1-50,y1-50,x2+50,y2+80}})
        local redx = 0
        local redy = 0
        local distance = 99999
        for _, value in ipairs(red_t) do
            local rx = (value.x-rect[toMap][1]) * Maps[toMap].max_x/(rect[toMap][3]-rect[toMap][1])
            local ry = Maps[toMap].max_y- (value.y-rect[toMap][2]) * Maps[toMap].max_y/(rect[toMap][4]-rect[toMap][2])
            local d = (rx -x) ^2 + (ry - y)^2
            if d < distance then
                distance = d
                redx = value.x
                redy = value.y
            end
        end
        click(redx,redy)
        allClose()
    else
        if moveItemToFront(item[hcq..'合成旗'])  then
            useFXQ(toMap, x, y)
        else
            mLog("找不到"..toMap..'飞行旗');
            lua_exit()
        end
    end
end

---NPC寻路
---@param name any
---@param ocrname any
---@return boolean
function find_NPC(name,ocrname)
    local ocrname = ocrname or name
    local npc_map = NPCInfo[name].map
    local n_x,n_y = NPCInfo[name].x,  NPCInfo[name].y
    if NPCInfo[name].position then --固定位置
        go_map(npc_map, 0, 0,{hide_exit = true})
        mSleep(1000)
        TClick(NPCInfo[name].position)
    else
        if Maps[npc_map].inhouse  then
            go_map(npc_map, 0, 0,{hide_exit = true})
        else
            go_map(npc_map, n_x, n_y, {deviation=8})
        end
        local cx,cy = getCurrentCoords() 
        mSleep(1000)
        local sx,sy = coords2ScreenXY(npc_map, cx, cy)
        local nsx,nsy = sx+(n_x-cx)*PP, sy-(n_y-cy)*PP
        randomClick(nsx,nsy,3)
        if waitAppearView(view["对话"]["通用"],10) then
            return true         elseif hasView(view['NPC选择']) then
            if chooseNPC(ocrname) then
                return true
            end
        else
            lua_exit()
            return false
        end
    end
end

---使用飞行符
---@param tomap any
function useFXF(tomap)
    local rect = {
        长安城 = {673,273,736,327},
        朱紫国 = {496,421,520,446},
        建邺城 = {701,375,742,407},
        长寿村 = {441,164,465,199},
        宝象国 = {417,339,452,366},
        西梁女国={434,242,460,274}
    }
    if  use(item['飞行符']) then
        TClick(rect[tomap])
    else
        if moveItemToFront(item["飞行符"]) then
            useFXF(tomap)
        else
            buyFXF()
        end
    end
    allClose()
end


function buyFXF()
    if find_NPC("罗道人") then
        local ret =  ocr('ocr.png',rect["对话选择"])
        for _, value in ipairs(ret) do
            if value[1]== '我要做其他事情' then
                mLog('点击 我要做其他事情')
                local x1,y1,_,_ = table.unpack(rect["对话选择"])
                TClick({x1+value[2][1],y1+value[2][2],x1+value[2][3],y1+value[2][4]})
                break
            end
        end
        TClick(point["对话选项4"])
    else
        mLog('找不到罗道人')
        lua_exit()
    end
end


function recordFlyFlag()
    openBox()
    local indextmp = {}
    keepScreen(true)
    local 合成旗= {
        红色合成旗 = {{725,182,0x030000},{721,191,0xe30d0e},{727,193,0xefdf3c},{734,194,0xed0e10},{743,173,0xc81008},{724,175,0xe1c526}},
        黄色合成旗 = {{567,268,0xc99900},{558,271,0xf0e608},{582,253,0xe7d703},{571,275,0xecdd08},{562,249,0xb8b0d8},{561,284,0xb8b0d8},{549,278,0xb8b0d8}},
        绿色合成旗 = {{642,190,0x38eb00},{658,176,0xbc8404},{662,173,0x30c100},{659,184,0x3ae200},{641,178,0x38dc00},{644,190,0x38eb00}},
        白色合成旗 = {{492,292,0xc0b88d},{485,295,0xe8f0e0},{492,297,0xe3ce2f},{503,281,0xd08702},{485,282,0xedf5ea},{497,299,0xedf3e6}},
        蓝色合成旗 = {{186,379,0x01040a},{182,388,0x004ddf},{199,374,0xd78a02},{203,370,0x003ca7},{192,391,0x0045c9},{183,376,0x003fb2},{188,385,0x002c79}}
    }
    for _, colors in pairs(合成旗) do
        local tb =  findAllColors(colors, {rect ={529,150,937,482},main = 0x202020,list =0x202020})
        for _, value in ipairs(tb) do   
            table.insert(indextmp,getIndexByPoint(value['x'],value['y'],BAG))
        end
    end
    nLog(tableToString(indextmp))
    keepScreen(false)
    for _, value in ipairs(indextmp) do
        TClick(BAG[value])
        mSleep(500)
        local ocrstr = tesseractOcr({172,289,456,326},1,'场景:长傲来国城朱紫安寿村,还能使用次0123456789'):atrim()
        local flyTo =''
        local remain = ocrstr:gsub('%D+','')
        if     string.match(ocrstr,'长安城') then
            flyTo ='长安城'
        elseif string.match(ocrstr,'傲来国') then
            flyTo ='傲来国'
        elseif string.match(ocrstr,'朱紫国') then
            flyTo ='朱紫国'
        elseif string.match(ocrstr,'长寿村') then
            flyTo ='长寿村'
        end
        flyFlag[value]={to =flyTo,remain = remain}
    end
end


function recordFlyFlagCoords(to)
    local coords = {}
    local redPoint ={{766,337,0xf05a26},{775,339,0xc62f10},{766,346,0xb92c10},{758,344,0xc02c10}}
    local rect = {
        ['朱紫国'] = {224,116,909,546},
        ['长寿村'] = {403,115,732,547},
        ['长安城'] = {157,123,978,540},
        ['傲来国'] = {255,121,879,541}
    }

    local x1,y1,x2,y2 = table.unpack(rect[to])
    local points = findAllColors(redPoint,{rect={x1-15,y1-15,x2+15,y2+15}})
    nLog(#points)
    for _, value in ipairs(points) do
        local coordsX = math.floor((value.x/scale_x-rect[to][1])*(Maps[to].max_x/(rect[to][3]-rect[to][1]))+0.5)
        local coordsY = math.floor((rect[to][4]-value.y/scale_y)*(Maps[to].max_y/(rect[to][4]-rect[to][2]))+0.5)
        nLog(coordsX..','..coordsY)
        table.insert(coords,{coordsX,coordsY})
    end
    return coords
end



---@param map string
function waitArrival(map)
    local t = os.time()     repeat
        if os.time()- t > 8 then
            return false
        end
    until getCurrentMap() == map
    return true
end

---使用摄药香
function useSYS()
    if use(item["摄妖香"]) then
        SYXTIME = os.time()
        return true
    else
        if moveItemToFront(item["摄妖香"]) then
            useSYS()
        else
            buySYX()
            useSYS()
        end
    end
end

---点击小地图寻路
---@param x number
---@param y number
---@param tab table 例如 currentmap = '',hideEnter = bool , random = bool
function tapCoords(x,y,tab)
    local tab = tab or {}
    local m = tab.currentmap or getCurrentMap()
    TClick({86,26,174,68})
    local verticalLine = {{156,114,0xd8d0a8},{156,137,0xd8d0a8},{156,152,0xd8d0a8},{156,167,0xd8d0a8}} --垂直分割线
    local horizontalLine ={{372,530,0xd8d0a8},{395,530,0xd8d0a8},{433,530,0xd8d0a8},{460,530,0xd8d0a8}}  --水平分割线
    local x1,_ = findColors(verticalLine,{orient = 1,sim = 98,main = 0x050505,list=0x050505})
    local _,y1 = findColors(horizontalLine,{orient = 2,sim = 98,main = 0x050505,list=0x050505})
    local x2,_ = findColors(verticalLine,{orient = 4,sim = 98,main = 0x050505,list=0x050505})
    local _,y2 = findColors(horizontalLine,{orient = 6,sim = 98,main = 0x050505,list=0x050505})
    local frameHorizontal   ={{787,61,0x182428},{815,194,0x182428},{654,62,0x182428},{490,65,0x182428}}  --水平背景色
    local frameVerticalLine = {{895,89,0x182428},{889,114,0x182428},{892,159,0x182428},{877,76,0xd8d0a8},{877,92,0xd8d0a8},{877,103,0xd8d0a8}}  --垂直背景色
    local close_x,_= findColors(frameVerticalLine,{orient = 4,sim = 90,main = 0x050505,list=0x050505})  --关闭按钮x坐标
    local _,close_y= findColors(frameHorizontal,{orient = 3,sim = 90,main = 0x050505,list=0x050505})  --关闭按钮Y坐标
    --真实坐标
    local sx = (x2-x1)/ Maps[m].max_x*x + x1
    local sy = y2-(y2-y1)/Maps[m].max_y * y
    if tab.hideEnter then
        local enter,_ =  findColorInRegionFuzzy(0x59f6f4, 90, sx-50,sy-50,sx+50,sy+50)
        if enter ~= -1 then
            local fliter = {{279,158,0x2c4c60},{295,154,0x395867},{334,150,0x8aa0a8},{332,158,0x2c4c60},{334,168,0x66838e},{354,157,0x182428}}
            local sxx,sxy = findColors(fliter,{rect = {SCREEN_HEIGTH-close_x,0,close_x,SCREEN_WIDTH}})
            if sxx ~= -1 then
                randomClick(sxx, sxy, 10)
                local filter_enter = {{511,526,0xe0d0cc},{520,515,0xf0e8e8},{507,522,0xe7d8d7},{511,512,0x582c28},{505,529,0x582c28},{522,529,0x582c28},{548,518,0xff01ff}} -- 取消出口
                local ckx ,cky =  findColors(filter_enter,{orient = 5})
                if ckx~=-1 then
                    randomClick(ckx, cky, 2)
                    randomClick(sxx, sxy, 10)
                end
            end
        end
    end
    if tab.random then
        for i = 1, math.random(1, 4), 1 do 
            local random_x , random_y = sx +math.random(-35, 35) ,  sy +math.random(-35, 35)
            if random_x > min_x and random_x < max_x  and  random_y > min_y and random_y < max_y then
                click(random_x,random_y)
            end
        end
    end
    click(sx,sy)
    randomClick(close_x, close_y)
end

---找到长安驿站老板
function find_驿站老板()
    local 长安驿站老板 = {
        {{666,253,0xa4002e},{666,230,0xf8c387},{674,320,0x80bffd},{689,339,0xebd834},{673,338,0xebd834},{658,256,0x103726}},
        {{568,220,0x050844},{578,204,0x126746},{562,193,0x910011},{559,201,0xb0001b},{561,177,0x200800}},
        {{502,355,0x26170b},{492,374,0x001c08},{495,363,0x010c62},{491,350,0x0d3320},{499,339,0x900010},{503,345,0xb40018}},
        {{441,273,0xa70030},{455,272,0x052311},{439,295,0x6a4530},{441,256,0xb98057},{450,305,0x083c20}}
    }
    local x,y = findMultColors(长安驿站老板,{rect = {166,118,818,539},sim = 85})
    if x~=-1 then
        local 对话 = {{1107,474,0xa0c0c8},{1112,621,0x182c38},{71,299,0x583038},{1055,295,0x385468}}
        randomClick(x, y, 5)
        if wait({驿站传送对话= function () return matchColors(对话) end}) then
            TClick( {838,279,1068,322})
        end
    else
        nLog("找不到")
    end
end

---坐标转换为屏幕x,y
---@param map any
---@param x number
---@param y number
---@return number
---@return number
function coords2ScreenXY(map,x,y)
    local map = map or getCurrentMap()
    if x==nil or y ==nil then
        x,y = getCurrentCoords()
    end
    local sx,sy =0,0
    if x< h/2/PP  then
        sx = PP*x
    elseif Maps[map].max_x - x < h/2/PP then
        sx =  h-PP*(Maps[map].max_x - x)
    else
        sx = h/2
    end
    if y< w/2/PP  then
        sy = w -PP*y
    elseif Maps[map].max_y - y <  w/2/PP then
        sy = (Maps[map].max_y - y)*PP
    else
        sy = w/2
    end
    return sx,sy
end



---点击地板寻路
---@param x number
---@param y number
---@param map any
function tapScreen2Coords(x,y,map)
    mLog('点击屏幕前往'..x..','..y)
    mColorTap(view['显示任务'],point['隐藏任务'])
    local map = map or getCurrentMap()
    while true do
        local cx,cy = getCurrentCoords()
        if math.sqrt((cx-x)^2+(cy-y)^2)< 3 then
           break
        end
        local scx,scy = coords2ScreenXY(map)
        local tx = scx + (x-cx)*PP
        local ty = scy -(y-cy)*PP
        if tx > h then
            tx = h-10
        end
        if tx<0 then
            tx = 10
        end
        if ty> w then
            ty = w-140
        end
        if ty<51 then
            ty = 60
        end
        for index, value in ipairs(rect.invalid) do
            local x1,y1,x2,y2 = table.unpack(value)
            if (x1<tx and tx<x2 and  y1<ty and ty<y2) then
                mLog('非法点击区域'..index)
                if x2< (h/2)then
                    tx = x2+20
                else
                    tx = x1-20
                end 
                if y2>(w/2)  then
                    ty = y1-20
                else
                    ty = y2+20
                end
                click(tx, ty)
                if not mColor(view["主界面"]) then
                    allClose()
                end
                waitStop()
                break
            end
        end
        click(tx,ty)
        if not mColor(view["主界面"]) then
            allClose()
        end
        if mColor(view['社交选项']) then
            TClick(point['人物头像'])
            allClose()
        end
        waitStop()
    end
end

---等待停止走动
function waitStop()
    repeat
        local t = os.time()
        local x1,y1  = getCurrentCoords()
        mSleep(700)
        local x2,y2  = getCurrentCoords()
    until (x1 == x2 and y1 ==y2)
end
