do 
local function run(msg, matches) 
    local r = get_receiver(msg) 
    local welc = 'oo:'..msg.to.id 
    local bay = 'zz:'..msg.to.id 
    local xxxx = redis:get(welc) 
    local zzzz = redis:get(bay) 
    if is_momod(msg) and matches[1]== 'ضع الترحيب' then 
        redis:set(welc, matches[2]) 
        local text = 'تم ✅ وضع الترحيب في المجموعة 👥👋🏿'..'\n\n'..matches[2] 
        return reply_msg(msg.id, text, ok_cb, false) 
    elseif redis:get(welc) and   is_momod(msg) and  matches[1]== 'ازالة الترحيب' then 
        redis:del(welc) 
        local text = 'تم ✅ حذف الترحيب في المجموعة 👥👋🏿' 
        return reply_msg(msg.id, text, ok_cb, false) 
         elseif not redis:get(welc) and is_momod(msg) and matches[1]== 'ازالة الترحيب' then 
        local text = 'الترحيب ✋🏿 محذوف سابقا 👥✔️' 
        return reply_msg(msg.id, text, ok_cb, false) 
    elseif redis:get(welc) and is_momod(msg) and matches[1]== 'الترحيب' then 
        return  reply_msg(msg.id, xxxx, ok_cb, true) 
    elseif not redis:get(welc) and is_momod(msg) and matches[1]== 'الترحيب' then 
        return 'قم بأضافة 🔶 ترحيب اولا 👥🔕 ' 
    end 
    if is_momod(msg) and   matches[1]== 'ضع التوديع' then 
        redis:set(bay, matches[2]) 
      local text = 'تم ✅ وضع التوديع في المجموعة 👥👋🏿'..'\n\n'..matches[2] 
        return reply_msg(msg.id, text, ok_cb, false) 
    elseif redis:get(bay) and is_momod(msg) and matches[1]== 'ازالة التوديع' then 
        redis:del(bay) 
        local text = 'تم ✅ حذف التوديع في المجموعة 👥👋🏿' 
        return reply_msg(msg.id, text, ok_cb, false) 
         elseif not redis:get(bay) and is_momod(msg) and matches[1]== 'ازالة التوديع' then 
        local text = ' التوديع ✋🏿 محذوف سابقا 👥✔️' 
        return reply_msg(msg.id, text, ok_cb, false) 
    elseif redis:get(bay) and is_momod(msg) and matches[1]== 'التوديع' then 
        return  reply_msg(msg.id, zzzz, ok_cb, true) 
         elseif not redis:get(bay) and is_momod(msg) and matches[1]== 'التوديع' then 
        return 'قم بأضافة 🔶 توديع اولا 👥🔕' 
    end 
    if redis:get(bay) and matches[1]== 'chat_del_user' then 
         return  reply_msg(msg.id, zzzz, ok_cb, true) 
     elseif redis:get(welc) and matches[1]== 'chat_add_user' then 
        local xxxx = ""..redis:get(welc).."\n" 
..''..(msg.action.user.print_name or '')..'\n' 
          reply_msg(msg.id, xxxx, ok_cb, true) 
          elseif redis:get(welc) and matches[1]== 'chat_add_user_link' then 
        local xxxx = ""..redis:get(welc).."\n" 
..'@'..(msg.from.username or '')..'\n' 
          reply_msg(msg.id, xxxx, ok_cb, true) 
    end 
end 
return { 
  patterns = { 
       "^[!/#](ضع الترحيب) (.*)$", 
       "^[!/#](ضع التوديع) (.*)$", 
       "^[!/#](ازالة الترحيب)$", 
       "^[!/#](ازالة التوديع)$", 
       "^[!/#](الترحيب)$", 
       "^[!/#](التوديع)$", 
       "^!!tgservice (chat_add_user)$", 
       "^!!tgservice (chat_add_user_link)$", 
       "^!!tgservice (chat_del_user)$" 
  }, 
  run = run, 
} 

end 
