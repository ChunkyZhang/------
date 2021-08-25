SCREEN_WIDTH_DEV,SCREEN_HEIGTH_DEV = 640,1136--#开发分辨率
SCREEN_WIDTH,SCREEN_HEIGTH = getScreenSize()  --当前分辨率
FULLSCREEN = {0,0,SCREEN_HEIGTH_DEV,SCREEN_WIDTH_DEV}
SCALE =  not (SCREEN_WIDTH_DEV == SCREEN_WIDTH and SCREEN_HEIGTH_DEV == SCREEN_HEIGTH)
BOX_SIDE = 81
DEPOT_Reference = {120,180}
DEPOT_BAG_Reference = {555,180}
BAG_Reference ={528,152}
PP = 25 --每个坐标占像素个数
scale_x = 1
scale_y = 1
if SCALE then
	scale_x = SCREEN_HEIGTH/SCREEN_HEIGTH_DEV
 	scale_y = SCREEN_WIDTH/SCREEN_WIDTH_DEV
end
if 		SCREEN_HEIGTH == 1136 and SCREEN_WIDTH ==640 then
	PP = 25
elseif  SCREEN_HEIGTH == 1334 and SCREEN_WIDTH ==750 then
	PP = 30
elseif  SCREEN_HEIGTH == 1920 and SCREEN_WIDTH ==1080 then
	pp = 40
else
	dilog("暂不支持此分辨率",3)
	lua_exit()
end

DEBUG = 1    --nLog
FILELOG = 8  --wLog
SHOW = 2	--浮动窗口
SWITCH = bit32.bxor(DEBUG,FILELOG,SHOW)

glSettings({switch ='1100' , x1=math.floor(0.264*SCREEN_HEIGTH) ,y1 =0,x2 =math.floor(0.7*SCREEN_HEIGTH),y2= math.floor(0.07*SCREEN_WIDTH),tsp_switch=true})
APP_ID= 'com.netease.mhxyhtb'
 --仓库 背包 仓库背包  rect
DEPOT,BAG,DEPOT_BAG={},{},{}

--初始化格子rect
for row = 1, 4, 1 do
	for col = 1, 5, 1 do
		local index = (row-1)*5+col
		DEPOT[index]= {
			DEPOT_Reference[1]+col*BOX_SIDE-BOX_SIDE ,
			DEPOT_Reference[2]+row*BOX_SIDE-BOX_SIDE,
			DEPOT_Reference[1]+col*BOX_SIDE,
			DEPOT_Reference[2]+row*BOX_SIDE
		}
		BAG[index] = {
			BAG_Reference[1]+col*BOX_SIDE-BOX_SIDE ,
			BAG_Reference[2]+row*BOX_SIDE-BOX_SIDE,
			BAG_Reference[1]+col*BOX_SIDE,
			BAG_Reference[2]+row*BOX_SIDE
		}
		DEPOT_BAG[index] = {
			DEPOT_BAG_Reference[1]+col*BOX_SIDE-BOX_SIDE ,
			DEPOT_BAG_Reference[2]+row*BOX_SIDE-BOX_SIDE,
			DEPOT_BAG_Reference[1]+col*BOX_SIDE,
			DEPOT_BAG_Reference[2]+row*BOX_SIDE
		}
	end
end

SheYaoXiangTime = 0