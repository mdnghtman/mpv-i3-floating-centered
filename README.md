# mpv-i3-floating-centered
**mpv-i3-floating-centered** is a script for mpv written in Lua. Its purpose is to center a floating mpv window in the i3 window manager.

To achieve this it will:

* Get the window id of the mpv process.
* Check if it's in floating mode
* Tell i3-msg to center the window by its window id.

# Dependencies
* xdotool
* xprop

Install via your systems package manager.

# Install
Place the file `mpv-i3-floating-centered.lua` in your `~/.config/mpv/scripts/` directory, creating it if needed, and that's it. Run mpv as you normally would and you're now using it. 

# Recommended settings
Though the Lua script is all you need, combining it with two more settings is pretty great.

You can use the **autofit** setting in `~/.config/mpv/mpv.conf` to enforce a window size. For example on a 27in 2560x1440 display enforcing a size of 1920x1080 works well:

```
autofit=1920x1080
```

It doesn't modify aspect ratio, only increasing or decreasing the window size within the specified bounds. To use the entire display just toggle fullscreen. This option can also be specified by a percentage, read more about it from the mpv manual: https://mpv.io/manual/stable/

Lastly, in your i3 config file: `~/.config/i3/config` enable floating mpv windows by default:

```
for_window [class="mpv"] floating enable
```

Save and reload i3 with **$mod+Shift+r**
