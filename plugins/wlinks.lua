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
local rash = 'teamreal:'..msg.to.id
local link = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Oo][Rr][Gg]") or msg.text:match("[Gg][Oo][Oo]%.[Gg][Li]/") or msg.text:match("[Aa][Dd][Ff]%.[Ll][Yy]/") or msg.text:match("[Bb][Ii][Tt]%.[Ll][Yy]") or msg.text:match("[Cc][Ff]%.[Ll][Yy]/") or msg.text:match("[Bb][Vv]%.[Vv][Cc]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]")
local bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=") or msg.text:match("?[Ss][Tt][Oo][Pp]=")
            if link and redis:get(rash) and not bot then
            delete_msg(msg.id, ok_cb, true)
            send_large_msg(get_receiver(msg), "ممنوع  🔒مشاركة الصور - الروابط - الاعلانات \n المواقع هنا التزم بقوانين 🔰  المجموعة  \n\n #User @"..msg.from.username)
        end 

        return msg 
    end 

local function omar(msg, matches) 
local omar = msg['id'] 
    chat_id =  msg.to.id 
    if matches[1] == 'تحذير' and matches[2] == "الروابط" and is_momod(msg) then 
                    local rash = 'teamreal:'..msg.to.id 
                    redis:set(rash, true) 
                    local real = '  تم ✅ قفل الروابط مع التحذير 🔒' 
reply_msg(omar, real, ok_cb, true) 
elseif matches[1] == 'تحذير' and matches[2] == 'الروابط' and not is_momod(msg) then 
local real = 'للمشرفين فقط' 
reply_msg(omar, real, ok_cb, true) 

    elseif matches[1] == 'الغاء تحذير' and matches[2] == 'الروابط' and is_momod(msg) then 
      local rash = 'teamreal:'..msg.to.id 
      redis:del(rash) 
    local real = 'تم ✅ الغاء قفل الروابط مع التحذير 🔓' 
reply_msg(omar, real, ok_cb, true) 
elseif matches[1] == 'الغاء تحذير الروابط' and matches[2] == 'الروابط' and not is_momod(msg) then 
local omar = 'للمشرفين فقط' 
reply_msg(omar, real, ok_cb, true) 
end 
end 

return { 
    patterns = { 
        '^[!/#](تحذير) (.*)$', 
        '^[!/#](الغاء تحذير) (.*)$' 
    }, 
    run = omar, 
    pre_process = pre_process 
} 

end