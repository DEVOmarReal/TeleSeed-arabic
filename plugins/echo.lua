do
local function run(msg, matches)
if matches[1] == 'echo' or matches[1] == 'كرر' then
return '<b>'..matches[2]..'</b>'
end
end
return {
  patterns = {
    "^[/!#](echo) (.+)$",
    "^[/!#](كرر) (.+)$"
  }, 
  run = run 
}
end
