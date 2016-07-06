-- Made By @Omar_Real

do
local function pre_process(msg)

    local fwd = 'mate:'..msg.to.id
    if redis:get(fwd) and not is_momod(msg) and msg.fwd_from then
            delete_msg(msg.id, ok_cb, true)
             send_large_msg(get_receiver(msg), '#تنبيه 🔷⚠️ ممنوع عمل اعادة التوجيه 🔕 داخل المجموعة 👥✔️\n#User @'..msg.from.username)
            return "ok"
end
        return msg
    end
    
 local function zeoone(msg, matches)
     chat_id = msg.to.id
local reply_id = msg['id']
     if is_momod(msg) and matches[1]== 'close' and matches[2]== 'fwd' then
         local fwd = 'mate:'..msg.to.id
         redis:set(fwd, true)
         local omar = "تم ✅ تفعيل تنبيه وقفل اعادة التوجيه 🔷✔️"
         return reply_msg(reply_id, omar, ok_cb, false)
         end
local reply_id = msg['id']
    if not is_momod(msg) and matches[1]== 'close' and matches[2]== 'fw' then
    local omar = "للمشرفين فقط😎🖕🏿"
 return reply_msg(reply_id, omar, ok_cb, false)
end
local reply_id = msg['id']
if is_momod(msg) and matches[1]== 'open' and matches[2]== 'fwd' then
    local fwd = 'mate:'..msg.to.id
    redis:del(fwd)
    local omar = "تم ✅ الغاء تفعيل وقفل تنبيه اعادة التوجيه 🔷✔️"
    return reply_msg(reply_id, omar, ok_cb, false)
end

local reply_id = msg['id']
if not is_momod(msg) and matches[1]== 'open' and matches[2]== 'fwd' then
local omar = "للمشرفين فقط😎🖕🏿"
 return reply_msg(reply_id, omar, ok_cb, false)
 end

end
return {
    patterns ={
        '^/(open) (fwd)$',
        '^/(close) (fwd)$'
    },
run = OMAR,
pre_process = pre_process 
}
end
