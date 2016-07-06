do

function run(msg, matches)
    local reply_id = msg ['id']
       if not is_momod(msg) then
        local omar = "للمدرأء فقط ❌💠"..'\n\n'
           ..'🔶 MSG BY @'..msg.from.username..'\n'
           reply_msg(reply_id, omar, ok_cb, false)
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
           local omar = "قم 🔱 بأنشاء رابط 🔗 اولا ✅ من خلال الامر (relink) 🔷"..'\n\n'
           ..'🔶 MSG BY @'..msg.from.username..'\n'
        return reply_msg(reply_id, omar, ok_cb, false)
       end
         local text = "رابط المجموعة 🔧👥 :\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           local omar = "تم ✅ ارسال الرابط الى الخاص ♻👤"..'\n\n'
           ..'🔶 MSG BY @'..msg.from.username..'\n'
           reply_msg(reply_id, omar, ok_cb, false)
end

return {
  patterns = {
    "^[/#!]([Ll]ink)$"
  },
  run = run
}

end