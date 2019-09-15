--自动回复基础.lua
--by 线粒体Mitochondria,Github:MitochondriaCN
--最后编辑：2019-9-15 9:10
--开源许可 Open Source



require "cn.qssq666.robot.sdk"

print("本方法需要点击[模拟]方可调试...否则只能检查常规语法错误");

--全局变量声明
controller=nil
--全局变量声明
function onReceiveMsgIsNeedIntercept(msgitem, aiteList, hasAite, hasAiteMe)

local text = msgitem: getMessage()

local qq = msgitem: getSenderuin()

--rec
if (text == "?rec")
then
msgitem: setMessage([[
🔴如何刷入Recovery

一、 使用高通9008端口刷入(仅限高通机器)
二、 root后使用adb直接刷入(需root)
============
如何找适合自己机型的recovery镜像

群内提供了R7系列大多数机型的Recovery镜像， 直接下载刷入即可。
群里没有提供的镜像， 可到百度等搜索引擎搜索下载。
============
相关链接
■如何使用adb(dd)刷入rec： jingyan.baidu.com/article/00a07f38a8aa5382d028dcb5.html
■TWRP下载：twrp.me/Devices
更多请参考【?教程】
        ]]
        )
api: sendMsg(msgitem)
return true
end

--菜单
if (text == "?菜单")
then
msgitem:setMessage([[
🔴机器人菜单
直接输入问号后面的即可使用，无需艾特机器人，如“?rec”

❗■?提问 进群必读，提问的艺术
■?rec Recovery相关教程
■点歌 可以点歌，后面加歌名
■?教程 查看玩机教程以及本群最新研究成果
■?rom 查看群网盘资源
■?找管理 艾特所有管理帮你解答问题
===============
机器人完善中，如有问题请联系@982567394
机器人征集新功能建议，请将你希望增加的新功能艾特982567394后反馈
中秋更新:
1.细节优化
2.新增艾特提示功能
]]
)
api:sendMsg(msgitem)
return true
end

--教程
if(text=="?教程") then
msgitem:setMessage([[
🔴教程

■本群最新成果
nihilo大佬的R7sm刷安卓9教程(酷安网)
https://www.coolapk.com/feed/13687154?shareKey=YTY3Yjc1YmQ2YzNiNWQ3Nzg2YTE~&shareUid=2887850&shareFrom=com.coolapk.market_9.5
================
救砖（高通9008刷机）
■R7Plusm救砖:https://m.zol.com.cn/sjbbs/d1673_23857.html
■R7sPlus救砖:https://g.pconline.com.cn/bbs/topic-53445040-1.html
■R7sm救砖:https://m.zol.com.cn/sjbbs/d1673_22467.html
■群内救砖教程:https://docs.qq.com/doc/DVURhSmlzbWlRcHJV?tdsourcetag=s_qq_aiomsg
================
TWRP操作说明
■百度版:https://wk.baidu.com/view/3ed75a84f705cc1755270984?pcf=2
■群内版:https://docs.qq.com/doc/DVWtEQXJ1bkFxZ1dZ
================
■A33、A53、R7sm解锁Bootloader并刷入TWRP
https://docs.qq.com/doc/DVURhSmlzbWlRcHJV?tdsourcetag=s_qq_aiomsg
]])
api:sendMsg(msgitem)
return true
end

--资源
if (text=="?rom")
then
    
msgitem:setMessage([[
🔴资源

■群网盘（不定期更新链接）
请在百度网盘搜索账号 LihictijfCIXjd 添加，并说明你的目的。
==============
■R7t
url88.cn/byT69D
==============
其他资源
■国外ROM合集：romshared.com/#13
■官方各种ROM下载：2.shuajibbs.com:8083
]])

api:sendMsg(msgitem)

return true
end

--违禁
if ((not(string.find(text,"vpn")==nil)) or (not(string.find(text,"VPN")==nil)) or
	 (not(string.find(text,"妈")==nil)) or (not(string.find(text,"狗管理")==nil))
  or (not(string.find(text,"狗群主")==nil)))
then
msgitem:setMessage([[
刚才发了一句:

]].."“"..text.."”"..
[[


请注意你的言辞。
]])
controller:sendAtMsg(msgitem,"949785474",msgitem:getFrienduin())
return true
end

--找管理
if(text=="?找管理")
then
msgitem:setMessage([[
🔴找管理
（本功能正在实验，若影响到各位管理请反馈给@982567394，我会关闭此功能）

@博 @背井离乡去山西 @管理（普普通通的管理） @KarSLR @nihilo @筱皂(处理大部分事) @线粒体（机器人管理）
有人求助你们！
]])
api:sendMsg(msgitem)
return true
end

--提问
if(text=="?提问")
then
msgitem:setMessage([[
🔴提问的艺术（必读）
https://docs.qq.com/doc/DRFBobkVtZ3lxeHJy?disableReturnList=1&_from=1
]])   
api:sendMsg(msgitem) 
return true
end

--测试
if(text=="?测试")
then
msgitem:setMessage("啊")
controller:sendAtMsg(msgitem,"949785474","982567394")
return true
end

--不许艾特我
if(hasAite)
then
controller:sendPicMsg(msgitem,"949785474","982567394","/storage/emulated/0/noat.jpg")
end

return false
end

function onReceiveControlApi(instance)
    controller=instance
end
