--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    Update BY :                       ▀▄ ▄▀ 
▀▄ ▄▀     BY OmarReal (Omar_Real)          ▀▄ ▄▀ 
▀▄ ▄▀     BY ALI ALNWAB (LAUESDEVD)        ▀▄ ▄▀   
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]


do
local function pre_process(msg)
    local hash = 'mate:'..msg.to.id
    local ali = 'mate:'..msg.to.id
    local oscar = 'mate:'..msg.to.id
    local bot = 'mate:'..msg.to.id
    local oscarteam = 'mate:'..msg.to.id
    local oscarbot = 'mate:'..msg.to.id
    if redis:get(hash) and not is_momod(msg) and msg.media  then
            delete_msg(msg.id, ok_cb, true)
                 send_large_msg(get_receiver(msg), '')
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
    if matches[1] == 'اقفل الميديا' then
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    local omar = "تم ✅ كتم الوسائط 📟 "
                    return reply_msg(msg.id, omar, ok_cb, false)

  elseif is_momod(msg) and matches[1] == 'افتح الميديا' then
      local hash = 'mate:'..msg.to.id
      redis:del(hash)
      local omar = "تم✔️الغاء كتم الوسائط 📟 "
      return reply_msg(msg.id, omar, ok_cb, false)

  elseif is_momod(msg) and matches[1] == 'd photo' then
      local ali = 'mate:'..msg.to.id
      redis:set(ali, true)
      return  'done'

  elseif is_momod(msg) and matches[1] == "b photo" then
      local ali = 'mate:'..msg.to.id
      redis:del(ali)
      return  'done'

  elseif is_momod(msg) and matches[1] == "d audio" then
      local oscar = 'mate:'..msg.to.id
      redis:set(oscar, true)
      return  'done'

  elseif is_momod(msg) and matches[1] == "b audio" then
      local oscar = 'mate:'..msg.to.id
      redis:del(oscar)
      return  'done'

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
      return 'done'

      -- by @iq_plus
  elseif is_momod(msg) and matches[1] == "b sticker" then
      local oscarteam = 'mate:'..msg.to.id
      redis:del(oscarteam)
      return 'done'


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
        '^[!/#](اقفل الميديا)$',
        '^[!/#](افتح الميديا)$',
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
