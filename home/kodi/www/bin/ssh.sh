#!/bin/sh
. ./lib/sh/library.rc

if [ "`ps -A | grep sshd`" = "" ]; then
	echo -n "nie działa"
else
	echo -n "działa na porcie "`cat /etc/ssh/sshd_config | grep 'Port' | grep -v '#' | sed -e 's/Port/ /g' | xargs | $NO_NEWLINE`
fi

exit 0
