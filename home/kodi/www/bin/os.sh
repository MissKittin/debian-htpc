#!/bin/sh
. ./lib/sh/os.rc

case $1 in
	version)
		debvr
	;;
	codename)
		codename
	;;
	issue)
		issue
	;;
esac

exit 0
