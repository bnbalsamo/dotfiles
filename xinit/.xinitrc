thunar --daemon &
redshift -l 40:-88 -t 6500:5000 -m vidmode &
nm-applet &
xrdb -merge $HOME/.Xresources &
exec /usr/bin/awesome
