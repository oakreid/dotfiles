xrdb -merge ~/.Xresources
xset s off  # turns off X11 screensaver
xset -dpms  # turns off X11 energy saver
xset s noblank
xhost local:docker  # allow docker user to access X11 socket
# ~/.fehbg &
# sudo /usr/bin/VBoxClient --clipboard  # share clipboard with VM host
export $(dbus-launch)
gnome-keyring-daemon -s -c secrets
dbus-update-activation-environment --systemd DISPLAY
exec i3
