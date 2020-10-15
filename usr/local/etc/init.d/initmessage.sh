#! /bin/sh
#
# initmessage        Init colorful message
#
# description: Init message

### BEGIN INIT INFO
# Provides:          initmessage
# Required-Start:
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: display init colorful message
### END INIT INFO

. /lib/lsb/init-functions

RED='\033[0;31m'
BRED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
SEABLUE='\033[1;36m'
NORMAL='\033[1;37m'
WHITE='\033[1;29m'
NOCOLOR='\033[0m'


do_start() {
	# Send to kernel messages
		echo -n "init: `uname` `uname -r` started `date +'%d %m %Y @ %H:%M'` :-)" > /dev/kmsg 2>&1
	# Clear console
		clear
	# i
		echo -n "$BLUE i"
	# System and version
		echo -n "$BRED `uname`" && echo -n "$PURPLE `uname -r`" && echo -n "$GREEN started"
	# Start date and time
		echo -n "$SEABLUE `date +'%d.%m.%Y @ %H:%M'`"
	# Smile
		echo -n "$YELLOW :-)"
	# Normalize
		#echo "$NORMAL"
		echo "$NOCOLOR"
}

case "$1" in
    start)
	do_start
        ;;
    restart|reload|force-reload)
        echo "Error: argument '$1' not supported" >&2
        exit 3
        ;;
    stop)
        ;;
    *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac
