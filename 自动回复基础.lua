--自动回复基础.lua
--by 线粒体Mitochondria,Github:MitochondriaCN
--最后编辑：2019-10-26，编辑者:MitochondriaCN
--开源许可

--开发者们请注意：多写注释！多写注释！多写注释！


require "cn.qssq666.robot.sdk"

print("本方法需要点击[模拟]方可调试...否则只能检查常规语法错误");--机器人生成的代码，不用管

--全局变量声明
controller=nil --有许多功能的对象，别改！别改！别改！
--全局变量声明


--群里有一条新消息就回调一次
--msgitem - 消息体
--aiteList - 艾特名单
--hasAite - 有没有艾特机器人
--hasAiteMe - 和hasAite功能类似，不知道有什么用
function onReceiveMsgIsNeedIntercept(msgitem, aiteList, hasAite, hasAiteMe)

local text = msgitem: getMessage()--消息的内容
local qq = msgitem: getSenderuin()--发消息的人的QQ号

--rec
if (text == "?rec" or text=="？rec")
then
msgitem: setMessage([[
🔴Recovery

■基本概念
https://baike.baidu.com/item/Recovery/9995978?fr=aladdin&ivk_sa=1022817p

■如何刷入
https://www.cnblogs.com/lirenjun/p/4581915.html
]]
        )--先设置要发送的消息
api: sendMsg(msgitem)--再发送到群里
return true --说明这条消息已被插件处理，机器人自带的那点破处理功能就不用管了（狗头）
end

--菜单
if (text == "?菜单" or text=="？菜单")
then
msgitem:setMessage([[
🔴机器人菜单
直接输入问号及后面的即可使用，无需艾特机器人，如“?教程”，请注意有些不需要问号

■?提问 进群必读，提问的艺术
■点歌 可以点歌，后面加歌名
■?教程 查看玩机教程以及本群最新研究成果
■?找管理 艾特所有管理帮你解答问题
■翻译 后面跟要翻译的文字，仅汉英
■字转图 后面跟要转成图片的文字
■?网站 查看常用网站
■?资源 获取常用资源下载地址
■搜 可以搜图片，后面跟关键字，若关键字后面加空格再加数字可搜索第“数字”张图片]]
)
api:sendMsg(msgitem)
return true
end

--教程
if(text=="?教程" or text=="？教程") then
msgitem:setMessage([[
🔴教程
请直接输入问号及后面的文字，无需艾特。

■Recovery相关——?rec 和 ?twrp
■救砖——?救砖
■Bootloader相关——?bl

■刷机一般流程图
https://www.edrawsoft.cn/viewer/public/s/a33c0235855077?v1572095825343]])
api:sendMsg(msgitem)
return true
end

--Twrp使用手册
if(text=="?twrp" or text=="？twrp") then
msgitem:setMessage([[🔴TWRP

■官网下载
twrp.me/Devices

■操作手册
https://docs.qq.com/doc/DVWtEQXJ1bkFxZ1dZ]])
api:sendMsg(msgitem)
end

--资源
if (text=="?资源" or text=="？资源")
then
    
msgitem:setMessage([[🔴资源

■群网盘（不定期更新链接）
请在百度网盘搜索账号 LihictijfCIXjd 添加，并说明你的目的。

■R7t
url88.cn/byT69D

■Twrp Recovery
官网：twrp.me/Devices

■其他资源
国外ROM合集：romshared.com/#13
官方各种ROM下载：2.shuajibbs.com:8083]])

api:sendMsg(msgitem)

return true
end

--违禁
if ((not(string.find(text,"vpn")==nil)) or (not(string.find(text,"VPN")==nil)) or
	 (not(string.find(text,"妈")==nil)) or (not(string.find(text,"狗管理")==nil))
  or (not(string.find(text,"狗群主")==nil)) or (not(string.find(text,"艹")==nil))
  or (not(string.find(text,"tm")==nil)) or (not(string.find(text,"woc")==nil))
  or (not(string.find(text,"卧槽")==nil)) or (not(string.find(text,"傻逼")==nil))) --初学lua，不会遍历……凑合用吧
then
msgitem:setMessage([[
 刚才发了一句:

]].."“"..text.."”"..
[[


请注意你的言辞。]])
controller:sendAtMsg(msgitem,"949785474",msgitem:getFrienduin()) --发送带艾特的消息
		--controller:sendAtMsg(消息体,往哪个群里发(string),艾特谁的QQ号(string))
return true
end

--找管理
if(text=="?找管理" or text=="？找管理")
then
msgitem:setMessage([[
🔴找管理
（本功能正在实验，若影响到各位管理请反馈给@982567394，我会关闭此功能）

@博 @背井离乡去山西 @管理（普普通通的管理） @KarSLR @nihilo @筱皂(处理大部分事) @线粒体（机器人管理）
有人求助你们！
]]) --这里面的艾特可能本人收不到，所以本质上只是一段看起来像艾特的消息（狗头）
api:sendMsg(msgitem)
return true
end

--提问
if(text=="?提问" or text=="？提问")
then
msgitem:setMessage([[
🔴提问的艺术（必读）
https://docs.qq.com/doc/DRFBobkVtZ3lxeHJy?disableReturnList=1&_from=1
]])   
api:sendMsg(msgitem) 
return true
end

--测试
--没事别瞎用，会艾特我！by 线粒体Mitochondria
if(text=="?测试")
then
msgitem:setMessage("啊")
controller:sendAtMsg(msgitem,"949785474","982567394")
return true
end

--反艾特
if(hasAiteMe) --如果艾特了机器人
then
controller:sendPicMsg(msgitem,"949785474","982567394","/storage/emulated/0/noat.jpg") --发一张不许艾特的图
return true
end

--常用网站
if (text=="?网站" or text=="？网站")
then
msgitem:setMessage(
[[🔴常用网站

■酷安:www.coolapk.com
■MIUI论坛:www.miui.com/forum.php
■LineageOS:www.lineageos.org
■GitHub:github.com
■TWRP:twrp.me/Devices
■XDA论坛:forum.xda-developers.com]])
api:sendMsg(msgitem)
return true
end

--救砖
if(text=="?救砖" or text=="？救砖") then
msgitem:setMessage(
[[🔴救砖相关

请自行到群文件、群网盘下载符合您机型的线刷包。在线刷包中会带有相应的刷机工具及使用教程，请按照教程使用。]])
api:sendMsg(msgitem)
return true
end

--Bootloader
if (text=="?bl" or text=="？bl") then
msgitem:setMessage(
[[🔴Bootloader

■什么是Bootloader？
https://www.jianshu.com/p/75039ea24937

■R7sm、A53(m)、A33(m)解锁Bootloader
http://url.cn/5pwRsie]])
api:sendMsg(msgitem)
return true
end

return false --如果这条消息没有满足上面任何一个if，也就是不属于插件的处理范围，就交给机器人自带功能去处理
end

--插件一启动就回调一次
--instance - 有许多功能，需要时可回调，踢人什么的
function onReceiveControlApi(instance)
    controller=instance
end
