# DEFAULT X STARTUP COMMANDS

# Kodi
setxkbmap `cat $HOME/.local/etc/xkbmap`
vnc &
exec kodi -fs --standalone

# For debug
#exec xterm