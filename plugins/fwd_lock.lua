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

    local fwd = 'mate:'..msg.to.id
    if redis:get(fwd) and not is_momod(msg) and msg.fwd_from then
            delete_msg(msg.id, ok_cb, true)
             send_large_msg(get_receiver(msg), '')
            return "ok"
end
        return msg
    end
    
 local function omar(msg, matches)
     chat_id = msg.to.id
local reply_id = msg['id']
     if is_momod(msg) and matches[1]== 'اقفل' and matches[2]== 'اعادة التوجيه' then
         local fwd = 'mate:'..msg.to.id
         redis:set(fwd, true)
         local text = "تم ✅ تفعيل تنبيه وقفل اعادة التوجيه 🔷✔️"
         return reply_msg(reply_id, text, ok_cb, false)
         end
local reply_id = msg['id']
    if not is_momod(msg) and matches[1]== 'اقفل' and matches[2]== 'اعادة التوجيه' then
    local text = "للمشرفين فقط😎🖕🏿"
 return reply_msg(reply_id, text, ok_cb, false)
end
local reply_id = msg['id']
if is_momod(msg) and matches[1]== 'افتح' and matches[2]== 'اعادة التوجيه' then
    local fwd = 'mate:'..msg.to.id
    redis:del(fwd)
    local text = "تم ✅ الغاء تفعيل وقفل تنبيه اعادة التوجيه 🔷✔️"
    return reply_msg(reply_id, text, ok_cb, false)
end

local reply_id = msg['id']
if not is_momod(msg) and matches[1]== 'افتح' and matches[2]== 'اعادة التوجيه' then
local text = "للمشرفين فقط😎🖕🏿"
 return reply_msg(reply_id, text, ok_cb, false)
 end

end
return {
    patterns ={
        '^/(افتح) (اعادة التوجيه)$',
        '^/(اقفل) (اعادة التوجيه)$'
    },
run = omar,
pre_process = pre_process 
}
end