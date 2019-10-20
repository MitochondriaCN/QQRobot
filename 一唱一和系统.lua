--一唱一和系统.lua
--by 线粒体Mitochondria,GitHub:MitochondriaCN
--最后编辑于2019-10-4
--开源许可

 require "cn.qssq666.robot.sdk"

--这是一个非常"AI"的系统。——线粒体Mitochondria

function onReceiveMsgIsNeedIntercept(msgitem, aiteList, hasAite, hasAiteMe)

	 local text = msgitem:getMessage()
	 local qq = msgitem:getSenderuin()

--请问……
if(not(string.find(text,"请问")==nil)) then
msgitem:setMessage([[上面这个问题哪位大佬能解答?]])
api:sendMsg(msgitem)
return true
end

--迎合
if(not(string.find(text,"成了")==nil) or (text=="好了")
  or not(string.find(text,"成功了")==nil) or (text=="机器人，迎合"))
  then

msgitem:setMessage("牛逼，牛逼")
api:sendMsg(msgitem)
return true      
end

--迎合Q群管家
if(not(string.find(text,"进群请遵循公告")==nil)) then
msgitem:setMessage("我再补充两句，我会识别广告，任何在群里发广告的被我发现"..
               "直接向群主报告，你就等着群主处理你吧。")
api:sendMsg(msgitem)
return true
end

--同情并告诫
if(not(string.find(text,"不能开机了")==nil) or not(string.find(text,"开不了机")==nil)
  or not(string.find(text,"开不开机")==nil) or not(string.find(text,"变砖了")==nil)
  or not(string.find(text,"成砖了")==nil) or not(string.find(text,"砖了")==nil)
  or not(string.find(text,"完蛋")==nil) or (text=="机器人，同情")) then
msgitem:setMessage([[我对你的遭遇表示非常同情，在此提醒各位朋友：
刷机千万步 双清第一步
刷机不规范 机主两行泪]])
api:sendMsg(msgitem)
return true
end

--机器人，咋整
if(not(string.find(text,"机器人")==nil) and not(string.find(text,"咋办")==nil)) then
msgitem:setMessage("我认为这个时候，你先不要慌，你先冷静一下，想一想自己"..
"是不是哪一步做错了，是不是该干的没干，如果都没问题，你就打开百度，你搜它一搜，"..
"一般都能搜到答案，如果搜不到，你再到群里问。")
api:sendMsg(msgitem)
return true
end

	 return false

end