exec urxvtd &
exec xrandr --output VGA-0 --auto --rotate normal --pos 0x0 --output HDMI-0 --auto --rotate left --right-of VGA-0 --output DVI-D-0 --auto --rotate normal --right-of HDMI-0 &
xset +fp /usr/share/fonts/local
xset fp rehash

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

exec /home/lidstah/bin/wmii_status.sh &
exec /home/lidstah/src/stumpwm/stumpwm

# bspwm

#sxhkd &
#exec bspwm

# NOTION
#exec notion

# STUMPWM
#exec /home/lidstah/bin/stumpconk.sh &
#exec /usr/local/bin/stumpwm

# RATPOISON STABLE & DEV
#exec ratpoison
#exec /home/lidstah/src/ratpoison/src/ratpoison

# DWM
#exec /home/lidstah/src/dwm-sprinkles/dwm

#Xmonad
#exec /usr/bin/xmonad

#Plan9lol
#exec rio
