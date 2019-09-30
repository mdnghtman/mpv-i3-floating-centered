require 'os'
require 'io'
utils = require("mp.utils")

function on_next_center()
  mpv_windowid = io.popen("xdotool search --pid " .. utils.getpid()):read("*all*")
  floating = io.popen("xprop -id " .. mpv_windowid):read()
  if string.match(floating, "FLOATING") then
    os.execute("i3-msg -q '[id=" .. mpv_windowid  .. "]' move position center")
  end
end
mp.register_event("playback-restart", on_next_center)
