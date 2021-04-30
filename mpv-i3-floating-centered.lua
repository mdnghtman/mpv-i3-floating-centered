local utils = require 'mp.utils'

local pid = utils.getpid()

function center_floating_mpv()
   mpv_windowid = io.popen("xdotool search --pid " .. pid):read()
   if mpv_windowid ~= ""  then
      floating = io.popen("xprop -id " .. mpv_windowid):read()
      if string.match(floating, "FLOATING") then
         os.execute("i3-msg -q '[id=" .. mpv_windowid  .. "]' move position center")
      end
   end
end

mp.register_event("playback-restart", center_floating_mpv)
mp.observe_property("fullscreen", "bool", center_floating_mpv)
