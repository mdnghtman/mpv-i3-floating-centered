local utils = require 'mp.utils'

local pid = utils.getpid()

function on_next_center()
   mpv_windowid = io.popen("xdotool search --pid " .. pid):read("*all*")
   if mpv_windowid ~= ""  then
      floating = io.popen("xprop -id " .. mpv_windowid):read()
      if string.match(floating, "FLOATING") then
         os.execute("i3-msg -q '[id=" .. mpv_windowid  .. "]' move position center")
      end
   end
end

mp.register_event("playback-restart", on_next_center)
mp.observe_property("fullscreen", "bool", on_next_center)
