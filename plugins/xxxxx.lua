--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀ 
▀▄ ▄▀ ▀▄ ▄▀ 
▀▄ 
#CODS CREATED BT @iq_plus 
please join to Channel Oscar Team @OSCARBOTv2 

▀▄ ▄▀ ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀ 
--]]


do 
local function oscar(extra, success, result) -- function result 
local oscar_id = result.from.peer_id 
local r = extra.r 
if result.from then 
if result.from.username then 
username = result.from.username 
else 
username = "nil" 
end --@iq_plus
end 
local msg = result 
local reply = msg['id'] 
local a = "تعال منيوج افتح حلكك" 
reply_msg(reply, a, ok_cb, true) 
end 
local function run(msg, matches) 
local r = get_receiver(msg) 
local e = msg['id'] 
local f = "خادم" 
-- by oscarteam 
if is_momod(msg) and matches[1] == "وكلة عير" and msg.reply_id then 
msgr = get_message(msg.reply_id, oscar, {r=r, }) 
reply_msg(e, f, ok_cb, true) 
end 
end 
return { 
patterns = { 
"^(وكلة عير)$", 
}, 
run = run, 
} 

end 

--By OscarTeam 👾