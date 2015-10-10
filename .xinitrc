exec urxvtd &
exec xrandr --output HDMI-0 --auto --rotate normal --pos 0x0 --output DP-2 --auto --rotate left --right-of HDMI-0 --output DP-0 --auto --rotate left --right-of DP-2 --output DVI-I-1 --auto --rotate normal --right-of DP-0 &
xset +fp /usr/share/fonts/local
xset fp rehash
export GDK_CORE_DEVICE_EVENTS=1

# WMII
#exec /home/lidstah/bin/wmii_status.sh &
#exec wmii

# I3
# exec i3

# wingo

#exec xsetroot -cursor_name left_ptr &
#exec wingo_status.sh &
#exec wingo_stats.sh &
#exec wingo_dzen.sh &
#exec wingo

#cwm
#exec conky -c ~/conkyrc &
#exec cwm

#StumpWM

xmodmap -e "clear mod4"
xmodmap -e "keycode 133 = F20"
exec /home/lidstah/bin/wmii_status.sh &
exec /home/lidstah/src/stumpwm/stumpwm

# bspwm

#sxhkd &
#exec bspwm

# NOTION
#exec notion

# RATPOISON STABLE & DEV
#exec ratpoison
#exec /home/lidstah/src/ratpoison/src/ratpoison

# DWM
#exec /home/lidstah/src/dwm-sprinkles/dwm

#Xmonad
#exec /usr/bin/xmonad

#Plan9lol
#exec rio
