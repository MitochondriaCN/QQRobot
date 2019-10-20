--反广告.lua
--by 线粒体Mitochondria,GitHub:MitochondriaCN
--2019-10-14
--开源许可

 require "cn.qssq666.robot.sdk"

function onReceiveMsgIsNeedIntercept(msgitem, aiteList, hasAite, hasAiteMe)

  local text = msgitem:getMessage()
  local qq = msgitem:getSenderuin()
  nickname=msgitem:getNickname()
  
  if(not(string.find(text,"加群")==nil) or not(string.find(text,"加我")==nil)) then
      atManagers(msgitem)
      return true
  end
  return false
end

function atManagers(item)
    item:setMessage(" 请处理广告。")
    --要艾特的人的昵称设置好，再调用函数方可
    item:setNickname("wudilsr")
      api:sendAtMsg(item,949785474,3403691590)
    item:setNickname("博（暂时停止管事）")
      api:sendAtMsg(item,949785474,2970894475)
    item:setNickname("线粒体（常驻）")
      api:sendAtMsg(item,949785474,982567394)
      return
end