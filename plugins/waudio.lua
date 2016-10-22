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
local omar = msg['id'] 
    local omar1 = 'warn:'..msg.to.id 
    if redis:get(omar1) and msg.media and msg.media.type== "audio" and not is_momod(msg) then 
            delete_msg(msg.id, ok_cb, true) 
             send_large_msg(get_receiver(msg), "#تنبيه ممنوع 🔒 ارسال الصوتيات داخل المجموعة 👥🔒 \n\n #User : @"..msg.from.username) 
reply_msg(omar, dea, ok_cb, true) 
        end 

        return msg 
    end 

local function run(msg, matches) 
local omar = msg['id'] 
    chat_id =  msg.to.id 
    if matches[1] == 'تحذير' and matches[2] == "الصوتيات" and is_momod(msg) then 
                    local omar1 = 'warn:'..msg.to.id 
                    redis:set(omar1, true) 
                    local dd = 'تم ✅ تفعيل قفل الصوتيات مع التحذير 🔒'
reply_msg(omar, dd, ok_cb, true) 
elseif matches[1] == 'تحذير' and matches[2] == 'الصوتيات' and not is_momod(msg) then 
local real = 'للمشرفين فقط عزيزي👿' 
reply_msg(omar, real, ok_cb, true) 

    elseif matches[1] == 'الغاء تحذير' and matches[2] == 'الصوتيات' and is_momod(msg) then 
      local omar1 = 'warn:'..msg.to.id 
      redis:del(omar1) 
    local gg = 'تم ✅ الغاء تفعيل قفل الصوتيات مع التحذير 🔓 ' 
reply_msg(omar, gg, ok_cb, true) 
elseif matches[1] == 'الغاء تحذير' and matches[2] == 'الصوتيات' and not is_momod(msg) then 
local real = 'للمشرفين فقط عزيزي 👿'
reply_msg(omar, real, ok_cb, true) 
end 
end 

return { 
    patterns = { 
        '^[!/#](تحذير) (.*)$', 
       '^[!/#](الغاء تحذير) (.*)$' 
    }, 
    run = run, 
    pre_process = pre_process 
} 

end 