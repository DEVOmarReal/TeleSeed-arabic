do

local function pre_process(msg)


local hash = 'mate:'..msg.to.id
if redis:get(hash) and msg.reply_id and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg) then
delete_msg(msg.id, ok_cb, true)
return "done"
end

return msg
end




local function run(msg, matches)
chat_id = msg.to.id
local reply_id = msg ['id']
if is_momod(msg) and matches[1] == 'close' then


local hash = 'mate:'..msg.to.id
redis:set(hash, true)
local text = "تم ✅ قفل الرد على الرسائل 🔒📩"..'\n\n'
           ..'🔶 MSG BY @'..msg.from.username..'\n'
           reply_msg(reply_id, text, ok_cb, false)
           local reply_id = msg ['id']
elseif is_momod(msg) and matches[1] == 'open' then
local hash = 'mate:'..msg.to.id
redis:del(hash)
local text = "تم ✅ السماح بل رد على الرسائل 🔓📩"..'\n\n'
           ..'🔶 MSG BY @'..msg.from.username..'\n'
           reply_msg(reply_id, text, ok_cb, false)
end

end

return {
patterns = {
'^[/!#](close) reply$',
'^[/!#](open) reply$'
},
run = run,
pre_process = pre_process
}
end