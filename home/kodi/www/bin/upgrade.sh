#!/bin/sh
[ ! "`echo $0 | grep backup`" = "" ] && . ./lib/sh/backup.rc || . ./lib/sh/upgrade.rc

case $1 in
	info)
		info
	;;
	do)
		upgrade
	;;
esac

exit 0
