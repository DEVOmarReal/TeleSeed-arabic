--[[
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀     Update BY :                      ▀▄ ▄▀ 
▀▄ ▄▀     BY OmarReal (Omar_Real)          ▀▄ ▄▀ 
▀▄ ▄▀     BY ALI ALNWAB (LAUESDEVD)        ▀▄ ▄▀   
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]

do 

local function pre_process(msg) 
local omar = msg['id'] 
    local real = 'mate:'..msg.to.id 
    if redis:get(real) and msg.fwd_from and not is_momod(msg) then 
            delete_msg(msg.id, ok_cb, true) 
           send_large_msg(get_receiver(msg), '#تنبيه ممنوع ❗ عمل اعادة التوجيه 🔒👥 \n\n#User @'..msg.from.username)
reply_msg(omar, omar, ok_cb, true) 
        end 

        return msg 
    end 

local function run(msg, matches) 
local omar = msg['id'] 
    chat_id =  msg.to.id 
    if matches[1] == 'تحذير' and matches[2] == "اعادة التوجيه" and is_momod(msg) then 
                    local real = 'mate:'..msg.to.id 
                    redis:set(real, true) 
                    local real = 'تم ✅ قفل اعادة التوجيه مع التحذير 🔒'
reply_msg(omar, real, ok_cb, true) 
elseif matches[1] == 'تحذير' and matches[2] == 'اعادة التوجيه' and not is_momod(msg) then 
local real = 'للمشرفين فقط' 
reply_msg(omar, real, ok_cb, true) 

    elseif matches[1] == 'الغاء تحذير' and matches[2] == 'اعادة التوجيه' and is_momod(msg) then 
      local real = 'mate:'..msg.to.id 
      redis:del(real) 
    local real = 'تم ✅ الغاء قفل اعادة التوجيه مع التحذير 🔓 '
reply_msg(omar, real, ok_cb, true) 
elseif matches[1] == 'الغاء تحذير' and matches[2] == 'اعادة التوجيه' and not is_momod(msg) then 
local real = 'للمشرفين فقط 👿'
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
