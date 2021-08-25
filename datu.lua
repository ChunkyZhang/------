-- require('ocrapi')
-- require 'PassVerify'
local mp = {'地府','长安城','花果山','普陀山','女儿村','建邺城','麒麟山','墨家村','狮驼岭','朱紫国','东海湾','傲来国','五庄观','长寿村','化生寺','大唐国境','大唐境外','长寿郊外','北俱芦洲','江南野外','西梁女国'}
local zwmap = {'傲来客栈二楼','傲来国药店','长安饰品店','长安杂货店','长安国子监','长安酒店二楼','长寿村酒店','长寿村当铺','建邺布店','建邺杂货店','傲来国','花果山','大唐国境','地府','东海湾','化生寺','江南野外','女儿村','普陀山','狮驼岭','西梁女国','长寿村','长寿郊外','朱紫国','建邺城','建邺'}
local house = {'傲来客栈二楼','傲来国药店','长安饰品店','长安杂货店','长安国子监','长安酒店二楼','长寿村酒店','长寿村当铺','建邺布店','建邺杂货店'}
local bigHouse = {['傲来客栈二楼']={25,21},['长安国子监']={34,30},['长安酒店二楼']={28,18}}
local qd_whitelist = '强盗西梁紫陀湾东邺府花岭外建女野大寺地朱普驼化儿寿山村国来江南傲果郊生唐境城长洲狮海0123456789,'
local zw_whitelist = '安观西梁紫陀湾东邺府花宝岭家外建女野北俱大寺地朱普驼化儿寿山村国来酒客栈店江南傲果当铺布郊生唐境城长洲狮子监二楼海饰品药杂货芦五0123456789,'

function dabaotu(times)
    allClose()
    mColorTap(view['隐藏任务'], point['显示任务'])
    if mColor(view['成功领取宝图任务'],92) == true then
        mLog('已经有任务')
        qiangdao(getQdMapCoordsNameTime())
    else
        if not mColor(view['无任务']) then
            repeat
                longTap(1735,378,8)
                local dx,dy = fmcByTableInRect(view["删除该任务"], FULLSCREEN)
                if dx~=-1 then
                    randomClick(dx, dy, 5)
                end
            until mColor(view['无任务'])
        end
    end

    for i = 1, times, 1 do
        findDXE()
        local m,x,y = getQdMapCoordsNameTime()
        checkRole()
        checkPet()
        qiangdao(m,x,y)
        collectgarbage("collect")
    end
end

function findDXE()
    local 店小二 = {
        {{1063,261,0x708090},{1056,309,0xead734},{1034,318,0xdecc31},{1075,216,0x7e432e},{1063,232,0xc88a6b},{1006,300,0x80c0ff},{1079,298,0x80c0ff}},
        {{841,272,0x8894c0},{850,276,0x74849d},{866,322,0x80c0ff},{884,320,0x80c0ff},{821,338,0xead734},{842,338,0xe8d739},{838,227,0x884630},{851,232,0x703c28}},
        {{524,448,0xa3b3c5},{557,488,0x80c0ff},{575,486,0x80bffe},{512,504,0xe2cf32},{533,503,0xe3cf33},{518,401,0x7d4328},{523,423,0xca9a82}}
    }
    local x,y = findMultColors(店小二,{main = 0x202020,list = 0x202020},10)
    local rx,ry = getCurrentCoords()
    if x ~=-1 then
        click(x, y)
    end
end

function getQdMapCoordsNameTime()
    mLog('识别强盗任务')
    local m,x,y ='', 0,0
    mColorTap(view['隐藏任务'], point['显示任务'])
    local binaryColors={{0xE00806,0x2A0907}}
    local regin =  findTextboxByColor(true)
    local box = {}
    for _, value in ipairs(regin) do
        table.insert(box, {value[1]-rect["打宝任务"][1]-2,value[2]-rect["打宝任务"][2]-2,value[3]-rect["打宝任务"][1]+2,value[4]-rect["打宝任务"][2]+2})
    end
    -- mLog(json.encode(box))
    local res = ocr( 'ocr.png', rect["打宝任务"], {boxlist = box,whitelist = qd_whitelist,upload = true})
    -- local time = tonumber(res[#res][1])
    table.remove(res)
    local rwstr = ''
    for _, value in ipairs(res) do
        rwstr = rwstr..value[1]
    end
    -- mLog(rwstr)
    for _, value in ipairs(mp) do
        if string.match(rwstr, value) then
            m = value
            break
        end
    end
    local re, _ = rwstr:gsub('%D+', ',')
    x = tonumber(re:split(',')[2]) or ''
    y = tonumber(re:split(',')[3]) or ''
    if m =='' or x == '' or y== '' then
        m,x,y = getQdMapCoordsNameByDetail()
    end
    mColorTap(view['显示任务'],point['隐藏任务'])
    mLog(m..':'..x..','..y)
    return m, x, y
end

function getQdMapCoordsNameByDetail()
    local m,x,y ='', 0,0
    mLog('打开任务详情识别强盗任务')
    mColorTap(view['隐藏任务'], point['显示任务'])
    TClick(point['任务详情'])
    if mColor(view['赏金任务']) == false then
        TClick(point['赏金任务'])
    end
    mSleep(800)
    local restable = ocr('ocr.png', {643,242,1585,382},{upload = false,boxlist = {{0,0,940,50},{0,50,940,95},{0,95,940,140}}})
    local rwstr2 = ''
    for _, value in ipairs(restable) do
        rwstr2 = rwstr2..value[1]
    end
    -- mLog(rwstr2)
    for _, value in ipairs(mp) do
        if string.match(rwstr2, value) then
            m = value
            break
        end
    end
    local numbers, c= rwstr2:gsub('%D+', ',')

    if c>2  then
        x = tonumber(numbers:split(',')[2])
        y = tonumber(numbers:split(',')[3])
    end
    mColorTap(view['显示任务'],point['隐藏任务'])
    mLog(m..':'..x..','..y)
    return m,x,y
end

function getZWMapCoordsName()
    tapClose()
    local m, x, y = '',0,0
    mColorTap(view['隐藏任务'], point['显示任务'])
    local binaryColors={{0xE00806,0x2A0907}}
    local regin =  findTextboxByColor()
    local box = {}
    for _, value in ipairs(regin) do
        table.insert(box, {value[1]-rect["打宝任务"][1]-3,value[2]-rect["打宝任务"][2],value[3]-rect["打宝任务"][1]+5,value[4]-rect["打宝任务"][2]})
    end
    -- mLog(json.encode(box))
    local res = ocr('zw.png', rect["打宝任务"], {boxlist = box,whitelist = zw_whitelist,upload = true})
    local rwstr = ''
    for _, value in ipairs(res) do
        rwstr = rwstr..value[1]
    end
    for _, value in ipairs(zwmap) do
        if string.match(rwstr, value) then
            m = value
            if m=='建邺' then
                m ='建邺城'
            end
            break
        end
    end
    if isIn(m,house) == false then
        local re, _ = rwstr:gsub('%D+', ',')
        x = tonumber(re:split(',')[2])
        y = tonumber(re:split(',')[3])
        if x ==0 or y == 0 then
            lua_exit()
        end
    end
    if m == '' then
        mLog('识别贼王地点失败')
        m,x,y = getZWMapCoordsNameByDetail()
    end
    TClick(point['隐藏任务'])
    if x >= Maps[m].max_x then
        x = Maps[m].max_x-1
    end
    if y >= Maps[m].max_y then
        y = Maps[m].max_y-1
    end
    mColorTap(view['显示任务'],point['隐藏任务'])
    mLog(m..':'..x..','..y)
    if m == '' then
        mLog('识别贼王地点失败')
        lua_exit()
    end
    return m, x, y
end


function getZWMapCoordsNameByDetail()
    mLog('打开任务详情识别贼王任务')
    local m,x,y ='', 0,0
    mColorTap(view['隐藏任务'], point['显示任务'])
    TClick(point['任务详情'])
    if mColor(view['赏金任务']) == false then
        TClick(point['赏金任务'])
    end
    mSleep(800)
    local restable = ocr('ocr.png', {643,242,1585,382},{upload = false,boxlist = {{0,0,940,50},{0,50,940,95},{0,95,940,140}}})
    local rwstr2 = ''
    for _, value in ipairs(restable) do
        rwstr2 = rwstr2..value[1]
    end
    -- mLog(rwstr2)
    for _, value in ipairs(zwmap) do
        if string.match(rwstr2, value) then
            m = value
            if m=='建邺' then
                m ='建邺城'
            end
            break
        end
    end
    if isIn(m,house) == false then
        local re, _ = rwstr:gsub('%D+', ',')
        x = tonumber(re:split(',')[2])
        y = tonumber(re:split(',')[3])
        if x ==0 or y == 0 then
            lua_exit()
        end
    end
    return m,x,y
end


function zeiwang()
    local m,x,y= getZWMapCoordsName()
    checkRole()
    checkPet()
    go_map(m,x,y,{hide_exit=1,deviation=5})
    mSleep(2000)
    local bool =  find_ZW(m,x,y)
    if bool then
        fight_ZW()
    else
        mLog('找不到贼王')
        lua_exit()
    end
    --     if m=='长安城国子监' then
    --         tapScreen2Coords(33,29,m)
    --     elseif m=='傲来国药店' then
    --         tapScreen2Coords(30,21,m)
    --     elseif m=='傲来客栈二楼' then
    --         tapScreen2Coords(26,21,m)
    --     elseif m=='长安酒店二楼' then
    --         tapScreen2Coords(26,18,m)
    --     else
    --         mLog('找不到贼王')
    --         lua_exit()
    --     end
    --     bool =  find_ZW(m)
    --     if not bool then
    --         mLog('找不到贼王')
    --         lua_exit()
    --     else
    --         fight_ZW()
    --     end
    -- end
end


function find_ZW(map,x,y)
    -- local smallHouse = {'建邺布店','建邺杂货店','长寿村当铺','傲来国药店','长寿村酒店','长安杂货店','长安饰品店'}
    if x~=0 or y~=0 then        --贼王在场景
        mLog('贼王在场景')
        return  touch_zw()
    elseif bigHouse[map] then   --在大建筑内
        mLog('在大建筑内')
        local bool = touch_zw(map)
        if bool then
           return bool
        else
            tapScreen2Coords( bigHouse[map][1], bigHouse[map][2], bigHouse[map])
            -- local  bool=  touch_zw()
            return touch_zw()
        end
    else                        --在小建筑内
        mLog('在小建筑内')
        local zw_xy_t = fmcAllByTableInRect(NPC["贼王"],{sim = 85, main = 0x202020,list = 0x202020, miss =20})
        if #zw_xy_t == 0 then
            mLog(''..#zw_xy_t)
            mLog('找不到')
            lua_exit()
        end
        table.sort(zw_xy_t,function(a,b) return a.x < b.x end )
        for index, value in ipairs(zw_xy_t) do
            if value.x <(h/2) then
                randomClick(value.x+80,value.y)
            else
                randomClick(value.x-80,value.y)
            end
            waitStop()
            local zw_xy_t2 = fmcAllByTableInRect(NPC["贼王"], {sim = 85, main = 0x202020,list = 0x202020, miss =20})
            table.sort(zw_xy_t2,function(a,b) return a.x < b.x end )
            randomClick(zw_xy_t2[index].x + 10, zw_xy_t2[index].y-20, 5)
            if mColor(view['对话']['贼王'], 95) then
                TClick(point['对话选项2'])
                return true
            end
        end
        return false
    end
end

function touch_zw(map)
    local zw_coords_t = {}
    local cx,cy = getCurrentCoords()
    local scx,scy = coords2ScreenXY(map, cx, cy)
    local zw_xy_t = fmcAllByTableInRect(NPC["贼王"], {sim = 85, main = 0x202020,list = 0x202020, miss =20})
    mLog('找到'..#zw_xy_t..'个贼王')
    if #zw_xy_t == 0  then
        return false
    end
    for _, value in ipairs(zw_xy_t) do
        table.insert(zw_coords_t,{x=(value.x-scx+20)/40+ cx , y = cy-(value.y-scy)/40})
    end
    for _, value in ipairs(zw_coords_t) do
        cx,cy =getCurrentCoords()
        local zw_x,zw_y = value.x, value.y
        mLog('贼王准确坐标:'..zw_x..','..zw_y)
        if math.sqrt((cx-zw_x)^2+ (cy-zw_y)^2) > 10 then
            if cx <zw_x then
                tapScreen2Coords(zw_x-3, zw_y, map)
            else
                tapScreen2Coords(zw_x+4, zw_y, map)
            end
            waitStop()
        end
        cx,cy =getCurrentCoords()
        sx,sy = coords2ScreenXY(map, cx,cy)
        waitStop()
        randomClick(sx+(zw_x-cx)*40+10, sy-(zw_y-cy)*40-30,10)
        if mColor(view['对话']['贼王'], 95) then
            TClick(point['对话选项2'])
            return true
        else
            allClose()
        end
    end
    return false
end



function fight_ZW()
    local x1,y1,x2,y2 = 0,0,0,0
    mSleep(2000)
    for _, value in ipairs(rect["贼王召唤怪"]) do
        x1,y1,x2,y2 = table.unpack(value )
        local zhx, _ = findColorInRegionFuzzy(0x509fcf,90,x1,y1,x2,y2)
        if zhx ~=-1 then
            break
        end
    end
    local f = 0
    while true do
        f = checkFight()
        if f == 1 then
            zhx, _ = findColorInRegionFuzzy(0x509fcf,90,x1,y1,x2,y2)
            if zhx ~= -1 then
                if ZWRW ~= '普攻' then
                    TClick(point[ZWRW])
                end
                TClick({x1,y1,x2,y2})
                if PET ~= '普攻' then
                    TClick(point['宠物法术'])
                    TClick(point['法术技能1'])
                end
                TClick({x1,y1,x2,y2})
                randomClick(551,772,30)
                mSleep(10000)
            else
                mLog('召唤怪死了,点自动')
                break
            end
        elseif f == 2 then
            if PET ~= '普攻' then
                TClick(point['宠物法术'])
                TClick(point['法术技能1'])
            end
            TClick({x1,y1,x2,y2})
            randomClick(551,772,30)
        elseif f == 3 then
            mSleep(1500)
        elseif f == 4 then
            TClick({x1,y1,x2,y2})
            randomClick(551,772,30)
        else
            break
        end
    end
    --1人物战斗选择   2宠物战斗选择  3 战斗中  4 技能目标选择  5 战斗结束无对话 6 战斗结束有对话 战斗结束
    TClick(point['自动战斗'])
    mSleep(5000)
    repeat
        mSleep(1000)
        f = checkFight()
    until f == 5 or f == 6
    local qx,qy = fmcByTableInRect(view['取消自动战斗'], FULLSCREEN, 95)
    randomClick(qx, qy, 8)
end

function qiangdao(m,x,y)
    local bool = go_map(m,x,y,{hide_exit=1,deviation=10})
    if bool == false then
        mLog('坐标识别错误或地图数据错误')
        local m,x,y = getQdMapCoordsNameByDetail()
        go_map(m,x,y,{hide_exit=1,deviation=10})
    end
    mSleep(500)
    local cx,cy = getCurrentCoords()
    local scx,scy = coords2ScreenXY(m, cx, cy)
    local tx = scx + (x-cx)*40
    local ty = scy -(y-cy)*40
    if ty > 940 then
        mColorTap(view['底部按钮'], point['底部按钮开关'])
    end
    click(tx,ty)
    local xzx,xzy =  fmcByTableInRect(view["NPC选择"],FULLSCREEN,90,0x202020,0x202020,0)
    if xzx ~= -1 then
        mLog('NPC选择')
       local x, y = tsFindText(NPCDict, "盗", xzx,xzy,xzx+300,w, "F3F9FC , 352F2C", 90)
       if x~= -1  then
           click(x, y)
       end
    end

    if mColor(view['对话']['强盗']) then
        TClick(point['对话选项2'])
    else
        mLog('强盗坐标识别错误  重新识别')
        m,x,y = getQdMapCoordsNameByDetail()
        qiangdao(m, x, y)
    end
    mSleep(1500)
    if mColor(view['战斗时间']) and mColor(view['人物战斗选择']) == false then
        mLog('战斗四小人验证')
        choose_facade()
    end
    local f = nil
    repeat
        --1人物战斗选择   2宠物战斗选择  3 战斗中  4 技能目标选择  5 战斗结束无对话 6 战斗结束有对话 战斗结束
        f = checkFight()
        if f == 1 then
            if QDRW ~= '普攻' then
                TClick(point[QDRW])
            end
            TClick(point['普攻'])
            if PET ~= '普攻' then
                TClick(point['宠物法术'])
                mLog('宠物普攻')
                TClick(point[QDRW])
            end
            TClick(point['普攻'])
        elseif f == 2 then  
            if PET ~= '普攻' then
                TClick(point['宠物法术'])
                mLog('宠物普攻')
                TClick(point[QDRW])
            end
            TClick(point['普攻'])
        elseif f == 3 then
            mSleep(500)
        elseif f == 4 then
            TClick(point['普攻'])
        end
    until  f== 5 or f == 6
    if f==6  then
        mLog('有贼王')
        checkRole()
        checkPet()
        zeiwang()
    end
end

function checkRole()
    allClose()
    mSleep(500)
    local rbp,rmp={0,0},{0,0}
    if RoleBlood == '75%' then
        rbp = point['人物血量点'][3]
    elseif  RoleBlood == '50%' then
        rbp = point['人物血量点'][2]
    elseif  RoleBlood == '25%' then
        rbp = point['人物血量点'][1]
    end

    if RoleMana == '75%' then
        rmp = point['人物魔法点'][3]
    elseif  RoleMana == '50%' then
        rmp = point['人物魔法点'][2]
    elseif  RoleMana == '25%' then
        rmp = point['人物魔法点'][1]
    end
    if isColor(rbp[1],rbp[2],0x610a03) and RoleBlood ~= 'NO' then  --血量  
        if HealMethod == '酒店' then
            mLog('血量不足去酒店')
            healByInn()
            return
        else
            addBlood()
        end
    elseif isColor(rmp[1],rmp[2],0xa3afc4) and rbl~= 1  then  -- 魔法量
        if HealMethod == '酒店' then
            mLog('魔法不足去酒店')
            healByInn()
            return
        else
            addMana()
        end
      
    end
end

function checkPet()
    allClose()
    local zc1 = mColor(view['忠诚度良好'],98)
    local zc2 = mColor(view['忠诚度良好'],98)
    local zc3 = mColor(view['忠诚度良好'],98)
    local pbp,pmp = {0,0},{0,0}
    if PetBlood == '75%' then
        pbp = point['宠物血量点'][3]
    elseif PetBlood == '50%' then
        pbp =  point['宠物血量点'][2]
    elseif  PetBlood == '25%' then
        pbp =  point['宠物血量点'][1]
    end

    if PetMana == '75%' then
        pmp =  point['宠物魔法点'][3]
    elseif  PetBlood == '50%' then
        pmp =  point['宠物魔法点'][2]
    elseif  PetBlood == '25%' then
        pmp =  point['宠物魔法点'][1]
    end

    if zc1 == false or zc2 == false or zc3 == false then   --忠诚度
        mLog('忠诚度不足')
        healPet()
        return
    elseif isColor(pbp[1],pbp[2],0x610a03) and PetBlood~= 'NO' then  --血量
        mLog('宠物血量不足')
        healPet()
        return
    elseif isColor(pmp[1],pmp[2],0xa3afc4 ) and PetMana~= 'NO' then  -- 魔法量
        mLog('宠物魔法不足')
        healPet()
        return
    end
end


function sell_bt()
    getBaotu()
    go_map('长安城', BTX, BTY)
    local isbt =  use_Skill(skill["摆摊"])
    if not isbt then
        mLog('请将摆摊按钮放到法术栏')
        lua_exit()
    end
    mColorTap(view['摆摊选择'], point["普通摆摊"])
    mColorTap(view['摆摊遮挡提示'],point['对话选项2'])
    mSleep(500)
    local x,y = fmcByTableInRect(baotu, rect["摆摊物品"])
    if x==-1 then
        return false
    end
    randomClick(x, y, 10)
    TClick(point['价格输入'])
    inputNumber(BTPrice, num_keyboard_type["摆摊价格"])
    TClick(point['上架'])
    repeat
        x,y = fmcByTableInRect(baotu, rect["摆摊物品"])
        if x ~=-1  then
            randomClick(x, y, 10)
            TClick(point['上架'])
            mSleep(500)
        end
    until x == -1
    TClick(point['摆摊-行囊'])
    repeat
        x,y = fmcByTableInRect(baotu, rect["摆摊物品"])
        if x ~=-1  then
            randomClick(x, y, 10)
            TClick(point['上架'])
        end
    until x == -1
end

function getBaotu()

end