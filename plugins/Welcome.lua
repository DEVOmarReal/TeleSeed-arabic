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

   local from_username = 'link (@' .. (msg.action.link_issuer.username or '') .. ')'
   local chat_name = msg.to.print_name
   local chat_id = msg.to.id
   pattern = template_add_user(pattern, to_username, from_username, chat_name, chat_id)
   if pattern ~= '' then
      local receiver = get_receiver(msg)
      send_msg(receiver, pattern, ok_cb, false)
   end
end

function chat_new_user(msg)
   local pattern = add_user_cfg.initial_chat_msg
   local to_username = msg.action.user.username
   local from_username = msg.from.username
   local chat_name = msg.to.print_name
   local chat_id = msg.to.id
   pattern = template_add_user(pattern, to_username, from_username, chat_name, chat_id)
   if pattern ~= '' then
      local receiver = get_receiver(msg)
      send_msg(receiver, pattern, ok_cb, false)
   end
end

local function description_rules(msg, nama)
   local data = load_data(_config.moderation.data)
   if data[tostring(msg.to.id)] then
      local about = ""
      local rules = ""
      if data[tostring(msg.to.id)]["description"] then
         about = data[tostring(msg.to.id)]["description"]
         about = "\nAbout :\n"..about.."\n"
      end
      if data[tostring(msg.to.id)]["rules"] then
         rules = data[tostring(msg.to.id)]["rules"]
         rules = "\nRules :\n"..rules.."\n"
      end
      local sambutan = "HI🍷🌝 "..nama.."\nWelcome to '"..string.gsub(msg.to.print_name, "_", " ").."'\nYou can use /help for see bot commands\n"
      local text = sambutan.."and You can see /rules 🙏🏿      "
      local text = text..""
      local text = text.."                                               "
      local text = text.."Out of the group /kickme ☹️"
      local receiver = get_receiver(msg)
      send_large_msg(receiver, text, ok_cb, false)
   end
end

local function run(msg, matches)
   if not msg.service then
      return "Are you trying to troll me?"
   end
   --vardump(msg)
   if matches[1] == "chat_add_user" then
      if not msg.action.user.username then
          nama = string.gsub(msg.action.user.print_name, "_", " ")
      else 
          nama = "@"..msg.action.user.username
      end
      chat_new_user(msg)
      description_rules(msg, nama)
   elseif matches[1] == "chat_add_user_link" then
      if not msg.from.username then
          nama = string.gsub(msg.from.print_name, "_", " ")
      else
          nama = "@"..msg.from.username
      end
      chat_new_user_link(msg)
      description_rules(msg, nama)
   elseif matches[1] == "chat_del_user" then
       local bye_name = msg.action.user.first_name
       return 'Good Bye My Friend '..bye_name
   end
end

return {
   description = "Welcoming Message",
   usage = "send message to new member",
   patterns = {
      "^!!tgservice (chat_add_user)$",
      "^!!tgservice (chat_add_user_link)$",
      "^!!tgservice (chat_del_user)$",
   },
   run = run
}

-- Dev by @Omar_Real
