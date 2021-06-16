sudo mount --uuid C01EB39D1EB38AC4 /storage
nitrogen --restore
xcompmgr &
xrdb .Xresources &
unclutter --timeout 3 &
xset r rate 250 70
dunst &
slstatus &
exec dwm 
sleep 5 && polybar example &
