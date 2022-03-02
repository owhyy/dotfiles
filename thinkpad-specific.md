# ThinkPad-specific configuration
Although most things work out of the box, there are still some things that don't perform as they should:

## Trackpoint
I use the `xf86-input-libinput` package for configuring the touchpad and trackpoint. Scrolling works here by default.

`/etc/X11/xorg.conf.d/40-libinput.conf`

```
Section "InputClass"
    Identifier "libinput keyboard catchall"
Driver "libinput"
    MatchIsKeyboard "on"
EndSection

Section "InputClass"
    Identifier "libinput pointer catchall"
Driver "libinput"
    MatchIsPointer "on"
    Option "AccelProfile" "flat"
    Option "AccelSpeed" "1"
EndSection

Section "InputClass"
    Identifier "libinput touchpad catchall"
    Driver "libinput"
        MatchIsTouchpad "on"
    Option "ClickMethod" "clickfinger"
    Option "NaturalScrolling" "on"
    Option "Tapping" "off"
    Option "SendEventsMode" "disabled"
EndSection
```
I only use the trackpoint, so I disable the touchpad it. If you want to use it, change the option `SendEventsMode` to `"enabled"`

`/etc/udev/rules.d/10-trackpoint.rules`

```
ACTION=="add", SUBSYSTEM=="input", ATTR{name}=="TPPS/2 IBM TrackPoint", ATTR{device/drift_time}="30"
```

This fixes a known bug - the trackpoint moving by itslef. Keep in mind this does not completely eliminate it, but it reduces it to a negligible amount.

Sometimes when writing, pressing the keys near the trackpoint (g, h or b) will cause it to move. It is quite annoying, because if the cursor reaches another dwm pane, it's going to shift the focus to it. To prevent this, you can comment the line `[EnterNotify]=EnterNotify` in `dwm.c` - which will disable mouse focus shift at all. Alternatively, you can just use a mouse. I keep it commented in my dwm build.

## Keyboard
In my dwm build, the fn keys are bound to do what they're supposed to. Take a look at them and copy them in your setup, if you wish. Keep in mind you're going to need the packages `pamixer`, `pactl` and `xorg-xbacklight` for them to actually work, and you also `#include <X11/XF86keysym.h>` in dwm's `config.h` before defining the keys. As I don't use other fn keys, I only defined the volume and brightness ones, but if you need more, check out Luke Smith's dwm config.

### Key LEDs
Keyboard backlight works out of the box for me.
The sound mute (F1) and FnLk LED work without any additional configuration. However, the microphone mute one doesn't. I tried a lot of stuff, and what worked for me was changing the `GRUB_CMDLINE_LINUX_DEFAULT` option in `/etc/default/grub` to `"quiet splash"` as described in the accepted answer here https://askubuntu.com/questions/138217/lenovo-mute-led-button-not-working.

## TLP
I use the config found here. Running it made me go from ~7.2W (with 2 terminal windows and a chromium tab) to ~6.6W; I know, not much, but it also sets battery thresholds, which supposedly increase battery time.
