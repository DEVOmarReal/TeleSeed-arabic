-- ملف سايكو
-- arabic by @Omar_Real
local function saeco(msg,matches)
if matches[1] == "اضافة ملاحضة" then
local saeco = "الملاحضة"..msg.from.id
redis:set(saeco, matches[2])
local fuck = "🚶🏻مرحبا "..msg.from.first_name.."\n".."\n".."📝ملاحضتك تم حفضها ✅"
return reply_msg(msg.id, fuck, ok_cb, false)
end

if matches[1] == "ازالة الملاحضة" then
local saeco = "الملاحضة"..msg.from.id
redis:del(saeco)
local fuck2 = "🚶🏻مرحبا "..msg.from.first_name.."\n".."\n".."📝ملاحضتك تم ازالتها  🗑"
return reply_msg(msg.id, fuck2, ok_cb, false)
end

if matches[1] == "الملاحضة" then
local saeco = "الملاحضة"..msg.from.id
local iraq = "🚶🏻مرحبا "..msg.from.first_name.."\n".."\n".."📝 ملاحضتك هية :".."\n".."\n"..redis:get(saeco).."\n".."\n".."⏳ وقت كتابة الملاحضة "..os.date("%X", msg.date).."\n"
return reply_msg(msg.id, iraq, ok_cb, false)
end
end
return {
    patterns = {
        "^[/#](اضافة ملاحضة) (.*)$",
        "^[/#](ازالة الملاحضة)$",
        "^[#/](الملاحضة)$"
    },
    run = saeco
}