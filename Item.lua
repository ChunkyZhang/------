local M = {}
M.道具 = {
    ["蓝色合成旗"]={{560,190,0x004ddb},{557,179,0x0040ba},{581,171,0x00369d}},
    ["白色合成旗"]={{559,191,0xe8ecdd},{578,176,0xc98102},{560,178,0xeff5eb}},
    ["黄色合成旗"]={{567,187,0xcd9a00},{558,191,0xf0e30c},{560,178,0xf0eb08}},
    ["绿色合成旗"]={{558,190,0x38e000},{582,171,0x37d300},{558,178,0x38e100}},
    ["红色合成旗"]={{558,190,0xe20e0d},{556,180,0xd91008},{582,178,0xf01010}},
    ["飞行符"]={{564,190,0x7631b3},{574,181,0xdebe6e},{556,204,0x35333e}},
    ["摄妖香"]={{546,188,0xbbbc7f},{561,179,0x35333e},{584,190,0x444433}},
}

M.默认顺序 = {}
M.bgcolor = 0xb8b0d8
M.division = {5,4}
--w,h,x0,y0,order分别表示:x轴间距，y间距，第一个框的x,y的点,检测物品的顺序
function M:new()
	local obj = {}
	obj.w = w or 81
	obj.h = h or 81
	obj.x0 = x0 or 528
	obj.y0 = y0 or 152
    obj.order = order or self.默认顺序
    obj.item = self.道具
    obj.bag = division or self.division
    -- obj.bgcolor = bgcolor or self.bgcolor
	-- 某个单元格的物品判断,i,j是指横向第几个,纵向第几个
	function obj:checkonebag(i,j)
		keepScreen(true)
		for _,itemname in ipairs(self.order) do
            local flag = true
			for _,point in ipairs(self.item[itemname]) do
                local x1,y1,c = table.unpack(point)
				local x = x1 + self.w * (i-1) + self.x0
                local y = y1 + self.h * (j-1) + self.y0
                if c == 0xb8b0d8 then --背景色
                    if isColor(x,y,c) then
                        flag = false
                        break
                    end
                else
                    if not isColor(x,y,c) then
                        flag = false
                        break
                    end
                end
            end
            if flag then
				keepScreen(false)
                return itemname
            end
        end
		keepScreen(false)
        return false
    end
    -- 返回所有单元格的物品,未知则为false
    function obj:checkallbag()
		local imax,jmax = table.unpack(self.bag)
        local r = {}
        for i = 1,imax do
            if not r[i] then
                r[i] = {}
            end
            for j = 1,jmax do
                r[i][j] = self:checkonebag(i,j)
            end
        end
        return r
    end
    return obj
end
return M