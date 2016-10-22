
do 

local function pre_process(msg) 
local jalal = msg['id'] 
  local user = msg.from.id 
local chat = msg.to.id 
    local oscar = 'mate:'..msg.to.id 
    if redis:get(oscar) and not is_sudo(msg) and msg.media then 
    delete_msg(msg.id, ok_cb, false) 
 send_large_msg(get_receiver(msg), "ممنوع  🔒مشاركة الصور - الروابط - الاعلانات \n المواقع هنا التزم بقوانين 🔰  المجموعة  \n\n#User @"..msg.from.username)
reply_msg(jalal, test, ok_cb, true) 

end 

        return msg 
    end 

local function run(msg, matches) 
local jalal = msg['id'] 

    if matches[1] == 'تحذير الميديا'  and is_momod(msg) then 
                    local oscar = 'mate:'..msg.to.id 
                    redis:set(oscar, true) 
                    local oscar1 = 'تم ✅ قفل الميديا مع التحذير 🔒' 
reply_msg(jalal, oscar1, ok_cb, true) 
elseif matches[1] == 'تحذير الميديا' and not is_momod(msg) then 
local asdy = 'للمشرفين فقط🔴' 
reply_msg(jalal, asdy, ok_cb, true) 

    elseif matches[1] == 'الغاء تحذير الميديا'  and is_momod(msg) then 
      local oscar = 'mate:'..msg.to.id 
      redis:del(oscar) 
    local don = 'تم ✅ الغاء قفل الميديا مع التحذير 🔓' 
reply_msg(jalal, don, ok_cb, true) 
elseif matches[1] == 'الغاء تحذير الميديا' and not is_momod(msg) then 
local jalal_aldon = 'للمشرفين فقط🔴' 
reply_msg(jalal, jalal_aldon, ok_cb, true) 
end 
end 

return { 
    patterns = { 
    "^[!/#](تحذير الميديا)$", 
    "^[!/#](الغاء تحذير الميديا)$" 
    }, 
run = run, 
    pre_process = pre_process 
} 

end 
