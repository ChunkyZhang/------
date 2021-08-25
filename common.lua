---转table为字符串
---@param tbl table
---@return string
function tableToString(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        else
            result =  result.."["..k.."]".."="
        end
        -- Check the value type
        if type(v) == "table" then
            result = result..tableToString(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
		elseif  type(v) == "string" then
            result = result.."\""..v.."\""
		elseif type(v) == "number" then
			result = result..v
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "{" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

---单击
---@param x number or table
---@param y number
---@vararg  ... number
function click(x, y,delay)
    local delay = delay or math.random(500, 800)
    tap(x , y ,normalRandom(70,100), 'click_point.png')
    mSleep(delay)
end

---comment
---@param x number
---@param y number
---@param r number
function longTap(x,y,r)
    local r = r or 5
    tap(x+math.random(-r, r),y+math.random(-r, r),math.random(1500, 2000),'click_point.png')
end

---偏移点击
---@param x number
---@param y number
---@param r number 默认10
function randomClick(x, y, r,delay)
    local delay = delay or math.random(200, 600)
    local r = r or 10
    tap(x + math.random(-r, r), y + math.random(-r, r) , normalRandom(70,100), 'click_point.png')
    mSleep(delay)
end

---区域内单击
---@param rect table
---@param delay number
function TClick(rect,delay)
    local x1,y1,x2,y2 ,flag= table.unpack(rect)
    if SCALE then
        if not flag then
            x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
        end
    end
    local x = (x2-x1)*normalRandom(50,70)/100 + x1
    local y = (y2-y1)*normalRandom(50,70)/100 + y1
    click(x,y,delay)
end

---双击
---@param x number
---@param y number
---@param offset number 偏移
---@param delay number 延时 单位毫秒
function doubleClick(x, y,offset,delay)
    local offset = offset or 5
    click(x + math.random(-offset,offset),y + math.random(-offset,offset),normalRandom(70,100))
    click(x + math.random(-offset,offset),y + math.random(-offset,offset),delay)
end

---双击区域内
---@param rect table
---@param delay number
function dTClick(rect,delay)
    TClick(rect,math.random(70,100))
    TClick(rect,delay)
end

--- 表多点找色 返回一个点 
---@param colorTable any
---@param tab table 参数列表  rect = 范围 {x1,y1,x2,y2,flag} ,sim=相似度, orient=找色方向,main =基准点的偏色,list=周围点偏色,max_miss=最大不匹配数
---@return number  x 坐标
---@return number  y 坐标
function findColors(colorTable,tab)
    local tab = tab or {}
    local sim  = tab.sim or 90
    local orient = tab.orient or 0
    local main = tab.main or 0x151515
    local list = tab.list or 0x151515
    local max_miss = tab.max_miss or 0
    local rect = tab.rect or {0,0,SCREEN_HEIGTH,SCREEN_WIDTH}
    local x1,y1,x2,y2 ,flag= table.unpack(rect)
    local str1,str2 = '',''
    if SCALE then
        str1,str2 =  toStringType(scale(colorTable))
        if not flag then
            x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
        end
    else
        str1,str2 = toStringType(colorTable)
    end

    return findMultiColorInRegionFuzzy(str1,str2,sim,x1,y1,x2,y2,{orient = orient , main = main ,list = list ,max_miss = max_miss})
end

---comment
---@param color table 颜色列表
---@param tab table  参数列表  rect = 范围,sim=相似度, orient=找色方向,main =基准点的偏色,list=周围点偏色,max_miss=最大不匹配数
---@param point table 点击的坐标 如果没有则点击找到的坐标
function findColors_Tap(color,tab,point)
    local x, y = findColors(color,tab)
    if x ~=-1 then
        if point then
            TClick(point)
        else
            click(x, y)
        end
    end
end

---缩放颜色列表适应分辨率
---@param colors table
---@return table
function scale(colors)
	local srcPos = {}
	local dstPos = {}
	if type(colors) == "string" then
		srcPos = toTableType(colors)
	elseif type(colors) == "table" then
		srcPos = colors
	end
	for _, v in pairs(srcPos) do
		pot = {}
		local x0, y0, c0 = v[1], v[2], v[3]
		local x1, y1 = x0*scale_x, y0*scale_y
		x1, y1 = math.floor(x1 + 0.5), math.floor(y1 + 0.5)
		pot[1] = x1
		pot[2] = y1
		pot[3] = c0
		table.insert(dstPos, pot)
	end
	return dstPos
end

---多点找色 返回所有点的集合
---@param colorTable table
---@param tab table 参数列表  rect = 范围,sim=相似度, orient=找色方向,main =基准点的偏色,list=周围点偏色,miss=最小误差
---@return table {{x=num1,y= num2}}
function findAllColors(colorTable,tab)
    local tab = tab or {}
    local sim  = tab.sim or 90
    local orient = tab.orient or 0
    local main = tab.main or 0x151515
    local list = tab.list or 0x202020
    local miss = tab.miss or 10
    local str1,str2 = '',''
    local rect = tab.rect or FULLSCREEN
    local x1,y1,x2,y2 = table.unpack(rect)
    if SCALE then
        str1,str2 = toStringType(scale(colorTable))
        x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
        miss = miss * scale_y
    else
        str1,str2 = toStringType(colorTable)
    end
    return findMultiColor(tonumber(str1),str2,sim,x1,y1,x2,y2,{orient = orient , main = main ,list = list,miss = miss})
end

---判断范围内是否有
---@param colorTable table 颜色列表
---@param tab table  
---@return boolean
function hasView(colorTable,tab)
    local x ,_ = findColors(colorTable,tab)
    if x~=-1 then
        return true
    else
        return false
    end
end

---找多组颜色  返回单个坐标及key
---@param multColors any
---@param tab table 参数列表 rect = 范围,sim=相似度, orient=找色方向, main =基准点的偏色, list=周围点偏色, max_miss=最大不匹配数
---@param duration number 持续时常
---@return number x坐标
---@return number y坐标
---@return string  key  找到的key
function findMultColors(multColors,tab,duration)
    local duration = duration or 5
    local begin = os.time()
    while true do
        if os.time()-begin > duration then
            break
        end
        for key, value in pairs(multColors) do
            local x,y =  findColors(value,tab)
            if x~=-1 then
                return x,y,key
            end
        end
    end
    return -1,-1,'' 
end

---点阵字库文字识别
---@param dict any 字典
---@param rect table 范围
---@param color string 偏色 可以多组用#拼接如
---@param sim any 相似度
---@return string 识别结果
function ocrByDict(dict, rect, color, sim)
    local x1,y1,x2,y2 = table.unpack(rect)
    if SCALE then
        x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
    end
    return tsOcrText(dict,x1,y1,x2,y2,color,sim)
end

---tesseract 文字识别
---@param rect table  范围
---@param language number |0 英文| 1中文|
---@param whitelist string 白名单
---@return string
function tesseractOcr(rect,language,whitelist)
    local x1,y1,x2,y2 = table.unpack(rect)
    if SCALE then
        if not flag then
            x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
        end
    end
    return ocrText(x1,y1,x2,y2,language,whitelist)
end

---寻找某字坐标
---@param dict any 字库
---@param word string 目标文字
---@param rect table  范围
---@param color string 偏色
---@param sim number 相似度
---@return number x坐标
---@return number y坐标
function findWord(dict,word,rect,color,sim)
    local x1,y1,x2,y2 = table.unpack(rect)
    if SCALE then
        x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
    end
    return tsFindText(dict,word,x1,y1,x2,y2,color,sim)
end

---滑动
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function slide(x1,y1,x2,y2)
    local x1,y1,x2,y2 = x1+math.random(-5, 5),y1+math.random(-5, 5),x2+math.random(-5, 5),y2+math.random(-5, 5)
    local step = math.random(10, 20)
    local ms =  math.random(70, 100)
    moveTo(x1,y1,x2,y2 ,{step= step,ms = ms,index = 1,stop = 0})
end

---comment
---@param e any
---@param t table
---@return boolean
function isIn(e,t)
    for _, value in ipairs(t) do
        if e == value then
        return  true
        end
    end
    return false
end


---单点比色
---@param x number
---@param y number
---@param c number
---@param sim number
---@return boolean
function iscolor(x,y,c,sim)
    local sim = sim or 90
    if SCALE then
        x = scale_x*x
        y = scale_y*y
    end
    return isColor(x,y,c,sim)
end

---多点比色 找到返回true
---@param colorTable table 颜色列表
---@param sim number 相似度
---@param keepflag boolean  是否保持屏幕
---@return boolean
function matchColors(colorTable,sim,keepflag)
    local sim= sim or 90
    local flag = flag or false
    if SCALE then
        return multiColor(scale(colorTable),sim,flag)
    else
        return multiColor(colorTable,sim,flag)
    end
end


---多点比色 找到返回true
---@param colorTable table 颜色列表
---@param sim number 相似度
---@param points table 点击范围 如果没有默认色表第一个点
---@return boolean
function matchColorsTap(colorTable,sim,points)
    local sim= sim or 90
    if matchColors(colorTable,sim) then
        if points then
            TClick(points)
        else
            randomClick(colorTable[1][1]*scale_y,colorTable[1][2]*scale_y,5)
        end
    end
end

---生成符合正态分布的随机数
---@param mean number 平均值
---@param variance number  方差
---@return number
function normalRandom(mean, variance)
	return  math.sqrt(-2 * variance * math.log(math.random())) * math.cos(2 * math.pi * math.random()) + mean
end

---截图
---@param picname string 文件名 默认 userPath/res目录
---@param rect table
---@param quality number  仅支持iOS范围:0-1
function screenshot(picname,rect,quality)
    local x1,y1,x2,y2 = table.unpack(rect)
    if SCALE then
        x1,y1,x2,y2=  math.floor(x1*scale_x + 0.5), math.floor(y1*scale_y +0.5),  math.floor(x2*scale_x+0.5),  math.floor(y2*scale_y+0.5)
    end
    snapshot(picname,x1,y1,x2,y2,quality)
end

---等待页面出现
---@param waitfuncTable table {a = function ()return a..... end, b = function () return b..... end}
---@param duration number 默认 5秒
---@param errfuc function  错误处理函数
function wait(waitfuncTable,duration,errfuc)
    local duration = duration or 5
    local errfuc = errfuc or logout
    local begin = os.time()
    while true do
        if os.time()-begin > duration then
            local pages = {}
            for page, _ in pairs(waitfuncTable) do
                table.insert(pages,page)
            end
            local errStr = "找不到"..table.concat(pages, "/").."特征"
            errfuc(errStr)
        end
        for key, value in pairs(waitfuncTable) do
            if value() then
                return true,key
            end
        end
        mSleep(500)
    end
end

---输出到电脑控制台
---@param str any
function Log(str)
    nLog(str)
end

---计算两点距离
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function  getDistance(x1,y1,x2,y2)
    return math.floor(math.sqrt(math.abs(x1-x2) ^2+ math.abs(y1-y2)^2)+0.5) 
end


function uploadImage(filename)
    local upload_url = 'http://1.15.188.107:5000/upload_photo'
    local file = io.open(userPath()..'/res/'..filename, 'rb')
    if file then
        imgData = file:read('*a')
        file:close()
    else
        mLog("识别API图片打开失败")
        return
    end
    local data = string.format(
        '----abcdefg\r\nContent-Disposition: form-data; name="photo"; filename=%s\r\nContent-Type: image/jpeg\r\n\r\n%s\r\n----abcdefg--',
        filename,imgData)
    local headers = {
        ['Content-Type'] = 'multipart/form-data; boundary=--abcdefg',
        ['Content-Length'] = #data}
    local response_body = {}
    local _, code =
        http.request {
        url = upload_url,
        method = 'POST',
        headers = headers,
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response_body)
    }
    if code == 200 then
        mLog('上传成功')
    else
        mLog('上传失败')
        return
    end
end
