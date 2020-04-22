#! /bin/zsh 

# load in my environment
source ${HOME}/.zshenv
#xmodmap ${HOME}/.xmodmap
setxkbmap -option ctrl:nocaps

echo "Fran's exwm xsession run!"

### exwm
# Set themes, etc.
compton &
xsettingsd &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/mate-notification-daemon/mate-notification-daemon &
# Set fallback cursor.
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate.
#xset r rate 200 60

# start-up

/opt/google/musicmanager/google-musicmanager&

# mintupdate-launcher &
package-update-indicator &
nm-applet &

# panel
panel |lemonbar  -B '#2f2f2f' -F '#dcdccc' -g 1920 -f "Monospace-10" &

# background
~/.fehbg &

emacs --daemon -f exwm-enable
exec dbus-launch --exit-with-session emacsclient -c
### exwm ends

# fire emacs daemon
#emacs --daemon

## window manager
#gnome-session-cinnamon #--session=classic-gnome #ubuntu
#cinnamon-session

# kill emacs daemon
#emacsclient -e '(kill-emacs)'

