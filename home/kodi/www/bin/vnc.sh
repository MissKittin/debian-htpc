#!/bin/sh

if [ "`ps -A | grep x11vnc`" = "" ]; then
	echo -n "nie działa"
else
	echo -n "działa"
fi

exit 0
