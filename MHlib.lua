
function allClose()
    local mainwindow = {{1083,604,0xa6c8d8},{23,611,0x6ca2a9},{24,138,0x98c0d0},{194,55,0x284850}}
    local close1 ={{925,78,0x183850},{934,68,0x183c51},{933,85,0x183650},{915,87,0x18334e},{926,95,0x286093},{924,110,0x182428}}
    local close2 = {{1107,473,0xa0c0c8},{1115,466,0xa0c0c8},{1092,473,0x304850},{1071,464,0x182c38},{1125,491,0x182c38}}
    local close3 = {{796,75,0x440e2c},{796,87,0x702850},{805,125,0x381430},{784,74,0x702950},{788,67,0x481435}}
    local 隐藏活动 = {{467,131,0xb0d5e0},{466,148,0x78a4b0},{460,140,0x8ebbc8},{468,140,0x8ebbc8}}
    local 隐藏公屏 = {{313,459,0x778686},{36,402,0x285060},{30,412,0x95e0f0}}
    if matchColors(mainwindow,90) then
        return true
    else
        for i = 1, 30, 1 do
            findColors_Tap(close1,{rect = {SCREEN_HEIGTH_DEV/2,0,SCREEN_HEIGTH_DEV,SCREEN_WIDTH_DEV/2}})
            findColors_Tap(close2,{rect = {SCREEN_HEIGTH_DEV*0.8,0,SCREEN_HEIGTH_DEV,SCREEN_WIDTH_DEV}})
            findColors_Tap(close3,{rect = {SCREEN_HEIGTH_DEV/2,0,SCREEN_HEIGTH_DEV,SCREEN_WIDTH_DEV/2}})
            findColors_Tap(隐藏活动,{rect = {286,101,784,170}})
            matchColorsTap(隐藏公屏)
            if matchColors(mainwindow,90) then
               return true
            end
        end
    end
    return false
end


function openBox()
   local boxOpened = {{815,558,0x70142b},{777,558,0x182428},{486,157,0xb8b4e0},{1002,206,0x182428}}
   if matchColors(boxOpened) then
       return true
   end
   allClose()
   local folded ={{1097,604,0xa7cbd8},{1082,590,0xcde6ed},{1069,604,0xa7cfd8},{1083,617,0x80b0c1}} -- 按钮未展开
   matchColorsTap(folded)
   TClick({986,588,1021,618})
end

function logout(str)
    nLog(str)
    lua_exit()
end

function healByInn()
    find_NPC(NPCInfo["酒楼老板"])
end


---战斗检查
---@return string @人物选择 | 宠物选择 | 战斗中 | 战斗验证
function checkFight()
    local battlePage = {
        人物选择 = {{48,158,0x88a8b4},{218,30,0x88a8b0},{1098,158,0xf0e499},{1109,230,0x209bc0}},
        宠物选择 = {{48,158,0x88a8b4},{218,30,0x88a8b0},{1106,445,0x279bc6},{824,610,0x2858b0}},
        战斗中  = {{1098,609,0x781820},{48,159,0x86a7b0},{219,31,0x84a4b0}}
    }

    local 战斗验证 = {{325,133,0xf5f5f5},{379,133,0xfafafa},{431,132,0xfc0506},{441,132,0xfd0101},{495,133,0xf80202},{559,139,0xf3f3f3}}
    if hasView(战斗验证,{rect = {208,67,938,341}}) then
       return "战斗验证" 
    end
    local 战斗界面 = {{48,158,0x88a8b4},{218,30,0x88a8b0}}
    if matchColors(战斗界面) then
        return "战斗结束"
    end

    for key, value in pairs(battlePage) do
        if matchColors(value) then
            return key
        end 
    end
end

---根据坐标返回背包索引
---@param x number
---@param y number
---@param which table |"BAG" |"DEPOT"|"DEPOT_BAG"
---@return number
function getIndexByPoint(x,y,which)
    local sideWith = BOX_SIDE
    local x1 = which[1][1]
    local y1 = which[1][2]
    if SCALE then
        sideWith = sideWith *scale_y
        x1 = x1*scale_x
        y1 = y1*scale_y
    end
    return  math.ceil((x-x1)/sideWith + math.floor((y-y1)/sideWith)*5)
end

---使用快捷栏技能
---@param skill_name any
---@return boolean
function useFastSkill(skill_name)

end



---多NPC选择
---@param name string NPC名字
---@param dict number 字库序号
---@param rect table 范围
---@param detColor string 色差
---@param sim number 相似度
function chooseNPC(name,rect,dict,detColor,sim)
    local rect = rect or FULLSCREEN
    local detColor = detColor or 'F2F5F7,1B1917'

end

---移动道具到背包
---@param thing table
---@return boolean
function moveItemToFront(thing)
    openBox('行囊')


end
---移动道具到行囊
---@param thing table
---@return boolean
function moveItemToBack(thing)
    openBox()

end

---移动物品到行囊
---@param except table 除什么之外
---@return boolean
function moveAllToBack(except)
    openBox()
    local _,things = getBlankIndex(BAG_Reference)
    mLog('背包有'..#things..'件道具')
end

---输入数字
---@param num string|number
function inputNumber(num)
    if type(num)=="number" then
        num = tostring(num)
    end
    local delete = {{551,205,0xdfdfe0},{570,192,0xdfdfe0},{542,197,0xdfdfe0},{534,197,0x304448},{587,201,0x304448},{550,190,0xdfdfe0},{555,188,0x304850}}
    local x,y = findColors(delete)
    local padding = 90*scale_y
    local num_1_x = x- 3*padding
    local num_1_y =y
    randomClick(x,y,30)
    for i = 1, #num, 1 do
        local n = tonumber(string.sub(num,i,i))
        if n == 0 then
            randomClick(num_1_x +3*padding, num_1_y+padding, 30)
        else
            randomClick(num_1_x + (n-1)%3*padding,  num_1_y+ math.ceil((n/3)-1)*padding, 30)
        end
    end
    randomClick(num_1_x+3*padding, num_1_y+2*padding,30)
end

---小任务widget开关
---@param switch string @|on|off
function missionBoard(switch)
    allClose()
    if     switch=="on"  then
        matchColorsTap({{1122,186,0x90bcc8},{1123,180,0xa8ccd8},{1123,192,0x7facb7}})
    elseif switch=="off" then 
        matchColorsTap({{918,231,0x90bbc8},{919,238,0x7ca9b8}})
    end
end


---使用背包道具,找到返回true 找不到返回false
---@param thing any
---@return boolean
function use(thing)
    openBox()

end

---获取空白格索引
---@param reference table 仓库或者背包|DEPOT_Reference|DEPOT_BAG_Reference|BAG_Reference
---@return table 空白列表
---@return table 有道具列表
function getBlankIndex(reference)
    local blank = {}
    local unblank = {}
    keepScreen(true)
        for r = 1, 4, 1 do
            for c = 1, 5, 1 do
                local x1 = (c-1)*BOX_SIDE+reference[1]+20
                local x2 = c*BOX_SIDE+reference[1]-20
                local y = math.floor((reference[2]+(r-0.5)*BOX_SIDE) +0.5)
                local flag = true
                for i = x1,x2, 2 do
                    if not iscolor(i,y,0xb8b0d8) then
                        flag = false
                        table.insert(unblank,(r-1)*5+c)
                        break
                    end
                end
                if flag then
                    table.insert(blank,(r-1)*5+c)
                end
            end
        end
    keepScreen(false)
    return blank,unblank
end

---获取当前仓库序号和最大序号
---@return number 当前序号
---@return number 最大序号
function getDepotIndex()
	local str =   tesseractOcr({198,540,275,574},0,'0123456789/'):gsub("%s+", "")
    local tmp = str:split("/")
    return tonumber(tmp[1]),tonumber(tmp[2])
end

---选择仓库页
---@param index number
---@return boolean
function chooseDepotPage(index)
    local row = 0
    local _,maxi = getDepotIndex()
    if index>maxi then
        return false
    end
    if maxi == 25 then
        row = 5
    else
        row = math.ceil((maxi+1)/5)
    end
    local x = ((index-1)%5)*82 + 143
    local y = 498- (row-(math.floor((index-1)/5))) *82
    TClick( {198,540,275,574})
    TClick({x,y,x+70,y+70})
    local ci = getDepotIndex()
    if ci == index then
        return true
    end
end