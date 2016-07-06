-- Made By @Omar_Real

 do

local function pre_process(msg)
    --Checking mute
    local hash = 'mate:'..msg.to.id
    local ali = 'mate:'..msg.to.id
    local oscar = 'mate:'..msg.to.id
    local bot = 'mate:'..msg.to.id
    local oscarteam = 'mate:'..msg.to.id
    local oscarbot = 'mate:'..msg.to.id
    if redis:get(hash) and not is_momod(msg) and msg.media  then
            delete_msg(msg.id, ok_cb, true)
            end
    if redis:get(ali) and not is_momod(msg) and msg.media and msg.media.type == 'photo' then
            delete_msg(msg.id, ok_cb, true)
            end
    if redis:get(oscar) and not is_momod(msg) and msg.media and msg.media.type == 'audio' then
            delete_msg(msg.id, ok_cb, true)
            end
    if redis:get(bot) and not is_momod(msg) and msg.media and msg.media.type == 'video' then
            delete_msg(msg.id, ok_cb, true)
            end

    if redis:get(oscarteam) and not is_momod(msg) and msg.media and msg.media.type == 'unsupported' then
            delete_msg(msg.id, ok_cb, true)
            end

    if redis:get(oscarbot) and not is_momod(msg) and msg.media and msg.media.type == 'document' then
            delete_msg(msg.id, ok_cb, true)
        end
        return msg  --By @iq_plus and @oscarbotv2
    end

local function oscar(msg, matches)
    chat_id =  msg.to.id
    if matches[1] == 'd m' then
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return "تم ✅ كتم الوسائط 📟 "

  elseif is_momod(msg) and matches[1] == 'b m' then
      local hash = 'mate:'..msg.to.id
      redis:del(hash)
      return "تم✔️الغاء كتم الوسائط 📟 "

  elseif is_momod(msg) and matches[1] == 'd photo' then
      local ali = 'mate:'..msg.to.id
      redis:set(ali, true)
      return 

  elseif is_momod(msg) and matches[1] == "b photo" then
      local ali = 'mate:'..msg.to.id
      redis:del(ali)
      return 

  elseif is_momod(msg) and matches[1] == "d audio" then
      local oscar = 'mate:'..msg.to.id
      redis:set(oscar, true)
      return 

  elseif is_momod(msg) and matches[1] == "b audio" then
      local oscar = 'mate:'..msg.to.id
      redis:del(oscar)
      return 

  elseif is_momod(msg) and matches[1] == "d video" then
      local bot = 'mate:'..msg.to.id
      redis:set(bot, true)
      return ""

  elseif is_momod(msg) and matches[1] == "b video" then
      local bot = 'mate:'..msg.to.id
      redis:del(bot)
      return 

  elseif is_momod(msg) and matches[1] == "d sticker" then
      local oscarteam = 'mate:'..msg.to.id
      redis:set(oscarteam, true)
      return "تم منع الملصقات"

      -- by @iq_plus
  elseif is_momod(msg) and matches[1] == "b sticker" then
      local oscarteam = 'mate:'..msg.to.id
      redis:del(oscarteam)
      return 


  elseif is_momod(msg) and matches[1] == "d file" then
      local oscarbot = 'mate:'..msg.to.id
      redis:set(oscarbot, true)
      return 


  elseif is_momod(msg) and matches[1] == "b file" then
      local oscarbot = 'mate:'..msg.to.id
      redis:del(oscarbot)
      return 

end

end

return {
    patterns = {
        '^[!/#](d m)$',
        '^[!/#](b m)$',
        '^[!/#](d photo)$',
        '^[!/#](b photo)$',
        '^[!/#](d audio)$',
        '^[!/#](b audio)$',
        '^[!/#](d video)$',
        '^[!/#](b video)$',
        '^[!/#](d sticker)$',
        '^[!/#](b sticker)$',
        '^[!/#](d file)$',
        '^[!/#](b file)$'
    },
    run = oscar,
    pre_process = pre_process
}
end
