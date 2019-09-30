# mpv-i3-floating-centered
mpv-i3-floating-centered is a script for mpv written in lua.  
Its purpose is to center a floating mpv window in i3wm.

To achieve this it will:

* Get the window id of the mpv process.
* Check if it's in floating mode
* Tell i3-msg to center the window by its windowid.

