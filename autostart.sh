#!/bin/zsh

HOSTNAME=$(/bin/hostname)

case $HOSTNAME in
kookaburra)
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
    echo 220 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity
#    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Edge Scrolling" 1 1 0
#    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Edges" 0 0 0 4582
#    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" 300 300
    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Scrolling" 1 1
    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Jumpy Cursor Threshold" 250
    xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Palm Detection" 1
    xrandr --dpi 131 &
    synclient TouchpadOff=1 &
    ;;
magpie)
    xrandr --dpi 96 &
    numlockx on &
    ;;
raven)
    xrandr --dpi 94 &
    numlockx on &
    ;;
esac

urxvtd -q -f -o && urxvtc -pe tabbedex &
redshift-gtk &
hsetroot -full ~/.local/wallpapers/wall.jpg &
xbindkeys &
setxkbmap vok &
devmon -g -s --exec-on-drive "notify-send mounted %l" &
nm-applet &
xautolock -time 15 -locker slock &
